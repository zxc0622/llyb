package com.qdum.llhb.sys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.Area;

public class AreaValidator extends Validator{

	protected void validate(Controller c) {
		Area area = c.getModel(Area.class);
		c.setAttr("area", area);
		if (area.getName() == null || area.getName().trim().equals("")) {
			addError("nameMsg", "请输入区域名称");
		}
		
	}
	protected void handleError(Controller c) {
		c.render("areaForm.jsp");
	}
}
