package com.qdum.llhb.qykCustom.service;

import java.util.List;

import com.qdum.llhb.qykCustom.model.SysCompanyCourse;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;

public class CourseService extends Module {
	private SysCompanyCustom moduleMsg;
	private List<SysCompanyCourse> courseMsg;

	@Override
	public void init() {
		moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 5);
		courseMsg = SysCompanyCourse.dao.getCourseMsg(moduleMsg.getInt("id"));
		controller.setAttr("courseMsg", courseMsg);
	}

}
