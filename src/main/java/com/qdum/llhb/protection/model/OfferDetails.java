package com.qdum.llhb.protection.model;

import java.util.List;

import org.apache.regexp.recompile;

import schemasMicrosoftComVml.STTrueFalse;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class OfferDetails extends Model<OfferDetails> {
	/**
	 * +------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| detail_id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| header_id        | int(11)       | YES  |     | NULL    |                |
| lines_id         | int(11)       | YES  |     | NULL    |                |
| detail_type_name | varchar(2000) | NO   |     | NULL    |                |
| type_id          | int(11)       | NO   |     | NULL    |                |
| order_by         | int(11)       | YES  |     | NULL    |                |
| remark           | varchar(2000) | YES  |     | NULL    |                |
| create_by        | varchar(64)   | NO   |     | NULL    |                |
| create_time      | varchar(100)  | NO   |     | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+
	 */
	private static final long serialVersionUID = 1L;
	public static OfferDetails dao = new OfferDetails();
	/**
	 * 根据head和line取detail
	 */
	public List<Record> getByHeadAndLine(int head,int line){
		String sql = "SELECT d.*,d.type_id as tid,d.detail_type_name as dname FROM t_offer_detail d WHERE d.header_id=? AND d.lines_id=? order by d.order_by";
		return Db.find(sql,head,line);
	}
	public List<Record> getByHeadAndLine(String head,String line){
		String sql = "SELECT d.*,d.type_id as tid,d.detail_type_name as dname FROM t_offer_detail d WHERE d.header_id=? AND d.lines_id=? order by d.order_by";
		return Db.find(sql,head,line);
	}
	public List<Record> getByDetailsID(String ids){
		String sql = "SELECT d.* FROM t_offer_detail d WHERE d.detail_id IN ("+ids+")";
		return Db.find(sql);
	}
	public Record getByDetail(String id){
		String sql = "SELECT d.* FROM t_offer_detail d WHERE d.detail_id ='"+id+"'";
		return Db.findFirst(sql);
	}
}
