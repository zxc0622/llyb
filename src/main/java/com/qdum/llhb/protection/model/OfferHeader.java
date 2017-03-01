package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class OfferHeader extends Model<OfferHeader> {
	/**
	 * +------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| header_id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| header_type_name | varchar(2000) | NO   |     | NULL    |                |
| remark           | varchar(2000) | YES  |     | NULL    |                |
| create_by        | varchar(64)   | NO   |     | NULL    |                |
| create_time      | datetime      | NO   |     | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+
5 rows in set
	 */
	private static final long serialVersionUID = 1L;
	public static OfferHeader dao = new OfferHeader();
	/**
	 * 取所有
	 */
	public List<Record> getAll(){
		String sql = "SELECT h.header_id as hid,h.header_type_name as hname,h.remark,h.create_by as hcb,h.create_time as hct FROM t_offer_header h ";
		return Db.find(sql);
	}
}
