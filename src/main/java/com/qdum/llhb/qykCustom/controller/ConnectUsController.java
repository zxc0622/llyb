package com.qdum.llhb.qykCustom.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 联系我们
 */
@ControllerBind(controllerKey = "/Library/connectUs",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ConnectUsController extends Controller {

	private User user;
	private Long companyId;
	
	/**
	 * 进入团队实力子页面
	 */
	public void intoConnectUsSubPage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		companyId = getParaToLong("companyId");
		if(companyId == null){
			user = UserUtils.getUser();
			companyId = user.getLong("companyId");
		}
		String sql = "SELECT * FROM sys_company WHERE id=? AND del_flag=0";
		Record companyInfo = Db.findFirst(sql,companyId);
		setAttr("companyInfo", companyInfo);
		render("connectUsSubpage.jsp");
	}
	
	@Before(CustomControllerInterceptor.class)
	public void saveConnectUs(){
		
		user = UserUtils.getUser();
		companyId = user.getLong("companyId");
		
		String companyName = getPara("companyName");
		String companyAddress = getPara("companyAddress");
		String companyContact = getPara("companyContact");
		String companyTel = getPara("companyTel");
		String companyFax = getPara("companyFax");
		
		String companyUrl = getPara("companyUrl");
		String companyCode = getPara("companyCode");
		
		String sql = "UPDATE sys_company SET company_name=?,address=?,contact=?,tel=?,fax=?,company_url=?,postal_code=? WHERE id=? AND del_flag=0";
		int result = Db.update(sql,companyName,companyAddress,companyContact,companyTel,companyFax,companyUrl,companyCode,companyId);
		if(result > 0){
			renderText("ok");
		}
	}
}
