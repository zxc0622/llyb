package com.qdum.llhb.ypcd.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Ads;
import com.qdum.llhb.ypcd.model.Basic;
/**
 * 云铺管理 - 广告管理
 * @author zhangxm
 */

@ControllerBind(controllerKey = "/ypcd/adsManage")
@Before(AdminInterceptor.class)
public class AdsController extends Controller {
	int pageSize = 8;
	/**
	 * 添加广告
	 */
	public void adsAdd(){
		List<Dict> pfirst=Dict.dao.getDictsByType("csco_type");//所属频道1
		List<Dict> psecond=Dict.dao.getDictsByType("csct_type");//所属频道2
		setAttr("pfirst",pfirst);
		setAttr("psecond",psecond);
		render("adsAdd.jsp");
		if(getPara("id") == null || getPara("id").equals("")){
			render("adsAdd.jsp");
		}else{
			long id=getParaToLong("id");
			List<Record> ad = Ads.dao.getAdById(id);
			setAttr("ad",ad.get(0));
			setAttr("id",id); 
			render("adsEdit.jsp");
		}
	}
	/**
	 * 保存
	 */
	public void saveAds(){
		User user = UserUtils.getUser();
		String id = getPara("id");
		Ads ad = null;
		if(id == "" || id == null){
			ad = new Ads(); 
			ad.set("create_by",user.getId());
			ad.set("create_date",new Date());
		}else{
			ad = Ads.dao.findById(getParaToLong("id")); 
			ad.set("update_by",user.getId());
			ad.set("update_date",new Date());
		}
		long shopId = Basic.dao.findBasicId(user.getId()).get(0).getLong("id");
		ad.set("shop_id",shopId);
		ad.set("channel_id",getParaToLong("channelId"));
		ad.set("channel_id_sec",getParaToLong("channelIdSec"));
		ad.set("ad_name",getPara("adName"));
		ad.set("ad_pic",getPara("adPic"));
		ad.set("ad_url",getPara("adUrl"));
		ad.set("ad_desc",getPara("adDesc"));
		ad.set("show_num",getParaToLong("showNum"));
		ad.set("del_flag",0);
		boolean result = false;
		if(id == "" || id == null){
			result = ad.save();
		}else{
			result = ad.update();
		}
		renderJson(result);
	}
	/**
	 * 广告管理
	 */
	public void adManage(){
		List<Dict> pfirst=Dict.dao.getDictsByType("csco_type");//所属频道1
		List<Dict> psecond=Dict.dao.getDictsByType("csct_type");//所属频道2
		setAttr("pageSize",pageSize);
		setAttr("pfirst",pfirst);
		setAttr("psecond",psecond);
		render("adsManage.jsp");
	}
	/**
	 * 获取列表
	 */
	public void getAds(){
		User user = UserUtils.getUser();
		String pageSizeStr = getPara("pageSize");
		if(pageSizeStr != null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		List<Ads> ads = Ads.dao.getAds(user.getId(), getParaToInt("pageNumber"), pageSize, getPara("channeId"), getPara("channeIdSec"));
		renderJson(ads);
	}
	/**
	 * 获取条数
	 */
	public void getAdsCount(){
		User user = UserUtils.getUser();
		long count = Ads.dao.getAdsCount(user.getId(), getPara("channeId"), getPara("channeIdSec")).getLong("count");
		renderJson(count);
	}
	/**
	 * 删除
	 */
	public void delAds(){
		String str = getPara("ids");
		String[] ids = str.split(",");
		boolean result = true;
		for(int i = 0 ; i < ids.length; i++){
			Ads ad = Ads.dao.findById(Long.parseLong(ids[i]));
			if(ad == null){}else{
				result = ad.set("del_flag",1).update();
				if(result == false){
					renderJson(result);
					break;
				}
			}
		}
		renderJson(result);
	}
}
