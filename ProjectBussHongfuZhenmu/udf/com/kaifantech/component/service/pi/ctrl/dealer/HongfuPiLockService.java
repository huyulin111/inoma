package com.kaifantech.component.service.pi.ctrl.dealer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.bean.taskexe.TaskexeDetailBean;
import com.kaifantech.cache.manager.AppCache;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.tasksite.info.HongfuTaskSiteInfoService;
import com.kaifantech.init.sys.params.CacheKeys;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.ctrl.AgvLockStatus;

@Component
public class HongfuPiLockService {
	@Autowired
	private HongfuTaskSiteInfoService taskSiteInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	public synchronized void roadLocks(TaskexeBean taskexeBean, HongfuAgvMsgBean agvMsgBean,
			TaskexeDetailBean taskexeDetail) {
		Double siteYaxis = taskSiteInfoService.getBean(taskexeDetail.getSiteid()).getJsonItem("yaxis", Double.class);

		JSONObject onlyLockedInfo = getLockInfo();

		if (AppTool.isNull(onlyLockedInfo)) {
			updateInfo(taskexeBean.getAgvId(), AgvLockStatus.INLOCK, agvMsgBean.getY(), siteYaxis);
			return;
		}

		String thisTargetStatus = null;
		JSONObject thisLockInfo = getLockInfo(taskexeBean.getAgvId());
		thisTargetStatus = thisLockInfo.getString("status");
		/** 以下阐述有锁的情况 */
		if (siteYaxis > onlyLockedInfo.getDoubleValue("start")) {
			thisTargetStatus = AgvLockStatus.SUSPEND;
		}
		if (!AppTool.isNull(thisLockInfo)) {
			updateInfo(taskexeBean.getAgvId(), thisTargetStatus, agvMsgBean.getY(), siteYaxis);
		}
	}

	public JSONObject getLockInfo(Integer agvId) {
		String roadLockInfo = AppCache.worker().get(CacheKeys.ROAD_LOCKS, agvId);
		if (AppTool.isNull(roadLockInfo)) {
			return null;
		}
		JSONObject tmpJsonObj = JSONObject.parseObject(roadLockInfo);
		return tmpJsonObj;
	}

	public JSONObject getLockInfo() {
		for (IotClientBean agv : iotClientService.getAgvCacheList()) {
			JSONObject tmpJsonObj = getLockInfo(agv.getId());
			if (!AppTool.isNull(tmpJsonObj) && AgvLockStatus.INLOCK.equals(tmpJsonObj.getString("status"))) {
				return tmpJsonObj;
			}
		}
		return null;
	}

	private void updateInfo(int agvid, Object status, Object startAxis, Object endAxis) {
		JSONObject roadLockJson = new JSONObject();
		roadLockJson.put("agvid", agvid);
		roadLockJson.put("status", status);
		roadLockJson.put("start", startAxis);
		roadLockJson.put("end", endAxis);
		AppCache.worker().hset(CacheKeys.ROAD_LOCKS, agvid, roadLockJson.toJSONString());
	}
}