package com.qdum.llhb.memService.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Area;
/**
 * 信件类
 * @author wf
 *
 */
public class Message extends Model<Message>{
	private static final long serialVersionUID = 1L;
	public static Message dao = new Message();

	public static final String CREATE_BY			= "create_by";  			//字典表中的用户类型
	public static final String CREATE_DATE 	= "create_date";
	
	
	
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
	
	//获取对象
	public Message getMessageById(Long id){
		return Message.dao.findFirst("SELECT * FROM ms_mail_message WHERE recer_del_flag = '0' and id=?",id);
	}
	public Message getMessageByStringId(String id){
		return Message.dao.findFirst("SELECT * FROM ms_mail_message WHERE recer_del_flag = '0' and id=?",id);
	}
	public Message getMessageByType(boolean flag){
		return Message.dao.findFirst("SELECT * FROM ms_mail_message WHERE del_flag = '0' and send_sta=",flag);
	}	
	/**
	 * 根据类型查
	 */
	/*public List<Message> getMessageByType(String type,Long id){
		String sql = "SELECT * FROM ms_mail_message WHERE 1=1 ";
		if(type.equals("0")||type.equals("1")){
			sql+=" and send_del_flag='0' and send_id="+id+" and send_sta='"+type+"'";
		}else if(type.equals("2")){
			sql += " and recer_del_flag='0' and rec_id="+id;
		}else if(type.equals("3")){
			sql+=" and del_sta='1' ";
		}
		return Message.dao.find(sql);
	}*/
	
	public List<Message> getMessageList(long userid,String index){
		String sql = "SELECT mm.*,su.name,mt.title,mt.text,mt.del_flag as mdf FROM ms_mail_messagetext mt LEFT JOIN ms_mail_message mm ON(mt.id=mm.text_id) LEFT JOIN sys_user su on(mt.create_by=su.id) WHERE   mt.del_flag = '0' ";
		if(index.equals("0")||index.equals("1")){
			//发件箱 草稿箱
			sql+="  and mm.send_del_flag = '0' and mm.send_del_sta = '0' and mm.send_id="+userid +" AND mm.send_sta='"+index+"'";
		}else if(index.equals("2")){
			//收件箱
			sql +=" and mm.recer_del_flag = '0' and mm.recer_del_sta = '0' and mm.rec_id="+userid;
			/*if(!che.equals("false")){
				sql+=" and mm.rec_sta = '1'";
			}*/
			
		}else if(index.equals("3")){
			//回收站
			sql +=" and mm.send_del_flag = '0' and mm.recer_del_flag = '0' and (mm.send_del_sta = '1' or mm.recer_del_sta = '1') ";
		}
		
		return Message.dao.find(sql);
	}
	
	/**
	 * 获取未读消息
	 */
	public long getNotRead(long userId){
		String sql="SELECT count(mm.id) as n FROM ms_mail_message mm " +
				"WHERE mm.rec_sta='0' and mm.recer_del_flag='0' and mm.recer_del_sta='0' " +
				"AND mm.send_sta='1' and mm.rec_id='"+userId+"' ";
		return Db.find(sql).get(0).getLong("n");
	}
}
