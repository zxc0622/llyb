package com.qdum.llhb.ypcd.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class Honor extends Model<Honor>{

	/**
	 * 荣誉证书实体
	 */
	private static final long serialVersionUID = 1L;
	public static Honor dao = new Honor();
	
	/**
	 * 添加证书页面数据展示
	 * @param id
	 * @param shopId
	 * @return
	 */
	public List<Record> searchHonor(String id,long createBy){
		String sql="select *from cs_manage_certificate where del_flag =0 and id="+id+" and create_by="+createBy;
				
		return Db.find(sql);
	}
	/**
	 *通过名称和状态获取荣誉资质列表
	 */
	public Page<Record> searchCert(int pageNumber,int pageSize,String name,String id){
		String select = "SELECT *";
		String sql=" ";
		return Db.paginate(pageNumber, pageSize,select,sql);
	}
	/**
	 *通过标题和状态获取荣誉资质列表
	 *@param past 0：未过期   1：过期   2:表示与是否过期无关
	 */
	public Page<Record> getCerByNameAndSta(int pageNumber,int pageSize,long createBy,int sta,String infoTitle,int past){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String select = "SELECT *";
		String sql="FROM cs_manage_certificate "
				+ "WHERE del_flag = 0 AND create_by = "+createBy+" AND sta = "+sta;
		if(infoTitle!=null && !infoTitle.equals("") && !infoTitle.equals("undefined")){
			sql += " AND info_title LIKE '%"+infoTitle+"%' ";
		}
		if(sta == 2 && past == 0){
			sql += " AND past_date > '"+ sdf.format(date)+"'";
		}
		if(sta == 2 && past == 1){
			sql += " AND past_date < '"+ sdf.format(date)+"'";
		}
		return Db.paginate(pageNumber, pageSize,select,sql);
	}
	
}
