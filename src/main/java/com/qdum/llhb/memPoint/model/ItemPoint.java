package com.qdum.llhb.memPoint.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class ItemPoint extends Model<ItemPoint> {

	/**
	 * 积分项目实体
	 * @author zhaoyl
	 * @time 2016年1月12日11:04:55
	 */
	private static final long serialVersionUID = 1L;
	public static ItemPoint dao = new ItemPoint();
	
	/**
	 * 通过项目类型获取积分数
	 * @param String itemType -- 项目类型
	 * @return Record
	 * */
	public Record getPoint(String itemType){
		String sql = "select *from mp_item_point where del_flag = 0 and item_type ='"+itemType+"'";
		return Db.findFirst(sql);
	}
}
