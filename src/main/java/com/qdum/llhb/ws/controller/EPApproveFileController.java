package com.qdum.llhb.ws.controller;

import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceMain;

@ControllerBind(controllerKey="/ws/environment/approvefile")
public class EPApproveFileController extends Controller {
	private static final String APPROVE_STATUS_GETFILE="2";//我方已收到材料
	private static final String APPROVE_STATUS_CONFIRM_SCAN_FILE="3";//我方确认扫描文件
	private static final String APPROVE_STATUS_AUDITING="5";//材料等待审批
	private static final String APPROVE_STATUS_POST="6";//已完成办理并邮寄
	public static final String EP_STEP 
		= EpStepStatusEnum.ARRANGE_COLLECTION_TRANSPORTATION_STEP.getValue();//环保方安排收运的状态
	public static final String PW_PAY_AND_RECORD_STEP 
		= PwStepStatusEnum.PAY_AND_RECORD_STEP.getValue();//产废方支付备案状态
	public static final String PW_AUDITING_STEP = PwStepStatusEnum.AUDITING_STEP.getValue();//产废方审批办理中
	public static final int SCAN_STA = 1;//产废方已发送扫描文件
	public void index(){
		String id = getPara("id");
		String sql = "select s.ep_step, eo."
				+ "*from ws_ep_operation eo "
				+ "LEFT JOIN ws_service s ON s.id = eo.service_id "
				+ "where eo.del_flag=0 and eo.service_id="+id;
		EpOperation eo = EpOperation.dao.findFirst(sql);
		setAttr("id",id);
		setAttr("serviceId",eo.get("service_id"));
		setAttr("approveFile",eo.get("approve_file"));
		setAttr("curStep",eo.get("ep_step"));//当前环保方状态
		setAttr("EP_STEP",EP_STEP);
		render("approveFile.jsp");
	}
	public void approve(){
		String serviceId = getPara("serviceId");
		String approveSta = getPara("approveSta");
		if(serviceId!=null && !serviceId.equals("") ){
			if(!approveSta.equals(APPROVE_STATUS_CONFIRM_SCAN_FILE)){
				String ep_sql = "select *from ws_ep_operation where del_flag=0 and service_id="+serviceId;
				EpOperation.dao.findFirst(ep_sql).set("approve_file",approveSta).update();
				ServiceMain serv = ServiceMain.dao.findById(serviceId);
				if(approveSta.equals(APPROVE_STATUS_GETFILE)){//我已收到邮寄材料
					serv.set("pw_step", PW_PAY_AND_RECORD_STEP).update();//修改产废方为支付并备案
					//平台有收到邮寄材料
//					String sql = "select p.phone,u.email from ws_service s left join sys_person p on s.create_by = p.user_id left join sys_user u on p.user_id = u.id where s.del_flag=0 and s.id="+serviceId;
//					Record re = Db.findFirst(sql);
//					String msg = "尊敬的用户，优蚁环保平台已收到您的邮寄资料，请登录到平台按提示进行后续步骤。";
                    Record r = PwOperation.dao.getPhone(Long.valueOf(serviceId));
                    String msg = "尊敬的用户，"+r.getStr("cName")+"已收到您的邮寄资料，请登录到平台按提示进行后续步骤。";
					ValiCode.sendCheckCode(r.getStr("phone"), msg,r.getStr("email"));
				}
				if(approveSta.equals(APPROVE_STATUS_AUDITING)){//材料等待审批
					String pw_sql = "select *from ws_pw_operation where del_flag=0 and service_id="+serviceId;
					final int pwApproveSta = 1;//产废方 审核状态为 审核中
					PwOperation.dao.findFirst(pw_sql).set("approve_file", pwApproveSta).update();
					/**添加操作日志*/
					OperationLogs operationLogs = new OperationLogs();
					operationLogs.set("type", "PW");
					operationLogs.set("service_id", serviceId);
					operationLogs.set("detail_type","approve_file");
					operationLogs.set("result", pwApproveSta);
					operationLogs.set("create_by", UserUtils.getUser().getId());
					operationLogs.set("create_date", new Date());
					operationLogs.save();
					serv.set("pw_step", PW_AUDITING_STEP).update();//修改产废方为审核办理中
				}
				if(approveSta.equals(APPROVE_STATUS_POST)){//已完成办理并邮寄
					String sql = "select *from ws_pw_operation where del_flag=0 and service_id="+serviceId;
					final int pwApproveSta = 2;//产废方 审核状态为 对方已邮寄
					PwOperation po = PwOperation.dao.findFirst(sql);
					if(po.getApproveFile()!=2){
						po.set("approve_file", pwApproveSta).update();
						//平台  已完成办理并邮寄
						String sqlStr = "select p.phone,u.email from ws_service s left join sys_person p on s.create_by = p.user_id left join sys_user u on p.user_id = u.id where s.del_flag=0 and s.id="+serviceId;
						Record re = Db.findFirst(sqlStr);
						String msg = "尊敬的用户，环保部门已审批完成，审批表已为您寄出，请注意查收。";
						ValiCode.sendCheckCode(re.getStr("phone"), msg,re.getStr("email"));
						/**添加操作日志*/
						OperationLogs operationLogs = new OperationLogs();
						operationLogs.set("type", "PW");
						operationLogs.set("service_id", serviceId);
						operationLogs.set("detail_type","approve_file");
						operationLogs.set("result", pwApproveSta);
						operationLogs.set("create_by", UserUtils.getUser().getId());
						operationLogs.set("create_date", new Date());
						operationLogs.save();
					}
				}
				/**添加操作日志*/
				OperationLogs operationLogs = new OperationLogs();
				operationLogs.set("type", "EP");
				operationLogs.set("service_id", serviceId);
				operationLogs.set("detail_type","approve_file");
				operationLogs.set("result", approveSta);
				operationLogs.set("create_by", UserUtils.getUser().getId());
				operationLogs.set("create_date", new Date());
				operationLogs.save();
				renderJson(serv.get("ep_step"));
			}else{
				String pw_sql = "select *from ws_pw_operation where del_flag=0 and service_id="+serviceId;
				PwOperation pw = PwOperation.dao.findFirst(pw_sql);
				if(pw.getInt("scan_sta")==SCAN_STA){//对方已扫描并发送文件
					String ep_sql = "select *from ws_ep_operation where del_flag=0 and service_id="+serviceId;
					EpOperation.dao.findFirst(ep_sql).set("approve_file",approveSta).update();
					//平台确认管理计划表
					/*String sql = "select p.phone,u.email from ws_service s left join sys_person p on s.create_by = p.user_id left join sys_user u on p.user_id = u.id where s.del_flag=0 and s.id="+serviceId;
					Record re = Db.findFirst(sql);*/
                    Record r = PwOperation.dao.getPhone(Long.valueOf(serviceId));
					String msg = "尊敬的用户，"+ r.getStr("cName")+"已确认所有申报资料无误。短期内将送至环保部门办理，审批需时较长，请耐心等待。";
					ValiCode.sendCheckCode(r.getStr("phone"), msg,r.getStr("email"));
					/**添加操作日志*/
					OperationLogs operationLogs = new OperationLogs();
					operationLogs.set("type", "EP");
					operationLogs.set("service_id", serviceId);
					operationLogs.set("detail_type","approve_file");
					operationLogs.set("result", approveSta);
					operationLogs.set("create_by", UserUtils.getUser().getId());
					operationLogs.set("create_date", new Date());
					operationLogs.save();
					renderText("send_scanfile");
				}else{
					renderText("no_send_scanfile");
				}
			}
			//renderJson(true);
		}else{
			renderJson(false);
		}
	}
	/*public void next(){
		String serviceId = getPara("serviceId");
		if(serviceId!=null && !serviceId.equals("")){
			renderJson(serv.get("ep_step"));
		}else{
			renderJson(false);
		}
	}*/
}
