package com.qdum.llhb.qykCustom.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyHead;



public class HeadService extends Module {

	private SysCompanyHead headMsg;
	private CompanyZl company;

	@Override
	public void init() {
		// TODO Auto-generated method stub
		company = CompanyZl.dao.findById(companyId);
		SysCompanyCustom customMsg = SysCompanyCustom.dao.getModuleMsg(companyId,1);
		int customId=customMsg.getInt("id");
		headMsg = SysCompanyHead.dao.getHeadMsg(customId);
		if(headMsg==null){
			headMsg=new SysCompanyHead();
		}
		
		String sql = "SELECT logo_img,youyi_flag,x_flag,auth_flag FROM sys_company WHERE id=? AND del_flag=0";
		Record companyMsg = Db.findFirst(sql,companyId);
		
		headMsg.put("logoImg", companyMsg.getStr("logo_img"));
		headMsg.put("youyiFlag",companyMsg.get("youyi_flag") );
		headMsg.put("authFlag", companyMsg.get("auth_flag"));
		headMsg.put("xFlag", companyMsg.get("x_flag"));
		headMsg.put("name", company.getStr("company_name"));
		headMsg.put("major", company.getStr("major"));
		headMsg.put("companyId", companyId);
		
		controller.setAttr("headMsg", headMsg);
	}

}
