package com.qdum.llhb.qykCustom.controller;


import java.util.List;

import net.sf.json.JSONObject;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyProduct;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 产品展示
 */
@ControllerBind(controllerKey = "/Library/showProd",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ShowProdController extends Controller {

	private User user;
	private Long companyId;
	private List<Record> prodType;
	
	/**
	 * 进入产品展示子页面
	 */
	public void intoShowProdSubpage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		prodType = SysCompanyProduct.dao.getProdTypeByTypeId(932);
		user=getAttr("user");
		setAttr("prodFirstType", prodType);
		//获取第一种类型的产品
		Object typeId=prodType==null?-1:prodType.get(0).get("id");
		int pageSize=getAttr("showShadeLayer")?7:8;
		Page<Record>  prodList = SysCompanyProduct.dao.getProdByFirstType(typeId,pageSize,1,user.get("id"));
		setAttr("prodList", prodList.getList());
		setAttr("totalPage",prodList.getTotalPage());
		render("showProdSubpage.jsp");
	}
	
	//获取产品类型
	public void getProdType(){
		int typeId=getParaToInt("typeId");
		prodType=prodType = SysCompanyProduct.dao.getProdTypeByTypeId(typeId);
		renderJson(prodType);
	}
	
	//获取地区信息
	public void getAreaList(){
		String areaId=getPara("areaId");
		List<Record> areaList= Area.dao.getChildList2(areaId);
		renderJson(areaList);
	}
	
	//获取产品周期
	public void getPastDate(){
		List<Record> dateList = Db.find("SELECT id,`value`,label FROM `sys_dict` where type='period_type' and del_flag=0 order by value;");
		renderJson(dateList);
	}
	
	//获取产品单位
	public void getProdUnit(){
		List<Record> prodUnitList = Db.find("SELECT id,`value`,label FROM `sys_dict` where type='unit_type' and del_flag=0;");
		renderJson(prodUnitList);
	}
	
	//更新产品
	public void uploadProd(){
		String prodStr=getPara("prodMsg");
		user=UserUtils.getUser();
		JSONObject prodJson=JSONObject.fromObject(prodStr.replace("undefined", ""));
		prodJson.put("userId",user.get("id"));
		String result = SysCompanyProduct.dao.updateProd(prodJson);
		if("false".equals(result)){
			renderJson("false");
		}else{
			renderJson(result);
		}
	}

	//删除产品
	public void delProd(){
		int prodId=getParaToInt("prodId");
		boolean success = Product.dao.deleteById(prodId);
		if(success){
			renderJson("true");
		}else{
			renderJson("false");
		}
	}
	
	//根据产品类型和用户id分页获取产品
	public void getProdByUserIdAndProdType(){
		user=getAttr("user");
		Object typeId=getPara("typeId");
		int pageNumber=getParaToInt("pageNumber");
		int pageSize=getAttr("showShadeLayer")?7:8;
		
		Page<Record>  prods = SysCompanyProduct.dao.getProdByFirstType(typeId,pageSize,pageNumber,user.get("id"));
		List<Record> prodList = prods.getList();
		prodList.add(0, (new Record()).set("totalPage", prods.getTotalPage()));
		renderJson(prodList);
	}
	
	//更具产品id获取产品信息
	public void getProdById(){
		Object prodId = getPara("prodId");
		Product prod = Product.dao.findById(prodId);
		renderJson(prod==null?new Product():prod);
	}
}
