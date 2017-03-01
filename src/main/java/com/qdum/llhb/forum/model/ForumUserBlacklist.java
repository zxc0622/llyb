package com.qdum.llhb.forum.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

import java.util.List;

public class ForumUserBlacklist extends Model<ForumUserBlacklist> {

	/**
	 * 禁言用户实体
	 * @author zhaoyl
	 * @time 2016年1月4日10:01:16
	 */
	private static final long serialVersionUID = 1L;
	
	public static ForumUserBlacklist dao = new ForumUserBlacklist();
	
	/**
	 * @param userId
	 * @return Record
	 * @author zhaoyl
	 * @time 2016年1月4日10:52:14
	 * */
	public ForumUserBlacklist getByUserId(long userId){
		String sql = "select *from forum_user_blacklist where del_flag=0 and user_id = "+userId;
		return ForumUserBlacklist.dao.findFirst(sql);
	}
	
	/**
	 * 获取禁言用户列表
	 * @author zhaoyl
	 * @return List<Record>
	 * */
	public List<Record> getList(){
		String sql = "select u.login_name create_name, su.login_name user_name, fub.*from forum_user_blacklist fub " +
				"left join sys_user su on su.id = fub.user_id " +
				"left join sys_user u on u.id = fub.create_by " +
				"where fub.del_flag=0";
		return Db.find(sql);
	}
	/**
	 *查看某用户在某时间段是否被禁言
	 */
	public Record checkNoPosting(long uid){
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM forum_user_blacklist b WHERE b.del_flag ='0' and NOW() >= b.start_time and NOW()<= b.end_time and b.user_id=?");
		return  Db.findFirst(sb.toString(),uid);
	}

	
}
