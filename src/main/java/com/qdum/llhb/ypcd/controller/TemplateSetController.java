package com.qdum.llhb.ypcd.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Template;

@ControllerBind(controllerKey = "/ypcd/template")
public class TemplateSetController extends Controller{

	/**
	 * 模版设置初始化
	 */
	public void templateSetinit(){
		User user = UserUtils.getUser();
		String colorType=getPara("colorType");
		String price=getPara("price");
		String price1=getPara("price1");
		String sort=getPara("sort");
		setAttr("colorType",colorType);
		setAttr("price",price);
		setAttr("price1",price1);
		setAttr("sort",sort);
		List<Record> list =Template.dao.TemplateFindColor();
		setAttr("colorList", list);
		Page<Record> list1 =Template.dao.templateFind(getParaToInt(0, 1),6,colorType,price,price1,sort,user.getId().toString());
		if(!(list1.equals(""))||!(list1.equals(null))){
			setAttr("template",list1.getList());
			setAttr("recordPage", list1);
		}
	   List<Record> company =CompanyZl.dao.findCompanyR(user.getId());
	   if(!(list.isEmpty())){
			setAttr("enterprise",company.get(0));
		}
		render("TemplateSet.jsp");
	}
	/**
	 * 启用模版
	 */
	public void saveStencil(){
		String startId=getPara("startId");
		User user = UserUtils.getUser();
		String flag="";
		try {
			String sql ="update cs_settings_basic set template_id='"+startId+"' where user_id='"+user.getId()+"'";
			Db.update(sql);
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
}
