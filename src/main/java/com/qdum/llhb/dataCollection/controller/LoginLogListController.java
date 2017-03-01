package com.qdum.llhb.dataCollection.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.LoginLog;
/**
 * 数据收集 登录日志
 * @author zhangxm
 */
@ControllerBind(controllerKey="/dataCollection/loginLog")
@Before(AdminInterceptor.class)
public class LoginLogListController extends Controller {
	int pageSize=8;
    private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
		String uname=getPara("uname");
        int yeshu = pageSettingNum;
        try {
            yeshu  =getParaToInt("paginateFenye");
            setAttr("paginateFenye",yeshu);
        } catch (Exception e) {
            yeshu = pageSettingNum;
        }
        Page<Record> logs = LoginLog.dao.findByUser(getParaToInt(0, 1), yeshu,uname);
        if(uname != null && !uname.equals("")){
            setAttr("uname", uname);
        }

        setAttr("recordPage", logs);
        setAttr("lists", logs.getList());
		 render("loginLog.jsp");
	 }
}
