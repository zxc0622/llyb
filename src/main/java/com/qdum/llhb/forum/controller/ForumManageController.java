package com.qdum.llhb.forum.controller;

import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.forum.model.ForumAnnouncements;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/forum/manage")
public class ForumManageController extends Controller {
	public void index(){
		String pageSize = getPara("pageSize");
		setAttr("pageSize",pageSize);
		int pageSizeInt = 8;
		if(pageSize!=null && !"".equals(pageSize)){
			pageSizeInt = Integer.parseInt(pageSize);
		}
		Page<Record> faPage = ForumAnnouncements.dao.getForumAnnPage(getParaToInt(0,1), pageSizeInt);
		if(faPage != null){
			setAttr("faList",faPage.getList());
			setAttr("recordPage",faPage);
		}
		render("forumMana.jsp");
	}
	/**
	 * 论坛添加
	 * */
	public void add(){
		String id = getPara("id");
		Record fa = ForumAnnouncements.dao.getForumAnnById(id);
		setAttr("fa",fa);
		render("forumAdd.jsp");
	}
	public void save(){
		String annTitle = getPara("annTitle");
		String annHref = getPara("annHref");
		String showOrder = getPara("showOrder");
		String id = getPara("id");
		ForumAnnouncements fa = new ForumAnnouncements();
		if(id!=null && !"".equals(id)){
			fa = ForumAnnouncements.dao.findById(id);
		}
		fa.set("ann_title", annTitle);
		fa.set("ann_href", annHref);
		if(showOrder != null && !"".equals(showOrder)){
			fa.set("show_order", Integer.parseInt(showOrder));
		}
		if(id!=null && !"".equals(id)){
			fa.set("update_by", UserUtils.getUser().getId());
			fa.set("update_time", new Date());
			fa.update();
		}else{
			fa.set("create_by", UserUtils.getUser().getId());
			fa.set("create_time", new Date());
			fa.save();
		}
		redirect("/forum/manage");
	}
	/*删除选择的项*/
	public void delete(){
		String temp = getPara("ids");
		temp = temp.substring(0,temp.length()-1);
		String[] ids = temp.split(",");
		boolean isDelete = false;
		if(ids!=null && ids.length>0){
			isDelete = ForumAnnouncements.dao.isDelete(ids,UserUtils.getUser().getId());
		}
		if(isDelete){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	/**
	 * 置顶操作
	 * */
	public void showTop(){
		String id = getPara("id");
		ForumAnnouncements fa = ForumAnnouncements.dao.findById(id);
		fa.set("show_order", 1);
		fa.set("update_by", UserUtils.getUser().getId());
		fa.set("update_time", new Date());
		boolean isUpdate = fa.update();
		if(isUpdate){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
}
