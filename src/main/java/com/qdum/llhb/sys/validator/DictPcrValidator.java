package com.qdum.llhb.sys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.DictPcr;

public class DictPcrValidator extends Validator{

	protected void validate(Controller c) {
		DictPcr create = c.getModel(DictPcr.class,"create");
		c.setAttr("create", create);
		if (create.getName() == null || create.getName().trim().equals("")) {
			addError("nameMsg", "请输入类别名称");
		}
		
	}
	protected void handleError(Controller c) {
		c.render("categoryForm.jsp");
	}
}
