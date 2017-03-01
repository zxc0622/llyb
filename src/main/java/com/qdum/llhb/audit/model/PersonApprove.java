package com.qdum.llhb.audit.model;

import com.jfinal.plugin.activerecord.Model;

public class PersonApprove extends Model<PersonApprove> {

	/**
	 * 供应审核 zhangxm
	 */
	private static final long serialVersionUID = 1L;
	public static final PersonApprove dao = new PersonApprove();
	
	/**
	 * 根据供应id查找
	 */
	public PersonApprove findBySupplyid(String sid){
		String sql="SELECT * FROM inma_supply_approve WHERE del_flag='0' AND supply_id='"+sid+"'";
		return this.findFirst(sql);
	}
}
