package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.FriendLike;
@ControllerBind(controllerKey = "/ypcd/friendship")
@Before(AdminInterceptor.class)
public class FriendlyLinkController extends Controller{
	/**
	 * 友情链接添加页面初始化
	 */
	public void FriendLyLinkInit(){
		String id=getPara("itemid");
		setAttr("itemid", id);
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(!(list3.isEmpty())){
			setAttr("shop",list3.get(0).get("id"));
			if(id!=null&&!("".equals(id))){
				List<Record> list2=FriendLike.dao.searchFriend(id,list3.get(0).get("id").toString());
				if(!(list2.isEmpty())){
					setAttr("friendList", list2.get(0));
				}
			}
		}
		
		render("friendHrefAdd.jsp");
	}
	/**
	 * 保存或更新
	 */
	public void saveFriend(){
		String id =getPara("id");
		String networkName =getPara("networkName");
		String url =getPara("url");
		String pic =getPara("pic");
		String showOrder =getPara("showOrder");
		String shopId=getPara("shopId");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if("".equals(id)||id==null){
			FriendLike friendLike = new FriendLike();
			friendLike.set("name", networkName);
			friendLike.set("shop_id", shopId);
			friendLike.set("url", url);
			friendLike.set("show_order", showOrder==null||showOrder.equals("")?0:showOrder);
			friendLike.set("pic", pic);
			friendLike.set("sta","1");
			friendLike.set("del_flag","0");
			friendLike.set("create_date", sdf.format(new Date()));
			friendLike.save();
		}else{
			FriendLike friendLike = new FriendLike();
			friendLike.set("id", id);
			friendLike.set("name", networkName);
			friendLike.set("show_order", showOrder==null||showOrder.equals("")?0:showOrder);
			friendLike.set("pic", pic);
			friendLike.set("url",url);
			friendLike.set("sta","1");
			friendLike.set("update_date", sdf.format(new Date()));
			friendLike.update();
		}
		redirect("/ypcd/friendship/friendReview?status=1");
	}
	/**
	 * 友情审核
	 */
	public void friendReview(){
		 User user = UserUtils.getUser();
		 String status =getPara("status");
		 String netWork=getPara("netWork");
		 setAttr("nerWork",netWork);
		 setAttr("status", status);
		 List<Record> list3 =Basic.dao.findBasicId(user.getId());
		 if(!(list3.isEmpty())){
			 Page<Record> list =FriendLike.dao.searchFriendLike(getParaToInt(0, 1),8,netWork,status,Long.valueOf(list3.get(0).get("id").toString()));
			 if(!(list.getList().isEmpty())){
					setAttr("friendLikeList",list.getList());
					setAttr("recordPage", list);
			 }
		 }
		
		render("friendHrefReview.jsp");
	}
	/**
	 * 单个删除
	 */
	public void delFriend(){
		String id =getPara("id");
		String flag="";
		try {
			FriendLike friendLike=new FriendLike();
			friendLike.set("id", id);
			friendLike.set("del_flag", "1");
			friendLike.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
	/**
	 * 批量删除
	 */
	public void deleteFriend(){
		String[] choose=getParaValues("choose");
		String status =getPara("statusV");
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				FriendLike friendLike=new FriendLike();
				friendLike.set("id", choose[i]);
				friendLike.set("del_flag", "1");
				friendLike.update();
			}
		}
		redirect("/ypcd/friendship/friendReview?status="+status+"");
	}
}
