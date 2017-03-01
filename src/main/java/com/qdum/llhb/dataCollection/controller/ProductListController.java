package com.qdum.llhb.dataCollection.controller;

import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.sys.model.DictPcr;

@ControllerBind(controllerKey="/dataCollection/product")
@Before(AdminInterceptor.class)
public class ProductListController extends Controller {
	//private static final int pageSize = 8;//每页条数
	public void index(){
		List<DictPcr> list = DictPcr.dao.getChildList(0L);
		List<DictPcr> pcrList = Lists.newArrayList();
		for (DictPcr pcr : list) {
            if(null != pcr){
                String type = pcr.getType();
                if(null != type &&(type.equals("material_type") || type.equals("equipment_type") || type.equals("service_type"))){
                    pcrList.add(pcr);
                }
            }

		}
		setAttr("pcrList",pcrList);
		/*int pageNumber = 1;
		String temp = getPara("pageNum");
		if(temp!=null && !temp.equals("")){
			pageNumber = Integer.parseInt(temp);
		}*/
		String typeFirst = getPara("typeFirst");
		setAttr("typeFirst",typeFirst);
		String proName =  getPara("proName");
		setAttr("proName",proName);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> proPage = Product.dao.getProduct(getParaToInt(0,1), pageSize, typeFirst, proName);
		if(proPage!=null){
			setAttr("proList",proPage.getList());
			setAttr("recordPage",proPage);
		}
		render("productList.jsp");
	}
	public void viewDetail(){
		String id = getPara("id");
		List<Record> proList = Product.dao.findAllInfo(0L, Long.parseLong(id));
		if(proList!=null){
			setAttr("pro",proList.get(0));
		}
		render("productDetail.jsp");
	}
}
