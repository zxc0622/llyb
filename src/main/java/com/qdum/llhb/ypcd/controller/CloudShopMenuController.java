package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.Menu;

@ControllerBind(controllerKey = "/ypcd/basic")
public class CloudShopMenuController extends Controller {
	/**
	 * 菜单初始页面
	 */
	public void shopMenuinit() {
		User user = UserUtils.getUser();
		List<Record> list3 = Basic.dao.findBasicId(user.getId());
		List<Record> list = Menu.dao.findMenu();
		if(!(list3.isEmpty())){
			List<Record> list2 = Menu.dao.findShouMenu(Long.valueOf(list3.get(0)
					.get("id").toString()));
			if (!(list2.isEmpty())) {
				setAttr("menu", list2);
			}else{
				setAttr("menu", list);
			}
		}else{
			setAttr("menu", list);
		}
		List<Record> company =CompanyZl.dao.findCompanyR(user.getId());
		if(!(list.isEmpty())){
				setAttr("enterprise",company.get(0));
		}
		render("CloudShopMenu.jsp");
	}

	/**
	 * 重置
	 */
	public void shopMenuinitM() {
		List<Record> list = Menu.dao.findMenu();
		setAttr("menu", list);
		render("CloudShopMenu.jsp");
	}

	/**
	 * 保存
	 */
	public void saveMenu() {
		User user = UserUtils.getUser();
		List<Record> list = Basic.dao.findBasicId(user.getId());
		String[] name = getParaValues("name");
		String[] sort = getParaValues("sort");
		String isShow = getPara("isShowValues");
		String[] identity = getParaValues("identity");
		String[] pageNum = getParaValues("pageNum");
		// String[] isShow=getParaValues("isShow");
		String[] menuId = getParaValues("menuId");
		String[] isShows = isShow.split(",");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(!(list.isEmpty())){
			List<Record> list2 = Menu.dao.findShouMenu(Long.valueOf(list.get(0)
					.get("id").toString()));
			if (list2.isEmpty()) {
				for (int i = 0; i < pageNum.length; i++) {
					Menu menu = new Menu();
					menu.set("shop_id",
							Long.valueOf(list.get(0).get("id").toString()));
					menu.set("name", name[i]);
					menu.set("sort", sort[i]);
					menu.set("page_num", pageNum[i]);
					menu.set("identity", identity[i]);
					menu.set("is_show", isShows[i]);
					menu.set("del_flag", 0);
					menu.set("create_date", sdf.format(new Date()));
					menu.save();
				}
			} else {
				for (int i = 0; i < pageNum.length; i++) {
					Menu menu = new Menu();
					menu.set("id", menuId[i]);
					menu.set("name", name[i]);
					menu.set("sort", sort[i]);
					menu.set("page_num", pageNum[i]);
					menu.set("identity", identity[i]);
					menu.set("is_show", isShows[i]);
					menu.set("update_date", sdf.format(new Date()));
					menu.update();
				}

			}
		}


		

		redirect("/ypcd/basic/shopMenuinit");
	}

}
