package com.qdum.llhb.protection.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class EqMonitor extends Model<EqMonitor> {
	/**
	 * +-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| name        | varchar(30)  | YES  |     | NULL    |                |
| tel         | varchar(30)  | YES  |     | NULL    |                |
| comp_name   | varchar(100) | YES  |     | NULL    |                |
| remarks     | varchar(200) | YES  |     | NULL    |                |
| prov_id     | bigint(20)   | YES  |     | NULL    |                |
| city_id     | bigint(20)   | YES  |     | NULL    |                |
| region_id   | bigint(20)   | YES  |     | NULL    |                |
| pro_header  | varchar(50)  | YES  |     | NULL    |                |
| pro_lines   | varchar(50)  | YES  |     | NULL    |                |
| pro_details | varchar(50)  | YES  |     | NULL    |                |
| pro_name    | varchar(100) | YES  |     | NULL    |                |
| amount      | bigint(20)   | YES  |     | NULL    |                |
| appraise    | tinyint(4)   | YES  |     | NULL    |                |
| create_by   | bigint(20)   | YES  |     | NULL    |                |
| create_date | datetime     | YES  |     | NULL    |                |
| del_flag    | tinyint(1)   | YES  |     | 0       |                |
+-------------+--------------+------+-----+---------+----------------+
17 rows in set
	 */
	private static final long serialVersionUID = 1L;
	public static EqMonitor dao = new EqMonitor();
	/**
	 * 取信息
	 */
	public Record getByRemardAndEia(String pid,String remarkid){
		String sql = "SELECT d.*,a.`name` as aname,aa.`name` AS aaname,ssa.`name` as ssaname,h.Survey_header_type_name as hname FROM eq_monitor_record d  LEFT JOIN sys_area a on d.prov_id=a.id LEFT JOIN sys_area aa on aa.id=d.city_id LEFT JOIN sys_area ssa on ssa.id=d.region_id and ssa.del_flag='0' LEFT JOIN t_survey_header h ON h.Survey_header_id=d.pro_header  WHERE d.id='"+pid+"' and d.del_flag='0'";
		return Db.findFirst(sql);
	}
}
