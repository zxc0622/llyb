package com.qdum.llhb.sys.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.common.utils.PageUtils;

public class BaseController extends Controller {
	
	public void addMessageSuccess(String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages) {
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		//setFlash("message", sb.toString());
		//setFlash("messageType", "success");
	}
	
	public void addMessageError(String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages) {
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		//setFlash("message", sb.toString());
		//setFlash("messageType", "error");
	}
	
	/**
	 * 获取参数 Long数组
	 * @param name
	 * @return
	 */
	public Long[] getParaValuesToLong(String name) {
		String[] values = getRequest().getParameterValues(name);
		if (values == null)
			return null;
		Long[] result = new Long[values.length];
		for (int i=0; i<result.length; i++)
			result[i] = Long.parseLong(values[i]);
		return result;
	}
	
	/**
	 * 获取分页表单查询参数
	 * 封装的pageUtils对象来传递分页信息
	 * @return
	 */
	public PageUtils getPageParameterWithNoCache() {
		Integer pageNo = NumberUtil.toInteger(getParaToInt("pageNo"),1);
		Integer PageSize = NumberUtil.toInteger(getParaToInt("pageSize"),10);
		String orderBy = getPara("orderBy");
		if (orderBy == null) {
			orderBy = "";
		}
		//获取所有页面参数 (用来初始化查询表单)
		Map<String, Object> map = new HashMap<String,Object>();
		Enumeration<String> enu = getParaNames();
		while (enu.hasMoreElements()) {	
			String paraName = (String)enu.nextElement();
			map.put(paraName, getPara(paraName));
		} 
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageNo(pageNo);
		pageUtils.setOrderBy(orderBy);
		pageUtils.setPageSize(PageSize);
		pageUtils.setMap(map);
		return pageUtils;
	}
	
	/**
	 * 获取分页表单查询参数
	 * 使用cookie的方式缓存分页信息
	 * @return
	 */
	public PageUtils getPageParameter() {
		//获取当前访问的页面地址
		String url = this.getRequest().getRequestURI();
		//获取分页参数
		Integer pageNo = getParaToInt("pageNo"); 
		Integer pageSize = getParaToInt("pageSize");
		//当日使用过分页
		if ( getCookie("listPageUrl") != null){
			//上一次访问列表与本次相同
			if ( url.equals(getCookie("listPageUrl"))) {
				//如果访问时没有提供访问页面参数 从cookie中取上次访问的页码参数
				if (pageNo == null) {
					//取cookie保存页码
					pageNo = NumberUtil.toInteger(getCookie("pageNo"),1);
				}
				//如果访问时没有提供访问页面参数 从cookie中取上次访问的页码参数
				if (pageSize == null) {
					//取cookie保存每页数据量
					pageSize = NumberUtil.toInteger(getCookie("pageSize"),10);
				}
			//上次访问页面与本次不同
			} else {
				pageNo = NumberUtil.toInteger(pageNo,1);
				pageSize = NumberUtil.toInteger(pageSize,10);
			}
		
		//第一次使用分页
		} else {
			pageNo = NumberUtil.toInteger(pageNo,1);
			pageSize = NumberUtil.toInteger(pageSize,10);
		}
		
		//设置cookie每页数据量
		setCookie("pageSize",String.valueOf(pageSize),60*60*24);
		//设置cookie当前页码
		setCookie("pageNo",String.valueOf(pageNo),60*60*24);
		//设置cookie访问URL
		setCookie("listPageUrl",String.valueOf(url),60*60*24);
				
		String orderBy = getPara("orderBy");
		if (orderBy == null) {
			orderBy = "";
		}
		String order = getPara("order");
		if (order == null) {
			order = "";
		}
		//获取所有页面参数 (用来初始化查询表单)
		Map<String, Object> map = new HashMap<String,Object>();
		Enumeration<String> enu = getParaNames();
		while(enu.hasMoreElements()) {	
			String paraName=(String)enu.nextElement();
			map.put(paraName, getPara(paraName));
		} 
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageNo(pageNo);
		pageUtils.setOrderBy(orderBy);
		pageUtils.setOrder(order);
		pageUtils.setPageSize(pageSize);
		pageUtils.setMap(map);
		return pageUtils;
	}
}
