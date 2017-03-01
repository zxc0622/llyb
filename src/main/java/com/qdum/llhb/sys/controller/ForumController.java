package com.qdum.llhb.sys.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.ForumBoard;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.DictPcrValidator;
import com.qdum.llhb.sys.validator.ForumValidator;

/**
 * 论坛板块管理
 * @author zhaoyl
 * @time 2016年1月25日15:20:16
 * 
 * */

@ControllerBind(controllerKey="/sys/forum")
public class ForumController extends BaseController {
	@SuppressWarnings("static-access")
	/**
	 * 列表初始化
	 */
    public void index() {
    	List<ForumBoard> list = Lists.newArrayList();
		List<ForumBoard> forumList = ForumBoard.dao.getAll();
		ForumBoard.dao.sortList(list, forumList, 0L);
		setAttr("list",list);	 
    	render("forumBoardList.jsp");
    }
    /**
     * 表单初始化
     */
    public void form() {
        Long id = getParaToLong("id");
        ForumBoard create;
        if ( id == null || id == 0L) {
        	create = getModel(ForumBoard.class,"create");
        } else {
        	create = ForumBoard.dao.findById(id);
        }
        if(create!=null&&!(create.equals(""))){
        	  setAttr("create", create	);
        }else{
        	 setAttr("create", "");
        }
        setAttr("id",id);
        	 
        render("forumForm.jsp");
    }
    /**
     * 上级菜单展示
     */
    @RequiresUser
    public void treeData() {
        getResponse().setContentType("application/json; charset=UTF-8");
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<ForumBoard> list = ForumBoard.dao.getAll();
        for (ForumBoard e : list) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId() != null ? e.getParentId() : 0);
                map.put("name", e.getBoardName());
                mapList.add(map);
        }
        this.renderJson(mapList);
    }
    
    @Before(ForumValidator.class)//表单验证
    public void save() {
        User user = UserUtils.getUser();
        ForumBoard create = getModel(ForumBoard.class,"create");
        if (create.getId() == null || create.getId() == 0L) {
        	if(create.getParentId()==null){
        		create.setParentId(0L);
        	}
        	create.setCreateBy(user.getId());
        	create.setCreateDate(new Date());
        	create.setUpdateBy(user.getId());
        	create.setUpdateDate(new Date());
        	create.save();
        	
        } else {
        	create.setUpdateBy(user.getId());
        	create.setUpdateDate(new Date());
        	create.update();
        }
        
        addMessageSuccess("保存类别'" + create.getBoardName() + "'成功");
        redirect("/sys/forum");
    }
  
    public void delete() {
        Long id = getParaToLong("id");
        if (id != null && id.equals(0L)) {
            addMessageError("删除区域失败, 不允许删除顶级区域");
        } else {
        	ForumBoard.dao.deleteBoard(id);
            addMessageSuccess("删除区域成功");
        }
        redirect("/sys/forum");
    }
}
