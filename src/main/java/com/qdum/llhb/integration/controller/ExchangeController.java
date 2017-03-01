package com.qdum.llhb.integration.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.integration.model.Exchange;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/exchange")
public class ExchangeController extends Controller{

	/**
	 *  积分兑换列表初始化
	 */
	public void exchangeList(){
	    User user = UserUtils.getUser();
		String pageSize = getPara("pageSize");
		if(null == pageSize || "".equals(pageSize)){
			pageSize = "8";
		}
		
		Page<Record> list = Exchange.dao.findExchangeList(getParaToInt(0, 1),Integer.valueOf(pageSize),user.getId());
		if(!(list.getList().isEmpty())){
			setAttr("exchange", list.getList());
			setAttr("recordPage", list);
		}
		render("exchangeList.jsp");
	}
}
