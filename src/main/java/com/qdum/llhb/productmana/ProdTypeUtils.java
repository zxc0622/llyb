package com.qdum.llhb.productmana;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.sys.model.DictPcr;

public class ProdTypeUtils {
	
	//获取商品分类
	public static List<Map<String,Object>> selectType(){
		List<DictPcr> list = DictPcr.dao.find("select * from sys_dict_pcr where del_flag='0' and parent_id =0 and type " +
				"in ('service_type','material_type','equipment_type');");
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		int index = 0;
		String name=null;
		int size=list.size();
		for(int i=0; i<size; i++){
			DictPcr e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id",e.getId());
			map.put("pId",e.getParentId());
			map.put("type", e.getType());
			switch (e.getLong("id").intValue()) {
			case 142:
				name="环保原料";
				break;
			case 307:
				name="环保服务";
				index=1;
				break;
			case 932:
				name="环保设备";
				index=1;
				break;
			}
			map.put("name",name);
			mapList.add(index,map);
		}
		return mapList;
	}
	
	public static String getProdType(){
		if(CacheKit.get("prod", "prodTypes")==null){
			List<Map<String,Object>> typeFirst=selectType();
			List<DictPcr> typeSecond;
			List<DictPcr> typeThird;
			Long id;
			JSONArray t=new JSONArray();
			JSONArray t1=new JSONArray();
			JSONArray t2=new JSONArray();
			JSONObject temp=new JSONObject();
			for (Map<String, Object> map : typeFirst) {
				id=(Long) map.get("id");
				typeSecond=DictPcr.dao.getChildList(id);
				for (DictPcr type1 : typeSecond) {
					typeThird=DictPcr.dao.getChildList(type1.getId());
					for (DictPcr dictPcr : typeThird) {
						temp.put("name", dictPcr.get("name"));
						temp.put("id", dictPcr.getId());
						t2.add(temp.toString());
						temp.clear();
					}
					temp.put("name", type1.get("name"));
					temp.put("id", type1.getId());
					temp.put("childrens", t2);
					t1.add(temp.toString());
					t2.clear();
					temp.clear();
				}
				temp.put("name", map.get("name"));
				temp.put("id", map.get("id"));
				temp.put("childrens", t1);
				t.add(temp.toString());
				t1.clear();
				temp.clear();
			}
			CacheKit.put("prod", "prodTypes", t.toString());
		}
		
		return CacheKit.get("prod", "prodTypes");
	}
	
}
