package com.qdum.llhb.protection.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;

public class EqEia extends Model<EqEia> {
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
| pro_line    | varchar(50)  | YES  |     | NULL    |                |
| pro_detail  | varchar(50)  | YES  |     | NULL    |                |
| pro_name    | varchar(100) | YES  |     | NULL    |                |
| appraise    | tinyint(4)   | YES  |     | NULL    |                |
| create_by   | bigint(20)   | YES  |     | NULL    |                |
| create_date | datetime     | YES  |     | NULL    |                |
| del_flag    | tinyint(1)   | YES  |     | 0       |                |
+-------------+--------------+------+-----+---------+----------------+
	 */
	private static final long serialVersionUID = 1L;
	public static EqEia dao = new EqEia();
	/**
	 * 取信息
	 */
	public Record getByRemardAndEia(String pid,String remarkid){
		String sql = "SELECT d.*,r.*,r.remark as reremark,a.`name` as aname,aa.`name` AS aaname,h.header_type_name as hname,ssa.`name` as ssaname FROM eq_eia_record d LEFT JOIN t_offer_detail_remark r on d.pro_detail= r.remark_id LEFT JOIN sys_area a on d.prov_id=a.id LEFT JOIN sys_area aa on aa.id=d.city_id LEFT JOIN sys_area ssa on ssa.id=d.region_id and ssa.del_flag='0' LEFT JOIN t_offer_header h on d.pro_header=h.header_id WHERE d.id='"+pid+"' and d.del_flag='0'";
		return Db.findFirst(sql);
	}
	/**
	 * 当日注册的条数
	 */
	public Record getEqCount(){
		String sql = "SELECT COUNT(*) as eqcount FROM eq_eia_record e WHERE LEFT(e.create_date,10)=CURDATE()";
		return Db.findFirst(sql);
	}
	/**
	 * 环评报价
	 */
	public Page<Record> getComplex(int pageNumber,int pageSize,String leibie,String title){
		String sql = "";
		if(leibie != null &&leibie.equals("1")){
			sql = "  FROM (SELECT @num :=1 AS num,e.id as eid,e.tel,e.name,e.create_date as date, e.pro_name,e.comp_name,h.header_type_name AS hname,a.`name` as aname,aa.`name` as aaname,ssa.`name` as ssaname FROM "+
				" eq_eia_record e   LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa"+
				" ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN sys_area ssa on ssa.id=e.region_id and ssa.del_flag='0' LEFT JOIN t_offer_header h on h.header_id=e.pro_header  WHERE  e.del_flag='0' and e.pro_name is not NULL) as m";
		}else if(leibie != null &&leibie.equals("2")){
			sql=" FROM (SELECT @num :=2 AS num,e.id as eid,e.tel,e.name,e.create_date as date,e.pro_name,e.comp_name,h.Survey_header_type_name as hname,a.`name` as aname,aa.`name` as"+
				" aaname,ssa.`name` as ssaname FROM eq_monitor_record e  LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN sys_area ssa on ssa.id=e.region_id and ssa.del_flag='0' LEFT JOIN"+
				"  t_survey_header h ON h.Survey_header_id = e.pro_header WHERE  e.del_flag='0' and e.pro_name is not NULL) as m";
		}else {
			sql ="  FROM (SELECT 1 AS num,e.id as eid,e.tel,e.name,e.create_date as date, e.pro_name,e.comp_name,h.header_type_name AS hname,a.`name` as aname,aa.`name` as aaname,ssa.`name` as ssaname FROM "+
					" eq_eia_record e   LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa"+
					" ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN sys_area ssa on ssa.id=e.region_id and ssa.del_flag='0' LEFT JOIN t_offer_header h on h.header_id=e.pro_header  WHERE  e.del_flag='0' and e.pro_name is not NULL"+
					" UNION SELECT 2 AS num,e.id as eid,e.tel,e.name,e.create_date as date,e.pro_name,e.comp_name,h.Survey_header_type_name as hname,a.`name` as aname,aa.`name` as"+
					" aaname,ssa.`name` as ssaname FROM eq_monitor_record e  LEFT JOIN sys_area a  on a.id=e.prov_id and a.del_flag='0' LEFT JOIN sys_area aa ON aa.id=e.city_id AND aa.del_flag='0' LEFT JOIN sys_area ssa on ssa.id=e.region_id and ssa.del_flag='0' LEFT JOIN"+
					"  t_survey_header h ON h.Survey_header_id = e.pro_header WHERE  e.del_flag='0' and e.pro_name is not NULL) as m";
		}
		if(title != null && !title.equals("")){
			sql +="  where m.pro_name LIKE '%"+title+"%' or m.comp_name LIKE  '%"+title+"%' or m.hname LIKE '%"+title+"%' or m.aname LIKE '%"+title+"%' or m.aaname LIKE '%"+title+"%' or m.name LIKE '%"+title+"%'";
		}
		sql+="  ORDER BY m.date desc";
		return Db.paginate(pageNumber, pageSize, "SELECT * ", sql);
 
	}
}
