package com.qdum.llhb.advisorCase.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.advisorCase.model.AdvisorCase;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/advisorCase")
public class AdvisorCaseController extends Controller{

	//案例管理
	public void index(){
		Page<AdvisorCase> casePage=AdvisorCase.dao.getCaseByPage(getParaToInt("pageNumber")==null?1:getParaToInt("pageNumber"));
		List<AdvisorCase> caseList=casePage.getList();
		setAttr("caseList", caseList);
		setAttr("pageNumber",casePage.getPageNumber());
		setAttr("pageSize",casePage.getPageSize());
		setAttr("totalPage",casePage.getTotalPage());
		setAttr("totalRow",casePage.getTotalRow());
		render("advisorCase.jsp");
	}
	//进入新增、修改案例页面
	public void editAdvisorCase(){
		AdvisorCase caseInfo = AdvisorCase.dao.findById(getPara("id"));
		setAttr("companyId",UserUtils.getUser().get("companyId"));
		setAttr("caseInfo",caseInfo);
		render("editAdvisorCase.jsp");
	}
	//新增、保存案例
	public void saveEditCase(){
		AdvisorCase advisorCase=new AdvisorCase();
		advisorCase.set("title", getPara("title"));
		advisorCase.set("content", getPara("content"));
		advisorCase.set("summary", getPara("summary"));
		advisorCase.set("source", getPara("source"));
		advisorCase.set("img", getPara("img"));
		advisorCase.set("seq", getPara("seq"));
		boolean isSuccess=false;
		if(StringUtils.isBlank(getPara("id"))){
			isSuccess=advisorCase.save();
		}else{
			advisorCase.set("id", getPara("id"));
			isSuccess=advisorCase.update();
		}
		renderJson(isSuccess);
	}
	
	//删除案例
	public void deleteCase(){
		String idsStr = getPara("ids");
		String[] ids = idsStr.split(",");
		boolean isSuccess=false;
		for (String id : ids) {
			isSuccess=AdvisorCase.dao.deleteById(id);
		}
		renderJson(isSuccess);
	}
	
	//置顶
	public void setTop(){
		AdvisorCase advisorCase = AdvisorCase.dao.findById(getPara("id"));
		int seq=advisorCase.getInt("seq");
		int sta=Db.update("update advisor_case set seq=? where seq=0",seq);
		advisorCase.set("seq", 0);
		boolean isSuccse=advisorCase.update();
		if(isSuccse&&sta>0){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	
	//进入案例详情页面
	public void intoCaseDetail(){
		AdvisorCase caseDetail=AdvisorCase.dao.getCaseDetailById(getPara("id"));
		setAttr("caseDetail", caseDetail);
		List<AdvisorCase> otherCase=AdvisorCase.dao.getOtherCase(getPara("id"));
		setAttr("otherCase",otherCase);
		
		//最底部合作网站
		List<Record> websiteTypeList = Db.find("SELECT * FROM sys_dict WHERE type='website_type' AND del_flag=0 ORDER BY sort");
		List<List<Record>> websiteInfo = new ArrayList<List<Record>>();
		for(Record r : websiteTypeList){
			long wsTypeId = r.getLong("id");
			List<Record> websiteInfoList = Db.find("SELECT * FROM sys_cooperation_website WHERE type=? AND del_flag=0 ORDER BY sort",wsTypeId);
			websiteInfo.add(websiteInfoList);
		}
		setAttr("wstl",websiteTypeList);
		setAttr("wsif",websiteInfo);
				
		render("advisorCaseDetail.jsp");
	}
	
	//进入更多案例页面
	public void intoMoreCase(){
		int pageNumber = getParaToInt("pageNumber");
		Page<AdvisorCase> caseList=AdvisorCase.dao.getCaseByPage(pageNumber);
		setAttr("caseList", caseList.getList());
		setAttr("totalPage",caseList.getTotalPage());
		setAttr("pageNumber",pageNumber);
		render("moreCase.jsp");
	}
}
