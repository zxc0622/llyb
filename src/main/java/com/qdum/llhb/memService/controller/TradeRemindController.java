package com.qdum.llhb.memService.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.memService.model.TradeRemind;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/memSerevice/remind")
@Before(AdminInterceptor.class)
public class TradeRemindController extends Controller {
	public static final long typeParentId = 428L;//行业类型父类id
	public static final String industryType = "supply_type";//行业类型
	public static final int sta_audit = 1;//设置状态为审核
	public static final int sta_pass = 2;//设置状态为通过
	public static final int del_yes = 1;//设置逻辑删除位为1
	public void add(){
		List<DictPcr> typeList = DictPcr.dao.getChildrenByParent(industryType, typeParentId);
		Area.dao.setId(1L);
		List<Area> provList = Area.dao.getChildList();
		List<Dict> freqList = Dict.dao.getDictsByType("frequency_type");
		User user = UserUtils.getUser();
		List<TradeRemind> countList = TradeRemind.dao.findCount(user.getId());
		setAttr("typeList",typeList);
		setAttr("provList",provList);
		setAttr("freqList",freqList);
		setAttr("remindCount",countList.size());//已添加的总数
		render("tradeRemindAdd.jsp");
	}
	public void selectTypeAdd(){
		long parentId = getParaToLong("parentId");
		List<DictPcr> typeSecond = DictPcr.dao.getChildList(parentId);
		renderJson(typeSecond);
	}
	public void selectCityAdd(){
		long provId = getParaToLong("provId");
		Area.dao.setId(provId);
		List<Area> cityList = Area.dao.getChildList();
		renderJson(cityList);
	}
	public void addRemind(){
		User user = UserUtils.getUser();
		TradeRemind remind = new TradeRemind();
		remind.setType(getPara("type"));
		remind.setKeyWords(getPara("keyWords"));
		String typeFirst = getPara("typeFirst");
		if(typeFirst != null && !typeFirst.equals("") && !typeFirst.equals("undefined")){
			remind.setTypeFirst(Long.parseLong(typeFirst));
		}
		String typeSecond = getPara("typeSecond");
		if(typeSecond != null && !typeSecond.equals("") && !typeSecond.equals("undefined")){
			remind.setTypeSecond(Long.parseLong(typeSecond));
		}
		String provId = getPara("provId");
		if(provId != null && !provId.equals("") && !provId.equals("undefined")){
			remind.setProvId(Long.parseLong(provId));
		}
		String cityId = getPara("cityId");
		if(cityId != null && !cityId.equals("") && !cityId.equals("undefined")){
			remind.setCityId(Long.parseLong(cityId));
		}
		remind.setFrequency(getPara("frequency"));
		remind.setCreateBy(user.getId());
		remind.setSta(sta_audit);
		Date date = new Date();
		remind.setCreateDate(date);
		remind.save();
		renderJson("true");
	}
	public void audit(){
		User user = UserUtils.getUser();
		List<Record> auditList = TradeRemind.dao.getAll(sta_audit, user.getId());
		List<TradeRemind> countList = TradeRemind.dao.findCount(user.getId());
		setAttr("remindCount",countList.size());
		setAttr("auditList",auditList);
		render("tradeRemindAudit.jsp");
	}
	public void deleteAudit(){
		User user = UserUtils.getUser();
		long id = getParaToLong("id");
		TradeRemind.dao.findById(id).set("del_flag",del_yes).update();//逻辑删除信息
		List<Record> auditList = TradeRemind.dao.getAll(sta_audit, user.getId());
		List<TradeRemind> countList = TradeRemind.dao.findCount(user.getId());
		List<Map<String,Object>> mapList = mapList(auditList, countList);
		renderJson(mapList);
	}
	public void pass(){
		User user = UserUtils.getUser();
		List<Record> passList = TradeRemind.dao.getAll(sta_pass, user.getId());
		List<TradeRemind> countList = TradeRemind.dao.findCount(user.getId());
		setAttr("remindCount",countList.size());
		setAttr("passList",passList);
		render("tradeRemindPass.jsp");
	}
	public void deletePass(){
		User user = UserUtils.getUser();
		long id = getParaToLong("id");
		TradeRemind.dao.findById(id).set("del_flag",del_yes).update();//逻辑删除信息
		List<Record> auditList = TradeRemind.dao.getAll(sta_pass, user.getId());
		List<TradeRemind> countList = TradeRemind.dao.findCount(user.getId());
		List<Map<String,Object>> mapList = mapList(auditList, countList);
		renderJson(mapList);
	}
	/**
	 *查询包装方法 
	 */
	public List<Map<String,Object>> mapList(List<Record> auditList,List<TradeRemind> countList){
		List<Map<String,Object>> mapList =Lists.newArrayList();
		for (Record e : auditList) {
			if(e!=null){
				Map<String,Object> map = Maps.newHashMap();
				map.put("id", e.get("id"));
				map.put("type",e.get("type"));
				map.put("key_words",e.get("key_words"));
				map.put("first_name", e.get("first_name"));
				map.put("second_name",e.get("second_name"));
				map.put("prov_name", e.get("prov_name"));
				map.put("city_name", e.get("city_name"));
				map.put("create_date", e.getDate("create_date"));
				map.put("last_send", e.getDate("last_send"));
				map.put("freq_name", e.get("freq_name"));
				map.put("remindCount",countList.size());
				mapList.add(map);
			}
		}
		return mapList;
	}
}
