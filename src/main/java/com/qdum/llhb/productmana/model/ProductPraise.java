package com.qdum.llhb.productmana.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

public class ProductPraise extends Model<ProductPraise> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static final ProductPraise dao = new ProductPraise();
	
	public static final String ID 			= "id";
	public static final String PRODUCT_ID	= "product_id";//商品id
	public static final String PRA_NUM 		= "pra_num"; //评价，1-差评，3-中评，5-好
	public static final String PRA_IMGS		="pra_imgs";
	public static final String PRA_DESC 	= "pra_desc";//描述
	public static final String IS_NIMING 	= "is_niming";//是否匿名
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
	
	public void setProductId(long productId){
		set(PRODUCT_ID,productId);
	}
	public long getProductId(){
		return get(PRODUCT_ID);
	}
	
	public void setPraNum(int praNum){
		set(PRA_NUM,praNum);
	}
	public int getPraNum(){
		return get(PRA_NUM);
	}
	
	public void setPraImgs(String praImgs){
		set(PRA_IMGS,praImgs);
	}
	public int getPraImgs(){
		return get(PRA_IMGS);
	}
	
	public void setPraDesc(String praDesc){
		set(PRA_DESC,praDesc);
	}
	public int getPraDesc(){
		return get(PRA_DESC);
	}
	
	public void setIsNiMing(int isNiMing){
		set(IS_NIMING,isNiMing);
	}
	public int getIsNiMing(){
		return get(IS_NIMING);
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
	 *所有评价分页 
	 */
	public Page<Record> findPraiseDetailPage(int pageNumber,int pageSize,long proId){
		String select = "SELECT u.login_name, pp.* ";
		String sqlExceptSelect = "FROM inma_product_praise pp "
								+ "LEFT JOIN sys_user u ON u.id = pp.create_by "
								+ "WHERE pp.del_flag = 0 AND pp.product_id = "+proId;
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	/**
	 *评价分页通过评价的类别 
	 */
	public Page<Record> findPraiseByPraNum(int pageNumber,int pageSize,long proId,String praNum){
		String select = "SELECT u.login_name, pp.* ";
		String sqlExceptSelect = "FROM inma_product_praise pp "
								+ "LEFT JOIN sys_user u ON u.id = pp.create_by "
								+ "WHERE pp.del_flag = 0 AND pp.product_id = ?";
		if(praNum!=null && !praNum.equals("") && !praNum.equals("undefined")){
			sqlExceptSelect += " AND pp.pra_num="+praNum;
		}
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect,proId);
	}
	/**
	 *根据id获取详细信息 
	 */
	public List<Record> findPraiseDetail(long proId){
		String sql = "";
		return Db.find(sql);
	}
	/**
	 *根据评价获取列表      好评:5     中评:3  	差评 :1
	 */
	public List<ProductPraise> getPraiseCount(long proId){
		String sql = "SELECT count(*) pra_count, pp.pra_num from inma_product_praise pp where pp.del_flag=0 and pp.product_id=? GROUP BY pra_num ";
		return ProductPraise.dao.find(sql,proId);
	}
	/**
	 *获取产品评价标签 	价格蛮便宜的:1
	 *				大品牌:2
	 *				服务态度好:3
	 *				很好:4
	 */
	public List<Record> getPraiseLabel(long proId){
		String sql = "SELECT count(*)label_count, ppl.label_text "
				+ "FROM inma_product_praise pp "
				+ "LEFT JOIN inma_product_praise_label ppl ON pp.id = ppl.praise_id "
				+ "WHERE pp.product_id="+proId+" AND pp.del_flag=0 GROUP BY label_text" ;
		return Db.find(sql);
	}
}
