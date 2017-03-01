package com.qdum.llhb.integration.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.integration.model.IntergrationIssue;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/integrationIssue")
public class intergrationIssueController extends Controller {
	/**
	 * 积分发放记录初始化列表
	 */

	public void sendInteRecord() {
		Integer pageNumber = getParaToInt(0);
		if (pageNumber == null) {
			pageNumber = 1;
		}
		setAttr("pageNumber", pageNumber);
		Integer pageSize = getParaToInt("pageSize");
		if (pageSize == null) {
			pageSize = 8;// 默认显示8条数据。
		}
		setAttr("pageSize", pageSize);

		Page<Record> page = IntergrationIssue.dao.getAll(pageNumber, pageSize);
		if (page != null)

		{
			setAttr("recordList", page.getList());
			setAttr("recordPage", page);
		}
		render("sendInteRecord.jsp");
	}

	/**
	 * 积分发放记录的个人详情。
	 */
	public void detile() {
		Integer pageNumber = getParaToInt(0);
		if (pageNumber == null) {
			pageNumber = 1;
		}
		setAttr("pageNumber", pageNumber);
		Integer pageSize = getParaToInt("pageSize");
		if (pageSize == null) {
			pageSize = 8;// 默认显示8条数据
		}
		setAttr("pageSize", pageSize);
		Integer userId = getParaToInt("userId");
		Page<Record> page = IntergrationIssue.dao.getAllProduct(pageNumber,
				pageSize, userId);
		if (page != null) {
			setAttr("recordList", page.getList());
			setAttr("recordPage", page);
			setAttr("userId", userId);
		}
		render("intergrationDistribute.jsp");
	}

	/**
	 * 查找用户操作
	 */
	public void selectUser() {
		Integer pageNumber = getParaToInt(0);
		if (pageNumber == null) {
			pageNumber = 1;
		}
		Integer pageSize = getParaToInt("pageSize");
		if (pageSize == null) {
			pageSize = 8;// 默认显示8条数据
		}
		String userName = getPara("userName");
		String tel = getPara("tel");
		if (userName != null && !userName.equals("")) {
			setAttr("userName", userName);
		}
		if (tel != null && !tel.equals("")) {
			setAttr("tel", tel);
		}

		Page<Record> page = IntergrationIssue.dao.getAllSelect(pageNumber,
				pageSize, userName, tel);
		if (page != null)

		{
			setAttr("recordList", page.getList());
			setAttr("recordPage", page);
		}
		render("selectUser.jsp");

	}

}
