package com.qdum.llhb.sys.model;

import java.math.BigDecimal;
import java.util.Date;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

/**
 * 班级信息
 * */
public class ClassInfo extends Model<ClassInfo>{
	private static final long serialVersionUID = 1L;

	public static final ClassInfo dao = new ClassInfo();
	
	public static final String ID              = "id";              //班级id
	public static final String CODE            = "code";            //班级编号
	public static final String NAME            = "name";            //班级名称
	public static final String GRADE           = "grade";           //年级
	public static final String TRAIN_TIME	   = "train_time"; 		//培训截止时间
	public static final String REPORT_TIME	   = "report_time";	    //报到时间
	public static final String ORGANIZATION_ID = "organization_id"; //机构ID
	public static final String CREATE_BY       = "create_by";       //创建人ID
	public static final String UPDATE_BY       = "update_by";       //修改人ID
	public static final String CREATE_DATE     = "create_date";     //创建日期
	public static final String UPDATE_DATE     = "update_date";     //修改日期
	public static final String PRINCIPAL       = "principal";       //负责人
	public static final String DEL_FLAG        = "del_flag";        //是否删除
	public static final String REMARKS         = "remarks";         //备注
	public static final String MAX_STUDENT_NO  = "max_student_no";	//流水号
	
	//对属性进行get,set设置
	public Long getId() {
		return getLong(ID);
	}

	public void setId(Long id) {
		set(ID, id);
	}
	
	public String getCode(){
		return get(CODE);
	}
	
	public void setCode(String code) {
		set(CODE, code);
	}
	
	public String getName(){
		return get(NAME);
	}
	
	public void setName(String name) {
		set(NAME, name);
	}
	
	public String getGrade() {
		return get(GRADE);
	}
	
	public void setGrade(String grade ) {
		set(GRADE,grade);
	}
	
	public Date getReportTime () {
		return getDate(REPORT_TIME);
	}
	
	public void setReportTime (Date reportTime) {
		set(REPORT_TIME,reportTime);
	}
	
	public Date getTrainTime () {
		return get(TRAIN_TIME);
	}
	
	public void setTrainTime (Date trainTime) {
		set(TRAIN_TIME,trainTime);
	}
	public Long getOrganizationId() {
		return getLong(ORGANIZATION_ID);
	}
	
	public void setOrganizationId(Long organizationId ) {
		set(ORGANIZATION_ID,organizationId);
	}
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public Long getUpdateBy() {
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
	
	public String getPrincipal(){
		return get(PRINCIPAL);
	}
	
	public void setPrincipal(String principal) {
		set(PRINCIPAL, principal);
	}
	
	public String getRemarks(){
		return get(REMARKS);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	
	public Integer getMaxStudentNo(){
		return get(MAX_STUDENT_NO);
	}
	
	public void setMaxStudentNo(Integer max_student_no) {
		set(MAX_STUDENT_NO, max_student_no);
	}
	
	/**
	 * 根据机构id和班级编号在相应机构中找到相应的班级
	 * 
	 * @param classcode      班级编号 <表中班级编号需要唯一>
	 * @param institutionId  机构id
	 * @param classInfoid    班级id
	 * @return               返回该班级
	 * 
	 */
	public ClassInfo findByClasscode(String classcode,Long classInfoid) {

		String sql = "select * from sys_class where code=? and del_flag = 0 ";
		ClassInfo classinfo=null;
		if (classInfoid != null) {
			sql += " and id !=? ";
			classinfo= ClassInfo.dao.findFirst(sql,classcode,classInfoid);
		}else{
			classinfo= ClassInfo.dao.findFirst(sql,classcode);
		}
		return classinfo;
	}
	
	/**
	 * 根据班级名找到相应的班级
	 * @param classname 班级名 <表中班级名需要唯一>
	 * @return  返回该班级
	 */
	public ClassInfo findByClassname(String classname) {
		ClassInfo classinfo = ClassInfo.dao.findFirst("select * from sys_class where name=? and del_flag = '0'",classname);
		return classinfo;
	}
	
	/**
	 * 根据班级名找到相应的班级
	 * @param classname 班级名 <表中班级名需要唯一>
	 * @param id        班级id
	 * @return 返回该班级
	 */
	public ClassInfo UpdateByClassname(String classname , Long id) {
		ClassInfo classinfo = ClassInfo.dao.findFirst("select * from sys_class where name=? and id !=? and del_flag = '0'",classname,id);
		return classinfo;
	}
	
	/***
	 * 根据机构id查询机构信息
	 * @return   该机构
	 */
	public Organization getOrganization() {
		return Organization.dao.findById(getOrganizationId());
	}
	
	/**
	 * 
	 * 根据班级id查询收费模板总金额
	 */
	public BigDecimal getPayment() {
		BigDecimal allTotal = new BigDecimal(0.00);
		Record record = Db.findFirst("select SUM(s.paid_amount) amount from stu_payment_template s where s.del_flag = '0' and s.class_id = ? ",getId());
		if (record.getBigDecimal("amount") != null) {
			allTotal = record.getBigDecimal("amount");
		}
		return allTotal;
	}
}
