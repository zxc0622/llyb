package com.qdum.llhb.memPoint.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class PointMain extends Model<PointMain> {

	/**
	 * 用户-积分主表实体
	 * @author zhaoyl
	 * @time 2016年1月12日11:06:12
	 */
	private static final long serialVersionUID = 1L;
	public static PointMain dao = new PointMain();

	/**
	 * 通过用户id 获取用户 积分
	 * @param userId
	 * @return Record
	 * */
	public PointMain getUserPoint(long userId){
		String sql = "select *from mp_point_main where del_flag = 0 and user_id="+userId;
		return PointMain.dao.findFirst(sql);
	}
	/**
	 * 获取用户的 积分
	 */
	public Record getPoint(long uid){
		return Db.findFirst("SELECT * FROM mp_point_main m WHERE m.del_flag='0' and m.user_id=?",uid);
	}
}
