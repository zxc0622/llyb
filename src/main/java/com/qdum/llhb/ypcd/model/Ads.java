package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/**
 * 云铺管理 - 广告表
 * @author zhangxm
 */
public class Ads extends Model<Ads>{

	private static final long serialVersionUID = 1L;
	public static Ads dao = new Ads();
	/**
	 * 根据条件获取广告列表
	 * @param id
	 * @param pageNumber
	 * @param pageSize
	 * @param channeId
	 * @param channeIdSec
	 * @param adName
	 * @return
	 */
	public List<Ads> getAds(long id,int pageNumber,int pageSize,String  channeId,String  channeIdSec){
		String sql = "SELECT ad.id,ad.shop_id AS shopId,d.label AS channel," +
				"p.label AS channelSec,ad.ad_name as adName," +
				"ad.ad_pic as adPic,ad.ad_url as adUrl,ad.ad_desc as adDesc," +
				"IFNULL(ad.show_num,'0') AS showNum,ad.create_date as createDate, " +
				"IF(ad.update_date > ad.create_date,ad.update_date,ad.create_date) as time FROM cs_manage_ad ad  " +
				"LEFT JOIN sys_dict d ON ad.channel_id = d.`value`  " +
				"LEFT JOIN sys_dict p ON ad.channel_id_sec = p.`value` " +
				"WHERE ad.del_flag='0' AND d.type='csco_type' " + 
				"AND p.type='csct_type'AND ad.create_by='"+id+"'  ";
		if( !channeId.equals("") && channeId != null && !channeId.equals("undefined")){
			sql +="and ad.channel_id='"+channeId+"'";
		}
		if(!channeIdSec.equals("") && channeIdSec != null && !channeIdSec.equals("undefined")){
			sql +="and ad.channel_id_sec='"+channeIdSec+"'";
		}
		sql +="ORDER BY time desc limit "+(pageNumber-1)*pageSize+","+pageSize;
		return this.find(sql);
	}
	/**
	 * 根据条件获取广告条数
	 * @param id
	 * @param channeId
	 * @param channeIdSec
	 * @param adName
	 * @return
	 */
	public Ads getAdsCount(long id,String  channeId,String  channeIdSec){
		String sql = "SELECT count(ad.id) as count FROM cs_manage_ad ad  " +
				"WHERE ad.del_flag='0' AND ad.create_by='"+id+"'  ";
		if( !channeId.equals("") && channeId != null && !channeId.equals("undefined")){
			sql +="and ad.channel_id='"+channeId+"'";
		}
		if(!channeIdSec.equals("") && channeIdSec != null && !channeIdSec.equals("undefined")){
			sql +="and ad.channel_id_sec='"+channeIdSec+"'";
		}
		return this.findFirst(sql);
	}
	/**
	 * 根据id获取广告信息
	 * @param id
	 * @return
	 */
	 public List<Record> getAdById(long id){
		 String sql = "SELECT ad.id,ad.shop_id AS shopId,ad.channel_id AS channel," +
		 		"ad.channel_id_sec AS channelSec,ad.ad_name as adName," +
		 		"ad.ad_pic as adPic,ad.ad_url as adUrl,ad.ad_desc as adDesc," +
		 		"ad.show_num AS showNum,ad.create_date as createDate " +
		 		"FROM cs_manage_ad ad WHERE ad.del_flag='0' AND ad.id='"+id+"'";
		 return Db.find(sql);
	 }
}
