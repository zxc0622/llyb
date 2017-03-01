package com.qdum.llhb.sys.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.qdum.llhb.sys.model.Dict;

/**
 * 字典信息后端验证
 * @author dzw
 *
 */
public class DictValidator extends Validator{
	/**
	 * 表单验证
	 */
	protected void validate(Controller c) {
		Dict dict = c.getModel(Dict.class);
		c.setAttr("dict", dict);
		if (dict.getLabel() == null || dict.getLabel().trim().equals("")) {
			addError("labelMsg", "请输入标签");
		}
		if (dict.getValue() == null || dict.getValue().trim().equals("")) {
			addError("valueMsg", "请输入键值");
		}
		if (dict.getType() == null || dict.getType().trim().equals("")) {
			addError("typeMsg", "请输入类型");
		}
		if (dict.getDescription() == null || dict.getDescription().trim().equals("")) {
			addError("descriptionMsg", "请输入描述");
		}
		if (dict.getSort() == null || dict.getSort() == 0) {
			addError("sortMsg", "请输入序号");
		}
		
	}
	
	protected void handleError(Controller c) {
		c.render("dictForm.jsp");
	}
}
