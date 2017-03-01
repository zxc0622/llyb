package com.qdum.llhb.qykCustom.controller;


import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCourse;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.sys.model.User;

/**
 * 企业历程模块自定义
 */
@ControllerBind(controllerKey = "/Library/course",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class ServiceCourseController  extends Controller{

	private User user;
	private Long companyId;
	
	//保存公司历程
	@Before(ChangeUserMsgInterceptor.class)
	public void saveCourse(){
		String co1 = getPara("co1");
		String co2 = getPara("co2");
		String co3 = getPara("co3");
		String co4 = getPara("co4");
		String co5 = getPara("co5");
		String[] coArray = {co1,co2,co3,co4,co5};
		companyId=getAttr("companyId");
		
		SysCompanyCustom scc = SysCompanyCustom.dao.getModuleMsg(companyId, 5);
		List<SysCompanyCourse> cList = SysCompanyCourse.dao.getCourseMsg(scc.getInt("id"));
		for(int i=0;i<coArray.length;i++){
			if(i<cList.size()){
				SysCompanyCourse sccourser = cList.get(i).set("course_content", coArray[i]);
				sccourser.update();
			}else{
				SysCompanyCourse sccourser = new SysCompanyCourse();
				sccourser.set("custom_id", scc.getInt("id"));
				sccourser.set("course_content", coArray[i]);
				sccourser.save();
			}
		}
		renderText("ok");
		
	}
	
}
