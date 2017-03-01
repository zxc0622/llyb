package com.qdum.llhb.sys.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import java.util.Date;
import java.util.List;

public class Menu extends Model<Menu> {
	private static final long serialVersionUID = 1L;
	public static Menu dao = new Menu();
	
	public static final String ID			 = "id";
	public static final String PARENT_ID 	 = "parent_id";
	public static final String PARENT_IDS 	 = "parent_ids";
	public static final String NAME			 = "name";
	public static final String HREF			 = "href";
	public static final String TARGET		 = "target";
	public static final String ICON 		 = "icon";
	public static final String SORT 		 = "sort";
	public static final String SHOW 		 = "is_show";
	public static final String PERMISSION	 = "permission";
	public static final String DEL_FLAG		 = "del_flag";
	public static final String REMARKS		 = "remarks";
	public static final String CREATE_BY 	 = "create_by";		//创建人
	public static final String UPDATE_BY 	 = "update_by";		//修改人
	public static final String CREATE_DATE 	 = "create_date";	//创建人
	public static final String UPDATE_DATE 	 = "update_date";	//修改人
	
	
	public void setId(Long id) {
		set(ID, id);
	}
	public Long getId() {
		return getLong(ID);
	}
	
	public void setParentId(Long parentId) {
		set(PARENT_ID, parentId);
	}
	public Long getParentId() {
		return getLong(PARENT_ID);
	}
	
	public void setParentIds(String parentIds) {
		set(PARENT_IDS, parentIds);
	}
	public String getParentIds() {
		return get(PARENT_IDS);
	}
	
	public void setName(String name) {
		set(NAME, name);
	}
	public String getName() {
		return get(NAME);
	}
	
	public void setHref(String href) {
		set(HREF, href);
	}
	public String getHref() {
		return get(HREF);
	}
	
	public void setTarget(String target) {
		set(TARGET, target);
	}
	public String getTarget() {
		return get(TARGET);
	}
	
	public void setIcon(String icon) {
		set(ICON, icon);
	}
	public String getIcon() {
		return get(ICON);
	}
	
	public void setSort(Integer sort) {
		set(SORT, sort);
	}
	public Integer getSort() {
		return getInt(SORT);
	}
	
	public void setIsShow(String show) {
		set(SHOW, show);
	}
	public String getIsShow() {
		return get(SHOW);
	}
	
	public void setPermission(String permission) {
		set(PERMISSION, permission);
	}
	public String getPermission() {
		return get(PERMISSION);
	}
	
	public void setRemarks(String remarks) {
		set(REMARKS, remarks);
	}
	public String getRemarks() {
		return get(REMARKS);
	}
	
	public void setDelFlag(Integer delFlag) {
		set(DEL_FLAG, delFlag);
	}
	public Integer getDelFlag() {
		return getInt(DEL_FLAG);
	}
	
	public Long getCreateBy() {
		return getLong(CREATE_BY);
	}
	public void setCreateBy(Long createBy ) {
		set(CREATE_BY,createBy);
	}
	public Date getCreateDate() {
		return getDate(CREATE_DATE);
	}
	
	public void setCreateDate(Date createDate ) {
		set(CREATE_DATE,createDate);
	}
	
	public Long getUpdateBy() {
		return getLong(UPDATE_BY);
	}
	public void setUpdateBy(Long createBy ) {
		set(UPDATE_BY,createBy);
	}
	
	public Date getUpdateDate() {
		return getDate(UPDATE_DATE);
	}
	
	public void setUpdateDate(Date createDate ) {
		set(UPDATE_DATE,createDate);
	}
	
	/**
	 * 获取用户所有菜单
	 * @param userId
	 * @return
	 */
	public List<Menu> findByUserId(Long userId) {
		String sql = "SELECT DISTINCT(m.id), m.name, m.parent_id, m.parent_ids, m.href, m.target, m.icon, m.sort, m.is_show, m.permission, m.del_flag " +
			"FROM sys_menu AS m JOIN sys_role_menu AS rm ON m.id=rm.menu_id " +
			"LEFT JOIN sys_role AS r ON r.id=rm.role_id " +
			"LEFT JOIN sys_user_role AS ur ON ur.role_id = r.id " +
			"LEFT JOIN sys_user AS u ON u.id=ur.user_id " +
			"WHERE u.id=? AND m.del_flag='0' ORDER BY m.sort";
		List<Menu> list = Menu.dao.find(sql, userId);
		return list;
	}
	/**
	 * home.jsp页面中的菜单
	 */
	public List<Record> findHomeMenuByUserId(Long userId) {
		String sql = "SELECT DISTINCT m.id, m.name, m.parent_id AS parentId, m.href, m.target, m.icon, m.sort, m.permission " +
				"FROM sys_menu AS m JOIN sys_role_menu AS rm ON m.id=rm.menu_id  LEFT JOIN sys_role AS r ON " +
				"r.id=rm.role_id  LEFT JOIN sys_user_role AS ur ON ur.role_id = r.id  LEFT JOIN sys_user AS u " +
				"ON u.id=ur.user_id WHERE m.is_show='1'  AND u.id=? " +
				"AND m.del_flag='0' ORDER BY m.sort";
		return Db.find(sql, userId);
	}
	
	/**
	 * 获取用户一级菜单
	 * @param userId
	 * @return
	 */
	public List<Menu> findFirstMenus(Long userId) {
		String sql = "SELECT DISTINCT(m.id), m.name, m.parent_id, m.parent_ids, m.href, m.target, m.icon, m.sort, m.is_show, m.permission, m.del_flag " +
				"FROM sys_menu AS m JOIN sys_role_menu AS rm ON m.id=rm.menu_id " +
				"LEFT JOIN sys_role AS r ON r.id=rm.role_id " +
				"LEFT JOIN sys_user_role AS ur ON ur.role_id = r.id " +
				"LEFT JOIN sys_user AS u ON u.id=ur.user_id " +
				"WHERE u.id=? AND m.del_flag='0' and m.parent_id=1 ORDER BY m.sort";
		List<Menu> list = Menu.dao.find(sql, userId);
		return list;
	}
	
	
	/**
	 * 获取用户所有子菜单
	 * @return
	 */
	public List<Menu> getChildList(Long userId,Long parentId) {
		String sql = "SELECT DISTINCT(m.id), m.name, m.parent_id, m.parent_ids, m.href, m.target, m.icon, m.sort, m.is_show, m.permission, m.del_flag " +
				"FROM sys_menu AS m JOIN sys_role_menu AS rm ON m.id=rm.menu_id " +
				"LEFT JOIN sys_role AS r ON r.id=rm.role_id " +
				"LEFT JOIN sys_user_role AS ur ON ur.role_id = r.id " +
				"LEFT JOIN sys_user AS u ON u.id=ur.user_id " +
				"WHERE u.id=? AND m.del_flag='0' and m.parent_id=? ORDER BY m.sort";
		List<Menu> list = Menu.dao.find(sql, userId, parentId);
		return list;
	}
	
	/**
	 * 得到所有未删除的菜单(菜单管理中使用)
	 * @return
	 */
	public List<Menu> findAllList() {
		String sql = "select * from sys_menu where del_flag='0' order by sort";
		List<Menu> list = Menu.dao.find(sql);
		return list;
	}

	/**
	 * 不分级检索所有下级
	 * @return
	 */
	public List<Menu> getAllChildList() {
		List<Menu> menus = Menu.dao.find(" select * from sys_menu where del_flag='0' and parent_ids like ?  ","%,"+getId()+",%");
		return menus;
	}
	
	/**
	 * 检索所有下一级菜单
	 * @return
	 */
	public List<Menu> getChildList() {
		List<Menu> menus = Menu.dao.find(" select * from sys_menu where del_flag='0' and parent_id = ?  ",getId());
		return menus;
	}
	
	/**
	 * 查找当前菜单的父菜单
	 * @return
	 */
	public Menu getParent() {
		Menu menu = CacheKit.get("menuCache", getParentId());
		if (menu == null) {
			if (getParentId() != 0L) {
				menu = Menu.dao.findById(getParentId());
				CacheKit.put("menuCache", getParentId(), menu);
			}
		}
		return menu;
	}
	
	/**
	 * 保存菜单
	 * @param menu
	 */
	public void save(Menu menu) {
		if (menu.getId() == null) {
			menu.save();
		} else {
			menu.update();
		}
	}

	/**
	 * 是否为顶级菜单
	 * @param id
	 * @return
	 */
	public boolean isRoot(Long id) {
		return id != null && id.equals(1L);
	}

	/**
	 * 对菜单进行排序
	 * @param list
	 * @param sourcelist
	 * @param parentId
	 */
	public static void sortList(List<Menu> list, List<Menu> sourcelist, Long parentId) {
		for (int i=0; i<sourcelist.size(); i++) {
			Menu e = sourcelist.get(i);
			Long menuParentId = e.getParentId();
			if (menuParentId != null && menuParentId.equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++) {
					Menu child = sourcelist.get(j);
					Long childId = child.getParentId();
					if (childId != null && childId.equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	

}
