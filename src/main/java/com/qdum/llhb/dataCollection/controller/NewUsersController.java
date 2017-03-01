package com.qdum.llhb.dataCollection.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.sys.model.User;

import java.text.SimpleDateFormat;

/**
 *类NewUsersController的功能描述:新注册用户列表,默认显示当前月的注册用户
 *@author yaoyt
 *@time 15/12/29 上午11:04
 */ 
@ControllerBind(controllerKey="/dataCollection/newUsers")
public class NewUsersController extends Controller {

	public void index(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startTime = sdf.format(DateUtils.getMonthFirstDay());
		String endTime = sdf.format(DateUtils.getMonthLastDay());
		int pageSize = 8;
		String temp = getPara("pageSize");
		if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
			pageSize = Integer.parseInt(temp);
		}
		Page<Record> page = User.dao.getNewUsers(getParaToInt(0,1), pageSize, startTime, endTime, "", "","");
		setAttr("page",page);
		setAttr("startTime", startTime);
		setAttr("endTime", endTime);
		render("/WEB-INF/views/dataCollection/user/newUserList.jsp");
	}

	public void query(){
		String account = getPara("account");
		String name = getPara("name");
		String type = getPara("type");
		String startTime = getPara("startTime");
		String endTime = getPara("endTime");
		int pageSize = 8;
		String temp = getPara("pageSize");
		if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
			pageSize = Integer.parseInt(temp);
		}
		Page<Record> page = User.dao.getNewUsers(getParaToInt(0,1), pageSize,startTime,endTime,account,name,type);
		setAttr("page",page);
		setAttr("account", account);
		setAttr("name", name);
		setAttr("type", type);
		setAttr("startTime", startTime);
		setAttr("endTime", endTime);
		render("/WEB-INF/views/dataCollection/user/newUserList.jsp");
	}
	
	
}
