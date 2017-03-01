package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class Category extends Model<Category>{

	/**
	 * 栏目实体
	 */
	private static final long serialVersionUID = 1L;
	public static Category dao = new Category();
	
	/**
	 * 默认栏目L菜单
	 * @return
	 */
	public List<Record> findCategory(){
	String sql ="SELECT"+
			" T.is_show AS isShow,"+
			" T.sort,"+
			" T.NAME,"+
			" T.identity,"+
			" T.page_num as pageNum,"+
			" T.type,"+
			" S.label"+
			" FROM"+
			" cs_settings_category T"+
			" INNER JOIN sys_dict S ON T.identity = S.VALUE"+
			" AND S.del_flag = '0'"+
			" AND T.del_flag = '0'"+
			" AND T.type = 'L'"+
			" WHERE "+
			" T.shop_id='0'";
		return Db.find(sql);
	}
	/**
	 * ID查询栏目L菜单
	 * @return
	 */
	public List<Record> findCategoryId(Long id){
		String sql ="SELECT"+
				" T.is_show AS isShow,"+
				" T.id as id,"+
				" T.sort,"+
				" T.NAME,"+
				" T.identity,"+
				" T.page_num as pageNum,"+
				" T.type,"+
				" S.label"+
				" FROM"+
				" cs_settings_category T"+
				" INNER JOIN sys_dict S ON T.identity = S.VALUE"+
				" AND S.del_flag = '0'"+
				" AND T.del_flag = '0'"+
				" AND T.type = 'L'"+
				" WHERE "+
				" T.shop_id='"+id+"'";
		return Db.find(sql);
	}
	/**
	 * 默认栏目M菜单
	 * @return
	 */
	public List<Record> findCategoryM(){
		String sql ="SELECT"+
				" T.is_show AS isShow,"+
				" T.sort,"+
				" T.NAME,"+
				" T.identity,"+
				" T.page_num as pageNum,"+
				" T.type,"+
				" S.label"+
				" FROM"+
				" cs_settings_category T"+
				" INNER JOIN sys_dict S ON T.identity = S.VALUE"+
				" AND S.del_flag = '0'"+
				" AND T.del_flag = '0'"+
				" AND T.type = 'M'"+
				" WHERE "+
				" T.shop_id='0'";
			return Db.find(sql);
	}
	/**
	 * ID查询栏目M菜单
	 * @return
	 */
	public List<Record> findCategoryMId(Long id){
		String sql ="SELECT"+
				" T.is_show AS isShow,"+
				" T.id as id,"+
				" T.sort,"+
				" T.NAME,"+
				" T.identity,"+
				" T.page_num as pageNum,"+
				" T.type,"+
				" S.label"+
				" FROM"+
				" cs_settings_category T"+
				" INNER JOIN sys_dict S ON T.identity = S.VALUE"+
				" AND S.del_flag = '0'"+
				" AND S.type = 'lm_type'"+
				" AND T.del_flag = '0'"+
				" AND T.type = 'M'"+
				" WHERE "+
				" T.shop_id='"+id+"'";
		return Db.find(sql);
	}
}
