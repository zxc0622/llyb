package com.qdum.llhb.sys.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.sys.model.ClassInfo;
import com.qdum.llhb.sys.model.Department;
import com.qdum.llhb.sys.model.Dormitory;
import com.qdum.llhb.sys.model.Organization;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
* 机构信息管理
*/
@ControllerBind(controllerKey="/sys/organization")
@Before(FlashInterceptor.class)
public class OrganizationController extends BaseController {
	/**
	 *机构列表
	 */
	@RequiresPermissions("sys:organization:view")
	public void index() {
		PageUtils pageUtils = getPageParameter();	
		String where = " where "+Organization.DEL_FLAG +"=0";
		Object name = pageUtils.getMap().get("name") ;
		if (name!= null && !"".equals(name.toString())) {
			where += " and name like '%"+pageUtils.getMap().get("name").toString().trim()+"%' ";
		}
		pageUtils.initialize(Organization.dao.paginate(pageUtils.getPageNo(),
				pageUtils.getPageSize(), "select * ",
				" from sys_organization "+where+pageUtils.getOrderBySql()+" order by id desc"));
		
		if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {
			pageUtils.setPageNo(1);
			pageUtils.initialize(Organization.dao.paginate(pageUtils.getPageNo(),
					pageUtils.getPageSize(), "select * ",
					" from sys_organization "+where+pageUtils.getOrderBySql()+" order by id desc"));
		}
		setAttr("page", pageUtils);
		render("organizationList.jsp");
	}
	
	/**
	 * 机构的增加和修改
	 */
	@RequiresPermissions("sys:organization:view")
	public void form() {
		Long id = getParaToLong("id");
		Organization organization = null;
		if ( id != null && id != 0L) {
			organization = Organization.dao.findById(id);
    		setAttr("organization", organization);
    		render("organizationForm.jsp");
		}else {
			setAttr("organization", organization);
    		render("organizationForm.jsp");
		}
	}
	
	/**
	 * 机构详情页
	 */
	@RequiresPermissions("sys:organization:view")
	public void details(){
		Long id = getParaToLong("id");
		Organization organization = Organization.dao.findById(id);
		setAttr("organization", organization);
		render("organizationDetails.jsp");
	}
	
	/**
	 * 机构的保存
	 */
	@RequiresPermissions("sys:organization:edit")
    public void save() {
    	//创建机构
    	    User user = UserUtils.getUser();
    	    User loginUser = UserUtils.getUser();
	        Organization organization = getModel(Organization.class);
    	if (organization == null || organization.getId() == null || organization.getId() == 0L) {
    	        organization.setCreateBy(user.getId());
    	        organization.setCreateDate(new Date());
    	        organization.setDel_Flag(0);
    	        organization.save();
    	        addMessageSuccess( "保存机构'" + organization.getName() + "'成功");
    	        redirect("/sys/organization");
    	}
    	else {
    	//修改机构
			organization.setUpdateBy(loginUser.getId());
			organization.setUpdateDate(new Date());
			organization.update();
			addMessageSuccess( "修改机构'" + organization.getName() + "'成功");
    	}
    	    redirect("/sys/organization");
    }
    
    /**
     * 机构的删除
     */
	@RequiresPermissions("sys:organization:edit")
    public void delete() {
    	Long id = getParaToLong("id"); //机构id
    	Organization organization = Organization.dao.findById(id);
    	
    	//宿舍
    	Dormitory dormitory = Dormitory.dao.findFirst("select * from sys_dormitory where del_flag = 0 and organization_id =?",id);
    	//班级
    	ClassInfo classInfo = ClassInfo.dao.findFirst("select * from sys_class where del_flag = 0 and organization_id =?",id);
    	//部门
    	Department department = Department.dao.findFirst("select * from sys_department where del_flag = 0 and organization_id =?",id);
    	//客户机构
    	//CustomerOrganization customerorganization = CustomerOrganization.dao.findFirst("select * from cus_customer_organization where del_flag = 0 and organization_id =?",id);
    	//调查卷制定
    	//QuestionnaireFormulate questionnaireformulate = QuestionnaireFormulate.dao.findFirst("select * from que_questionnaire_formulate where del_flag = 0 and organization_id =?",id);
    	
    	if (classInfo != null ) {
    		addMessageError("该机构下已存在班级！不能删除！");
    	} else if(dormitory != null ) {
    		addMessageError("该机构下已存在宿舍！不能删除！");
    	}else if( department != null ) {
    		addMessageError("该机构下已存在部门！不能删除！");
    	/*}else if(customerorganization != null) {
    		addMessageError("该机构已被客户机构使用！不能删除！");
    	}else if( questionnaireformulate != null ) {
    		addMessageError("该机构已被模板制定使用！不能删除！");*/
    	}else {
    		organization.setDel_Flag(1);
        	organization.update();
        	addMessageSuccess( "删除机构'" + organization.getName() + "'成功");
    	}
		redirect("/sys/organization");
	}
    
    /**
     * 机构名称唯一验证（全局唯一）
     * @throws Exception 
     */
    public void checkOrganizationName() throws Exception {
		String fieldId = getPara("fieldId");
		Long id = getParaToLong("organizationId");
		String info = "";
		String name = java.net.URLDecoder.decode(getPara("fieldValue"),"utf-8");
		if(id == null || "".equals(id)) {
			if (name != null && Organization.dao.findByOrganizationname(name) != null) {
				info = "[\""+fieldId+"\",false,\"您输入的机构名称已经存在，请重新输入！\"]";  
			} else {
				info = "[\""+fieldId+"\",true,\"\"]"; 
			}
		} else {
			if (name != null && Organization.dao.updateByOrganizationname(name,id) != null) {
				info = "[\""+fieldId+"\",false,\"您输入的机构名称已经存在，请重新输入！\"]";  
			} else {
				info = "[\""+fieldId+"\",true,\"\"]"; 
			}
		}
		this.renderJson(info);
	}
	
}
