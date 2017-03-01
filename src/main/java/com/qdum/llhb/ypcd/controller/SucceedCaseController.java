package com.qdum.llhb.ypcd.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Case;

/**
 * 
 * @Title: SucceedCaseController
 * @Description: 云铺管理-->成功案例管理
 * @author ZhouXiang
 * @date 2016年5月17日上午9:51:12
 */
@ControllerBind(controllerKey = "/ypcd/succeedCase")
public class SucceedCaseController extends Controller {
	int pageSize = 8;
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));

	public void editCase() {
		String caseId = getPara("caseId");
		if (caseId != null && caseId.length() > 0) {
			Record cs = Case.dao.getCaseRecordByID(caseId);
			/*
			 * String prov_id = String.valueOf(cs.get("prov_id")); String
			 * city_id = String.valueOf(cs.get("city_id")); String county_id =
			 * String.valueOf(cs.get("area_id")); if (prov_id != null &&
			 * !prov_id.equals("null")) { Area prov =
			 * Area.dao.findById(prov_id); setAttr("prov", prov); } if (city_id
			 * != null && !city_id.equals("null")) { Area city =
			 * Area.dao.findById(city_id); setAttr("city", city); } if
			 * (county_id != null && !county_id.equals("null")) { Area county =
			 * Area.dao.findById(county_id); setAttr("county", county); }
			 */
			setAttr("cs", cs);
		}
		List<Dict> period = Dict.dao.getDictsByType("period_type");// 获取有效时间
		setAttr("period", period);

		List<Area> provinceList = Area.dao.getChildList("0,1,");// 省列表
		setAttr("provinceList", provinceList);
		
		//查询案例分类
		Record cRec = Db.findFirst("SELECT * FROM sys_dict_pcr WHERE parent_id=0 AND type='case_type' and del_flag=0");
		if(cRec != null){
			List<Record> caseTypeList = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=? AND del_flag=0 order by sort",cRec.get("id"));
			setAttr("caseTypeList",caseTypeList);
			List<Record> caseTypeList2 = Db.find("SELECT * FROM sys_dict_pcr WHERE parent_id=? AND del_flag=0 order by sort",caseTypeList.get(0).get("id"));
			setAttr("caseTypeList2",caseTypeList2);
		}
		
		Record comIfo = Db.findFirst("SELECT * FROM sys_company WHERE user_id =? AND del_flag=0",UserUtils.getUser().getId());
		setAttr("companyId",comIfo.get("id"));
		
		renderJsp("editCase.jsp");
	}

	public void allCase() {
		User user = UserUtils.getUser();
		int yeshu = pageSettingNum;
		try {
			yeshu = getParaToInt("pageSize");
			setAttr("pageSize", yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		Page<Record> cases = Case.dao.getFullRecords(getParaToInt(0, 1), yeshu, user.getId());
		setAttr("casesPage", cases);
		setAttr("cases", cases.getList());
		renderJsp("allCase.jsp");
	}

	/**
	 * 新建或修改成功案例
	 * 
	 * @date 2016年5月17日下午2:38:00
	 */
	public void saveCase() {
		User user = UserUtils.getUser();
		String id = getPara("id");
		Case cs = null;
		if (id == "" || id == null) {
			cs = new Case();
			cs.set("user_id", user.getId());
			cs.set("create_by", user.getId());
			cs.set("create_date", new Date());
		} else {
			cs = Case.dao.findById(getParaToLong("id"));
			cs.set("update_by", user.getId());
			cs.set("update_date", new Date());
		}

		cs.set("case_name", getPara("title"));
		cs.set("case_desc", getPara("desc"));
		cs.set("pic1", getPara("fileone"));
		cs.set("pic2", getPara("filetwo"));
		cs.set("pic3", getPara("filethree"));
		cs.set("time_length", getPara("timeLength"));
		cs.set("price", getPara("price"));
		cs.set("remarks", getPara("remarks"));
		
		cs.set("type_id", getPara("typeId1"));
		cs.set("case_type", getPara("typeName1"));
		cs.set("type_id2", getPara("typeId2"));
		cs.set("case_type2", getPara("typeName2"));
		
		String prov_id = getPara("prov");
		if (prov_id == null || prov_id.length() < 1) {
			prov_id = "0";
		}
		String city_id = getPara("city");
		if (city_id == null || city_id.length() < 1) {
			city_id = "0";
		}
		String area_id = getPara("county");
		if (area_id == null || area_id.length() < 1) {
			area_id = "0";
		}
		cs.set("prov_id", prov_id);
		cs.set("city_id", city_id);
		cs.set("area_id", area_id);
		cs.set("address", getPara("address"));
		cs.set("sta", 2);

		boolean result = false;
		if (id == "" || id == null) {
			result = cs.save();
		} else {
			result = cs.update();
		}
		renderJson(result);

		// System.out.println("title = "+title+", des = "+desc+", remarks =
		// "+remarks+", price = "+price+", 过期时间 = "+endTime +", 详细地址 =
		// "+address+", 图片 = " + pic1+", 省 = "+prov+", 市 = "+city+", 县 =
		// "+county);
	}

	public void deleteCase() {
		String[] ids = getPara("ids").split(",");
		for (String id : ids) {
			Case cs = Case.dao.getCaseByID(id);
			cs.set("del_flag", true);
			cs.update();
		}
		renderText("ok");
	}
}
