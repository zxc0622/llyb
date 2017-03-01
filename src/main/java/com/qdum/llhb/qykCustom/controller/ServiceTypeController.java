package com.qdum.llhb.qykCustom.controller;


import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomServiceCase;
import com.qdum.llhb.qykCustom.service.ServiceTypeService;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 服务类型模块自定义
 */
@ControllerBind(controllerKey = "/Library/serviceType",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ServiceTypeController  extends Controller{

	private User user;
	private Long companyId;
	
	//根据服务类型id获取图片和介绍
	public void getTypeInfoByTypeId(){
		companyId = getParaToLong(0);
		String userId = "";
		if(companyId == null){
			if(userId == null || userId == ""){
				user = UserUtils.getUser();
				userId = user.getId().toString();
			}
		}else{
			//根据企业id查询用户id
			String comSql = "SELECT * FROM sys_company WHERE id=? AND del_flag=0";
			Record companyInfo = Db.findFirst(comSql,companyId);
			userId = companyInfo.get("user_id").toString();
		}
		String typeId =  getPara("serviceTypeId");
		List<Record> caseList = SysCompanyCustomServiceCase.dao.getCaseByTypeID(Long.parseLong(userId), typeId);
		JSONArray json;
		if(caseList.size() > 0){
			Record caseRec = caseList.get(0);
			json = JSONArray.fromObject(caseRec);
			json.getJSONObject(0).put("sta", "ok");
			renderJson(json);
		}else{
			json = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("sta", "fail");
			json.add(jo);
			renderJson(json);
		};
	}
	
	//更新服务类型
	@Before(ChangeUserMsgInterceptor.class)
	public void upadateServiceType(){
		String items = getPara("typeids");
		user = getAttr("user");
		
		ServiceTypeService sts = new ServiceTypeService();
		boolean flag = sts.upadateServiceType(items,getAttr("companyId"));
		JSONArray json;
		if(flag){
			String[] its = items.split(",");
			List<Record> caseList = SysCompanyCustomServiceCase.dao.getCaseByTypeID(user.getId(), its[0]);
			if(!(caseList.isEmpty())){
				Record caseRec = caseList.get(0);
				json = JSONArray.fromObject(caseRec);
				json.getJSONObject(0).put("sta", "ok");
				json.getJSONObject(0).put("msgSta", "ok");
				renderJson(json);
			}
			json = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("sta", "ok");
			jo.put("msgSta", "empty");
			json.add(jo);
			renderJson(json);
			
		}else{
			json = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("sta", "fail");
			json.add(jo);
			renderJson(json);
		}
	}
}
