package com.qdum.llhb.productmana.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.NumberUtil;

public class PraisePic extends Model<PraisePic> {
	public static final PraisePic dao = new PraisePic();
	
	public static final String ID 			= "id";
	public static final String PRAISE_ID	= "praise_id";//商品id
	public static final String PIC 			= "pic"; //评价标签value
	public static final String CREATE_BY 	= "create_by";
	public static final String CREATE_DATE 	= "create_date";
	public static final String UPDATE_BY 	= "update_by";
	public static final String UPDATE_DATE 	= "update_date";
	public static final String REMARKS 		= "remarks";
	public static final String DEL_FLAG 	= "del_flag";
	
	public void setId(long id){
		set(ID,id);
	}
	public long getId(){
		return get(ID);
	}
	
	public void setPraiseId(long praiseId){
		set(PRAISE_ID,praiseId);
	}
	public long getPraiseId(){
		return get(PRAISE_ID);
	}
	
	public void setPic(String pic){
		set(PIC,pic);
	}
	public String getPic(){
		return get(PIC);
	}
	
	public long getCreateBy() {
		return getLong(CREATE_BY);
	}
	public void setCreateBy(long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		return (Date)get(CREATE_DATE);
	}
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	public void setUpdateBy(long createBy ) {
		set(UPDATE_BY,createBy);
	}
	
	public Date getUpdateDate(){
		return getDate(UPDATE_DATE);
	}
	public void setUpdateDate(Date createDate ){
		set(UPDATE_DATE,createDate);
	}
	
	public void setRemarks(String remarks){
		set(REMARKS,remarks);
	}
	public String getRemarks(){
		return get(REMARKS);
	}
	
	public void setDelFlag(int delFlag) {
		set(DEL_FLAG, delFlag);
	}
	public int getDelFlag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}
	
	/**
	 *通过评论id 获取评论图片 
	 */
	public List<PraisePic> getPicsByPraId(long praId){
		String sql = "select *from inma_product_praise_pic where del_flag=0 and praise_id="+praId;
		return PraisePic.dao.find(sql);
	}
}
