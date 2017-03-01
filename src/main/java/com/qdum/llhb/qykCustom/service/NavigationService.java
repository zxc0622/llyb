package com.qdum.llhb.qykCustom.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.core.Controller;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomNavigation;

public class NavigationService extends Module {
	private SysCompanyCustom moduleMsg;
	private List<SysCompanyCustomNavigation> navigationMsg;
	/**
	 * 导航栏菜单项链接地址常量,数组下标与菜单项的id减1（item_id-1）相对应
	 */
	public final static String[] ITEM_LINKS={
		"/llhb/Library/enterpriseCustom",//首页
		"/llhb/Library/summary/intoSummarySubpage",//企业简介
		"/llhb/Library/serviceCase/intoServiceCaseSubpage",//服务案例
		"/llhb/Library/showProd/intoShowProdSubpage",//产品展示
		"/llhb/Library/certificates/intoCertificatesSubpage",//资质展示
		"/llhb/Library/teamPower/intoTeamPowerSubPage",//团队实力
		"/llhb/Library/serviceProvition/intoServiceProvitionSubpage",//售后保障
		"/llhb/Library/connectUs/intoConnectUsSubPage"//联系我们
	};

	public void init(){
		moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 2);
		navigationMsg = SysCompanyCustomNavigation.dao.getNavigationMsg(moduleMsg.getInt("id"));
		setLink(navigationMsg,companyId);

		String common=moduleMsg.getStr("common");
		String navigationColor="rgb(255, 0, 0)";
		String activeItemColor="#118d59";
		String negativeWordColor="#666";
		if(StringUtils.isNotBlank(common)&&common.matches("^\\{.*\\}$")){
			JSONObject jso = JSONObject.fromObject(common);
			Object nc=jso.get("navigationColor");
			Object ac=jso.get("activeItemColor");
			Object wc=jso.get("negativeWordColor");
			navigationColor=nc==null||"".equals(nc)?navigationColor:nc.toString();
			activeItemColor=ac==null||"".equals(ac)?activeItemColor:ac.toString();
			negativeWordColor=wc==null||"".equals(wc)?negativeWordColor:wc.toString();
		}
		controller.setAttr("navigation", navigationMsg);
		controller.setAttr("navigationColor", navigationColor);
		controller.setAttr("activeItemColor", activeItemColor);
		controller.setAttr("negativeWordColor", negativeWordColor);
		controller.setAttr("activeNav",getActiveNav(navigationMsg,controller.getRequest().getServletPath()));
	}
	
	/**
	 * 设置导航栏菜单项链接地址
	 */
	public void setLink(List<SysCompanyCustomNavigation> navigationMsg,Long companyId){
		int itemId=0;
		for(SysCompanyCustomNavigation navigation:navigationMsg){
			itemId=navigation.getInt("item_id");
			navigation.put("link",ITEM_LINKS[itemId-1]+"/"+companyId );
		}
	};
	
	/**
	 * 设置导航栏菜单项活动状态
	 */
	public String getActiveNav(List<SysCompanyCustomNavigation> navigationMsg,String urlStr){
		int itemId=0;
		String link="";
		urlStr=urlStr.substring(0, urlStr.lastIndexOf("/"));
		StringBuilder activeNav=new StringBuilder();
		activeNav.append("id");
		if(urlStr.contains("serviceCase/detail")){
			for(SysCompanyCustomNavigation navigation:navigationMsg){
				itemId=navigation.getInt("item_id");
				if(itemId==3){
					activeNav.append(navigation.getInt("id"));
					break;
				}
			}
		}else{
			for(SysCompanyCustomNavigation navigation:navigationMsg){
				itemId=navigation.getInt("item_id");
				link=ITEM_LINKS[itemId-1];
				if(link.contains(urlStr)){
					activeNav.append(navigation.getInt("id"));
					break;
				}
			}
		}
		return activeNav.toString();
	}
	
}
