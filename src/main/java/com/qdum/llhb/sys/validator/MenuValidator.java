package com.qdum.llhb.sys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.Menu;

public class MenuValidator extends Validator{

	protected void validate(Controller c) {
		Menu menu = c.getModel(Menu.class);
		c.setAttr("menu", menu);
		validateRequiredString("menu.parentId", "parentIdMsg", "必选项目");
		validateRequiredString("menu.name", "nameMsg", "必选项目");
		validateRequiredString("menu.isShow", "isShowMsg", "必选项目");
		validateRequiredString("menu.sort", "sortMsg", "必选项目");
		validateInteger("menu.sort", 0, 99999, "sortMsg", "必选数字");
		validateRequiredString("menu.sort", "sortMsg", "必选项目");
	}
	
	protected void handleError(Controller c) {
		c.render("menuForm.jsp");
	}
}
