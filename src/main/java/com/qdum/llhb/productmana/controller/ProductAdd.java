package com.qdum.llhb.productmana.controller;

import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.UploadFileUtils;
import com.qdum.llhb.productmana.model.Product;
import com.qdum.llhb.productmana.model.ProductType;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 产品添加
 *
 * @author zhaoyl
 * @time 2015年10月18日11:01:52
 */
@ControllerBind(controllerKey = "/proManage/add")
@Before(AdminInterceptor.class)
public class ProductAdd extends Controller {
    public static final int sta_audit = 1;//设置商品状态为审核

    public void index() {
        //判断是否为企业,若不是,则跳转到企业信息页面维护企业信息 yaoyt@2016.3.11
        if (!UserUtils.isCompany()) {
            getSession().setAttribute("tip", "请先完善公司资料再进行商品管理");
            redirect("/hyzl/EnterpriseDataZero");
            return;
        }

        User user = UserUtils.getUser();
        String sid = getPara("id");
        List<Record> proList = null;
        if (sid != null && !sid.equals("")) {//通过商品的id，实现商品信息在添加页面显示
            long id = Long.parseLong(sid);
            proList = Product.dao.findAllInfo(user.getId(), id);
            for (Record e : proList) {
                setAttr("pro", e);
            }
        }
        setAttr("user", user);
        setAttr("productRootID", new ProductType().productRootID);//设置产品表格的根ID
        setAttr("provCityRootID", 1L);//设置省市表根ID
        render("productAdd.jsp");
    }

    /**
     * 选择商品类别
     */
    public void selectType() {
        long parentId = getParaToLong("parentId");
        List<ProductType> list = ProductType.dao.findProductTypeList(parentId);
        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (int i = 0; i < list.size(); i++) {
            ProductType e = list.get(i);
            if (e != null && ("service_type".equals(e.getType()) || "material_type".equals(e.getType()) || "equipment_type".equals(e.getType()))) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId());
                map.put("typeName", e.getTypeName());
                mapList.add(map);
            }
        }
        this.renderJson(mapList);
    }

    /**
     * 获取省市
     */
    public void selectProvCity() {
        Area.dao.setId(getParaToLong("id"));
        List<Area> list = Area.dao.getChildList();
        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (int i = 0; i < list.size(); i++) {
            Area e = list.get(i);
            if (e != null) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParentId());
                map.put("typeName", e.getName());
                mapList.add(map);
            }
        }
        this.renderJson(mapList);
    }

    /**
     * 时间快速选择
     */
    public void dateSelectLoad() {
        String type = "period_type";//周期时间类型
        List<Dict> list = Dict.dao.getDictsByType(type);

        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (int i = 0; i < list.size(); i++) {
            Dict e = list.get(i);
            if (e != null) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("value", e.getValue());
                map.put("typeName", e.getLabel());
                mapList.add(map);
            }
        }
        this.renderJson(mapList);
    }

    /**
     * 获取系统时间
     */
    public void getSysDate() {
        int addDate = Integer.parseInt(getPara("addDate"));
        Calendar c = Calendar.getInstance();
        String temp = "";
        if (addDate != 0) {
            int cYear = c.get(Calendar.YEAR);
            int cMonth = c.get(Calendar.MONTH) + 1;
            int cDate = c.get(Calendar.DATE) + addDate;
            temp = cYear + "-" + cMonth + "-" + cDate;
        } else {
            temp = "9999-12-31";
        }
        Date date = null;
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = sf.parse(temp);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String sdate = sf.format(date);
        renderText(sdate);
    }

    /**
     * 判断过期时间
     */
    public void pastDateIsRight() {
        String pastDate = getPara("pastDate");
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date temp = null;
        try {
            temp = sf.parse(pastDate);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        pastDate = sf.format(temp);
        if (pastDate.compareTo(sf.format(date)) > 0) {
            renderJson("true");
        } else {
            renderJson("false");
        }

    }

    /**
     * 计量单位选择
     */
    public void unitSelect() {
        String type = "unit_type";//计量单位类型
        List<Dict> list = Dict.dao.getDictsByType(type);
        List<Map<String, Object>> mapList = Lists.newArrayList();
        for (int i = 0; i < list.size(); i++) {
            Dict e = list.get(i);
            if (e != null) {
                Map<String, Object> map = Maps.newHashMap();
                map.put("value", e.getValue());
                map.put("typeName", e.getLabel());
                mapList.add(map);
            }
        }
        this.renderJson(mapList);
    }

    /**
     * 添加商品信息
     */
    public void productAdd() {
        long pageView = 0L;
        User user = UserUtils.getUser();
        String sid = getPara("id");
        Product product = null;
        if (sid != null && !sid.equals("")) {
            long id = Long.parseLong(sid);
            product = Product.dao.findById(id);
        } else {
            product = new Product();
        }
        // 设置
        product.setPageDesc(getPara("pageDesc"));
        product.setSeoKeyWords(getPara("seoKeyWords"));
        product.setTypeFirst(Long.parseLong(getPara("typeFirst")));
        product.setTypeSecond(Long.parseLong(getPara("typeSecond")));
        product.setTypeThird(Long.parseLong(getPara("typeThird")));
        product.setProName(getPara("proName"));
        product.setPageView(pageView);

        String unit_desc = getPara("myDanwei");
        if (unit_desc != null && unit_desc.trim().length() > 0) {
            product.set("unit_desc", unit_desc);//自定义单位
            product.setUnit(0L);//如果自定义单位,unit设为0
        } else {
            product.set("unit_desc", null);//自定义单位
            product.setUnit(Long.parseLong(getPara("unit")));
        }

        if (!getPara("provId").equals("") && !getPara("cityId").equals("")) {
            product.setProvId(Long.parseLong(getPara("provId")));
            product.setCityId(Long.parseLong(getPara("cityId")));
        }
        product.setProDesc(getPara("proDesc"));
        product.setPicOne(getPara("picOne"));
        product.setPicTwo(getPara("picTwo"));
        product.setPicThree(getPara("picThree"));
        //把字符串格式时间转换成date类时间
        String temp = getPara("pastDate");
        if (temp == null || temp.equals("") || temp.equals("0")) {
            temp = "9999-12-31";
        }
        Date curDate = new Date();
        SimpleDateFormat sftemp = new SimpleDateFormat("HH:mm:ss");
        temp = temp + " " + sftemp.format(curDate);
        Date pastDate = null;
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            pastDate = sf.parse(temp);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        product.setPastDate(pastDate);
        if (!getPara("lowPrice").equals("")) {
            product.setLowPrice(new BigDecimal(getPara("lowPrice")));
        } else {
            product.setLowPrice(null);
        }
        if (!getPara("highPrice").equals("")) {
            product.setHighPrice(new BigDecimal((getPara("highPrice"))));
        } else {
            product.setHighPrice(null);
        }
        if (!getPara("amount").equals("")) {
            product.setAmount(BigDecimal.valueOf(Double.parseDouble(getPara("amount"))));
        }

        if (sid != null && !sid.equals("")) {
            product.setUpdateBy(user.getId());
            product.setUpdateDate(curDate);
            product.setSta(sta_audit);
            product.update();
        } else {
            product.setCreateBy(user.getId());
            product.setCreateDate(curDate);
            product.save();
        }
        renderJson("true");
    }
}
