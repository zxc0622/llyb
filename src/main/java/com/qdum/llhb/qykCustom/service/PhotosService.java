package com.qdum.llhb.qykCustom.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyPhotos;

/**
 *	企业相册service
 */
public class PhotosService extends Module {

	@Override
	public void init() {
		List<Record> phoList = SysCompanyPhotos.dao.findPhotosByUserId(userId);
		controller.setAttr("phoList", phoList);
		
	}

}
