package com.qdum.llhb.qyk.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Certificate extends Model<Certificate>{

	/**
	 * 证书实体
	 */
	private static final long serialVersionUID = 1L;
	public static Certificate dao = new Certificate();

	public Page<Record> searchCertificate(int pageNumber,int pageSize,String id){
		String sql=" FROM"+
					" cs_manage_certificate"+
					" WHERE"+
					" shop_id = '"+id+"'"+
					" AND del_flag='0'";
					/*" AND sta='2'";*/
		return Db.paginate(pageNumber, pageSize, "SELECT info_title AS infoTitle,cer_org AS cer0rg,DATE_FORMAT(start_date, '%Y-%m-%d')  AS startDate,DATE_FORMAT(past_date, '%Y-%m-%d')  AS pastDate,cer_pic as cerPic", sql);
	}
}
