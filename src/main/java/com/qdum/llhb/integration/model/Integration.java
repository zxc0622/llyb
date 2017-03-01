package com.qdum.llhb.integration.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Integration extends Model<Integration>{
	/**
	 * 积分兑换商品实体
	 */
	private static final long serialVersionUID = 1L;
	public static Integration dao = new Integration();

	
	/**
	 * 分页查询积分兑换商品
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> findIntegration(int pageNumber,int pageSize){
		String sql="FROM mp_product_info where del_flag='0' order by createDate desc";
		return Db.paginate(pageNumber, pageSize, "select id,pro_name as proName,points,num,limit_num as limitNum,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate", sql);
	}
	/**
	 * 单挑查询积分兑换商品	
	 */
	public List<Record> findIntegrationId(String id){
		String sql="select id,pro_name as proName,points,num,limit_num as limitNum,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,sponsor,pro_desc as proDesc,small_img as smallImg FROM mp_product_info where del_flag='0' and id='"+id+"'";
		return Db.find(sql);
	}
}
