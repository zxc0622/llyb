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
import com.qdum.llhb.audit.model.SupplyApprove;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/auditList/supplyAudit")
@Before(AdminInterceptor.class)
public class SupplyAuditController extends Controller {
	private static int pageSettingNum = Integer.parseInt(PropKit.get("pageNumber"));
	public void index(){
		String leibie = getPara("leibie");
		String title = getPara("title");
		String con = getPara("con");
		if(con == null || con.equals("")||con.equals("undefined")){
			con="1";
		}
		List<Record> hy = DictPcr.dao.getFirstChildren("supply_type");
		int yeshu = pageSettingNum;
		try {
			yeshu  =getParaToInt("paginateFenye");
			setAttr("paginateFenye",yeshu);
		} catch (Exception e) {
			yeshu = pageSettingNum;
		}
		Page<Record> rs = SupplyInfo.dao.getCheckLists(getParaToInt(0, 1), yeshu,leibie,title, con);
		if(hy!=null){
			setAttr("hy",hy);
		}
		if(leibie != null && !leibie.equals("")){
			setAttr("leibie", leibie);
		}
		setAttr("con", con);
		if(title != null && !title.equals("")){
			setAttr("title", title);
		}
		setAttr("recordPage", rs);
		setAttr("lists", rs.getList());
		render("supplyAudit.jsp");
	}
	/**
	 * 审核页面
	 */
	public void audit(){
		List<DictPcr> solids = DictPcr.dao.findByType("supply_type");
        setAttr("solids", solids);
		List<Dict> period=Dict.dao.getDictsByType("period_type");//获取有效时间
        List<Dict> unit=Dict.dao.getDictsByType("unit_type");//获取产品单位
		setAttr("period", period);
        setAttr("unit", unit);
		List<Record> supply = SupplyInfo.dao.getSupplyById(getPara("id"));
		if(supply.size() > 0){
			setAttr("supply", supply.get(0));
			setAttr("status",getPara("status"));//状态
			setAttr("id", getPara("id"));
			setAttr("remark", getPara("remark"));
			render("audit.jsp");
		}
	}
	/**
	 * 通过Y/不通过N
	 */
	public void passSupplys(){
		User user = UserUtils.getUser();
		if(user ==null){
			redirect("/login");
			return;
		}
		String str = getPara("ids");
		String res = getPara("res");
		String content = getPara("content");
		String sta = "";
		if("Y".equals(res)){
			sta="2";
		}else if("N".equals(res)){
			sta="0";
		}else{
			renderJson(false);
			return;
		}
		String[] ids = str.split(",");
		boolean result = true;
		for(int i = 0 ; i < ids.length; i++){
			SupplyInfo supply = SupplyInfo.dao.findById(Long.parseLong(ids[i]));
			if(supply != null){
				result = supply.set("sta",sta).update();
				if("Y".equals(res)){
					new PointController().publish("supply",Long.parseLong(supply.getInt("id")+""),supply.getLong("create_by"));
				}
				if(result == false){
					break;
				}else{
					SupplyApprove sa = new SupplyApprove();
					sa.set("result", res);
					sa.set("content", content);
					sa.set("del_flag", 0);
					sa.set("supply_id", ids[i]);
					sa.set("approve_user", user.getId());
					sa.set("create_by", user.getId());
					sa.set("create_date", new Date());
					result = sa.save();
					if(result == false){
						break;
					}
				}
			}
		}
		renderJson(result);
	}
}
