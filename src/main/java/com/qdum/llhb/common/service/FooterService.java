package com.qdum.llhb.common.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class FooterService {
	public static void initFooterInfo(HttpServletRequest req){
		//最底部合作网站
		List<Record> websiteTypeList = Db.find("SELECT * FROM sys_dict WHERE type='website_type' AND del_flag=0 ORDER BY sort");
		List<List<Record>> websiteInfo = new ArrayList<List<Record>>();
		for(Record r : websiteTypeList){
			long wsTypeId = r.getLong("id");
			List<Record> websiteInfoList = Db.find("SELECT * FROM sys_cooperation_website WHERE type=? AND del_flag=0 ORDER BY sort",wsTypeId);
			websiteInfo.add(websiteInfoList);
		}
		req.setAttribute("wstl",websiteTypeList);
		req.setAttribute("wsif",websiteInfo);
	}
}
