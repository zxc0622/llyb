package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qyk.model.Certificate;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;
import org.apache.commons.lang3.StringUtils;

@ControllerBind(controllerKey = "/Library/homeHonor")
public class EnterpriseHonorController extends Controller{

	/**
	 * 荣誉资质
	 */
	@ActionKey("/homepage/qualification")
	public void  enterpriseHonor(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank("enterpriseId")){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		List<Record> comp=News.dao.findId(enterpriseId);
			if(!(comp.isEmpty())){
                String pageNum = getPara("pageNum");
                if(StringUtils.isBlank(pageNum)){
                    pageNum = "1";
                }
				Page<Record> list = Certificate.dao.searchCertificate(Integer.valueOf(pageNum), 8,comp.get(0).get("id").toString());
				if(!(list.getList().isEmpty())){
					setAttr("honorList", list.getList());
					setAttr("recordPage", list);
				}
				List<Record> list3=News.dao.findPageNewsIDS(comp.get(0).get("id").toString());
				if(!(list3.isEmpty())){
					setAttr("nsList", list3);
				}
		}
		List<Record> list2 =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
		if(!(list2.isEmpty())){
			setAttr("companyList", list2.get(0));
		}
			
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.HONOR_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		render("EnterpriseHonor.jsp");
	}
}
