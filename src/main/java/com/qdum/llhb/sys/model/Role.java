package com.qdum.llhb.sys.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.NumberUtil;

public class Role extends Model<Role> {
    private static final long serialVersionUID = 1L;
    public static final Role dao = new Role();

    public static final String ID = "id";
    public static final String NAME = "name";
    public static final String ENNAME = "enname";
    public static final String ORGANIZATION_ID = "organization_id";    //机构Id
    public static final String DEPARTMENT_ID = "department_id";        //部门Id
    public static final String ROLE_TYPE = "role_type";
    public static final String DEL_FLAG = "del_flag";
    public static final String CREATE_BY = "create_by";            //创建人
    public static final String UPDATE_BY = "update_by";            //修改人
    public static final String CREATE_DATE = "create_date";        //创建人
    public static final String UPDATE_DATE = "update_date";        //修改人

    public void setId(Long id) {
        set(ID, id);
    }

    public Long getId() {
        return getLong(ID);
    }

    public String getEnname() {
        return get(ENNAME);
    }

    public void setEnname(String enname) {
        set(ENNAME, enname);
    }

    public String getRoleType() {
        return get(ROLE_TYPE);
    }

    public void setRoleType(String roleType) {
        set(ROLE_TYPE, roleType);
    }

    public void setOrganizationId(Long organizationId) {
        set(ORGANIZATION_ID, organizationId);
    }

    public Long getOrganizationId() {
        return getLong(ORGANIZATION_ID);
    }

    public void setDepartmentId(Long departmentId) {
        set(DEPARTMENT_ID, departmentId);
    }

    public Long getDepartmentId() {
        return getLong(DEPARTMENT_ID);
    }

    public void setName(String name) {
        set(NAME, name);
    }

    public String getName() {
        return get(NAME);
    }

    public void setDelFlag(int delFlag) {
        set(DEL_FLAG, delFlag);
    }

    public Integer getDelFlag() {
        return NumberUtil.toInteger(get(DEL_FLAG));
    }


    public Long getCreateBy() {
        return getLong(CREATE_BY);
    }

    public void setCreateBy(Long createBy) {
        set(CREATE_BY, createBy);
    }

    public Date getCreateDate() {
        return getDate(CREATE_DATE);
    }

    public void setCreateDate(Date createDate) {
        set(CREATE_DATE, createDate);
    }

    public Long getUpdateBy() {
        return getLong(UPDATE_BY);
    }

    public void setUpdateBy(Long createBy) {
        set(UPDATE_BY, createBy);
    }

    public Date getUpdateDate() {
        return getDate(UPDATE_DATE);
    }

    public void setUpdateDate(Date createDate) {
        set(UPDATE_DATE, createDate);
    }

    public boolean isAdmin() {
        return isAdmin(this.getId());
    }

    public static boolean isAdmin(Long id) {
        return id != null && (id.equals(1L) || id.equals(2L));
    }

    /**
     * 获取指定用户所拥有的角色
     *
     * @param userId
     * @return
     */
    public List<Role> findByUserId(Long userId) {
        List<Record> list = Db.find("select * from sys_user_role where user_id=?", userId);
        List<Role> rolelist = new ArrayList<Role>();
        for (int i = 0; i < list.size(); i++) {
            Role role = Role.dao.findById(list.get(i).getLong("role_id"));
            if (role != null && role.getDelFlag().equals(0)) {
                rolelist.add(role);
            }
        }
        return rolelist;
    }

    public List<Role> findAll() {
        String sql = "select * from sys_role where del_flag='0'";
        List<Role> list = Role.dao.find(sql);
        return list;
    }

    /**
     * 查找指定的角色
     *
     * @param name 要查找的角色名
     * @return
     */
    public Role findRoleByName(String name) {
        String sql = "select * from sys_role where name =? ";
        Role role = Role.dao.findFirst(sql, name);
        return role;
    }

    /**
     * 获取指定角色能操作的菜单ids
     *
     * @return
     */
    public String getMenuIds() {
        List<Record> menuList = Db.find("select menu_id from sys_role_menu where role_id=?", getId());
        String menuIds = "";
        for (int i = 0; i < menuList.size(); i++) {
            if (i == 0) {
                menuIds = menuIds + menuList.get(i).getLong("menu_id");
            } else {
                menuIds = menuIds + "," + menuList.get(i).getLong("menu_id");
            }
        }
        return menuIds;
    }

    /**
     * 角色中移出用户
     *
     * @param userId
     * @return
     */
    public Boolean outUserInRole(Long userId) {
        int count = Db.update("delete from sys_user_role where user_id=? and role_id=?", userId, getId());
        if (count > 0) {
            return true;
        }
        return false;
    }

    /**
     * 角色中移出用户
     *
     * @param userId
     * @param roleId
     * @return
     */
    public Boolean outUserInRole(Long userId, Long roleId) {
        int count = Db.update("delete from sys_user_role where user_id=? and role_id=?", userId, roleId);
        if (count > 0) {
            return true;
        }
        return false;
    }

    /**
     * 分配用户到当前角色
     *
     * @param userId
     * @return
     */
    public User assignUserToRole(Long userId) {
        Db.update("delete from sys_user_role where user_id = ? and role_id= ?", userId, getId());
        Db.update("INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (?, ?);", userId, getId());
        return User.dao.findById(userId);
    }


    /**
     * 分配用户到指定角色
     *
     * @param userId
     * @param roleId
     * @return
     */
    public User assignUserToRole(Long userId, Long roleId) {
        Db.update("delete from sys_user_role where user_id = ? and role_id= ?", userId, roleId);
        Db.update("INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (?, ?);", userId, roleId);
        return User.dao.findById(userId);
    }

    /**
     * 移除所有菜单关联
     */
    public void removeAllMenu() {
        Db.update("delete from sys_role_menu where role_id=? ", getId());
    }

    /**
     * 移除所有机构关联
     */
    public void removeAllOffice() {
        Db.update("delete from sys_role_office where  role_id=? ", getId());
    }

    /**
     * 批量加入菜单关联
     *
     * @param ids
     */
    public void addAllMenu(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            if (NumberUtil.toLong(ids[i]) != 0L) {
                Db.update("INSERT INTO `sys_role_menu` (`menu_id`, `role_id`) VALUES (?, ?);", NumberUtil.toLong(ids[i]), getId());
            }
        }
    }

    /**
     * 批量加入机构关联
     *
     * @param ids
     */
    public void addAllOffice(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            if (NumberUtil.toLong(ids[i]) != 0L) {
                Db.update("INSERT INTO `sys_role_office` (`office_id`, `role_id`) VALUES (?, ?);", NumberUtil.toLong(ids[i]), getId());
            }
        }
    }

    /**
     * 获取角色用户列表
     *
     * @return
     */
    public List<User> getUserList() {
        List<User> users = User.dao.find("select * from sys_user_role sur LEFT JOIN sys_user su on sur.user_id = su.id where sur.role_id = ? ", getId());
        return users;
    }

    /**
     * 保存角色
     *
     * @param role
     */
    public void save(Role role) {
        if (role.getId() == null || role.getId() == 0L) {
            role.save();
        } else {
            role.update();
        }
    }

    /**
     * 查找机构
     */
    public Organization getOrganization() {
        return Organization.dao.findById(getOrganizationId());
    }

    /**
     * 查找部门
     */
    public Department getDepartment() {
        return Department.dao.findById(getDepartmentId());
    }

    /**
     * 删除用户所有的企业角色
     *
     * @param userID 用户ID
     * @return
     */
    public Boolean deleteUserCompRoles(long userID) {
        String sql = "delete FROM sys_user_role where user_id = ? and (role_id = '15' or role_id = '16' or role_id = '17' or role_id = '18')";
        int count = Db.update(sql, userID);
        if (count > 0) {
            return Boolean.TRUE;
        }
        return Boolean.FALSE;
    }

}
