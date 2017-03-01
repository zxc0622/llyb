package com.qdum.llhb.ypcd.controller;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Banner;


/**
 * 横幅
 * 
 * @author wf
 * @time 
 */
@ControllerBind(controllerKey = "/ypcd/banner")
@Before(AdminInterceptor.class)
public class BannerController extends Controller {
	/**
	 * 添加横幅页面
	 */
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
		User user = UserUtils.getUser();
		String conditon = getPara("conditon");
		if(conditon != null){
			Banner ban = Banner.dao.findById(Long.parseLong(conditon));
			Record re  = Banner.dao.getRecordById(getParaToLong("conditon"));
			setAttr("banner", re);
		}
		List<Dict> dicts = Dict.dao.getDictsByTypeValue("ban_type");
		setAttr("dicts", dicts);
		setAttr("user", user);
		render("banner.jsp");
	}
	//保存信息
	public void saveInfo(){
		User user = UserUtils.getUser();
		boolean flag = false;
		String banId = getPara("banId");
		Banner ban = null;
		if(!banId.equals("")){
			ban = Banner.dao.getBannerById(getParaToLong("banId"));
		}
		if(ban == null){
			ban = new Banner();
			flag  = true; 
		}
		Record re = Db.findFirst("SELECT csb.id as shopId FROM sys_user su LEFT JOIN cs_settings_basic csb on (su.id=csb.user_id)  WHERE su.id="+user.getId());
		ban.set("shop_id", re.get("shopId"));
		ban.set("ad_name", getPara("name"));
		ban.set("ad_pic", getPara("pic"));
		ban.set("ad_url", getPara("conn"));
		ban.set("ad_desc", getPara("details"));
		
		ban.set("del_flag", false);
		ban.set("show_num", getParaToLong("order"));
		ban.set("shop_channel", getPara("bannel"));	
		if(flag == true){
			ban.set("create_by", user.getId());
			ban.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			ban.save();
		}else{
			ban.set("update_by", user.getId());
			ban.set("update_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			ban.update();
		}
		renderText("ok");
	}
	/**
	 * 横幅管理
	 */
	public void banMan(){
		List<Dict> dicts = Dict.dao.getDictsByTypeValue("ban_type");
		setAttr("dicts", dicts);
		User user = UserUtils.getUser();
		String conditon = getPara("conditon");
		Long conLong = -1l;
		if(conditon != null) {
				conLong = Long.parseLong(conditon);
				if(conLong != 0l){
					Dict d = Dict.dao.findById(conLong);
					setAttr("conValue", conLong);
					setAttr("conditon", conditon);
				}
		}else{
			setAttr("conditon", null);
		}
		int yeshu = pageSettingNum;
		try {
			yeshu  =getParaToInt("paginateFenye");
			setAttr("paginateFenye",yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		Page<Record> banners = Banner.dao.getBannersByUserId(getParaToInt(0, 1),yeshu, user.getId(),conditon);
		setAttr("banList", banners.getList());
		setAttr("banners", banners);
		render("banMan.jsp");
	}
	
	//删除选中
	public void delete(){
		String [] numbers = getPara("number").split(",");
		Long[] numInt = new Long[numbers.length];
		for(int i=0;i<numbers.length;i++){
			numInt[i]=Long.parseLong(numbers[i].toString());
			Banner qg  = Banner.dao.getBannerById(numInt[i]);
			qg.set("del_flag", true);
			qg.update();
		}
		renderText("ok");
	}	
			
	
}
