package com.qdum.llhb.dataCollection.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.protection.model.*;
import com.qdum.llhb.sys.model.Area;

import java.util.ArrayList;
import java.util.List;

@ControllerBind(controllerKey="/dataCollection/protection")
@Before(AdminInterceptor.class)
public class ProtectionListController extends Controller {
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
 public void proteList(){
	 String leibie = getPara("leibie");
	 String title = getPara("title");
	 int yeshu = pageSettingNum;
	 try {
		 yeshu  =getParaToInt("paginateFenye");
		 setAttr("paginateFenye",yeshu);
	 } catch (Exception e) {
		 yeshu = pageSettingNum;
	 }
	 Page<Record> pages = EqEia.dao.getComplex(getParaToInt(0, 1), yeshu,leibie,title);
	 if(leibie != null && !leibie.equals("")){
			setAttr("leibie", leibie);
		}
	 if(title != null && !title.equals("")){
			setAttr("title", title);
		}
	 if(!(pages.getList().isEmpty())){
			setAttr("lists", pages.getList());
			setAttr("recordPage", pages);
		}
	 render("proteList.jsp");
 }

	/**
	 * 删除
	 */
	public void delete(){
		String msg = "";
		String num = getPara("num");
		String eid = getPara("eid");
		try {
			if (num.equals("1")) {
                EqEia.dao.findById(eid).set("del_flag","1").update();
            }else{
                EqMonitor.dao.findById(eid).set("del_flag","1").update();
            }
			msg = "删除成功";
		} catch (Exception e) {
			msg = "删除发生错误";
		}
		renderText(msg);
	}
    public void table(){
        List<Area> provinceList = Area.dao.getChildList("0,1,");
        Record r = EqEia.dao.getByRemardAndEia(getPara("pid"), null);
        List<Record> childs = Area.dao.getChildList2((r.get("prov_id")+"").trim());
        List<Record> countrys  = Area.dao.getChildList2((r.get("city_id")+"").trim());
        List<Record> offHead = OfferHeader.dao.getAll();
        List<Record> offlines = OfferLine.dao.getByHeadId(r.getStr("pro_header"));
        List<Record> surHead = SurveyHeader.dao.getAll();
        List<Record> offd = OfferDetails.dao.getByHeadAndLine(r.getStr("pro_header"),r.getStr("pro_line"));
        setAttr("leibie",getPara("leibei"));
        setAttr("title",getPara("title"));
        setAttr("array",r.get("check_type"));
        setAttr("offds", offd);
        setAttr("offlines", offlines);
        setAttr("offHeads", offHead);
        setAttr("provinceList", provinceList);
        setAttr("citys", childs);
        setAttr("countrys", countrys);
        setAttr("r", r);
        render("envDetails.jsp");
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
        render("monDetails.jsp");
    }
}
