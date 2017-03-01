package com.qdum.llhb.sys.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.Date;

/**
 * 登录日志表
 * @author zhangxm
 */
public class LoginLog extends Model<LoginLog> {

	private static final long serialVersionUID = 1L;
	public static final LoginLog dao = new LoginLog();

	/**
	 * 数据收集-登录日志
	 */
	public Page<Record>  findByUser(int pageNumber,int pageSize,String uname){
		String sql=" FROM sys_login_log AS l " +
				"INNER JOIN sys_user u ON l.log_user=u.id AND u.del_flag='0' " +
				"WHERE l.del_flag='0' ";
		if(!"".equals(uname) && uname != null && !uname.equals("undefined")){
			sql +="AND u.login_name like '%"+uname+"%' ";
		}
		sql+="ORDER BY l.log_time DESC";
		return Db.paginate(pageNumber, pageSize, "SELECT l.id,l.log_time AS t,u.login_name AS loginName,l.log_ip", sql);
	}

	/**
	 * 保存用户登录日志
	 * @param userId
     */
	public void saveloginLog(Long userId,String ip){
		LoginLog log = new LoginLog();
		log.set("log_type","LOGIN").set("log_time", new Date()).set("log_user", userId).set("del_flag",0).set("log_ip",ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip).save();
	}
}
