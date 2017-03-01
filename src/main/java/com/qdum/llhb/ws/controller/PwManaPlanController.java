package com.qdum.llhb.ws.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.WsUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;
/**
 * 产废方 管理计划表 通知收运
 * @author zhangxm
 */
@ControllerBind(controllerKey = "/ws/productwaste/manaplan")
public class PwManaPlanController extends Controller{
	private boolean isSuccess = false;
	private String msg="";
	/**
	 * 管理计划表
	 */
	public void index(){
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return;
		}
		Record s = ServiceMain.dao.findPlanById(getParaToLong("id"));
		setAttr("s",s);
		render("manaplan.jsp");
	}
	/**
	 * 提交账号密码
	 */
	public void checkNameAndPass(){
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return;
		}
		Long id = getParaToLong("id");
		ServiceMain s = ServiceMain.dao.findById(id);
		if (s == null) {
			return;
		}
		s.setMpLoginName(getPara("loginName"));
		s.setMpPasswd(getPara("password"));
		isSuccess = s.update();
		if(isSuccess == true){
			PwOperation pw = PwOperation.dao.findByServiceId(id);
			if (pw == null) {
				return;
			}
			pw.set("mp_account", 1);
			pw.set("update_by", user.getId());
			pw.set("update_date", new Date());
			isSuccess = pw.update();
			String type = pw.getMpAttachment().toString();
			if("1".equals(type)){
				s.setEpStep(EpStepStatusEnum.ENSURE_PLAN_STEP.getValue());
				s.update();
			}
		}
		if(isSuccess == true){
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", id);
			opLog.set("type", "PW");
			opLog.set("detail_type", "mp_account");
			opLog.set("result", 1);
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			isSuccess = opLog.save();
		}
		renderJson(isSuccess);
	}
	
	/**
	 * 提交管理计划表
	 */
	public void uploadPlan(){
		Long id = getParaToLong("id");
		ServiceMain s = ServiceMain.dao.findById(id);
		if(s == null){
			return;
		}
		User user = UserUtils.getUser();
		s.set("mp_atta_name",getPara("fileName"));
		s.set("mp_atta_addr",getPara("fileUrl"));
		s.set("update_by", user.getId());
		s.set("update_date", new Date());
		isSuccess = s.update();
		if(isSuccess==true){
			PwOperation pw = PwOperation.dao.findByServiceId(id);
			pw.set("mp_attachment", 1);
			pw.set("update_by", user.getId());
			pw.set("update_date", new Date());
			isSuccess = pw.update();
			String type = pw.getMpAccount().toString();
			if("1".equals(type)){
				s.setEpStep(EpStepStatusEnum.ENSURE_PLAN_STEP.getValue());
				s.update();
			}
			String msg = ServiceMain.dao.findById(getParaToLong("id")).getCompName();
			if(null == msg||"".equals(msg)){
				msg = user.getLoginName();
			}
            WsUtils.sendMsg("用户"+msg+"已上传《管理计划表》，请登录平台查看。",s);
            /*List<Record> rs = DictPcr.dao.getCodeList();
			for (Record r:rs){
				String code = r.getStr("code");
				if(null != code&&!"".equals(code)){
					ValiCode.sendCheckCode(code,"用户"+msg+"已上传《管理计划表》，请登录平台查看。",code);
				}
			}*/

		}
		if(isSuccess){
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", getPara("id"));
			opLog.set("type", "PW");
			opLog.set("detail_type", "mp_attachment");
			opLog.set("result", 1);
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			isSuccess =opLog.save();
		}
		renderJson(isSuccess);
	}
	/**
	 * 点击确认,将环保方置成确认管理计划20
	 */
	public void nextStep(){
		User user = UserUtils.getUser();
		if(user.getId() == null){
			return;
		}
		PwOperation pw = PwOperation.dao.findByServiceId(getParaToLong("id"));
		if(!("1".equals(pw.get("mp_account").toString())) || !("1".equals(pw.get("mp_attachment").toString()))){
			msg="请先完善资料！";
		}else{
			EpOperation ep = EpOperation.dao.findByServiceId(getParaToLong("id"));
			if(("1".equals(ep.get("mp_account").toString())) && ("1".equals(ep.get("mp_attachment").toString()))){
				msg = "ok";
			}else{
				msg="请等待对方确认资料无误！";
			}
		}
		renderText(msg);
	}
	
	/**
	 * 通知收运
	 */
	public void notice(){
		Record s = ServiceMain.dao.findNoticeById(getParaToLong("id"));
		setAttr("s",s);
		render("noticeofct.jsp");
	}
	
	/**
	 * 提交收运
	 */
	public void upNotice(){
		Long id = getParaToLong("id");
		ServiceMain s = ServiceMain.dao.findById(id);
		User user = UserUtils.getUser();
		if(s == null){
			return ;
		}
		s.set("ep_step",EpStepStatusEnum.ARRANGE_COLLECTION_TRANSPORTATION_STEP.getValue());
		s.set("tp_date",getPara("time"));
		s.set("tp_person",getPara("person"));
		s.set("tp_phone",getPara("phone"));
		isSuccess = s.update();
		if(isSuccess){
			PwOperation pw = PwOperation.dao.findByServiceId(id);
			pw.set("tp_notice", 1);
			pw.set("update_by", user.getId());
			pw.set("update_date", new Date());
			isSuccess = pw.update();
		}
		if(isSuccess){
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", getPara("id"));
			opLog.set("type", "PW");
			opLog.set("detail_type", "tp_notice");
			opLog.set("result", 1);
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			isSuccess = opLog.save();
		}
		if(isSuccess){
            ServiceMain main = ServiceMain.dao.findById(getParaToLong("id"));
			String m = main.getCompName();
			if(null == m||"".equals(m)){
				m = user.getLoginName();
			}
            WsUtils.sendMsg("用户"+m+"已通知您安排时间收运危废，请登录平台查看。",main);
			msg="提交成功，等待对方安排收运！";
		}else{
			msg="提交失败，请重新提交！";
		}
		renderText(msg);
	}
	
	/**
	 * 提交评价
	 */
	public void appraise(){
		Long id = getParaToLong("id");
		User user = UserUtils.getUser();
		String enotice = EpOperation.dao.findByServiceId(id).get("tp_notice").toString();
		if("1".equals(enotice)){
			isSuccess = ServiceMain.dao.findById(id).set("appraise",getPara("appraise")).set("pw_step",PwStepStatusEnum.END.getValue()).update();
			if(isSuccess){
				OperationLogs opLog = new OperationLogs(); 
				opLog.set("service_id", id);
				opLog.set("type", "PW");
				opLog.set("detail_type", "appraise");
				opLog.set("result", getPara("appraise"));
				opLog.set("create_by", user.getId());
				opLog.set("create_date", new Date());
				opLog.set("del_flag", 0);
				isSuccess = opLog.save();
			}
			if(isSuccess){
				msg="评价成功！";
			}else{
				msg="评价失败！";
			}
		}else{
			msg="等待对方确定收运日期";
		}
		renderText(msg);
	}
	
}
