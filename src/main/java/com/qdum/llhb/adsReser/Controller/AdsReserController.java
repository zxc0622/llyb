package com.qdum.llhb.adsReser.Controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.adsReser.model.AdvBook;
import com.qdum.llhb.adsReser.model.AdvChannel;
import com.qdum.llhb.adsReser.model.AdvMaintain;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2015/12/16.
 */

/**
 * 广告预定
 */
@ControllerBind(controllerKey = "/adsReser")
@Before(AdminInterceptor.class)
public class AdsReserController extends Controller {
    public void index(){
        setAttr("listall", DictPcr.dao.findByTypeRecord("adv_book"));
        setAttr("ori",DictPcr.dao.getDictsByType("adv_book",1081l));
        render("adsReser.jsp");
    }
    public void adsReserIn(){
        List<Record> ads = AdLable.dao.getIndexImg();
        setAttr("ads",ads);//首页广告
        setAttr("listall", DictPcr.dao.findByTypeRecord("adv_book"));
        /*setAttr("ori",DictPcr.dao.getDictsByType("adv_book",1081l));*/
        List<Record> r = AdvMaintain.dao.getRecord("1081");
        Record c   = AdvChannel.dao.getRecord("1081");
        setAttr("c",c);
        setAttr("ori",r);
        render("adsReserIn.jsp");
    }
    public void getArea(){
        renderJson(DictPcr.dao.getDictsByType("adv_book",getParaToLong("one")));
    }
    /**
     * 获取价格
     */
    public void getMoney(){
        renderJson(AdvBook.dao.getRecord(getPara("chanId"),getPara("areaId")));
    }
    /**
     * 广告预定列表
     */

    public void adslist(){
        User u = UserUtils.getUser();
        String chanid = getPara("chanid");
        List<Record> adlist  = AdvMaintain.dao.getRecord(chanid);
        if(null != chanid&&!chanid.equals("")){
            setAttr("chanid",chanid);
            Record ads = AdvChannel.dao.getRecord(getPara("chanid"));
            setAttr("ads",ads);
            setAttr("adlist",adlist);
        }


        setAttr("listall", DictPcr.dao.findByTypeRecord("adv_book"));

        setAttr("user",u);
        setAttr("today",new Date());
        render("adslist.jsp");
    }
    /**
     * 广告预定新增
     */
    public void adsadd(){
        User u = UserUtils.getUser();
        setAttr("user",u);
        setAttr("today",new Date());
        String oriid = getPara("addid");
        if(null!=oriid &&!oriid.equals("")){
            Record main = AdvMaintain.dao.getRecordByChannelAndId(getPara("chanid"),oriid);
            setAttr("oriid",oriid);
            setAttr("main",main);
        }

        setAttr("dp", DictPcr.dao.getById("adv_book",getParaToLong("chanid")));
        String error  =getPara("error");
        if(null !=error&&!"".equals(error)){
            setAttr("error",error);
        }
        render("adsadd.jsp");
    }
    /**
     * 列表页面初步保存新增的信息
     */
    public void savePrev(){
        String saveid = getPara("saveid");
        boolean flag;
        boolean save = false;
        AdvChannel ac = AdvChannel.dao.getChannel(saveid);
        if(null == ac||ac.equals("")){
            ac = new AdvChannel();
            save = true;
        }
        Map<String,String[]> maps = getParaMap();
        Set<String>  keys = maps.keySet();
        for (String k:keys){
            String[] s = maps.get(k);
            if(k.equals("create_date")){
                ac.set(k,new Date());
            }else if(!k.equals("saveid")){
                ac.set(k,s[0]);
            }


        }
        if(save){
            flag = ac.save();
        }else {
            flag = ac.update();
        }
        redirect("/adsReser/adslist?chanid="+ac.get("channel_id"));
    }
    /**
     * 保存新增
     */
    public void saveNew(){
        String saveid = getPara("saveid");
        boolean flag;
        boolean save = false;
        AdvMaintain ac = AdvMaintain.dao.findById(saveid);
        if(null == ac||ac.equals("")){
            ac = new AdvMaintain();
            save = true;
        }
        Map<String,String[]> maps = getParaMap();
        Set<String>  keys = maps.keySet();
        for (String k:keys){
            String[] s = maps.get(k);
            if(k.equals("create_date")){
                ac.set(k,new Date());
            }else if(!k.equals("saveid")){
                ac.set(k,s[0]);
            }


        }
        try {
            if(save){
                flag = ac.save();
            }else {
                flag = ac.update();
            }
            redirect("/adsReser/adslist?chanid="+ac.get("channel_id"));
            return;
        } catch (Exception e) {
            redirect("/adsReser/adsadd?chanid="+ac.get("channel_id")+"&addid="+saveid+"&error=保存失败");
            return;
        }
        //renderJson(flag);
    }
    /**
     * 删除
     */
    public void delete(){
        Record r = AdvMaintain.dao.getRecordByChannelAndId(getPara("chanid"),getPara("addid"));
        r.set("del_flag","1");
        boolean b = Db.update("inma_adv_maintain",r);
        renderJson(b);
    }
    /**
     * 广告预定首页展示
     */
    public void seleone(){
        String oneid = getPara("oneid");
        Record c   = AdvChannel.dao.getRecord(oneid);
        List<Record> rs = AdvMaintain.dao.getRecord(oneid);
        for(Record r:rs){
            r.set("pic",c.get("pic"));
            //Db.update("inma_adv_maintain",r);
        }
       /* rs.add(c);*/

        renderJson(rs);
    }
    public void getMaintain(){

        renderJson(AdvMaintain.dao.getRecordById(getPara("areaId")));
    }
    /**
     * 校验该频道有没有提前保存过
     */
    public void validateSave(){
        AdvChannel ac = AdvChannel.dao.getChannel(getPara("chanid"));
        if(null ==ac){
            renderJson(false);
            return;
        }else{
            renderJson(true);
            return;
        }
    }


}
