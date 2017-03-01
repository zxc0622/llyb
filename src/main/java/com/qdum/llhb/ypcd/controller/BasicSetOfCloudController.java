package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;

@ControllerBind(controllerKey = "/ypcd/menu")
@Before(AdminInterceptor.class)
public class BasicSetOfCloudController  extends Controller  {

	/**
	 * 基本设置初始
	 */
	public void setOfCloudinit(){
	    User user = UserUtils.getUser();
	    List<Record> list = Basic.dao.findBasicId(user.getId());
	    if(list.size()>0){
	    	setAttr("basic", list.get(0));
	    }
	    List<Record> company =CompanyZl.dao.findCompanyR(user.getId());
		if(!(list.isEmpty())){
			setAttr("enterprise",company.get(0));
		}
		render("BasicSetOfCloud.jsp");
	}
	/**
	 * 更新店铺
	 */
	public void saveCloud(){
		String basicId =getPara("basicId");
		String logoPic =getPara("logoPic");
		String shopNotice =getPara("shopNotice");
		String seoSetting =getPara("seoSetting");
		String keyWords =getPara("keyWords");
		String customService =getPara("customService");
		String shopDesc =getPara("shopDesc");
		String countCode =getPara("countCode");
		String jingyingType =getPara("jingyingType");
        String comLabel = getPara("comLabel");
		String flag="";
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Basic basic = new Basic();
			basic.set("id", basicId);
			basic.set("logo_pic", logoPic);
			basic.set("shop_notice", shopNotice);
			basic.set("seo_setting", seoSetting);
			basic.set("key_words", keyWords);
			basic.set("custom_service", customService);
			basic.set("shop_desc", shopDesc);
			basic.set("count_code", countCode);
			basic.set("update_date", sdf.format(new Date()));
			basic.set("jingying_type",jingyingType);
            basic.set("com_label",comLabel);
			basic.update();
			flag="1";
		} catch (Exception e) {
			flag="2";
		}
		setSessionAttr("flag",flag);
		redirect("/ypcd/menu/setOfCloudinit");
	}
}
