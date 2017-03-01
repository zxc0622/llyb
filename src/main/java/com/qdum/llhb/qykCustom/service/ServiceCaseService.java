package com.qdum.llhb.qykCustom.service;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomServiceCase;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 *	服务案例service
 */
public class ServiceCaseService extends Module {
	
	@Override
	public void init() {
		List<Record> caseList = SysCompanyCustomServiceCase.dao.getCaseByUserID(userId);
		controller.setAttr("serviceCase", caseList);
	}
	
	//服务案例详情
	public void detail(Controller ctrl){
		String caseId = ctrl.getPara(1).replace("case", "");
		String sql = "SELECT * FROM inma_case_info WHERE id=? AND del_flag=0;";
		Record caseInfo = Db.findFirst(sql,caseId);
		ctrl.setAttr("caseInfo", caseInfo);
		//处理省市区
		Long prov_id = caseInfo.getLong("prov_id");
		Long city_id = caseInfo.getLong("city_id");
		Long area_id = caseInfo.getLong("area_id");
		Record provRec = Db.findFirst("SELECT name FROM sys_area WHERE id=? AND del_flag=0",prov_id);
		Record cityRec = Db.findFirst("SELECT name FROM sys_area WHERE id=? AND del_flag=0",city_id);
		Record areaRec = Db.findFirst("SELECT name FROM sys_area WHERE id=? AND del_flag=0",area_id);
		String caseProv = "";
		String caseCity = "";
		String caseArea = "";
		if(provRec != null){
			caseProv = provRec.getStr("name");
		}
		if(cityRec != null){
			caseCity = cityRec.getStr("name");
		}
		if(areaRec != null){
			caseArea = areaRec.getStr("name");
		}
		ctrl.setAttr("caseProv", caseProv);
		ctrl.setAttr("caseCity", caseCity);
		ctrl.setAttr("caseArea", caseArea);
		
		long userid = caseInfo.getLong("user_id");
		String comSql = "SELECT * FROM sys_company WHERE user_id=? AND del_flag=0";
		Record companyInfo = Db.findFirst(comSql,userid);
		ctrl.setAttr("companyInfo", companyInfo);
		//处理省市区
		Long prov_id2 = companyInfo.getLong("loc_prov_id");
		Long city_id2 = companyInfo.getLong("loc_city_id");
		Record companyProvRec = Db.findFirst("SELECT name FROM sys_area WHERE id=? AND del_flag=0",prov_id2);
		Record companyCityRec = Db.findFirst("SELECT name FROM sys_area WHERE id=? AND del_flag=0",city_id2);
		String companyProv = "";
		String companyCity = "";
		if(companyProvRec != null){
			companyProv = companyProvRec.getStr("name");
		}
		if(companyCityRec != null){
			companyCity = companyCityRec.getStr("name");
		}
		ctrl.setAttr("companyProv", companyProv);
		ctrl.setAttr("companyCity", companyCity);
		
		//判断改案例是否已收藏
		user = UserUtils.getUser();
		String cllSql = "SELECT * FROM ms_business_collect WHERE type=? AND collect_id=? AND create_by=? AND del_flag=0";
		List<Record> cllLsit = Db.find(cllSql,5,caseId,user.getId());
		if(cllLsit.size() > 0){
			ctrl.setAttr("cllFlag","1");//已收藏
		}else{
			ctrl.setAttr("cllFlag","0");//未收藏
		}
	}

}
