package com.qdum.llhb.youyimoney.controller;


import java.text.SimpleDateFormat;
import java.util.Date;


import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.reg.model.UserRole;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.SettingBasic;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 优蚁币管理
 * @author wf
 *
 */

@ControllerBind(controllerKey = "/youyimoney")
@Before(AdminInterceptor.class)
public class YouyiManagerController extends Controller {
	 /**
	  * 兑换
	  */
	public void convert(){
		render("convert.jsp");
	}
	/**
	 * 等级
	 */
	public void level(){
		render("level.jsp");
	}
	/**
	 * 兑换列表
	 */
	public void convertList(){
		render("convertList.jsp");
	}
	/**
	 * 产品介绍
	 */
	public void productIntro(){
		render("productIntro.jsp");
	}
	/**
	 * 确认兑换
	 */
	public void sureConvert(){
		render("sureConvert.jsp");
	}
	/**
	 * 添加地址
	 */
	public void addAdd(){
		render("addAdd.jsp");
	}
	/**
	 * 修改地址
	 */
	public void resetAddr(){
		render("resetAddr.jsp");
	}
	
}
