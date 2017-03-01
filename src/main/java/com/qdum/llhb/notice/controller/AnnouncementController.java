package com.qdum.llhb.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.backmana.model.SupplyInfo;
import com.qdum.llhb.notice.model.Notic;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.DictUtils;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey = "/notice")
@Before(AdminInterceptor.class)
public class AnnouncementController extends Controller {

    public void preview() {
        String ntTitile = getPara("ntTitile");
        String ntContent = getPara("ntContent");
        String noticId = getPara("noticId");
        setAttr("ntTitile", ntTitile);
        setAttr("ntContent", ntContent);
        setAttr("noticId", noticId);
        String pageType = getPara("pageType");
        if ("preview".equals(pageType)) {
            render("AnnouncementMaintenance.jsp");
        } else {
            render("preview.jsp");
        }
    }

    /**
     * 公告预览初始化
     */
    public void AnnouncementYL() {
        String ntTitile = getPara("ntTitile");
        String ntContent = getPara("ntContent");
        setAttr("ntTitile", ntTitile);
        setAttr("ntContent", ntContent);
        String noticId = getPara("noticId");
        if (noticId != null && !(noticId.equals(""))) {
            List<Record> list = Notic.dao.findNoticId(noticId);
            setAttr("noticList", list.get(0));
            setAttr("noticId", noticId);
        }
        render("AnnouncementPreview.jsp");
    }

    /**
     * 公告列表初始化
     */
    public void AnnouncementList() {
        String pageSize = getPara("pageSize");
        if (null == pageSize || "".equals(pageSize)) {
            pageSize = "8";
        }
        Page<Record> list = Notic.dao.findNotic(getParaToInt(0, 1), Integer.valueOf(pageSize));
        if (!(list.getList().isEmpty())) {
            setAttr("noticList", list.getList());
            setAttr("recordPage", list);
        }

        render("AnnouncementList.jsp");
    }

    /**
     * 公告维护初始化
     */
    public void AnnouncementWH() {
        String ntTitile = getPara("ntTitile");
        String ntContent = getPara("ntContent");
        setAttr("ntTitile", ntTitile);
        setAttr("ntContent", ntContent);
        String noticId = getPara("noticId");
        if (noticId != null && !(noticId.equals(""))) {
            List<Record> list = Notic.dao.findNoticId(noticId);
            setAttr("noticList", list.get(0));
            setAttr("noticId", noticId);
        }
        render("AnnouncementMaintenance.jsp");
    }

    /**
     * 公告发布
     */
    public void saveNotic() {
        String ntTitile = getPara("ntTitile");
        String ntContent = getPara("ntContent");
        String noticId = getPara("noticId");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        User user = UserUtils.getUser();
        if (noticId != null && !(noticId.equals(""))) {
            Notic notic = new Notic();
            notic.set("id", noticId);
            notic.set("nt_titile", ntTitile);
            notic.set("nt_content", ntContent);
            notic.set("update_date", sdf.format(new Date()));
            notic.update();
        } else {
            Notic notic = new Notic();
            notic.set("nt_titile", ntTitile);
            notic.set("nt_content", ntContent);
            notic.set("create_date", sdf.format(new Date()));
            notic.set("sta", "0");
            notic.set("create_by", user.getId());
            notic.save();
        }
        redirect("/notice/AnnouncementList");
    }

    /**
     * 批量删除公告
     */
    public void delNotics() {
        String[] choose = getParaValues("choose");
        if (choose != null && choose.length != 0) {
            for (int i = 0; i < choose.length; i++) {
                Notic notic = new Notic();
                notic.set("id", choose[i]);
                notic.set("del_flag", "1");
                notic.update();
            }
        }
        redirect("/notice/AnnouncementList");
    }

    /**
     * 单条删除公告
     */
    public void delNotic() {
        String id = getPara("id");
        String flag = "";
        try {
            Notic notic = new Notic();
            notic.set("id", id);
            notic.set("del_flag", "1");
            notic.update();
            flag = "0";
        } catch (Exception e) {
            flag = "1";
        }
        renderJson(flag);
    }

    /**
     * 公告详情
     */
    public void noticDetail_v1() {
        String id = getPara("id");
        List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
        if (!(re.isEmpty())) {
            setAttr("re", re);
        }
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            List<Record> infoList = Notic.dao.findNoticW();
            if (infoList != null) {
                /*取出本条信息、上一篇和下一篇*/
                for (int i = 0; i < infoList.size(); i++) {
                    String temp = infoList.get(i).get("id").toString();
                    if (id.equals(temp)) {
                        if (i != 0) {
                            setAttr("prevInfo", infoList.get(i - 1));
                        }
                        setAttr("info", infoList.get(i));
                        if (i != infoList.size() - 1) {
                            setAttr("nextInfo", infoList.get(i + 1));
                        }
                    }
                }
            }
            render("gzDetail.jsp");
        } else {
            render("/WEB-INF/views/error/404.jsp");
        }
    }

    /**
     * 公告一
     */
    public void noticOne() {
        List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
        if (!(re.isEmpty())) {
            setAttr("re", re);
        }
        render("noticOne.jsp");
    }

    /**
     * 公告四
     */
    public void noticFour() {
        List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
        if (!(re.isEmpty())) {
            setAttr("re", re);
        }
        render("noticFour.jsp");
    }

    /**
     * 公告二
     */
    public void noticTwo() {
        List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
        if (!(re.isEmpty())) {
            setAttr("re", re);
        }
        render("noticTwo.jsp");
    }

    /**
     * 公告三
     */
    public void noticThree() {
        List<Record> re = SupplyInfo.dao.getRecommends(10);//搜索
        if (!(re.isEmpty())) {
            setAttr("re", re);
        }
        render("noticThree.jsp");
    }
    
    //=============================================================
    /**
     * 新公告详情
     * wyp
     * 2017年1月20日10:23:43
     */
    public void noticDetail() {
        String id = getPara("id");
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            List<Record> infoList = Notic.dao.findNoticW();
            if (infoList != null) {
                /*取出本条信息、上一篇和下一篇*/
                for (int i = 0; i < infoList.size(); i++) {
                    String temp = infoList.get(i).get("id").toString();
                    if (id.equals(temp)) {
                        if (i != 0) {
                            setAttr("prevInfo", infoList.get(i - 1));
                        }
                        setAttr("info", infoList.get(i));
                        infoList.remove(i);
                        if (i != infoList.size() - 1) {
                            setAttr("nextInfo", infoList.get(i + 1));
                        }
                    }
                }
            }
            for(int i=0;i<infoList.size();i++){
    			if(infoList.get(i).get("ntContent")!=null){
    				String con = infoList.get(i).get("ntContent").toString();
    				infoList.get(i).set("ntContent",DictUtils.delHTMLTag(con));
    			}
    		}
            setAttr("infoList",infoList);
            
            render("../v2/notice/gzDetail.jsp");
        } else {
            render("/WEB-INF/views/error/404.jsp");
        }
    }
    
}
