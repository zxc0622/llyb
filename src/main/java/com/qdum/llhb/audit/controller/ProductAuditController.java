package com.qdum.llhb.audit.controller;

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.audit.model.ProductApprove;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/auditList/productAudit")
@Before(AdminInterceptor.class)
public class ProductAuditController extends Controller {
	//private static final int pageSize = 8;
	private static final int auditing = 1;//待审核
	private static final int pass = 2;//待审核
	private static final int notAgree = 0;//待审核
	public void index(){
		List<DictPcr> list = DictPcr.dao.getChildList(0L);
		List<DictPcr> pcrList = Lists.newArrayList();
		for (DictPcr pcr : list) {
			String type = pcr.getType();
			if(pcr!=null && null != type &&(type.equals("material_type") || type.equals("equipment_type") || type.equals("service_type"))){
				pcrList.add(pcr);
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
		Page<Record> proPage = Product.dao.getAuditingPro(getParaToInt(0,1), pageSize,auditing, typeFirst, proName);
		if(proPage!=null){
			setAttr("proList",proPage.getList());
			setAttr("recordPage",proPage);
		}
		render("productAudit.jsp");
	}
	/*审核*/
	public void audit(){
		String staString = getPara("sta");
		int sta = 1;
		if(staString!=null && !staString.equals("") && staString.matches("[0-9]+")){
			sta = Integer.parseInt(staString);
		}
		String temp = getPara("ids");
		temp = temp.substring(0,temp.length()-1);
		String[] ids = temp.split(",");
		/*===修改inma_product_info表产品状态===*/
		Product.dao.auditing(sta,ids);
		for (String id : ids) {
			Product pro = Product.dao.findById(id);
			new PointController().publish("product", Long.parseLong(id), pro.getCreateBy());
		}
		/*===添加inma_product_approve表产品状态===*/
		String content = getPara("content");
		long userId = UserUtils.getUser().getId();
		boolean isSaved = false;
		for (String proId : ids) {
			ProductApprove pa = new ProductApprove();
			pa.set("product_id",proId);
			pa.set("approve_user", userId);
			if(sta==2){
				pa.set("result","Y");
			}else{
				pa.set("result", "N");
				pa.set("content",content);
			}
			pa.set("create_by", userId);
			pa.set("create_date", new Date());
			isSaved = pa.save();
		}
		if(isSaved){
			
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	/*商品详细信息审核*/
	public void seeProDetail(){
		String id = getPara("id");
		List<Record> proList = Product.dao.findAllInfo(0L, Long.parseLong(id));
		if(proList!=null){
			setAttr("pro",proList.get(0));
		}
		render("proDetail.jsp");
	}
	/*审核通过*/
	public void pass(){
		List<DictPcr> list = DictPcr.dao.getChildList(0L);
		List<DictPcr> pcrList = Lists.newArrayList();
		for (DictPcr pcr : list) {
			String type = pcr.getType();
			if(pcr!=null && null != type &&(type.equals("material_type") || type.equals("equipment_type") || type.equals("service_type"))){
				pcrList.add(pcr);
			}
		}
		setAttr("pcrList",pcrList);
		int pageNumber = 1;
		String temp = getPara("pageNum");
		if(temp!=null && !temp.equals("")){
			pageNumber = Integer.parseInt(temp);
		}
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
		Page<Record> proPage = Product.dao.getAuditingPro(getParaToInt(0,1), pageSize,pass, typeFirst, proName);
		if(proPage!=null){
			setAttr("proList",proPage.getList());
			setAttr("recordPage",proPage);
		}
		render("productPass.jsp");
	}
	/*审核未通过*/
	public void notAgree(){
		List<DictPcr> list = DictPcr.dao.getChildList(0L);
		List<DictPcr> pcrList = Lists.newArrayList();
		for (DictPcr pcr : list) {
			String type = pcr.getType();
			if(pcr!=null && null!=type &&(type.equals("material_type") || type.equals("equipment_type") || type.equals("service_type"))){
				pcrList.add(pcr);
			}
		}
		setAttr("pcrList",pcrList);
		int pageNumber = 1;
		String temp = getPara("pageNum");
		if(temp!=null && !temp.equals("")){
			pageNumber = Integer.parseInt(temp);
		}
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
		Page<Record> proPage = Product.dao.getAuditingPro(getParaToInt(0,1), pageSize,notAgree, typeFirst, proName);
		if(proPage!=null){
			setAttr("proList",proPage.getList());
			setAttr("recordPage",proPage);
		}
		render("productNotAgree.jsp");
	}
}
