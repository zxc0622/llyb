package com.qdum.llhb.audit.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.audit.model.CompetitionApprove;
import com.qdum.llhb.audit.model.QiugouApprove;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import java.util.Date;
import java.util.List;

@ControllerBind(controllerKey="/auditList/competition")
public class CompetitionAuditController extends Controller{
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
		String leibie = getPara("leibie");
		String title = getPara("title");
		String con = getPara("con");
		if(con == null){
			con = "1";
		}
		int yeshu = pageSettingNum;
		try {
			yeshu  =getParaToInt("paginateFenye");
			setAttr("paginateFenye",yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		Page<Record> records  = Competition.dao.getCheckLists(getParaToInt(0, 1),yeshu,leibie,title,con);
		List<DictPcr> kind = DictPcr.dao.getDictsByType("waste_type",346l);//废物类别总分类
		if(leibie != null && !leibie.equals("")){
			setAttr("leibie", leibie);
		}
		setAttr("con", con);
		if(title != null && !title.equals("")){
			setAttr("title", title);
		}
		setAttr("recordPage", records);
		setAttr("lists", records.getList());
		setAttr("ps", kind);
		render("competitionAudit.jsp");
	}
	/**
	 * 审核详情
	 */
	public void checkDetails(){
		Record r =Qiugou.dao.qiugouCheckInfo(getPara("id"));
	 	List<DictPcr> hangyefirst = DictPcr.dao.findByType("supply_type");
		String paramId = getPara("paramId");
		setAttr("hangyefirst", hangyefirst);
		setAttr("r", r);
		setAttr("listnum",getPara("listnum"));
		setAttr("ppid",paramId);
		render("addAudit.jsp");
	}
	/**
	 * 通过未通过
	 */
	public void pass(){
		User user = UserUtils.getUser();
		String flag = getPara("flag");
		boolean fl = false;
		String f = "";
		if(flag.equals("0")){
			f = "N";
		}else if(flag.equals("2")){
			f="Y";
		}
		String[] ids = getPara("pid").split(",");
		boolean result = true;
		for(int i = 0 ; i < ids.length; i++){
			Competition p = Competition.dao.findById(ids[i]);
			if(p != null){
				p.set("sta",flag);
				fl = p.update();
				CompetitionApprove qa = new CompetitionApprove();
				qa.set("comp_id", p.get("id"));
				qa.set("approve_user", user.getId());
				qa.set("result", f);
				qa.set("content", getPara("content"));
				qa.set("del_flag", 0);
				qa.set("create_by", user.getId());
				qa.set("create_date", new Date());
				qa.save();
			}
		}
		renderJson(fl);
	}
	/**
	 * 查看
	 */
	public void checkSee(){
		User u = UserUtils.getUser();
		String paramId = getPara("paramId");
		setAttr("user",u);
		setAttr("today",new Date());
		List<DictPcr> kind = DictPcr.dao.getDictsByType("waste_type",346l);//废物类别总分类
		setAttr("kindone",kind);//一级分类
		setAttr("adds", Area.dao.getChildList("0,1,"));
		setAttr("units", Dict.dao.getDictsByType("unit_type"));
		setAttr("perions", Dict.dao.getDictsByType("period_type"));
		setAttr("incres", Dict.dao.getDictsByType("increase_type"));//最小加价
		setAttr("m", Db.findById("inma_competition_info",paramId));
		setAttr("ppid",paramId);
		render("checkAddSee.jsp");
	}
}
