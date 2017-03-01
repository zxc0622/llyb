package com.qdum.llhb.sys.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.sys.model.UserLog;

/**
 * 用户日志
 *
 */
@ControllerBind(controllerKey = "/sys/userRecord")
@Before(FlashInterceptor.class)
public class UserLogController extends BaseController {
	
	
	public void index() {
		PageUtils pageUtils = getPageParameter();	
		String where = " where del_flag = 0 ";
		if (pageUtils.getMap().get("loginName") != null && !"".equals(pageUtils.getMap().get("loginName").toString())) {
			where = where + " and login_name like'%"+pageUtils.getMap().get("loginName").toString().trim()+"%'";
		}
		if (pageUtils.getMap().get("name") != null && !"".equals(pageUtils.getMap().get("name").toString())) {
			where = where + " and name like '%"+pageUtils.getMap().get("name").toString().trim()+"%' ";
		}
		pageUtils.initialize(UserLog.dao.paginate(pageUtils.getPageNo(),
				pageUtils.getPageSize(), "select * ",
				" from sys_user_log "+where+pageUtils.getOrderBySql()+" order by id desc"));
		
		if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {
			
			pageUtils.setPageNo(1);
			pageUtils.initialize(UserLog.dao.paginate(pageUtils.getPageNo(),
					pageUtils.getPageSize(), "select * ",
					" from sys_user_log "+where+pageUtils.getOrderBySql()+" order by id desc"));
			
		}		
		setAttr("page", pageUtils);
		render("userRecordlist.jsp");
	}

}
