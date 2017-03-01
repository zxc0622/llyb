package com.qdum.llhb.ws.model;

import java.util.Date;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.NumberUtil;

/**
 * 危废服务操作日志表
 * 
 * @author rongchao
 *
 */
public class OperationLogs extends Model<OperationLogs> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5388410621484752490L;

	public static final OperationLogs dao = new OperationLogs();

	/**
	 * 环保企业
	 */
	private final String epType = "EP";

	/**
	 * 产废企业
	 */
	private final String pwType = "PW";

	public static final String ID = "id";// 主键
	public static final String SERVICE_ID = "service_id";// 环保服务ID，引自service表
	public static final String TYPE = "type";// 类型，EP-环保企业，PW-产废企业
	public static final String DETAIL_TYPE = "detail_type";// 操作字段，即为ws_pw_operation表与ws_ep_operation表中，当前要修改的字段
	public static final String RESULT = "result";// 操作结果，要保存到对应字段中的值。
	public static final String CREATE_BY = "create_by";// 操作人
	public static final String CREATE_DATE = "create_date";// 操作时间
	public static final String REMARKS = "remarks";// 备注
	public static final String DEL_FLAG = "del_flag";// 删除标识，默认为0，删除为1

	public Long getId() {
		return getLong(ID);
	}

	public Long getServiceId() {
		return getLong(SERVICE_ID);
	}

	public String getType() {
		return get(TYPE);
	}

	public String getDetailType() {
		return get(DETAIL_TYPE);
	}

	public Integer getResult() {
		return getInt(RESULT);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}

	public String getRemarks() {
		return get(REMARKS);
	}

	public Integer getDelFlag() {
		return NumberUtil.toInteger(get(DEL_FLAG));
	}

	public void setId(Long id) {
		set(ID, id);
	}

	public void setServiceId(Long serviceId) {
		set(SERVICE_ID, serviceId);
	}

	public void setType(String type) {
		set(TYPE, type);
	}

	public void setDetailType(String detailType) {
		set(DETAIL_TYPE, detailType);
	}

	public void setResult(Integer result) {
		set(RESULT, result);
	}

	public void setCreateBy(Long createBy) {
		set(CREATE_BY, createBy);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}

	public void setDelFlag(String delFlag) {
		set(DEL_FLAG, delFlag);
	}

	/**
	 * 产废方——添加产废方同意报价日志
	 * 
	 * @author rongchao
	 *
	 * @param id
	 *            service_id
	 * @param result
	 *            操作结果
	 * @return
	 */
	public Boolean updatePWServiceOfferAgree(Long id, Integer result) {
		return insertServiceOpLogs(id, PwOperation.OFFER_AGREE, pwType, result);
	}

	/**
	 * 环保方——添加上传报价日志
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 *            service_id
	 * @param result
	 *            操作结果
	 * @return
	 */
	public Boolean updateEPServiceOfferUpload(Long serviceID, Integer result) {
		return insertServiceOpLogs(serviceID, EpOperation.OFFER_UPLOAD, epType, result);
	}

	/**
	 * 环保方——添加同意报价日志
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 *            service_id
	 * @param result
	 *            操作结果
	 * @return
	 */
	public Boolean updateEPServiceofferAgree(Long serviceID, Integer result) {
		return insertServiceOpLogs(serviceID, EpOperation.OP_OFFER_AGREE, epType, result);
	}

	/**
	 * 添加操作日志
	 * 
	 * @author rongchao
	 *
	 * @param id
	 *            service_id
	 * @param fields
	 *            操作字段
	 * @param type
	 *            操作类型
	 * @param result
	 *            操作结果
	 * @return
	 */
	private Boolean insertServiceOpLogs(Long id, String fields, String type, Integer result) {
		OperationLogs operationLog = dao;
		operationLog.clear();
		operationLog.setServiceId(id);
		operationLog.setDetailType(fields);
		operationLog.setType(type);
		operationLog.setResult(result);
		FillFieldsUtils.fillCommonInfo(operationLog);
		return operationLog.save();
	}

}
