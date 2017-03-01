package com.qdum.llhb.qykCustom.service;

import org.apache.commons.lang3.StringUtils;

import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanySummary;


public class SummaryService extends Module {

	private SysCompanyCustom customMsg;
	private Record shopMsg;
	private SysCompanySummary summaryMsg;

	@Override
	public void init() {
		// TODO Auto-generated method stub
		customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), 4);
		int customId=customMsg.getInt("id");
		String common=customMsg.getStr("common");
		JSONObject comJso = JSONObject.fromObject(common);
		String title=StringUtils.isBlank(comJso.getString("title"))?"公司简介":comJso.getString("title");
		String wordcolor=StringUtils.isBlank(comJso.getString("wordcolor"))?"公司简介":comJso.getString("wordcolor");
		shopMsg = Db.findFirst("SELECT shop_desc FROM `cs_settings_basic` where user_id=?",userId.intValue());
		String desc=shopMsg.getStr("shop_desc");
		desc=StringUtils.isBlank(desc)?"暂无简介！":desc;
		summaryMsg = SysCompanySummary.dao.getSummaryMsg(customId);
		String img="";
		int id=-1;
		if(summaryMsg!=null){
			img=summaryMsg.getStr("img");
			img=StringUtils.isBlank(img)?"":img;
			id=summaryMsg.getInt("id");
		}
		JSONObject jso = new JSONObject();
		jso.put("title", title);
		jso.put("wordcolor", wordcolor);
		jso.put("desc", desc);
		jso.put("img", img);
		jso.put("id", id);
		controller.setAttr("summaryMsg", jso);
	}

}
