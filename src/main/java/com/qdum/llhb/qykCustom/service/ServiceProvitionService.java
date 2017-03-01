package com.qdum.llhb.qykCustom.service;

import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyServiceProvition;

public class ServiceProvitionService extends Module {
	private SysCompanyCustom moduleMsg;
	private SysCompanyServiceProvition provMsg;
	
	@Override
	public void init() {
		moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 11);
		provMsg = SysCompanyServiceProvition.dao.getProvMsg(moduleMsg.getInt("id"));
		controller.setAttr("provMsg", provMsg);
		
	}

}
