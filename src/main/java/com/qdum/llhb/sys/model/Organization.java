package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.NumberUtil;

public class Organization extends Model<Organization> {
	private static final long serialVersionUID = 1L;
	public static final Organization dao = new Organization();
	
	public static final String ID 			= "id";             //机构id
	public static final String TYPE 	    = "type";          //机构类型
	public static final String NAME 	    = "name";           //机构名称
	public static final String PRINCIPAL    = "principal";      //负责人
	public static final String TEL  		= "tel";            //电话
	public static final String FAX  		= "fax";            //传真
	public static final String POST_CODE  	= "post_code";     //邮政编码
	public static final String EMAIL  	    = "email";        //邮箱
	public static final String AREA_ID      = "area_id";        //区域id
	public static final String ADDR  		= "addr";           //地址
	public static final String REMARKS      = "remarks";         //备注
	public static final String CREATE_BY 	= "create_by";		//创建者
	public static final String CREATE_DATE 	= "create_date";	//创建时间
	public static final String UPDATE_BY 	= "update_by";		//更新者
	public static final String UPDATE_DATE 	= "update_date";	//更新时间
	public static final String DEL_FLAG 	= "del_flag";       //删除状态
	
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	
	public Integer getType() {
        return NumberUtil.toInteger(get(TYPE));
    }

    public void setType(Integer type) {
        set(TYPE,type);
    }
    
	public void setName(String name) {
		set(NAME, name);
	}
	
	public String getName() {
		return get(NAME);
	}
	
	public void setPrincipal(String principal) {
		set(PRINCIPAL,principal);
	}
	
	public String getPrincipal() {
		return get(PRINCIPAL);
	}

	public void setTel(String tel) {
		set(TEL,tel);
	}
	
	public String getTel() {
		return get(TEL);
	}
	
	public void setFax(String fax) {
		set(FAX,fax);
	}
	
	public String getFax() {
		return get(FAX);
	}
	
	public void setPostCode(String postCode) {
		set(POST_CODE,postCode);
	}
	
	public String getPostCode() {
		return get(POST_CODE);
	}

	public void setEmail(String email) {
		set(EMAIL,email);
	}
	
	public String getEmail() {
		return get(EMAIL);
	}

	public void setAreaId(Long area) {
		set(AREA_ID, area);
	}
	
	public Long getAreaId() {
		return getLong(AREA_ID);
	}
	
	public void setAddr(String addr) {
		set(ADDR,addr);
	}
	
	public String getAddr() {
		return get(ADDR);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS,remarks);
	}
	
	public String getRemarks() {
		return get(REMARKS);
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
	
	public void setUpdateBy(Long updateBy ) {
		set(UPDATE_BY,updateBy);
	}
	
	public Date getUpdateDate(){
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date updateDate ){
		set(UPDATE_DATE,updateDate);
	}
	
	public void setDel_Flag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}
		
	public Integer getDel_Flag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}
	
	/**
	 * 创建机构信息时，根据机构名称查询是否唯一
	 * @param name 机构名称
	 * @return
	 */
	public Organization findByOrganizationname(String name) {
		Organization organization = Organization.dao.findFirst("select * from sys_organization where name=? and del_flag = 0",name);
		return organization;
	}
	
	/**
	 * 修改机构信息时，根据机构名称和编号查询机构名称是否唯一
	 * @param name  机构名称
	 * @param id    编号
	 * @return
	 */
	public Organization updateByOrganizationname(String name, Long id) {
		Organization organization = Organization.dao.findFirst("select * from sys_organization where name=? and id !=? and del_flag = 0",name,id);
		return organization;
	}
	
	/**
	 * 查询所有机构信息
	 */
	public List<Organization> findAll() {
		return find("select  *  from sys_organization where del_flag = 0");
	}
	/**
	 * 查询类型为公司的机构信息
	 */
	public List<Organization> findTypeAll() {
		return find("select * from sys_organization where type = 0 and del_flag = 0");
	}
	/**
	 * 查询区域信息
	 */
	public Area getArea() {
		return Area.dao.findById(getAreaId());
	}
}
