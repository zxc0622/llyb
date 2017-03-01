package com.qdum.llhb.qykCustom.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-服务案例
 */
public class SysCompanyHead extends
		Model<SysCompanyHead> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyHead dao = new SysCompanyHead();

	/**
	 * 根据id获取企业头部信息
	 * @param id
	 * @return
	 */
	public SysCompanyHead getHeadMsg(int customId){
		return dao.findFirst("select * from sys_company_custom_head where custom_id=?",customId);
	}

}
