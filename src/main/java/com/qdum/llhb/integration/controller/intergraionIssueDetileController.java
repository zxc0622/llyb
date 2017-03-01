package com.qdum.llhb.integration.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.integration.model.IntergrationIssue;

@ControllerBind(controllerKey = "/integrationIssue/sendInteRecord")
public class intergraionIssueDetileController extends Controller {
	/**
	 * 第二页的积分获取记录的详情
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
		Integer UserId = getParaToInt("userId");
		Page<Record> page = IntergrationIssue.dao.getAllProduct(pageNumber,
				pageSize, UserId);
		if (page != null) {
			setAttr("recordList", page.getList());
			setAttr("recordPage", page);
			setAttr("userId", UserId);
		}
		render("detile.jsp");

	}

}
