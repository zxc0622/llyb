package com.qdum.llhb.qykCustom.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-企业简介
 */
public class SysCompanySummary extends
		Model<SysCompanySummary> {

	private static final long serialVersionUID = 1L;
	public static SysCompanySummary dao = new SysCompanySummary();
	private SysCompanySummary scs;
	
	//获取企业简介信息
	public SysCompanySummary getSummaryMsg(int customId){
		scs = dao.findFirst("select * from sys_company_custom_summary where custom_id=?",customId);
		return scs;
	}
	
	//更新
	public int updateSummary(int customId,String img){
		return Db.update("update sys_company_custom_summary set img=? where custom_id=?",img,customId);
	}
}
