package com.qdum.llhb.qykCustom.model;

import java.util.List;

import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-banner图
 */
public class SysCompanyBanner extends
		Model<SysCompanyBanner> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyBanner dao = new SysCompanyBanner();
	private List<SysCompanyBanner> bannerList;

	//根据customId获取banner图
	public List<SysCompanyBanner> getBannersBycustomId(int customId){
		bannerList = dao.find("select * from sys_company_custom_banner where custom_id=? and del_flag=0",customId);
		return bannerList;
	}
	
	//更新banner信息
	public void updateBanner(JSONObject jso){
		Db.update("update sys_company_custom_banner set img_url=?,img_link=? where id=?",jso.getString("url"),jso.getString("link"),jso.getInt("id"));
	}
}
