package com.qdum.llhb.qykCustom;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;


/**
 * 企业库请求拦截器
 */
public class CustomControllerInterceptor implements Interceptor  {

	@Override
	public void intercept(ActionInvocation inv) {
		// TODO Auto-generated method stub
		Controller controller= inv.getController();
		String para = controller.getPara(0);
		Long companyId=null;
		boolean isEdit=false;
		if(para!=null){
			companyId = Long.parseLong(para.replace("edit", ""));
			isEdit=para.contains("edit");
		}
		
		User user = User.dao.getUserByCompanyId(companyId);
		
		User loginUser = UserUtils.getUser();
		Long loginUserCompanyId = loginUser.getLong("companyId");
		//判断是否开启编辑模式（显示遮罩层）
		boolean showShadeLayer =false;
		boolean isTrue=isEdit&&companyId!=null&&loginUserCompanyId!=null&&companyId.longValue()==loginUserCompanyId.longValue();
		if(isTrue){
			showShadeLayer=true;
			controller.setAttr("edit", "edit");
		}
		
		controller.setAttr("user", user);
		controller.setAttr("companyId", companyId);
		controller.setAttr("showShadeLayer", showShadeLayer);
		inv.invoke();   
	}

}
