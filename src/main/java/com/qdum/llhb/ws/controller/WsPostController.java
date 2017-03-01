package com.qdum.llhb.ws.controller;


import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;


import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.backmana.model.SupplyHotQuery;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.qiugou.model.DemandViewHistory;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.*;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.Constants;
import com.qdum.llhb.ws.WsUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;

/**
 * 产废
 * @author wf
 *
 */
@ControllerBind(controllerKey = "/ws/productwaste/payAndPost")
public class WsPostController extends Controller {
	private final static Logger logger = Logger.getLogger(WsPostController.class);
	/**
	 * 危废服务表
	 */
	private ServiceMain serviceMainDao = ServiceMain.dao;
	/**
	 * 邮寄
	 */
	public void post(){
		Record r = PwOperation.dao.getRecordByServiceId(getPara("id"));
		setAttr("pw", r);
		setAttr("id", getPara("id"));
		render("post.jsp");
	}
	/**
	 * 邮寄资料
	 */
	public void posted(){
		User user = UserUtils.getUser();
		String text = "";
		try {
			EpOperation eo = EpOperation.dao.getEpOpByServiceIDre(getParaToLong("id"));
			if(!eo.get("approve_file").equals(1)){
                ServiceMain main = serviceMainDao.findById(getParaToLong("id"));
				String msg = main.getCompName();
				if(null == msg||"".equals(msg)){
					msg = user.getLoginName();
				}
                WsUtils.sendMsg("用户"+msg+"已寄出申报资料，请注意查收。",main);
				//String codeMsg = Company.dao.getCompanyNameLoginName(user.getId()).get("name");
				/*List<Record> rs = DictPcr.dao.getCodeList();
				for (Record r:rs){
					String code = r.getStr("code");
					if(null != code&&!"".equals(code)){
						ValiCode.sendCheckCode(code,"用户"+msg+"已寄出申报资料，请注意查收。",code);
					}
				}*/
			}
			eo.set("approve_file","1").update();
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", getPara("id"));
			opLog.set("type", "EP");
			opLog.set("detail_type", "approve_file");
			opLog.set("result", "1");
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			opLog.save();
			text = "ok";

		} catch (Exception e) {
			text = "邮寄失败";
		}
		/*if(eo.get(0).get("approve_file").equals(3)){
			Record r = PwOperation.dao.getRecordByServiceId(getPara("id"));
			r.set("post_materials", 1);
			Db.update("ws_pw_operation",r);
			eo.get(0).set("approve_file","1").update();
			ServiceMain serviceMain = serviceMainDao.findById(getPara("id"));
			serviceMain.setPwStep(PwStepStatusEnum.PAY_AND_RECORD_STEP.getValue());
			//serviceMain.setEpStep(EpStepStatusEnum.AUDITING_INFO_STEP.getValue());
			serviceMain.update();
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", getPara("id"));
			opLog.set("type", "PW");
			opLog.set("detail_type", "post_materials");
			opLog.set("result", "1");
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			opLog.save();
			text = "ok";
		}else{
			text  ="请等待对方确认收到所寄材料";
		}*/
		
		renderText(text);
	}
	/**
	 * 支付并备案
	 */
	public void pay(){
		setAttr("id", getPara("id"));
		setAttr("scansta",PwOperation.dao.findByServiceIdString(getPara("id").toString()).get("scan_sta"));
		String sourceUrl = "/ws/productwaste/payAndPost/pay?id=".concat(getPara("id"));
		setSessionAttr("sourceUrl", sourceUrl);
		EpOperation e = EpOperation.dao.getEpOpByServiceIDre(getParaToLong("id"));
		setAttr("oriSta",e.get("approve_file"));
		setAttr("sendname",e.get("create_by"));
		render("pay.jsp");
	}
	
	//结束流程
	public void finish(){
		int result = Db.update("update ws_service set pw_step=?,ep_step=? where id=?",PwStepStatusEnum.END.getValue(),PwStepStatusEnum.END.getValue(),getPara("id"));
		if(result > 0){
			ServiceMain serviceMain = serviceMainDao.findServiceMainByID(getPara("id"));
			//发短信
            sendMsg(serviceMain.getCompName(), "order",serviceMain);
			renderText("ok");
		}else{
			renderText("fail");
		}
	}
	
	public void sendMsg(String compName, String type, ServiceMain main) {
        if (StrKit.isBlank(compName)) {
            compName = UserUtils.getUser().getLoginName();
        }
        String msg = MessageFormat.format("用户({0})已付款，请登录平台可查看。", compName);
        WsUtils.sendMsg(msg,main);
    }
	
	/**
	 * 支付备案的确认
	 */
	public void sure(){
		User user = UserUtils.getUser();
		String text = "";
		try {
			EpOperation e = EpOperation.dao.getEpOpByServiceIDre(getParaToLong("id"));
			if(e.get("approve_file").equals(3)){
				e.set("approve_file", "4").update();
				OperationLogs op = new OperationLogs(); 
				op.set("service_id", getPara("id"));
				op.set("type", "EP");
				op.set("detail_type", "approve_file");
				op.set("result", "1");
				op.set("create_by", user.getId());
				op.set("create_date", new Date());
				op.set("del_flag", 0);
				op.save();
				List<EpOperation> eo = EpOperation.dao.getEpOpByServiceID(getParaToLong("id"));
				Record r = PwOperation.dao.getRecordByServiceId(getPara("id"));
				Map<String, String []> maps = getParaMap();
				Set<String> keys = maps.keySet();
				for(String key:keys){
					String[] s = maps.get(key);
					r.set(key, s[0]);
				}
				Db.update("ws_pw_operation",r);
			/*	ServiceMain ser = serviceMainDao.findById(getPara("id"));
				ser.setPwStep(PwStepStatusEnum.AUDITING_STEP.getValue());
				ser.update();*/
				OperationLogs opLog = new OperationLogs(); 
				opLog.set("service_id", getPara("id"));
				opLog.set("type", "PW");
				opLog.set("detail_type", "pay_sta");
				opLog.set("result", "1");
				opLog.set("create_by", user.getId());
				opLog.set("create_date", new Date());
				opLog.set("del_flag", 0);
				opLog.save();
				text  ="ok";
			}else{
				text = "请等待对方确认资料无误,并办理申报";
			}
			
		} catch (Exception e) {
			text = "支付备案发生错误";
		}	
		renderText(text);
	}
	/**
	 * 扫描发送
	 */
	public  void scan(){
		Long id = getParaToLong("id");
		if (id == null || id == 0L) {
			return;
		}
		String sourceUrl = "/ws/productwaste/payAndPost?id=".concat(id.toString());
		setSessionAttr("sourceUrl", sourceUrl);
		redirect("/memSerevice/message?uid=");
	}
}

	

