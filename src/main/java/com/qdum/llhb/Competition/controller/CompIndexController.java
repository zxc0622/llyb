package com.qdum.llhb.Competition.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StringKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.TmCompOrder;
import com.qdum.llhb.Competition.vo.CompSecondInfo;
import com.qdum.llhb.Competition.vo.CompThirdInfo;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.common.utils.PriceUtils;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.DictPcr;


@ControllerBind(controllerKey="/competition/index")
public class CompIndexController extends Controller {
	private static final String ORDINARY_WS = "347";//普通废物id
	private static final String DANGEROUS_WS = "348";//危险废物id
	private static final long MID_AD_LABEL_ID = 39L;//中间 大广告
	private static final long COM_AD_LABEL_ID = 40L;//中间 大广告
	public void index(){
		List<Record> ordComList = Competition.dao.getListByType(ORDINARY_WS);
		setAttr("ordComList",ordComList);
		List<Record> danComList = Competition.dao.getListByType(DANGEROUS_WS);
		setAttr("danComList",danComList);
		List<Record> provComList = Competition.dao.getListByProv();
		setAttr("provComList",provComList);
		//竞价动态
		List<Record> list = TmCompOrder.dao.getAll();
		for (Record e : list) {
			e.set("remarks", new PriceUtils().priceFormat(e.get("amount")));//价格处理
		}
		setAttr("curCompList",list);
		setAttr("curDate",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		setAttr("week",new SimpleDateFormat("EEEE").format(new Date()));
		//竞价中
		List<Record> compingtList = Competition.dao.getList(true);
		setAttr("comList",mapList(compingtList));
		long compingPageView=0L;
		for (Record record : compingtList) {
			Long pageView = record.getLong("page_view");
			if(pageView==null){
				pageView = 0L;
			}
			compingPageView += pageView;
		}
		setAttr("compingPageView",compingPageView);
		//竞价预告
		List<Record> comPretList = Competition.dao.getList(false);
		setAttr("comPreList",mapList(comPretList));
		long compPrePageView=0L;
		for (Record record : comPretList) {
			Long pageView = record.getLong("page_view");
			if(pageView==null){
				pageView = 0L;
			}
			compPrePageView += pageView;
		}
		setAttr("compPrePageView",compPrePageView);
		//列表右侧广告
		setAttr("midAdImgList",AdImages.dao.getImgListByLabelID(MID_AD_LABEL_ID));
		setAttr("comAdImgList",AdImages.dao.getImgListByLabelID(COM_AD_LABEL_ID));
		render("competitionIndex.jsp");
	}
	/**
	 * 竞价包装类
	 * */
	public List<Map<String,Object>> mapList(List<Record> comList){
		List<Map<String,Object>> list = Lists.newArrayList();
		if(comList!=null && !comList.isEmpty()){
			for (Record e : comList) {
				Map<String,Object> map = Maps.newHashMap();
				map.put("id", e.get("id"));
				map.put("pic1", e.get("pic1"));
				map.put("pic2", e.get("pic2"));
				map.put("pic3", e.get("pic3"));
				map.put("comp_title", e.get("comp_title"));
				map.put("max_price", new PriceUtils().priceFormat(e.get("max_price")));
				map.put("price_count", e.get("price_count"));
				map.put("starting_price", new PriceUtils().priceFormat(e.get("starting_price")));
				map.put("pay_count", e.get("pay_count"));
				map.put("page_view", e.get("page_view"));
				map.put("is_will_comp", e.get("is_will_comp"));
				map.put("is_comping", e.get("is_comping"));
				if(e.getDate("last_time")!=null){
					map.put("end_surplus_time", (e.getDate("last_time").getTime()-e.getDate("cur_time").getTime())/1000);
				}
				if(e.getDate("comp_start_time")!=null){
					map.put("start_surplus_time", (e.getDate("comp_start_time").getTime()-e.getDate("cur_time").getTime())/1000);
				}
				
				list.add(map);
			}
		}
		return list;
	}
	public void search(){
		List<Record> areaList = Area.dao.getChildList2("1");
		setAttr("areaList",areaList);
		String typeFirst = getPara("typeFirst");
		setAttr("typeFirst",typeFirst);
		String typeSecond = getPara("typeSecond");
		setAttr("typeSecond",typeSecond);
		String typeThird = getPara("typeThird");
		setAttr("typeThird",typeThird);
		String provId = getPara("provId");
		setAttr("provId",provId);
		String cityId = getPara("cityId");
		setAttr("cityId",cityId);
		String compTitle = getPara("compTitle");
		setAttr("compTitle",compTitle);
		String compStatus = getPara("compStatus");
		setAttr("compStatus",compStatus);
		String orderBy = getPara("orderBy");
		setAttr("orderBy",orderBy);
		String sort = getPara("sort");
		setAttr("sort",sort);
		Page<Record> compPage = Competition.dao.getList(getParaToInt(0,1), 16, compStatus, typeFirst, typeSecond, typeThird, provId, cityId, "", compTitle, orderBy, sort);
		if(compPage!=null){
			setAttr("compList",mapList(compPage.getList()));
			setAttr("recordPage",compPage);
		}
		/*搜索页面类型的列表*/
		List<DictPcr> allPcrList = DictPcr.dao.findByType("waste_type");
		List<DictPcr> ordPcrList = DictPcr.dao.getChildList(Long.parseLong(ORDINARY_WS));//获取一般废物列表
		setAttr("ordJson",objJson(ordPcrList,allPcrList));
		List<DictPcr> danPcrList = DictPcr.dao.getChildList(Long.parseLong(DANGEROUS_WS));//获取一般废物列表
		setAttr("danJson",objJson(danPcrList,allPcrList));
		render("compSearch.jsp");
	}
	public void subType(){
		List<DictPcr> pcrList = DictPcr.dao.getChildrenByParent("waste_type", Long.parseLong(getPara("id")));
		renderJson(pcrList);
	}
	public String objJson(List<DictPcr> pcrList,List<DictPcr> allPcrList){
		List<CompSecondInfo> listSecond = Lists.newArrayList();
		if(pcrList!=null){
			for (DictPcr e : pcrList) {
				CompSecondInfo compSecond = new CompSecondInfo();
				compSecond.setId(e.getLong("id"));
				compSecond.setName(e.getStr("name"));
				List<CompThirdInfo> list = Lists.newArrayList();
				for (DictPcr sub : allPcrList) {
					if(sub.get("parent_id").equals(e.get("id"))){
						CompThirdInfo compThird = new CompThirdInfo();
						compThird.setId(sub.getLong("id"));
						compThird.setName(sub.getStr("name"));
						list.add(compThird);
					}
				}
				compSecond.setSubList(list);
				listSecond.add(compSecond);
			}
		}
		return JsonKit.toJson(listSecond);
	}
}
