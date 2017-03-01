package com.qdum.llhb.sys.controller;

import org.apache.shiro.authz.annotation.RequiresUser;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;

/**
 * 标签Controller
 * @author ThinkGem
 * @version 2013-3-23
 */
@ControllerBind(controllerKey="/sys/tag")
public class TagController extends Controller {
	/**
	 * 树结构选择标签（treeselect.tag）
	 */
	@RequiresUser
	public void treeselect() {
		setAttr("url", getRequest().getParameter("url")); 	// 树结构数据URL
		setAttr("extId", getRequest().getParameter("extId")); // 排除的编号ID
		setAttr("checked", getRequest().getParameter("checked")); // 是否可复选
		setAttr("selectIds", getRequest().getParameter("selectIds")); // 指定默认选中的ID
		setAttr("module", getRequest().getParameter("module"));	// 过滤栏目模型（仅针对CMS的Category树）
		setAttr("extIdValue", getRequest().getParameter("extIdValue"));	// 额外的id值
		render("tagTreeselect.jsp");
	}
}
