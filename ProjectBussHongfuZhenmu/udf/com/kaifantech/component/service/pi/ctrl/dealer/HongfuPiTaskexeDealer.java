package com.kaifantech.component.service.pi.ctrl.dealer;

import java.util.Collections;

import org.springframework.stereotype.Component;

import com.calculatedfun.util.AppTool;
import com.kaifantech.bean.taskexe.HongfuTaskexeBean;
import com.kaifantech.init.sys.params.SystemConfParameters;
import com.kaifantech.util.agv.msg.PiCommandId;

@Component
public class HongfuPiTaskexeDealer {
	private static String CURRENT = "CURRENT";
	private static String NEXT = "NEXT";

	public PiCommandId check2Agvs(HongfuTaskexeBean a, HongfuTaskexeBean b) {
		PiCommandId piCommandId = new PiCommandId();

		double maxOne = Math.max(Collections.max(a.nextYaxisList), a.currentYaxis);
		double minOne = Math.min(Collections.min(a.nextYaxisList), a.currentYaxis);
		double maxAnother = Math.max(Collections.max(b.nextYaxisList), b.currentYaxis);
		double minAnother = Math.min(Collections.min(b.nextYaxisList), b.currentYaxis);

		if (maxOne < minAnother - SystemConfParameters.detaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(a).s(b);
		}
		if (maxAnother < minOne - SystemConfParameters.detaJudgeSite()) {
			piCommandId.setPiInfo("路径计算无重叠！");
			return piCommandId.s(a).s(b);
		}
		int i = 1;
		if (b.currentYaxis < a.currentYaxis) {
			i = -1;
		}
		double currentA = i * a.currentYaxis, currentB = i * b.currentYaxis;
		double nextA = i * a.nextYaxis, nextB = i * b.nextYaxis;
		if (AppTool.inOrder(currentA, currentB, nextA, nextB)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, b, CURRENT, a, NEXT, b, NEXT));
			}
		} else if (AppTool.inOrder(currentA, currentB, nextB, nextA)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, b, CURRENT, b, NEXT, a, NEXT));
			}
		} else if (AppTool.inOrder(currentA, nextA, currentB, nextB)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, a, NEXT, b, CURRENT, b, NEXT));
			}
			return piCommandId.s(a).s(b).setPiInfo(model(a, CURRENT, a, NEXT, b, CURRENT, b, NEXT));
		} else if (AppTool.inOrder(currentA, nextA, nextB, currentB)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, a, NEXT, b, NEXT, b, CURRENT));
			}
			return piCommandId.s(a).s(b).setPiInfo(model(a, CURRENT, a, NEXT, b, NEXT, b, CURRENT));
		} else if (AppTool.inOrder(currentA, nextB, currentB, nextA)) {
			if (nextB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, b, NEXT, b, CURRENT, a, NEXT));
			}
			return piCommandId.s(a).s(b).setPiInfo(model(a, CURRENT, b, NEXT, b, CURRENT, a, NEXT));
		} else if (AppTool.inOrder(currentA, nextB, nextA, currentB)) {//
			if (nextB - currentA <= SystemConfParameters.distanceWaiting()
					|| currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				if (nextA - currentA <= currentB - nextB) {
					return piCommandId.s(a).d(b).setPiInfo(model(a, CURRENT, b, NEXT, a, NEXT, b, CURRENT));
				} else if (nextA - currentA > currentB - nextB) {
					return piCommandId.d(a).s(b).setPiInfo(model(a, CURRENT, b, NEXT, a, NEXT, b, CURRENT));
				}
			}
			return piCommandId.s(a).s(b).setPiInfo(model(a, CURRENT, b, NEXT, a, NEXT, b, CURRENT));
		}

		if (AppTool.inOrder(nextA, currentA, currentB, nextB)) {// √
			return piCommandId.s(a).s(b).setPiInfo(model(a, NEXT, a, CURRENT, b, CURRENT, b, NEXT));
		} else if (AppTool.inOrder(nextA, currentA, nextB, currentB)) {
			if (nextB - currentA <= SystemConfParameters.distanceWaiting()
					|| currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				if (nextA - currentA <= currentB - nextB) {
					return piCommandId.s(a).d(b).setPiInfo(model(a, NEXT, a, CURRENT, b, NEXT, b, CURRENT));
				} else if (nextA - currentA > currentB - nextB) {
					return piCommandId.d(a).s(b).setPiInfo(model(a, NEXT, a, CURRENT, b, NEXT, b, CURRENT));
				}
			}
			return piCommandId.s(a).s(b).setPiInfo(model(a, NEXT, a, CURRENT, b, NEXT, b, CURRENT));
		} else if (AppTool.inOrder(nextA, nextB, currentA, currentB)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.d(a).s(b).setPiInfo(model(a, NEXT, b, NEXT, a, CURRENT, b, CURRENT));
			}
			return piCommandId.s(a).d(b).setPiInfo(model(a, NEXT, b, NEXT, a, CURRENT, b, CURRENT));
		} else if (AppTool.inOrder(nextB, currentA, currentB, nextA)) {// TODO
			return piCommandId.d(a).d(b).setPiInfo(model(b, NEXT, a, CURRENT, b, CURRENT, a, NEXT));
		} else if (AppTool.inOrder(nextB, currentA, nextA, currentB)) {
			if (currentB - nextA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.s(a).d(b).setPiInfo(model(b, NEXT, a, CURRENT, a, NEXT, b, CURRENT));
			}
			return piCommandId.s(a).d(b).setPiInfo(model(b, NEXT, a, CURRENT, a, NEXT, b, CURRENT));
		} else if (AppTool.inOrder(nextB, nextA, currentA, currentB)) {
			if (currentB - currentA <= SystemConfParameters.distanceWaiting()) {
				return piCommandId.s(a).d(b).setPiInfo(model(b, NEXT, a, NEXT, a, CURRENT, b, CURRENT));
			}
		}

		return null;
	}

	private String model(Object... objs) {
		StringBuffer sb = new StringBuffer();
		for (Object obj : objs) {
			if (obj instanceof HongfuTaskexeBean) {
				sb.append(((HongfuTaskexeBean) obj).getAgvId());
			} else {
				sb.append(obj + "___");
			}
		}
		return sb.toString();
	}
}
