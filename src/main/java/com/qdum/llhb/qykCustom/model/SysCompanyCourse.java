package com.qdum.llhb.qykCustom.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

/**
 * 企业自定义-服务案例
 */
public class SysCompanyCourse extends
		Model<SysCompanyCourse> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCourse dao = new SysCompanyCourse();

	public List<SysCompanyCourse> getCourseMsg(int customId){
		String sql = "SELECT * FROM sys_company_custom_course WHERE custom_id=? AND del_flag=0 ORDER BY seq";
		List<SysCompanyCourse> courseList = dao.find(sql,customId);
		return courseList;
	}

}
