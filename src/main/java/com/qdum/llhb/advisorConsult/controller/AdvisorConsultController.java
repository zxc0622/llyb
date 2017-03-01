package com.qdum.llhb.advisorConsult.controller;

import net.sf.json.JSONObject;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.advisorConsult.model.AdvisorConsult;
import com.qdum.llhb.common.utils.ValiCode;
@ControllerBind(controllerKey = "/evmAdvisor/consult")
public class AdvisorConsultController extends Controller{
	
	//新增
	public void add(){
		String sta=ValiCode.jiaoyan(getPara("advisorConsult.phone"), getPara("code"));
		JSONObject jso = new JSONObject();
		jso.accumulate("sta", 0);
		if(!"ok".equalsIgnoreCase(sta)){
			jso.accumulate("msg", "验证码不正确！");
		}else{
			AdvisorConsult advisorConsult = new AdvisorConsult();
			advisorConsult.set("title", getPara("advisorConsult.title"));
			advisorConsult.set("QQ", getPara("advisorConsult.QQ"));
			advisorConsult.set("type", getPara("advisorConsult.type"));
			advisorConsult.set("phone", getPara("advisorConsult.phone"));
			advisorConsult.set("email", getPara("advisorConsult.email"));
			advisorConsult.set("content", getPara("advisorConsult.content"));
			advisorConsult.set("contact", getPara("advisorConsult.contact"));
			if(advisorConsult.save()){
				jso.accumulate("sta", 1);
				jso.accumulate("msg", "提交成功！");
			}else{
				jso.accumulate("msg", "提交失败！");
			}
		}
		renderJson(jso);
	}
	
	//获取询问列表
	public void getList(){
		
	}
	
	
}
