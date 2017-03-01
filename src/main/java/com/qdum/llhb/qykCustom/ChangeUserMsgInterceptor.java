package com.qdum.llhb.qykCustom;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 改变用户数据（增删改）拦截器
 * 防止用户未登录的情况下进行攻击性操作
 */
public class ChangeUserMsgInterceptor implements Interceptor  {

	@Override
	public void intercept(ActionInvocation inv) {
		Controller ctrl = inv.getController();
		Long companyId = ctrl.getParaToLong(0);
		User loginUser = UserUtils.getUser();
		Long loginUserCompanyId = loginUser.getLong("companyId");
		boolean isTrue=companyId!=null&&loginUserCompanyId!=null&&companyId.longValue()==loginUserCompanyId.longValue();
		if(isTrue){
			inv.invoke();   
		}else{
			ctrl.renderNull();
		}
		
	}

}
