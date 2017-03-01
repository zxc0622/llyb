package com.qdum.llhb.ws.vo;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

/**
 * 返回的ajax内部类
 * @author zhangwn
 */
public class AjaxBeanTime {
	private List<Record> longTime;
	
	private List<Record> shortTime;

	public List<Record> getLongTime() {
		return longTime;
	}

	public void setLongTime(List<Record> longTime) {
		this.longTime = longTime;
	}

	public List<Record> getShortTime() {
		return shortTime;
	}

	public void setShortTime(List<Record> shortTime) {
		this.shortTime = shortTime;
	}
	

}
