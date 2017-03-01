package com.qdum.llhb.productmana.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/proManage/past")
public class ProductPast extends Controller {
	private static final int sta = 2;//设置商品状态为已通过
	private User user = UserUtils.getUser();
	//private static final int num = 10;//每页条数
	private static final int del_yes = 1;//  0:表示未删除   1：表示已删除
	public void index(){
		render("productPast.jsp");
		setProType();//设置商品类型
		queryAudit();//查询审核中列表
		int num = 10;//每页条数
		setAttr("num",num);//设置每页条数
		auditCount();//设置总页数
	}
	//加载商品类型
	public void setProType(){
		List<DictPcr> list =DictPcr.dao.getChildList(0L);
		List<DictPcr> listType = Lists.newArrayList();
		for (DictPcr e : list) {
			if(e!=null && ("service_type".equals(e.getType()) || "material_type".equals(e.getType()) || "equipment_type".equals(e.getType()))){
				listType.add(e);
			}
		}
		setAttr("listType",listType);
	}
	//查询已过期中列表
	public void queryAudit(){
		int pageIndex = 0;
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate = sf.format(date);
		int num = 10;//每页条数
		List<Record> auditList = Product.dao.findProByPastDate(sta,user.getId(),curDate,pageIndex,num);
		List<Product> countAudit = Product.dao.findCount(sta,user.getId());
		List<Map<String,Object>> mapList = mapList(auditList,countAudit,pageIndex+1,num);
		setAttr("auditList",mapList);
	}
	/**
	 * 查询已过期中列表
	 * searchModel: 1、商品类型和名字都有
	 * 				2、只有商品类型
	 * 				3、只有名字
	 * 				4、商品类型和名字都没有
	 */
	public void searchAudit(){
		int typeValue = getParaToInt("typeValue");
		int searchModel = getParaToInt("searchModel");
		String proName = getPara("proName");
		int num = 10;//每页条数
		String pageSizeStr = getPara("pageSize");
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			num = Integer.parseInt(pageSizeStr);
		}
		int pageIndex = (getParaToInt("curPage")-1<0? 0:(getParaToInt("curPage")-1))*num;
		int curPage = pageIndex/num +1;
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate = sf.format(date);
		if(searchModel==1){
			List<Record> auditList = Product.dao.findProByTypeFirstAndProNameAndPastDate(sta,user.getId(), curDate, typeValue, proName, pageIndex, num);
			List<Product> countAudit = Product.dao.findCountByTypeFirstAndProName(sta,user.getId(), typeValue, proName);
			List<Map<String,Object>> mapList = mapList(auditList,countAudit,curPage,num);			
			renderJson(mapList);
		}else if(searchModel==2){
			List<Record> auditList = Product.dao.findProByTypeFirstAndPastDate(sta,user.getId(), curDate, typeValue, pageIndex, num);
			List<Product> countAudit = Product.dao.findCountByTypeFirst(sta,user.getId(), typeValue);
			List<Map<String,Object>> mapList = mapList(auditList,countAudit,curPage,num);
			renderJson(mapList);
		}else if(searchModel==3){
			List<Record> auditList = Product.dao.findProByProNameAndPastDate(sta,user.getId(), curDate, proName, pageIndex, num);
			List<Product> countAudit = Product.dao.findCountByProName(sta,user.getId(), proName);
			List<Map<String,Object>> mapList = mapList(auditList,countAudit,curPage,num);
			renderJson(mapList);
		}else if(searchModel==4){
			List<Record> auditList = Product.dao.findProByPastDate(sta, user.getId(), curDate, pageIndex, num);
			List<Product> countAudit = Product.dao.findCount(sta,user.getId());
			List<Map<String,Object>> mapList = mapList(auditList,countAudit,curPage,num);
			renderJson(mapList);
		}else{
			renderJson("niTMdouwo");
		}
	}
	/**
	 *查询包装方法 
	 */
	public List<Map<String,Object>> mapList(List<Record> auditList,List<Product> countAudit, int curPage,int num){
		List<Map<String,Object>> mapList =Lists.newArrayList();
		String createDate = null;
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate= sf.format(date);
		int auditCount = 0;
		for (Product e : countAudit) {
			String pastDate = sf.format(e.getPastDate());
			if(e!=null && pastDate.compareTo(curDate)<0){
				auditCount++;
			}
		}
		if(auditList != null && auditList.size() >0){
			for (Record e : auditList) {
				if(e!=null){
					Map<String,Object> map = Maps.newHashMap();
					map.put("id", e.get("id"));
					map.put("pic1",e.get("pic1"));
					map.put("pic2",e.get("pic2"));
					map.put("pic3",e.get("pic3"));
					map.put("pro_name",e.get("pro_name"));
					map.put("name", e.get("name"));
					createDate = sf.format(e.getDate("create_date"));
					map.put("create_date",createDate);
					map.put("page_view", e.get("page_view"));
					map.put("num",num);
					map.put("curPage",curPage);
					map.put("auditCount",auditCount);
					mapList.add(map);
				}
			}
		}else{
			Map<String,Object> map = Maps.newHashMap();
			curPage = 0;
			map.put("curPage",curPage);
			map.put("auditCount",auditCount);
			mapList.add(map);
		}
		return mapList;
	}
	//已过期商品总条数
	public void auditCount(){
		List<Product> list = Product.dao.findCount(sta,user.getId());
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String curDate= sf.format(date);
		int auditCount = 0;
		for (Product e : list) {
			String pastDate = sf.format(e.getPastDate());
			if(e!=null && pastDate.compareTo(curDate)<0){//当过期时间小于于当前时间
				auditCount++;
			}
		}
		setAttr("auditCount",auditCount);
		if(auditCount != 0){
			setAttr("curPage",1);//设置当前页码
		}else{
			setAttr("curPage",0);//设置当前页码
		}
		int pageCount = (int)Math.ceil(auditCount/10.0);
		setAttr("countPage",pageCount);
	}
	//图片加载
	public void proPic(){
		String imgUrl = getPara("imgUrl");
		renderJson(new File(imgUrl));
	}
	//删除已过期商品
	public void delAudit(){
		String sid = getPara("id");
		if(sid != null && !sid.equals("")){
			if(sid.charAt(sid.length()-1)==','){
				sid = sid.substring(0, sid.length()-1);
			}
			String[] ids = sid.split(",");
			int id = 0;
			for (String strId : ids) {
				id = Integer.parseInt(strId);
				Product.dao.findById(id).set("del_flag",del_yes).update();
			}
			renderJson(true);
		}
	}
}
