package com.qdum.llhb.backmana.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.User;

import net.sf.json.JSONArray;

/**
 * 推荐服务
 */
@ControllerBind(controllerKey = "/backmana/recommend")
public class RecommendServiceController extends Controller {

	public void index() {

	}

	/**
	 * 推荐服务
	 */
	public void recommend_v1() {
		List<Record> ss = SupplyInfo.dao.getSomeSupplys(null, null,"提交中");
		List<Record> cs = Company.dao.getHbCompany(null);
		setAttr("ss", ss);
		setAttr("cs", cs);
		render("recommend.jsp");
	}

	/**
	 * 异步获取环保需求信息
	 */
	public void getSupplysAjax() {
		String date = getPara("date");
		String remarks = getPara("remarks");
		List<Record> ss = SupplyInfo.dao.getSomeSupplys(date, remarks,"提交中");
		renderJson(ss);
	}

	/**
	 * 异步获取公司名称
	 */
	public void getCompanyAjax() {
		String company_name = getPara("data");
		List<Record> cs = Company.dao.getHbCompany(company_name);
		renderJson(cs);
	}

	/**
	 * 一键推送
	 */
	public void sendRecommendAjax() {
		String hbfwIdStr = getPara("hbfwIds");//环保需求id
		String cfUserPhoneArr = getPara("cf_phone_arr");//产废企业手机号
		String compIdStr = getPara("company_ids");//环保公司id
		String hbUserIdStr = getPara("hb_user_ids");//环保公司用户id
		String[] hbfwIds = hbfwIdStr.split("_");
		String[] companyIds = compIdStr.split("_");
		String[] hbUserIds = hbUserIdStr.split("_");
		String[] cfUserPhones = cfUserPhoneArr.split("_");
		//产废企业
		String csMsg = "尊敬的用户：您好！您在优蚁环保网上发布的需求已有多家环保公司响应，请及时登录平台查看环保公司详细信息。";
		//给发布环保需求的企业发信息
		for(String cfPhone :cfUserPhones ){
			sendMsg(cfPhone, csMsg);
		}
		//环保企业
		String hbMsg = "尊敬的用户：您好！有新的环保需求找到您，请及时登录优蚁环保网查看需求企业详细信息并联系他们提供解决方案。"; 
		//发信息给环保企业
		for(String user_id : hbUserIds){
			String phoneNum = User.dao.findPhoneById(user_id);
			sendMsg(phoneNum, hbMsg);
		}
		deleteRepeatRecommend(hbfwIds);
		boolean flag = Company.dao.recommend(hbfwIds, companyIds);
		if(flag){//数据添加成功后,发送短信
			
		}
		renderJson(flag);
	}

	// 去除数据库里已存在的推荐
	private void deleteRepeatRecommend(String[] hbfwIds) {
		for (String hbId : hbfwIds) {
			Company.dao.deleteRecomComp(hbId);
		}
	}
	//发送短信
	private void sendMsg(String phoneNum, String msg){
		ValiCode.sendCheckCode(phoneNum, msg,null);
	}
	
	//=======================================================================
	/**
	 * 推荐服务
	 */
	public void recommend() {
		//查询需求
		Page<Record> ss = SupplyInfo.dao.getSomeSupplysByPage(null, null, null, null, 1, 10);
		setAttr("totalPage", ss.getTotalPage());
		setAttr("pageNumber",ss.getPageNumber());
		setAttr("ss", ss.getList());
		//查询环保公司
		Page<Record> cs = Company.dao.getHbCompanyByPage(null, 1, 10);
		setAttr("comtotalPage", cs.getTotalPage());
		setAttr("compageNumber",cs.getPageNumber());
		setAttr("cs", cs.getList());
		render("../../v2/backmana/recommend/recommend.jsp");
	}
	
	/**
	 * 一键推送
	 */
	public void sendRecommendAjax_v2() {
		String hbfwIdStr = getPara("hbfwIds");//环保需求id
		String cfUserPhoneArr = getPara("cf_phone_arr");//产废企业手机号
		String hbCompany_id = getPara("hbCompany_id");//环保公司id
		String hbCompanyUser_id = getPara("hbCompanyUser_id");//环保公司用户id
		String[] hbfwIds = hbfwIdStr.split("_");
		String[] cfUserPhones = cfUserPhoneArr.split("_");
		
		//deleteRepeatRecommend(hbfwIds);不删除，保留每次的推荐记录
		boolean flag = Company.dao.recommend_v2(hbfwIds, hbCompany_id);//推送需求记录
		if(flag){//数据添加成功后,发送短信
			//产废企业
			String csMsg = "尊敬的用户：您好！您在优蚁环保网上发布的需求已有环保公司响应，请及时登录平台查看环保公司详细信息。";
			//给发布环保需求的企业发信息
			for(String cfPhone :cfUserPhones ){
				sendMsg(cfPhone, csMsg);
			}
			
			//环保企业
			String hbMsg = "尊敬的用户：您好！有新的环保需求找到您，请及时登录优蚁环保网查看需求企业详细信息并联系他们提供解决方案。"; 
			//发信息给环保企业
			String phoneNum = User.dao.findPhoneById(hbCompanyUser_id);
			sendMsg(phoneNum, hbMsg);
		}
		renderJson(flag);
	}
	
	/**
	 * ajax获取需求
	 */
	public void getNeedForAjax(){
		//查询需求
		String provinceName = null;
		String cityName = null;
		String remarks = getPara("remarks");
		String createDate = getPara("createDate");
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		int pageSize = 10; 
		Page<Record> ss = SupplyInfo.dao.getSomeSupplysByPage(provinceName, cityName, remarks, createDate, pn, pageSize);
		renderJson(JSONArray.fromObject(ss));
	}
	

	/**
	 * ajax获取环保公司
	 */
	public void getCompanyForAjax(){
		String companyName = getPara("companyName");
		String pageNumber = getPara("pageNumber");
		int pn = Integer.parseInt(pageNumber);
		int pageSize = 10; 
		Page<Record> cs = Company.dao.getHbCompanyByPage(companyName, pn, pageSize);
		renderJson(JSONArray.fromObject(cs));
	}
	
	//加载显示推送公司页面
	public void showCompany(){
		//查询环保公司
		Page<Record> cs = Company.dao.getHbCompanyByPage(null, 1, 10);
		setAttr("comtotalPage", cs.getTotalPage());
		setAttr("compageNumber",cs.getPageNumber());
		setAttr("cs", cs.getList());
		render("../../v2/backmana/recommend/recommend-company.jsp");
	}
	
}
