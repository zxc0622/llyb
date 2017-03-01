package com.qdum.llhb.qykCustom.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 企业自定义-企业相册
 */
public class SysCompanyPhotos extends Model<SysCompanyPhotos> {

	private static final long serialVersionUID = 1L;
	public static SysCompanyPhotos dao = new SysCompanyPhotos();

	/**
	 * 根据user_id查询前相册信息,全部展示
	 * 
	 *  20140106 ck 修改： 去掉条件sta = 2，取消审核
	 */
	public List<Record> findPhotosByUserId(long userId) {
		String sql = "SELECT t. NAME AS tname, t.image AS image, s. NAME AS sname, "
				+ " DATE_FORMAT(t.create_date, '%Y-%m-%d') AS createDate "
				+ " FROM cs_manage_image_detail t "
				+ " LEFT JOIN cs_manage_image_host s ON t.host_id = s.id AND s.del_flag = '0' "
				+ " WHERE s.shop_id = ? AND t.del_flag = '0' "
				+ " ORDER BY t.create_date DESC LIMIT 8";
		String shopid = SysCompanyCustom.dao.getShopIdByUserId(userId);
		if (shopid != null) {
			return Db.find(sql, shopid);
		} else {
			return null;
		}
	}
}
