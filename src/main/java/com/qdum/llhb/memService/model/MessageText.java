package com.qdum.llhb.memService.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.ypcd.model.Banner;
/**
 * 信件类
 * @author wf
 *
 */
public class MessageText extends Model<MessageText>{
	private static final long serialVersionUID = 1L;
	public static MessageText dao = new MessageText();
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
	//取信件信息
	public List<Record> getMessage(long userid,String index,String conditon,List<Long> ids){
		String sql = " FROM ms_mail_messagetext mt LEFT JOIN ms_mail_message mm ON(mt.id=mm.text_id) LEFT JOIN sys_user su on(mt.create_by=su.id) WHERE   mt.del_flag = '0' ";
		if(index.equals("0")||index.equals("1")){
			//发件箱 草稿箱
			sql+="  and mm.send_del_flag = '0' and mm.send_del_sta = '0' and mm.send_id="+userid +" AND mm.send_sta='"+index+"'";
		}else if(index.equals("2")){
			//收件箱
			sql +=" and mm.recer_del_flag = '0' and mm.recer_del_sta = '0' and mm.send_sta = '1' and mm.rec_id="+userid;
			if(ids != null){
				for(Long uuid:ids){
					sql+=" and mm.send_id != "+uuid;
				}
			}
		}else if(index.equals("3")){
			//回收站
			sql +=" and mm.send_del_flag = '0' and mm.recer_del_flag = '0' and (mm.send_del_sta = '1' or mm.recer_del_sta = '1') ";
		}
		if(conditon != null){
			sql+=" and mt.title LIKE '%"+conditon+"%' ORDER BY mm.create_date desc";
		}else {
			sql+=" ORDER BY mm.create_date desc";
		}
		return Db.find("SELECT mm.*,su.login_name,mt.title,mt.text,mt.del_flag as mdf  " +sql);
	}
	
	
	
	
	//获取对象
	public MessageText getMessageTextById(Long id){
		return MessageText.dao.findFirst("SELECT * FROM ms_mail_messagetext WHERE del_flag = '0' and id=?",id);
	}
	public MessageText getMessageTextByType(boolean flag){
		return MessageText.dao.findFirst("SELECT * FROM ms_mail_messagetext WHERE del_flag = '0' and send_sta=",flag);
	}
	/**
	 * 根据类型查
	 */
	public List<MessageText> getMessageByType(String type,Long id){
		String sql = "SELECT * FROM ms_mail_message WHERE del_flag='0'";
		if(type.equals("0")||type.equals("1")){
			sql+=" and send_id="+id+" and send_sta='"+type+"'";
		}else if(type.equals("2")){
			sql += " and rec_id="+id;
		}else if(type.equals("3")){
			sql+=" and del_sta='1'";
		}
		return MessageText.dao.find(sql);
	}
	
}
