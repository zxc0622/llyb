package com.qdum.llhb.qyk.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.StringUtils;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.Case;

import java.util.List;

/**
 * @author ZhouXiang
 * @date 2016/8/5 10:36
 * 站内搜索
 */
@ControllerBind(controllerKey = "/Library/search")
public class EnterpriseSearchController extends Controller {
    public void index() {
        String name = getPara("para");
        setAttr("keyName",name);
        String enterpriseId = getPara("enterpriseId");
        List<Record> list2 =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
        if(!(list2.isEmpty())){
            setAttr("companyList", list2.get(0));
        }

        Product productDao = Product.dao;
        Case caseDao = Case.dao;

        List<Record> productList = productDao.getProductByNameAndEId(name, enterpriseId);
        setAttr("productList", productList);
        List<Record> caseList = caseDao.getCaseByNameAndEId(name, enterpriseId);
        setAttr("caseList", caseList);

        setAttr("enterpriseId", enterpriseId);
        renderJsp("EnterpriseSearch.jsp");
    }

}

