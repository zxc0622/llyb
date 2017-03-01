package com.qdum.llhb.backmana.controller;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.reg.model.Company;
/**
 * 
 * @Title: EnterpriseLogoController
 * @Description: 企业logo管理
 * @author ZhouXiang
 * @date 2016年5月27日上午9:35:01
 */
@ControllerBind(controllerKey = "/backmana/enterpriseLogo")
public class EnterpriseLogoController extends Controller {
	
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
		
	}
	
	/**
	 * 所有的企业logo及企业其他信息
	 * 
	 * @date 2016年5月27日上午9:36:41
	 */
	public void allLogo(){
		String company_name = getPara("company_name");
		setAttr("company_name", company_name);
		int yeshu = pageSettingNum;
		try {
			yeshu = getParaToInt("pageSizeParaName");
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		setAttr("pageSizeParaName", yeshu);
		Page<Record> records = Company.dao.getFullRecords(getParaToInt(0, 1),yeshu,company_name);
		List<Record> companys = records.getList();
		setAttr("companys", companys);
		setAttr("recordPage", records);
		render("/WEB-INF/views/backmana/enterpriselogo/allLogo.jsp");
	}
	
	public void changeLogo(){
		String newLogoUrl = getPara("logoUrl");
		String company_id = getPara("company_id");
		Company company = Company.dao.findById(company_id);
		company.set("logo_img", newLogoUrl);
		company.update();
		renderText("success");
	}
	
}
