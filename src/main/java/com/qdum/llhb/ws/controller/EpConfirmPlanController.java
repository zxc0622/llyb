package com.qdum.llhb.ws.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;

@ControllerBind(controllerKey = "/ws/environment/confirmplan")
public class EpConfirmPlanController extends Controller{
	private boolean isSuccess = false;
	private String msg="";
	/**
	 * 环保公司-确定管理计划表
	 */
	public void index(){
		Record s = ServiceMain.dao.findPlanById(getParaToLong("id"));
		setAttr("s",s);
		render("confirmplan.jsp");
	}
	
	/**
	 * 确认账号密码
	 */
	public void confirmNameAndPass(){
		Long id = getParaToLong("id");
		String result = getPara("result");
		if (id == null || id == 0L) {
			return;
		}
		User user = UserUtils.getUser();
		if(user.getId()==null){
			return;
		}
		EpOperation ep = EpOperation.dao.findByServiceId(id);
		if (ep == null) {
			return;
		}
		ep.set("mp_account", result);
		ep.set("update_by", user.getId());
		ep.set("update_date", new Date());
		isSuccess = ep.update();
		if(isSuccess == true){
			OperationLogs opLog = new OperationLogs(); 
			opLog.set("service_id", getPara("id"));
			opLog.set("type", "EP");
			opLog.set("detail_type", "mp_account");
			opLog.set("result", result);
			opLog.set("create_by", user.getId());
			opLog.set("create_date", new Date());
			opLog.set("del_flag", 0);
			isSuccess = opLog.save();
		}
		if(isSuccess){
			msg="操作成功！";
		}else{
			msg="操作失败！";
		}
		renderText(msg);
	}
	/**
	 * 下载管理计划
	 */
	public void downAtta(){
		Record s = ServiceMain.dao.findPlanById(getParaToLong("id"));
		renderJson(s);
	}
	/**
	 * 确认管理计划表
	 */
	public void confirmPlan(){
		Long id = getParaToLong("id");
		String result = getPara("result");
		User user = UserUtils.getUser();
		String maa = ServiceMain.dao.findPlanById(id).getStr("maa");
		if(maa == null || "".equals(maa)){
			msg="请等待对方上传！";
		}else{
			EpOperation ep = EpOperation.dao.findByServiceId(id);
			ep.set("mp_attachment", result);
			ep.set("update_by", user.getId());
			ep.set("update_date", new Date());
			isSuccess = ep.update();
			if(isSuccess){
				OperationLogs opLog = new OperationLogs(); 
				opLog.set("service_id", getPara("id"));
				opLog.set("type", "EP");
				opLog.set("detail_type", "mp_attachment");
				opLog.set("result", result);
				opLog.set("create_by", user.getId());
				opLog.set("create_date", new Date());
				opLog.set("del_flag", 0);
				isSuccess = opLog.save();
			}
			if(isSuccess){
				/*List<Record> rs = DictPcr.dao.getCodeList();
				for (Record r:rs){
					String code = r.getStr("code");
					if(null != code&&!"".equals(code)){
						ValiCode.sendCheckCode(code,"尊敬的用户，优蚁环保平台已确认您的管理计划表完整无误。目前已将资料上呈至环保部门审批办理，请耐心等待。");
					}
				}*/
				//ValiCode.sendCheckCode(PwOperation.dao.getPhone(id).getStr("phone"),"尊敬的用户，优蚁环保平台已确认您的管理计划表完整无误。目前已将资料上呈至环保部门审批办理，请耐心等待。");
				//邮寄资料 发送短信
				//String codeMsg = Company.dao.getCompanyNameLoginName(user.getId()).get("name");

				msg="操作成功！";
			}else{
				msg="操作失败！";
			}
		}
		
		renderText(msg);
	}
	
	/**
	 * 安排收运
	 */
	public void arrangeCt(){
		Record s = ServiceMain.dao.findNoticeById(getParaToLong("id"));
		setAttr("s",s);
		render("arrangect.jsp");
	}
	
	/**
	 * 确定收运
	 */
	public void confirmCt(){
		Long id = getParaToLong("id");
		ServiceMain s = ServiceMain.dao.findById(id);
		if(s == null){
			return;
		}
		if(s.getStr("tp_person")==null || "".equals(s.getStr("tp_person"))){
			msg="请等待对方通知收运！";
		}else{
			User user = UserUtils.getUser();
			s.set("ep_step",EpStepStatusEnum.END.getValue());
			s.set("update_by", user.getId());
			s.set("update_date", new Date());
			isSuccess = s.update();
			if(isSuccess){
				EpOperation ep = EpOperation.dao.findByServiceId(id);
				ep.set("tp_notice", 1);
				ep.set("update_by", user.getId());
				ep.set("update_date", new Date());
				isSuccess = ep.update();
			}
			if(isSuccess){
				OperationLogs opLog = new OperationLogs(); 
				opLog.set("service_id", getPara("id"));
				opLog.set("type", "EP");
				opLog.set("detail_type", "tp_notice");
				opLog.set("result", 1);
				opLog.set("create_by", user.getId());
				opLog.set("create_date", new Date());
				opLog.set("del_flag", 0);
				isSuccess = opLog.save();
			}
			if(isSuccess){
				//安排收运短信
				/*List<Record> rs = DictPcr.dao.getCodeList();
				for (Record r:rs){
					String code = r.getStr("code");
					if(null != code&&!"".equals(code)){
						ValiCode.sendCheckCode(code,"尊敬的用户，优蚁环保平台已按照您的时间表为您安排人员收运危废，工作人员会尽快与您取得联系。");
					}
				}*/
                Record r = PwOperation.dao.getPhone(id);
				ValiCode.sendCheckCode(r.getStr("phone"),"尊敬的用户，"+ r.getStr("cName") +"已为您安排人员收运危废，工作人员会与您取得联系，请注意接听电话。",r.getStr("email"));
				msg="操作成功！";
			}else{
				msg="操作失败！";
			}
		}
		renderText(msg);
	}
	/**
	 * 点击下一步,将产废方状态置为邮寄资料
	 */
	public void nextStep(){
		User user = UserUtils.getUser();
		if(user.getId() == null){
			return;
		}
		EpOperation ep = EpOperation.dao.findByServiceId(getParaToLong("id"));
		String p1 = ep.get("mp_account").toString();
		String p2 = ep.get("mp_attachment").toString();
		if(!("1".equals(p1)) || !("1".equals(p2))){
			msg="请先确认资料无误！";
		}else{
			ServiceMain s = ServiceMain.dao.findById(getParaToLong("id"));
			s.setPwStep(PwStepStatusEnum.POST_DATA_STEP.getValue());
			s.setEpStep(EpStepStatusEnum.AUDITING_INFO_STEP.getValue());
			s.update();
            Record r = PwOperation.dao.getPhone(getParaToLong("id"));
			ValiCode.sendCheckCode(r.getStr("phone"),"尊敬的用户，"+r.getStr("cName")+"已确认您的《管理计划表》，请登录平台按流程要求邮寄申报资料。",r.getStr("email"));
			msg="ok";
		}
		renderText(msg);
	}
	
	/**
	 * 作废
	 */
	public void del(){
		Long id=getParaToLong("id");
		isSuccess = PwOperation.dao.findByServiceId(id).set("del_flag", 1).update();
		if(isSuccess){
			isSuccess = EpOperation.dao.findByServiceId(id).set("del_flag", 1).update();
		}
		if(isSuccess){
			isSuccess = ServiceMain.dao.findById(id).set("del_flag", 1).update();
		}
		if(isSuccess){
			msg="操作成功！";
		}else{
			msg="操作失败！";
		}
		renderText(msg);
	}
}
