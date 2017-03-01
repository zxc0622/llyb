package com.qdum.llhb.sys.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresUser;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.sys.validator.DictPcrValidator;
@ControllerBind(controllerKey = "/sys/category")
public class CategoryController  extends BaseController{
	/**
	 * 列表初始化
	 */
    public void index() {
    	List<DictPcr> list = Lists.newArrayList();
    	String leibie=getPara("leibie");
    	 setAttr("leibie",leibie);
    	List<Record> record =DictPcr.dao.findeFu();
    	if(!(record.isEmpty())){
    		setAttr("fleibie", record);
    	}
    	if(leibie!=null&&!(leibie.equals("1"))){
    	        List<DictPcr> sourcelist = DictPcr.dao.findCategoryList(leibie);
    	        DictPcr.sortList(list, sourcelist, 0L);
    	        setAttr("list", list);
    	        setAttr("lbs",leibie);
        		 setAttr("list", list);
    	}else{
    		setAttr("list", list);
    	}
    		 
        render("categoryList.jsp");
    }
    /**
     * 表单初始化
     */
    public void form() {
        Long id = getParaToLong("id");
        String lbs =getPara("lbs");
        DictPcr create;
        if ( id == null || id == 0L) {
        	create = getModel(DictPcr.class,"create");
        } else {
        	create = DictPcr.dao.findById(id);
        }
        if(create!=null&&!(create.equals(""))){
        	  setAttr("create", create	);
        }else{
        	 setAttr("create", "");
        }
      
        setAttr("lbs", lbs);
        setAttr("id",id);
        if(lbs!=null&&!(lbs.equals("1"))){
        	setAttr("leibie", lbs);
        }else{
        	setAttr("leibie", "1");
        }
        	 
        render("categoryForm.jsp");
    }
    /**
     * 上级菜单展示
     */
    @RequiresUser
    public void treeData() {
        getResponse().setContentType("application/json; charset=UTF-8");
        List<Map<String, Object>> mapList = Lists.newArrayList();
        String lbs =getPara("lbs");
        List<DictPcr> list = DictPcr.dao.findCategoryList(lbs);
        for (DictPcr e : list) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId() != null ? e.getParentId() : 0);
                map.put("name", e.getName());
                mapList.add(map);
        }
        this.renderJson(mapList);
    }
    @Before(DictPcrValidator.class)//表单验证
    public void save() {
        User user = UserUtils.getUser();
        DictPcr create = getModel(DictPcr.class,"create");
        if (create.getId() == null || create.getId() == 0L) {
        	create.setCreateBy(user.getId());
        	create.setCreateDate(new Date());
        	create.setUpdateBy(user.getId());
        	create.setUpdateDate(new Date());
        } else {
        	create.setUpdateBy(user.getId());
        	create.setUpdateDate(new Date());
        }
        String id=getPara("id");
    	if(id!=null&&!(id.equals(""))){
    		 DictPcr parent = create.getParents(id,"1");
    	     create.setParentIds(parent.getParentIds() + parent.getId() + ",");
    	}else{
    		 DictPcr parent = create.getParents("","2");
    	     create.setParentIds(parent.getParentIds() + parent.getId() + ",");
    	}
       
        
        
        String lbs =getPara("lbs");
        create.setType(lbs);
        DictPcr.dao.save(create);
        String leibie =getPara("leibie");
        setAttr("leibie", leibie);
        addMessageSuccess("保存类别'" + create.getName() + "'成功");
        redirect("/sys/category?leibie="+leibie+"");
    }

    public void delete() {
        Long id = getParaToLong("id");
        if (DictPcr.isAdmin(id)) {
            addMessageError("删除区域失败, 不允许删除顶级区域");
        } else {
        	DictPcr.dao.deleteCreate(id);
            addMessageSuccess("删除区域成功");
        }
        String leibie =getPara("leibie");
        setAttr("leibie", leibie);
        redirect("/sys/category?leibie="+leibie+"");
    }
}
