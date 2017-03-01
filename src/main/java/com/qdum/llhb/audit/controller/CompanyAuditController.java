package com.qdum.llhb.audit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.hyzl.model.DictPcr;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/auditList/companyAudit")
@Before(AdminInterceptor.class)
public class CompanyAuditController extends Controller{

	/**
	 * 公司审核
	 */
	public void companyAuditInit(){
		String authFlag=getPara("authFlag");
        if(StringUtils.isBlank(authFlag)){
            authFlag = "0";
        }
		setAttr("authFlag", authFlag);
		String companyName=getPara("companyName");
		setAttr("companyName", companyName);
		String companyType=getPara("companyType");
		setAttr("companyType", companyType);
		String pageSize = getPara("pageSize");
		if(null == pageSize || "".equals(pageSize)){
			pageSize = "8";
		}
		int pageNum = getParaToInt(0,1);
		if(0 == pageNum){
			pageNum = 1;
		}
		Page<Record> list =CompanyZl.dao.searchAllCompany(pageNum, Integer.valueOf(pageSize),authFlag,companyName,companyType);
		if(!(list.getList().isEmpty())){
			setAttr("companyAll", list.getList());
			setAttr("recordPage", list);
		}
		render("companyAudit.jsp");
	}
	/**
	 * 公司详情
	 */
	public void companyData(){
		String id=getPara("id");
		setAttr("itemId", id);
		String userId=getPara("userId");
		setAttr("userId", userId);
		String itemFlag=getPara("itemFlag");
		setAttr("itemFlag", itemFlag);
		List<CompanyZl> list =CompanyZl.dao.findCompanyS(id);
		if(!(list.isEmpty())){
			setAttr("companyZl",list.get(0));
		}
		setAttr("type", 0);
		render("BusinessDetails.jsp");
	}
	/**
	 * 行业类别下拉列表
	 */
	public void searchCategory() {
		List<Record> list = DictPcr.dao.findAllList("category_type");
		renderJson(list);
	}

	/**
	 * 所在地区下拉列表
	 */
	public void searchLocProv() {
		String id = "1";
		List<Record> areaList = Area.dao.getChildList2(id);
		renderJson(areaList);
	}

	/**
	 * 所在地区子列表
	 */
	public void searchLocProvZLB() {
		String id = getPara("id");
		List<Record> areaList = Area.dao.getChildList2(id);
		renderJson(areaList);
	}
	/**
	 * 处废物下拉列表
	 */
	public void searchChuFei(){
		String cfid = "346";
		List<Record> list = DictPcr.dao.findChuFeiList(cfid);
		renderJson(list);
	}
	/**
	 * 处废物下拉列表子级
	 */
	public void searchChuFeiZJ(){
		String cfid = getPara("cfid");
		List<Record> list = DictPcr.dao.findChuFeiList(cfid);
		renderJson(list);
	}
	/**
	 * 审核通过||未通过
	 */
	public void audit(){
		String flag=getPara("flag");
		String itemId=getPara("itemId");
		String userId=getPara("userId");
		User user = UserUtils.getUser();
		String content=getPara("content");
		try {
		
			if(flag.equals("1")){
				CompanyZl companyZl =new CompanyZl();
				companyZl.set("id", itemId);
				companyZl.set("auth_flag", "1");
				companyZl.update();
				String sql="INSERT INTO sys_company_approve (user_id,approve_user,result,create_date) values" +
						" ('"+userId+"','"+user.getId()+"','Y','"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"')";
				Db.update(sql);
				PointController pc=new PointController();
				pc.regUserPoint("company",Long.valueOf(userId));
			}else if(flag.equals("2")){
				String sql="INSERT INTO sys_company_approve (user_id,approve_user,result,approve_content,create_date) values" +
						" ('"+userId+"','"+user.getId()+"','N','"+content+"','"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"')";
				Db.update(sql);
				CompanyZl companyZl =new CompanyZl();
				companyZl.set("id", itemId);
				companyZl.set("auth_flag", "-1");
				companyZl.update();
				
			}
		
		} catch (Exception e) {
		}
		renderJson(flag);
	}
}
