package com.qdum.llhb.sys.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.junit.Test;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.sys.model.ClassInfo;
import com.qdum.llhb.sys.model.Department;
import com.qdum.llhb.sys.model.Organization;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.model.UserLog;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.UserValidator;

@ControllerBind(controllerKey = "/sys/user")
@Before(FlashInterceptor.class)
public class UserController extends BaseController {
    /**
     * 用户列表
     */
    @RequiresPermissions("sys:user:view")
    public void index() {
        PageUtils pageUtils = getPageParameter();
        String where = " where " + User.DEL_FLAG + " = 0 ";

        if (pageUtils.getMap().get("loginName") != null && !"".equals(pageUtils.getMap().get("loginName").toString())) {
            where = where + " and u.login_name like'%" + pageUtils.getMap().get("loginName").toString().trim() + "%'";
        }
        if (pageUtils.getMap().get("name") != null && !"".equals(pageUtils.getMap().get("name").toString())) {
            where = where + " and u.name like '%" + pageUtils.getMap().get("name").toString().trim() + "%' ";
        }
        if (pageUtils.getMap().get("type") != null && !"".equals(pageUtils.getMap().get("type").toString())) {
            where = where + " and EXISTS(SELECT id FROM sys_dict d WHERE d.value = u.type  and d.type='user_type' and d.value ="
                    + pageUtils.getMap().get("type") + ")";
        }
        if (pageUtils.getMap().get("onState") != null && !"".equals(pageUtils.getMap().get("onState").toString())) {
            where = where + " and EXISTS(SELECT id FROM sys_dict d WHERE d.value = u.on_state  and d.type='user_state' and d.value ="
                    + pageUtils.getMap().get("onState") + ")";
        }
        if (pageUtils.getMap().get("phone") != null && !"".equals(pageUtils.getMap().get("phone").toString())) {
            where = where + " and EXISTS(SELECT id FROM sys_person p WHERE p.user_id = u.id  and p.phone LIKE '%"
                    + pageUtils.getMap().get("phone") + "%')";
        }
        pageUtils.initialize(User.dao.paginate(pageUtils.getPageNo(),
                pageUtils.getPageSize(), "select * ",
                " from sys_user u " + where + pageUtils.getOrderBySql() + " order by u.id desc"));
        if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {
            pageUtils.setPageNo(1);
            pageUtils.initialize(User.dao.paginate(pageUtils.getPageNo(),
                    pageUtils.getPageSize(), "select * ",
                    " from sys_user u " + where + pageUtils.getOrderBySql() + " order by u.id desc"));

        }
        setAttr("page", pageUtils);
        render("userList.jsp");
    }

    @RequiresPermissions("sys:user:view")
    public void student() {
        PageUtils pageUtils = getPageParameter();
        String where = " where " + User.DEL_FLAG + " = 0  and  u.type  = 3 ";

        if (pageUtils.getMap().get("loginName") != null && !"".equals(pageUtils.getMap().get("loginName").toString())) {
            where = where + " and u.login_name like'%" + pageUtils.getMap().get("loginName") + "%'";
        }
        if (pageUtils.getMap().get("name") != null && !"".equals(pageUtils.getMap().get("name").toString())) {
            where = where + " and u.name like '%" + pageUtils.getMap().get("name") + "%' ";
        }
        if (pageUtils.getMap().get("onState") != null && !"".equals(pageUtils.getMap().get("onState").toString())) {
            where = where + " and EXISTS(SELECT id FROM sys_dict d WHERE d.value = u.on_state  and d.type='user_state' and d.value ="
                    + pageUtils.getMap().get("onState") + ")";
        }
        if (pageUtils.getMap().get("phone") != null && !"".equals(pageUtils.getMap().get("phone").toString())) {
            where = where + " and EXISTS(SELECT id FROM stu_student  s WHERE s.user_id = u.id  and s.phone LIKE '%"
                    + pageUtils.getMap().get("phone") + "%')";
        }
        if (pageUtils.getMap().get("stuNo") != null && !"".equals(pageUtils.getMap().get("stuNo").toString())) {
            where = where + " and EXISTS(SELECT id FROM stu_student  s WHERE s.user_id = u.id  and s.student_no LIKE '%"
                    + pageUtils.getMap().get("stuNo") + "%')";
        }
        if (pageUtils.getMap().get("classname") != null && !"".equals(pageUtils.getMap().get("classname").toString())) {
            where = where + " and EXISTS(SELECT id FROM stu_student  s WHERE s.user_id = u.id  and s.class_id LIKE '%"
                    + pageUtils.getMap().get("classname") + "%')";
        }
        pageUtils.initialize(User.dao.paginate(pageUtils.getPageNo(),
                pageUtils.getPageSize(), "select * ",
                " from sys_user u " + where + pageUtils.getOrderBySql() + " order by u.id desc"));

        if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {

            pageUtils.setPageNo(1);
            pageUtils.initialize(User.dao.paginate(pageUtils.getPageNo(),
                    pageUtils.getPageSize(), "select * ",
                    " from sys_user u " + where + pageUtils.getOrderBySql() + " order by u.id desc"));

        }
        setAttr("classInfoList", ClassInfo.dao.find("select * from sys_class where del_flag = 0"));
        setAttr("page", pageUtils);
        render("userStudentList.jsp");
    }


    @RequiresPermissions("sys:user:view")
    public void form() {
        Long id = getParaToLong("id"); //用户的id
        List<Role> userRoles = new ArrayList<Role>();
        List<Role> roleList = new ArrayList<Role>();
        User user = null;
        userRoles = Role.dao.findAll();
        if (id != null && id != 0L) {
            user = User.dao.findById(id);
            roleList = Role.dao.findByUserId(user.getId());
            setAttr("roleList", roleList);
            Person person = Person.dao.findFirst("select * from sys_person where del_flag = 0 and user_id=" + id);
            if (person != null) {
                Integer usertype = user.getType();
                if (usertype != null) {
                    //查找到类型下的机构
                    setAttr("organizationList", Organization.dao.find("select * from sys_organization where del_flag = 0  and type = " + user.getType()));
                }
                if (person.getOrganizationId() != null) {
                    //获取机构下的部门
                    setAttr("collegeList", Department.dao.find("select * from sys_department where del_flag = 0 and parent_id =1 and organization_id = ?", person.getOrganizationId()));
                }
            }
        }

        setAttr("user", user);
        setAttr("userRoles", userRoles);
        createToken("token", 30 * 60);
        render("userForm.jsp");
    }

    @RequiresPermissions("sys:user:edit")
    @Before(UserValidator.class)
    public void save() {
        User loginUser = UserUtils.getUser();
        User user = getModel(User.class);
        String newPassword = getPara("newPassword");
        Long[] roleIdList = getParaValuesToLong("roleIdList");
        //创建用户
        if (user == null || user.getId() == null || user.getId() == 0L) {
            //加密算法
            user.setPassword(SystemServiceUtil.entryptPassword(newPassword));
            user.setDelFlag(0);
            user.setCreateBy(loginUser.getId());
            user.setCreateDate(new Date());
            user.setUpdateBy(loginUser.getId());
            user.setUpdateDate(new Date());
            user.save();
            Person person = new Person();
            person.setUserId(user.getId());
            person.setPhone(getPara("person.phone"));
            person.setEmail(getPara("person.email"));
            person.setOrganizationId(getParaToLong("person.organizationId"));
            person.setDepartmentId(getParaToLong("person.departmentId"));
            person.setRemarks(getPara("person.remarks"));
            person.setCreateBy(loginUser.getId());
            person.setCreateDate(new Date());
            person.setDelFlag(0);
            person.save();
            UserLog userLog = new UserLog();
            userLog.setUserId(user.getId());
            userLog.setLoginName(user.getLoginName());
            userLog.setPassword(SystemServiceUtil.entryptPassword(newPassword));
            userLog.setType(user.getType());
            userLog.setDispose("新增");
            String rl = "";
            for (int h = 0; h < roleIdList.length; h++) {
                Long rol = roleIdList[h];
                Role role = Role.dao.findById(rol);
                role.getName();
                rl += role.getName() + ",";
            }
            userLog.setRole(rl);
            userLog.setName(user.getName());
            userLog.setLoginIp(user.getLoginIp());
            userLog.setLoginDate(user.getLoginDate());
            userLog.setOnState(user.getOnState());
            userLog.setOrganizationId(getParaToLong("person.organizationId"));
            userLog.setDepartmentId(getParaToLong("person.departmentId"));
            userLog.setPhone(getPara("person.phone"));
            userLog.setUpdateBy(user.getUpdateBy());
            userLog.setUpdateDate(user.getUpdateDate());
            userLog.setRemarks(user.getRemarks());
            userLog.setDelFlag(0);
            userLog.save();
            addMessageSuccess("保存用户'" + user.getLoginName() + "'成功");
        } else {
            //修改用户
            User oldUser = User.dao.findById(user.getId());
            //修改了密码
            if (newPassword != null && !newPassword.trim().equals("")) {
                user.setPassword(SystemServiceUtil.entryptPassword(newPassword));
            } else {
                //没有修改密码使用原始密码
                user.setPassword(oldUser.getPassword());
            }
            user.setUpdateBy(loginUser.getId());
            user.setUpdateDate(new Date());
            user.update();
            if (user.getType() != null) {
                Person person = Person.dao.findFirst("select * from sys_person where del_flag = 0 and user_id=" + user.getId());
                person.setUserId(user.getId());
                person.setPhone(getPara("person.phone"));
                person.setEmail(getPara("person.email"));
                person.setOrganizationId(getParaToLong("person.organizationId"));
                person.setDepartmentId(getParaToLong("person.departmentId"));
                person.setRemarks(getPara("person.remarks"));
                person.setUpdateBy(loginUser.getId());
                person.setUpdateDate(new Date());
                person.update();
                UserLog userLog = new UserLog();
                userLog.setUserId(user.getId());
                userLog.setLoginName(user.getLoginName());
                userLog.setPassword(SystemServiceUtil.entryptPassword(newPassword));
                userLog.setType(user.getType());
                userLog.setDispose("修改");
                String rl = "";
                for (int h = 0; h < roleIdList.length; h++) {
                    Long rol = roleIdList[h];
                    Role role = Role.dao.findById(rol);
                    role.getName();
                    rl += role.getName() + ",";
                }
                userLog.setRole(rl);
                userLog.setName(user.getName());
                userLog.setLoginIp(user.getLoginIp());
                userLog.setLoginDate(user.getLoginDate());
                userLog.setOnState(user.getOnState());
                userLog.setOrganizationId(getParaToLong("person.organizationId"));
                userLog.setDepartmentId(getParaToLong("person.departmentId"));
                userLog.setPhone(getPara("person.phone"));
                userLog.setUpdateBy(user.getUpdateBy());
                userLog.setUpdateDate(user.getUpdateDate());
                userLog.setRemarks(user.getRemarks());
                userLog.setDelFlag(0);
                userLog.save();
            }
            addMessageSuccess("修改用户'" + user.getLoginName() + "'成功");
        }
        if (roleIdList != null && roleIdList.length > 0) {
            user.removeAllRole();
            user.addAllRole(roleIdList);
        }
        // 清除当前用户缓存
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.getCacheMap().clear();
        }
        if (user.getType() == null) {
            this.redirect("/sys/user/student");
        } else {
            this.redirect("/sys/user");
        }

    }

    public void delete() {
        Long id = getParaToLong("id");
        User loginUser = UserUtils.getUser();
        User user = null;
        if (id != null && id != 0L) {
            if (id == loginUser.getId()) {
                addMessageError("删除用户失败, 不允许删除当前用户");
            } else if (User.isAdmin(id)) {
                addMessageError("删除用户失败, 不允许删除超级管理员用户");
            } else {
                user = User.dao.findById(id);
                user.setDelFlag(1);
                user.setOnState(1);
                //user.setUpdateBy(loginUser.getId());
                user.setUpdateDate(new Date());
                user.update();
                Person person = Person.dao.findFirst("select * from sys_person where del_flag = 0 and user_id=" + id);
                person.setDelFlag(1);
                //person.setUpdateBy(loginUser.getId());
                person.setUpdateDate(new Date());
                person.update();
                addMessageSuccess("删除用户成功");
            }
        }
        redirect("/sys/user");
    }

    @RequiresUser
    public void checkLoginNameCal() throws Exception {
        String fieldId = getPara("fieldId");
        String loginName = java.net.URLDecoder.decode(getPara("fieldValue"), "UTF-8");
        Long id = getParaToLong("userId");
        String info = "";
        String regExp = "[\u4E00-\u9FA5]";
        if (id == null || "".equals(id)) {
            if (Pattern.compile(regExp).matcher(loginName).find()) {
                info = "[\"" + fieldId + "\",false,\"您输入的账号包含中文字符，请输入非中文字符！\"]";
            } else {
                if (User.dao.findByUsernameByAjax(loginName, id) != null) {
                    info = "[\"" + fieldId + "\",false,\"您输入的登录账户已经存在，请重新输入！\"]";
                } else {
                    info = "[\"" + fieldId + "\",true,\"\"]";
                }
            }
        } else {
            if (Pattern.compile(regExp).matcher(loginName).find()) {
                info = "[\"" + fieldId + "\",false,\"您输入的账号包含中文字符，请输入非中文字符！\"]";
            } else {
                if (User.dao.findByUsernameByAjax(loginName, id) != null) {
                    info = "[\"" + fieldId + "\",false,\"您输入的登录账户已经存在，请重新输入！\"]";
                } else {
                    info = "[\"" + fieldId + "\",true,\"\"]";
                }
            }
        }
        this.renderJson(info);
    }

    /**
     * 检查修改密码 输入的密码 与原始密码是否相同
     **/
    @RequiresUser
    public void checkPassword() {
        String fieldId = getPara("fieldId");
        String password = getPara("fieldValue");
        String info = "";
        User user = UserUtils.getUser();
        User users = User.dao.findById(user.getId());
        boolean passWord = SystemServiceUtil.validatePassword(password, users.getPassword());
        if (!passWord) {
            info = "[\"" + fieldId + "\",false,\"您输入密码与原始密码不一致，请重新输入！\"]";
        } else {
            info = "[\"" + fieldId + "\",true,\"\"]";
        }
        this.renderJson(info);
    }

    /**
     * 修改密码跳转
     **/
    @RequiresUser
    public void modifyPwdForm() {
        User User = UserUtils.getUser();
        setAttr("user", User);
        render("userModifyPwd.jsp");
    }

    /**
     * 修改密码
     **/
    @RequiresUser
    public void modifyPwd() {
        User Users = UserUtils.getUser();
        User loginuser = getModel(User.class);
        String newPassword = getPara("newPassword");
        loginuser.setPassword(SystemServiceUtil.entryptPassword(newPassword));
        loginuser.setUpdateBy(Users.getId());
        loginuser.setUpdateDate(new Date());
        loginuser.update();
        addMessageSuccess("修改密码成功");
        redirect("/sys/user/modifyPwdForm");
    }

    /**
     * 根据用户类型查找机构信息
     */
    public void getOrganizationtype() {
        Integer type = getParaToInt("type");
        List<Organization> organization = Organization.dao.find("select * from sys_organization where del_flag = 0 and type = " + type);
        renderJson(organization);
    }


    /**
     * 用户详情
     */
    @RequiresPermissions("sys:user:edit")
    public void details() {
        Object id = getPara("id");
        //用户表
        setAttr("user", User.dao.findById(id));
        render("userDetails.jsp");
    }

    /**
     * 获取变更停用状态的用户Id并修改
     */
    @RequiresPermissions("sys:user:edit")
    public void getChange() {
        Long id = getParaToLong("id");
        User user = User.dao.findById(id);

        user.setOnState(1);
        user.update();
        addMessageSuccess("所选用户已更改为停用状态");
        if (user.getType() == 3) {
            redirect("/sys/user/student");
        } else {
            redirect("/sys/user");
        }
    }

    /**
     * 获取变更恢复使用状态的用户Id并修改
     */
    @RequiresPermissions("sys:user:edit")
    public void getChangeOne() {
        Long id = getParaToLong("id");
        User user = User.dao.findById(id);
        user.setOnState(0);
        user.update();
        addMessageSuccess("所选用户已恢复正在使用状态");
        if (user.getType() == 3) {
            redirect("/sys/user/student");
        } else {
            redirect("/sys/user");
        }
    }


    /**
     * 用于读取全部数据，显示在部门选项框，用于进行部门选择
     */
    public void treeData() {

        User user = UserUtils.getUser();        //当期登录用户
        Long extId = getParaToLong("extId");
        Long extIdValue = this.getParaToLong("extIdValue");
        this.getResponse().setContentType("application/json; charset=UTF-8");
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Department> list = Department.dao.findByOrganizationIdAll(extIdValue);
        for (int i = 0; i < list.size(); i++) {
            Department e = list.get(i);
            if (extId == null || (extId != null && !extId.equals(e.getId()) && e.getParentIds().indexOf("," + extId + ",") == -1)) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParent() != null ? e.getParent().getId() : 0);
                map.put("name", e.getName());
                mapList.add(map);
            }
        }
        this.renderJson(mapList);
    }

    @Test
    public void test(){
    	String newPassword = "111111";
    	System.out.println(SystemServiceUtil.entryptPassword(newPassword));
    	
    	String password = "8b59a6f1f048236a6c8c878cd0c9be2fbafd2637abee4844f44e39ba";
    	System.out.println(SystemServiceUtil.validatePassword(newPassword, password));
    }
}
