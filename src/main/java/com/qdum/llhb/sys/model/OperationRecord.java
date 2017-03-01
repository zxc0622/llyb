package com.qdum.llhb.sys.model;

import java.util.Date;
import com.jfinal.plugin.activerecord.Model;

/**
 * 日志表
 * @version 2014-07-21
 */
public class OperationRecord extends Model<OperationRecord> {
	private static  final long serialVersionUID = 1L;
	public static OperationRecord dao = new OperationRecord();

	public static final String ID 			= "id";				// 编号
	public static final String PLATFORM		= "platform";		// 客户操作系统信息
	public static final String BROWSER 		= "browser";		// 客户浏览器信息
	public static final String METHOD 		= "method";			// 'GET、POST、PUT、DELETE',
	public static final String ISAJAX 		= "is_ajax";		// 是不是Ajax方式请求
	public static final String MOUDLE 		= "moudle";			// 访问的模块名称
	public static final String ACTION 		= "action";			// 做的操作(执行的方法名)
	public static final String PARAMETER 	= "parameter";		// 记录的操作参数
	public static final String REFERER 		= "referer";		// 引用页的网址
	public static final String CREATE_BY 	= "create_by";		//创建人
	public static final String UPDATE_BY 	= "update_by";		//修改人
	public static final String CREATE_DATE 	= "create_date";	//创建人
	public static final String UPDATE_DATE 	= "update_date";	//修改人
	public static final String DEL_FLAG 	= "del_flag";
	
	public Long getId() {
		return getLong(ID);
	}
	
	public void setId(Long id) {
		set(ID,id);
	}

	public String getPlatform() {
		return get(PLATFORM);
	}
	
	public void setPlatform(String platform) {
		set(PLATFORM, platform);
	}

	public String getBrowser() {
		return get(BROWSER);
	}
	
	public void setBrowser(String browser) {
		set(BROWSER, browser);
	}

	public String getMethod() {
		return get(METHOD);
	}
	
	public void setMethod(String method) {
		set(METHOD, method);
	}

	public boolean getIsAjax() {
		return getBoolean(ISAJAX);
	}
	
	public void setIsAjax(Boolean isAjax) {
		set(ISAJAX, isAjax);
	}

	public String getMoudle() {
		return get(MOUDLE);
	}
	public void setMoudle(String moudle) {
		set(MOUDLE, moudle);
	}

	public String getAction() {
		return get(ACTION);
	}
	public void setAction(String action) {
		set(ACTION, action);
	}

	public String getParameter() {
		return get(PARAMETER);
	}
	public void setParameter(String parameter) {
		set(PARAMETER, parameter);
	}

	public String getReferer() {
		return get(REFERER);
	}
	public void setReferer(String referer) {
		set(REFERER, referer);
	}
	
	public  Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	public  void setCreateBy(Long createBy) {
		set(CREATE_BY,createBy);
	}
	
	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}
	public  void setCreateDate(Date createDate) {
		set(CREATE_DATE,createDate);
	}
	public  Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	
	public  void setUpdateBy(Long updateBy) {
		set(UPDATE_BY,updateBy);
	}
	
	public Date getUpdateDate(){
		return getDate(UPDATE_DATE);
	}
	
	public  void setUpdateDate(Date updateDate) {
		set(UPDATE_DATE,updateDate);
	}
	
	public void setDelFlag(int delFlag) {
		set(DEL_FLAG, delFlag);
	}
	
	public Integer getDelFlag() {
		return getInt(DEL_FLAG);
	}

	/**
	 * 对数据进行保存
	 * @param operaRecord
	 * @return
	 */
	public Boolean save(OperationRecord operaRecord) {
		if ( operaRecord.getId() == null || operaRecord.getId() == 0L) {
			operaRecord.save();
		} else {
			operaRecord.update();
		}
		
		return true;
	}
	
	/**
	 * 获取日志的操作人
	 * @return
	 */
	public User getUser() {
		return User.dao.findById(this.getCreateBy());
	}
}