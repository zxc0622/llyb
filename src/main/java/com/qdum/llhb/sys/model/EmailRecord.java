/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qdum.llhb.sys.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

import java.util.Date;
import java.util.List;

/**
 *类EmailRecord的功能描述:邮件发送记录实体类
 *@author yaoyt
 *@time 16/3/22 下午5:05
 */ 
public class EmailRecord extends Model<EmailRecord> {
	private static final long serialVersionUID = 1L;
	public static EmailRecord dao = new EmailRecord();
	
	public static final String ID 			= "id";		   	// 编号
	public static final String TO_USER      = "to_user"; 	// 发送人
	public static final String SUBJECT      = "subject";	// 主题
	public static final String CONTENT      = "content";	   	// 内容
	public static final String SEND_TIME    = "send_time";	   	// 发送时间
	public static final String SEND_BACK    = "send_back";	   	// 返回值
	public static final String STA          = "sta";   	//发送状态

	
	public Long getId() {
		return getLong(ID);
	}

	public void setId(Long id) {
		set(ID,id);
	}
	
	public Long getToUser() {
		return get(TO_USER);
	}

	public void setToUser(String toUser) {
		set(TO_USER,toUser);
	}

	public String getSubject() {
		return get(SUBJECT);
	}

	public void setSubject(String subject) {
		set(SUBJECT,subject);
	}
	
	public String getContent() {
		return get(CONTENT);
	}

	public void setContent(String Content) {
		set(CONTENT,Content);
	}

    public Date getSendTime() {
        return getDate(SEND_TIME);
    }

    public void setSendTime(Date sendTime ) {
        set(SEND_TIME,sendTime);
    }

	public String getSendBack() {
		return get(SEND_BACK);
	}

	public void setSendBack(String sendBack) {
		set(SEND_BACK,sendBack);
	}

	public String getSta() {
		return get(STA);
	}
	
	public void setSta(String sta) {
		set(STA,sta);
	}

}