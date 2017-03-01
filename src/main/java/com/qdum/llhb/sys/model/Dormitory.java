package com.qdum.llhb.sys.model;

import java.util.Date;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.NumberUtil;

/**
 * 宿舍信息
 * */
public class Dormitory extends Model<Dormitory>{
	private static final long serialVersionUID = 1L;
	public static final Dormitory dao = new Dormitory();
	public static final String ID              = "id";              //班级id
	public static final String CODE            = "code";            //班级编号
	public static final String ORGANIZATION_ID = "organization_id"; //机构id
	public static final String CREATE_BY       = "create_by";       //创建人ID
	public static final String UPDATE_BY       = "update_by";       //修改人ID
	public static final String CREATE_DATE     = "create_date";     //创建日期
	public static final String UPDATE_DATE     = "update_date";     //修改日期
	public static final String DEL_FLAG        = "del_flag";        //是否删除
	public static final String REMARKS         = "remarks";         //备注
	
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
	
	public Long getOrganizationId(){
		return get(ORGANIZATION_ID);
	}
	
	public void setOrganizationId(Long organizationId) {
		set(ORGANIZATION_ID, organizationId);
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
	
	public String getRemarks(){
		return get(REMARKS);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	
	/**
	 * 根据机构id和宿舍编号在相应机构中找到相应的宿舍
	 * 
	 * @param OrganizationId  机构id 
	 * @param dormitorycode   宿舍编号 <表中宿舍编号需要唯一>
	 * @param dormitoryid     宿舍id
	 * @return                返回该宿舍
	 */
	public Dormitory findByDormitorycode(Long OrganizationId,String dormitorycode,Long dormitoryid) {
		String sql = "select * from sys_dormitory where code=? and del_flag =0";
		if (OrganizationId != null) {
			sql += " and organization_id="+OrganizationId;
		}
		Dormitory dormitory=null;
		if (dormitoryid != null) {
			sql += " and id!=?";
			dormitory= Dormitory.dao.findFirst(sql,dormitorycode,dormitoryid);
		} else {
			dormitory= Dormitory.dao.findFirst(sql,dormitorycode);
		}
		return dormitory;
	}
	
	/**
	 * 根据宿舍编号找到相应的宿舍
	 * @param dormitorycode  宿舍编号 <表中宿舍编号需要唯一>
	 * @param id             宿舍id
	 * @return 返回该宿舍
	 */
	public Dormitory updateByDormitorycode(String dormitorycode , Long id) {
		Dormitory classinfo = Dormitory.dao.findFirst("select * from sys_dormitory where code=? and id !=? and del_flag = '0'",dormitorycode,id);
		return classinfo;
	}
	
	/**
	 * 根据机构id查询出机构的信息
	 * @return  该机构
	 */
	public Organization getOrganization(){
		return Organization.dao.findById(getOrganizationId());
	}
	
}
