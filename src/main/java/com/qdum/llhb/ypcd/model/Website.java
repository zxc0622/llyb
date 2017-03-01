package com.qdum.llhb.ypcd.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Website extends Model<Website> {
	/**
	 * 微网站实体
	 */
	private static final long serialVersionUID = 1L;
	public static final Website dao = new Website();
	
	public static final String ID 				= "id";
	public static final String SHIP_ID 			= "shop_id";		//商铺id
	public static final String NAME 			= "name";
	public static final String SHORT_DESC		= "short_desc";  		
	public static final String WE_NUM 			= "we_num";
	public static final String LOG_PIC			= "logo_pic";
	public static final String DIMENSION_CODE	= "two_dimension_code_pic";	//二维码图片
	public static final String BANNER_PIC 		= "banner_pic";
	public static final String DETAIL_DESC 		= "detail_desc";
	public static final String KEY_WORDS 		= "key_words";			
	public static final String CREATE_BY 		= "create_by";		//创建人
	public static final String CREATE_DATE 		= "create_date";	//创建时间
	public static final String UPDATE_BY 		= "update_by";		//修改人
	public static final String UPDATE_DATE 		= "update_date";	//修改时间
	public static final String REMARKS 			= "remarks";
	public static final String DEL_FLAG 		= "del_flag";
	
	public void setId(long id) {
		set(ID, id);
	}
	public long getId() {
		return getLong(ID);
	}
	
	public void setShopId(long shopId) {
		set(SHIP_ID, shopId);
	}
	public long getShopId(){
		return getLong(SHIP_ID);
	}
	
	public void setName(String name){
		set(NAME,name);
	}
	
	public String getName(){
		return get(NAME);
	}
	
	public void setShortDesc(String shortDesc) {
		set(SHORT_DESC, shortDesc);
	}
	public String getShortDesc(){
		return get(SHORT_DESC);
	}
	
	public void setWeNum(String weNum) {
		set(WE_NUM, weNum);
	}
	public String getWeNum(){
		return get(WE_NUM);
	}
	
	public void setLogoPic(String logoPic){
		set(LOG_PIC,logoPic);
	}
	public String getLogoPic(){
		return get(LOG_PIC);
	}
	
	public void setDimensionCode(String dimensionCode){
		set(DIMENSION_CODE,dimensionCode);
	}
	public String getDimensionCode(){
		return get(DIMENSION_CODE);
	}
	
	public void setBannerPic(String bannerPic){
		set(BANNER_PIC,bannerPic);
	}
	public String getBannerPic(){
		return get(BANNER_PIC);
	}
	
	public void setDetailDesc(String detailDesc){
		set(DETAIL_DESC,detailDesc);
	}
	public String getDetailDesc(){
		return get(DETAIL_DESC);
	}
	
	public void setKeyWords(String keyWords){
		set(KEY_WORDS,keyWords);
	}
	public String getKeyWords(){
		return get(KEY_WORDS);
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
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	public String getRemarks() {
		return get(REMARKS);
	}
	
	public void setDelFlag(int delFlag) {
		set(DEL_FLAG, delFlag);
	}
	public int getDelFlag() {
		return getInt(DEL_FLAG);
	}
	
	public List<Website> getWebsite(long createBy){
		String sql = "SELECT *from cs_shop_we_website WHERE del_flag=0 and create_by="+createBy;
		return Website.dao.find(sql);
	}
}
