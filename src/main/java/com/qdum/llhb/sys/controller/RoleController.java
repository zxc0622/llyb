package com.qdum.llhb.sys.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.sys.model.Department;
import com.qdum.llhb.sys.model.Organization;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.RoleValidator;

/**
 * 角色Controller
 *
 * @author ThinkGem
 * @version 2013-5-15 update 2013-06-08
 */
@ControllerBind(controllerKey = "/sys/role")
@Before(FlashInterceptor.class)
public class RoleController extends BaseController {
    /**
     * 权限列表
     *
     * @param
     * @param
     * @return
     */
    @RequiresPermissions("sys:role:view")
    public void index() {
        PageUtils pageUtils = getPageParameter();
        String where = " where " + Role.DEL_FLAG + " = 0   ";
        if (pageUtils.getMap().get("name") != null && !"".equals(pageUtils.getMap().get("name").toString())) {
            where = where + " and name like '%" + pageUtils.getMap().get("name").toString().trim() + "%' ";
        }
        pageUtils.initialize(Role.dao.paginate(pageUtils.getPageNo(),
                pageUtils.getPageSize(), "select * ",
                " from sys_role " + where + pageUtils.getOrderBySql() + " order by id desc"));
        if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {
            pageUtils.setPageNo(1);
            pageUtils.initialize(Role.dao.paginate(pageUtils.getPageNo(),
                    pageUtils.getPageSize(), "select * ",
                    " from sys_role " + where + pageUtils.getOrderBySql() + " order by id desc"));

        }
        setAttr("page", pageUtils);
        render("roleList.jsp");
    }

    /**
     * 权限列表
     *
     * @param
     * @param
     * @return
     */
    @RequiresPermissions("sys:role:view")
    public void list() {
        User user = UserUtils.getUser();
        List<Role> list = null;
        if (user.isAdmin()) {
            list = Role.dao.findAll();
        } else {
            list = Role.dao.findByUserId(user.getId());
        }
        setAttr("list", list);
        render("roleList.jsp");
    }


    @RequiresPermissions("sys:role:view")
    public void form() {
        Long id = getParaToLong("id");
        User user = UserUtils.getUser();
        Role role = null;
        if (id != null) {
            role = Role.dao.findById(id);
            setAttr("organizationList", Organization.dao.find("select * from sys_organization where del_flag = 0  and type = 0"));
            if (role.getOrganizationId() != null) {
                //获取机构下的部门
                setAttr("collegeList", Department.dao.find("select * from sys_department where del_flag = 0 and parent_id =1 and organization_id = ?", role.getOrganizationId()));
            }
        }
        setAttr("organizationList", Organization.dao.find("select * from sys_organization where del_flag = 0  and type = 0"));
        setAttr("role", role);
        setAttr("menuList", user.getMenuList());
        createToken("token", 30 * 60);
        render("roleForm.jsp");
    }

    @Before(RoleValidator.class)
    @RequiresPermissions("sys:role:edit")
    public void save() {
        User user = UserUtils.getUser();
        Role role = getModel(Role.class);
        String menuIds = getPara("menuIds");

        if (role.getId() == null || role.getId() == 0L) {
            role.setDelFlag(0);
            role.setCreateBy(user.getId());
            role.setCreateDate(new Date());
            role.setUpdateBy(user.getId());
            role.setUpdateDate(new Date());
        } else {
            role.setUpdateBy(user.getId());
            role.setUpdateDate(new Date());
        }
        //保存角色
        Role.dao.save(role);
        //保存关联菜单
        role.removeAllMenu();
        role.addAllMenu(menuIds.split(","));

        addMessageSuccess("保存角色'" + role.getName() + "'成功");
        redirect("/sys/role/");
    }

    @RequiresPermissions("sys:role:edit")
    public void delete() {
        User user = UserUtils.getUser();
        Long id = getParaToLong("id");
        Role role = Role.dao.findById(id);
        if (Role.isAdmin(id)) {
            addMessageSuccess("删除角色失败, 不允许删除内置角色");
        } else {
            role.setUpdateBy(user.getId());
            role.setUpdateDate(new Date());
            role.setDelFlag(1);
            role.update();
            addMessageSuccess("删除角色成功");
        }
        redirect("/sys/role/");
    }

    @RequiresPermissions("sys:role:edit")
    public void assign() {
        Long id = getParaToLong("id");
        Role role = Role.dao.findById(id);
        List<User> users = User.dao.findByRoleId(id);
        setAttr("role", role);
        setAttr("users", users);
        render("roleAssign.jsp");
    }

    @RequiresPermissions("sys:role:view")
    public void usertorole() {
        Long id = getParaToLong("id");
        Role role = Role.dao.findById(id);
        setAttr("role", role);
        setAttr("selectIds", User.dao.getUserIds(role.getId()));
        render("selectUserToRole.jsp");
    }

    @RequiresPermissions("sys:role:edit")
    public void outrole() {
        Long userId = getParaToLong("userId");
        Long roleId = getParaToLong("roleId");
        Role role = Role.dao.findById(roleId);
        User user = User.dao.findById(userId);
        if (user.equals(UserUtils.getUser())) {
            addMessageSuccess("无法从角色【" + role.getName() + "】中移除用户【" + user.getName() + "】自己！");
        } else {
            Boolean flag = role.outUserInRole(userId);
            if (!flag) {
                addMessageSuccess("用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除失败！");
            } else {
                addMessageSuccess("用户【" + user.getName() + "】从角色【" + role.getName() + "】中移除成功！");
            }
        }
        redirect("/sys/role/assign?id=" + role.getId());

    }

    @RequiresPermissions("sys:role:edit")
    public void assignrole() {
        String[] idsArr = getPara("idsArr").split(",");
        Long id = getParaToLong("id");
        Role role = Role.dao.findById(id);
        StringBuilder msg = new StringBuilder();
        int newNum = 0;
        for (int i = 0; i < idsArr.length; i++) {
            User user = role.assignUserToRole(NumberUtil.toLong(idsArr[i]), id);
            if (null != user) {
                msg.append("<br/>新增用户【" + user.getName() + "】到角色【" + role.getName() + "】！");
                newNum++;
            }
        }
        addMessageSuccess("已成功分配 " + newNum + " 个用户" + msg);
        redirect("/sys/role/assign?id=" + role.getId());
    }

    @RequiresUser
    public void checkName(String oldName, String name) {
        String returnText = "false";
        if (name != null && name.equals(oldName)) {
            returnText = "true";
        } else if (name != null && Role.dao.findRoleByName(name) == null) {
            returnText = "true";
        }
        renderText(returnText);
    }

}
