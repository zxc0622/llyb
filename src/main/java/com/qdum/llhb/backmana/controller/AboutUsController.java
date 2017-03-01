package com.qdum.llhb.backmana.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.problem.model.Problem;
@ControllerBind(controllerKey = "/platform")
public class AboutUsController extends Controller{
	/**
	 * 关于我们
	 */
	public void aboutUsInit(){
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		if(!(re.isEmpty())){
			setAttr("re",re);
		}
		List<Record> ads = AdLable.dao.getIndexImg();
		if(!(ads.isEmpty())){
			setAttr("ads",ads);
		}
		setAttr("index",getPara("index"));
		render("AboutUs.jsp");
	}
	/**
	 * 平台介绍
	 */
	public void platformInit(){
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		if(!(re.isEmpty())){
			setAttr("re",re);
		}
		List<Record> ads = AdLable.dao.getIndexImg();
		if(!(ads.isEmpty())){
			setAttr("ads",ads);
		}
		setAttr("numm", getPara("numm"));
		render("PlatformIntroduction.jsp");
	}
	/**
	 * 平台特点
	 */
	public void indexIconInit(){
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		if(!(re.isEmpty())){
			setAttr("re",re);
		}
		List<Record> ads = AdLable.dao.getIndexImg();
		if(!(ads.isEmpty())){
			setAttr("ads",ads);
		}
		setAttr("num",getPara("index"));
		render("indexIcon.jsp");
	}
	/**
	 * 帮助中心
	 */
	public void helpCenter(){
		String flag = getPara("flag");
		if(flag==null){
			flag="1";
		}
		setAttr("flag",flag);
		render("HelpCenter.jsp");
	}
	/**
	 * 常见问题 zhangxm
	 */ 
	public void commenProblem(){
		setAttr("remark",getPara("remark"));
		String type=getPara("type");
		setAttr("type", type);
		List<Record> list =Problem.dao.findQuesList(type);
		if(!(list.isEmpty())){
			setAttr("problemList",list);
		}
		render("commentProblem.jsp");
	}
}
