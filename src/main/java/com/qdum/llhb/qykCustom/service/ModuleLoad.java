package com.qdum.llhb.qykCustom.service;

import com.jfinal.core.Controller;
import com.qdum.llhb.sys.model.User;

public class ModuleLoad{
	//模块数组，有序
	Class [] moduleArray={HeadService.class,NavigationService.class,BannerService.class,
			SummaryService.class,CourseService.class,ServiceTypeService.class,
			ServiceCaseService.class,ShowProdService.class,CertificatesService.class,
			PhotosService.class,ServiceProvitionService.class};
	private Module module = new Module();
	
	public ModuleLoad (Controller controller){
		module.controller=controller;
		module.companyId=controller.getAttr("companyId");
		module.user=User.dao.getUserByCompanyId(module.companyId);
		module.userId=module.user.getLong("id");
	}

	/**
	 * 加载模块
	 * @param <T>
	 * @param clazz
	 */
	public <T extends Module> void moduleInit(Class<T> clazz){
		try {
			Module module = clazz.newInstance();
			module.controller=this.module.controller;
			module.companyId=this.module.companyId;
			module.user=this.module.user;
			module.userId=this.module.userId;
			module.init();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 加载模块组，返回模块代码list
	 * @param customMsg 需要加载的模块组
	 * @return 
	 */
	public void load(Integer [] moduleTypeArray){
		for(Integer moduleType : moduleTypeArray){
			if(moduleType==null){
				continue;
			}
			moduleInit(moduleArray[moduleType-1]);
		}
	}
	
}
