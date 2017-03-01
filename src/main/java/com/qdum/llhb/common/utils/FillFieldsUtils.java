package com.qdum.llhb.common.utils;

import java.util.Date;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 为Model类装填共用字段的工具类
 * 
 * @author rongchao
 *
 */
public class FillFieldsUtils {

	/**
	 * 装填表中create_by,create_date,del_flag等共同的信息
	 * 
	 * @author rongchao
	 *
	 * @param model
	 */
	public static void fillCommonInfo(Model<?> model) {
		Long currentUserID = UserUtils.getUser().getId();
		Date currentDate = new Date();
		model.set("create_by", currentUserID);
		model.set("create_date", currentDate);
		// model.set("update_by", currentUserID);
		// model.set("update_date", currentDate);
		model.set("del_flag", BaseConstants.NOT_DELETE);
	}

	/**
	 * 更新表中 update_by，update_date字段信息
	 * 
	 * @author rongchao
	 *
	 * @param model
	 */
	public static void updateCommonInfo(Model<?> model) {
		Long currentUserID = UserUtils.getUser().getId();
		model.set("update_by", currentUserID);
		model.set("update_date", new Date());
	}
}
