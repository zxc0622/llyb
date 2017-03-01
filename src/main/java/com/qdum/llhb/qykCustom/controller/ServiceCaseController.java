package com.qdum.llhb.qykCustom.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Case;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 服务案例模块自定义
 */
@ControllerBind(controllerKey = "/Library/serviceCase",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ServiceCaseController  extends Controller{
	private User user;
	private Long companyId;

	//==================================以下为服务案例子页面代码=================================
	//进入服务案例子页面
	public void intoServiceCaseSubpage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		String number = getPara("pageNumber");
		String size = getPara("pageSize");
		companyId=getAttr("companyId");
		String userId = getPara("userId");
		int pageNumber = 1;
		int pageSize = 7;
		if(!(StringUtils.isEmpty(number))){
			pageNumber = Integer.valueOf(number);
		}
		if(!(StringUtils.isEmpty(size))){
			pageSize = Integer.valueOf(size);
		}
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
		
		String select = "SELECT *";
		String sqlExceptSelect = "FROM inma_case_info WHERE user_id=? AND del_flag =0 ORDER BY create_date DESC";
		Page<Record> pageInfo = Db.paginate(pageNumber, pageSize, select, sqlExceptSelect,userId);
		
		List<Record> pageContent = pageInfo.getList();
		int thisPageNumber = pageInfo.getPageNumber();
		int thisPageSize = pageInfo.getPageSize();
		int totalPage = pageInfo.getTotalPage();
		
		setAttr("pageContent",pageContent);
		setAttr("pageNumber",thisPageNumber);
		setAttr("pageSize",thisPageSize);
		setAttr("totalPage",totalPage);
		//查询案例分类
//		List<Record> caseTypeList = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=1201 AND del_flag=0 ORDER BY sort");
//		setAttr("caseTypeList",caseTypeList);
		Record cRec = Db.findFirst("SELECT * FROM sys_dict_pcr WHERE parent_id=0 AND type='case_type' and del_flag=0");
		if(cRec != null){
			List<Record> caseTypeList = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=? AND del_flag=0 order by sort",cRec.get("id"));
			setAttr("caseTypeList",caseTypeList);
			List<Record> caseTypeList2 = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=? AND del_flag=0 order by sort",caseTypeList.get(0).get("id"));
			setAttr("caseTypeList2",caseTypeList2);
		}
		//查询行业分类
		List<Record> industryList = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=1 AND del_flag=0");
		setAttr("industryList", industryList);
		List<Record> industryList2 = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=2 AND del_flag=0");
		setAttr("industryList2", industryList2);
		//查询地址
		List<Record> provinceList = Db.find("SELECT * FROM sys_area WHERE parent_id=1 AND del_flag=0");
		setAttr("provinceList", provinceList);
		List<Record> cityList = Db.find("SELECT * FROM sys_area WHERE parent_id=8 AND del_flag=0");
		setAttr("cityList", cityList);
		render("serviceCaseSubpage.jsp");
	}
	
	//进入服务案例详情子页面
	public void detail(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		setAttr("showShadeLayer", false);
		
		String caseId = getPara(1);
		String sql = "SELECT * FROM inma_case_info WHERE id=? AND del_flag=0;";
		Record caseInfo = Db.findFirst(sql,caseId);
		setAttr("caseInfo", caseInfo);
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
		setAttr("caseProv", caseProv);
		setAttr("caseCity", caseCity);
		setAttr("caseArea", caseArea);
		
		long userid = caseInfo.getLong("user_id");
		String comSql = "SELECT * FROM sys_company WHERE user_id=? AND del_flag=0";
		Record companyInfo = Db.findFirst(comSql,userid);
		setAttr("companyInfo", companyInfo);
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
		setAttr("companyProv", companyProv);
		setAttr("companyCity", companyCity);
		
		//判断改案例是否已收藏
		user = UserUtils.getUser();
		String cllSql = "SELECT * FROM ms_business_collect WHERE type=? AND collect_id=? AND create_by=? AND del_flag=0";
		List<Record> cllLsit = Db.find(cllSql,5,caseId,user.getId());
		if(cllLsit.size() > 0){
			setAttr("cllFlag","1");//已收藏
		}else{
			setAttr("cllFlag","0");//未收藏
		}
		render("serviceCaseDetail.jsp");
	}
	
	//新增案例
	public void addCase(){
		String caseName = getPara("caseName");//案例名称
		String caseTypeId = getPara("caseTypeId");//类型ID
		String caseTypeName = getPara("caseTypeName");//案例类型
		String caseTypeId2 = getPara("caseTypeId2");//类型ID
		String caseTypeName2 = getPara("caseTypeName2");//案例类型
		String industrys1Id = getPara("industrys1Id");
		String industrys1Name = getPara("industrys1Name");
		
		String industrys2Id = getPara("industrys2Id");
		String industrys2Name = getPara("industrys2Name");
		String casePic1 = getPara("casePic1");
		String casePic2 = getPara("casePic2");
		String casePic3 = getPara("casePic3");
		
		String price = getPara("price");
		String startTime = getPara("startTime");
		String endTime = getPara("endTime");
		String prov = getPara("prov");
		String city = getPara("city");
		
		String area = getPara("area");
		String detailAddress = getPara("detailAddress");
		String checkStandard = getPara("checkStandard");
		String caseDesc = getPara("caseDesc");
		String caseId = getPara("caseId");
		
		String time_length = "";
		//计算时间差---工程时长
		if(startTime != "" && endTime != ""){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date stdate = sdf.parse(startTime);
				Date enddate = sdf.parse(endTime);
				long enl = enddate.getTime();
				long stl = stdate.getTime();
				long enstl = (enl - stl)/(1000*3600*24);
				int  timel = Integer.parseInt(String.valueOf(enstl));
				time_length = timel + "天";
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
		}
		
		if(startTime.equals("")){
			startTime = null;
		}
		
		if(endTime.equals("")){
			endTime = null;
		}
		
		if(price.equals("")){
			price = null;
		}
		
		if(area.equals("")){
			area = null;
		}
		
		User user = UserUtils.getUser();
		long userId = user.getId();
		
		Case serviceCase = new Case();
		serviceCase.set("user_id", userId);
		serviceCase.set("case_name", caseName);
		serviceCase.set("type_id", caseTypeId);
		serviceCase.set("case_type", caseTypeName);
		serviceCase.set("type_id2", caseTypeId2);
		serviceCase.set("case_type2", caseTypeName2);
		serviceCase.set("industry1_type_id", industrys1Id);
		
		serviceCase.set("industry1_type_name", industrys1Name);
		serviceCase.set("industry2_type_id", industrys2Id);
		serviceCase.set("industry2_type_name", industrys2Name);
		serviceCase.set("prov_id", prov);
		serviceCase.set("city_id", city);
		
		serviceCase.set("area_id", area);
		serviceCase.set("address", detailAddress);
		serviceCase.set("case_desc", caseDesc);
		serviceCase.set("pic1", casePic1);
		serviceCase.set("pic2", casePic2);
		
		serviceCase.set("pic3", casePic3);
		serviceCase.set("price", price);
		serviceCase.set("start_time", startTime);
		serviceCase.set("end_time", endTime);
		serviceCase.set("time_length", time_length);
		
		serviceCase.set("check_standard", checkStandard);
		serviceCase.set("sta", 2);
		serviceCase.set("create_by", userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String createDate = sdf.format(new Date());
		serviceCase.set("create_date", createDate);
	
		boolean flag = serviceCase.save();
	
		JSONObject jo = new JSONObject();
		if(flag){
			jo.put("sta", "ok");
			jo.put("caseId", serviceCase.get("id"));
			jo.put("userId", userId);
		}else{
			jo.put("sta", "fail");
		}
		renderJson(jo);
		
	}
	
	//修改案例
	public void updateCase(){
		String caseName = getPara("caseName");//案例名称
		String caseTypeId = getPara("caseTypeId");//类型ID
		String caseTypeName = getPara("caseTypeName");//案例类型
		String caseTypeId2 = getPara("caseTypeId2");//类型ID
		String caseTypeName2 = getPara("caseTypeName2");//案例类型
		String industrys1Id = getPara("industrys1Id");
		String industrys1Name = getPara("industrys1Name");
		
		String industrys2Id = getPara("industrys2Id");
		String industrys2Name = getPara("industrys2Name");
		String casePic1 = getPara("casePic1");
		String casePic2 = getPara("casePic2");
		String casePic3 = getPara("casePic3");
		
		String price = getPara("price");
		String startTime = getPara("startTime");
		String endTime = getPara("endTime");
		String prov = getPara("prov");
		String city = getPara("city");
		
		String area = getPara("area");
		String detailAddress = getPara("detailAddress");
		String checkStandard = getPara("checkStandard");
		String caseDesc = getPara("caseDesc");
		String caseId = getPara("caseId");
		
		String time_length = "";
		
		//计算时间差---工程时长
		if(startTime != "" && endTime != ""){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date stdate = sdf.parse(startTime);
				Date enddate = sdf.parse(endTime);
				long enl = enddate.getTime();
				long stl = stdate.getTime();
				long enstl = (enl - stl)/(1000*3600*24);
				int  timel = Integer.parseInt(String.valueOf(enstl));
				time_length = timel + "天";
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		User user = UserUtils.getUser();
		long userId = user.getId();
		
		String sql = "UPDATE inma_case_info SET case_name = ?, type_id = ?,"
				+ " case_type = ?,type_id2 = ?,case_type2 = ?, industry1_type_id = ?, industry1_type_name = ?,"
				+ " industry2_type_id = ?, industry2_type_name = ?,"
				+ " prov_id = ?, city_id = ?, area_id = ?, address = ?, case_desc = ?,"
				+ " pic1 = ?, pic2 = ?, pic3 = ?, price = ?, start_time = ?,"
				+ " end_time = ?, time_length = ?, check_standard = ?, update_by = ?,"
				+ " update_date = NOW() WHERE id =? AND user_id =?";
		
		if(area == ""){
			area = null;
		}
		
		if(price == ""){
			price = null;
		}
		
		if(startTime == ""){
			startTime = null;
		}
		
		if(endTime == ""){
			endTime = null;
		}
		
		
		int result = Db.update(sql,caseName,caseTypeId,caseTypeName,caseTypeId2,caseTypeName2,industrys1Id,
				industrys1Name,industrys2Id,industrys2Name,prov,city,area,detailAddress,
				caseDesc,casePic1,casePic2,casePic3,price,startTime,endTime,time_length,
				checkStandard,userId,caseId,userId);
		
		JSONObject jo = new JSONObject();
		if(result > 0){
			jo.put("sta", "ok");
		}else{
			jo.put("sta", "fail");
		}
		renderJson(jo);
	}
	
	
	//删除案例
	public void deleteCaseById(){
		String caseId = getPara("caseId");
		String sql = "UPDATE inma_case_info SET del_flag=1 WHERE id=? AND user_id=?";
		User user = UserUtils.getUser();
		long userId = user.getId();
		int result = Db.update(sql,caseId,userId);
		if(result > 0){
			renderText("ok");
		}else{
			renderText("fail");
		}
	}
	
	
	//根据id获取案例信息
	public void getCaseById(){
		String caseId = getPara("caseId");
		String sql = "SELECT * FROM inma_case_info WHERE id=? AND del_flag=0;";
		Record caseInfo = Db.findFirst(sql,caseId);
		renderJson(JSONArray.fromObject(caseInfo));
	}
	
	//根据id获取类型信息
	public void getTypeById(){
		String id = getPara("id");
		String sql = "SELECT * FROM sys_dict_pcr WHERE id=? AND del_flag=0 ORDER BY sort";
		List<Record> typeInfo = Db.find(sql,id);
		renderJson(JSONArray.fromObject(typeInfo));
	}
	
	//根据父id获取类型列表
	public void getTypeByParentId(){
		String parentId = getPara("parentId");
		String sql = "SELECT * FROM sys_dict_pcr WHERE parent_id=? AND del_flag=0 ORDER BY sort";
		List<Record> typeInfo = Db.find(sql,parentId);
		renderJson(JSONArray.fromObject(typeInfo));
	}
	
	//根据id获取地址信息
	public void getAeraById(){
		String id = getPara("id");
		String sql = "SELECT * FROM sys_area WHERE id=? AND del_flag=0";
		List<Record> typeInfo = Db.find(sql,id);
		renderJson(JSONArray.fromObject(typeInfo));
	}
	
	//根据父id获取地址列表
	public void getAeraByParentId(){
		String parentId = getPara("parentId");
		String sql = "SELECT * FROM sys_area WHERE parent_id=? AND del_flag=0";
		List<Record> typeInfo = Db.find(sql,parentId);
		renderJson(JSONArray.fromObject(typeInfo));
	}
	
	//根据页码获取服务案例数据
	public void getServiceCaseByPageNumber(){
		String select = "SELECT *";
		String sqlExceptSelect = "FROM inma_case_info WHERE user_id=? AND del_flag =0 ORDER BY create_date DESC";
		Page<Record> pageInfo = Db.paginate(getParaToInt("pageNumber"), 7, select, sqlExceptSelect,getPara("userId"));
		List<Record> pageContent = pageInfo.getList();
		renderJson(pageContent);
	}
}
