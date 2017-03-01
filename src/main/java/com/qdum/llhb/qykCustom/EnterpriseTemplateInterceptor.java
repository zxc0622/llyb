package com.qdum.llhb.qykCustom;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class EnterpriseTemplateInterceptor implements Interceptor {
	@Override
	public void intercept(ActionInvocation aci) {
		Controller ctrl = aci.getController();
		String companyId = ctrl.getPara(0);
		String requestUrl=ctrl.getRequest().getServletPath();
		String url=null;
		Record basicInfo = Db.findFirst("SELECT s.template_id from cs_settings_basic s " +
				"LEFT JOIN sys_company c ON c.user_id=s.user_id WHERE c.id=?",companyId);
		Long templateId = 0L;
		if(basicInfo != null){
			Object obj = basicInfo.get("template_id");
			if(obj != null){
				templateId = (Long)obj;
			}
		}
		String para = ctrl.getPara()==null?"":ctrl.getPara();
		switch (templateId.intValue()) {
		case 1:
			url="/homepage/"+para;
			break;
		case 2:
			url="/Library/enterpriseCustom/"+para;
			break;
		default:
			url="/homepage/"+para;
			break;
		}
		if(requestUrl.equalsIgnoreCase(url)||"true".equals(ctrl.getAttr("isForward"))){
			aci.invoke();
		}else{
			ctrl.setAttr("isForward", "true");
			ctrl.forwardAction(url);
		}
	}

}
