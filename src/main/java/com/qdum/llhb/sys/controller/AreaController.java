package com.qdum.llhb.sys.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.AreaValidator;

/**
 * 区域Controller
 *
 * @author ThinkGem
 * @version 2013-5-15
 */
@ControllerBind(controllerKey = "/sys/area")
public class AreaController extends BaseController {
    @RequiresPermissions("sys:area:view")
    public void index() {
        List<Area> list = Lists.newArrayList();
        List<Area> sourcelist = Area.dao.findAllList();
        Area.sortList(list, sourcelist, 1L);
        setAttr("list", list);
        render("areaList.jsp");
    }

    @RequiresPermissions("sys:area:view")
    public void form() {
        Long id = getParaToLong("id");
        Area area;
        if ( id == null || id == 0L) {
            area = getModel(Area.class);
        } else {
            area = Area.dao.findById(id);
        }
        setAttr("area", area);
        render("areaForm.jsp");
    }

    @Before(AreaValidator.class)//表单验证
    @RequiresPermissions("sys:area:edit")
    public void save() {
        User user = UserUtils.getUser();
        Area area = getModel(Area.class);
        if (area.getId() == null || area.getId() == 0L) {
            area.setCreateBy(user.getId());
            area.setCreateDate(new Date());
            area.setUpdateBy(user.getId());
            area.setUpdateDate(new Date());
        } else {
            area.setUpdateBy(user.getId());
            area.setUpdateDate(new Date());
        }
        Area parent = area.getParent();
        area.setParentIds(parent.getParentIds() + parent.getId() + ",");
        Area.dao.save(area);
        addMessageSuccess("保存区域'" + area.getName() + "'成功");
        redirect("/sys/area");
    }

    @RequiresPermissions("sys:area:edit")
    public void delete() {
        Long id = getParaToLong("id");
        if (Area.isAdmin(id)) {
            addMessageError("删除区域失败, 不允许删除顶级区域");
        } else {
            Area.dao.deleteById(id);
            addMessageSuccess("删除区域成功");
        }
        redirect("/sys/area/");
    }

    @RequiresUser
    public void treeData() {
        getResponse().setContentType("application/json; charset=UTF-8");
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Area> list = Area.dao.findAllList();
        for (Area e : list) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId() != null ? e.getParentId() : 0);
                map.put("name", e.getName());
                mapList.add(map);
        }
        this.renderJson(mapList);
    }
    
}
