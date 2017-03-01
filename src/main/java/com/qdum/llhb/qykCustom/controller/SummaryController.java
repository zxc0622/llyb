package com.qdum.llhb.qykCustom.controller;


import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.config.ModuleType;
import com.qdum.llhb.qykCustom.config.NavigationItem;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanySummary;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import net.sf.json.JSONObject;

/**
 * 自定义企业简介
 */
@ControllerBind(controllerKey = "/Library/summary",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class SummaryController extends Controller {

	private User user;
	private Long companyId;
	
	//更新企业简介信息
	@Before(ChangeUserMsgInterceptor.class)
	public void updateSummary(){
		companyId=getAttr("companyId");
		String userId = "";
		if(companyId == null){
			if(userId == null || userId == ""){
				user = UserUtils.getUser();
				userId = user.getId().toString();
			}
		}else{
			//根据企业id查询用户id
			String comSql = "SELECT * FROM sys_company WHERE id=? AND del_flag=0";
			Record companyInfo = Db.findFirst(comSql,companyId);
			userId = companyInfo.get("user_id").toString();
		}
		
		String id=getPara("id").replace("sm", "");
		String title=getPara("title");
		String desc=getPara("desc").trim();
		String img=getPara("img");
		String wordcolor = getPara("wordcolor");
		
		SysCompanyCustom sysCompanyCustom = SysCompanyCustom.dao.getModuleMsg(companyId, ModuleType.summary);
		int customId=sysCompanyCustom.getInt("id");
		int status=0;
		
		String common = "{'title':'"+title+"','wordcolor':'"+wordcolor+"'}";
		sysCompanyCustom.set("common", common).update();
		if("-1".equals(id)){
			SysCompanySummary sm = new SysCompanySummary();
			sm.set("custom_id", customId);
			sm.set("img", img.replace("delete", ""));
			sm.save();
		}else{
			status=SysCompanySummary.dao.updateSummary(customId, img);
		}
		
		Db.update("update cs_settings_basic set shop_desc=? where user_id=?",desc,userId);
		
		renderJson("true");
	}
	
	//=========================以下为简介子页面代码============================
	//简介子页面首页
	public void intoSummarySubpage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		companyId=getAttr("companyId");
		if(companyId == null){
			user = UserUtils.getUser();
			companyId = user.getLong("companyId");
		}
		//获取企业基本资料
		List<Record> comIntroduction = CompanyZl.dao.findCompanysSY(companyId);
		setAttr("company", comIntroduction.get(0));
		//获取页面名称（即导航栏对应的名称）和简介名称
		SysCompanyCustom sysCompanyCustom =SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), ModuleType.navigation);
		if(sysCompanyCustom == null){
			setAttr("pagename", "企业简介");
		}else{
			String navigationSql = "SELECT * FROM sys_company_custom_navigation WHERE custom_id=? AND item_id =? AND del_flag=0";
			Record nRec= Db.findFirst(navigationSql,sysCompanyCustom.getInt("id"),NavigationItem.summary);
			if(nRec == null){
				setAttr("pagename", "企业简介");
			}else{
				setAttr("pagename", nRec.getStr("item"));
			}
		}
		//和简介名称
		SysCompanyCustom sysCompanyCustomDesc =SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), ModuleType.summary);
		String common = sysCompanyCustomDesc.getStr("common");
		JSONObject jso = JSONObject.fromObject(common);
		setAttr("descName",jso.get("title"));
		setAttr("wordcolor",jso.get("wordcolor"));
		setAttr("companyMsgColor",jso.get("companyMsgColor"));
		
		String summaryImg = "SELECT * FROM sys_company_custom_summary WHERE custom_id=? AND del_flag=0";
		Record sumRec = Db.findFirst(summaryImg,sysCompanyCustomDesc.getInt("id"));
		setAttr("summary", sumRec);
		
		render("summarySubpage.jsp");
	}
	
	//更新公司名称、联系人、电话、邮箱
	@Before(ChangeUserMsgInterceptor.class)
	public void updateNCPM(){
		String comContact = getPara("comContact");
		String comPhoneEn = getPara("comPhoneEn");
		String comEmail = getPara("comEmail");
		String companyMsgColor = getPara("companyMsgColor");
		
		companyId=getAttr("companyId");
		String sql = "UPDATE sys_company SET contact=?,email=?,phone=? WHERE id=? AND del_flag=0";
		int result = Db.update(sql,comContact,comEmail,comPhoneEn,companyId);
		
		sql="select * from sys_company_custom where company_id=? and module_type=?";
		Record rc= Db.findFirst(sql,companyId,ModuleType.summary);
		String common=rc.get("common");
		JSONObject jso;
		boolean sta=false;
		if(StringUtils.isNotBlank(common)){
			jso=JSONObject.fromObject(common);
			jso.put("companyMsgColor", companyMsgColor);
			rc.set("common", jso.toString());
			sta=Db.update("sys_company_custom", rc);
		}
		
		if(result > 0&&sta){
			renderText("ok");
		}else{
			renderText("false");
		}
		
	}
	
	//更新左侧图片、公司注册名称、注册地址、注册资金、主营业务
	@Before(ChangeUserMsgInterceptor.class)
	public void updateINAFB(){
		String leftImg = getPara("leftImg");
		String reg_address = getPara("reg_address");
		String reg_fund = getPara("reg_fund");
		String reg_mainbusiness = getPara("reg_mainbusiness");
		String licenseImg = getPara("licenseImg");
		companyId=getAttr("companyId");
		
		String sql = "UPDATE sys_company SET address =?, license_img =?, registered_fund =?, major =? WHERE id =? AND del_flag = 0";
		Db.update(sql,reg_address,licenseImg,reg_fund,reg_mainbusiness,companyId);
		
		SysCompanyCustom scc = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), ModuleType.summary);
		
		String sql2 = "UPDATE sys_company_custom_summary SET subpage_left_img =? WHERE custom_id=? AND del_flag = 0";
		Db.update(sql2,leftImg,scc.getInt("id"));
		renderText("ok");
		
	}
	
}
