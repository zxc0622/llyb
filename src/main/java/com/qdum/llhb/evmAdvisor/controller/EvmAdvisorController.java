package com.qdum.llhb.evmAdvisor.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.advisorCase.model.AdvisorCase;
import com.qdum.llhb.advisorConsult.model.AdvisorConsult;
import com.qdum.llhb.sys.model.Dict;

@ControllerBind(controllerKey = "/evmAdvisor")
public class EvmAdvisorController extends Controller{

	public void index(){
		List<AdvisorCase> caseList= AdvisorCase.dao.getCaseOnIndex();
		setAttr("caseList",caseList);
		//环保顾问咨询分类
		List<Dict> consultTypes = Dict.dao.getDictsByType("need_sc_type");
		setAttr("consultTypes",consultTypes);
		
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
		
		render("evmAdvisor.jsp");
	}
	
	
	//顾问咨询后台管理首页
	public void evmAdvisorManage(){
		Page<AdvisorConsult> casePage=AdvisorConsult.dao.getCaseByPage(getParaToInt("pageNumber")==null?1:getParaToInt("pageNumber"),15);
		List<AdvisorConsult> caseList=casePage.getList();
		setAttr("caseList", caseList);
		setAttr("pageNumber",casePage.getPageNumber());
		setAttr("pageSize",casePage.getPageSize());
		setAttr("totalPage",casePage.getTotalPage());
		setAttr("totalRow",casePage.getTotalRow());
		
		render("evmAdvisorManage.jsp");
	}
	
	public void getAvmAdvisorById(){
		String id = getPara("id");
		Record ac = Db.findFirst("SELECT * FROM advisor_consult WHERE id=? AND del_flag=0",id);
		setAttr("ac",ac);
		render("oneAdvisorConsult.jsp");
	}
	
	
	//环保体检
	public void evmExamine(){
		render("evmExamine.jsp");
	}
	
	
}
