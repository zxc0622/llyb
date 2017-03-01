package com.qdum.llhb.ws.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.model.WsDocument;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ControllerBind(controllerKey="/ws/environment/uploadfile")
public class EPUploadFileController extends Controller {
	private static final int UPLOAD_STATUS= 2;//设置上传状态为已上传
	public static final String EP_STEP = EpStepStatusEnum.ENSURE_PLAN_STEP.getValue();//环保方确认管理计划表的状态
	
	public void index(){
		String id = getPara("id");
		String sql = "select s.create_by pw_user, s.ep_step, eo."
				+ "*from ws_ep_operation eo "
				+ "LEFT JOIN ws_service s ON s.id = eo.service_id "
				+ "where eo.del_flag=0 and eo.service_id="+id;
		EpOperation eo = EpOperation.dao.findFirst(sql);
		setAttr("id",id);
		setAttr("serviceId",eo.get("service_id"));
		setAttr("uploadContract",eo.get("upload_contract"));
		setAttr("pw_user",eo.get("pw_user"));
		setAttr("curStep",eo.get("ep_step"));//当前环保方状态
		setAttr("EP_STEP",EP_STEP);
		
		//查询危废的基本信息
		long serviceId = Long.parseLong(id);
		ServiceMain serviceMain = ServiceMain.dao.getAuditingServiceMain(serviceId);
		List<ServiceDetails> serviceDetails = ServiceDetails.dao.getServiceDetails(serviceId);
		setAttr("serviceMainInfo", serviceMain);
		setAttr("serviceDetailsInfos", serviceDetails);
		
		//查询附件上传信息
		List<Record> wdList = Db.find("SELECT * FROM ws_document WHERE service_id=? AND document_type=2 AND del_flag=0 ORDER BY create_date",serviceId);
		setAttr("wdList",wdList);
		
		//查询总重总价
		List<Record> wscList = Db.find("SELECT * FROM ws_service_count WHERE service_id=? AND del_flag=0",id);
		if(wscList.size() > 0){
			setAttr("wscList",wscList.get(0));
		}
		
		setAttr("history", getPara("history"));
		
		render("uploadFile.jsp");

	}
	
	/*上传*/
	public void upload(){
		String serviceId = getPara("serviceId");
		if(serviceId!=null && !serviceId.equals("") ){
			String sql = "select *from ws_ep_operation where service_id="+serviceId;
			EpOperation eo = EpOperation.dao.findFirst(sql);
			eo.set("upload_contract",UPLOAD_STATUS).update();
			String sourceUrl = "/ws/environment/uploadfile?id="+serviceId;
			setSessionAttr("sourceUrl", sourceUrl);
			/**添加操作日志*/
			OperationLogs operationLogs = new OperationLogs();
			operationLogs.set("type", "EP");
			operationLogs.set("service_id", serviceId);
			operationLogs.set("detail_type","upload_contract");
			operationLogs.set("result", UPLOAD_STATUS);
			operationLogs.set("create_by", UserUtils.getUser().getId());
			operationLogs.set("create_date", new Date());
			operationLogs.save();
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
	/*已上传*/
	public void uploaded(){
		String serviceId = getPara("serviceId");
		if( serviceId!=null && !serviceId.equals("")){
			//ServiceMain.dao.findById(serviceId).set("pw_step", PwStepStatusEnum.CONTRACT_STEP.getValue()).update();//设置产废方节点为查询合同
			ServiceMain.dao.findById(serviceId).get("ep_step");//获取环保当前节点
			renderJson(ServiceMain.dao.findById(serviceId).get("ep_step"));
		}else{
			renderJson(false);
		}
	}
	
	/**
	 * @author wyp
	 * 保存上传的《合同》、《审批表》、《转移计划表》、《委托书》
	 */
	public void saveUploadFiles(){
		String serviceId = getPara("serviceId");
		String docInfo = getPara("docInfo");
		long userId = UserUtils.getUser().getId();
		
		JSONArray ja = JSONArray.fromObject(docInfo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int len = ja.toArray().length;
		boolean isSuccess=false;
		for(int i=0;i<len;i++){
			JSONObject jo = (JSONObject) ja.get(i);
			String url = (String)jo.get("url");
			String name = (String)jo.get("name");
			WsDocument wd = new WsDocument();
			wd.set("service_id", serviceId);
			wd.set("document_name", name);
			wd.set("document_url", url);
			wd.set("document_type", 2);
			wd.set("create_by", userId);
			wd.set("create_date", sdf.format(new Date()));
			isSuccess=wd.save();
		}
		if(isSuccess){
			Db.update("update ws_service set pw_step=? where id=?",PwStepStatusEnum.CONTRACT_STEP.getValue(),serviceId);
			//发短信
			ServiceMain sm = ServiceMain.dao.findById(serviceId);
			Record prec = Db.findFirst("SELECT phone FROM sys_person WHERE user_id=? AND del_flag=0",sm.getCreateBy());
			String msgPhone = sm.getPhone();
			if(prec != null){
				msgPhone = prec.getStr("phone");
			}
			ValiCode.sendCheckCode(msgPhone, "危废处置公司已提交合同，请登录平台查看",sm.getEmail());
		}
		renderText("ok");
	}
	
}
