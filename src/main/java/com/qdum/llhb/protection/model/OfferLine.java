package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class OfferLine extends Model<OfferLine> {
/**
 * +-----------------+---------------------------+------+-----+---------+----------------+
| Field           | Type                      | Null | Key | Default | Extra          |
+-----------------+---------------------------+------+-----+---------+----------------+
| lines_id        | int(11)                   | NO   | PRI | NULL    | auto_increment |
| header_id       | int(11) unsigned zerofill | YES  |     | NULL    |                |
| lines_type_name | varchar(2000)             | NO   |     | NULL    |                |
| order_by        | int(11)                   | YES  |     | NULL    |                |
| remark          | varchar(2000)             | YES  |     | NULL    |                |
| create_by       | varchar(64)               | NO   |     | admin   |                |
| create_time     | datetime                  | NO   |     | NULL    |                |
+-----------------+---------------------------+------+-----+---------+----------------+
 */
	private static final long serialVersionUID = 1L;
	public static OfferLine dao = new OfferLine();
	/**
	 * 取行信息
	 */
	public List<Record> getByHeadId(String headid){
		String sql = "SELECT l.lines_id as lid,l.lines_type_name as lname FROM t_offer_lines l WHERE l.header_id='"+headid+"'";
		return Db.find(sql);
	}
}
