package com.qdum.llhb.integration.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.integration.model.Integration;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/integration")
public class integrationController extends Controller{

	/**
	 *  积分兑换列表初始化
	 */
	public void IntegrationList(){
		String pageSize = getPara("pageSize");
		if(null == pageSize || "".equals(pageSize)){
			pageSize = "8";
		}
		Page<Record> list = Integration.dao.findIntegration(getParaToInt(0, 1),Integer.valueOf(pageSize));
		if(!(list.getList().isEmpty())){
			setAttr("integrationList", list.getList());
			setAttr("recordPage", list);
		}
		render("integrationManage.jsp");
	}
	
	/**
	 *  积分兑换维护初始化
	 */
	public void IntegrationWH(){
		String id =getPara("id");
		if(id!=null&&!(id.equals(""))){
			List<Record> list =Integration.dao.findIntegrationId(id);
			setAttr("integration",list.get(0));
		}
		render("integrationAdd.jsp");
	}
	/**
	 *  积分兑换预览初始化
	 */
	public void IntegrationYL(){
		String itemId =getPara("itemId");
		String proName =getPara("proName");
		String proDesc =getPara("proDesc");
		String limitNum =getPara("limitNum");
		String num =getPara("num");
		String sponsor=getPara("sponsor");
		String smallImg=getPara("smallImg");
		String points=getPara("points");
		setAttr("itemId", itemId);
		setAttr("proName", proName);
		setAttr("proDesc", proDesc);
		setAttr("limitNum", limitNum);
		setAttr("num", num);
		setAttr("sponsor", sponsor);
		setAttr("smallImg", smallImg);
		setAttr("points", points);
		render("integrationPreview.jsp");
	}
	/**
	 * 积分兑换发布
	 */
	public void saveIntegration(){
		String itemId =getPara("itemId");
		String proName =getPara("proName");
		String proDesc =getPara("proDesc");
		String limitNum =getPara("limitNum");
		String num =getPara("num");
		String sponsor=getPara("sponsor");
		String smallImg=getPara("smallImg");
		String points=getPara("points");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		User user = UserUtils.getUser();
		if(itemId!=null&&!(itemId.equals(""))){
			Integration integration =new Integration();
			integration.set("id", itemId);
			integration.set("pro_name", proName);
			integration.set("points", points);
			integration.set("num", num);
			integration.set("limit_num", limitNum);
			integration.set("sponsor", sponsor);
			integration.set("pro_desc", proDesc);
			integration.set("small_img", smallImg);
			integration.set("update_date", sdf.format(new Date()));
			integration.update();
		}else{
			Integration integration =new Integration();
			integration.set("pro_name", proName);
			integration.set("points", points);
			integration.set("num", num);
			integration.set("limit_num", limitNum);
			integration.set("sponsor", sponsor);
			integration.set("pro_desc", proDesc);
			integration.set("small_img", smallImg);
			integration.set("create_date", sdf.format(new Date()));
			integration.set("create_by",user.getId());
			integration.save();
		}
		redirect("/integration/IntegrationList");
	}
	/**
	 * 批量删除积分兑换
	 */
	public void delIntegration(){
		String[] choose=getParaValues("choose");
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				Integration integration=new Integration();
				integration.set("id", choose[i]);
				integration.set("del_flag", "1");
				integration.update();
			}
		}
		redirect("/integration/IntegrationList");
	}
	/**
	 * 单条删除积分兑换
	 */
	public void delInte(){
		String id =getPara("id");
		String flag="";
		try {
			Integration integration=new Integration();
			integration.set("id", id);
			integration.set("del_flag", "1");
			integration.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
}
