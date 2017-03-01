package com.qdum.llhb.common.handler;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;
import com.qdum.llhb.common.utils.UserAgent;
import com.qdum.llhb.common.utils.UserAgentUtil;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.OperationRecord;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 记录用户访问日志
 * @author besterChen
 *
 */
public class LoggerHandler extends Handler {
	@Override
	@SuppressWarnings("unchecked")
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		String moudleName = ""; // 请求的模块名
		String actionName = ""; // 指定的方法名
		String actionString = "";

		int index = target.lastIndexOf(";JSESSIONID");
		
		target = index==-1?target:target.substring(0, index);
		UserAgent userAgent = UserAgentUtil.getUserAgent(request.getHeader("user-agent"));
		if (target.indexOf("/WEB-INF/") != -1 || target.indexOf("/static/") != -1 || 
				target.indexOf(".jsp") != -1 || target.indexOf(".html") != -1 || 
				target.indexOf("/sys/log") != -1 || target.indexOf("/quote") != -1) {
			// 跳过所有由于项目自己页面跳转引起的请求信息
			nextHandler.handle(target, request, response, isHandled);
			return;
		}

		User user = UserUtils.getUser();
		if(user == null || user.getId() == null || user.getId() <= 0) {
			nextHandler.handle(target, request, response, isHandled);
			return;
		}
		
        //判断是否ajax请求  
        String header = request.getHeader("X-Requested-With");  
        boolean isAjax = "XMLHttpRequest".equalsIgnoreCase(header);
		StringBuilder params = new StringBuilder();
		Enumeration<String> enu = request.getParameterNames();
		while(enu.hasMoreElements()){	
			String paraName=(String)enu.nextElement();
			if (params.length() > 0) {
				params.append('&');
			}
			params.append(paraName);
			params.append('=');
			params.append(request.getParameter(paraName));
		}
		
				
		List<Menu> menus = (List<Menu>)UserUtils.getCache("menuList");
		if (menus == null){
			if (user.isAdmin()){
				menus = Menu.dao.findAllList();
			}else{
				menus = Menu.dao.findByUserId(user.getId());
			}
			UserUtils.putCache("menuList", menus);
		}
		for (Menu menu : menus) {
			if (menu.getHref() != null && menu.getHref().length() > 0 && target.indexOf(menu.getHref()) != -1) {
				// 当前网址中能找到href
				moudleName = menu.getName();
				actionString = target.replace(menu.getHref(), "");
				break;
			}
		}
		
		if (moudleName.length() <= 0) {
			moudleName = target;
		}
		
		String [] targetParts = actionString.split("\\/");
		if(targetParts.length>0) {
			actionName = targetParts[targetParts.length-1].trim();
		}

		if ( actionName == null || actionName.length() <= 0) {
			actionName = "index";
		}
		
		if (!isAjax && !actionName.equals("index") && !actionName.equals("form") && !actionName.equals("tree")) {
			OperationRecord operaRecord = new OperationRecord();
			if (userAgent == null) {
				operaRecord.setPlatform("未知");
				operaRecord.setBrowser("未知");
			} else {
				operaRecord.setPlatform(userAgent.getPlatformType() + " " + userAgent.getPlatformSeries() + " " + userAgent.getPlatformVersion());
				operaRecord.setBrowser(userAgent.getBrowserType() + " " + userAgent.getBrowserVersion());
			}
			operaRecord.setMethod(request.getMethod());
			operaRecord.setIsAjax(isAjax);
			operaRecord.setMoudle(moudleName);
			operaRecord.setAction(actionName);
			operaRecord.setParameter(params.toString());
			operaRecord.setReferer(request.getHeader("referer"));
			operaRecord.setCreateBy(user.getId());
			operaRecord.setCreateDate(new Date());
			operaRecord.setUpdateBy(user.getId());
			operaRecord.setUpdateDate(new Date());
			operaRecord.save(operaRecord);
	    }
		
		nextHandler.handle(target, request, response, isHandled);
	}

}
