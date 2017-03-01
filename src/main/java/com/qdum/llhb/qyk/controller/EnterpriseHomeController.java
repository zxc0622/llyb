package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.qykCustom.EnterpriseTemplateInterceptor;
import com.qdum.llhb.ypcd.model.Album;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;
/**
 * 企业库首页
 * @author Administrator
 *
 */
@ControllerBind(controllerKey = "/Library/home")
public class EnterpriseHomeController extends Controller{
	/**
	 * 首页
	 */
	@Before(EnterpriseTemplateInterceptor.class)
	@ActionKey("/homepage")
	public void  enterpriseHome(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		
		List<Record> list1 =Product.dao.findPrdoductSupplyTen(enterpriseId);
		if(!(list1.isEmpty())){
			setAttr("supplyList", list1);
		}
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
			List<Record> list= Album.dao.enterpriseAlbumTen(comp.get(0).get("id").toString());
			if(!(list.isEmpty())){
				setAttr("album", list);
			}
		}
		//首页要查询首页的横幅
		//List<Record> hengF=Banner.dao.gethengF(enterpriseId);
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.HOMEPAGE_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		
		render("EnterpriseHome.jsp");
	}
}
