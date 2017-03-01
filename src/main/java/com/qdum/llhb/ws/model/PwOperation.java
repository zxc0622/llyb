package com.qdum.llhb.ws.model;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.ws.enumvalue.OfferAgreeEnum;

/**
 * 危废服务产废企业操作状态表
 * 
 * 
 * @author rongchao
 *
 */
public class PwOperation extends Model<PwOperation> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6558541332365994486L;

	public static final PwOperation dao = new PwOperation();

	private static final Logger LOGGER = Logger.getLogger(PwOperation.class);

	public static final String ID = "id";// 主键
	public static final String SERVICE_ID = "service_id"; // serviceId,引自ws_pw_service表主键
	public static final String OFFER_AGREE = "offer_agree";// 节点00：同意报价，默认为0，同意为1
	public static final String VIEW_CONTRACT = "view_contract"; // 节点10：查阅合同，默认为0，查阅为1
	public static final String MP_ACCOUNT = "mp_account";// 节点20：管理计划，账号密码，默认为0，填写之后，将状态置为1
	public static final String MP_ATTACHMENT = "mp_attachment";// 节点20：管理计划，计划表，默认为0，上传为1
	public static final String POST_MATERIALS = "post_materials";// 节点30：邮寄资料，默认为0，1-资料已邮寄，2-对方已收到
	public static final String PAY_STA = "pay_sta";// 节点40：支付备案，支付状态，默认为0，支付为1
	public static final String PRINT_STA = "print_sta";// 节点40：支付备案，打印状态，默认为0，打印为1
	public static final String FILE_STA = "file_sta";// 节点40：支付备案，备案状态，默认为0，备案为1
	public static final String SCAN_STA = "scan_sta";// 节点40：支付备案，扫描发送状态，默认为0，发送为1
	public static final String APPROVE_FILE = "approve_file";// 节点50：审批办理，默认为0，1-材料审批中，2-对方已邮寄，3-材料已收到
	public static final String TP_NOTICE = "tp_notice";// 节点60：通知收运，默认为0，1-已通知
	public static final String CREATE_BY = "create_by";
	public static final String CREATE_DATE = "create_date";
	public static final String UPDATE_BY = "update_by";
	public static final String UPDATE_DATE = "update_date";
	public static final String REMARKS = "remarks";// 备注
	public static final String DEL_FLAG = "del_flag"; // 删除标识，默认为0，删除为1

	public Long getId() {
		return getLong(ID);
	}

	public Long getServiceId() {
		return getLong(SERVICE_ID);
	}

	public Integer getOfferAgree() {
		return getInt(OFFER_AGREE);
	}

	public Integer getViewContract() {
		return getInt(VIEW_CONTRACT);
	}

	public Integer getMpAccount() {
		return getInt(MP_ACCOUNT);
	}

	public Integer getMpAttachment() {
		return getInt(MP_ATTACHMENT);
	}

	public Integer getPostMaterials() {
		return getInt(POST_MATERIALS);
	}

	public Integer getPaySta() {
		return getInt(PAY_STA);
	}

	public Integer getPrintSta() {
		return getInt(PRINT_STA);
	}

	public Integer getFileSta() {
		return getInt(FILE_STA);
	}

	public Integer getScanSta() {
		return getInt(SCAN_STA);
	}

	public Integer getApproveFile() {
		return getInt(APPROVE_FILE);
	}

	public Integer getTpNotice() {
		return getInt(TP_NOTICE);
	}

	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}

	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}

	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}

	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}

	public String getRemarks() {
		return getStr(REMARKS);
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

	public void setOfferAgree(Integer offerAgree) {
		set(OFFER_AGREE, offerAgree);
	}

	public void setViewContract(Integer viewContract) {
		set(VIEW_CONTRACT, viewContract);
	}

	public void setMpAccount(Integer mpAccount) {
		set(MP_ACCOUNT, mpAccount);
	}

	public void setMpAttachment(Integer mpAttachment) {
		set(MP_ATTACHMENT, mpAttachment);
	}

	public void setPostMaterials(Integer postMaterials) {
		set(POST_MATERIALS, postMaterials);
	}

	public void setPaySta(Integer paySta) {
		set(PAY_STA, paySta);
	}

	public void setPrintSta(Integer printSta) {
		set(PRINT_STA, printSta);
	}

	public void setFileSta(Integer fileSta) {
		set(FILE_STA, fileSta);
	}

	public void setScanSta(Integer scanSta) {
		set(SCAN_STA, scanSta);
	}

	public void setApproveFile(Integer approveFile) {
		set(APPROVE_FILE, approveFile);
	}

	public void setTpNotice(Integer tpNotice) {
		set(TP_NOTICE, tpNotice);
	}

	public void setCreateBy(Long createBy) {
		set(CREATE_BY, createBy);
	}

	public void setCreateDate(Date createDate) {
		set(CREATE_DATE, createDate);
	}

	public void setUpdateBy(Long updateBy) {
		set(UPDATE_BY, updateBy);
	}

	public void setUpdateDate(Date updateDate) {
		set(UPDATE_DATE, updateDate);
	}

	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}

	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}

	/**
	 * 邮寄 根据service的id查询信息
	 */
	public Record getRecordByServiceId(String id) {
		String sql = "SELECT pw.* FROM ws_pw_operation  pw LEFT JOIN ws_service se on se.id=pw.service_id and se.del_flag='0' and se.id='"
				+ id + "'";
		return Db.findFirst(sql);
	}

	/**
	 * 产废方——是否同意报价
	 * 
	 * @author rongchao
	 *
	 * @param id
	 *            危废服务ID
	 * @param isAgree
	 *            是否同意
	 * @return
	 */
	public Boolean updateOfferAgree(Long id, OfferAgreeEnum isAgree) {
		PwOperation pwOperation = dao;
		List<PwOperation> list = getPwOpByServiceID(id);
		if (list.size() > 1) {
			LOGGER.error("通过serviceID为<".concat(id.toString()).concat(">的危废服务日志超过1条，这是不正确的!"));
			return false;
		} else if (list == null || list.size() == 0) {
			pwOperation.clear();
			pwOperation.setServiceId(id);
			pwOperation.setOfferAgree(isAgree.getValue());
			FillFieldsUtils.fillCommonInfo(pwOperation);
			return pwOperation.save();
		} else {
			PwOperation oldPWOperation = list.get(0);
			FillFieldsUtils.updateCommonInfo(oldPWOperation);
			oldPWOperation.setOfferAgree(isAgree.getValue());
			return oldPWOperation.update();
		}
	}

	/**
	 * @author rongchao
	 *
	 * @param id
	 * @return
	 */
	public List<PwOperation> getPwOpByServiceID(Long id) {
		String sql = "select * from ws_pw_operation where service_id = ? and del_flag = ?";
		return this.find(sql, id, BaseConstants.NOT_DELETE);
	}
	public PwOperation getPwOpByServiceIDre(Long id) {
		String sql = "select * from ws_pw_operation where service_id = ? and del_flag = ?";
		return this.findFirst(sql, id, BaseConstants.NOT_DELETE);
	}

	/**
	 * 根据service的id查询信息 zhangxm
	 */
	public PwOperation findByServiceId(long id) {
		String sql = "SELECT pw.* FROM ws_pw_operation  pw INNER JOIN ws_service se on se.id=pw.service_id and se.del_flag='0' and se.id='"
				+ id + "'";
		return this.findFirst(sql);
	}
	public PwOperation findByServiceIdString(String id) {
		String sql = "SELECT pw.* FROM ws_pw_operation  pw INNER JOIN ws_service se on se.id=pw.service_id and se.del_flag='0' and se.id='"
				+ id + "'";
		return this.findFirst(sql);
	}
	public Record getPhone(long serviceId){
		StringBuffer sb  = new StringBuffer();
		sb.append("SELECT n.phone,us.email,ifnull(c.company_name,'优蚁环保平台') cName  FROM ws_service p LEFT JOIN sys_person n on n.user_id=p.create_by left join sys_user us on n.user_id = us.id left join sys_company c on c.user_id = p.hb_user WHERE p.del_flag=0 and p.id=?");
		return Db.findFirst(sb.toString(),serviceId);
	}
}
