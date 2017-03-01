package com.qdum.llhb.memPoint.controller;


import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.memPoint.model.PointChangeDetail;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 积分记录表
 * @author zhaoyl
 * @time 2016年1月27日12:40:32
 * */
@ControllerBind(controllerKey="/memPoint/record")
public class PointRecordController extends Controller {
	public void index(){
		Integer pageNumber = getParaToInt(0);
		if(pageNumber==null){
			pageNumber=1;
		}
		setAttr("pageNumber",pageNumber);
		Integer pageSize = getParaToInt("pageSize");
		if(pageSize==null){
			pageSize=8;//默认显示8条数据
		}
		setAttr("pageSize",pageSize);
        User u = UserUtils.getUser();
        Page<Record> page = PointChangeDetail.dao.getAll(pageNumber, pageSize, u.getId());
        if(page != null){
			setAttr("recordList",page.getList());
			setAttr("recordPage",page);
		}
		render("pointRecord.jsp");
	}
}
