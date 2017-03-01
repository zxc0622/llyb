package com.qdum.llhb.qykCustom.model;

import java.util.List;

import org.json.JSONObject;

import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-导航栏模块
 */
public class SysCompanyCustomNavigation extends
		Model<SysCompanyCustomNavigation> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCustomNavigation dao = new SysCompanyCustomNavigation();

	/**
	 * 获取导航栏模块信息
	 * 
	 * @param customId
	 * @return
	 */
	public List<SysCompanyCustomNavigation> getNavigationMsg(int customId) {
		List<SysCompanyCustomNavigation> SysCompanyCustomNavigationList = dao
				.find("select * from sys_company_custom_navigation"
						+ " where del_flag=0 and custom_id=? order by show_flag desc,seq", customId);
		return SysCompanyCustomNavigationList;
	}
	
	/**
	 * 根据id更新数据
	 */
	public void updateById(JSONObject jso){
		SysCompanyCustomNavigation sysCompanyCustomNavigation = dao.findById(jso.get("itemId"));
		sysCompanyCustomNavigation.set("item", jso.get("itemName"));
		sysCompanyCustomNavigation.set("seq", jso.get("seq"));
		sysCompanyCustomNavigation.set("show_flag", jso.get("show"));
		sysCompanyCustomNavigation.update();
	}
}
