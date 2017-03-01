package com.qdum.llhb.qykCustom.controller;


import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.config.ModuleType;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyServiceProvition;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 售后服务模块自定义
 */
@ControllerBind(controllerKey = "/Library/serviceProvition",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ServiceProvitionController  extends Controller{

	private User user;
	private Long companyId;
	
	//保存售后服务
	@Before(ChangeUserMsgInterceptor.class)
	public void saveProvition(){
		user = UserUtils.getUser();
		companyId = user.getLong("companyId");
		String title = getPara("ntTitile");
		String content = getPara("ntContent");

		SysCompanyCustom scc = SysCompanyCustom.dao.getModuleMsg(companyId,	ModuleType.serviceProvition);
		SysCompanyServiceProvition proMsg = SysCompanyServiceProvition.dao.getProvMsg(scc.getInt("id"));
		if(proMsg != null){
			proMsg.set("title", title);
			proMsg.set("content", content);
			proMsg.update();
		}else{
			proMsg = new SysCompanyServiceProvition();
			proMsg.set("custom_id", scc.getInt("id"));
			proMsg.set("title", title);
			proMsg.set("content", content);
			proMsg.save();
		}
		System.out.println("================================="+content+"=================================");
		renderText("ok");
		
	}
	
	
	//=========================以下为售后保障子页面代码============================
	public void intoServiceProvitionSubpage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		companyId = getParaToLong("companyId");
		if(companyId == null){
			user = UserUtils.getUser();
			companyId =user.get("companyId");
		}
		SysCompanyCustom moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 11);
		SysCompanyServiceProvition  provMsg = SysCompanyServiceProvition.dao.getProvMsg(moduleMsg.getInt("id"));
		setAttr("provMsg", provMsg);
		render("serviceProvitionSubpage.jsp");
	}
	
}
