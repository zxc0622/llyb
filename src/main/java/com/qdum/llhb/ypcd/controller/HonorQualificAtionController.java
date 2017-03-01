package com.qdum.llhb.ypcd.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.Honor;

@ControllerBind(controllerKey = "/ypcd/honor")
@Before(AdminInterceptor.class)
public class HonorQualificAtionController extends Controller{
	//private static final int pageSize = 8; //每页条数
	/**
	 * 添加证书初始页面
	 */
	public void honorQualification(){
		String id=getPara("id");
		setAttr("id", id);
		String shopId = getPara("shopId");
		setAttr("shopId",shopId);
		User user = UserUtils.getUser();
		if(id!=null&&!("".equals(id))){
			List<Record> list=Honor.dao.searchHonor(id,user.getId());
			if(!(list.isEmpty())){
				setAttr("honor", list.get(0));
			}
		}
		render("HonorQualificAtion.jsp");
	}
	/**
	 * 修改和添加证书
	 */
	public void honorSave(){
		String id=getPara("id");
		String infoTitle=getPara("infoTitle");
		String cerOrg=getPara("cerOrg");
		String startDateStr=getPara("startDate");
		Date startDate = null;
		String pastDateStr=getPara("pastDate");
		Date pastDate = null;
		String cerPic=getPara("cerPic");
		String cerDesc=getPara("cerDesc");
		User user = UserUtils.getUser();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			startDate = sdf.parse(startDateStr);
			if(pastDateStr!=null && !pastDateStr.equals("") && !pastDateStr.equals("undefined")){
				pastDate = sdf.parse(pastDateStr);
			}else{
				pastDateStr = "9999-12-31";
				pastDate = sdf.parse(pastDateStr);
			}
			
		} catch (ParseException e) {
			System.out.println(this.getClass()+" parm starDate or pastDate hava a error");
		}
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(id!=null && !id.equals("") && !id.equals("undefined")){
			Honor honor = Honor.dao.findById(id);
			honor.set("info_title", infoTitle);
			honor.set("cer_org", cerOrg);
			honor.set("start_date", startDate);
			honor.set("past_date", pastDate);
			honor.set("cer_pic", cerPic);
			honor.set("cer_desc", cerDesc);
			honor.set("sta", 1);//设置未审核中状态
			honor.set("update_by", user.getId());
			honor.set("update_date", date);
			honor.update();
		}else{
			long shopId = Basic.dao.findBasicId(user.getId()).get(0).getLong("id");
			Honor honor = new Honor();
			honor.set("shop_id", shopId);
			honor.set("info_title", infoTitle);
			honor.set("cer_org", cerOrg);
			honor.set("start_date", startDate);
			honor.set("past_date", pastDate);
			honor.set("cer_pic", cerPic);
			honor.set("cer_desc", cerDesc);
			honor.set("create_by", user.getId());
			honor.set("shop_id", list3.get(0).get("id").toString()==null?"":list3.get(0).get("id").toString());
			honor.set("create_date", date);
			honor.save();
		}
		redirect("/ypcd/honor/certificateAudite");
	}
	
	/**
	 *已发布
	 */
	public void certificateIssued(){
		int sta = 2;//初始化列表状态为审核通过
		int past = 0; //未过期
		String pageNumStr = getPara("pageNumber");
		setAttr("url","certificateIssued");//写入url地址（此方法名），以便复用
		int pageNumber = 1;
		if(pageNumStr!=null && !pageNumStr.equals("") && !pageNumStr.equals("undefined")){
			pageNumber = Integer.parseInt(pageNumStr);
		}
		User user = UserUtils.getUser();
		String infoTitle = getPara("infoTitle");
		setAttr("infoTitle",infoTitle);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> issuedList = Honor.dao.getCerByNameAndSta(getParaToInt(0,1), pageSize, user.getId(), sta, infoTitle,past);
		setAttr("certList",issuedList.getList());
		setAttr("recordPage",issuedList);
		render("Certificateissued.jsp");
	}
	/**
	 *审核 
	 */
	public void certificateAudite(){
		int sta = 1;//初始化列表状态为审核中
		int past = 2; //与是否过期无关
		String pageNumStr = getPara("pageNumber");
		setAttr("url","certificateAudite");//写入url地址，以便复用
		int pageNumber = 1;
		if(pageNumStr!=null && !pageNumStr.equals("") && !pageNumStr.equals("undefined")){
			pageNumber = Integer.parseInt(pageNumStr);
		}
		User user = UserUtils.getUser();
		String infoTitle = getPara("infoTitle");
		setAttr("infoTitle",infoTitle);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> auditeList = Honor.dao.getCerByNameAndSta(getParaToInt(0,1), pageSize, user.getId(), sta, infoTitle,past);
		setAttr("certList",auditeList.getList());
		setAttr("recordPage",auditeList);
		render("CertificateAudite.jsp");
	}
	/**
	 *未通过
	 */
	public void certificateNotPass(){
		int sta = 0;//初始化列表状态为未通过
		int past = 2; //与是否过期无关
		String pageNumStr = getPara("pageNumber");
		setAttr("url","certificateNotPass");//写入url地址，以便复用
		int pageNumber = 1;
		if(pageNumStr!=null && !pageNumStr.equals("") && !pageNumStr.equals("undefined")){
			pageNumber = Integer.parseInt(pageNumStr);
		}
		User user = UserUtils.getUser();
		String infoTitle = getPara("infoTitle");
		setAttr("infoTitle",infoTitle);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> notPassList = Honor.dao.getCerByNameAndSta(getParaToInt(0,1), pageSize, user.getId(), sta, infoTitle,past);
		setAttr("certList",notPassList.getList());
		setAttr("recordPage",notPassList);
		render("CertificateNotPass.jsp");
	}
	/**
	 *已过期
	 */
	public void certificatePasted(){
		int sta = 2;//初始化列表状态为审核通过
		int past = 1; //已过期
		String pageNumStr = getPara("pageNumber");
		setAttr("url","certificatePasted");//写入url地址（此方法名），以便复用
		int pageNumber = 1;
		if(pageNumStr!=null && !pageNumStr.equals("") && !pageNumStr.equals("undefined")){
			pageNumber = Integer.parseInt(pageNumStr);
		}
		User user = UserUtils.getUser();
		String infoTitle = getPara("infoTitle");
		setAttr("infoTitle",infoTitle);
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> pastedList = Honor.dao.getCerByNameAndSta(getParaToInt(0,1), pageSize, user.getId(), sta, infoTitle,past);
		setAttr("certList",pastedList.getList());
		setAttr("recordPage",pastedList);
		render("CertificatePasted.jsp");
	}
	/**
	 * 单个删除
	 */
	public void delCertificate(){
		String id =getPara("id");
		String url = getPara("url");
		setAttr("url",url);
		String flag="";
		try {
			Honor.dao.findById(id).set("del_flag", 1).update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
		renderJson(flag);
	}
	/**
	 * 批量删除
	 */
	public void delCertificateAll(){
		String[] choose=getParaValues("choose");
		String url = getPara("url");
		setAttr("url",url);
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				Honor.dao.findById(choose[i]).set("del_flag", "1").update();
			}
		}
		redirect("/ypcd/honor/"+url);
	}
}
