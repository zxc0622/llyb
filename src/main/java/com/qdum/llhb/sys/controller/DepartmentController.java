package com.qdum.llhb.sys.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.sys.model.Department;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 部门
 * @author zhangchao
 *
 */
@ControllerBind(controllerKey="/sys/department")
@Before(FlashInterceptor.class)
public class DepartmentController extends BaseController {
	
	/**
	 * 
	 * 查询机构的全部部门index
	 */
	public void index() {
		
			List<Department> list = Lists.newArrayList();
			List<Department> sourcelist = new ArrayList<Department>();
			Long organizationid = this.getParaToLong("id");
			
			sourcelist = Department.dao.findByOrganizationId(organizationid);
			Department.sortList(list, sourcelist, 1L);
			setAttr("list", list);
			setAttr("organizationid",organizationid);
			render("departmentList.jsp");
	}
	
	/**
	 * 
	 * 新增或更新，根据id进行判断，去掉form.jsp
	 */
	public void  form () {
		
		Long id = this.getParaToLong("id");
		Long organizationid =this.getParaToLong("organizationid");
		Department department = null ; 
		if (id == null || id == 0L) {
			department = getModel(Department.class);
			if (department.getParentId() == null) {
				 department.setParentId(1L);
			}			 
		}else {
			department = Department.dao.findById(id);
		}
		setAttr("department", department);
		setAttr("organizationid", organizationid);
		render("departmentform.jsp");
	}

	/**
	 * 
	 * 保存或更新数据，存入数据库，根据id来进行判断
	 */
	public void save () {
		
		User user = UserUtils.getUser();		//当期登录用户
		Long id = this.getParaToLong("id");
		Long organizationid =this.getParaToLong("organizationid");
		Department department = getModel(Department.class);
		if (department.getId() == null || department.getId() == 0L) {
			
			department.setDelFlag(0);
			department.setCreateBy(user.getId());
			department.setCreateDate(new Date());
			department.setUpdateBy(user.getId());
			department.setUpdateDate(new Date());
			addMessageSuccess("保存部门'" + department.getName() + "'成功");
		} else {
			
			department.setUpdateBy(user.getId());
			department.setUpdateDate(new Date());
			addMessageSuccess("修改部门'" + department.getName() + "'成功");
		}
		
		Department parent = department.getParent();
		department.setParentIds(parent.getParentIds()+parent.getId()+",");
		department.setOrganizationId(organizationid);
		
		department.dao.save(department);
	
		redirect("/sys/department?id="+organizationid);
	}
	
	/**
	 * 
	 * 删除部门，如果是顶级部门不能删除进行判断
	 */
	public void delete () {
		
		User user = UserUtils.getUser();
		Long id = this.getParaToLong("id");
		Long organizationid =this.getParaToLong("organizationid");
		
		if (Department.dao.isRoot(id)) {
			
			addMessageError( "删除部门失败, 不允许删除顶级部门或编号为空");
		} else {
			
			Department department = Department.dao.findById(id);
			//删除所有下属
			List<Department> departments = department.getChildList();
			if (departments.size() > 0 ){
				addMessageSuccess( "该部门下有子部门，不能进行删除");
				redirect("/sys/department?id="+organizationid);
				return;
			}
			for ( int i=0; i<departments.size(); i++ ) {
				
				Department departmenta = departments.get(i);
				departmenta.setDelFlag(1); 
				departmenta.setUpdateBy(user.getId());
				departmenta.setUpdateDate(new Date());
				departmenta.update();
			}
			
			department.setUpdateBy(user.getId());
			department.setUpdateDate(new Date());
			department.setDelFlag(1);
			department.update();
			addMessageSuccess( "删除部门成功");
		}
		redirect("/sys/department?id="+organizationid);
	}
	
	/**
	 * 用于读取全部数据，显示在部门选项框，用于进行上级菜单选择
	 */
	public void treeData() {
		
		User user = UserUtils.getUser();		//当期登录用户
		Long extId = getParaToLong("extId");
		Long organizationid =this.getParaToLong("organizationid");
		this.getResponse().setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Department> list = Department.dao.findByOrganizationIdAll(organizationid);
		
		for (int i=0; i<list.size(); i++) {
			Department e = list.get(i);
			if (extId == null || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",") == -1)) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent()!=null?e.getParent().getId():0);
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		this.renderJson(mapList);
	}
	
	/**
	 * 查看单个部门详情信息
	 */
	public void details () {
		
		Long id = this.getParaToLong("id");
		Long organizationid =this.getParaToLong("organizationid");
		Department department = Department.dao.findById(id);
		
		setAttr("department", department);
		setAttr("organizationid", organizationid);
		render("departmentdetails.jsp");
		
	}
	
	/**
	 * 校验部门名称是否存在
	 * */
	public void checkDepartmentCode(){
		
		String fieldId = getPara("fieldId");
		try {
		    String Code = java.net.URLDecoder.decode(getPara("fieldValue"),"UTF-8");
			Long departmentId = getParaToLong("depmentId");
			Long OrganizationId = getParaToLong("organizationId");
			String info = "";
			if (Department.dao.findByDepartmentcode(OrganizationId,Code,departmentId) != null) {
				info = "[\""+fieldId+"\",false,\"您输入的部门名称已经存在，请重新输入！\"]";  
			} else {
				info = "[\""+fieldId+"\",true,\"\"]"; 
			}
			renderJson(info);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
}
