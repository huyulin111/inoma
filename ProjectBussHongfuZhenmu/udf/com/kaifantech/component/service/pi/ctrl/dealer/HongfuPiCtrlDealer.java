package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppSet;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.component.service.taskexe.detail.info.ITaskexeDetailInfoService;
import com.kaifantech.util.agv.msg.PiCommand;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.log.AppFileLogger;

@Component
public class HongfuPiCtrlDealer implements IPiCtrlDealer {
	@Autowired
	private HongfuPiDealer piDealer;

	@Autowired
	private ITaskexeDetailInfoService taskexeDetailService;

	@Autowired
	private HongfuPiInfoService piInfoService;

	public PiCommand check2Agvs(IotClientBean agvOne, IotClientBean agvAnother) throws Exception {
		PiCommand command = new PiCommand();
		HongfuTaskexeBean one = piInfoService.get(agvOne.getId()), another = piInfoService.get(agvAnother.getId());
		if (AppTool.isAnyNull(one, another)) {
			command.s(agvOne, agvAnother);
			AppFileLogger.piLogs("AT LEAST ONE TASK IS NULL!");
			return command;
		}
		if (AppTool.or(TaskexeOpFlag.NEW.equals(one.getOpflag()), TaskexeOpFlag.NEW.equals(another.getOpflag()))) {
			command.s(agvOne, agvAnother);
			AppFileLogger.piLogs("AT LEAST ONE TASK IS NEW!");
			return command;
		}

		List<TaskexeDetailBean> taskexeDetailListOne = taskexeDetailService.find(one),
				taskexeDetailListAnother = taskexeDetailService.find(another);
		if (AppTool.isAnyNull(taskexeDetailListOne, taskexeDetailListAnother)) {
			return null;
		}
		command = piDealer.check2Agvs(one, another);
		if (!AppTool.isNull(command)) {
			AppFileLogger.setPiTips(0, "TRAFFIC：", "GO：", AppSet.join(",", command.getSafes()), ";", "MGR：",
					AppSet.join(",", command.getDangers()));
			AppFileLogger.setPiTips(0, "ADDED INFO：", command.getInfo());
		}
		return command;
	}

}
