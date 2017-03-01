package com.qdum.llhb.qykCustom.controller;


import java.util.List;

import net.sf.json.JSONObject;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCertificates;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 企业资质 Certificates
 */
@ControllerBind(controllerKey = "/Library/certificates",viewPath="Library/enterpriseCustom/subpage/")
@Before(CustomControllerInterceptor.class)
public class CertificatesController extends Controller {
	private User user;
	private Long companyId;
	
	/**
	 * 进入企业资质子页面
	 */
	public void intoCertificatesSubpage(){
		Integer[] moduleTypeArray=new Integer[]{1,2};
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		user=getAttr("user");
		List<Record> cerList = SysCompanyCertificates.dao.findAllCertificatesByUserId(user.getId(),100);
		setAttr("cerList", cerList);
		render("certificatesSubpage.jsp");
	}
	
	/**
	 * 更新用户证书信息
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void updateCers(){
		String cersStr=getPara("cers");
		String [] cerList = cersStr.replace("cerid","").split(";");
		JSONObject cerJso;
		int length = cerList.length;
		String cerId;
		String imgUrl;
		String title;
		boolean isValid;
		for(int i=0;i<length;i++){
			cerJso=JSONObject.fromObject(cerList[i]);
			cerId=cerJso.getString("cerId");
			imgUrl=cerJso.getString("imgUrl");
			title=cerJso.getString("title");
			if("undefined".equalsIgnoreCase(cerId)){
				isValid=!("delete".equals(imgUrl)||("".equals(title)&&"undefined".equals(imgUrl)));
				if(isValid){
					User user = UserUtils.getUser();
					cerJso.put("userId", user.getLong("id"));
					SysCompanyCertificates.dao.addCer(cerJso);
				}
			}else if("delete".equalsIgnoreCase(imgUrl)&&!("undefined".equalsIgnoreCase(cerId))){
				SysCompanyCertificates.dao.deleteCer(cerId);
			}else{
				SysCompanyCertificates.dao.updataCer(cerJso);
			}
		}
		renderJson("true");
	}
	
}
