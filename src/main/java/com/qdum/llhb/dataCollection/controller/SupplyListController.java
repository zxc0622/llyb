package com.qdum.llhb.dataCollection.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.sys.model.DictPcr;
/**
 * 数据收集 供应列表
 * @author zhangxm
 */
@ControllerBind(controllerKey="/dataCollection/supply")
@Before(AdminInterceptor.class)
public class SupplyListController extends Controller {
	int pageSize = 8;
    private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
        String leibie = getPara("leibie");
        String title = getPara("title");

        List<DictPcr> parents  = DictPcr.dao.getDictsByType("supply_type", 428l);
        int yeshu = pageSettingNum;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = pageSettingNum;
        }
        Page<Record> rs = SupplyInfo.dao.getDataColectionListsAll(getParaToInt(0, 1), yeshu,leibie,title);
        if(leibie != null && !leibie.equals("")){
            setAttr("leibie", leibie);
        }
        if(title != null && !title.equals("")){
            setAttr("title", title);
        }
        setAttr("recordPage", rs);
        setAttr("lists", rs.getList());
        setAttr("ps", parents);
		 render("supplyList.jsp");
	 }
}
