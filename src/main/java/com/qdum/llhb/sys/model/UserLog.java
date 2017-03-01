package com.qdum.llhb.sys.model;

import java.util.Date;

import com.jfinal.plugin.activerecord.Model;

/**
 * 用户日志
 */
public class UserLog extends Model<UserLog>{
	
	private static final long serialVersionUID = 1L;
	public static final UserLog dao = new UserLog();
	
	public static final String ID 					= "id";						//学员id
	public static final String USER_ID				= "user_id";				//用户id
	public static final String LOGIN_NAME 			= "login_name";				//账号
	public static final String TYPE					= "type";  					//字典表中的用户类型
	public static final String PASSWORD 			= "password";				//密码
	public static final String NAME					= "name";					//姓名
	public static final String ROLE					= "role";					//角色
	public static final String DISPOSE				= "dispose";				//操作处理
	public static final String ON_STATE				= "on_state";				//当前使用状态
	public static final String REMARKS 				= "remarks";				//备注
	public static final String LOGIN_IP 			= "login_ip";				//登录Ip
	public static final String LOGIN_DATE 			= "login_date";				//登录时间
	public static final String ORGANIZATION_ID 		= "organization_id";		//机构Id
	public static final String DEPARTMENT_ID		= "department_id";			//部门Id
	public static final String PHONE 				= "phone";					//人员手机号
	public static final String EMAIL 				= "email";					//人员邮件
	public static final String UPDATE_BY 			= "update_by";				//修改人
	public static final String UPDATE_DATE 			= "update_date";			//修改人
	public static final String DEL_FLAG 			= "del_flag";				//删除标志
	
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	
	public void setName(String name) {
		set(NAME, name);
	}
	
	public String getName() {
		return get(NAME);
	}
	
	public void setDispose(String dispose) {
		set(DISPOSE, dispose);
	}
	
	public String getDispose() {
		return get(DISPOSE);
	}
	
	public String getPhone () {
		return get(PHONE);
	}
	
	public void setPhone (String phone) {
		set(PHONE,phone);
	}
	
    public void setType(Integer type) {
		set(TYPE, type);
	}

	public Integer getType() {
		return get(TYPE);
	}
    
	public void setLoginName(String login_name) {
		set(LOGIN_NAME, login_name);
	}
	
	public String getLoginName() {
		return get(LOGIN_NAME);
	}
	
	public void setPassword(String password) {
		set(PASSWORD, password);
	}
	
	public String getRole() {
		return get(ROLE);
	}
	
	public void setRole(String role) {
		set(ROLE, role);
	}
	
	
	public String getPassword() {
		return get(PASSWORD);
	}
	
	public Integer getOnState() {
		return get(ON_STATE);
	}
	
	public void setOnState(Integer onState) {
		set(ON_STATE, onState);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	
	public String getRemarks() {
		return get(REMARKS);
	}
	
	public void setLoginIp(String loginIp) {
		set(LOGIN_IP, loginIp);
	}
	
	public String getLoginIp() {
		return get(LOGIN_IP);
	}
	
	public void setLoginDate(Date loginDate) {
		set(LOGIN_DATE, loginDate);
	}
	
	public Date getLoginDate() {
		return (Date)get(LOGIN_DATE);
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
	 * 查询机构
	 * */
	public Organization getOrganization(){
		return Organization.dao.findById(getOrganizationId());
	}
	
	/**
	 *  查询部门
	 * */
	public Department getDepartment() {
		return Department.dao.findById(getDepartmentId());
	}
	
	/**
	 *  用户
	 * */
	public User getUser() {
		return User.dao.findById(getUpdateBy());
	}
	

}
