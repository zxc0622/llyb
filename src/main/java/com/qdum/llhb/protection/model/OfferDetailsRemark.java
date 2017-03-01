package com.qdum.llhb.protection.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class OfferDetailsRemark extends Model<OfferDetailsRemark> {
	/**
	 * +------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| remark_id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| header_id        | int(11)       | NO   |     | NULL    |                |
| lines_id         | int(11)       | NO   |     | NULL    |                |
| detail_id        | int(11)       | YES  |     | NULL    |                |
| header_type_name | varchar(2000) | YES  |     | NULL    |                |
| lines_type_name  | varchar(2000) | YES  |     | NULL    |                |
| detail_type_name | varchar(2000) | YES  |     | NULL    |                |
| check_type       | varchar(64)   | NO   |     | 1       |                |
| area_id          | bigint(12)    | YES  |     | NULL    |                |
| area_parent_id   | bigint(12)    | YES  |     | NULL    |                |
| area_parent_ids  | varchar(255)  | YES  |     | NULL    |                |
| remark           | varchar(4000) | NO   |     | NULL    |                |
| create_by        | varchar(64)   | NO   |     | NULL    |                |
| create_time      | varchar(64)   | NO   |     | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+
	 */
	private static final long serialVersionUID = 1L;
	public static OfferDetailsRemark dao = new OfferDetailsRemark();
	/**
	 * 取信息
	 */
	public Record getRecord(String hid,String lid,String values){
		String sql = "SELECT * FROM t_offer_detail_remark m WHERE m.header_id= '"+hid+"' and m.lines_id='"+lid+"' and m.check_type='"+values+"'";
		return Db.findFirst(sql);
	}
}
