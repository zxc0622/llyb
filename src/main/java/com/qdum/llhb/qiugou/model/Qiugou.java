package com.qdum.llhb.qiugou.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;
/**
 * 固废供应信息表
 * @author wf
 */
public class Qiugou extends Model<Qiugou>{
	private static final long serialVersionUID = 1L;
	public static Qiugou dao = new Qiugou();
	
	public static final String ID 			= "id";
	public static final String INFO_TYPE_FIRST			= "info_type_first";			//产品照片 1 2 3
	public static final String INFO_TYPE_SECOND 		= "info_type_second";
	public static final String INFO_TITLE 		= "info_title";
	public static final String KEY_WORDS 		= "key_words";
	public static final String DETAILS 		= "details";
	public static final String PIC1			= "pic1";			//产品照片 1 2 3
	public static final String PIC2 		= "pic2";
	public static final String PIC3 		= "pic3";
	public static final String PAST_DATE 	= "past_date";		//过期时间
	public static final String LOW_PRICE 	= "low_price";
	public static final String HIGH_PRICE  	= "high_price";
	public static final String UNIT  		= "unit";			//单位
	public static final String AMOUNT  		= "amount";			//产品总量
	public static final String STA  		= "sta";			//审核状态
	public static final String PAGE_VIEW  	= "page_view";		//浏览量
	public static final String CREATE_BY 	= "create_by";		//创建人
	public static final String CREATE_DATE 	= "create_date";	//创建时间
	public static final String UPDATE_BY 	= "update_by";		//修改人
	public static final String UPDATE_DATE 	= "update_date";	//修改时间
	public static final String DEL_FLAG 	= "del_flag";
	
	
	
	public int getId() {
		return getInt(ID);
	}
	public void setId(int id) {
		set(ID, id);
	}
	
	public void setInfoTypeFirst(Long picOne){
		set(INFO_TYPE_FIRST,picOne);
	}
	
	public Long getInfoTypeFirst(){
		return getLong(INFO_TYPE_FIRST);
	}
	public void setInfoTypeSecond(Long picOne){
		set(INFO_TYPE_SECOND,picOne);
	}
	
	public Long getInfoTypeSecond(){
		return getLong(INFO_TYPE_SECOND);
	}
	public void setInfoTitle(String picOne){
		set(INFO_TITLE,picOne);
	}
	
	public String getInfoTitle(){
		return get(INFO_TITLE);
	}
	public void setKeyWords(String picOne){
		set(KEY_WORDS,picOne);
	}
	
	public String getKeyWords(){
		return get(KEY_WORDS);
	}
	public void setDetails(String picOne){
		set(DETAILS,picOne);
	}
	
	public String getDetails(){
		return get(DETAILS);
	}
	
	
	
	
	
	
	public void setPicOne(String picOne){
		set(PIC1,picOne);
	}
	
	public String getPicOne(){
		return get(PIC1);
	}
	
	public void setPicTwo(String picTwo){
		set(PIC2,picTwo);
	}
	
	public String getPicTwo(){
		return get(PIC2);
	}
	
	public void setPicThree(String picThree){
		set(PIC3,picThree);
	}
	
	public String getPicThree(){
		return get(PIC3);
	}
	
	public void setPastDate(Date pastDate){
		set(PAST_DATE,pastDate);
	}
	
	public Date getPastDate(){
		return getDate(PAST_DATE);
	}
	
	/*public void setLowPrice(double lowPrice){
		set(LOW_PRICE,lowPrice);
	}
	
	public Long getLowPrice(){
		return getLong(LOW_PRICE);
	}
	
	public void setHighPrice(Long highPrice){
		set(HIGH_PRICE,highPrice);
	}
	
	public double getHighPrice(){
		return getDouble(HIGH_PRICE);
	}*/
	
	public void setUnit(int unit){
		set(UNIT,unit);
	}
	
	public String getUnit(){
		return get(UNIT);
	}
	
	public void setAmount(double amount){
		set(AMOUNT,amount);
	}
	
	public double getAmount(){
		return getDouble(AMOUNT);
	}
	
	public void setSta(int sta){
		set(STA,sta);
	}
	
	public int getSta(){
		return getInt(STA);
	}
	
	public void setPageView(long pageView){
		set(PAGE_VIEW,pageView);
	}
	
	public long getPageView(){
		return get(PAGE_VIEW);
	}
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	
	public void setCreateBy(long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public long getCreatBy(){
		return get(CREATE_BY);
	}
	
	public Date getCreateDate() {
		return (Date)get(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	
	public void setUpdateBy(Long createBy ) {
		set(UPDATE_BY,createBy);
	}
	
	public Date getUpdateDate(){
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate ){
		set(UPDATE_DATE,createDate);
	}
	
	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}
	
	public Integer getDelFlag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}
	/**
	 * 根据所有记录
	 */
	public Page<Record> getFullRecords(int pageNumber,int pageSize,String first,String second,String title,int order,Long id) {
		String sql= "FROM inma_demand_info idi LEFT JOIN sys_dict_pcr sdp ON (sdp.id=idi.info_type_first) LEFT JOIN sys_dict_pcr sdd ON(sdd.id=idi.info_type_second)  LEFT JOIN sys_user su on(idi.create_by = su.id) WHERE idi.del_flag = '0' and sdp.type='supply_type' and su.id="+id;
		Page<Record> records = null;
		if(order == 0){
			//已发布
			sql +=" and idi.sta= '2'";
		}else if(order == 1){
			//审核中
			sql +=" and idi.sta= '1'";
		}else if(order == 2){
			//未通过
			sql +=" and idi.sta= '0'";
		}else if(order == 3){
			//已过期
			sql +=" AND idi.past_date < '"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"'";
		}
		if(first != null&&!first.equals("")&&!first.equals("0")&&!first.equals("undefined")){
			sql+="  and idi.info_type_first="+Long.parseLong(first);
		}
		if(second != null&&!second.equals("")&&!second.equals("0")&&!second.equals("undefined")){
			sql+="  and idi.info_type_second="+Long.parseLong(second);
		}
		if(title != null&&!title.equals("")){
			sql+="  AND  idi.info_title  like '%"+title+"%' ";
		}
		sql+=" GROUP BY idi.id order by idi.create_date desc";
		records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name,sdd.name as sdname ", sql);
		/*if(condition != null){
			if(index==1){
				sql+="  and idi.info_type_first= ? GROUP BY idi.id order by idi.create_date desc";
				records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name ", sql,Long.parseLong(condition));
			}else if(index==2){
				sql+="  and idi.info_type_second= ? GROUP BY idi.id order by idi.create_date desc";
				records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name ", sql,Long.parseLong(condition));
			}else if(index==0){
				sql+="  AND  ini.info_title  like '%"+condition+"%' GROUP BY idi.id order by idi.create_date desc";
				records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name ", sql);
			}
		}else{
			sql+=" GROUP BY idi.id order by idi.create_date desc";
			records = Db.paginate(pageNumber, pageSize, "SELECT idi.*,sdp.name,sdd.name as sdname ", sql);
		}*/
		return records;
	}
	/**
	 * 取某条记录
	 */
	public Record getRecordById(int id) {
		String sql = "SELECT * FROM inma_demand_info WHERE del_flag='0' and id=?";
		return Db.findFirst(sql,id);
	}
	public Qiugou getById(int id) {
		String sql = "SELECT * FROM inma_demand_info WHERE del_flag='0' and id=?";
		return Qiugou.dao.findFirst(sql,id);
	}
	//求购列表
	public Page<Record> getPublishList(int pageNumber,int pageSize){
		String sql = " FROM inma_demand_info idi WHERE idi.del_flag='0' and idi.sta='2' and idi.past_date >= NOW() ORDER BY idi.create_date desc ";
		return  Db.paginate(pageNumber, pageSize, "SELECT idi.* ", sql);
	}
	public List<Record> getListPage(int pageNumber,int pageSize){
		String sql = "SELECT idi.* FROM inma_demand_info idi limit "+pageNumber*pageSize+","+pageSize;
		return Db.find(sql);
	}
	public List<Record> getBytype(long typeid){
		String sql = "SELECT idi.*,idi.create_date as icd,sdp.`name` as sdpname,sd.label,sa.`name` as saname FROM inma_demand_info idi LEFT JOIN sys_dict_pcr sdp ON(idi.info_type_first = sdp.id) LEFT JOIN sys_person sp ON(idi.create_by=sp.user_id) "+
				 " LEFT JOIN sys_area sa on(sp.loc_prov_id=sa.id) LEFT JOIN sys_dict sd ON(idi.unit=sd.`value`)  WHERE sd.type ='unit_type' AND  idi.info_type_first=? and idi.sta='2' and idi.past_date >= NOW() and idi.del_flag='0' order by idi.create_date desc";
		return Db.find(sql,typeid);
	}
	/**
	 * 查信息
	 * @param id
	 * @return
	 */
	public Record getDetails(String id){
		String sql="SELECT idi.*,su.login_name,idi.create_date as icd,sd.label,sa.`name` as saname,saa.`name` as saaname FROM inma_demand_info idi LEFT JOIN sys_company sp ON(idi.create_by=sp.user_id) "+
				"  LEFT JOIN sys_area sa on(sp.loc_prov_id=sa.id) LEFT JOIN sys_user su on su.id = idi.create_by LEFT JOIN sys_area saa on saa.id=sp.loc_city_id LEFT JOIN sys_dict sd ON(idi.unit=sd.`value`)  WHERE sd.type ='unit_type'  and idi.sta='2' and idi.del_flag='0' and idi.id='"+id+"'";
		return Db.findFirst(sql);
	}
	public List<Record> getDetails(int pageNumber,int pageSize,long usrid,int id){
		String sql = "SELECT idi.*,idi.create_date as icd,sd.label,sa.`name` as saname,saa.`name` as saaname FROM inma_demand_info idi LEFT JOIN sys_person sp ON(idi.create_by=sp.user_id) LEFT JOIN sys_area sa on(sp.loc_prov_id=sa.id) LEFT JOIN sys_area saa on saa.id=sp.loc_city_id LEFT JOIN sys_dict sd ON(idi.unit=sd.`value` AND sd.type ='unit_type')"+
				" WHERE idi.sta='2' and idi.del_flag='0'  and idi.create_by="+usrid+" and idi.id !="+id+" limit "+pageNumber*pageSize+","+pageSize;
		return Db.find(sql);
	}
	public List<Record> getDetailsOther(int pageNumber,int pageSize,long usrid){
		String sql = "SELECT idi.*,idi.create_date as icd,sd.label,sa.`name` as saname,saa.`name` as saaname,sc.auth_flag,IFNULL(sc.company_name,'') as cname FROM inma_demand_info idi LEFT JOIN sys_person sp ON(idi.create_by=sp.user_id) LEFT JOIN sys_area sa on(sp.loc_prov_id=sa.id) LEFT JOIN sys_area saa on saa.id=sp.loc_city_id LEFT JOIN sys_dict sd ON(idi.unit=sd.`value` AND sd.type ='unit_type') "+
				" 	LEFT JOIN sys_company sc ON(idi.create_by=sc.user_id and sc.del_flag='0') WHERE idi.sta='2' and idi.past_date >NOW() and idi.del_flag='0'  and idi.create_by !="+usrid+" limit "+pageNumber*pageSize+","+pageSize;
		return Db.find(sql);
	}
	/**
	 * 根据阅读量排序
	 */
	public List<Record> getByRead(){
		String sql = "SELECT * FROM inma_demand_info idi WHERE idi.del_flag='0' and idi.sta='2' ORDER BY idi.page_view DESC LIMIT 0,6";
		return Db.find(sql);
	}
	/**
	 * 取求购的公司信息
	 */
	public List<Record> getCompany(int pageNumber,int pageSize){
		String sql = "SELECT sc.*  FROM inma_demand_info idi LEFT JOIN sys_company sc on idi.create_by=sc.user_id and sc.del_flag='0' GROUP BY sc.id ORDER BY idi.create_date DESC limit 0,"+pageSize;
		return Db.find(sql);
	}
	public Record getCompanyCount(){
		String sql = "SELECT COUNT(DISTINCT(sc.id)) as id FROM inma_demand_info idi LEFT JOIN sys_company sc on idi.create_by=sc.user_id and sc.del_flag='0'";
		return Db.findFirst(sql);
	}
	/**
	 * 供应列表
	 */
	public List<Record> getDemmands(int pageNumber,int pageSize,String firstType,String secondType,String title,String provId,String order){
		String sql="SELECT s.id,s.info_type_first,s.info_type_second,s.info_title as title, "+
				"s.details,s.low_price as lowPrice,s.high_price as highPrice,IF(IFNULL(s.update_date,'') > s.create_date, "+
				"s.update_date,s.create_date) as time,s.page_view, "+
				"s.pic1,s.pic2,s.pic3,c.loc_city_id,c.loc_prov_id,IFNULL(c.company_name,'') as yname, "+
				"c.auth_flag as authFlag,c.youyi_flag as youyiFlag,p.auth_flag as xFlag,"+
				"IFNULL(a.name,'') as pname,IFNULL(b.name,'') as cname FROM inma_demmand_info s  "+
				"LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' " +
				"LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "+
				"WHERE s.del_flag='0' and s.sta='2' and s.past_date >= NOW() ";
		if(!"".equals(firstType) && firstType != null && !"0".equals(firstType) && !firstType.equals("undefined")){
			sql +="and s.info_type_first='"+firstType+"'";
		}
		if(!"".equals(secondType) && secondType != null && !secondType.equals("undefined")){
			sql +="and s.info_type_second='"+secondType+"'";
		}
		if(!"".equals(title) && title != null && !title.equals("undefined")){
			sql +="and s.info_title like'%"+title+"%'";
		}
		if(!"".equals(provId) && provId != null && !provId.equals("undefined")){
			sql +="AND c.loc_prov_id='"+provId +"'";
		}
		if(!"".equals(order) && order != null && !order.equals("undefined")){
			sql +=" ORDER BY "+order;
		}
		sql +=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		return Db.find(sql);
	}
	

	public Qiugou getDemmandCount(String firstType,String secondType,String title,String provId,String order){
		String sql="SELECT COUNT(s.id) count FROM inma_demmand_info s  "+
				"LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "+
				"LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "+
				"WHERE s.del_flag='0' AND s.sta='2' and s.past_date >= NOW()";
		if(!"".equals(firstType) && firstType != null && !firstType.equals("undefined")){
			sql +="and s.info_type_first='"+firstType+"'";
		}
		if(!"".equals(secondType) && secondType != null && !secondType.equals("undefined")){
			sql +="and s.info_type_second='"+secondType+"'";
		}
		if(!"".equals(title) && title != null && !title.equals("undefined")){
			sql +="and s.info_title like'%"+title+"%'";
		}
		if(!"".equals(provId) && provId != null && !provId.equals("undefined")){
			sql +="AND c.loc_prov_id='"+provId +"'";
		}
		return this.findFirst(sql);
	}

	/**
	 * 供求首页-求购市场 zhangxm
	 */
	public List<Record> getHotDemand(int pageSize){
		String sql="SELECT d.id,d.info_title as title,  "+
				"IF(d.create_date>IFNULL(d.update_date,''),d.create_date,d.update_date) AS time, "+
				"a.`name` as aname,b.`name` AS bname "+
				"FROM inma_demand_info d  "+
				"LEFT JOIN sys_company c ON d.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id=a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b ON c.loc_city_id=b.id AND b.del_flag='0' "+
				"WHERE d.del_flag='0'AND d.sta='2' ORDER BY d.page_view DESC LIMIT 0,"+pageSize;
		return Db.find(sql);
	}
	/**
	 * 活跃采购商 zhangxm
	 */
	public List<Record> getActiveDemand(int pageNum,int pageSize){
		String sql="SELECT c.id,c.company_name AS cname,c.logo_img AS logoImg," +
				"COUNT(d.id) AS rank FROM inma_demand_info d " +
				"left JOIN sys_company c ON d.create_by = c.user_id AND c.del_flag = '0' " +
				"WHERE d.sta = '2' GROUP BY d.create_by ORDER BY rank DESC LIMIT "+pageNum*pageSize+","+pageSize;
		return Db.find(sql);
	}
	public Record getActiveDemandCount(){
		String sql = "SELECT COUNT(t.counts) as cut FROM (SELECT COUNT(*) as counts FROM inma_demand_info d left JOIN sys_company c ON d.create_by = c.user_id AND c.del_flag = '0' WHERE d.sta = '2' GROUP BY d.create_by ) t";
		return Db.findFirst(sql);
	}
	
	public Page<Record> getActiveDemandPage(int pageNumber,int pageSize){
		String sql=" FROM inma_demand_info d " +
				"left JOIN sys_company c ON d.create_by = c.user_id AND c.del_flag = '0' " +
				"WHERE d.sta = '2' GROUP BY d.create_by ORDER BY rank DESC ";
		return Db.paginate(pageNumber, pageSize, "SELECT c.id,c.company_name AS cname,c.logo_img AS logoImg,COUNT(d.id) AS rank ", sql);
	}
	/**
	 * 活跃供应商
	 */
	public List<Record> getActiveCompany(int pageSize){
		String sql="SELECT c.id,c.company_name as cname,c.logo_img as logoImg, " +
				"COUNT(s.id) AS rank FROM inma_demand_info s INNER JOIN sys_company c " +
				"ON s.create_by=c.user_id AND c.del_flag='0' WHERE s.sta='2' " +
				"GROUP BY s.create_by ORDER BY rank desc limit 0," + pageSize;
		return Db.find(sql);
	}
	/**
	 * 供应列表
	 */
	public List<Record> getDemands(int pageNumber,int pageSize,String firstType,String secondType,String title,String provId,String order){
		String sql="SELECT s.id,s.info_type_first,s.info_type_second,s.info_title as title, "+
				"s.details,s.low_price as lowPrice,s.high_price as highPrice,IF(IFNULL(s.update_date,'') > s.create_date, "+
				"s.update_date,s.create_date) as time,s.page_view, "+
				"s.pic1,s.pic2,s.pic3,c.id as compid,c.loc_city_id,c.loc_prov_id,IFNULL(c.company_name,'') as yname, "+
				"c.auth_flag as authFlag,c.youyi_flag as youyiFlag,p.auth_flag as xFlag,"+
				"IFNULL(a.name,'') as pname,IFNULL(b.name,'') as cname FROM inma_demand_info s  "+
				"LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "+
				"LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "+
				"LEFT JOIN inma_query_ranking r on r.rank_type='D' and r.bid_id=s.id "+
				"WHERE s.del_flag='0' and s.sta='2' and s.past_date >= NOW() ";
		if(!"".equals(firstType) && firstType != null && !"0".equals(firstType) && !firstType.equals("undefined")){
			sql +="and s.info_type_first='"+firstType+"'";
		}
		if(!"".equals(secondType) && secondType != null && !secondType.equals("undefined")){
			sql +="and s.info_type_second='"+secondType+"'";
		}
		/*if(!"".equals(title) && title != null && !title.equals("undefined")){
			sql +="and s.info_title like'%"+title+"%'";
		}*/
		if(!"".equals(provId) && provId != null && !provId.equals("undefined")){
			sql +="AND c.loc_prov_id='"+provId +"'";
		}
		sql +=" AND ((r.`name` LIKE '%"+title+"%' and NOW() BETWEEN r.start_time and r.end_time) or s.info_title LIKE '%"+title+"%') ";
		if(!"".equals(order) && order != null && !order.equals("undefined")){
			sql +=" ORDER BY r.bid desc,"+order;
		}else{
			sql+=" ORDER BY r.bid desc ";
		}
		sql +=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		return Db.find(sql);
	}

	/**
	 * 排名推广
	 * @param pageNumber
	 * @param pageSize
	 * @param firstType
	 * @param secondType
	 * @param title
	 * @param provId
     * @param order
     * @return
     */
	public List<Record> getQueryRanking(int pageNumber,int pageSize,String firstType,String secondType,String title,String provId,String order){
		String sql="SELECT s.id,s.info_type_first,s.info_type_second,s.info_title as title, "+
				"s.details,s.low_price as lowPrice,s.high_price as highPrice,IF(IFNULL(s.update_date,'') > s.create_date, "+
				"s.update_date,s.create_date) as time,s.page_view, "+
				"s.pic1,s.pic2,s.pic3,c.id as compid,c.loc_city_id,c.loc_prov_id,IFNULL(c.company_name,'') as yname, "+
				"c.auth_flag as authFlag,c.youyi_flag as youyiFlag,p.auth_flag as xFlag,"+
				"IFNULL(a.name,'') as pname,IFNULL(b.name,'') as cname FROM inma_demand_info s  "+
				"LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "+
				"LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "+
				"LEFT JOIN inma_query_ranking r on r.rank_type='D' and r.bid_id=s.id "+
				"WHERE s.del_flag='0' and s.sta='2' and s.past_date >= NOW() ";
		if(!"".equals(firstType) && firstType != null && !"0".equals(firstType) && !firstType.equals("undefined")){
			sql +="and s.info_type_first='"+firstType+"'";
		}
		if(!"".equals(secondType) && secondType != null && !secondType.equals("undefined")){
			sql +="and s.info_type_second='"+secondType+"'";
		}
		if(!"".equals(title) && title != null && !title.equals("undefined")){
			sql +="and s.info_title like'%"+title+"%'";
		}
		if(!"".equals(provId) && provId != null && !provId.equals("undefined")){
			sql +="AND c.loc_prov_id='"+provId +"'";
		}
		sql +=" AND r.`name` LIKE '% "+title+"%' and NOW() BETWEEN r.start_time and r.end_time\n" +
				"ORDER BY r.bid ";

		sql +=" limit "+(pageNumber-1)*pageSize+","+pageSize;
		return Db.find(sql);
	}
	public Qiugou getDemandCount(String firstType,String secondType,String title,String provId,String order){
		String sql="SELECT COUNT(s.id) count FROM inma_demand_info s  "+
				"LEFT JOIN sys_company c ON s.create_by=c.user_id AND c.del_flag='0' "+
				"LEFT JOIN sys_area a ON c.loc_prov_id = a.id AND a.del_flag='0' "+
				"LEFT JOIN sys_area b on c.loc_city_id = b.id and b.del_flag='0' "+
				"LEFT JOIN sys_person p ON s.create_by=p.user_id AND p.del_flag='0' "+
				"WHERE s.del_flag='0' AND s.sta='2' and s.past_date >= NOW()";
		if(!"".equals(firstType) && firstType != null && !firstType.equals("undefined")){
			sql +="and s.info_type_first='"+firstType+"'";
		}
		if(!"".equals(secondType) && secondType != null && !secondType.equals("undefined")){
			sql +="and s.info_type_second='"+secondType+"'";
		}
		if(!"".equals(title) && title != null && !title.equals("undefined")){
			sql +="and s.info_title like'%"+title+"%'";
		}
		if(!"".equals(provId) && provId != null && !provId.equals("undefined")){
			sql +="AND c.loc_prov_id='"+provId +"'";
		}
		return this.findFirst(sql);
	}
	/**
	 * 最新求购
	 * @param pageSize
	 * @return
	 */
	public List<Record> getNewDemands(int pageSize){
		String sql="SELECT d.id,d.info_title as title,  "+
				"IF(d.create_date>IFNULL(d.update_date,''),d.create_date,d.update_date) AS time "+
				"FROM inma_demand_info d  "+
				"WHERE d.del_flag='0'AND d.sta='2' ORDER BY time DESC LIMIT 0,"+pageSize;
		return Db.find(sql);
	}
	/**
	 * 审核列表
	 */
	public Page<Record> getCheckLists(int pageNumber,int pageSize,String leibie,String title,String con){
		String sql = " FROM inma_demand_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"+
				" LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second LEFT JOIN inma_demand_approve da on idi.id=da.demand_id LEFT JOIN sys_user su on su.id=idi.create_by and su.del_flag='0'\n" +
				" LEFT JOIN sys_person sp ON sp.user_id = su.id AND sp.del_flag = '0' LEFT JOIN sys_company sc ON sc.user_id = su.id AND sc.del_flag = '0' WHERE idi.del_flag='0' and idi.sta=? ";
		if(leibie != null && !leibie.equals("")){
			sql  +=" and idi.info_type_first='"+leibie+"'";
		}
		if(title != null && !title.equals("")){
			sql +=" and idi.info_title LIKE '%"+title+"%'";
		}
		if(con.equals("1")){
			sql+=" ORDER BY IFNULL(idi.update_date,idi.create_date) desc";
		}else{
			sql+=" ORDER BY IFNULL(da.create_date,idi.create_date) desc";
		}
		return Db.paginate(pageNumber, pageSize, "SELECT IF(sc.type IS NULL OR sc.type = '',su.login_name,sc.company_name) AS uname, idi.id AS iid, IFNULL( idi.update_date, idi.create_date ) AS time, IF ( sc.type IS NULL, '个人', '企业' ) AS types, IF(sp.auth_flag=1,'ge','geno') AS pauth,IF(sc.auth_flag=1,'qi','qino') AS cauth, idi.*, p.`name` AS pname, pp. NAME AS ppname, su.login_name, IFNULL( da.create_date, idi.create_date ) AS dates", sql,con);
	}
	public Page<Record> getCheckListsAll(int pageNumber,int pageSize,String leibie,String title){
		String sql = " FROM inma_demand_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"+
				" LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second LEFT JOIN inma_demand_approve da on idi.id=da.demand_id LEFT JOIN sys_user su on su.id=idi.create_by and su.del_flag='0'\n" +
				" LEFT JOIN sys_person sp ON sp.user_id = su.id AND sp.del_flag = '0' LEFT JOIN sys_company sc ON sc.user_id = su.id AND sc.del_flag = '0' WHERE idi.del_flag='0' ";
		if(leibie != null && !leibie.equals("")){
			sql  +=" and idi.info_type_first='"+leibie+"'";
		}
		if(title != null && !title.equals("")){
			sql +=" and idi.info_title LIKE '%"+title+"%'";
		}
		sql+=" ORDER BY IFNULL(da.create_date,idi.create_date) desc";
		return Db.paginate(pageNumber, pageSize, "SELECT IF(sc.type IS NULL OR sc.type = '',su.login_name,sc.company_name) AS uname, idi.id AS iid, IFNULL( idi.update_date, idi.create_date ) AS time, IF ( sc.type IS NULL, '个人', '企业' ) AS types, IF(sp.auth_flag=1,'ge','geno') AS pauth,IF(sc.auth_flag=1,'qi','qino') AS cauth, idi.*, p.`name` AS pname, pp. NAME AS ppname, su.login_name, IFNULL( da.create_date, idi.create_date ) AS dates,idi.sta ", sql);
	}
	/**
	 * 审核详情展示
	 */
	public Record qiugouCheckInfo(String id){
		String sql = "SELECT idi.*,p.`name` as pname,pp.`name` as ppname,d.label as dname,dd.label as ddname FROM inma_demand_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0' LEFT JOIN sys_dict_pcr pp "+
				" ON pp.id=idi.info_type_second and pp.del_flag='0' LEFT JOIN sys_dict d on idi.unit=d.`value` and d.type='unit_type' LEFT JOIN sys_dict dd ON "+
				" idi.past_date=dd.`value` and dd.type='period_type' WHERE idi.del_flag='0' and idi.id=?";
		return Db.findFirst(sql,id);
	}
	/**
	 * 取公司信息
	 */
	public Record getComInfo(String id){
		String sql = "SELECT su.name,sp.sex,sc.auth_flag,su.id,su.money,sc.company_name,sc.address,sc.tel,su.login_name,sp.phone,su.money,f.id as fid FROM inma_demand_info idi LEFT JOIN sys_user su on su.id=idi.create_by LEFT JOIN sys_person sp on sp.user_id=su.id and sp.del_flag='0' LEFT JOIN sys_company sc on sc.user_id=su.id and sc.del_flag='0' LEFT JOIN cs_manage_cer_faith f on f.shop_id=sc.id WHERE idi.id=?";
		return Db.findFirst(sql,id);
	}
	/**
	 * 数据收集求购列表
	 */
	public Page<Record> getDataColectionListsAll(int pageNumber,int pageSize,String leibie,String title){
		String sql = " FROM inma_demand_info idi LEFT JOIN sys_dict_pcr p on idi.info_type_first=p.id and p.del_flag='0'"+
				" LEFT JOIN sys_dict_pcr pp on pp.id=idi.info_type_second  LEFT JOIN sys_user su on su.id=idi.create_by and su.del_flag='0'\n" +
				" LEFT JOIN sys_person sp ON sp.user_id = su.id AND sp.del_flag = '0' LEFT JOIN sys_company sc ON sc.user_id = su.id AND sc.del_flag = '0' WHERE idi.del_flag='0' ";
		if(leibie != null && !leibie.equals("")){
			sql  +=" and idi.info_type_first='"+leibie+"'";
		}
		if(title != null && !title.equals("")){
			sql +=" and idi.info_title LIKE '%"+title+"%'";
		}
		sql+=" ORDER BY IFNULL(idi.update_date,idi.create_date) desc";
		return Db.paginate(pageNumber, pageSize, "SELECT IF(sc.type IS NULL OR sc.type = '',su.login_name,sc.company_name) AS uname, idi.id AS iid, IFNULL( idi.update_date, idi.create_date ) AS time, IF ( sc.type IS NULL, '个人', '企业' ) AS types, IF(sp.auth_flag=1,'ge','geno') AS pauth,IF(sc.auth_flag=1,'qi','qino') AS cauth, idi.*, p.`name` AS pname, pp. NAME AS ppname, su.login_name,idi.sta ", sql);
	}
	
	/**
	 * 根据标题查询 求购
	 */
	public List<Record> searchQgName(String name){
		String sql ="select * from inma_demand_info where del_flag='0' and sta='2' and NOW()<past_date ";
		if(name!=null&&!(name.equals(""))){
			sql+=" and info_title like '%"+name+"%'";
		}
		return Db.find(sql);
	}
}
