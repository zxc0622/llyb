package com.qdum.llhb.backmana.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 固废供应信息表
 * 
 * @author zhangxm
 */
public class SupplyInfo extends Model<SupplyInfo> {
	private static final long serialVersionUID = 1L;
	public static SupplyInfo dao = new SupplyInfo();
	/**
	 * 根据条件获取所有的环保需求,两个参数均为null查询所有
	 * @param date 
	 * @param remarks 
	 * @return
	 */
	public List<Record> getSomeSupplys(String date,String remarks,String trade_status) {
		String sqlDate =  " and tr.create_date like '"+date+"%' ";
		String sqlRemarks = " and tr.remarks like '%"+remarks+"%' ";
		String sqlStatus = " and tr.trade_status= '"+trade_status+"' ";
		String orderBy = " order by tr.create_date desc";
		StringBuffer sql = new StringBuffer("select tr.* from t_requirement tr where tr.del_flag=0  ");
		if (date!=null && date.length()>0) {
			sql.append(sqlDate);
		}
		if(remarks!=null && remarks.length()>0){
			sql.append(sqlRemarks);
		}
		if(trade_status!=null && trade_status.length()>0){
			sql.append(sqlStatus);
		}
		sql.append(orderBy);
		return Db.find(sql.toString());
	}
	
	/**
	 * 分页查询需求
	 * @param provinceName 省名称
	 * @param cityName 市名称
	 * @param remarks 需求的分类
	 * @param createDate 发布日期，格式yyyy-MM-dd
	 * @param pageNumber 页码
	 * @param pageSize 页面大小
	 * @return
	 */
	public Page<Record> getSomeSupplysByPage(String provinceName, String cityName, String remarks, String createDate, int pageNumber, int pageSize) {
		String select = "SELECT	*,date_format(create_date, '%Y-%m-%d') AS ctime ";
		String sqlExceptSelect = " FROM t_requirement WHERE del_flag = 0"
				+ " AND ( source_flag = 1 OR source_flag = 2 )"
				+ " AND finsh_flag = 0"
				+ " AND ( push_flag = 0 OR push_overdue_date < NOW())";
		if(StringUtils.isNotBlank(provinceName) && StringUtils.isNotBlank(cityName)){
			sqlExceptSelect = sqlExceptSelect + " AND ( province_name LIKE '%"+provinceName+"%' AND city_name LIKE '%"+cityName+"%' )";
		}
		if(StringUtils.isNotBlank(remarks)){
			sqlExceptSelect = sqlExceptSelect + " AND remarks LIKE '%"+remarks+"%'";
		}
		if(StringUtils.isNotBlank(createDate)){
			String minDate = createDate + " 00:00:00";
			String maxDate = createDate + " 23:59:59";
			sqlExceptSelect = sqlExceptSelect + " AND ( create_date >= '"+minDate+"' AND create_date <= '"+maxDate+"' )";
		}
		sqlExceptSelect = sqlExceptSelect + " ORDER BY create_date DESC";
		
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	
	/**
	 * 未通过，已发布，审核中
	 */
	public List<SupplyInfo> getSolids(long id, String status, int pageNumber, int pageSize, String firstType,
			String secondType, String title) {
		String sql = "SELECT s.*,d.`name` dname,p.`name` pname,IF(IFNULL(s.update_date,'') > s.create_date,s.update_date,s.create_date) as time "
				+ "FROM inma_supply_info s " + "LEFT JOIN sys_dict_pcr d on s.info_type_first=d.id "
				+ "LEFT JOIN sys_dict_pcr p on s.info_type_second=p.id " + "WHERE s.del_flag='0' AND s.create_by='" + id
				+ "' AND s.sta='" + status + "' ";
		if (status.equals("2")) {
			sql += "AND s.past_date >= NOW() ";
		}
		if (!firstType.equals("") && firstType != null && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!secondType.equals("") && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		if (!title.equals("") && title != null && !title.equals("undefined")) {
			sql += "and s.info_title like'%" + title + "%'";
		}
		sql += "ORDER BY time desc limit " + (pageNumber - 1) * pageSize + "," + pageSize;
		return this.find(sql);
	}

	/**
	 * 获取某种状态下的总条数
	 */
	public SupplyInfo getCount(long id, String status, String firstType, String secondType, String title) {
		String sql = "SELECT COUNT(s.id) AS count FROM inma_supply_info s WHERE s.del_flag='0' AND s.create_by='" + id
				+ "' AND s.sta='" + status + "' ";
		if (status.equals("2")) {
			sql += "AND s.past_date >= NOW() ";
		}
		if (!firstType.equals("") && firstType != null && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!secondType.equals("") && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		if (!title.equals("") && title != null && !title.equals("undefined")) {
			sql += "and s.info_title like'%" + title + "%'";
		}
		return this.findFirst(sql);
	}

	/**
	 * 已过期,只显示已发布即状态为2的
	 */
	public List<SupplyInfo> getSolids(long id, int pageNumber, int pageSize, String firstType, String secondType,
			String title) {
		String sql = "SELECT s.*,d.`name` dname,p.`name` pname,IF(IFNULL(s.update_date,'') > s.create_date,s.update_date,s.create_date) as time "
				+ "FROM inma_supply_info s " + "LEFT JOIN sys_dict_pcr d on s.info_type_first=d.id "
				+ "LEFT JOIN sys_dict_pcr p on s.info_type_second=p.id " + "WHERE s.del_flag='0' AND s.create_by='" + id
				+ "' AND s.past_date < NOW() AND s.sta='2' ";
		if (!firstType.equals("") && firstType != null && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!secondType.equals("") && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		if (!title.equals("") && title != null && !title.equals("undefined")) {
			sql += "and s.info_title like'%" + title + "%'";
		}
		sql += "ORDER BY time desc limit " + (pageNumber - 1) * pageSize + "," + pageSize;
		return this.find(sql);
	}

	/**
	 * 获取已过期的总条数
	 * 
	 * @return
	 */
	public SupplyInfo getCount(long id, String firstType, String secondType, String title) {
		String sql = "SELECT COUNT(s.id) AS count FROM inma_supply_info s WHERE s.del_flag='0' AND s.create_by='" + id
				+ "' AND s.past_date < NOW() AND s.sta='2'";
		if (!firstType.equals("") && firstType != null && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!secondType.equals("") && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		if (!title.equals("") && title != null && !title.equals("undefined")) {
			sql += "and s.info_title like'%" + title + "%'";
		}
		return this.findFirst(sql);
	}

	/**
	 * 根据id获取信息
	 */
	public List<Record> getSupplyById(String id) {
		String sql = "select s.id,s.info_type_first AS tone,s.info_type_second as ttwo,s.info_title AS title,"
				+ "s.key_words AS words,s.details,s.pic1,s.pic2,s.pic3,s.past_date AS past,s.low_price AS lprice,"
				+ "s.high_price AS hprice,s.unit,s.amount,s.sta,s.page_view as pview ,d.label,c.contact,c.address,"
				+ "p.phone as phone2,p.auth_flag as telAuth,c.phone as phone1,p.real_name as realName,p.sex,u.login_name as loginName,u.id as userId,IFNULL(c.company_name,'') as yname,IFNULL(a.name,'') as pname,"
				+ "IFNULL(b.name,'') as cname,z.id as cx from inma_supply_info s "
				+ "LEFT JOIN sys_dict d ON d.value = s.unit AND d.type='unit_type' "
				+ "LEFT JOIN sys_company c ON s.create_by = c.user_id AND c.del_flag='0' "
				+ "LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "
				+ "LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "
				+ "LEFT JOIN sys_person p ON c.user_id=p.user_id AND p.del_flag='0' "
				+ "LEFT JOIN cs_manage_cer_faith z ON z.shop_id = c.id AND z.del_flag='0' "
				+ "LEFT JOIN sys_user u ON s.create_by=u.id and u.del_flag='0' " + "where s.del_flag='0' AND s.id='"
				+ id + "'";
		return Db.find(sql);
	}

	/**
	 * 供应列表
	 */
	public List<Record> getSupplys(int pageNumber, int pageSize, String firstType, String secondType, String title,
			String provId, String order) {
		String sql = "SELECT s.id,s.info_type_first,s.info_type_second,s.info_title as title, "
				+ "s.details,s.low_price as lowPrice,s.high_price as highPrice,IF(IFNULL(s.update_date,'') > s.create_date, "
				+ "s.update_date,s.create_date) as time,s.page_view, "
				+ "s.pic1,s.pic2,s.pic3,c.id as cid,c.loc_city_id,c.loc_prov_id,IFNULL(c.company_name,'') as yname, "
				+ "c.auth_flag as authFlag,c.youyi_flag as youyiFlag,p.auth_flag as xFlag,"
				+ "IFNULL(a.name,'') as pname,IFNULL(b.name,'') as cname FROM inma_supply_info s  "
				+ "LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "
				+ "LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "
				+ "LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "
				+ "LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "
				+ "LEFT JOIN inma_query_ranking r on r.rank_type='S' and r.bid_id=s.id "
				+ "WHERE s.del_flag='0' and s.sta='2' and s.past_date >= NOW() ";
		if (!"".equals(firstType) && firstType != null && !"0".equals(firstType) && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!"".equals(secondType) && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		/*
		 * if(!"".equals(title) && title != null && !title.equals("undefined")){
		 * sql +="and s.info_title like'%"+title+"%'"; }
		 */
		if (!"".equals(provId) && provId != null && !provId.equals("undefined")) {
			sql += "AND c.loc_prov_id='" + provId + "'";
		}
		sql += " AND ((r.`name` LIKE '%" + title
				+ "%' and NOW() BETWEEN r.start_time and r.end_time) or s.info_title LIKE '%" + title + "%') ";
		if (!"".equals(order) && order != null && !order.equals("undefined")) {
			sql += " ORDER BY r.bid desc," + order;
		} else {
			sql += " ORDER BY r.bid desc ";
		}
		sql += " limit " + (pageNumber - 1) * pageSize + "," + pageSize;
		return Db.find(sql);
	}

	public SupplyInfo getSupplysCount(String firstType, String secondType, String title, String provId, String order) {
		String sql = "SELECT COUNT(s.id) count FROM inma_supply_info s  "
				+ "LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "
				+ "LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "
				+ "LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "
				+ "LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "
				+ "WHERE s.del_flag='0' AND s.sta='2' and s.past_date >= NOW()";
		if (!"".equals(firstType) && firstType != null && !firstType.equals("undefined")) {
			sql += "and s.info_type_first='" + firstType + "'";
		}
		if (!"".equals(secondType) && secondType != null && !secondType.equals("undefined")) {
			sql += "and s.info_type_second='" + secondType + "'";
		}
		if (!"".equals(title) && title != null && !title.equals("undefined")) {
			sql += "and s.info_title like'%" + title + "%'";
		}
		if (!"".equals(provId) && provId != null && !provId.equals("undefined")) {
			sql += "AND c.loc_prov_id='" + provId + "'";
		}
		return this.findFirst(sql);
	}

	/**
	 * 获取某公司的其他商品
	 */
	public List<Record> getOthers(long id, long userId) {
		String sql = "SELECT s.id,s.info_title as title,s.pic1,s.pic2,s.pic3 FROM inma_supply_info s WHERE s.create_by='"
				+ userId + "' AND id !='" + id
				+ "' AND s.sta='2' and s.past_date >= NOW()  ORDER BY s.page_view desc LIMIT 0,12";
		return Db.find(sql);
	}

	/**
	 * 其他供应商相关商品
	 */
	public List<Record> getOtherComs(long sid, long firstType, long secondType, int pageSize) {
		String sql = "SELECT s.id,s.info_title as title,s.pic1,s.pic2,s.pic3,  "
				+ "IFNULL(c.company_name,'') as cname,c.auth_flag AS authFlag " + "FROM inma_supply_info s  "
				+ "LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "
				+ "WHERE s.del_flag='0' AND s.sta='2' and s.past_date >= NOW()  ";
		if (sid > -1) {
			sql += "AND s.id !='" + sid + "' ";
		}
		if (firstType > -1) {
			sql += "AND s.info_type_first='" + firstType + "' ";
		}
		if (secondType > -1) {
			sql += "AND s.info_type_second='" + secondType + "' ";
		}
		sql += "ORDER BY s.page_view desc LIMIT 0," + pageSize;
		return Db.find(sql);
	}

	/**
	 * 热门供应
	 */
	public List<Record> getHotSupply() {
		String sql = "SELECT s.id,s.info_title as title,"
				+ "IF(s.create_date>IFNULL(s.update_date,''),s.create_date,s.update_date) AS time "
				+ "FROM inma_supply_info s WHERE s.del_flag='0' " + "AND s.sta='2' ORDER BY s.page_view DESC LIMIT 0,6";
		return Db.find(sql);
	}

	/**
	 * 本月新增供求
	 */
	public Record getNewSolid() {// SUM(COUNT(s.id) )
		String sql = "SELECT SUM(aaa.n) AS num FROM (SELECT COUNT(s.id) AS n FROM inma_supply_info s "
				+ "WHERE s.create_date >=DATE_ADD(curdate(),interval -day(curdate())+1 day) "
				+ "AND s.sta='2' AND s.del_flag='0' and s.past_date >= NOW() UNION ALL SELECT COUNT(d.id) AS n "
				+ "FROM inma_demand_info d WHERE d.create_date >="
				+ "DATE_ADD(curdate(),interval -day(curdate())+1 day) AND d.sta='2' "
				+ "AND d.del_flag='0' and d.past_date >= NOW()) aaa";
		return Db.findFirst(sql);
	}

	/**
	 * 活跃供应商
	 */
	public List<Record> getActiveCompany(int pageSize) {
		String sql = "SELECT c.id,c.company_name as cname,c.logo_img as logoImg, "
				+ "COUNT(s.id) AS rank FROM inma_supply_info s INNER JOIN sys_company c "
				+ "ON s.create_by=c.user_id AND c.del_flag='0' WHERE s.sta='2' "
				+ "GROUP BY s.create_by ORDER BY rank desc limit 0," + pageSize;
		return Db.find(sql);
	}

	/**
	 * 推荐
	 */
	public List<Record> getRecommends(int pageSize) {
		String sql = "SELECT cou.id,SUM(n) AS n,p.`name` AS pname FROM "
				+ "(SELECT a.* FROM (SELECT s.info_type_second AS id,count(*) AS n "
				+ "FROM inma_supply_info s WHERE s.sta='2' AND s.past_date >= NOW() "
				+ "AND s.del_flag='0' GROUP BY s.info_type_second ORDER BY n DESC) a " + "UNION ALL  "
				+ "SELECT b.* FROM (SELECT d.info_type_second AS id,COUNT(d.id) as n  "
				+ "FROM inma_demand_info d WHERE d.sta='2' AND d.past_date >= NOW() "
				+ "AND d.del_flag='0' GROUP BY d.info_type_second ORDER BY n DESC) b) cou "
				+ "INNER JOIN sys_dict_pcr p ON cou.id=p.id AND p.del_flag='0' "
				+ "GROUP BY cou.id ORDER BY n DESC LIMIT 0," + pageSize;
		return Db.find(sql);
	}

	/**
	 * 查询所有的环保需求信息
	 * @param pageSize
	 *            环保需求信息条数
	 * @param userId
	 *            用户id
	 * @return
	 */
	public List<Record> getSupplys(int pageSize, long userId) {
//		String sql = "SELECT distinct r.*,ifnull(c.id,-1) status,ifnull(c.costs,-1) costs from t_requirement r left join sys_youyi_cost_record  c on r.id = c.hb_id and c.user_id = '"
//				+ userId + "' WHERE r.del_flag = '0' ORDER BY r.create_date desc limit 0," + pageSize;
		String sql = "SELECT distinct r.*,ifnull(c.id,-1) status,ifnull(c.costs,-1) costs "+
		" from t_requirement r "+
		" left join sys_youyi_cost_record  c "+ 
		" on r.id = c.hb_id "+
		" inner join t_requirement_company trc"+
		" on trc.requirement_id = r.id"+
		" inner join sys_user su"+
		" on su.id = trc.user_id"+
		" WHERE r.del_flag = '0' and su.id = '"+userId+"'"+
		" ORDER BY r.create_date desc limit 0," + pageSize;
		return Db.find(sql);
	}
	
	public Page<Record> getRecommendSupplys(int pageNumber, int pageSize, long userId) {
		String select = "SELECT c.id AS rid,DATE_FORMAT(c.create_date ,'%Y-%m-%d %H:%i:%S') as ctime,c.status as sta,r.* ";
		String sqlExceptSelect = "FROM t_requirement_company c"
				+ " LEFT JOIN t_requirement r ON r.id = c.requirement_id"
				+ " WHERE c.del_flag = 0 AND c.user_id = "+userId + " ORDER BY c.create_date desc";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	
	/**
	 * 已查看的环保需求信息
	 * @param pageSize 如果为负数或0,则查询所有信息
	 * @param userId
	 * @return
	 */
	public List<Record> getPaySupplys(int pageSize, long userId) {
		//String sql = "select tr.*,sycr.costs from t_requirement tr inner join sys_youyi_cost_record sycr on tr.id = sycr.hb_id where sycr.user_id = " +userId +" and tr.del_flag = '0' ORDER BY tr.create_date desc limit 0, "+pageSize;
		return getPaySupplys(pageSize, userId, null, null);
	}
	
	/**
	 * 已查看的环保需求信息
	 * @param pageSize 如果为负数或0,则查询所有信息
	 * @param userId
	 * @param date 日期
	 * @param remarks 
	 * @return
	 */
	public List<Record> getPaySupplys(int pageSize, long userId,String date, String remarks) {
		String dateWhere = " and tr.create_date like '"+date+"%' ";
		String remarksWhere = " and tr.remarks = '"+remarks +"' ";
		String orderBySql = " ORDER BY tr.create_date desc ";
		String limitSql = "limit 0, "+pageSize;
		StringBuffer sql = new StringBuffer("select tr.*,sycr.costs from t_requirement tr inner join sys_youyi_cost_record sycr on tr.id = sycr.hb_id where sycr.user_id = " +userId +" and tr.del_flag = '0' ");
		if(date!=null){
			sql.append(dateWhere);
		}
		if(remarks!=null){
			sql.append(remarksWhere);
		}
		sql.append(orderBySql);
		if(pageSize>0){
			sql.append(limitSql);
		}
		return Db.find(sql.toString());
	}
	
	/**
	 * 已查看的环保需求信息----分页
	 * @param pageNumber 页码
	 * @param pageSize 页面大小
	 * @param userId 用户id
	 * @return
	 */
	public Page<Record> getPaySupplys_v2(int pageNumber,int pageSize, long userId) {
		String select = "SELECT tr.*, sycr.costs, DATE_FORMAT( sycr.create_time, '%Y-%m-%d' ) AS stime ";
		String sqlExceptSelect = "FROM t_requirement tr"
								+ " INNER JOIN sys_youyi_cost_record sycr ON tr.id = sycr.hb_id"
								+ " WHERE sycr.user_id = ? AND tr.del_flag = '0'"
								+ " ORDER BY sycr.create_time DESC";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect,userId);
	}
	
	
	/**
	 * 根据用户id查询,用户发布的环保需求
	 * 
	 * @param pageSize 如果为负数或0,查询所有信息
	 * @param userId
	 * @return
	 */
	public List<Record> getMySupplys(int pageSize, long userId) {
		return getMySupplys(pageSize, userId, null, null);
	}
	
	/**
	 * 根据用户id查询,用户发布的环保需求
	 * @param pageSize 如果为负数或0,查询所有信息
	 * @param userId
	 * @param date
	 * @param remarks
	 * @return
	 */
	public List<Record> getMySupplys(int pageSize, long userId, String date, String remarks) {
		String dateWhere = " and tr.create_date like '"+date+"%' ";
		String remarksWhere = "and tr.remarks = '"+remarks +"' ";
		String orderBySql = " ORDER BY tr.create_date desc ";
		String limitSql = " limit 0 ," + pageSize;
		StringBuffer sql = new StringBuffer("select tr.* from sys_person sp inner join sys_user su on su.id = sp.user_id inner join t_requirement tr on sp.phone = tr.phone where sp.user_id = " +userId +" and tr.del_flag = '0' ");
		if(date!=null){
			sql.append(dateWhere);
		}
		if(remarks!=null){
			sql.append(remarksWhere);
		}
		sql.append(orderBySql);
		
		if(pageSize>0){
			sql.append(limitSql);
		}
		return Db.find(sql.toString());
	}
	
	/**
	 * 根据用户id查询用户发布的环保需求-----分页
	 * @param pageNumber 页码
	 * @param pageSize 页面大小
	 * @param userId 用户id
	 * @param remarks 需求类型
	 * @param status 需求状态
	 * @param time 发布日期，格式：yyyy-MM-dd
	 * @return
	 * @author wyp-2017年2月21日17:02:42
	 */
	public Page<Record> getMySupplys_v2(int pageNumber, int pageSize,
			long userId, String remarks, String status, String time) {
		String select = "SELECT *,DATE_FORMAT(create_date ,'%Y-%m-%d') as ctime ";
		String sqlExceptSelect = " FROM t_requirement"
				+ " WHERE create_by = "+userId+" AND del_flag = 0";
		if(StringUtils.isNotBlank(remarks)){
			sqlExceptSelect = sqlExceptSelect + " AND remarks = '"+remarks+"'";
		}
		if(StringUtils.isNotBlank(status)){
			sqlExceptSelect = sqlExceptSelect + " AND trade_status = '"+status+"'";
		}
		if(StringUtils.isNotBlank(time)){
			String minDate = time + " 00:00:00";
			String maxDate = time + " 23:59:59";
			sqlExceptSelect = sqlExceptSelect + " AND ( create_date >= '"+minDate+"' AND create_date <= '"+maxDate+"' )";
		}
		sqlExceptSelect = sqlExceptSelect + " ORDER BY create_date DESC";
				
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}

	/**
	 * 查询用户发布的所有环保需求
	 * 
	 * @param userId
	 * @return
	 */
	public int getCountSupplys(long userId) {
		String sql = "select count(*) total from sys_person sp inner join sys_user su on sp.user_id=su.id "
				+ "inner join t_requirement tr on sp.phone = tr.phone where sp.user_id='" + userId
				+ "' and tr.del_flag='0'";
		return Integer.parseInt(Db.findFirst(sql).get("total").toString());
	}
	/**
	 * 查询查看当前用户环保需求记录的其他公司
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<Record> getSeenSupplys(long userId) {
		String sql = "select distinct tr.id id, tr.remarks,tr.name,tr.create_date,sycr.user_id,sc.company_name,sc.id company_id from sys_person sp "
				+ "inner join sys_user su on sp.user_id = su.id inner join t_requirement tr on sp.phone = tr.phone "
				+ "inner join sys_youyi_cost_record sycr on tr.id = sycr.hb_id inner join sys_company sc on sycr.user_id=sc.user_id where su.id='"
				+ userId + "' and tr.del_flag='0' ";
		return Db.find(sql);
	}
	
	/**
	 * 查询查看当前用户环保需求记录的其他公司----分页
	 * @param pageNumber 页码
	 * @param pageSize	页面大小
	 * @param userId 用户id
	 * @return
	 */
	public Page<Record> getSeenSupplys_v2(int pageNumber, int pageSize, long userId) {
		String select = "SELECT DISTINCT tr.id id, tr.remarks, tr.requirement_describe,"
				+ " tr.create_date, DATE_FORMAT(tr.create_date, '%Y-%m-%d') AS ctime,"
				+ " sycr.create_time, DATE_FORMAT( sycr.create_time, '%Y-%m-%d' ) AS cktime,"
				+ " sycr.user_id, sc.company_name, sc.id company_id";
		String sqlExceptSelect = "FROM t_requirement tr"
				+ " INNER JOIN sys_user su ON tr.create_by = su.id"
				+ " INNER JOIN sys_youyi_cost_record sycr ON tr.id = sycr.hb_id"
				+ " INNER JOIN sys_company sc ON sycr.user_id = sc.user_id"
				+ " WHERE su.id = ? AND tr.del_flag = '0'"
				+ " ORDER BY sycr.create_time DESC";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect,userId);
	}

	/**
	 * 根据非环保公司的环保需求,推荐的公司名称
	 * 
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<Record> getReCommendCompanys(int pageSize, long userId) {
		String sql = "select distinct sc.id id,sc.user_id user_id, sc.company_name company_name,tr.create_date " + "from sys_user su "
				+ "inner join sys_person sp  " + "on su.id=sp.user_id " + "inner join t_requirement tr "
				+ "on sp.phone = tr.phone " + "inner join t_requirement_company trc " + "on tr.id=trc.requirement_id "
				+ "inner join sys_company sc " + "on trc.user_id = sc.user_id " + "where su.id='" + userId
				+ "' ORDER BY tr.create_date desc limit 0," + pageSize;
		return Db.find(sql);
//		String sql = "select distinct sc.id id,sc.user_id user_id, sc.company_name company_name " + "from sys_user su "
//				+ "inner join sys_person sp  " + "on su.id=sp.user_id " + "inner join t_requirement tr "
//				+ "on sp.phone = tr.phone " + "inner join t_requirement_company trc " + "on tr.id=trc.requirement_id "
//				+ "inner join sys_company sc " + "on trc.user_id = sc.user_id " + "where su.id='" + userId
//				+ "' ORDER BY tr.create_date desc limit 0," + pageSize;
//		return Db.find(sql);
	}
	/**
	 * 查询信息状态的条数
	 * @param userId
	 * @return
	 */
	public List<Record> getSupplyTradeStatus(long userId){
		String sql = "select tr.trade_status,count(tr.id) num from sys_person sp inner join sys_user su on sp.user_id = su.id "
				+"inner join t_requirement tr on sp.phone = tr.phone where tr.del_flag='0' and su.id = '"+userId+"' group by tr.trade_status";
		
		return Db.find(sql);
	}
	
	
	/**
	 * 最新供应
	 * 
	 * @param pageSize
	 * @return
	 */
	public List<Record> getNewSupplys(int pageSize, long userId) {
		String sql = "SELECT d.id,d.info_title as title,  "
				+ "IF(d.create_date>IFNULL(d.update_date,''),d.create_date,d.update_date) AS time "
				+ "FROM inma_supply_info d  " + "WHERE d.del_flag='0'AND d.sta='2' and d.past_date >= NOW() ";
		if (userId > 0) {
			sql += "AND d.create_by='" + userId + "'";
		}
		sql += "ORDER BY time DESC LIMIT 0," + pageSize;
		return Db.find(sql);
	}

	/**
	 * 是否发布供应
	 */
	public long getSupply(long userId) {
		String sql = "SELECT count(d.id) as n " + "FROM inma_supply_info d  "
				+ "WHERE d.del_flag='0'AND d.sta='2' and d.past_date >= NOW() AND d.create_by='" + userId + "'";
		return Db.find(sql).get(0).getLong("n");
	}

	/**
	 * 首页-供求动态
	 */
	public List<Record> getNewSuAndDe(int pageSize) {
		String sql = "SELECT ds.id,ds.type,ds.time,ds.info_title,a.`name` AS pname FROM "
				+ "(SELECT 'd' as type,d.*,IF(d.create_date>IFNULL(d.update_date,''),"
				+ "d.create_date,d.update_date) AS time FROM inma_demand_info d "
				+ "WHERE d.del_flag='0' AND d.past_date>=NOW() AND d.sta='2' " + "UNION "
				+ "SELECT 's' as type,s.*,IF(s.create_date>IFNULL(s.update_date,''),"
				+ "s.create_date,s.update_date) AS time FROM inma_supply_info s "
				+ "WHERE s.del_flag='0' AND s.past_date>=NOW() AND s.sta='2') ds "
				+ "INNER JOIN sys_company c ON ds.create_by=c.user_id AND c.del_flag='0' "
				+ "INNER JOIN sys_area a ON c.loc_prov_id=a.id AND a.del_flag='0' " + "ORDER BY ds.time desc LIMIT 0,"
				+ pageSize;
		return Db.find(sql);
	}

	/**
	 * 数据收集 供应列表
	 */
	public Page<Record> getCheckLists(int pageNumber, int pageSize, String leibie, String title, String con) {
		String sql = " FROM inma_supply_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"
				+ " LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second LEFT JOIN inma_supply_approve da on idi.id=da.supply_id "
				+ "LEFT JOIN sys_user AS u ON idi.create_by=u.id AND u.del_flag='0' "
				+ "LEFT JOIN sys_person AS per ON idi.create_by=per.user_id AND per.del_flag='0' "
				+ "LEFT JOIN sys_company AS com ON idi.create_by=com.user_id AND com.del_flag='0' "
				+ "WHERE idi.del_flag='0' and idi.sta=? ";
		if (leibie != null && !leibie.equals("")) {
			sql += " and idi.info_type_first='" + leibie + "'";
		}
		if (title != null && !title.equals("")) {
			sql += " and idi.info_title LIKE '%" + title + "%'";
		}
		if (con.equals("1")) {
			sql += " ORDER BY IFNULL(idi.update_date,idi.create_date) desc";
		} else {
			sql += " ORDER BY IFNULL(da.create_date,idi.create_date) desc";
		}
		return Db.paginate(pageNumber, pageSize,
				"SELECT idi.id as iid, IFNULL(idi.update_date,idi.create_date) as time, idi.*,p.`name` as pname,pp.name as ppname,IFNULL(da.create_date,idi.create_date) as dates, IF(com.type IS NULL OR com.type = '',u.login_name,com.company_name) AS uname,"
						+ "IF(com.type IS NULL OR com.type = '','个人','企业') AS type,"
						+ "IF(per.auth_flag=1,'ge','geno') AS pauth," + "IF(com.auth_flag=1,'qi','qino') AS cauth",
				sql, con);
	}

	public Page<Record> getCheckListsAll(int pageNumber, int pageSize, String leibie, String title) {
		String sql = " FROM inma_supply_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"
				+ " LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second LEFT JOIN inma_supply_approve da on idi.id=da.supply_id "
				+ "LEFT JOIN sys_user AS u ON idi.create_by=u.id AND u.del_flag='0' "
				+ "LEFT JOIN sys_person AS per ON idi.create_by=per.user_id AND per.del_flag='0' "
				+ "LEFT JOIN sys_company AS com ON idi.create_by=com.user_id AND com.del_flag='0' "
				+ "WHERE idi.del_flag='0'";
		if (leibie != null && !leibie.equals("")) {
			sql += " and idi.info_type_first='" + leibie + "'";
		}
		if (title != null && !title.equals("")) {
			sql += " and idi.info_title LIKE '%" + title + "%'";
		}
		sql += " ORDER BY IFNULL(da.create_date,idi.create_date) desc";
		return Db.paginate(pageNumber, pageSize,
				"SELECT idi.id as iid, IFNULL(idi.update_date,idi.create_date) as time, idi.*,p.`name` as pname,pp.name as ppname,IFNULL(da.create_date,idi.create_date) as dates, IF(com.type IS NULL OR com.type = '',u.login_name,com.company_name) AS uname,"
						+ "IF(com.type IS NULL OR com.type = '','个人','企业') AS type,"
						+ "IF(per.auth_flag=1,'ge','geno') AS pauth,"
						+ "IF(com.auth_flag=1,'qi','qino') AS cauth,idi.sta",
				sql);
	}

	/**
	 * 根据所有记录
	 */
	public Page<Record> getFullRecords(int pageNumber, int pageSize, String first, String second, String title,
			int order, Long id) {
		String sql = "FROM inma_supply_info idi LEFT JOIN sys_dict_pcr sdp ON (sdp.id=idi.info_type_first) LEFT JOIN sys_dict_pcr sdd ON(sdd.id=idi.info_type_second)  LEFT JOIN sys_user su on(idi.create_by = su.id) WHERE idi.del_flag = '0' and sdp.type='supply_type' and su.id="
				+ id;
		Page<Record> records = null;
		if (order == 0) {
			// 已发布
			sql += " and idi.sta= '2'";
		} else if (order == 1) {
			// 审核中
			sql += " and idi.sta= '1'";
		} else if (order == 2) {
			// 未通过
			sql += " and idi.sta= '0'";
		} else if (order == 3) {
			// 已过期
			sql += " AND idi.past_date < '" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "'";
		}
		if (first != null && !first.equals("") && !first.equals("0") && !first.equals("undefined")) {
			sql += "  and idi.info_type_first=" + Long.parseLong(first);
		}
		if (second != null && !second.equals("") && !second.equals("0") && !second.equals("undefined")) {
			sql += "  and idi.info_type_second=" + Long.parseLong(second);
		}
		if (title != null && !title.equals("")) {
			sql += "  AND  idi.info_title  like '%" + title + "%' ";
		}
		sql += " GROUP BY idi.id order by idi.create_date desc";
		records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name,sdd.name as sdname ", sql);
		/*
		 * if(condition != null){ if(index==1){ sql+=
		 * "  and idi.info_type_first= ? GROUP BY idi.id order by idi.create_date desc"
		 * ; records = Db.paginate(pageNumber, pageSize,
		 * "SELECT idi.*,sdp.name ", sql,Long.parseLong(condition)); }else
		 * if(index==2){ sql+=
		 * "  and idi.info_type_second= ? GROUP BY idi.id order by idi.create_date desc"
		 * ; records = Db.paginate(pageNumber, pageSize,
		 * "SELECT idi.*,sdp.name ", sql,Long.parseLong(condition)); }else
		 * if(index==0){ sql+="  AND  ini.info_title  like '%"+condition+
		 * "%' GROUP BY idi.id order by idi.create_date desc"; records =
		 * Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name ", sql); }
		 * }else{ sql+=" GROUP BY idi.id order by idi.create_date desc"; records
		 * = Db.paginate(pageNumber, pageSize,
		 * "SELECT idi.*,sdp.name,sdd.name as sdname ", sql); }
		 */
		return records;
	}

	public SupplyInfo getById(int id) {
		String sql = "SELECT * FROM inma_demand_info WHERE del_flag='0' and id=?";
		return SupplyInfo.dao.findFirst(sql, id);
	}

	/**
	 * 数据收集供应列表
	 *
	 */
	public Page<Record> getDataColectionListsAll(int pageNumber, int pageSize, String leibie, String title) {
		String sql = " FROM inma_supply_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"
				+ " LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second  "
				+ "LEFT JOIN sys_user AS u ON idi.create_by=u.id AND u.del_flag='0' "
				+ "LEFT JOIN sys_person AS per ON idi.create_by=per.user_id AND per.del_flag='0' "
				+ "LEFT JOIN sys_company AS com ON idi.create_by=com.user_id AND com.del_flag='0' "
				+ "WHERE idi.del_flag='0'";
		if (leibie != null && !leibie.equals("")) {
			sql += " and idi.info_type_first='" + leibie + "'";
		}
		if (title != null && !title.equals("")) {
			sql += " and idi.info_title LIKE '%" + title + "%'";
		}
		sql += " ORDER BY IFNULL(idi.update_date,idi.create_date) desc";
		return Db.paginate(pageNumber, pageSize,
				"SELECT idi.id as iid, IFNULL(idi.update_date,idi.create_date) as time, idi.*,p.`name` as pname,pp.name as ppname, IF(com.type IS NULL OR com.type = '',u.login_name,com.company_name) AS uname,"
						+ "IF(com.type IS NULL OR com.type = '','个人','企业') AS type,"
						+ "IF(per.auth_flag=1,'ge','geno') AS pauth,"
						+ "IF(com.auth_flag=1,'qi','qino') AS cauth,idi.sta",
				sql);
	}

	/**
	 * 根据标题查询 供应
	 */
	public List<Record> searchGyName(String name) {
		String sql = "select * from inma_supply_info where del_flag='0' and sta='2' and NOW()<past_date ";
		if (name != null && !(name.equals(""))) {
			sql += " and info_title like '%" + name + "%'";
		}
		return Db.find(sql);
	}
	
	/**
	 * 查询所有remarks
	 * @return
	 */
	public List<Record> getRemarks() {
		String sql = "select distinct tr.remarks from t_requirement tr ";
		return Db.find(sql);
	}
	/**
	 * 修改环保需求信息的状态
	 * @param id
	 * @param trade_status
	 */
	public int updateTradeStatus(String id, String trade_status){
		String sql = "update t_requirement set trade_status = '"+trade_status+"' where id = '"+id+"'";
		return Db.update(sql);
	}
	/**
	 *  获取环保需求信息
	 * @param date
	 * @param remarks
	 * @param trade_status
	 * @return
	 */
	public List<Record> getAllSupplysByStatus(String date,String remarks,String trade_status) {
		String sqlDate =  " and tr.create_date like '"+date+"%' ";
		String sqlRemarks = " and tr.remarks like '%"+remarks+"%' ";
		String sqlStatus = " and tr.trade_status= '"+trade_status+"' ";
		String sqlOrderBy = " order by tr.create_date desc ";
		StringBuffer sql = new StringBuffer("select * from t_requirement tr where tr.del_flag='0'");
		if (date!=null && date.length()>0) {
			sql.append(sqlDate);
		}
		if(remarks!=null && remarks.length()>0){
			sql.append(sqlRemarks);
		}
		if(trade_status!=null && trade_status.length()>0){
			sql.append(sqlStatus);
		}
		sql.append(sqlOrderBy);
		return Db.find(sql.toString());
	}
	
}