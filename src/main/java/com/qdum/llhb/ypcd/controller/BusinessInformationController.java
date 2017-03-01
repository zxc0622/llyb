package com.qdum.llhb.ypcd.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
@ControllerBind(controllerKey = "/ypcd/business")
@Before(AdminInterceptor.class)
public class BusinessInformationController extends Controller{

	public void businessInformation(){
		 User user = UserUtils.getUser();
		String fileName =getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getRequest().getContextPath()+"/b-"+user.getLoginName()+"/";
		setAttr("name", fileName);
		List<Record> list =CompanyZl.dao.findCompanyR(user.getId());
		if(!(list.isEmpty())){
			setAttr("enterprise",list.get(0));
		}
		
		render("BusinessInformation.jsp");
	}
}
