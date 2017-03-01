package com.qdum.llhb.qykCustom.model;

import java.util.List;

import net.sf.json.JSONObject;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 企业自定义-企业资质
 */
public class SysCompanyCertificates extends
		Model<SysCompanyCertificates> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyCertificates dao = new SysCompanyCertificates();

	/**
	 * 根据user_id查询资质信息(审核通过)
	 */
	public List<Record> findCertificatesByUserId(long user_id,int recordNum){
		String shopid = SysCompanyCustom.dao.getShopIdByUserId(user_id);
//		String sql = "SELECT * FROM cs_manage_certificate WHERE shop_id = ? AND del_flag = '0' AND sta = 2 LIMIT "+recordNum;
		//取消审核，所以去掉条件 sta = 2
		String sql = "SELECT * FROM cs_manage_certificate WHERE shop_id = ? AND del_flag = '0' LIMIT "+recordNum;
		if(shopid != null){
			return Db.find(sql,shopid);
		}else{
			return null;
		}
	}
	
	/**
	 * 根据user_id查询资质信息(审核未通过)
	 */
	public List<Record> findAllCertificatesByUserId(long user_id,int recordNum){
		String shopid = SysCompanyCustom.dao.getShopIdByUserId(user_id);
		String sql = "SELECT * FROM cs_manage_certificate WHERE shop_id = ? AND del_flag = '0' LIMIT "+recordNum;
		if(shopid != null){
			return Db.find(sql,shopid);
		}else{
			return null;
		}
	}
	
	//更新证书信息
	public boolean updataCer(JSONObject cerJso){
		Record cer= Db.findById("cs_manage_certificate", cerJso.get("cerId"));
		cer.set("cer_pic", cerJso.getString("imgUrl"));
		cer.set("info_title", cerJso.getString("title"));
		return Db.update("cs_manage_certificate",cer);
	}
	
	//删除证书
	public boolean deleteCer(String id){
		Record cer= Db.findById("cs_manage_certificate", id);
		cer.set("del_flag", 1);
		return Db.update("cs_manage_certificate",cer);
	}
	
	//新增证书
	public void addCer(JSONObject cerJso){
		String shopid = SysCompanyCustom.dao.getShopIdByUserId(cerJso.getLong("userId"));
		Db.update("insert into cs_manage_certificate (shop_id,cer_pic,info_title) values (?,?,?)",shopid, cerJso.getString("imgUrl"),cerJso.getString("title"));
	}

}
