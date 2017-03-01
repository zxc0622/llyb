package com.qdum.llhb.sys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

public class RoleValidator extends Validator{

	protected void validate(Controller c) {
		Role role = c.getModel(Role.class);
		c.setAttr("role", role);
		validateRequiredString("role.name", "nameMsg", "请输入角色名称");
		validateToken("token", "tokenMsg", "不能重复刷新！");
	}
	protected void handleError(Controller c) {
		Long id = c.getParaToLong("id");
		User user = UserUtils.getUser();
		Role role = Role.dao.findById(id);
		String tokenMsg = c.getAttr("tokenMsg");
		if (tokenMsg != null && !tokenMsg.trim().equals("")) {
			//c.setFlash("message", tokenMsg);
			//c.setFlash("messageType", "success");
			c.redirect("/sys/role");
			return;
		}
		c.setAttr("role", role);
		c.setAttr("menuList", user.getMenuList());
		c.render("roleForm.jsp");
	}
}
