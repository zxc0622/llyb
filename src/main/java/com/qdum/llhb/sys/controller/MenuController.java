package com.qdum.llhb.sys.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.MenuValidator;

@ControllerBind(controllerKey="/sys/menu")
@Before(FlashInterceptor.class)
public class MenuController extends BaseController {

	@RequiresPermissions("sys:menu:view")
	public void index() {
		User user = UserUtils.getUser();		//当期登录用户
		List<Menu> list = Lists.newArrayList();
		List<Menu> sourcelist = new ArrayList<Menu>();
		if (user.isAdmin()) {
			sourcelist = Menu.dao.findAllList();
		} else {
			sourcelist = Menu.dao.findByUserId(user.getId());
		}
		Menu.sortList(list, sourcelist, 1L);
		setAttr("list", list);
		render("menuList.jsp");
	}
	
	@RequiresPermissions("sys:menu:view")
	public void list() {
		User user = UserUtils.getUser();		//当期登录用户
		List<Menu> list = Lists.newArrayList();
		List<Menu> sourcelist = new ArrayList<Menu>();
		if (user.isAdmin()) {
			sourcelist = Menu.dao.findAllList();
		} else {
			sourcelist = Menu.dao.findByUserId(user.getId());
		}
		Menu.sortList(list, sourcelist, 1L);
		setAttr("list", list);
		render("menuList.jsp");
	}

	@RequiresPermissions("sys:menu:view")
	public void form() {
		Long id = this.getParaToLong("id");
		Menu menu = null ; 
		if (id == null || id == 0L) {
			 menu = getModel(Menu.class);
			 if (menu.getParentId() == null) {
				menu.setParentId(1L);
			 }
		} else {
			 menu = Menu.dao.findById(id);
		}
		setAttr("menu", menu);
		render("menuForm.jsp");
	}
	
	@Before(MenuValidator.class)//表单验证
	@RequiresPermissions("sys:menu:edit")
	public void save() {
		User user = UserUtils.getUser();		//当期登录用户
		Menu menu = getModel(Menu.class);
		if (menu.getId() == null || menu.getId() == 0L) {
			menu.setDelFlag(0);
			menu.setCreateBy(user.getId());
			menu.setCreateDate(new Date());
			menu.setUpdateBy(user.getId());
			menu.setUpdateDate(new Date());
		} else {
			menu.setUpdateBy(user.getId());
			menu.setUpdateDate(new Date());
		}
		Menu parent = menu.getParent();
		menu.setParentIds(parent.getParentIds()+parent.getId()+",");
		Menu.dao.save(menu);
		addMessageSuccess("保存菜单'" + menu.getName() + "'成功");
		redirect("/sys/menu/");
	}
	
	@RequiresPermissions("sys:menu:edit")
	public void delete() {
		User user = UserUtils.getUser();
		Long id = this.getParaToLong("id");
		if (Menu.dao.isRoot(id)) {
			addMessageError( "删除菜单失败, 不允许删除顶级菜单或编号为空");
		} else {
			Menu menu = Menu.dao.findById(id);
			//删除所有下属
			List<Menu> menus = menu.getAllChildList();
			for ( int i=0; i<menus.size(); i++ ) {
				Menu menuItem = menus.get(i);
				menuItem.setDelFlag(1); 
				menuItem.setUpdateBy(user.getId());
				menuItem.setUpdateDate(new Date());
				menuItem.update();
			}
			menu.setUpdateBy(user.getId());
			menu.setUpdateDate(new Date());
			menu.setDelFlag(1);
			menu.update();
			addMessageSuccess( "删除菜单成功");
		}
		redirect("/sys/menu/");
	}

	@RequiresUser
	public void tree() {
		render("menuTree.jsp");
	}
	
	/**
	 * 批量修改菜单排序
	 */
	@RequiresPermissions("sys:menu:edit")
	public void updateSort() {
		User user = UserUtils.getUser();		//当期登录用户
		String[] ids = getParaValues("ids");
		Integer[] sorts = getParaValuesToInt("sorts");
    	int len = ids.length;
    	Menu[] menus = new Menu[len];
    	for (int i = 0; i < len; i++) {
    		menus[i] = Menu.dao.findById(NumberUtil.toLong(ids[i]));
    		menus[i].setSort(sorts[i]);
    		menus[i].setUpdateBy(user.getId());
    		menus[i].setUpdateDate(new Date());
    		Menu.dao.save(menus[i]);
    	}
    	addMessageSuccess( "更新菜单排序成功!");
		redirect("/sys/menu/");
	}
	
	@RequiresUser
	public void treeData() {
		User user = UserUtils.getUser();		//当期登录用户
		Long extId = getParaToLong("extId");
		this.getResponse().setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Menu> list = user.getMenuList();
		
		for (int i=0; i<list.size(); i++){
			Menu e = list.get(i);
			if (extId == null || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",") == -1)) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent()!=null?e.getParent().getId():0);
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		this.renderJson(mapList);
	}
}
