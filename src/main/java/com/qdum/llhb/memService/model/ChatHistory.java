package com.qdum.llhb.memService.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * 站内交流-会话表
 * @author zhangxm
 */
public class ChatHistory extends Model<ChatHistory> {

	private static final long serialVersionUID = 1L;
	public static ChatHistory dao = new ChatHistory();
	
	/**
	 * 收到的会话
	 * @param rec
	 * @return
	 */
	public List<Record> getRecs(long rec){
		String sql="SELECT "+
		"h.from_user AS fromUser, "+
		"u.login_name AS loginName, "+
		"c.company_name AS cname, "+
		"p.real_name AS realName, "+
		"IF(h.update_date>h.create_date,h.update_date,h.create_date) time "+
		"FROM ms_chat_history h "+
		"LEFT JOIN sys_user u ON h.from_user = u.id "+
		"LEFT JOIN sys_company c ON u.id = c.user_id "+
		"AND c.del_flag = '0' "+
		"LEFT JOIN sys_person p ON u.id=p.user_id "+
		"WHERE	h.to_user = '"+rec+"' "+
		"AND h.del_flag = '0' "+
		"AND u.del_flag = '0' "+
		"ORDER BY time desc  limit 0,10";
		return Db.find(sql);
	}
	/**
	 * 发起的会话
	 * @param send
	 * @return
	 */
	public List<Record> getSends(long send){
		String sql="SELECT "+
		"h.to_user AS toUser, "+
		"u.login_name AS loginName, "+
		"c.company_name AS cname, "+
		"p.real_name AS realName, "+
		"IF(h.update_date>h.create_date,h.update_date,h.create_date) time "+
		"FROM ms_chat_history h "+
		"LEFT JOIN sys_user u ON h.to_user = u.id "+
		"LEFT JOIN sys_company c ON u.id = c.user_id "+
		"AND c.del_flag = '0' "+
		"LEFT JOIN sys_person p ON u.id=p.user_id "+
		"WHERE	h.from_user = '"+send+"' "+
		"AND h.del_flag = '0' "+
		"AND u.del_flag = '0' "+
		"ORDER BY time desc  limit 0,10";
		return Db.find(sql);
	}
	/**
	 * 查找记录是否存在
	 * @param fromUser
	 * @param toUser
	 * @return
	 */
	public ChatHistory getHistoryById(long fromUser,long toUser){
		String sql="SELECT h.* FROM ms_chat_history h "+
				"WHERE (h.from_user='"+fromUser+"' AND h.to_user='"+toUser+"')  "+
				"OR (h.from_user='"+toUser+"' AND h.to_user='"+fromUser+"')";
		return this.findFirst(sql); 
	}
}
