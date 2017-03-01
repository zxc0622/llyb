package com.qdum.llhb.sys.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.flash.FlashInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.DictValidator;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import java.util.Date;

/**
 * 字典Controller
 *
 * @author ThinkGem
 * @version 2013-3-23
 */

@ControllerBind(controllerKey = "/sys/dict")
@Before(FlashInterceptor.class)
public class DictController extends BaseController {
    /**
     * 字典列表
     */
    public void index() {
        PageUtils pageUtils = getPageParameter();
        String where = " where " + Dict.DEL_FLAG + " = '0' ";
        if (pageUtils.getMap().get("type") != null && !"".equals(pageUtils.getMap().get("type").toString())) {
            where += " and type='" + pageUtils.getMap().get("type") + "' ";
        }
        if (pageUtils.getMap().get("description") != null && !"".equals(pageUtils.getMap().get("description").toString())) {
            where += " and description like '%" + pageUtils.getMap().get("description") + "%' ";
        }
        pageUtils.initialize(Dict.dao.paginate(pageUtils.getPageNo(),
                pageUtils.getPageSize(), "select * ",
                " from sys_dict " + where + pageUtils.getOrderBySql()));

        // 判断上面初始化的page数据是否有数据
        // 如果没有数据就重置页码到第一页。
        if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) {
            pageUtils.setPageNo(1);
            pageUtils.initialize(Dict.dao.paginate(pageUtils.getPageNo(),
                    pageUtils.getPageSize(), "select * ",
                    " from sys_dict " + where + pageUtils.getOrderBySql()));

        }
        setAttr("page", pageUtils);
        setAttr("typeList", Dict.dao.getAllTypeList());
        render("dictList.jsp");
    }

    /**
     * 编辑 新建
     *
     * @throws Exception
     */
    @RequiresPermissions("sys:dict:view")
    public void form() throws Exception {
        Long id = getParaToLong("id");
        Dict dict = null;

        if (id == null || id == 0L) {
            dict = getModel(Dict.class);
        } else {
            dict = Dict.dao.findById(id);
        }
        String type = getPara("dict.type");
        if (type != null && !"".equals(type)) {
            dict.setType(new String(type.getBytes("ISO8859-1"), "UTF-8"));
        }
        setAttr("dict",dict);
        render("dictForm.jsp");
    }

    /**
     * 保存
     */
    @Before(DictValidator.class)//表单验证
    @RequiresPermissions("sys:dict:edit")
    public void save() {
        User user = UserUtils.getUser();
        Dict dict = getModel(Dict.class);

        if (dict.getId() == null || dict.getId() == 0L) {
            dict.setDelflag(0);
            dict.setCreateBy(user.getId());
            dict.setCreateDate(new Date());
            dict.setUpdateBy(user.getId());
            dict.setUpdateDate(new Date());
        } else {
            dict.setUpdateBy(user.getId());
            dict.setUpdateDate(new Date());
        }
        Dict.dao.save(dict);
        addMessageSuccess("保存字典'" + dict.getLabel() + "'成功");
        redirect("/sys/dict");
    }


    /**
     * 删除
     */
    @RequiresPermissions("sys:dict:edit")
    public void delete() {
        User user = UserUtils.getUser();
        Long id = getParaToLong("id");
        if (id != null) {
            Dict dict = Dict.dao.findById(id);
            dict.setDelflag(1);
            dict.setUpdateBy(user.getId());
            dict.setUpdateDate(new Date());
            dict.update();
            addMessageSuccess("删除字典成功");
        } else {
            addMessageError("删除字典失败！");
        }
        redirect("/sys/dict");
    }


}
