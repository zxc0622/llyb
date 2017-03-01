package com.qdum.llhb.ws.model;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.FillFieldsUtils;

/**
 * 危废服务环保企业操作状态表
 * 
 * @author rongchao
 */
public class EpOperation extends Model<EpOperation> {

	private static final long serialVersionUID = -2910411592314107069L;

	public static final EpOperation dao = new EpOperation();

	private static final Logger LOGGER = Logger.getLogger(EpOperation.class);

	public static final String ID = "id";// 主键
	public static final String SERVICE_ID = "service_id";// 服务ID
	public static final String OFFER_UPLOAD = "offer_upload";// 节点00：上传报价方案，默认为0.上传为1
	/**
	 * 节点00：同意报价，是否同意报价，默认为0，同意为1,下一步为2
	 */
	public static final String OP_OFFER_AGREE = "op_offer_agree";
	public static final String UPLOAD_CONTRACT = "upload_contract";// 节点10：上传合同，是否已经上传了合同，默认为0，上传为1，下一步为2
	public static final String MP_ACCOUNT = "mp_account";// 节点20：管理计划，确认账号密码，默认为0，确认为1，校验失败为-1，下一步为2
	public static final String MP_ATTACHMENT = "mp_attachment";// 节点20：管理计划，确认计划表，默认为0，确认为1，资料不完善为-1,下一步为2，
	public static final String APPROVE_FILE = "approve_file";// 节点50：审批材料，默认为0，1-甲方已邮寄材料，2-甲方所有材料已确认无误，可进行办理，3-我已收到材料，4-材料等待审批，5-已完成办理并邮寄
	public static final String TP_NOTICE = "tp_notice";// 节点60：安排收运，默认为0，1-确认收运日期
	public static final String CREATE_BY = "create_by";
	public static final String CREATE_DATE = "create_date";
	public static final String UPDATE_BY = "update_by";
	public static final String UPDATE_DATE = "update_date";
	public static final String REMARKS = "remarks";// 备注
	public static final String DEL_FLAG = "del_flag";// 删除标签，默认为0，删除为1

	/**
	 * 获取是否上传报价
	 * 
	 * @author rongchao
	 *
	 * @return
	 */
	public Integer getOfferUpload() {
		return get(OFFER_UPLOAD);
	}

	/**
	 * 根据service的id查询信息 zhangxm
	 */
	public EpOperation findByServiceId(Long id) {
		String sql = "SELECT ep.* FROM ws_ep_operation  ep INNER JOIN ws_service se on se.id=ep.service_id and se.del_flag='0' and se.id='"
				+ id + "'";
		return this.findFirst(sql);
	}
	public EpOperation findByServiceIdString(String  id) {
		String sql = "SELECT ep.* FROM ws_ep_operation  ep INNER JOIN ws_service se on se.id=ep.service_id and se.del_flag='0' and se.id='"
				+ id + "'";
		return this.findFirst(sql);
	}

	/**
	 * 环保方——上传报价方案
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 * @return
	 */
	public Boolean uploadOffer(Long serviceID, Integer offerStatus) {
		boolean isSuccess = updateEpOpByServiceID(serviceID, OFFER_UPLOAD, offerStatus, null);
		if (isSuccess) {
			return OperationLogs.dao.updateEPServiceOfferUpload(serviceID, 1);
		}
		return false;
	}

	/**
	 * 环保方——同意报价
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 * @return
	 */
	public Boolean agreeOffer(Long serviceID) {
		boolean isSuccess = updateEpOpByServiceID(serviceID, OP_OFFER_AGREE, 1, null);
		if (isSuccess) {
			return OperationLogs.dao.updateEPServiceofferAgree(serviceID, 1);
		}
		return false;
	}

	/**
	 * 更新危废服务环保企业操作状态表
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 *            危废服务ID
	 * @param column
	 *            需要更新的列名称
	 * @param val
	 *            需要更新的列的值
	 * @param remark
	 *            备注
	 * @return
	 */
	public Boolean updateEpOpByServiceID(Long serviceID, String column, Integer val, String remark) {
		List<EpOperation> list = this.getEpOpByServiceID(serviceID);
		if (list.size() > 1) {
			LOGGER.error("查出危废服务主键为'".concat(serviceID.toString()).concat("'的环保企业操作条数超过1条，这是不正常的"));
			return false;
		} else if (list.size() == 1) {
			EpOperation epOp = list.get(0);
			epOp.set(column, val);
			FillFieldsUtils.updateCommonInfo(epOp);
			if (StrKit.notBlank(remark)) {
				epOp.set("remark", remark);
			}
			return epOp.update();
		} else if (list == null || list.size() == 0) {
			EpOperation epOperation = new EpOperation();
			epOperation.set(column, val);
			epOperation.set("service_id", serviceID);
			FillFieldsUtils.fillCommonInfo(epOperation);
			if (StrKit.notBlank(remark)) {
				epOperation.set("remark", remark);
			}
			return epOperation.save();
		}
		return false;
	}

	/**
	 * 根据serviceID获取危废服务环保企业操作
	 * 
	 * @author rongchao
	 *
	 * @param serviceID
	 * @return
	 */
	public List<EpOperation> getEpOpByServiceID(Long serviceID) {
		String sql = "select * from ws_ep_operation where del_flag = ? and service_id = ?";
		List<EpOperation> list = this.find(sql, BaseConstants.NOT_DELETE, serviceID);
		return list;
	}

	public EpOperation getEpOpByServiceIDre(Long serviceID) {
		String sql = "select * from ws_ep_operation where del_flag = ? and service_id = ?";
		return this.findFirst(sql, BaseConstants.NOT_DELETE, serviceID);
	}
}
