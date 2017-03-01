package com.qdum.llhb.qykCustom.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-售后保障
 */
public class SysCompanyServiceProvition extends
		Model<SysCompanyServiceProvition> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyServiceProvition dao = new SysCompanyServiceProvition();

	public SysCompanyServiceProvition getProvMsg(int customId){
		String sql = "SELECT * FROM sys_company_custom_service_provition WHERE custom_id=? AND del_flag=0 ORDER BY id";
		SysCompanyServiceProvition provMsg = dao.findFirst(sql,customId);
		return provMsg;
	}

}
