package com.qdum.llhb.forum.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;



import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.forum.model.ForumUserBlacklist;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/forum/manage/blacklist")
public class ForumUserBlacklistController extends Controller {
	private static final int DELETED = 1;//表示删除
	public void index(){
		setAttr("loginName",getPara("loginName"));
		setAttr("blacklist",ForumUserBlacklist.dao.getList());
		render("userBlacklist.jsp");
	}
	/**
	 * 检测用户
	 * */
	public void add(){
		String loginName = getPara("loginName");
		String shutPeriod = getPara("shutPeriod");
		String remarks = getPara("remarks");
		User user = User.dao.getIdByName(loginName);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date()); 
		if(user!=null){
			ForumUserBlacklist fub = ForumUserBlacklist.dao.getByUserId(user.getId());
			if(fub!=null){
				fub.set("del_flag", DELETED);
				fub.update();
			}
			fub = new ForumUserBlacklist();
			fub.set("user_id", user.getId());
			fub.set("start_time", new Date());
			fub.set("shut_period", Integer.parseInt(shutPeriod));
			if(shutPeriod!=null && shutPeriod.equals("0")){
				try {
					fub.set("end_time",new SimpleDateFormat("yyyy-MM-dd").parse("9999-12-31"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}else{
				calendar.set(Calendar.DAY_OF_MONTH,calendar.get(Calendar.DAY_OF_MONTH)+Integer.parseInt(shutPeriod));
				fub.set("end_time", calendar.getTime());//结束时间为开始时间加上禁言时长
			}
			fub.set("remarks", remarks);
			fub.set("create_by", UserUtils.getUser().getId());
			fub.set("create_date", new Date());
			fub.save();
			renderJson(true);//表示用户存在并可以添加
		}else{
			renderJson(false);//表示该用户不存在
		}
	}
	/**
	 * 解除禁言
	 * */
	public void removeGag(){
		String id = getPara("id");
		boolean isRemove = ForumUserBlacklist.dao.findById(id).set("del_flag", DELETED).update();
		renderJson(isRemove);
	}
}
