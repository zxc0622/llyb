package com.qdum.llhb.sys.model;

import java.util.Date;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 人员表信息
 * */
public class Person extends Model<Person>{
	
	private static final long serialVersionUID = 1L;
	public static final Person dao = new Person();
	
	public static final String ID 				= "id";					//人员Id
	public static final String USER_ID 			= "user_id";			//用户Id
	public static final String ORGANIZATION_ID 	= "organization_id";	//机构Id
	public static final String DEPARTMENT_ID	= "department_id";		//部门Id
	public static final String NAME 			= "name";				//人员姓名
	public static final String PHONE 			= "phone";				//人员手机号
	public static final String EMAIL 			= "email";				//人员邮件
	public static final String REMARKS 			= "remarks";			//备注
	public static final String DEL_FLAG 		= "del_flag";			//删除标志
	public static final String CREATE_BY 		= "create_by";			//创建人
	public static final String UPDATE_BY 		= "update_by";			//修改人
	public static final String CREATE_DATE 		= "create_date";		//创建人
	public static final String UPDATE_DATE 		= "update_date";		//修改人

	
	
	public static final String DEPT 			= "dept";				//人员姓名
	public static final String PRO_TITLE 			= "pro_title";				//人员手机号
	public static final String QQ_NUM 			= "qq_num";		
	public static final String SEX 			= "sex";	
	
	
	public String getDept () {
		return get(DEPT);
	}

	public void setDept (String dept) {
		set(DEPT, dept);
	}
	
	public String getProTitle () {
		return get(PRO_TITLE);
	}
	
	public void setProTitle (String pro_title) {
		set(PRO_TITLE, pro_title);
	}
	public String getQqNum () {
		return get(QQ_NUM);
	}
	
	public void setQqNum (String qq_num) {
		set(QQ_NUM, qq_num);
	}
	public String getSex () {
		return get(SEX);
	}
	
	public void setSex (String sex) {
		set(SEX, sex);
	}
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	
	public Long getUserId () {
		return getLong(USER_ID);
	}
	
	public void setUserId (Long userId) {
		set(USER_ID,userId);
	}
	
	public void setOrganizationId(Long organizationId) {
		set(ORGANIZATION_ID, organizationId);
	}
	
	public Long getOrganizationId() {
		return getLong(ORGANIZATION_ID);
	}
	
	public void setDepartmentId(Long departmentId) {
		set(DEPARTMENT_ID, departmentId);
	}
	
	public Long getDepartmentId() {
		return getLong(DEPARTMENT_ID);
	}
	
	public String getName () {
		return get(NAME);
	}
	
	public void setName(String name){
		set(NAME,name);
	}
	
	public String getPhone () {
		return get(PHONE);
	}
	
	public void setPhone (String phone) {
		set(PHONE,phone);
	}
	
	public String getEmail () {
		return get(EMAIL);
	}
	
	public void setEmail (String email) {
		set(EMAIL,email);
	}
	
	public String getRemarks () {
		return get(REMARKS);
	}
	
	public void setRemarks (String remarks) {
		set(REMARKS, remarks);
	}
	
	public void setCreateBy(Long createBy) {
		set(CREATE_BY, createBy);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}

	public void setUpdateBy(Long updateBy) {
		set(UPDATE_BY, updateBy);
	}

	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}

	public void setUpdateDate(Date updateDate) {
		set(UPDATE_DATE, updateDate);
	}

	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}

	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}

	public Integer getDelFlag() {
		return getInt(DEL_FLAG);
	}
	
	/**
	 * 查找机构
	 * */
	public Organization getOrganization() {
		return Organization.dao.findById(getOrganizationId());
	}
	
	/**
	 * 查找部门
	 * */
	public Department getDepartment() {
		return Department.dao.findById(getDepartmentId());
	}
	
	/**
	 * 查找用户
	 */
	public User getUser() {
		return User.dao.findById(getUserId());
	}
	public Person findXinxi(long userId) {//u.facePic,
		String sql = "SELECT sp.*,su.login_name,su.password,su.type,su.name,su.create_by,su.create_date,su.update_date,su.email,su.del_flag FROM sys_person sp LEFT JOIN sys_user su on sp.user_id=su.id WHERE su.del_flag='0' AND sp.user_id=?";
		return  Person.dao.findFirst(sql,userId);
	}
	/**
	 * 校验手机号是否存在
	 */
	public Person findtelePhone(String tele) {//u.facePic,
		String sql = "SELECT * FROM sys_person su WHERE su.del_flag='0' AND su.phone=?";
		return  Person.dao.findFirst(sql,tele);
	}
	public Record findXinxiRecord(long userId) {//u.facePic,
		String sql = "SELECT sp.*,su.login_name,su.password,su.type,su.name,su.create_by,su.create_date,su.update_date,su.email,su.del_flag FROM sys_person sp LEFT JOIN sys_user su on sp.user_id=su.id WHERE su.del_flag='0' AND sp.user_id=?";
		return Db.findFirst(sql,userId);
	}
}
