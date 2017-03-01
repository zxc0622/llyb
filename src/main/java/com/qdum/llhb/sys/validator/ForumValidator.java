package com.qdum.llhb.sys.validator;


import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.ForumBoard;

public class ForumValidator extends Validator {
	protected void validate(Controller c) {
		ForumBoard forum = c.getModel(ForumBoard.class,"create");
		c.setAttr("forum", forum);
		if (forum.getBoardName() == null || forum.getBoardName().trim().equals("")) {
			addError("nameMsg", "请输入类别名称");
		}
	}
	protected void handleError(Controller c) {
		c.render("forumForm.jsp");
	}
}
