package com.qdum.llhb.ws.controller;

import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.Constants;
import com.qdum.llhb.ws.WsUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.NodeStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.model.WsDocument;
import com.qdum.llhb.ws.model.WsServiceCount;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 环保方——审核资料并报价
 * 
 * @author rongchao
 *
 */
@ControllerBind(controllerKey = "/ws/environment/audit")
public class EPAuditAndOfferController extends CommonController {

	private static final Logger LOGGER = Logger.getLogger(EPAuditAndOfferController.class);

	/**
	 * 危废服务主表Dao
	 */
	private ServiceMain serviceMainDao = ServiceMain.dao;

	/**
	 * 危废服务废物明细Dao
	 */
	private ServiceDetails serviceDetailsDao = ServiceDetails.dao;

	private boolean isSuccess = false;

	private String msg = "操作失败！";

	public void index() {
		Long id = this.getParaToLong("id");
		if (id == null || id == 0L) {
			renderError(500);
			return;
		}
		ServiceMain serviceMain = serviceMainDao.getAuditingServiceMain(id);
		if (serviceMain == null) {
			LOGGER.error("无效id，根据此id无法查询到相应的危废服务!");
			renderError(500);
			return;
		}
		List<ServiceDetails> serviceDetails = serviceDetailsDao.getServiceDetails(id);
		List<Long> auditingIds = serviceMainDao.getAuditingServiceIDs();
		setAttr("auditingIds", auditingIds);
		setAttr("serviceMainInfo", serviceMain);
		setAttr("serviceDetailsInfos", serviceDetails);
		
		//查询是否报价
		List<Record> quoteInfo =  Db.find("SELECT * FROM ws_ep_operation WHERE service_id=? AND del_flag=0",id);
		if(quoteInfo.size() > 0){
			int upQoutFlag = quoteInfo.get(0).getInt("offer_upload");
			setAttr("upFlag",upQoutFlag);
			//查询附件信息
			List<Record> wdList = Db.find("SELECT * FROM ws_document WHERE service_id=? AND document_type=1 AND del_flag=0",id);
			setAttr("wdList",wdList);
			//查询总重总价
			List<Record> wscList = Db.find("SELECT * FROM ws_service_count WHERE service_id=? AND del_flag=0",id);
			if(wscList.size() > 0){
				setAttr("wscList",wscList.get(0));
			}
		}else{
			setAttr("upFlag",0);//0表示未上传报价
		}
		
		render("auditAndoffer.jsp");
	}

	/**
	 * 审核通过
	 */
	public void approve() {
		try {
			Long id = getParaToLong("id");
			isSuccess = serviceMainDao.updateServiceToEPStatus(id, NodeStepStatusEnum.AUDITED_STATUS);
			if (isSuccess) {
				msg = "操作成功！";
			}
		} catch (Exception e) {
			msg = "操作失败";
			LOGGER.error("执行审核通过方法失败，原因：".concat(e.getMessage()), e);
		}
		AjaxBean aj = new AjaxBean();
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}

	/**
	 * 审核不通过
	 */
	public void unApprove() {
		try {
			Long id = getParaToLong("id");
			isSuccess = serviceMainDao.updateServiceToEPStatus(id, NodeStepStatusEnum.SAVE_STATUS);
			if (isSuccess) {
				msg = "操作成功！";
			}
		} catch (Exception e) {
			msg = "操作失败";
			LOGGER.error("执行审核通过方法失败，原因：".concat(e.getMessage()), e);
		}
		AjaxBean aj = new AjaxBean();
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}

	/**
	 * 上传报价
	 */
	@Before(Tx.class)
	public void uploadOffer() {
		Long id = getParaToLong("id");
		if (id == null || id == 0L) {
			return;
		}
		isSuccess = EpOperation.dao.uploadOffer(id, 1);
		if (isSuccess) {
			msg = "操作成功！";
		} else {
			msg = "操作失败！";
		}
		AjaxBean aj = new AjaxBean();
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}
	
	/**
	 * @author wyp-20161125
	 * 上传报价
	 */
	public void sendOffer(){
		String serviceId = getPara("serviceId");
		String url = getPara("url");
		String name = getPara("name");
		String quoteInfo = getPara("quoteInfo");
		String otherQuote = getPara("otherQuote");
		String userRemarks = getPara("userRemarks");
		long userId = UserUtils.getUser().getId();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		
		//保存每条废物的报价信息
		BigDecimal weightCount = new BigDecimal(0);//总重量
		BigDecimal costCount = new BigDecimal(0);//总报价
		JSONArray ja = JSONArray.fromObject(quoteInfo);
		int len = ja.toArray().length;
		for(int i=0;i<len;i++){
			JSONObject jo = (JSONObject) ja.get(i);
			String id = (String)jo.get("id");
			String quote = (String)jo.get("quote");
			ServiceDetails sd = ServiceDetails.dao.findById(id);
			if(sd != null){
				sd.set("quote", quote);
				weightCount = weightCount.add(sd.getBigDecimal("weight"));
				costCount = costCount.add(new BigDecimal(quote));
			}
			sd.update();
		}
		
		//保存附件信息
		if(url != null && url != ""){
			
			WsDocument wd = WsDocument.dao.findFirst("SELECT * FROM ws_document WHERE service_id=? AND document_type=1 AND del_flag=0 ORDER BY create_date DESC",serviceId);
			if(wd != null){
				wd.set("document_name", name);
				wd.set("document_url", url);
				wd.set("update_by", userId);
				wd.set("update_date", date);
				wd.update();
			}else{
				wd = new WsDocument();
				wd.set("service_id", serviceId);
				wd.set("document_name", name);
				wd.set("document_type", 1);
				wd.set("document_url", url);
				wd.set("create_by", userId);
				wd.set("create_date", date);
				wd.save();
			}
			
		}
		
		//保存危废服务废物总重总价
		WsServiceCount wsc = WsServiceCount.dao.findFirst("SELECT * FROM ws_service_count WHERE service_id=? AND del_flag=0",serviceId);
//		if(otherQuote!=null){
//			costCount = costCount.add(new BigDecimal(StringUtils.isNotBlank(otherQuote)?otherQuote:"0"));
//		}
		BigDecimal bd=new BigDecimal(StringUtils.isNotBlank(otherQuote)?otherQuote:"0");
		costCount = costCount.add(bd);
		if(wsc != null){
			wsc.set("service_id", serviceId);
			wsc.set("other_cost", bd);
			wsc.set("count_Weight", weightCount);
			wsc.set("count_Quote", costCount);
			wsc.set("user_remarks", userRemarks);
			wsc.set("update_by", userId);
			wsc.set("update_date", date);
			wsc.update();
		}else{
			wsc = new WsServiceCount();
			wsc.set("service_id", serviceId);
			wsc.set("other_cost", bd);
			wsc.set("count_Weight", weightCount);
			wsc.set("count_Quote", costCount);
			wsc.set("user_remarks", userRemarks);
			wsc.set("create_by", userId);
			wsc.set("create_date", date);
			wsc.save();
		}
		
		String eodate = sdf.format(new Date());
		//如果是重新报价，就要修改这个状态
		PwOperation po = PwOperation.dao.findByServiceIdString(serviceId);
		if(po != null){
			po.set("offer_agree", -1);
			po.set("update_by", userId);
			po.set("update_date", eodate);
			po.update();
		}
		
		//危废服务环保企业操作状态记录
		EpOperation eo = EpOperation.dao.findByServiceIdString(serviceId);
		boolean eob = false;
		if(eo == null){
			eo = new EpOperation();
			eo.set("service_id", serviceId);
			eo.set("offer_upload", 1);
			eo.set("create_by", userId);
			eo.set("create_date", eodate);
			eob = eo.save();
		}else{
			eo.set("service_id", serviceId);
			eo.set("offer_upload", 1);
			eo.set("update_by", userId);
			eo.set("update_date", eodate);
			eob = eo.update();
		}
		if(eob){
			//发短信
			ServiceMain sm = ServiceMain.dao.findById(serviceId);
			Record prec = Db.findFirst("SELECT phone FROM sys_person WHERE user_id=? AND del_flag=0",sm.getCreateBy());
			String msgPhone = sm.getPhone();
			if(prec != null){
				msgPhone = prec.getStr("phone");
			}
			ValiCode.sendCheckCode(msgPhone, "危废处置公司已提交报价，请登录平台查看",sm.getEmail());
			renderText("ok");
		}else{
			renderText("fail");
		}
		
	}
	
	public void sendMsg(String compName, String type, ServiceMain main) {
        if (StrKit.isBlank(compName)) {
            compName = UserUtils.getUser().getLoginName();
        }
        String msg = null;
        if ("order".equals(type)) {
            msg = MessageFormat.format(Constants.ORDER_SMS_TEMP, compName);
        } else {
            msg = MessageFormat.format(Constants.OFFER_SMS_TEMP, compName);
        }
        WsUtils.sendMsg(msg,main);
        /*List<DictPcr> list = DictPcr.dao.findByType("ep_phone");
        for (DictPcr dictPcr : list) {
            if (StrKit.notBlank(dictPcr.getCode())) {
                ValiCode.sendCheckCode(dictPcr.getCode(), msg,null);
            }
        }*/
    }

	// 跳转到上传报价页面
	public void spikToOfferPage() {
		Long id = getParaToLong("id");
		Long userID = getParaToLong("userID");
		if (id == null || id == 0L) {
			LOGGER.error("参数<id>无效,请检查是否传递了<id>参数");
			renderError(500);
			return;
		} else if (userID == null || userID == 0L) {
			LOGGER.error("参数<userID>无效,请检查是否传递了<userID>参数");
			renderError(500);
			return;
		}
		String sourceUrl = "/ws/environment/audit?id=".concat(id.toString());
		LOGGER.debug("sourceUrl:".concat(sourceUrl));
		setSessionAttr("sourceUrl", sourceUrl);
		String url = "/memSerevice/message?serviceId=".concat(id.toString()).concat("&uid=").concat(userID.toString())
				.concat("&source=offer");
		redirect(url);
	}

	/**
	 * 环保方——同意报价
	 */
	@Before(Tx.class)
	public void agreeOffer() {
		Long id = getParaToLong("id");
		if (id == null || id == 0L) {
			return;
		}
		isSuccess = EpOperation.dao.agreeOffer(id);
		if (isSuccess) {
			ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(id);
			serviceMain.setPwStep(PwStepStatusEnum.CONTRACT_STEP.getValue());
			serviceMain.setEpStep(EpStepStatusEnum.CONTRACT_STEP.getValue());
			FillFieldsUtils.updateCommonInfo(serviceMain);
			isSuccess = serviceMain.update();
		}
		if (isSuccess) {
			msg = "操作成功！";
		} else {
			msg = "操作失败！";
		}
		AjaxBean aj = new AjaxBean();
		aj.setIsSuccess(isSuccess);
		aj.setMsg(msg);
		renderJson(aj);
	}
}
