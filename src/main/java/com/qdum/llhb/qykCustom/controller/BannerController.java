package com.qdum.llhb.qykCustom.controller;


import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyBanner;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.sys.model.User;

import net.sf.json.JSONObject;

/**
 * 自定义banner
 */
@ControllerBind(controllerKey = "/Library/banner",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class BannerController extends Controller {
	
	private String[] bannerMsg;
	private User user;
	private Long companyId;

	//更新banner信息
	@Before(ChangeUserMsgInterceptor.class)
	public void updateBannerMsg(){
		companyId=getAttr("companyId");
		String bannerMsgStr=getPara("bannerMsg").replace(":\"id", ":\"");
		System.out.println("============="+bannerMsgStr+"==============");
		SysCompanyCustom customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), 3);
		int customId=customMsg.getInt("id");
		
		bannerMsg = bannerMsgStr.split(";");
		int length = bannerMsg.length;
		JSONObject jso;
		for (int i=0;i<length;i++) {
			jso=JSONObject.fromObject(bannerMsg[i]);
			if("undefined".equalsIgnoreCase(jso.getString("id"))){
				if(!"delete".equals(jso.getString("url"))){
					SysCompanyBanner scb = new SysCompanyBanner();
					scb.set("img_url", jso.getString("url"));
					scb.set("img_link", jso.getString("link"));
					scb.set("custom_id", customId);
					scb.save();
				}
			}else if("delete".equalsIgnoreCase(jso.getString("url"))){
				SysCompanyBanner.dao.deleteById(jso.getString("id"));
			}else{
				SysCompanyBanner.dao.updateBanner(jso);
			}
		}
		renderJson("true");
	}
	
}
