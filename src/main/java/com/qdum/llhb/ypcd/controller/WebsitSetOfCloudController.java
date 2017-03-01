package com.qdum.llhb.ypcd.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.Website;

@ControllerBind(controllerKey="/ypcd/website")
@Before(AdminInterceptor.class)
public class WebsitSetOfCloudController extends Controller {
	public void index(){
		User user = UserUtils.getUser();
		List<Website> webList = Website.dao.getWebsite(user.getId());
		if(webList != null){
			for (Website website : webList) {
				setAttr("website",website);
			}
		}
		render("websiteSet.jsp");
	}
	public void saveSetting(){
		User user = UserUtils.getUser();
		Website website = new Website();
		List<Record> list = Basic.dao.findBasicId(user.getId());
		long shopId = list.get(0).getLong("id");
		List<Website> webList = Website.dao.getWebsite(user.getId());
		if(webList != null && webList.size()>0){
			long id = 0L;
			for (Website e : webList) {
				id = e.getId();
			}
			Website.dao.findById(id).set("name", getPara("name")).set("short_desc", getPara("shortDesc"))
			.set("we_num", getPara("weNum")).set("logo_pic", getPara("logoPic")).set("two_dimension_code_pic", getPara("dimensionCode"))
			.set("banner_pic", getPara("bannerPic")).set("detail_desc", getPara("detailDesc")).set("key_words", getPara("keyWords"))
			.set("update_by", user.getId()).set("update_date", new Date())
			.update();
		}else{
			website.setShopId(shopId);
			website.setName(getPara("name"));
			website.setShortDesc(getPara("shortDesc"));
			website.setWeNum(getPara("weNum"));
			website.setLogoPic(getPara("logoPic"));
			website.setDimensionCode(getPara("dimensionCode"));
			website.setBannerPic(getPara("bannerPic"));
			website.setDetailDesc(getPara("detailDesc"));
			website.setKeyWords(getPara("keyWords"));
			website.setCreateBy(user.getId());
			Date date = new Date();
			website.setCreateDate(date);
			website.save();
		}
		renderJson(true);;
	}
	
}
