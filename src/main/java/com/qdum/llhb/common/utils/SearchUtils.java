package com.qdum.llhb.common.utils;

import java.util.List;

import com.jfinal.kit.JsonKit;
import com.qdum.llhb.sys.model.DictPcr;

/**
 * 首页搜索框工具类
 * 
 * @author zhaoyl
 * @2015年12月25日18:47:15
 * */
public class SearchUtils {
	/**
	 * 通过类别和父级id获取子列表
	 * 
	 * @param type
	 *            --类别
	 * @param parentId
	 *            --父级id
	 * @return 列表
	 * */
	 public static List<DictPcr> getTypeList(String type, long parentId){
	 List<DictPcr> typeList = DictPcr.dao.getChildrenByParent(type, parentId);//废物的类别 和 父级id
	 	return typeList;
	 }
}
