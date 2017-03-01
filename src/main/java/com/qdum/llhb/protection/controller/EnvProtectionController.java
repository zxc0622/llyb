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

import java.util.Date;
import java.util.List;

/**
 * @author ZhouXiang
 * @date 2016/7/18 11:24
 */
@ControllerBind(controllerKey = "/envprotection")
public class EnvProtectionController extends Controller {
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
        render("/WEB-INF/views/protection/envProHome.jsp");
    }

    /**
     * 得到地址id
     */
    public long getIdAddddress(String name){
        return Area.dao.getIdByNameMohu(name.substring(0,name.length()-1)).get("id");
    }
    /**
     * 环评弹出框的保存
     */
    public void envSave(){
        User user = UserUtils.getUser();
        EqEia eq = EqEia.dao.findById(getPara("pid"));
        String ids = "";
        if(eq != null){
            String[] vs = getPara("value").split(",");
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
        eq.set("name",getPara("name"));
        eq.set("comp_name",getPara("companyName"));
        eq.set("tel",getPara("phone"));
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
        render("/WEB-INF/views/protection/envProTable.jsp");
    }
}

