package com.qdum.llhb.common.service;

import javax.servlet.http.HttpServletRequest;

import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

public class HeaderService {
	public static void initHeaderInfo(HttpServletRequest req) {
		//登录状态及企业id
		User user = UserUtils.getUser();
		Long id = user.getId();
		if(id!=null){
			req.setAttribute("loginSta", 1);
			req.setAttribute("comId", user.get("companyId"));
		}
	}
	
}
