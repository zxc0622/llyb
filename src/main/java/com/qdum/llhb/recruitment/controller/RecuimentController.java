package com.qdum.llhb.recruitment.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.infomaintain.model.InfoMaintAttachment;
import com.qdum.llhb.infomaintain.model.InfoMaintain;
import com.qdum.llhb.recruitment.model.RecuitmentInfomation;
import com.qdum.llhb.sys.model.Area;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.DictUtils;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.zixun.controller.ZiXunController;
import org.apache.commons.lang.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * 招聘信息
 * Created by Zhouxiang on 2016/8/19.
 */
@ControllerBind(controllerKey = "/infomaintain/recuitment")
@Before(AdminInterceptor.class)
public class RecuimentController extends Controller {
    public void index() {
        User user = UserUtils.getUser();
        int pageSize = 8;
        String pageSizeStr = getPara("pageSize");
        setAttr("pageSize", pageSizeStr);
        if (pageSizeStr != null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")) {
            pageSize = Integer.parseInt(pageSizeStr);
        }
        List<Dict> dictList = Dict.dao.getDictsByType("new_type");
        setAttr("dictList", dictList);
        String type = getPara("type");
        setAttr("type", type);
        String title = getPara("title");
        setAttr("title", title);

        Page<Record> infoPage = RecuitmentInfomation.dao.getRecuPage(user.getId(), getParaToInt(0, 1), pageSize);
        if (StringUtils.isNotBlank(title)) {
            infoPage = RecuitmentInfomation.dao.getByJobName(user.getId(), title, getParaToInt(0, 1), pageSize);
        }
        if (infoPage != null) {
            setAttr("infoList", infoPage.getList());
            setAttr("recordPage", infoPage);
        }

        renderJsp("recuitmentinfomation.jsp");
    }

    public void add() {
        String id = getPara("id");
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            Record info = RecuitmentInfomation.dao.getById(id);
            setAttr("info", info);
            //获取附件列表
            List<Record> infoAttachList = InfoMaintAttachment.dao.getAttachmentById(id);
            setAttr("infoAttachList", infoAttachList);
        }

        List<Area> provinceList = Area.dao.getChildList("0,1,");
        setAttr("provinceList", provinceList);
        render("recuInfoAdd.jsp");
    }

    /*删除选择的项*/
    public void delete() {
        String temp = getPara("ids");
        temp = temp.substring(0, temp.length() - 1);
        String[] ids = temp.split(",");
        boolean isDelete = false;
        if (ids != null && ids.length > 0) {
            isDelete = RecuitmentInfomation.dao.isDelete(ids, UserUtils.getUser().getId());
        }
        if (isDelete) {
            renderJson(true);
        } else {
            renderJson(false);
        }
    }


    /*提交*/
    public void submit() {
        String id = getPara("id");

        RecuitmentInfomation info = new RecuitmentInfomation();
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            info = RecuitmentInfomation.dao.findById(id);
        } else {
            //info.set("id", UUID.randomUUID().toString());
        }
        // 设置工资
        String salary;
        String salary1 = getPara("salary1");
        String salary2 = getPara("salary2");
        String salary3 = getPara("salary3");
        if("面议".equals(salary3)){
            salary = salary3;
        }else{
            salary = salary1 + "-" + salary2;
        }
        info.set("position", getPara("job_name"));
        info.set("company_name", getPara("company_name"));
        info.set("dept_name", getPara("dept_name"));
        info.set("person_number", getPara("person_number"));
        info.set("qualifications", getPara("qualifications"));
        info.set("work_exp", getPara("work_exp"));
        info.set("salary", salary);
        info.set("salary_unit", getPara("salary_unit"));
        info.set("hr_email", getPara("hr_email"));
        info.set("company_href", getPara("company_href"));
        info.set("hr_desc", getPara("content"));
        info.set("prov_id", getPara("prov_id"));
        info.set("city_id", getPara("city_id"));

        if (id != null && !id.equals("") && id.matches("[0-9]+")) {//更新
            info.set("update_by", UserUtils.getUser().getId());
            info.set("update_date", new Date());
            info.update();
        } else {//添加
            info.set("create_by", UserUtils.getUser().getId());
            info.set("create_date", new Date());
            info.save();
        }
        redirect("/infomaintain/recuitment");
    }


    public void preview() {
        setAttr("id", getPara("id"));
        setAttr("job_name", getPara("job_name"));
        setAttr("company_name", getPara("company_name"));
        setAttr("dept_name", getPara("dept_name"));
        setAttr("person_number", getPara("person_number"));

        String prov_id = getPara("prov_id");
        String city_id = getPara("city_id");
        setAttr("prov_id", prov_id);
        setAttr("city_id", city_id);
        String location = "";
        if (StringUtils.isNotBlank(prov_id)) {
            location = location + Area.dao.getNameById(prov_id).getName();
        }

        if (StringUtils.isNotBlank(city_id)) {
            Area city = Area.dao.getNameById(city_id);
            location = location + (city == null ? "" : city.getName());
        }

        setAttr("location", location);
        setAttr("qualifications", getPara("qualifications"));
        setAttr("work_exp", getPara("work_exp"));
        // 设置工资
        String salary;
        String salary1 = getPara("salary1");
        String salary2 = getPara("salary2");
        String salary3 = getPara("salary3");
        if("面议".equals(salary3)){
            salary = salary3;
        }else{
            salary = salary1 + "-" + salary2;
        }
        setAttr("salary1", salary1);
        setAttr("salary2", salary2);
        setAttr("salary3", salary3);
        setAttr("salary", salary);
        setAttr("salary_unit", getPara("salary_unit"));
        setAttr("hr_email", getPara("hr_email"));
        setAttr("company_href", getPara("company_href"));
        setAttr("content", getPara("content"));

        render("recuInfoPreview.jsp");
    }


    public void detail_v1() {
        String id = getPara();
        if (org.apache.commons.lang3.StringUtils.isBlank(id)) {
            id = getPara("id");
        }
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            //pageView + 1
            Long pageView = 1l;
            RecuitmentInfomation ri = RecuitmentInfomation.dao.findById(id);
            if (ri != null && ri.getLong("page_view") != null) {
                pageView = ri.getLong("page_view") + 1;
            }
            ri.set("page_view", pageView);
            ri.update();

            Record record = RecuitmentInfomation.dao.getById(id);

            String prov_id = String.valueOf(record.getLong("prov_id")).toString();
            String city_id = String.valueOf(record.getLong("city_id")).toString();
            String location = "";
            if (StringUtils.isNotBlank(prov_id)) {
                Area a = Area.dao.getNameById(prov_id);
                if(null != a){
                    location = location +  a.getName();
                }
            }

            if (StringUtils.isNotBlank(city_id)) {
                Area a = Area.dao.getNameById(city_id);
                if(null != a){
                    location = location +  a.getName();
                }
            }
            record.set("location", location);

            setAttr("info", record);

            renderJsp("recuInfoDetail.jsp");
        } else {
            render("/WEB-INF/views/error/404.jsp");
        }
    }


    public void search(){
        String type = "pe_hire";
        setAttr("type",type);

        int pageNumber = 1;
        String temp = getPara();
        if(temp!=null && !temp.equals("") && temp.matches("[0-9]+")){
            pageNumber = Integer.parseInt(temp);
        }
        int pageSize = 20;//每页条数
        String pageSizeStr = getPara("pageSize");
        setAttr("pageSize",pageSizeStr);

        String position = getPara("position");
        setAttr("position",position);
        if(pageSizeStr!=null && !"".equals(pageSizeStr) && pageSizeStr.matches("[0-9]+")){
            pageSize = Integer.parseInt(pageSizeStr);
        }
        Page<Record> infoPage = RecuitmentInfomation.dao.getRecuPageByPosition(pageNumber,pageSize,position);

        if(infoPage!=null){
            setAttr("infoList",infoPage.getList());
            setAttr("recordPage",infoPage);
        }

        List<AdImages> mediuAdImgList = AdImages.dao.getImgListByLabelID(ZiXunController.MID_AD_LABEL_ID);
        setAttr("mediuAdImgList",mediuAdImgList);
        List<Record> isPicList = InfoMaintain.dao.getInfoListByAttr("isPic");
        List<Record> isNewShowList = InfoMaintain.dao.getInfoListByAttr("isNewShow");
        setAttr("isPicList", ZiXunController.newList(isPicList,"isPic"));//资讯图片
        setAttr("isNewShowList",ZiXunController.newList(isNewShowList,"isNewShow"));//最新展会

        render("/WEB-INF/views/infomaintain/recuitment/recuInfoMore.jsp");
    }
    
    
    //================================================================
    public void detail() {
    	String id = getPara();
        if (org.apache.commons.lang3.StringUtils.isBlank(id)) {
            id = getPara("id");
        }
        if (id != null && !id.equals("") && id.matches("[0-9]+")) {
            //pageView + 1
            Long pageView = 1l;
            RecuitmentInfomation ri = RecuitmentInfomation.dao.findById(id);
            if (ri != null && ri.getLong("page_view") != null) {
                pageView = ri.getLong("page_view") + 1;
            }
            ri.set("page_view", pageView);
            ri.update();

            Record record = RecuitmentInfomation.dao.getById(id);

            String prov_id = String.valueOf(record.getLong("prov_id")).toString();
            String city_id = String.valueOf(record.getLong("city_id")).toString();
            String location = "";
            if (StringUtils.isNotBlank(prov_id)) {
                Area a = Area.dao.getNameById(prov_id);
                if(null != a){
                    location = location +  a.getName();
                }
            }

            if (StringUtils.isNotBlank(city_id)) {
                Area a = Area.dao.getNameById(city_id);
                if(null != a){
                    location = location +  a.getName();
                }
            }
            record.set("location", location);
            setAttr("info", record);
            
          //获取今日热门
            List<Record> today = InfoMaintain.dao.getTodayList(4);
            for(int i=0;i<today.size();i++){
    			if(today.get(i).get("content")!=null){
    				String con = today.get(i).get("content").toString();
    				today.get(i).set("content",DictUtils.delHTMLTag(con));
    			}
    		}
            setAttr("today",today);

            renderJsp("../../v2/infomaintain/recuitment/recuInfoDetail.jsp");
            
        } else {
            render("/WEB-INF/views/error/404.jsp");
        }
    }
    
    
}

