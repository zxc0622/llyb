package com.qdum.llhb.dataCollection.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.DictPcr;

import java.util.List;

/**
 * Created by Administrator on 2015/12/7.
 */
@ControllerBind(controllerKey="/dataCollection/demands")
@Before(AdminInterceptor.class)
public class DemandsListController extends Controller {
    private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
    public void index(){
        String leibie = getPara("leibie");
        String title = getPara("title");
        int yeshu = pageSettingNum;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = pageSettingNum;
        }

        List<DictPcr> parents  = DictPcr.dao.getDictsByType("supply_type", 428l);
        Page<Record> rs = Qiugou.dao.getDataColectionListsAll(getParaToInt(0, 1), yeshu,leibie,title);
        if(leibie != null && !leibie.equals("")){
            setAttr("leibie", leibie);
        }
        if(title != null && !title.equals("")){
            setAttr("title", title);
        }
        setAttr("recordPage", rs);
        setAttr("lists", rs.getList());
        setAttr("ps", parents);
        render("DemandsList.jsp");
    }
}
