package com.qdum.llhb.integration.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.integration.model.IntergrationIssue;

@ControllerBind(controllerKey = "/integrationIssue/selectUser")
public class intergrationIssueSelectController extends Controller {
	/**
	 * 搜索出来的第二页某一用户的详情
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

}
