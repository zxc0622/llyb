package com.qdum.llhb.audit.model;

import com.jfinal.plugin.activerecord.Model;

public class SupplyApprove extends Model<SupplyApprove> {

	/**
	 * 供应审核 zhangxm
	 */
	private static final long serialVersionUID = 1L;
	public static final SupplyApprove dao = new SupplyApprove();
	
	/**
	 * 根据供应id查找
	 */
	public SupplyApprove findBySupplyid(String sid){
		String sql="SELECT * FROM inma_supply_approve WHERE del_flag='0' AND supply_id='"+sid+"'";
		return this.findFirst(sql);
	}
}
