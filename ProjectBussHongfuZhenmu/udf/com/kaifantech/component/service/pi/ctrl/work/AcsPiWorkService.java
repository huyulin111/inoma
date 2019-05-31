package com.kaifantech.component.service.pi.ctrl.work;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.info.agv.AgvBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.AgvStatusBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.dao.agv.info.AgvInfoDao;
import com.kaifantech.component.service.agv.road.VerticalRoad;
import com.kaifantech.component.service.agv.road.VerticalRoadService;
import com.kaifantech.component.service.pi.ctrl.PIAllCtrlService;
import com.kaifantech.component.service.pi.ctrl.ctrl2agv.bymsg.PICtrlClashAreaService;
import com.kaifantech.component.service.status.agv.AgvStatusService;
import com.kaifantech.component.service.taskexe.add.ITaskexeAddService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.init.sys.qualifier.HongfuSystemQualifier;
import com.kaifantech.util.agv.msg.PiCommandMsg;
import com.kaifantech.util.constant.pi.detail.CLASH_AREA_INFO;
import com.kaifantech.util.constant.pi.detail.ClashArea;
import com.kaifantech.util.constant.taskexe.ctrl.AgvMoveStatus;

@Service(HongfuSystemQualifier.PI_WORK_SERVICE)
public class AcsPiWorkService implements IPiWorkService {

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_INFO_DAO)
	private AgvInfoDao agvInfoDao;

	@Autowired
	private AgvStatusService agvStatusService;

	@Autowired
	private PIAllCtrlService piCtrlService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_TASKEXE_ADD_SERVICE)
	private ITaskexeAddService taskexeService;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	@Autowired
	private VerticalRoadService verticalRoadService;

	@Autowired
	private PICtrlClashAreaService piCtrlClashAreaService;

	private List<Integer> toStop = new ArrayList<Integer>();
	private List<Integer> toWarning = new ArrayList<Integer>();
	private List<Integer> toContinue = new ArrayList<Integer>();

	public void doControl() {
		List<AgvBean> agvs = agvInfoDao.getList();
		List<TaskexeBean> notOverTaskexes = taskexeInfoService.getNotOverOneFBean(agvs);
		boolean isNeedToImporveClashArea = false;
		ClashArea clashArea = new ClashArea(CLASH_AREA_INFO.CLASH_AREA_1);
		for (TaskexeBean taskexeBean : notOverTaskexes) {
			VerticalRoad road = verticalRoadService.getRoadOfAlloc(taskexeBean);
			int distanceToRightAxisOfArea = road.getXaxis() - CLASH_AREA_INFO.CLASH_AREA_1.getRightXaxis();
			int distanceToLeftAxisOfArea = CLASH_AREA_INFO.CLASH_AREA_1.getLeftXaxis() - road.getXaxis();
			if (distanceToRightAxisOfArea > 0
					&& distanceToRightAxisOfArea < CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA) {
				isNeedToImporveClashArea = true;
				clashArea.addRightXaxis(
						Math.min(CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA, distanceToRightAxisOfArea + 1000));
			} else if (distanceToLeftAxisOfArea > 0
					&& distanceToLeftAxisOfArea < CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA) {
				isNeedToImporveClashArea = true;
				clashArea.addLeftXaxis(
						Math.min(CLASH_AREA_INFO.DISTANCE_SAFE_TO_CLASH_AREA, -distanceToLeftAxisOfArea - 1000));
			}
		}
		if (!isNeedToImporveClashArea) {
			clashArea = new ClashArea(CLASH_AREA_INFO.CLASH_AREA_1);
		}
		piCtrlClashAreaService.setClashArea(clashArea);

		for (int i = 0; i < agvs.size(); i++) {
			AgvBean agvBeanOne = agvs.get(i);
			for (int j = i + 1; j < agvs.size(); j++) {
				AgvBean agvBeanAnother = agvs.get(j);
				control2Agvs(agvBeanOne, agvBeanAnother);
			}
		}
	}

	public void control2Agvs(AgvBean agvBeanOne, AgvBean agvBeanAnother) {
		if (agvBeanOne.getEnvironment() != agvBeanAnother.getEnvironment()) {
			return;
		}
		PiCommandMsg command = piCtrlService.check2Agvs(agvBeanOne, agvBeanAnother);
		if (AppTool.isNull(command)) {
			return;
		}
		List<HongfuAgvMsgBean> dangerMsgs = command.getDangerMsgs();
		List<HongfuAgvMsgBean> safeMsgs = command.getSafeMsgs();
		for (HongfuAgvMsgBean msg : dangerMsgs) {
			addToStop(msg.getAGVId());
		}
		for (HongfuAgvMsgBean msg : safeMsgs) {
			if (!dangerMsgs.contains(msg)) {
				addToContinue(msg.getAGVId());
			}
		}
	}

	public void doneControl() {
		for (Integer agvId : toStop) {
			if (AgvMoveStatus.CONTINUE.equals(agvInfoDao.getMoveStatus(agvId))) {
				agvStatusService.addStatus(new AgvStatusBean(AgvMoveStatus.PAUSE_SYS, agvId, 1));
			}
		}

		for (Integer agvId : toContinue) {
			if (!toWarning.contains(agvId) && !toStop.contains(agvId)) {
				if (AgvMoveStatus.PAUSE_SYS.equals(agvInfoDao.getMoveStatus(agvId))) {
					agvStatusService.addStatus(new AgvStatusBean(AgvMoveStatus.CONTINUE, agvId, 1));
				}
			}
		}

		if (toStop.size() == 0 && toWarning.size() == 0 && toContinue.size() == 0) {
			for (AgvBean agvBean : agvInfoDao.getList()) {
				if (AgvMoveStatus.PAUSE_SYS.equals(agvInfoDao.getMoveStatus(agvBean.getId()))) {
					agvStatusService.addStatus(new AgvStatusBean(AgvMoveStatus.CONTINUE, agvBean.getId(), 1));
				}
			}
		}

		toStop.clear();
		toWarning.clear();
		toContinue.clear();
	}

	public void addToStop(Integer forkliFtId) {
		if (!toStop.contains(forkliFtId)) {
			toStop.add(forkliFtId);
		}
	}

	public void addToContinue(Integer forkliFtId) {
		if (!toContinue.contains(forkliFtId)) {
			toContinue.add(forkliFtId);
		}
	}

}
