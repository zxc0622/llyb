package com.qdum.llhb.qykCustom.service;


import java.util.List;

import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyProduct;

/**
 *	产品展示service
 */
public class ShowProdService extends Module {

	@Override
	public void init() {
		List<Record> proList = SysCompanyProduct.dao.findPrdoductByUserId(userId);
		controller.setAttr("productList", proList);
	}

}
