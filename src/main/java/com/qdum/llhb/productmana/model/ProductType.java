package com.qdum.llhb.productmana.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class ProductType extends Model<ProductType> {
	public static final long productRootID = 0L;
	public static final ProductType dao = new ProductType();
	
	public static final String ID 			= "id";
	public static final String PARENT_ID 	= "parent_id";
	public static final String PATENT_IDS 	= "parent_ids";
	public static final String NAME 		= "name";
	public static final String TYPE			= "type";
	
	public long getProductRootID(){
		return productRootID;
	}
	
	public void setId(long id){
		set(ID,id);
	}
	public long getId(){
		return getLong(ID);
	}
	
	public void setParentId(long parentId){
		set(PARENT_ID,parentId);
	}
	public long getParentId(){
		return getLong(PARENT_ID);
	}
	
	public void setParentIds(String parentIds){
		set(PATENT_IDS,parentIds);
	}
	public String getParentIds(){
		return get(PATENT_IDS);
	}
	
	public void setTypeName(String name){
		set(NAME,name);
	}
	public String getTypeName(){
		return get(NAME);
	}
	
	public void setType(String type){
		set(TYPE,type);
	}
	public String getType(){
		return get(TYPE);
	}
	
	//获取类型列表
	public List<ProductType> findProductTypeList(long parentId){
		return ProductType.dao.find("select * from `sys_dict_pcr` where del_flag=0 and parent_id= "+parentId);
	}
	
}
