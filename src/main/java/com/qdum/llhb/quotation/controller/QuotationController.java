package com.qdum.llhb.quotation.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.quotation.model.Quotation;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/infomaintain/quotation")
@Before(AdminInterceptor.class)
public class QuotationController extends Controller {
	//public static final int PAGE_SIZE = 8;
	public void index(){
		/*int pageNum = 1;
		String pageNumString = getPara("pageNum");
		if(pageNumString!=null && !pageNumString.equals("")){
			pageNum = Integer.parseInt(pageNumString);
		}*/
		int pageSize = 8;//默认每页条数
		String pageSizeStr = getPara("pageSize");
		setAttr("pageSize",pageSizeStr);
		if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		Page<Record> quoPage = Quotation.dao.getQuoPage(getParaToInt(0,1),pageSize);
		if(quoPage!=null){
			setAttr("quoList",quoPage.getList());
			setAttr("recordPage",quoPage);
		} 
		render("quoManage.jsp");
	}
	/*添加行情*/
	public void add(){
		final String type = "quotations_type";//资讯所属类别
		List<Dict> dictList = Dict.dao.getDictsByType(type);
		setAttr("dictList",dictList);
		String id = getPara("id");
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			Record quo = Quotation.dao.getById(id);
			quo.set("quo_content", quo.get("quo_content").toString().replaceAll("\r\n", ""));
			setAttr("quo",quo);
		}
		render("quoAdd.jsp");
	}
	/*提交*/
	public void submit(){
		String type = getPara("type");
		String title = getPara("title");
		String source = getPara("source");
		String smallImg = getPara("smallImg");
		String content = getPara("content");
		String sta = getPara("sta");
		String id = getPara("id");
		Quotation quo = new Quotation();
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){
			quo = Quotation.dao.findById(id);
		}
		quo.set("quo_type", type);
		quo.set("quo_title", title);
		quo.set("source", source);
		quo.set("small_img", smallImg);
		quo.set("quo_content", content);
		quo.set("sta", sta);
		if(id!=null && !id.equals("") && id.matches("[0-9]+")){//更新
			quo.set("update_by", UserUtils.getUser().getId());
			quo.set("update_date", new Date());
			quo.update();
		}else{//添加
			quo.set("create_by", UserUtils.getUser().getId());
			quo.set("create_date", new Date());
			quo.save();
		}
		redirect("/infomaintain/quotation");
	}
	//预览
	public void preview(){
		setAttr("id",getPara("id"));
		setAttr("type",getPara("type"));
		setAttr("title",getPara("title"));
		setAttr("source",getPara("source"));
		setAttr("smallImg",getPara("smallImg"));
		setAttr("content",getPara("content"));
		setAttr("date",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		render("quoPreview.jsp");
	}
	/*删除选择的项*/
	public void delete(){
		String temp = getPara("ids");
		temp = temp.substring(0,temp.length()-1);
		String[] ids = temp.split(",");
		boolean isDelete = false;
		if(ids!=null && ids.length>0){
			isDelete = Quotation.dao.isDelete(ids,UserUtils.getUser().getId());
		}
		if(isDelete){
			renderJson(true);
		}else{
			renderJson(false);
		}
	}
}
