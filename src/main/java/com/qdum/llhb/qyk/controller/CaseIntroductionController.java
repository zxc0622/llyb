package com.qdum.llhb.qyk.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.BusinessCollect;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.Case;
import org.apache.commons.lang3.StringUtils;

@ControllerBind(controllerKey = "/Library/case")
public class CaseIntroductionController extends Controller {
	/**
	 * 显示成功案例
	 * 
	 * @date 2016年5月16日下午3:58:27
	 */
	@ActionKey("/homepage/cases")
	public void showCase() {
		String enterpriseId = getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		Record company = Company.dao.getCompanyById(enterpriseId);
		String userID = String.valueOf(company==null?null:company.get("user_id"));
		List<Record> cases = Case.dao.getCaseByUserID(userID);
		setAttr("cases", cases);

		List<Area> provinceList = Area.dao.getChildList("0,1,");// 省列表
		setAttr("provinceList", provinceList);
        List<Record> list2 = CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
        if(!(list2.isEmpty())){
            setAttr("companyList", list2.get(0));
        }
        List<Record> hengF= Banner.dao.gethengF(enterpriseId,Banner.CASE_BANNER);
        if(!(hengF.isEmpty())){
            setAttr("hengF", hengF.get(0));
        }
		renderJsp("case.jsp");
	}

	/**
	 * 显示成功案例详情
	 * 
	 * @date 2016年5月16日下午3:59:32
	 */
	public void caseDetail() {
		String caseID = getPara(0);
        if(StringUtils.isBlank(caseID)){
            caseID = getPara("caseID");
        }
		String enterpriseId = getPara(1);
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
        List<Record> list2 = CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
        if(!(list2.isEmpty())){
            setAttr("companyList", list2.get(0));
        }
		// 案例的page_view+1
		Case ca = Case.dao.findById(caseID);
		String pageViewStr = String.valueOf(ca.get("page_view"));
		Integer pageView = 0;
		if (pageViewStr != null  && !"null".equals(pageViewStr)) {
			pageView = Integer.parseInt(pageViewStr);
		}
		pageView = pageView + 1;
		ca.set("page_view", pageView);
		ca.update();
		
		Record caseDetail = Case.dao.getCaseRecordByID(caseID);
		StringBuffer area = new StringBuffer();
		Area prov = Area.dao.getNameById(caseDetail.get("prov_id"));
		Area city = Area.dao.getNameById(caseDetail.get("city_id"));
		Area county = Area.dao.getNameById(caseDetail.get("area_id"));
		if (prov != null) {
			area.append(prov.getName());
		}
		if (city != null) {
			area.append(city.getName());
		}
		if (county != null) {
			area.append(county.getName());
		}
		area.append(caseDetail.get("address"));
		setAttr("area", area.toString());

		String userId = String.valueOf(caseDetail.get("user_id"));
		Record company = Company.dao.getCompanyByUserId(userId);
		setAttr("cs", caseDetail);
		setAttr("company", company);
        List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.CASE_BANNER);
        if(!(hengF.isEmpty())){
            setAttr("hengF", hengF.get(0));
        }
		renderJsp("caseDetail.jsp");
	}

	/**
	 * 异步条件查询
	 * 
	 * @date 2016年5月18日下午3:06:20
	 */
	public void getCaseAjax() {
		String time = getPara("date");
		String prov = getPara("prov");
		String enterpriseId = getPara("enterpriseId");
		setAttr("enterpriseId", enterpriseId);
		Record company = Company.dao.getCompanyById(enterpriseId);
		String user_id = String.valueOf(company.get("user_id"));
		List<Record> cases = Case.dao.getCaseByCDAndProv(time, prov,user_id);
		renderJson(cases);
	}

	/**
	 * 收藏案例
	 * 
	 * @date 2016年5月24日下午3:02:00
	 */
	public void collectCase() {
		String type = getPara("type");
		String collectId = getPara("collectId");
		Date date = new Date();
		User user = UserUtils.getUser();
		BusinessCollect busCollect = null;
		if (collectId != null) {
			busCollect = BusinessCollect.dao.findCollet(type, collectId, user.getId());
			if (busCollect != null && !busCollect.equals("")) {// 表示已经收藏
				renderJson(false);
			} else {
				BusinessCollect busiCollect = new BusinessCollect();
				busiCollect.set("collect_id", collectId);
				busiCollect.set("type", type);
				busiCollect.set("create_by", user.getId());
				busiCollect.set("create_date", date);
				busiCollect.save();
				
				new PointController().dailyCollectStore("product", Long.parseLong(collectId));// 收藏商品获取积分
				renderJson(true);
			}
		} else {
			renderJson("error");
		}
	}
}
