package com.qdum.llhb.qykCustom.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomServiceCase;
import com.qdum.llhb.qykCustom.model.SysCompanyCustomServiceType;

/**
 *	服务类型service
 */
public class ServiceTypeService extends Module {
	private SysCompanyCustom moduleMsg;
	
	private final static String defaultType = "1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289";
	
	@Override
	public void init() {
		moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 6);
		//获取用户服务类型
		List<SysCompanyCustomServiceType> stRec = SysCompanyCustomServiceType.dao.getServiceType(moduleMsg.getInt("id"));
		String items = null;
		if(stRec.isEmpty()){
			items = defaultType;
		}else{
			items = stRec.get(0).get("items");
		}
		
		//获取字典表的服务类型
		List<Record> typeList = SysCompanyCustomServiceType.dao.getAllType();
		controller.setAttr("allSType", typeList);
		
		Map<String,String> typeMap = new HashMap<String,String>();
		for(Record r : typeList){
			String typeId = r.getLong("id").toString();
			String typeName = r.getStr("name");
			typeMap.put(typeId, typeName);
		}
		
		//将用户服务类型拆分，与字典表服务类型进行匹配
		String[] its = items.split(",");
		List<Map<String,String>> itemsList = new ArrayList<Map<String,String>>();
		for(int i=0;i<its.length;i++){
			String itemId = its[i];
			String itemName = typeMap.get(itemId);
			Map<String,String> itemMap = new HashMap<String,String>();
			itemMap.put("itemId", itemId);
			itemMap.put("itemName", itemName);
			itemsList.add(itemMap);
		}
		controller.setAttr("items", itemsList);
		
		//获取第一个类型的图片和介绍
//		User user = UserUtils.getUser();
		String firstItemId =  itemsList.get(0).get("itemId");
		List<Record> caseList = SysCompanyCustomServiceCase.dao.getCaseByTypeID(userId, firstItemId);
		if(!(caseList.isEmpty())){
			Record caseRec = caseList.get(0);
			controller.setAttr("firstType", caseRec);
		}
	}
	
	//更新服务类型
	public boolean upadateServiceType(String items,Object companyId){
		moduleMsg = SysCompanyCustom.dao.getModuleMsg(companyId, 6);
		int customid = moduleMsg.getInt("id");
		List<SysCompanyCustomServiceType> sccstList = SysCompanyCustomServiceType.dao.getServiceType(customid);
		boolean bo = true;
		if(sccstList.isEmpty()){
			SysCompanyCustomServiceType sccst = new SysCompanyCustomServiceType();
			sccst.set("custom_id", customid);
			sccst.set("items", items);
			bo = sccst.save();
			
		}else{
			SysCompanyCustomServiceType sccst = sccstList.get(0);
			sccst.set("items", items);
			bo = sccst.update();
		}
		
		return bo;
	}

}
