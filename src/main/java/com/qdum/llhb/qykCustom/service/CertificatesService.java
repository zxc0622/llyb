package com.qdum.llhb.qykCustom.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyCertificates;

/**
 *	企业资质service
 */
public class CertificatesService extends Module{

	@Override
	public void init() {
		List<Record> cerList = SysCompanyCertificates.dao.findCertificatesByUserId(userId,100);
		controller.setAttr("cerList", cerList);
	}

}
