package com.qdum.llhb.qykCustom.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 企业自定义-服务类型
 */
public class SysCompanyCustomServiceType extends
		Model<SysCompanyCustomServiceType> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCustomServiceType dao = new SysCompanyCustomServiceType();

	/**
	 * 获取服务类型
	 * @param userID
	 * @return
	 */
	public List<SysCompanyCustomServiceType> getServiceType(int customId){
		String sql = "SELECT * FROM sys_company_custom_service WHERE custom_id = ? AND del_flag = 0";
		List<SysCompanyCustomServiceType> rec = dao.find(sql,customId);
		return rec;
	}
	
	/**
	 * 从字典表获取全部服务类型
	 * @return
	 */
	public List<Record> getAllType(){
		String sql = "SELECT * FROM sys_dict_pcr WHERE parent_id IN(1273,1274,1276) AND del_flag=0";
		List<Record> typeList = Db.find(sql);
		return typeList;
	}

}
