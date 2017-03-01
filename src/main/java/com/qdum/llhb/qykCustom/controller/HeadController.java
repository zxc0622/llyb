package com.qdum.llhb.qykCustom.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyHead;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 自定义头部
 */
@ControllerBind(controllerKey = "/Library/head",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class HeadController extends Controller {
	private CompanyZl company;
	private SysCompanyCustom customMsg;
	private SysCompanyHead sysCompanyHead;
	private User user;
	private Long companyId;

	/**
	 * 更新头部信息
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void updateHeadMsg(){
		String summary=getPara("summary");
		String companyName=getPara("companyName");
		String imgUrl=getPara("imgUrl");
		boolean result=false;
		companyId=getAttr("companyId");
		
		
		company = CompanyZl.dao.findById(companyId);
		company.set("major", summary);
		company.set("company_name", companyName);
		result=company.update();
		if(result){
			customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), 1);
			int customId=customMsg.getInt("id");
			sysCompanyHead = SysCompanyHead.dao.getHeadMsg(customId);
			if(sysCompanyHead==null){
				SysCompanyHead sh = new SysCompanyHead();
				sh.set("img", imgUrl);
				sh.set("custom_id", customId);
				result=sh.save();
			}else{
				sysCompanyHead.set("img", imgUrl);
				result=sysCompanyHead.update();
			}
			if(result){
				renderJson("true");
				return;
			}
		}
		renderJson("false");
	}
}
