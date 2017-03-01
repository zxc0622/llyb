package com.qdum.llhb.audit.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.ext.weixin.kit.PropKit;
import com.qdum.llhb.memPoint.controller.PointController;
import org.apache.poi.hssf.util.HSSFColor.SEA_GREEN;
import org.apache.regexp.recompile;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.audit.model.PersonApprove;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.hyzl.model.DictPcr;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/auditList/personalAudit")
@Before(AdminInterceptor.class)
public class PersonalAuditController extends Controller{
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	/**
	 * 个人审核列表
	 */
	public void index(){
		String leibie = getPara("leibie");
		String title = getPara("title");
		String con = getPara("con");
		if(con == null){
			con="0";
		}
		int yeshu = pageSettingNum;
		try {
			yeshu  =getParaToInt("paginateFenye");
			setAttr("paginateFenye",yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		Page<Record> pages = User.dao.getCheckLists(getParaToInt(0, 1), yeshu,leibie,title,con);
		if(!(pages.getList().isEmpty())){
			setAttr("lists", pages.getList());
			setAttr("recordPage", pages);
		}
		if(leibie != null && !leibie.equals("")){
			setAttr("leibie", leibie);
		}
		setAttr("con", con);
		if(title != null && !title.equals("")){
			setAttr("title", title);
		}
		
		render("personalAudit.jsp");
	}
	/**
	 * 审核详情
	 */
	public void checkDetails(){
		Record r = User.dao.getUserPerson(getPara("id"));
		setAttr("user", r);
		render("personalInfoCheck.jsp");
	}
	/**
	 * 通过未通过
	 */
	public void pass(){
		Person p  =Person.dao.findById(getPara("pid"));
		User user = UserUtils.getUser();
		String flag = getPara("flag");
		String f = "";
		if(flag.equals("-1")){
			f = "N";
		}else if(flag.equals("1")){
			f="Y";
		}
		if(p != null){
			p.set("auth_flag", flag);
			p.update();
			if(flag.equals("1")){
				new PointController().regUserPoint("person",Long.valueOf(p.get("user_id")+""));
			}
			PersonApprove qa = new PersonApprove();
			qa.set("user_id", p.get("user_id"));
			qa.set("approve_user", user.getId());
			qa.set("result", f);
			qa.set("approve_content", getPara("content"));
			qa.set("del_flag", 0);
			qa.set("create_by", user.getId());
			qa.set("create_date", new Date());
			qa.save();
		}
		renderJson(getPara("flag"));
	}
	
}
