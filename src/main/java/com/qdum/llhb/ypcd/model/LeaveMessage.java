package com.qdum.llhb.ypcd.model;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class LeaveMessage extends Model<LeaveMessage> {
	/**
	 * 留言实体
	 */
	private static final long serialVersionUID = 1L;
    public static LeaveMessage dao =new LeaveMessage();
    
    
    public Page<Record> getLeaveMessages(int pageNumber, int pageSize,Long userId, String queryWord){
    	String sql ="FROM " +
    			" sys_company c LEFT JOIN cs_shop_leave_message mes ON c.id = mes.shop_id" +
    			" WHERE c.user_id = "+userId+
    			" and (mes.mes_content LIKE '%"+queryWord+"%' " +
				" OR mes.mes_title LIKE'%"+queryWord+"%' "+
    			" OR mes.user_name LIKE'%"+queryWord+"%' "+
    			" OR mes.user_qq LIKE'%"+queryWord+"%' "+
    			" OR mes.user_mail LIKE'%"+queryWord+"%' "+
    			" OR mes.user_phone LIKE'%"+queryWord+"%' "+
				" ) ORDER BY mes.create_date DESC";
    	return Db.paginate(pageNumber, pageSize, "SELECT mes.* ", sql);
    }


}
