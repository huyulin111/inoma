package com.kaifantech.component.dao.taskexe;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Service;

import com.calculatedfun.util.DateFactory;
import com.kaifantech.bean.msg.agv.HongfuAgvMsgBean;
import com.kaifantech.bean.msg.agv.TaskPathInfoPointBean;
import com.kaifantech.init.sys.dao.AppTables;
import com.kaifantech.init.sys.dao.BaseDao;

@Service
public class TaskPathMemoryDao extends BaseDao {
	public void addAPoint(Integer agvId, String taskid, double x, double y, Long startMoveSecond, Float angle,
			Integer taskStep) {
		jdbcTemplate().execute("insert into " + AppTables.TASK_PATH_MEMORY
				+ " (`uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep ) " + "values(uuid()," + agvId + ",'" + taskid
				+ "','" + x + "','" + y + "'," + angle + "," + (DateFactory.getCurrentUnixTime() - startMoveSecond)
				+ "," + taskStep + ")");
	}

	public void addAPoint(HongfuAgvMsgBean msg, Long startMoveSecond) {
		addAPoint(msg.getAgvId(), msg.getTaskid(), msg.getX(), msg.getY(), startMoveSecond, msg.getAngle(),
				msg.getTaskStep());
	}

	public void clearMemory(Integer agvId, String taskid) {
		jdbcTemplate().execute(
				"delete from " + AppTables.TASK_PATH_MEMORY + "  WHERE agvId=" + agvId + " AND taskid=" + taskid + " ");
	}

	public void transToInfo(Integer agvId, String taskid) {
		jdbcTemplate().execute(
				"insert into " + AppTables.TASK_PATH_INFO + " (`uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep) "
						+ " SELECT `uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep FROM  "
						+ AppTables.TASK_PATH_MEMORY + "  WHERE agvId=" + agvId + " AND taskid=" + taskid + " ");
	}

	public Integer getPointCount(Integer agvId, String taskid) {
		return jdbcTemplate().queryForObject("select count(*) from " + AppTables.TASK_PATH_MEMORY + " where agvId="
				+ agvId + " and taskid=" + taskid, Integer.class);
	}

	public List<TaskPathInfoPointBean> selectPath(Integer agvId, String taskid) {
		return (List<TaskPathInfoPointBean>) jdbcTemplate().query(
				"select `uuid`,agvId,taskid,x,y,angle,secondToStart,taskStep from " + AppTables.TASK_PATH_MEMORY
						+ " where agvId=" + agvId + " and taskid=" + taskid,
				new BeanPropertyRowMapper<TaskPathInfoPointBean>(TaskPathInfoPointBean.class));
	}

}
