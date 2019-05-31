﻿package com.kaifantech.component.service.cmd.task.agv;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kaifantech.bean.iot.client.IotClientBean;
import com.kaifantech.bean.singletask.SingletaskBean;
import com.kaifantech.bean.taskexe.TaskexeBean;
import com.kaifantech.component.comm.cmd.sender.agv.IAgvCmdSender;
import com.kaifantech.component.comm.worker.client.IConnectWorker;
import com.kaifantech.component.dao.taskexe.op.TaskexeOpDao;
import com.kaifantech.component.service.iot.client.IIotClientService;
import com.kaifantech.component.service.msg.info.agv.IAgvMsgInfoModule;
import com.kaifantech.component.service.singletask.info.SingleTaskInfoService;
import com.kaifantech.component.service.taskexe.info.TaskexeInfoService;
import com.kaifantech.component.service.taskexe.module.ITaskexeModule;
import com.kaifantech.init.sys.qualifier.AcsSystemQualifier;
import com.kaifantech.init.sys.qualifier.DefaultSystemQualifier;
import com.kaifantech.util.constant.taskexe.TaskexeOpFlag;
import com.kaifantech.util.socket.netty.client.hongfu.HongfuAgvNettyClient;
import com.kaifantech.util.thread.ThreadTool;

/***
 * 描述任务从用户下达到发送AGV执行前的逻辑
 ***/
@Service(AcsSystemQualifier.AGV_CMD_TASK_MODULE)
public class AcsTaskexeModule implements ITaskexeModule {

	@Autowired
	private IAgvCmdSender agvCmdSender;

	@Autowired
	private TaskexeInfoService taskexeInfoService;

	@Autowired
	private TaskexeOpDao taskexeTaskDao;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_AGV_CLIENT_WORKER)
	private IConnectWorker agvClientMgr;

	@Autowired
	private IAgvMsgInfoModule msgService;

	@Autowired
	private SingleTaskInfoService singleTaskInfoService;

	@Autowired
	@Qualifier(DefaultSystemQualifier.DEFAULT_IOT_CLIENT_SERVICE)
	private IIotClientService iotClientService;

	private Map<Integer, String> lastTask = new HashMap<>();

	public void startControl() {
		for (IotClientBean agvBean : iotClientService.getAgvCacheList()) {
			sendTaskCmd(agvBean.getId());
		}
	}

	private void sendTaskCmd(Integer agvId) {
		TaskexeBean taskexeBean = taskexeInfoService.getNextOne(agvId);
		if (taskexeBean == null) {
			return;
		}
		SingletaskBean singletaskBean = singleTaskInfoService.getSingletask(taskexeBean.getTaskid());
		String cmd = HongfuAgvNettyClient.PREFIX_WHEN_SEND_TASK + singletaskBean.getTaskName();
		lastTask.put(agvId, taskexeBean.getTaskid());
		if (TaskexeOpFlag.NEW.equals(taskexeBean.getOpflag())) {
			if (!msgService.getLatestMsgBean(taskexeBean.getAgvId()).isSendDone(taskexeBean)) {
				agvCmdSender.send(taskexeBean.getAgvId(), cmd);
				ThreadTool.sleep(500);
			}
		}

		if (!TaskexeOpFlag.SEND.equals(taskexeBean.getOpflag())
				&& msgService.getLatestMsgBean(taskexeBean.getAgvId()).isSendDone(taskexeBean)) {
			taskexeTaskDao.sendATask(taskexeBean);
		}
		ThreadTool.sleep(500);

	}

	public Map<Integer, String> getLastTaskCmd() {
		return lastTask;
	}
}