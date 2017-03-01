package com.qdum.llhb.ws.controller;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;

@ControllerBind(controllerKey="/ws/productwaste/contract")
public class PWSeeContractController extends Controller {
	private static final int VIEW_STATUS = 1;//设置查阅合同状态为1，即已查阅
	public static final Logger LOGGER = Logger.getLogger(PWSeeContractController.class);
	public void index(){
		String id = getPara("id");
		String sql = "select eo.upload_contract eo_uploaded, po.*"
				+ "from ws_pw_operation po "
				+ "LEFT JOIN ws_ep_operation eo ON po.service_id = eo.service_id "
				+ "where po.del_flag=0 and po.service_id="+id;
		PwOperation po = PwOperation.dao.findFirst(sql);
		setAttr("id",id);
		setAttr("serviceId",po.get("service_id"));
		int viewContract = po.getInt("view_contract");
		setAttr("viewContract",viewContract);
		setAttr("eo_uploaded",po.get("eo_uploaded"));
		
		ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(id);
        List<ServiceDetails> serviceDetailsList = ServiceDetails.dao.getServiceDetails(new Long(id));
        setAttr("serviceMainInfo", serviceMain);
        setAttr("serviceDetailsInfos", serviceDetailsList);
        //查询处置方上传的合同附件
		List<Record> wdList = Db.find("SELECT * FROM ws_document WHERE service_id=? AND document_type=2 AND del_flag=0",id);
		setAttr("wdList",wdList);
		
		//查询总重总价
		List<Record> wscList = Db.find("SELECT * FROM ws_service_count WHERE service_id=? AND del_flag=0",id);
		if(wscList.size() > 0){
			setAttr("wscList",wscList.get(0));
		}

		setAttr("history", getPara("history"));
		
		render("seeContract.jsp");
	}
	public void view(){
		String serviceId = getPara("serviceId");
		String sqlEP = "select *from ws_ep_operation where del_flag=0 and service_id="+serviceId;
		int eo_uploaded = EpOperation.dao.findFirst(sqlEP).getInt("upload_contract");
		if(eo_uploaded==2){//环保方已上传合同状态
			String sourceUrl = "/ws/productwaste/contract?id="+serviceId;
			setSessionAttr("sourceUrl", sourceUrl);//向session中写入，当前步骤标记，以便从站内信跳回
			String sql = "select *from ws_pw_operation where del_flag=0 and service_id="+serviceId;
			PwOperation.dao.findFirst(sql).set("view_contract", VIEW_STATUS).update();
			/**添加操作日志*/
			OperationLogs operationLogs = new OperationLogs();
			operationLogs.set("type", "PW");
			operationLogs.set("service_id", serviceId);
			operationLogs.set("detail_type","view_contract");
			operationLogs.set("result", VIEW_STATUS);
			operationLogs.set("create_by", UserUtils.getUser().getId());
			operationLogs.set("create_date", new Date());
			operationLogs.save();
		}
		renderJson(eo_uploaded);
	}
	public void next(){
		String serviceId = getPara("serviceId");
		String sql = "select *from ws_pw_operation where service_id="+serviceId;
		int viewContract = PwOperation.dao.findFirst(sql).getInt("view_contract");
		ServiceMain ser = ServiceMain.dao.findById(serviceId);
		String seeContractPwStepStatus = PwStepStatusEnum.CONTRACT_STEP.getValue();//查阅合同状态
		if(seeContractPwStepStatus.equals(ser.getStr("pw_step"))){
			if(viewContract==VIEW_STATUS){//判断是否已经查阅合同
				ServiceMain.dao.findById(serviceId).set("pw_step",PwStepStatusEnum.PLAN_STEP.getValue()).update();
			}
			renderJson(viewContract);
		}else{
			renderText("error");
		}
		
	}
}
