package com.qdum.llhb.qyk.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;

@ControllerBind(controllerKey = "/Library/homeNews")
public class EnterpriseNewsBigController extends Controller{

	/**
	 * 新闻大图
	 */
	public void  enterpriseNewsBig(){
		String newsId=getPara("newsId");
		String bigId=getPara("bigId");
		String flag=getPara("flag");
		String shopId=getPara("shopId");
		String enterpriseId =getPara("enterpriseId");
		setAttr("enterpriseId", enterpriseId);
		List<Record> list = new ArrayList<Record>();
		if(newsId!=null&&!(newsId.equals(""))){
			 list =News.dao.findNewsSy(newsId);
		}
		if(bigId!=null&&!(bigId.equals(""))){
			list=News.dao.findNewsList(bigId,flag,shopId);
		}
		if(!(list.isEmpty())){
			setAttr("newsList", list);
		}
		setAttr("flagS", flag);
		List<Record> list2 =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
		if(!(list2.isEmpty())){
			setAttr("companyList", list2.get(0));
		}
		List<Record> comp=News.dao.findId(enterpriseId);
		if(!(comp.isEmpty())){
			List<Record> list3=News.dao.findPageNewsIDS(comp.get(0).get("id").toString());
			if(!(list3.isEmpty())){
				setAttr("nsList", list3);
			}
		}
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.NEWS_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}		
		render("EnterpriseNewsBig.jsp");
	}

}
