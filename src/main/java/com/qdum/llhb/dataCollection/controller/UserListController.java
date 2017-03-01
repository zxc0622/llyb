package com.qdum.llhb.dataCollection.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;

@ControllerBind(controllerKey="/dataCollection/user")
@Before(AdminInterceptor.class)
public class UserListController extends Controller {
	public static final String DICT_TYPE = "user_type";
	//private static final int pageSize = 8;//每页条数
	public void index(){
		List<Dict> dictList = Dict.dao.getDictsByType(DICT_TYPE);
		setAttr("dictList",dictList);
		/*int pageNumber = 1;
		String pageNumberStr = getPara();
		if(pageNumberStr!=null && !pageNumberStr.equals("") && pageNumberStr.matches("[0-9]+")){
			pageNumber = Integer.parseInt(pageNumberStr);
		}*/
		setAttr("account",getPara("account"));
		setAttr("name",getPara("name"));
		setAttr("phone",getPara("phone"));
		setAttr("type",getPara("type"));
		int pageSize = 8;//默认每页条数
		String temp = getPara("pageSize");
		setAttr("pageSize",temp);
		if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
			pageSize = Integer.parseInt(temp);
		}
		Page<Record> userPage = User.dao.getUserList(getParaToInt(0,1), pageSize, getPara("account"), getPara("name"), getPara("phone"), getPara("type"));
		if(userPage!=null){
			setAttr("userList", userPage.getList());
			setAttr("recordPage", userPage);
		}
		render("userList.jsp");
	}
	public void person(){
		String id = getPara("id");
		Record r = null;
		if(id!=null &&!"".equals(id)){
			r = User.dao.getUserPerson(id);
		}
		setAttr("user", r);
		render("personDetail.jsp");
	}
	public void company(){
		String id=getPara("id");
		setAttr("itemId", id);
		String userId=getPara("userId");
		setAttr("userId", userId);
		String itemFlag=getPara("itemFlag");
		setAttr("itemFlag", itemFlag);
		List<Record> list =CompanyZl.dao.findCompanysSY(Long.parseLong(id));
		if(!(list.isEmpty())){
			setAttr("companyZl",list.get(0));
		}
		setAttr("type", 0);
		render("companyDetail.jsp");
	}
}
