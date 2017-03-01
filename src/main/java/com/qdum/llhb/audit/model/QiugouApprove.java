package com.qdum.llhb.audit.model;

import com.jfinal.plugin.activerecord.Model;

public class QiugouApprove extends Model<QiugouApprove> {

	/**
	 * 供应审核 zhangxm
	 */
	private static final long serialVersionUID = 1L;
	public static final QiugouApprove dao = new QiugouApprove();
	
	/**
	 * 根据供应id查找
	 */
	public QiugouApprove findBySupplyid(String sid){
		String sql="SELECT * FROM inma_supply_approve WHERE del_flag='0' AND supply_id='"+sid+"'";
		return this.findFirst(sql);
	}
}
