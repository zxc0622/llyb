package com.qdum.llhb.audit.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.audit.model.QiugouApprove;
import com.qdum.llhb.audit.model.SupplyApprove;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.qiugou.model.Qiugou;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
@ControllerBind(controllerKey="/auditList/qiugouAudit")
@Before(AdminInterceptor.class)
public class QiugouAuditController extends Controller{
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
		List<DictPcr> parents  = DictPcr.dao.getDictsByType("supply_type", 428l);
		Page<Record> rs = Qiugou.dao.getCheckLists(getParaToInt(0, 1), yeshu,leibie,title, con);
		if(leibie != null && !leibie.equals("")){
			setAttr("leibie", leibie);
		}
		setAttr("con", con);
		if(title != null && !title.equals("")){
			setAttr("title", title);
		}
		setAttr("recordPage", rs);
		setAttr("lists", rs.getList());
		setAttr("ps", parents);
		render("qiugouAudit.jsp");
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
			Qiugou p = Qiugou.dao.findById(ids[i]);
			if(p != null){
				p.set("sta",flag);
				fl = p.update();
				if(flag.equals("2")){
					new PointController().publish("demand",Long.parseLong(p.getInt("id")+""),p.getLong("create_by"));
				}
				QiugouApprove qa = new QiugouApprove();
				qa.set("demand_id", p.get("id"));
				qa.set("approve_user", user.getId());
				qa.set("result", f);
				qa.set("app_content", getPara("content"));
				qa.set("del_flag", 0);
				qa.set("create_by", user.getId());
				qa.set("create_date", new Date());
				qa.save();
			}
		}
		renderJson(fl);
	}
}
