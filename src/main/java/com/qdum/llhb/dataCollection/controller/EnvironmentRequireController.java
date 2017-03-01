package com.qdum.llhb.dataCollection.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 *类EnvironmentRequireController的功能描述:查询环保需求信息列表.
 *@author zhangwn
 */

@ControllerBind(controllerKey="/environmental/requirements")
public class EnvironmentRequireController extends Controller {
	 /**
     *方法index的功能描述:默认处理方法
     *@author zhangwn
     */ 
	public void index(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startTime = sdf.format(DateUtils.getMonthFirstDay());
		String endTime = sdf.format(DateUtils.getMonthLastDay());
		List<Record> cts = User.dao.getRequirementEn();
		String enType = null;
		int pageSize = 8;
		String temp = getPara("pageSize");
		if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
			pageSize = Integer.parseInt(temp);
		}
		Page<Record> page = User.dao.getgetRequirementEnByTime(getParaToInt(0,1), pageSize,enType,startTime,endTime);
		setAttr("page",page);
		setAttr("startTime", startTime);
		setAttr("endTime", endTime);
		setAttr("cts",cts);
		render("/WEB-INF/views/dataCollection/environmental/requirementsList.jsp");
	}
	/**
	 * 环保需求信息列表查找.
	 * @author zwn
	 * @date 2016-4-25   下午4:19:14
	 */
	public void query(){
		String enType = getPara("typeSelect");
		String startTime = getPara("startTime");
		String endTime = getPara("endTime");
		int pageSize = 8;
		String temp = getPara("pageSize");
		if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
			pageSize = Integer.parseInt(temp);
		}
		Page<Record> page = User.dao.getgetRequirementEnByTime(getParaToInt(0,1), pageSize, enType, startTime, endTime);
		List<Record> cts = User.dao.getRequirementEn();
		setAttr("enType", enType);
		setAttr("cts",cts);
		setAttr("page",page);
		setAttr("startTime", startTime);
		setAttr("endTime", endTime);
		render("/WEB-INF/views/dataCollection/environmental/requirementsList.jsp");
	}
	/**
	 * 需求详情.
	 * @author zwn
	 */
	public void detail(){
		String requireId = getPara("id");
		if(requireId!=null){
			Record r = User.dao.getEnviromentById(requireId);
			List<Record> companyNameList = User.dao.getCompanyName(requireId);
			setAttr("requirement", r);
			setAttr("companyNameList", companyNameList);
		}
		render("/WEB-INF/views/dataCollection/environmental/RequirementDetail.jsp");
	}

}
