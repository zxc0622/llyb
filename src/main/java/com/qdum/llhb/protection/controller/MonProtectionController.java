package com.qdum.llhb.protection.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.utils.IpUtils;
import com.qdum.llhb.protection.model.*;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.ProvinceCityUtil;
import com.qdum.llhb.sys.utils.UserUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author ZhouXiang
 * @date 2016/7/18 16:03
 */
@ControllerBind(controllerKey = "/monprotection")
public class MonProtectionController extends Controller{
    public void index(){
        ProvinceCityUtil addressUtils = new ProvinceCityUtil();
        try {
            String localIp = IpUtils.getRemoteHost(getRequest());
            //localIp = "222.43.54.110";//用于测试的ip
            List<String> address =addressUtils.getAddresses("ip="+localIp, "utf-8");//得到省市区
            long proid = Area.dao.getIdByNameMohu(address.get(0).substring(0,2)).get("id");//得到省id
            long cityid = getIdAddddress(address.get(1));//得到市id
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
        render("/WEB-INF/views/protection/monProHome.jsp");
    }
    /**
     * 得到地址id
     */
    public long getIdAddddress(String name){
        return Area.dao.getIdByNameMohu(name.substring(0,name.length()-1)).get("id");
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
            BigDecimal b = (BigDecimal) SurveyDetails.dao.getMoney(getPara("value")).get("money");
            em.set("amount",b.longValue());
            em.set("tel",getPara("phone"));
            em.set("name",getPara("name"));
            em.set("comp_name",getPara("companyName"));
            em.update();

            renderText("ok");
        }
        renderText("no");
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
        eq.set("name",getPara("name"));
        eq.set("comp_name",getPara("companyName"));
        eq.set("tel",getPara("phone"));
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
        render("/WEB-INF/views/protection/monProTableSur.jsp");
    }
}

