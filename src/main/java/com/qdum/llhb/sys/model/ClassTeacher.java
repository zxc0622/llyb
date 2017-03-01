package com.qdum.llhb.sys.model;

import java.util.Date;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.NumberUtil;

/**
 * 班级老师中间表Model
 * @author Administrator
 *
 */
public class ClassTeacher extends Model<ClassTeacher>{
	
	public static final long serialVersionUID = 1L;
	public static final ClassTeacher dao = new ClassTeacher();
	
	private static final String ID				= "id";			//班级老师中间表id
	private static final String CLASS_ID		= "class_id";	//班级id
	private static final String USER_ID			= "user_id";	//用户id
	private static final String REMARK			= "remark";		//备注
	private static final String DEL_FLAG		= "del_flag";	//删除状态   0：未删除 1：已删除
	private static final String CREATE_BY		= "create_by";	//创建人
	private static final String CREATE_DATE		= "create_date";//创建时间
	private static final String UPDATE_BY		= "update_by";	//更新人
	private static final String UPDATE_DATE		= "update_date";//更新时间
	
	//get set 方法
	public void setId(Long id) {
		set(ID,id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	
	public void setClassid(Long classid) {
		set(CLASS_ID,classid);
	}
	public Long getClassid() {
		return getLong(CLASS_ID);
	}
	
	public void setUserid(Long userid) {
		set(USER_ID,userid);
	}
	public Long getUserid() {
		return getLong(USER_ID);
	}
	
	public String getRemark() {
		return get(REMARK);
	}
	
	public void setRemark(String remark) {
		set(REMARK,remark);
	}
	
	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}
	
	public Integer getDelFlag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		return (Date)get(CREATE_DATE);
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
	
	/**
	 * 
	 * 根据用户id获取用户名
	 */
	public User getUser() {
		return User.dao.findById(getUserid());
	}

}
