/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qdum.llhb.sys.utils;

import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.subject.Subject;

import com.google.common.collect.Maps;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.User;

/**
 * 用户工具类
 * @author ThinkGem
 * @version 2013-5-29
 */
public class UserUtils {

	public static final String CACHE_USER = "user";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	private static List<Record> companyMsg;
	
	public static User getUser() {
		User user = (User)getCache(CACHE_USER);
		if (user == null) {
			Principal principal = (Principal)SecurityUtils.getSubject().getPrincipal();
			if (principal != null) {
				user = User.dao.findById(principal.getId());
				
				//用户信息加入companyId	2016.09.24 uck
				companyMsg = CompanyZl.dao.findCompanyR(user.getId());
				user.put("companyId",companyMsg.get(0).getInt("id").longValue());
				
				putCache(CACHE_USER, user);
			}
		}
		if (user == null) {
			user = new User();
			//SecurityUtils.getSubject().logout();
		}
		return user;
	}
	
	public static User getUser(boolean isRefresh) {
		if ( isRefresh ) {
			removeCache(CACHE_USER);
		}
		return getUser();
	}

	public static List<Menu> getMenuList() {
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getCache(CACHE_MENU_LIST);
		if (menuList == null) {
			User user = getUser();
			if (user.isAdmin()) {
				menuList = Menu.dao.findAllList();
			} else {
				menuList = Menu.dao.findByUserId(user.getId());
			}
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	

	// ============== User Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
		Object obj = getCacheMap().get(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
		getCacheMap().put(key, value);
	}

	public static void removeCache(String key) {
		getCacheMap().remove(key);
	}
	
	public static Map<String, Object> getCacheMap() {
		Map<String, Object> map = Maps.newHashMap();
		try {
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			return principal!=null?principal.getCacheMap():map;
		} catch (UnavailableSecurityManagerException e) {
			return map;
		}
	}

    public static boolean isCompany(){
        User user = UserUtils.getUser();
        if(null == user.getId()){
            return false;
        }
        Record u = User.dao.getIndexInfo(user.getId());
        if("企业".equals(u.getStr("label"))){
            return true;
        }else return null != u.get("operator_code") && !"".equals(u.get("operator_code"));
    }
	
}
