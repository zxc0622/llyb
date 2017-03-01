package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;


public class Menu extends Model<Menu>{

	/**
	 * 云铺菜单实体
	 */
	private static final long serialVersionUID = 1L;
	public static Menu dao = new Menu();
	/**
	 * 菜单初始模版
	 * @return
	 */
	public List<Record> findMenu(){
		String sql ="SELECT"+
			" T.is_show as isShow,"+
			" T.id as id,"+
			"  T.sort,"+
			"  T. NAME,"+
			"   T.page_num as pageNum,"+
			"   T.identity as identity,"+
			"   S.label"+
			"  FROM"+
			" cs_settings_menu T"+
			"  INNER JOIN sys_dict S ON T.identity = S.VALUE"+
			" AND S.type='csz_type'"+
			" AND S.del_flag='0'"+
			" AND T.del_flag='0'"+
			"  WHERE"+
			" T.shop_id IS NULL";
		return Db.find(sql);
	}
	/**
	 * 根据登录ID 查询店铺信息
	 */
	public List<Record> findShouMenu(Long id){
		String sql ="SELECT"+
				" T.is_show as isShow,"+
				" T.id as id,"+
				"  T.sort,"+
				"  T. NAME,"+
				"   T.page_num as pageNum,"+
				"   T.identity as identity,"+
				"   S.label"+
				"  FROM"+
				" cs_settings_menu T"+
				"  INNER JOIN sys_dict S ON T.identity = S.VALUE"+
				" AND S.type='csz_type'"+
				" AND S.del_flag='0'"+
				" AND T.del_flag='0'"+
				"  WHERE"+
				" T.shop_id ='"+id+"'";
			return Db.find(sql);
	}
	
	
}
