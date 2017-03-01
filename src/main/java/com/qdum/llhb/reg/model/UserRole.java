package com.qdum.llhb.reg.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class UserRole extends Model<UserRole> {
	private static final long serialVersionUID = 1L;
	public static UserRole dao = new UserRole();
	
	public UserRole getByIds(long rid,long uid){
		String sql = "SELECT * FROM sys_user_role ur WHERE ur.role_id=? and ur.user_id=?";
		return UserRole.dao.findFirst(sql,rid,uid);
	}
	
	/**
	 * 根据user_id获取role_id
	 * @author zhaoyl
	 * @time 2015年12月1日10:08:37
	 * 
	 * */
	public UserRole getRoleID(long userId){
		String sql = "SELECT * FROM sys_user_role ur WHERE ur.user_id="+userId;
		return UserRole.dao.findFirst(sql);
	}
}
