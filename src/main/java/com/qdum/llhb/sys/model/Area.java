/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

/**
 * 区域Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class Area extends Model<Area> {
	private static final long serialVersionUID = 1L;
	public static Area dao = new Area();
	
	public static final String ID 			= "id";		   	// 编号
	public static final String PARENT_ID    = "parent_id"; 	// 父级编号
	public static final String PARENT_IDS   = "parent_ids";	// 所有父级编号
	public static final String CODE         = "code";	   	// 区域编码
	public static final String NAME		    = "name";	   	// 区域名称
	public static final String TYPE         = "type";	   	// 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	public static final String REMARKS      = "remarks";   	//备注
	public static final String DEL_FLAG     = "del_flag";  	//删除标志
	public static final String CREATE_BY 	= "create_by"; 	//创建人
	public static final String UPDATE_BY 	= "update_by"; 	//修改人
	public static final String CREATE_DATE 	= "create_date";//创建人
	public static final String UPDATE_DATE 	= "update_date";//修改人
	public static final String PINYIN		= "pinyin";		//区域拼音
	
	public Long getId() {
		return getLong(ID);
	}

	public void setId(Long id) {
		set(ID,id);
	}
	
	public Long getParentId() {
		return getLong(PARENT_ID);
	}

	public void setParentId(Long parentId) {
		set(PARENT_ID,parentId);
	}

	public String getParentIds() {
		return get(PARENT_IDS);
	}

	public void setParentIds(String parentIds) {
		set(PARENT_IDS,parentIds);
	}
	
	public String getName() {
		return get(NAME);
	}

	public void setName(String name) {
		set(NAME,name);
	}

	public Integer getType() {
		return NumberUtil.toInteger(get(TYPE));
	}

	public void setType(Integer type) {
		set(TYPE,type);
	}

	public String getCode() {
		return get(CODE);
	}

	public void setCode(String code) {
		set(CODE,code);
	}

	public String getRemarks() {
		return get(REMARKS);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS,remarks);
	}
	
	
	public void setDelflag(int delFlag) {
		set(DEL_FLAG, delFlag);
	}
	
	public Integer getDelflag() {
		return getInt(DEL_FLAG);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		 return getDate(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	
	public void setUpdateBy(Long createBy ) {
		set(UPDATE_BY,createBy);
	}
	
	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate) {
		set(UPDATE_DATE,createDate);
	}
	
	public String getPinyin() {
		return getStr(PINYIN);
	}
	
	public void setPinyin(String pinyin) {
		set(PINYIN,pinyin);
	}
	
	/**
	 * 获取所有列表
	 * */
	public List<Area> getAll(){
		String sql = "select *from sys_area where del_flag = 0";
		return Area.dao.find(sql);
	}
	/**
	 * 查询子节点
	 * @return
	 */
	public List<Area> getChildList() {
		List<Area> childList = Area.dao.find("select * from sys_area where parent_id=? ",getId());
		return childList;
	}
	public List<Area> getChildList(String ids) {
		List<Area> childList = Area.dao.find("select * from sys_area where parent_ids=? ",ids);
		return childList;
	}
	/**
	 * 查询子节点2
	 * @return
	 */
	public List<Record> getChildList2(String id) {
		String sql="select * from sys_area where parent_id='"+id+"'";
		List<Record> childList = Db.find(sql);
		return childList;
	}
	/**
	 * 查询父节点
	 * @return
	 */
	public Area getParent() {
		Area area = Area.dao.findFirst("select * from sys_area where id=? ",getParentId());
		return area;
	}
	
	/**
	 * 安装
	 * @param area
	 */
	public void save(Area area) {
		if (area.getId() == null||area.getId() == 0L) {
			area.save();
		} else {
			area.update();
		}
	}
	
	/**
	 * 得到所有未删除的区域
	 * @return List<Menu>
	 */
	public List<Area> findAllList() {
		String sql = "select * from sys_area where del_flag='0' order by id";
		List<Area> list = Area.dao.find(sql);
		return list;
	}
	
	public static void sortList(List<Area> list, List<Area> sourcelist, Long parentId) {
		for (int i=0; i<sourcelist.size(); i++) {
			Area e = sourcelist.get(i);
			if (e.getParentId() != null && e.getParentId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					Area childe = sourcelist.get(j);
					if (childe.getParentId() != null && childe.getParentId().equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}


	public boolean isAdmin() {
		return isAdmin(getId());
	}
	
	public static boolean isAdmin(Long id) {
		return id != null && id.equals(1L);
	}
	/**
	 * 根据name得到id
	 */
	public Area getIdByName(String name){
		return Area.dao.findFirst("select id from sys_area WHERE del_flag ='0' AND name='"+name+"' ");
	}
	/**
	 * 根据id得到name
	 */
	public Area getNameById(Object id){
		return Area.dao.findFirst("select * from sys_area WHERE del_flag ='0' AND id="+id);
	}
	/**
	 * 模糊匹配
	 */
	public Area getIdByNameMohu(String name){
		return  Area.dao.findFirst("SELECT * FROM sys_area a WHERE a.`name` like '"+name+"%'");
	}
}