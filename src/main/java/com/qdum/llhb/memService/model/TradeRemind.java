package com.qdum.llhb.memService.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

public class TradeRemind extends Model<TradeRemind> {
	public static final TradeRemind dao = new TradeRemind();
	
	public static final String ID = "id";
	public static final String TYPE = "type";
	public static final String KEY_WORDS = "key_words";
	public static final String BSN_TYPE_FIRST = "bsn_type_first";
	public static final String BSN_TYPE_SECOND = "bsn_type_second";
	public static final String LOC_PROV_ID = "loc_prov_id";
	public static final String LOC_CITY_ID = "loc_city_id";
	public static final String FREQUENCY = "frequency";
	public static final String STA  		= "sta";			//审核状态
	public static final String CREATE_BY 	= "create_by";		//创建人
	public static final String CREATE_DATE 	= "create_date";	//创建时间
	public static final String UPDATE_BY 	= "update_by";		//修改人
	public static final String UPDATE_DATE 	= "update_date";	//修改时间
	public static final String REMARKS		="remarks";
	public static final String DEL_FLAG 	= "del_flag";
	
	public void setId(long id){
		set(ID,id);
	}
	public long getId(){
		return getLong(ID);
	}
	
	public void setType(String type){
		set(TYPE,type);
	}
	public String getType(){
		return get(TYPE);
	}
	
	public void setKeyWords(String keyWords){
		set(KEY_WORDS,keyWords);
	}
	public String getKeyWords(){
		return get(KEY_WORDS);
	}
	
	public void setTypeFirst(long typeFirst){
		set(BSN_TYPE_FIRST,typeFirst);
	}
	public long getTypeFirst(){
		return getLong(BSN_TYPE_FIRST);
	}
	
	public void setTypeSecond(long typeSecond){
		set(BSN_TYPE_SECOND,typeSecond);
	}
	public long getTypeSecond(){
		return getLong(BSN_TYPE_SECOND);
	}
	
	public void setProvId(long provId){
		set(LOC_PROV_ID,provId);
	}
	public long getProvId(){
		return getLong(LOC_PROV_ID);
	}
	
	public void setCityId(long cityId){
		set(LOC_CITY_ID,cityId);
	}
	public long getCityId(){
		return getLong(LOC_CITY_ID);
	}
	
	public void setFrequency(String frequency){
		set(FREQUENCY,frequency);
	}
	public String getFrequency(){
		return get(FREQUENCY);
	}
	
	public void setSta(int sta){
		set(STA,sta);
	}
	
	public int getSta(){
		return getInt(STA);
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
	
	public List<TradeRemind> findCount(long createBy){
		String sql = "SELECT *from ms_trade_remind WHERE del_flag=0 AND create_by="+createBy;
		return TradeRemind.dao.find(sql);
	}
	public List<Record> getAll(int sta,long createBy){
		String sql = "SELECT p.name first_name, q.name second_name, a.name prov_name, b.name city_name, d.label freq_name, r.* "
				+ "from ms_trade_remind r "
				+ "LEFT JOIN sys_area a ON r.loc_prov_id = a.id "
				+ "LEFT JOIN sys_area b ON r.loc_city_id = b.id "
				+ "LEFT JOIN sys_dict_pcr p ON r.bsn_type_first = p.id "
				+ "LEFT JOIN sys_dict_pcr q ON r.bsn_type_second = q.id "
				+ "LEFT JOIN sys_dict d ON r.frequency = d.value AND d.type='frequency_type' "
				+ "WHERE r.del_flag = 0 AND r.sta="+sta+" and r.create_by ="+createBy;
		return Db.find(sql);
	}
}
