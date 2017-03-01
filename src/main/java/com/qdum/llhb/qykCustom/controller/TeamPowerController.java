package com.qdum.llhb.qykCustom.controller;

import java.util.ArrayList;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyTeam;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 团队实力
 */
@ControllerBind(controllerKey = "/Library/teamPower",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class TeamPowerController extends Controller {

	private User user;
	private Long companyId;
	SysCompanyTeam teamMsg;
	
	/**
	 * 进入团队实力子页面
	 */
	public void intoTeamPowerSubPage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		companyId=getAttr("companyId");
		teamMsg=SysCompanyTeam.dao.getTeamMsgByCompanyId(companyId);
		String artisanPicStr;
		ArrayList<JSONObject> artisanPicList = null;
		if(teamMsg==null){
			
		}else{
			artisanPicStr=teamMsg.getStr("artisan_pic");
			if(!StringUtils.isBlank(artisanPicStr)){
				artisanPicList=artisanPicStr2List(artisanPicStr);
			}
		}
		
		setAttr("teamMsg", teamMsg);
		setAttr("artisanPicList", artisanPicList);
		render("teamPowerSubpage.jsp");
	}
	
	//更新团队信息
	public void updateTeamMsg(){
		companyId=getAttr("companyId");
		JSONObject teamMsg = JSONObject.fromObject(getPara("teamMsg"));
		int status = SysCompanyTeam.dao.updateMsg(teamMsg, companyId);
		if(status==1){
			renderJson("true");
		}else{
			renderJson("false");
		};
	}
	
	//sys_company_team 表 artisan_pic 字段转json集合
	private ArrayList<JSONObject> artisanPicStr2List(String artisanPicStr){
		JSONArray jsa=JSONArray.fromObject(artisanPicStr);
		Object key;
		JSONObject artisanPicJso;
		ArrayList<JSONObject> artisanPicList=new ArrayList<JSONObject>();
		for (Object object : jsa) {
			artisanPicJso=JSONObject.fromObject(object);
			artisanPicList.add(artisanPicJso);
		}
		return artisanPicList;
	}
}
