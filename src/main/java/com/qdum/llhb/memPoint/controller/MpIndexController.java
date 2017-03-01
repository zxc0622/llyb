package com.qdum.llhb.memPoint.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.memPoint.model.MpExchangeRecord;
import com.qdum.llhb.memPoint.model.MpMememberAddr;
import com.qdum.llhb.memPoint.model.MpProductInfo;
import com.qdum.llhb.memPoint.model.PointMain;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import javax.servlet.Servlet;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2016/1/12.
 */
@ControllerBind(controllerKey = "/memPoint/memIndex")
@Before(AdminInterceptor.class)
public class MpIndexController  extends Controller{
    private  final  static Logger logger = Logger.getLogger(MpIndexController.class);
    private static  final  MpProductInfo mpProductInfoDao = MpProductInfo.dao;
    /**
     * 兑换
     */
    public void convert(){

        User user = UserUtils.getUser();
        Record r = PointMain.dao.getPoint(user.getId());
        String pid = getPara("pid");
        List<Record> product = mpProductInfoDao.getRecord(null);
        List<Record> records = MpExchangeRecord.dao.getAll();
        setAttr("rs",records);
        setAttr("ps",product);
        setAttr("pu",r);
        render("convert.jsp");
    }
    /**
     * 等级
     */
    public void level(){
        render("level.jsp");
    }
    /**
     * 兑换列表
     */
    public void convertList(){
        List<Record> ex = MpExchangeRecord.dao.getRecordList(UserUtils.getUser().getId());
        setAttr("es",ex);
        render("convertList.jsp");
    }
    /**
     * 产品介绍,详情
     */
    public void productIntro(){
        String pid = getPara("pid");
        List<Record> product = mpProductInfoDao.getRecord(pid);
        setAttr("pid",pid);
        setAttr("p",product.get(0));
        render("productIntro.jsp");
    }
    /**
     * 确认兑换
     */
    public void sureConvert(){
        render("sureConvert.jsp");
    }
    /**
     * 地址列表
     */
    public void addAdd(){
        User user = UserUtils.getUser();
        Record r = PointMain.dao.getPoint(user.getId());
        String pid = getPara("pid");
        Record product = mpProductInfoDao.getRecord(pid).get(0);
        Record main = PointMain.dao.getPoint(user.getId());
        setAttr("m",main);
        List<Record> adds = MpMememberAddr.dao.getAddredds(user.getId());
        //List<Record> pde = mpProductInfoDao.getRecord(null);
        setAttr("addrs",adds);
        //setAttr("adds", Area.dao.findAllList());
        setAttr("pid",pid);
        setAttr("p",product);
        setAttr("pu",r);
        render("addAdd.jsp");
    }
    /**
     * 修改地址
     */
    public void resetAddr(){
        User user = UserUtils.getUser();
        String aid = getPara("aid");
        Record a = MpMememberAddr.dao.getAdd(aid);
        String pid = getPara("pid");
        List<Record> product = mpProductInfoDao.getRecord(pid);
        Record r = PointMain.dao.getPoint(user.getId());
        Record main = PointMain.dao.getPoint(user.getId());
        setAttr("m",main);
        setAttr("a",a);
        setAttr("p",product.get(0));
        setAttr("pu",r);
        setAttr("pid",getPara("pid"));
        setAttr("addId",aid);
        setAttr("adds", Area.dao.getChildList("0,1,"));
        render("resetAddr.jsp");
    }
    /**
     * 添加地址 保存
     */
    public void addSave(){
        boolean flag = false;//地址是否有保存过
        User user  = UserUtils.getUser();
        String addId = getPara("addId");
        MpMememberAddr add = MpMememberAddr.dao.getAddr(addId);
        if(null == add||add.equals("")){
            add= new MpMememberAddr();
            flag=  true;
        }
        Map<String,String []> maps  = getParaMap();
        Set<String> keys = maps.keySet();
        for(String key:keys){
            String [] vals = maps.get(key);
            if(key.equals("addId")||key.equals("pid")){

            }/*else if(key.equals("is_default")){

            }*/else{
                add.set(key,vals[0]);
            }

        }
        add.set("user_id",user.getId());
        if(getPara("is_default").equals("1")){
            MpMememberAddr.dao.cancelDefault();
        }
        if(flag){
            add.set("create_by",user.getId()).set("create_date",new Date()).save();
        }else{
            add.set("update_by",user.getId()).set("update_date",new Date()).update();
        }

        redirect("/memPoint/memIndex/addAdd?pid="+getPara("pid"));
    }
    /**
     * 确认兑换
     */
    public void sureExchange(){
        String msg = "";
        User user = UserUtils.getUser();
        String pid = getPara("pid");
        MpProductInfo pro = mpProductInfoDao.getProduct(pid);
        MpMememberAddr addr = MpMememberAddr.dao.findById(getPara("addid"));
        Record main = PointMain.dao.getPoint(user.getId());
        boolean flag = false;//兑换该商品的记录是否存在
        MpExchangeRecord er = er = MpExchangeRecord.dao.getExchangeRecord(user.getId(),pid);
        if(null==er){
            er = new MpExchangeRecord();
            flag = true;
        }
        if(!flag&&Long.parseLong(er.get("num")+"")>=pro.getLong("limit_num")){
            renderText("超过限购数量");
            return;
        }else if(pro.getLong("num")<1){
            renderText("兑换商品数量不足");
            return;
        }else if((null==main.get("point_num"))||(null !=main.get("point_num")&&((((BigDecimal)main.get("point_num")).compareTo((BigDecimal)pro.get("points")))==-1))){
            renderText("积分不足，无法兑换该商品");
            return;
        }
        BigDecimal b = ((BigDecimal)main.get("point_num")).subtract((BigDecimal)pro.get("points"));
        pro.set("num",pro.getLong("num")-1).update();
        main.set("point_num",b);
        Db.update("mp_point_main",main);
        er.set("user_id",user.getId()).set("pro_id",getParaToLong("pid"));
        er.set("pro_name",pro.get("pro_name"));
        er.set("point",pro.get("points")).set("name",addr.get("name")).set("prov_id",addr.get("prov_id"));
        er.set("city_id",addr.get("city_id")).set("town_id",addr.get("town_id")).set("street",addr.get("street"));
        er.set("post_code",addr.get("post_code")).set("phone",addr.get("phone"));
        er.set("remain_point",b);
        if(flag){
            er.set("num",1);
            er.set("create_by",user.getId()).set("create_date",new Date()).save();
        }else{
            er.set("num",((BigDecimal)er.get("num")).add(BigDecimal.valueOf(1d)));
            er.set("update_by",user.getId()).set("update_date",new Date()).update();
        }
        renderText("ok");
        //redirect("/memPoint/memIndex/convertList");
    }
    /**
     * 地址删除
     */
    public void deleteaddr(){
        MpMememberAddr a = MpMememberAddr.dao.findById(getPara("addid"));
        boolean b = a.set("del_flag","1").update();
        renderJson(b);
    }


}
