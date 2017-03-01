package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class SurveyDetails extends Model<SurveyDetails> {
/**
 * +-------------------------+---------------+------+-----+---------+----------------+
| Field                   | Type          | Null | Key | Default | Extra          |
+-------------------------+---------------+------+-----+---------+----------------+
| Survey_detail_id        | int(11)       | NO   | PRI | NULL    | auto_increment |
| Survey_header_id        | int(11)       | YES  |     | NULL    |                |
| Survey_lines_id         | int(11)       | YES  |     | NULL    |                |
| Survey_detail_type_name | varchar(2000) | NO   |     | NULL    |                |
| amount                  | decimal(9,2)  | NO   |     | NULL    |                |
| order_by                | int(11)       | NO   |     | NULL    |                |
| area_id                 | bigint(12)    | YES  |     | NULL    |                |
| area_parent_id          | bigint(12)    | YES  |     | NULL    |                |
| area_parent_ids         | varchar(255)  | YES  |     | NULL    |                |
| remark                  | varchar(2000) | YES  |     | NULL    |                |
| create_by               | varchar(64)   | YES  |     | NULL    |                |
| create_time             | varchar(64)   | YES  |     | NULL    |                |
| extend1                 | varchar(100)  | YES  |     | NULL    |                |
| extend2                 | varchar(100)  | YES  |     | NULL    |                |
| extend3                 | varchar(100)  | YES  |     | NULL    |                |
+-------------------------+---------------+------+-----+---------+----------------+
 */
	private static final long serialVersionUID = 1L;
	public static SurveyDetails dao = new SurveyDetails();
	/**
	 * 根据head和line取detail
	 */
	public List<Record> getByHeadAndLine(String head,String line){
		String sql = "SELECT d.* FROM t_survey_detail d WHERE d.Survey_header_id=? AND d.Survey_lines_id in ("+line+") order by d.order_by";
		return Db.find(sql,head);
	}
	public List<Record> getByDetailsID(String ids){
		String sql = "SELECT d.* FROM t_survey_detail d WHERE d.Survey_detail_id IN ("+ids+")";
		return Db.find(sql);
	}
	public Record getByDetail(String id){
		String sql = "SELECT d.* FROM t_survey_detail d WHERE d.detail_id ='"+id+"'";
		return Db.findFirst(sql);
	}
	/**
	 * 汇总价格
	 */
	public Record getMoney(String details){
		String sql = "SELECT sum(d.amount) as money FROM t_survey_detail d WHERE d.Survey_detail_id IN ("+details+")";
		return Db.findFirst(sql);
	}
}
