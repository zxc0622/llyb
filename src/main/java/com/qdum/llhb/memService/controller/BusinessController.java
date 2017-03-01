package com.qdum.llhb.memService.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
/**
 * 商机收藏
 * @author zhangxm
 */
 @ControllerBind(controllerKey = "/memSerevice/business")
 @Before(AdminInterceptor.class)
public class BusinessController extends Controller{

	 public void index(){
		 render("business.jsp");
	 }
	 /**
	  * 获取列表
	  */
	 public void getBusinessList(){
		 User user = UserUtils.getUser();
		 if(user.getId() != null){
			 List<Record> bus = BusinessCollect.dao.getList(getPara("type"), user.getId(),getPara("title"), getParaToInt("pageNumber"), getParaToInt("pageSize"));
			 renderJson(bus);
		 }
	 }
	 /**
	  * 获取条数
	  */
	 public void getBusCount(){
		 User user = UserUtils.getUser();
		 if(user.getId() != null){
			 long count = BusinessCollect.dao.getBusCount(getPara("type"), user.getId(),getPara("title")).getLong("count");
			 renderJson(count);
		 }
	 }
	 
	 /**
		 * 删除
		 */
		public void del(){
			String str = getPara("ids");
			String[] ids = str.split(",");
			boolean result = true;
			for(int i = 0 ; i < ids.length; i++){
				BusinessCollect bus = BusinessCollect.dao.findById(Long.parseLong(ids[i]));
				if(bus != null){
					result = bus.set("del_flag",1).update();
					if(result == false){
						renderJson(result);
						break;
					}
				}
			}
			renderJson(result);
		}
}
