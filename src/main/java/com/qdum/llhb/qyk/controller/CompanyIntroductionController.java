package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;
import org.apache.commons.lang3.StringUtils;

@ControllerBind(controllerKey = "/Library/introduction")
public class CompanyIntroductionController extends Controller{
	/**
	 * 公司介绍
	 */
	@ActionKey("/homepage/introduction")
	public void introductionInit(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		List<Record> list = CompanyZl.dao.findCompanyIds(enterpriseId);
		if(!(list.isEmpty())){
			setAttr("company", list.get(0));
		}
		List<Record> list2 =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
		if(!(list2.isEmpty())){
			setAttr("companyList", list2.get(0));
		}
		List<Record> comp=News.dao.findId(enterpriseId);
		if(!(comp.isEmpty())){
			List<Record> list3=News.dao.findPageNewsIDS(enterpriseId);
			if(!(list3.isEmpty())){
				setAttr("nsList", list3);
			}
		}
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.COMPANY_INTRODUCTION_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		render("CompanyIntroduction.jsp");
	}
}
