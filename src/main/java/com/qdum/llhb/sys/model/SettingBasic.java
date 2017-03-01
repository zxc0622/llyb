package com.qdum.llhb.sys.model;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.NumberUtil;
/**
 * cs_settings_basic
 * @author wf
 *
 */
public class SettingBasic extends Model<SettingBasic> {
	private static final long serialVersionUID = 1L;
	public static final SettingBasic dao = new SettingBasic();
	
	public static final String ID 			= "id";
	public static final String USER_ID 			= "user_id";			//用户Id
	public static final String DEL_FLAG 		= "del_flag";			//删除标志
	public static final String CREATE_BY 	= "create_by";		//创建人
	public static final String UPDATE_BY 	= "update_by";		//修改人
	public static final String CREATE_DATE 	= "create_date";	//创建人
	public static final String UPDATE_DATE 	= "update_date";	//修改人
	
	public void setId(Long id) {
		set(ID, id);
	}
	
	public Long getId() {
		return getLong(ID);
	}
	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}

	public Integer getDelFlag() {
		return getInt(DEL_FLAG);
	}
	
	
	
	
	
	
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		return (Date)get(CREATE_DATE);
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
	
	public Date getUpdateDate(){
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate ){
		set(UPDATE_DATE,createDate);
	}
	/**
	 * 根据userid查信息
	 * @param userId
	 * @return
	 */
	public SettingBasic findById(long userId) {//u.facePic,
		String sql = "SELECT * FROM cs_settings_basic  WHERE del_flag='0' AND user_id=?";
		return  SettingBasic.dao.findFirst(sql,userId);
	}
	
	
}
