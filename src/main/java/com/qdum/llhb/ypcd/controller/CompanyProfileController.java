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
@ControllerBind(controllerKey = "/ypcd/profile")
@Before(AdminInterceptor.class)
public class CompanyProfileController extends  Controller{

	/**
	 * 公司概况
	 */
	public void companyProfile(){
		User user = UserUtils.getUser();
		List<CompanyZl> list = CompanyZl.dao.findCompany(user.getId());
		if(!(list.isEmpty())){
			setAttr("Profile", list.get(0));
		}
		render("CompanyProfile.jsp");
	}
	/**
	 * 认证信息
	 */
	public void authentication(){
		User user = UserUtils.getUser();
		List<Record> list = CompanyZl.dao.findCompanys(user.getId());
		if(!(list.isEmpty())){
			setAttr("company", list.get(0));
		}
		render("Authentication.jsp");
	}
}
