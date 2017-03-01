package com.qdum.llhb.Competition.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2015/12/18.
 */
@ControllerBind(controllerKey = "/competition/inforMan")
@Before(AdminInterceptor.class)
public class InforManController extends Controller {
    private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
    /**
     * 新建竞价
     */
    public void add(){
        //判断是否为企业,若不是,则跳转到企业信息页面维护企业信息 yaoyt@2016.3.11
        if(!UserUtils.isCompany()){
            getSession().setAttribute("tip","请先完善公司资料再进行竞价");
            redirect("/hyzl/EnterpriseDataZero");
            return;
        }

        User u = UserUtils.getUser();
        setAttr("user",u);
        setAttr("today",new Date());
        List<DictPcr> kind = DictPcr.dao.getDictsByType("waste_type",346l);//废物类别总分类
        setAttr("kindone",kind);//一级分类
       /* JSONArray jsononechild = new JSONArray();
        for(DictPcr d:kind){
            List<DictPcr> kindone  = DictPcr.dao.getDictsByType("waste_type",d.getLong("id"));
            JSONArray a  =new JSONArray();
            //JSONArray jsonone  = new JSONArray();
            JSONArray a1 = new JSONArray();
            for(DictPcr r:kindone){
                JSONObject o = new JSONObject();
                o.put("rid",r.get("id"));
                o.put("rname",r.get("name"));
                a1.add(o);
*//*

                List<DictPcr> kindtwo  = DictPcr.dao.getDictsByType("waste_type",r.getLong("id"));
                JSONArray jsontwo = new JSONArray();
                for(DictPcr p:kindtwo){
                    JSONObject j = new JSONObject();
                    j.put("rid",r.get("id"));
                    j.put("rname",r.get("name"));
                    jsontwo.add(j);
                }
                a.add(jsontwo);*//*
            }
            jsononechild.add(a1);
        }

        setAttr("kindtwo",jsononechild);*/
        String error = getPara("error");
        if(null!=error&&!"".equals(error)){
            setAttr("error",error);
        }
        setAttr("adds", Area.dao.getChildList("0,1,"));
        setAttr("units", Dict.dao.getDictsByType("unit_type"));
        setAttr("perions", Dict.dao.getDictsByType("period_type"));
        setAttr("incres", Dict.dao.getDictsByType("increase_type"));//最小加价
        setAttr("m",Db.findById("inma_competition_info",getPara("paramId")));
        setAttr("ppid",getPara("paramId"));
        render("inforAdd.jsp");
    }
    /**
     *二级分类
     */
    public void getKindTwo(){
        renderJson(DictPcr.dao.getDictsByType("waste_type",getParaToLong("one")));
    }
    /**
     *二级分类
     */
    public void getKindThree(){
        renderJson(DictPcr.dao.getDictsByType("waste_type",getParaToLong("two")));
    }
    /**
     * 返回两个JsonArray的合并后的字符串
     * @param mData
     * @param array
     * @return
     */
    public static String joinJSONArray(JSONArray mData, JSONArray array) {
        StringBuffer buffer = new StringBuffer();
        try {
            int len = mData.size();
            for (int i = 0; i < len; i++) {
                JSONObject obj1 = (JSONObject) mData.get(i);
                if (i == len - 1)
                    buffer.append(obj1.toString());
                else
                    buffer.append(obj1.toString()).append(",");
            }
            len = array.size();
            if (len > 0)
                buffer.append(",");
            for (int i = 0; i < len; i++) {
                JSONObject obj1 = (JSONObject) array.get(i);
                if (i == len - 1)
                    buffer.append(obj1.toString());
                else
                    buffer.append(obj1.toString()).append(",");
            }
//          buffer.insert(0, "[").append("]");
            return buffer.toString();
        } catch (Exception e) {
        }
        return null;
    }
    /**
     * 保存
     */
    public void save(){
        String id = getPara("paramId");
        boolean f = false;
        Record r = null;
        if(id != null && !id.equals("")){
            r = Competition.dao.getById(id);
            f = true;
        }else{
            r= new Record();
        }
        Map<String, String []> maps = getParaMap();
        Set<String> keys = maps.keySet();
        for(String key:keys){
            String[] s = maps.get(key);
            if(key.equals("create_date")){
                r.set(key,new Date());
            }else if(key.equals("comp_announ")){
                r.set(key,getPara("comp_announ").toString().replaceAll("\r\n", ""));
            }else if(key.equals("comp_desc")){
                r.set(key,getPara("comp_desc").toString().replaceAll("\r\n", ""));
            }else if(key.equals("editorValue")){

            }else if(key.equals("comp_start_time")){
                Date ss = new Date();
                try {
                    ss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(s[0]);
                    r.set(key,ss);
                } catch (ParseException e) {
                }
            }else if(!key.equals("paramId")){
                r.set(key, s[0]);
            }
        }
        r.set("comp_sta","0").set("page_view",0);

        try {
            if(f){

                Db.update("inma_competition_info",r);
            }else{
                Db.save("inma_competition_info",r);
            }
        } catch (Exception e) {
            redirect("/competition/inforMan/add?error=保存失败");
            return;
        }
        redirect("/competition/inforMan/check");
    }
    /**
     * 审核 各种状态页面
     */
    public void  check(){
        User u  = UserUtils.getUser();
        String con = getPara("con");
        String title = getPara("title");
        String leibie = getPara("leibie");
        if(con != null && !con.equals("")){
            setAttr("con",con);
        }else{
            setAttr("con",1);
            con = "1";
        }
        if(title != null && !title.equals("")){
            setAttr("title",title);
        }
        if(leibie != null && !leibie.equals("")){
            setAttr("leibie",leibie);
        }
        int yeshu = pageSettingNum;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = pageSettingNum;
        }
        Page<Record> records  = Competition.dao.getRecordBySta(getParaToInt(0, 1),yeshu,con,title,leibie,u.getLong("id"));
        List<DictPcr> kind = DictPcr.dao.getDictsByType("waste_type",346l);//废物类别总分类
        setAttr("ks",kind);
        setAttr("recordPage",records);
        setAttr("cs",records.getList());
        render("inforCheck.jsp");
    }
    //删除选中
    public void delete(){
        String [] numbers = getPara("number").split(",");
        int[] numInt = new int[numbers.length];
        for(int i=0;i<numbers.length;i++){
            numInt[i]=Integer.parseInt(numbers[i].toString());
            Competition qg  = Competition.dao.findById(numInt[i]);
            qg.set("del_flag", true);
            qg.update();
        }
        renderText("ok");
    }

    /**
     * 查看
     */
    public void addSee(){
        User u = UserUtils.getUser();
        Competition p =  Competition.dao.findById(getPara("paramId"));
        p.set("page_view", p.getLong("page_view")+1).update();
        setAttr("user",u);
        setAttr("today",new Date());
        List<DictPcr> kind = DictPcr.dao.getDictsByType("waste_type",346l);//废物类别总分类
        setAttr("kindone",kind);//一级分类
        setAttr("adds", Area.dao.getChildList("0,1,"));
        setAttr("units", Dict.dao.getDictsByType("unit_type"));
        setAttr("perions", Dict.dao.getDictsByType("period_type"));
        setAttr("incres", Dict.dao.getDictsByType("increase_type"));//最小加价
        setAttr("m",Db.findById("inma_competition_info",getPara("paramId")));
        setAttr("ppid",getPara("paramId"));
        render("inforAddSee.jsp");
    }
}
