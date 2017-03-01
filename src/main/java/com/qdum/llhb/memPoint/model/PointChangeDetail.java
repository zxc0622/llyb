package com.qdum.llhb.memPoint.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class PointChangeDetail extends Model<PointChangeDetail> {

	/**
	 * 积分变更细节实体
	 * @author zhaoyl
	 * @time 2016年1月12日11:04:30
	 */
	private static final long serialVersionUID = 1L;
	public static PointChangeDetail dao = new PointChangeDetail();
	
	/**
	 * 通过用户id 项目类型获取登录操作
	 * @param useId   用户id
	 * @param itemType 项目类型
	 * */
	public List<Record> getLoginUserLogo(long userId, String itemType){
		String sql = "select *from mp_point_change_detail where del_flag = 0 and create_date >=curdate() and login_user = "+userId+" and item_type='"+itemType+"'";
		return Db.find(sql);
	}
	/**
	 * 获取注册完成并资料日志
	 * @param useId   用户id
	 * @param itemType 项目类型
	 * */
	public List<Record> getRegUserLogo(long userId, String itemType){
		String sql = "select *from mp_point_change_detail where del_flag = 0  and reg_user = "+userId+" and item_type='"+itemType+"'";
		return Db.find(sql);
	}
	/**
	 * 获取积分记录
	 * @return
	 * */
	public Page<Record> getAll(int pageNumber, int pageSize, Long id){
		String select = "select d.remarks item, d.*, u.login_name, p.item_desc ";
		String sqlExceptSelect = "from mp_point_change_detail d " +
					"left join sys_user u on d.create_by = u.id  " +
					"left join mp_item_point p on d.item_type = p.item_type " +
					"where d.del_flag = 0 and u.id = ? order by d.create_date desc";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect,id);
	}
}
