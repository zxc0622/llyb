package com.qdum.llhb.sys.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

@ControllerBind(controllerKey = "/sys/sysUpdate")
public class SysUpdateController extends Controller {
	//新增更新记录
	public void add(){
		render("sysUpdateRecord.jsp");
	}
	
	//保存更新记录
	public void save(){
		String code=getPara("code");
		int saveSta=0;
		if("yyhbupdate@2016".equals(code)){
			String mark=getPara("mark");
			String name=getPara("name");
			saveSta=Db.update("insert into sys_update_record (name,mark)VALUES(?,?)",name,mark);
		}
		if(saveSta>0){
			redirect("/sys/sysUpdate/list");
		}else{
			renderJson("false");
		}
	}
	
	//获取更新记录
	public void list(){
		List<Record> recordList=Db.find("select * from sys_update_record order by update_time");
		setAttr("recordList", recordList);
		render("updateRecordList.jsp");
	}
}
