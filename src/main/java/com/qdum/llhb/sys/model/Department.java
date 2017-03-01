package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 部门
 * @author zhangchao
 *  2015-07-17 18:33:03
 */
public class Department extends Model<Department> {
	
	private static final long serialVersionUID = 1L;
	public static final Department dao = new Department();
	
	public static final String ID                       = "id";                   //主键id
	public static final String ORGANIZATION_ID   		= "organization_id";      //机构表id
	public static final String PARENT_ID 	            = "parent_id";			  //父级id
	public static final String PARENT_IDS 	            = "parent_ids";			  //所有父级id
	public static final String NAME			            = "name";				  //姓名
	public static final String PRINCIPAL                = "principal";            //负责人
	public static final String MOBILE                   = "mobile";               //电话
	public static final String FAX                      = "fax";                  //传真
	public static final String POST_CODE                = "post_code";            //邮政编码
	public static final String EMAIL                    = "email";                //邮箱
	public static final String ADDRESS                  = "address";              //地址
	public static final String REMARKS			        = "remarks";			  //备注
	public static final String CREATE_BY 	            = "create_by";		      //创建人
	public static final String UPDATE_BY 	            = "update_by";		      //修改人
	public static final String CREATE_DATE 	       		= "create_date";    	  //创建人
	public static final String UPDATE_DATE 	            = "update_date";     	  //修改人
	public static final String DEL_FLAG		            = "del_flag";			  //是否删除
	
	/**
	 * get()和set()方法
	 * @return
	 */
	public Long getId () {
		
		return getLong(ID);
	}
	
	public void setId(Long id) {
		
		set(ID,id);
	}
	
	public Long getOrganizationId() {
		
		return getLong(ORGANIZATION_ID);
	}
	
	public void setOrganizationId(Long organizationid) {
		
		set(ORGANIZATION_ID,organizationid);
	}
	
	public void setParentId(Long parentId) {
		
		set(PARENT_ID, parentId);
	}
	public Long getParentId() {
		
		return getLong(PARENT_ID);
	}
	
	public void setParentIds(String parentIds) {
		
		set(PARENT_IDS, parentIds);
	}
	
	public String getParentIds() {
		
		return get(PARENT_IDS);
	}
	
	public String getName() {
		
		return get(NAME);
	}
	
	public void setName(String name) {
		
		set(NAME,name);
	}
	
	public String getPrincipal() {
		
		return get(PRINCIPAL);
	}
	
	public void setPrincipal(String principal) {
		
		set(PRINCIPAL,principal);
	}
	public String getMobile() {
		
		return get(MOBILE);
	}
	
	public void setMobile(String mobile) {
		
		set(MOBILE,mobile);
	}
	public String getFax() {
		
		return get(FAX);
	}
	
	public void setFax(String fax) {
		
		set(FAX,fax);
	}
	public String getPostCode() {
		
		return get(POST_CODE);
	}
	
	public void setPostCode(String postcode) {
		
		set(POST_CODE,postcode);
	}
	public String getEmail() {
		
		return get(EMAIL);
	}
	
	public void setEmail(String email) {
		
		set(EMAIL,email);
	}
	public String getAddress() {
		
		return get(ADDRESS);
	}
	
	public void setAddress(String address) {
		
		set(ADDRESS,address);
	}
	
	public String getRemarks() {
		
		return get(REMARKS);
	}
	
	public void setRemarks(String remarks) {
		
		set(REMARKS,remarks);
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
	
	public Date getUpdateDate() {
		
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate ) {
		
		set(UPDATE_DATE,createDate);
	}
	
	public void setDelFlag(Integer delFlag) {
		
		set(DEL_FLAG, delFlag);
	}
	
	public Integer getDelFlag() {
		
		return getInt(DEL_FLAG);
	}
	
	/**
	 * 根据机构id获取机构
	 */
	public Organization getOrganization () {
		return Organization.dao.findById(getOrganizationId());
	}
	
	
	/**
	 * 获取机构所有部门
	 * @param organizationid
	 * @return List<Department>
	 */
	public List<Department> findByOrganizationId (Long organizationid)  {
		
		String sql = " SELECT * FROM sys_department s WHERE 1=1"
						  +" AND s.organization_id =? AND s.del_flag=0 ";
		
		List<Department> list = Department.dao.find (sql, organizationid);
		return list;
	}
	
	/**
	 * 获取机构所有部门
	 * @param organizationid
	 * @return List<Department>
	 */
	public List<Department> findByOrganizationIdAll (Long organizationid)  {
		
		String sql = " SELECT * FROM sys_department s WHERE 1=1"
						  +" AND s.organization_id =0 OR s.organization_id =? AND s.del_flag = 0 ";
		
		List<Department> list = Department.dao.find (sql, organizationid);
		return list;
	}

	/**
	 * 获取用户一级部门
	 * @param organizationid
	 * @return List<Department>
	 */
	public List<Department> findFirstDepartment (Long organizationid) {
		
		String sql = " SELECT * FROM sys_department s WHERE 1=1  "
		   				  +" AND s.del_flag='0' AND s.parent_id=1 AND  s.id=? ";
		
		List<Department> list = Department.dao.find(sql, organizationid);
		return list;
	}
	
	/**
	 * 获取用户所有子部门
	 * @return  List<Department>
	 */
	public List<Department> getChildList (Long organizationid,Long parentId) {
		
		String sql = " SELECT * FROM sys_department s WHERE 1=1 " 
					     +"AND s.id=? AND s.parent_id=? AND s.del_flag='0' ";
		
		List<Department> list = Department.dao.find (sql, organizationid, parentId);
		return list;
	}
	
	/**
	 * 得到所有未删除的部门(部门管理中使用)
	 * @return List<Department>
	 */
	public List<Department> findAllList () {
		
		String sql = " SELECT * FROM sys_department s WHERE s.del_flag='0' ";
		
		List<Department> list = Department.dao.find (sql);
		return list;
	}
	
	/**
	 * 不分级检索所有下级
	 * @return List<Department>
	 */
	public List<Department> getAllChildList () {
		
		List<Department> department = Department.dao.find(" SELECT * FROM sys_department WHERE del_flag='0' AND parent_ids like ?  "," %,"+getId()+",% ");
		return department;
	}
	
	/**
	 * 检索所有下一级部门
	 * @return List<Department>
	 */
	public List<Department> getChildList () {
		
		List<Department> department = Department.dao.find(" SELECT * FROM sys_department WHERE del_flag='0' AND parent_id = ?  ",getId());
		return department;
	}
	
	/**
	 * 查找当前部门的父部门
	 * @return  Department
	 */
	public Department getParent () {
		
		Department department = CacheKit.get("DepartmentCache", getParentId());
		if (department == null) {
			if (getParentId() != 0L) {
				department = Department.dao.findById(getParentId());
				CacheKit.put("DepartmentCache", getParentId(), department);
			}
		}
		return department;
	}
	
	/**
	 * 保存部门
	 * @param Department
	 */
	public void save (Department department) {
		
		if (department.getId() == null) {
			
			department.save();
		} else {
			
			department.update();
		}
	}

	/**
	 * 是否为顶级部门
	 * @param id
	 * @return boolean
	 */
	public boolean isRoot (Long id) {
		
		return id != null && id.equals(1L);
	}
	
	/**
	 * 查询当前部门名称是否存在
	 * @param OrganizationId
	 * @param dormitorycode
	 * @param dormitoryid
	 * @return
	 */
	public Department findByDepartmentcode(Long OrganizationId,String departmentcode,Long departmentId) {
		String sql = "select * from sys_department where name=? and del_flag =0";
		if (OrganizationId != null) {
			sql += " and organization_id="+OrganizationId;
		}
		Department department=null;
		if (departmentId != null) {
			sql += " and id!=?";
			department= Department.dao.findFirst(sql,departmentcode,departmentId);
		} else {
			department= Department.dao.findFirst(sql,departmentcode);
		}
		return department;
	}

	/**
	 * 对部门进行排序
	 * @param list
	 * @param sourcelist
	 * @param parentId
	 */
	public static void sortList (List<Department> list, List<Department> sourcelist, Long parentId) {
		
		for (int i=0; i<sourcelist.size(); i++) {
			
			Department e = sourcelist.get(i);
			Long DepParentId = e.getParentId();
			
			if (DepParentId != null && DepParentId.equals(parentId)) {
				
				list.add(e);
				
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					
					Department child = sourcelist.get(j);
					Long childId = child.getParentId();
					
					if (childId != null && childId.equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}
}
