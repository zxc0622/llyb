package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.Category;

@ControllerBind(controllerKey = "/ypcd/covered")
public class CloudCoveredColumnsController extends Controller{

	/**
	 * 栏目初始化
	 */
	public void coveredColumnsinit(){
		User user = UserUtils.getUser();
		List<Record> list4 =Basic.dao.findBasicId(user.getId());
		List<Record> list2 =Category.dao.findCategoryM();
		List<Record> list =Category.dao.findCategory();
		if(!(list4.isEmpty())){
			List<Record> list1=Category.dao.findCategoryId(Long.valueOf(list4.get(0).get("id").toString()));
			List<Record> list3=Category.dao.findCategoryMId(Long.valueOf(list4.get(0).get("id").toString()));
			setAttr("basic", list4.get(0));
			if(!(list1.isEmpty())){
				setAttr("categoryL", list1);
			}
			if(!(list3.isEmpty())){
				setAttr("categoryM", list3);
			}else{
				setAttr("categoryL", list);
				setAttr("categoryM", list2);
			}
		}else{
			setAttr("categoryL", list);
			setAttr("categoryM", list2);
		}
	   	List<Record> company =CompanyZl.dao.findCompanyR(user.getId());
		if(!(list.isEmpty())){
				setAttr("enterprise",company.get(0));
		}
		render("CloudCoveredColumns.jsp");
	}
	/**
	 * 栏目初始化M
	 */
	public void coveredColumnsinitM(){
		User user = UserUtils.getUser();
		List<Record> list =Category.dao.findCategory();
		List<Record> list2 =Category.dao.findCategoryM();
		List<Record> list4 =Basic.dao.findBasicId(user.getId());
		setAttr("basic", list4.get(0));
			setAttr("categoryL", list);
			setAttr("categoryM", list2);
		render("CloudCoveredColumns.jsp");
	}
	/**
	 * 保存
	 */
	public void saveCate(){
	    User user = UserUtils.getUser();
	    List<Record> list =Basic.dao.findBasicId(user.getId());
		String[] name =getParaValues("name");
		String[] sort =getParaValues("sort");
		String isShow =getPara("isShowValues");
		String[] identity =getParaValues("identity");
		String[] pageNum =getParaValues("pageNum");
		//String[] isShow=getParaValues("isShow");
		String[] categoryLId=getParaValues("categoryLId");
		String[] type=getParaValues("type");
		String[] isShows =isShow.split(",");
		String basicId=getPara("basicId");
		String basicWidth=getPara("basicWidth");
		if(basicId!=null&&!(basicId.equals(""))){
			if(basicWidth!=null&&!(basicWidth.equals(""))){
				String sql="update  cs_settings_basic set left_width='"+basicWidth+"' where id='"+basicId+"'";
				Db.update(sql);
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(!(list.isEmpty())){
			List<Record> list2 =Category.dao.findCategoryMId(Long.valueOf(list.get(0).get("id").toString()));
			if(list2.isEmpty()){
				for (int i = 0; i < pageNum.length; i++) {
					Category cate = new Category();
					cate.set("shop_id",Long.valueOf(list.get(0).get("id").toString()));
					cate.set("name", name[i]);
					cate.set("sort", sort[i]);
					cate.set("page_num", pageNum[i]);
					cate.set("identity", identity[i]);
					cate.set("is_show", isShows[i]);
					cate.set("type", type[i]);
					cate.set("create_date",sdf.format(new Date()));
					cate.save();
				}
			}else{
				for (int i = 0; i < pageNum.length; i++) {
					Category cate = new Category();
					cate.set("id", categoryLId[i]);
					cate.set("name", name[i]);
					cate.set("sort", sort[i]);
					cate.set("page_num", pageNum[i]);
					cate.set("identity", identity[i]);
					cate.set("is_show", isShows[i]);
					cate.set("update_date", sdf.format(new Date()));
					cate.update();
				}
			}
		}
		
		redirect("/ypcd/covered/coveredColumnsinit");
	}
}
