package com.qdum.llhb.salesmancode.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class SalesmanCode extends Model<SalesmanCode> {

	/**
	 * 业务员编码实体
	 * @author zhaoyl
	 * @time 2016年1月8日09:44:01
	 */
	private static final long serialVersionUID = 1L;
	public static SalesmanCode dao = new SalesmanCode();
	
	/**
	 * 通过名字或编码获取实体
	 * @param name -- 名称
	 * @param code -- 编码
	 * @return Record 
	 * @author zhaoyl
	 * @time 2016年1月8日10:51:37
	 * */
	public Record getSalesCode(String name, String code){
		String sql = "select *from ws_business_href_info where del_flag= 0 and (name='"+name+"' or code='"+code+"')";
		return Db.findFirst(sql);
	}
	/**
	 * 通过名字获取实体
	 * @param name -- 名称
	 * @param  -- 编码
	 * @return Record 
	 * @author zhaoyl
	 * @time 2016年1月8日11:52:37
	 * */
	public Record getSalesCodeByName(String name){
		String sql = "select *from ws_business_href_info where del_flag= 0 and name='"+name+"' ";
		return Db.findFirst(sql);
	}
	/**
	 * 获取列表page
	 * @param  -- 名称
	 * @param  -- 编码
	 * @return Record 
	 * @author zhaoyl
	 * @time 2016年1月8日14:05:31
	 * */
	public Page<Record> getSaleCodePage(int pageNumber, int pageSize, String searchName){
		String select = "select * ";
		String sqlExceptSelect = "from ws_business_href_info where del_flag=0 and name like '%"+searchName+"%' order by create_date desc";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	public Record getSalesCodeByCode(String code){
		String sql = "select *from ws_business_href_info where del_flag= 0 and code='"+code+"' ";
		return Db.findFirst(sql);
	}
}
