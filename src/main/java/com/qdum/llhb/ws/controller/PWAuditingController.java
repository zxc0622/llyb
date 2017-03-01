package com.qdum.llhb.ws.controller;

import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;
/***
 * 
 * @author zhaoyl
 * @time:2015年11月24日17:14:28
 * 
 * */
@ControllerBind(controllerKey="/ws/productwaste/auditing")
public class PWAuditingController extends Controller {
	private static final int APPROVE_FILE_STATUS=3;//设置审批办理状态为产废方已收到材料
	public void index(){
		String id = getPara("id");
		String sql = "select * from ws_pw_operation where del_flag=0 and service_id="+id;
		PwOperation po = PwOperation.dao.findFirst(sql);
		setAttr("id",id);
		setAttr("serviceId",po.get("service_id"));
		setAttr("approveFile",po.get("approve_file"));
		render("auditing.jsp");
	}
	public void receiveFile(){
		String serviceId = getPara("serviceId");
		//写入产废表审批状态
		String sql = "select *from ws_pw_operation where service_id="+serviceId;
		PwOperation.dao.findFirst(sql).set("approve_file", APPROVE_FILE_STATUS).update();
		/**添加操作日志*/
		OperationLogs operationLogs = new OperationLogs();
		operationLogs.set("type", "PW");
		operationLogs.set("service_id", serviceId);
		operationLogs.set("detail_type","approve_file");
		operationLogs.set("result", APPROVE_FILE_STATUS);
		operationLogs.set("create_by", UserUtils.getUser().getId());
		operationLogs.set("create_date", new Date());
		operationLogs.save();
		ServiceMain ser = ServiceMain.dao.findById(serviceId);
		String auditePwStepStatus = PwStepStatusEnum.AUDITING_STEP.getValue();
		if(auditePwStepStatus.equals(ser.getStr("pw_step"))){
			//写入service表产废步骤（pw_step）状态
			ser.set("pw_step", PwStepStatusEnum.NOTICE_COLLECTION_TRANSPORTATION_STEP.getValue()).update();
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
}
