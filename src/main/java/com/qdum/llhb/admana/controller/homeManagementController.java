package com.qdum.llhb.admana.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.admana.model.AdLable;
import com.qdum.llhb.companyScore.CountScore;
import com.qdum.llhb.sys.utils.UserUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ControllerBind(controllerKey = "/infomaintain/management")
@Before(AdminInterceptor.class)
public class homeManagementController extends Controller{

	/**
	 * 首页广告管理初始化(旧版)
	 */
	public void homeManagementInit(){
		String type=getPara("type");
        if( null == type ||  type.equals("0") || "null".equals(type)){
            type = "S1";
        }
		setAttr("type", type);
		List<Record> list =AdLable.dao.searchManagement();
        //获取上方的Label列表
        List<Record> labelList = AdLable.dao.getAdsLabel();
		if(!(list.isEmpty())){
			setAttr("managementList", list);
		}
        setAttr("labelList",labelList);
		render("homeManagement.jsp");
	}
	/**
	 * 保存更改
	 */
	public void updateImage(){
		String[] imgId=getParaValues("imgId");
		String[] imgValue=getParaValues("imgValue");
		String[] showName=getParaValues("showName");
		String[] redirctHref=getParaValues("redirctHref");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < imgId.length; i++) {
			AdImages admImages = new AdImages();
			admImages.set("id", imgId[i]);
			admImages.set("pic_addr", imgValue[i]);
			admImages.set("update_date", sdf.format(new Date()));
			admImages.set("show_name", showName[i]);
			admImages.set("redirct_href", redirctHref[i]);
			admImages.update();
		}
		String type=getPara("type");
		redirect("/infomaintain/management/homeManagementInit?type="+type);
	}
	
	/**
	 * 首页广告管理（新版-2016年12月21日15:01:21）
	 */
	public void newHomePageManage(){
		String pageNum = getPara("pageNum");
		int pageNumber = 1;
		int pageSize = 15;
		if(pageNum != null && pageNum != ""){
			pageNumber = Integer.valueOf(pageNum);
		}
		Page<Record> advList = Db.paginate(pageNumber, pageSize,
				"select *", "from bm_index_reco_adv where del_flag=0");
		setAttr("advList",advList.getList());
		setAttr("totalPage",advList.getTotalPage());
		setAttr("pageNumber",pageNumber);
		
		render("newHomePageManage.jsp");
	}
	
	public void saveIndexAdv(){
		String json = getPara("json");
		long userId = UserUtils.getUser().getId();
		JSONArray ja = JSONArray.fromObject(json);
		Iterator<JSONObject> it = ja.iterator();
		while (it.hasNext()) {
			JSONObject ob = it.next();
			String id = ob.getString("id");
			String img = ob.getString("img");
			String url = ob.getString("url");
			String name = ob.getString("name");
			
			if(id != null && !id.equals("") && StringUtils.isNumeric(id)){
				String sql = "UPDATE bm_index_reco_adv SET pic_addr=?,"
						+ "redirct_href=?,show_name=?,update_by=?,"
						+ "update_date=NOW() WHERE id=? AND del_flag=0";
				Db.update(sql,img,url,name,userId,id);
			}else{
				String sql = "INSERT INTO bm_index_reco_adv (pic_addr,"
						+ " redirct_href, show_name, create_by, create_date,"
						+ " del_flag ) VALUES (?,?,?,?,NOW(),?);";
				Db.update(sql,img,url,name,userId,0);
			}
		}
		
		renderText("ok");
		
	}
	
	public void delPage(){
		String json = getPara("json");
		long userId = UserUtils.getUser().getId();
		JSONArray ja = JSONArray.fromObject(json);
		Iterator<JSONObject> it = ja.iterator();
		while (it.hasNext()) {
			JSONObject ob = it.next();
			String id = ob.getString("id");
			
			if(id != null && !id.equals("") && StringUtils.isNumeric(id)){
				String sql = "UPDATE bm_index_reco_adv SET del_flag=?, update_by=?,"
						+ "update_date=NOW() WHERE id=? AND del_flag=0";
				Db.update(sql,1,userId,id);
			}
		}
		
		renderText("ok");
	}
	
	
}
