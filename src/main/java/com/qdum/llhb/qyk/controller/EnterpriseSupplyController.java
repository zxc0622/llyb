package com.qdum.llhb.qyk.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.integration.model.IntergrationIssue;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;
import org.apache.commons.lang3.StringUtils;

@ControllerBind(controllerKey = "/Library/product")
public class EnterpriseSupplyController extends Controller{

	/**
	 * 供应产品
	 */
	@ActionKey("/homepage/products")
	public void  enterpriseSupply(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
        String pageNum = getPara("pageNum");
        if(StringUtils.isBlank(pageNum)){
            pageNum = "1";
        }
		Page<Record> list =Product.dao.findPrdoductSupply(Integer.valueOf(pageNum),10, enterpriseId);
		if(!(list.getList().isEmpty())){
			setAttr("supplyList", list.getList());
			setAttr("recordPage", list);
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
		}
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.SUPPLY_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		render("EnterpriseSupply.jsp");
	}
	/**
	 * 供应产品 -目录
	 */
    @ActionKey("/homepage/enterpriseCatalog")
	public void  enterpriseCatalog(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
        String pageNum = getPara("pageNum");
        if(StringUtils.isBlank(pageNum)){
            pageNum = "1";
        }
		Page<Record> list =Product.dao.findPrdoductSupply(Integer.valueOf(pageNum), 10, enterpriseId);
		if(!(list.getList().isEmpty())){
			setAttr("catalogList", list.getList());
			setAttr("recordPage", list);
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
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.SUPPLY_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		render("EnterpriseCatalog.jsp");
	}
}
