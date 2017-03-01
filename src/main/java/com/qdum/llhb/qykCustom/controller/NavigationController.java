package com.qdum.llhb.qykCustom.controller;

import org.json.JSONObject;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomNavigation;
import com.qdum.llhb.sys.model.User;

/**
 * 自定义导航栏
 */
@ControllerBind(controllerKey = "/Library/navigation",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class NavigationController extends Controller {
	
	private User user;
	private Long companyId;
	
	/**
	 * 更新导航栏信息
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void updateNavigation() {
		companyId=getAttr("companyId");
		String[] itemArray = getPara("items").replace("itemid", "")
				.split(";");
		String color = getPara("color");
		JSONObject jso;
		int length = itemArray.length;
		for (int i = 0; i < length; i++) {
			jso = new JSONObject(itemArray[i]);
			jso.put("seq", i + 1);
			SysCompanyCustomNavigation.dao.updateById(jso);
		}
		SysCompanyCustom customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), 2);
		SysCompanyCustom.dao.updateCommonById(customMsg.getInt("id"), color);
		renderJson(true);
	}
}
