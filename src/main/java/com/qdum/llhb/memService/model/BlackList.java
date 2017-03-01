package com.qdum.llhb.memService.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.ypcd.model.Banner;
/**
 * 黑名单类
 * @author wf
 *
 */
public class BlackList extends Model<BlackList>{
	private static final long serialVersionUID = 1L;
	public static BlackList dao = new BlackList();
	public static final String ID 				= "id";					//人员Id
	public static final String CREATE_BY			= "create_by";  			//字典表中的用户类型
	public static final String CREATE_DATE 	= "create_date";
	
	
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	public void setCreateBy(long name) {
		set(CREATE_BY, name);
	}
	
	public long getCreateBy() {
		return getLong(CREATE_BY);
	}
	public Date getCreateDate() {
		return (Date)get(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	/**
	 * 根据userid取记录
	 */
	public BlackList getByUserid(Long userid){
		String sql = "SELECT  * FROM ms_mail_black_list WHERE del_flag='0' AND user_id="+userid;
		return BlackList.dao.findFirst(sql);
	}
	public Record getRecordByUserid(Long userid){
		String sql = "SELECT  * FROM ms_mail_black_list WHERE del_flag='0' AND user_id="+userid;
		return Db.findFirst(sql);
	}
}
