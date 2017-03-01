package com.qdum.llhb.protection.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.utils.IpUtils;
import com.qdum.llhb.protection.model.EqEia;
import com.qdum.llhb.protection.model.EqMonitor;
import com.qdum.llhb.protection.model.OfferDetails;
import com.qdum.llhb.protection.model.OfferDetailsRemark;
import com.qdum.llhb.protection.model.OfferHeader;
import com.qdum.llhb.protection.model.OfferLine;
import com.qdum.llhb.protection.model.SurveyDetails;
import com.qdum.llhb.protection.model.SurveyHeader;
import com.qdum.llhb.protection.model.SurveyLine;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.ProvinceCityUtil;
import com.qdum.llhb.sys.utils.UserUtils;
@ControllerBind(controllerKey="/protection")
public class protectionController extends Controller {
	@ActionKey("/quote_v1")
	public void index_v1(){
        ProvinceCityUtil addressUtils = new ProvinceCityUtil();
        try {
			String localIp = IpUtils.getRemoteHost(getRequest());
			//localIp = "222.43.54.110";//用于测试的ip
            List<String> address =addressUtils.getAddresses("ip="+localIp, "utf-8");//得到省市区
            long proid = Area.dao.getIdByNameMohu(address.get(0).substring(0,2)).get("id");//得到省id
            long cityid = this.getIdAddddress(address.get(1));//得到市id
            setAttr("oriProId",proid);
            setAttr("oriCityId",cityid);
        } catch (Exception e) {

        }
        //首页传过来的
		setAttr("inname", getPara("name"));
		setAttr("intel", getPara("tel"));
		setAttr("incom", getPara("compname"));
		setAttr("inre", getPara("remarks"));
		setAttr("inprov", getPara("prov"));
		setAttr("incity", getPara("city"));
		setAttr("inin", getPara("index"));
		String pre = getPara("pre");

		List<Area> provinceList = Area.dao.getChildList("0,1,");
		List<Record> offHead = OfferHeader.dao.getAll();
		List<Record> surHead = SurveyHeader.dao.getAll();
		List<Record> crs = User.dao.getComplex();
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("re",re);
		setAttr("ads",ads);//首页广告
		setAttr("sss", crs);
		setAttr("surHeads", surHead);
		setAttr("offHeads", offHead);
		setAttr("provinceList", provinceList);
		render("proHome.jsp");
	}
	
	@ActionKey("/quote")
	public void index_v2(){
		setAttr("isQuote", 1);
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		setAttr("provinceList", provinceList);
		List<Record> crs = User.dao.getComplex();
		setAttr("crs", crs);
		List<Record> offHead = OfferHeader.dao.getAll();
		setAttr("offHeads", offHead);
		List<Record> surHead = SurveyHeader.dao.getAll();
		setAttr("surHeads", surHead);
		render("../v2/quote/quote.jsp");
	}
	
    /**
     * 得到地址id
     */
    public long getIdAddddress(String name){
        return Area.dao.getIdByNameMohu(name.substring(0,name.length()-1)).get("id");
    }
	/**
	 * 保存初步信息
	 */
	public void saveBase(){
		User user = UserUtils.getUser();
		String index = getPara("index");
		long pid = 0;
		if(index.equals("0")){
			pid = commonSave(getModel(EqEia.class)).get("id");
		}else if(index.equals("1")){
			pid = commonSave(getModel(EqMonitor.class)).get("id");
		}
		renderText((pid+"").trim());
	}
	/**
	 * 保存相同的
	 */
	public Model<?> commonSave(Model<?> eq){
		eq.set("name", getPara("name"));
		eq.set("tel", getPara("tel"));
		eq.set("comp_name", getPara("comp_name"));
		eq.set("remarks", getPara("remarks"));
		String prov = getPara("prov_id");
		String city = getPara("city_id");
		if(null==prov||"".equals(prov)){
		}else{
			eq.set("prov_id",prov );
		}
		if(null==city||"".equals(city)){
		}else{
			eq.set("prov_id",city );
		}
		eq.set("create_date", new Date());
		boolean b = eq.save();
		return eq;
	}
	/**
	 * 获取某省份的所有城市
	 */
	public void getCity(){
		String province = getPara("province");
		List<Record> cityList = Area.dao.getChildList2(province);
		renderJson(cityList);
	}
	/**
	 * 获取某市的所有县
	 */
	public void getCounty(){
		List<Record> cityList = Area.dao.getChildList2(getPara("city"));
		renderJson(cityList);

	}
	/**
	 * 获取环评的line
	 */
	public void getOffLine(){
		renderJson(OfferLine.dao.getByHeadId(getPara("offhead")));
	}
	/**
	 * 获取检测的line
	 */
	public void getSurLine(){
		renderJson(SurveyLine.dao.getByHeadId(getPara("surhead")));
	}
	/**
	 * 获取环评的细节
	 */
	public void getOffDetail(){
		renderJson(OfferDetails.dao.getByHeadAndLine(getPara("offhead"), getPara("offline")));
	}
	
	//监测类型
	public void getJcType(){
		List<Record> surline = SurveyLine.dao.getByHeadId(getPara("surhead"));
		JSONObject jso = new JSONObject();
		JSONObject temp = new JSONObject();
		JSONArray jsa = new JSONArray();
		JSONArray childrenJsa = new JSONArray();
		List<Record> detail=null;
		String surlineStr="";
		for (Record record : surline) {
			surlineStr=record.get("lid").toString();
			detail = SurveyDetails.dao.getByHeadAndLine(getPara("surhead"),surlineStr);
			for (Record d : detail) {
				temp.clear();
				childrenJsa.clear();
				temp.put("name", d.getStr("Survey_detail_type_name"));
				temp.put("id", d.get("Survey_detail_id"));
				temp.put("parentId", surlineStr);
				childrenJsa.add(temp.toString());
			}
			jso.clear();
			jso.put("id", record.get("lid"));
			jso.put("name", record.get("lname"));
			jso.put("isParent",0);
			jso.put("children", childrenJsa);
			jsa.add(jso.toString());
		}
		
		renderJson(jsa);
	}
	
	/**
	 * 获取检测的细节
	 */
	public void getSurDetail(){
		renderJson(SurveyDetails.dao.getByHeadAndLine(getPara("surhead"), getPara("surline")));
	}
	/**
	 * 环评弹出框的保存
	 */
	public void envSave(){
		User user = UserUtils.getUser();
		EqEia eq = EqEia.dao.findById(getPara("pid"));
		String ids = "";
		if(eq != null){
			String valueStr=getPara("value")==null?"":getPara("value");
			String[] vs = valueStr.split(",");
			String v= "";
			for(String s:vs){
				v+=s;
			}
			Record rr = OfferDetailsRemark.dao.getRecord(getPara("offhead"), getPara("offline"), v);
			if(rr != null){
				eq.set("pro_detail", rr.get("remark_id"));
			}
			eq.set("pro_line", getPara("offline"));
			alertCommon(eq);
			eq.update();
		}
		renderText("ok");
	}
	/**
	 * 弹出框保存相同
	 */
	public void alertCommon(Model<?> eq){
		User user = UserUtils.getUser();
		eq.set("prov_id", getPara("province"));
		eq.set("city_id", getPara("city"));
		eq.set("region_id", getPara("country"));
		eq.set("pro_header", getPara("offhead"));
		eq.set("pro_name",getPara("projectname"));
		eq.set("create_by", user.getId());
		eq.set("create_date", new Date());

	}
	/**
	 * 检测弹出框的保存
	 */
	public void monSave(){
		EqMonitor em = EqMonitor.dao.findById(getPara("pid"));
		if(em != null){
			alertCommon(em);
			em.set("pro_details", getPara("value"));
			em.set("pro_lines", getPara("offline"));
			BigDecimal b = (BigDecimal)SurveyDetails.dao.getMoney(getPara("value")).get("money");
			em.set("amount",b.longValue());
			em.update();

			renderText("ok");
		}
		renderText("no");
	}
	
	//返回环保报价详情，进行报价评价
	public void hbQuoteDetail(){
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		Record r = EqEia.dao.getByRemardAndEia(getPara("pid"), null);
		List<Record> childs = Area.dao.getChildList2((r.get("prov_id")+"").trim());
		List<Record> countrys  = Area.dao.getChildList2((r.get("city_id")+"").trim());
		List<Record> offHead = OfferHeader.dao.getAll();
		List<Record> offlines = OfferLine.dao.getByHeadId(r.getStr("pro_header"));
		List<Record> surHead = SurveyHeader.dao.getAll();
		List<Record> offd = OfferDetails.dao.getByHeadAndLine(r.getStr("pro_header"),r.getStr("pro_line"));
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("bs",getPara("bs"));
		setAttr("re",re);
		setAttr("ads",ads);//首页广告
		setAttr("array",r.get("check_type"));
		setAttr("offds", offd);
		setAttr("offlines", offlines);
		setAttr("offHeads", offHead);
		setAttr("provinceList", provinceList);
		setAttr("citys", childs);
		setAttr("countrys", countrys);
		setAttr("r", r);
		render("../v2/quote/hbQuoteDetail.jsp");
	}
	
	//返回监测报价详情，进行报价评价
	public void jcQuoteDetail(){
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		Record r = EqMonitor.dao.getByRemardAndEia(getPara("pid"),null);
		List<Record> rr = SurveyDetails.dao.getByDetailsID(r.getStr("pro_details"));
		List<Record> childs = Area.dao.getChildList2((r.get("prov_id")+"").trim());
		List<Record> countrys  = Area.dao.getChildList2((r.get("city_id")+"").trim());
		List<Record> offlines = SurveyLine.dao.getByHeadId(r.getStr("pro_header"));
		List<Record> surHead = SurveyHeader.dao.getAll();
		List<Record> offd = SurveyDetails.dao.getByHeadAndLine(r.getStr("pro_header"),r.getStr("pro_lines"));
		String[] sa = r.getStr("pro_lines").split(",");
		List<String> ss= new ArrayList<String>();
		for (int i=0;i<sa.length;i++){
			ss.add(sa[i]);
		}
		Record moneys = SurveyDetails.dao.getMoney(r.getStr("pro_details"));
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("bs",getPara("bs"));
		setAttr("re",re);
		setAttr("ads",ads);//首页广告
		setAttr("money", moneys);
		setAttr("rr", rr);
		setAttr("rrsize", rr.size());
		setAttr("rl", ss.size());
		setAttr("len", sa.length);
		setAttr("arrs", ss);
		setAttr("offds", offd);
		setAttr("surHeads", surHead);
		setAttr("offlines", offlines);
		setAttr("provinceList", provinceList);
		setAttr("citys", childs);
		setAttr("countrys", countrys);
		setAttr("r", r);
		render("../v2/quote/jcQuoteDetail.jsp");
	}
	
	/**
	 * 表格1
	 *
	 */
	public void table(){
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		Record r = EqEia.dao.getByRemardAndEia(getPara("pid"), null);
		List<Record> childs = Area.dao.getChildList2((r.get("prov_id")+"").trim());
		List<Record> countrys  = Area.dao.getChildList2((r.get("city_id")+"").trim());
		List<Record> offHead = OfferHeader.dao.getAll();
		List<Record> offlines = OfferLine.dao.getByHeadId(r.getStr("pro_header"));
		List<Record> surHead = SurveyHeader.dao.getAll();
		List<Record> offd = OfferDetails.dao.getByHeadAndLine(r.getStr("pro_header"),r.getStr("pro_line"));
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("bs",getPara("bs"));
		setAttr("re",re);
		setAttr("ads",ads);//首页广告
		setAttr("array",r.get("check_type"));
		setAttr("offds", offd);
		setAttr("offlines", offlines);
		setAttr("offHeads", offHead);
		setAttr("provinceList", provinceList);
		setAttr("citys", childs);
		setAttr("countrys", countrys);
		setAttr("r", r);
		render("proTable.jsp");
	}
	public void tableSur(){
		List<Area> provinceList = Area.dao.getChildList("0,1,");
		Record r = EqMonitor.dao.getByRemardAndEia(getPara("pid"),null);
		List<Record> rr = SurveyDetails.dao.getByDetailsID(r.getStr("pro_details"));
		List<Record> childs = Area.dao.getChildList2((r.get("prov_id")+"").trim());
		List<Record> countrys  = Area.dao.getChildList2((r.get("city_id")+"").trim());
		List<Record> offlines = SurveyLine.dao.getByHeadId(r.getStr("pro_header"));
		List<Record> surHead = SurveyHeader.dao.getAll();
		List<Record> offd = SurveyDetails.dao.getByHeadAndLine(r.getStr("pro_header"),r.getStr("pro_lines"));
		String[] sa = r.getStr("pro_lines").split(",");
		List<String> ss= new ArrayList<String>();
		for (int i=0;i<sa.length;i++){
			ss.add(sa[i]);
		}
		Record moneys = SurveyDetails.dao.getMoney(r.getStr("pro_details"));
		List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
		List<Record> ads = AdLable.dao.getIndexImg();
		setAttr("bs",getPara("bs"));
		setAttr("re",re);
		setAttr("ads",ads);//首页广告
		setAttr("money", moneys);
		setAttr("rr", rr);
		setAttr("rrsize", rr.size());
		setAttr("rl", ss.size());
		setAttr("len", sa.length);
		setAttr("arrs", ss);
		setAttr("offds", offd);
		setAttr("surHeads", surHead);
		setAttr("offlines", offlines);
		setAttr("provinceList", provinceList);
		setAttr("citys", childs);
		setAttr("countrys", countrys);
		setAttr("r", r);
		render("proTableSur.jsp");
	}
	/**
	 * 环评满意度
	 */
	public void envAppr(){
		EqEia e = EqEia.dao.findById(getPara("eid"));
		e.set("appraise", getPara("appr"));
		e.update();
		renderText("ok");
	}
	/**
	 * 检测满意度
	 */
	public void monAppr(){
		EqMonitor e = EqMonitor.dao.findById(getPara("eid"));
		e.set("appraise", getPara("appr"));
		e.set("amount",getPara("amount"));
		e.update();
		renderText("ok");
	}

}
