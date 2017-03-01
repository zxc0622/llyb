package com.qdum.llhb.sys.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 字典
 * @author dzw
 *
 */

public class Dict extends Model<Dict> {
	private static final long serialVersionUID = 1L;
	public static Dict dao = new Dict();
	
	public static final String ID     		= "id";			// 编号
	public static final String LABEL  		= "label";		// 标签名
	public static final String VALUE  		= "value";		// 数据值
	public static final String TYPE   		= "type";		// 类型
	public static final String DESCRIPTION  = "description";// 描述
	public static final String SORT 		= "sort";		// 排序
	public static final String DEL_FLAG 	= "del_flag";
	public static final String CREATE_BY 	= "create_by";	 //创建人
	public static final String UPDATE_BY 	= "update_by";	 //修改人
	public static final String CREATE_DATE 	= "create_date"; //创建时间
	public static final String UPDATE_DATE 	= "update_date"; //修改时间
	
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	
	public void setLabel(String label) {
		set(LABEL, label);
	}
	
	public String getLabel() {
		return get(LABEL);
	}
	public void setValue(String value) {
		set(VALUE, value);
	}
	
	public String getValue() {
		return get(VALUE);
	}
	
	
	
	public void setType(String type) {
		set(TYPE, type);
	}
	
	public String getType() {
		return get(TYPE);
	}
	
	public void setDescription(String description) {
		set(DESCRIPTION, description);
	}
	
	public String getDescription() {
		return get(DESCRIPTION);
	}
	
	public void setSort(Integer sort) {
		set(SORT, sort);
	}
	
	public Integer getSort() {
		return getInt(SORT);
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
	
	public void setUpdateDate(Date createDate ) {
		set(UPDATE_DATE,createDate);
	}
	
	/**
	 * 保存更新
	 * @param dict
	 */
	public void save(Dict dict) {
		CacheKit.remove("sysCache","dictMap");
		if (dict.getId() == null || dict.getId() == 0L) {
			dict.save();
		} else {
			dict.update();
		}
	}
	
	/**
	 * 检索所有
	 * @return
	 */
	public List<Dict> findAllList() {
		String sql = "select * from sys_dict where del_flag='0' order by sort";
		List<Dict> list = Dict.dao.find(sql);
		return list;
	}
	
	/**
	 * 获得所有分类
	 * @return
	 */
	public List<String> getAllTypeList() {
		List<Record> typeList = Db.find("select type from sys_dict where del_flag='0' group by type");
		List<String> types    = new ArrayList<String>();
		for(int i=0; i<typeList.size(); i++) {
			types.add(typeList.get(i).getStr("type"));
		}
		return types;
	}
	
	/**
	 * 根据数据类型查询出该类型下的数据
	 */
	public List<Dict> getDictsByType(String type) {
		String sql = "select * from sys_dict where del_flag='0' and type=?";
		List<Dict> list = Dict.dao.find(sql, type);
		return list;
	}
	/**
	 * 根据条件查询出该类型下的数据
	 */
	public List<Dict> getDictsByTypeValue(String type) {
		String sql = "select * from sys_dict where del_flag='0' and type=? and value!=0 order by sort ";
		List<Dict> list = Dict.dao.find(sql, type);
		return list;
	}
	/**
	 * 根据name查
	 */
	public Dict getIdByName(String name,String userType) {
		String sql = "select * from sys_dict where del_flag='0' and type = '"+userType+"' and label='"+name+"'";
		return Dict.dao.findFirst(sql);
	}
	/**
	 * 根据id查
	 */
	public Dict getNameById(int id,String userType) {
		String sql = "select label from sys_dict where del_flag='0' and type = '"+userType+"' and id=?";
		return Dict.dao.findFirst(sql, id);
	}
	/**
	 * 查value
	 */
	public Dict getNameByValue(int value,String userType) {
		String sql = "select * from sys_dict where del_flag='0' and type = '"+userType+"' and value=?";
		return Dict.dao.findFirst(sql, value);
	}
	public Dict getNameByValue(String value,String userType) {
		String sql = "select * from sys_dict where del_flag='0' and type = '"+userType+"' and value=?";
		return Dict.dao.findFirst(sql, value);
	}
}
