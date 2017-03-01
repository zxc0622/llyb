package com.qdum.llhb.qykCustom.service;

import java.util.List;

import com.qdum.llhb.qykCustom.model.SysCompanyBanner;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;



public class BannerService extends Module{

	private SysCompanyCustom customMsg;
	private List<SysCompanyBanner> banners;

	@Override
	public void init() {
		customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue(), 3);
		int customId=customMsg.getInt("id");
		banners = SysCompanyBanner.dao.getBannersBycustomId(customId);
		controller.setAttr("banners", banners);
	}

}
