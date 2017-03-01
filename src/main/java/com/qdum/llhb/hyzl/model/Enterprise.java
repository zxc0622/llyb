package com.qdum.llhb.hyzl.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * 公司资料实体
 * @author wcl
 */
public class Enterprise extends Model<Enterprise>{

	private static final long serialVersionUID = 1L;
	public static Enterprise dao = new Enterprise();
	/**
	 * 校验公司名称
	 */
	public List<Record> enterpriseJy(String enterpriseName){
		String sql="select * from sys_company where trim(company_name)='"+enterpriseName+"'";
		List<Record> list = Db.find(sql);
		return list;
	}
	
}
