package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class Basic extends Model<Basic>{

	/**
	 * 基本设置实体
	 */
	private static final long serialVersionUID = 1L;
	public static Basic dao = new Basic();

	public  List<Record> findBasicId(Long id){
		String sql ="select * from cs_settings_basic where user_id='"+id+"'";
		return Db.find(sql);
	}
}
