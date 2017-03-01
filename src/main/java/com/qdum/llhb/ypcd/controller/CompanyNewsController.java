package com.qdum.llhb.ypcd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Basic;
import com.qdum.llhb.ypcd.model.News;
import com.qdum.llhb.ypcd.model.NewsCategory;
import com.qdum.llhb.ypcd.model.NewsClassfy;
@ControllerBind(controllerKey = "/ypcd/news")
@Before(AdminInterceptor.class)
public class CompanyNewsController extends Controller{
	/**
	 * 审核中,未审核,已发布初始化
	 */
	public void companyNewsInit(){
	    User user = UserUtils.getUser();
	    String title=getPara("title");
	    String fenlei=getPara("fenlei");
	    setAttr("title", title);
	    setAttr("fenlei", fenlei);
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		String status =getPara("status");
		setAttr("status", status);
		if(!(list3.isEmpty())){
			Page<Record> list = News.dao.findNews(title,fenlei,getParaToInt(0, 1),8,status,Long.valueOf(list3.get(0).get("id").toString()));
			if(!(list.equals(""))||!(list.equals(null))){
				setAttr("NewsList",list.getList());
				setAttr("recordPage", list);
			}
			List<Record> list1 = NewsCategory.dao.findNewsCategory(list3.get(0).get("id").toString());
			if(!(list1.isEmpty())){
				setAttr("categoryList", list1);
			}
		}
		
		
		render("CompanyNews.jsp");
	}
	/**
	 * 批量删除新闻
	 */
	public void deleteNews(){
		String[] choose=getParaValues("choose");
		String status =getPara("statusV");
		if(choose!=null&&choose.length!=0){
			for (int i = 0; i < choose.length; i++) {
				News news=new News();
				news.set("id", choose[i]);
				news.set("del_flag", "1");
				news.update();
			}
		}
		redirect("/ypcd/news/companyNewsInit?status="+status+"");
	}
	/**
	 * 单条删除新闻
	 */
	public void delNews(){
		String id =getPara("id");
		String flag="";
		try {
			News news=new News();
			news.set("id", id);
			news.set("del_flag", "1");
			news.update();
			flag="0";
		} catch (Exception e) {
			flag="1";
		}
	
		renderJson(flag);
	}
	/**
	 *  添加新闻页面
	 */
	public void  companyNewsAdd(){
		String itemid=getPara("itemid");
		if (itemid!=""&&itemid!=null) {
			List<Record> list = News.dao.findNewsID(itemid);
			setAttr("companyNews", list.get(0));
		}
		setAttr("itemid", itemid);
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(!(list3.isEmpty())){
			List<Record> list1 = NewsCategory.dao.findNewsCategory(list3.get(0).get("id").toString());
			if(!(list1.isEmpty())){
				setAttr("categoryList", list1);
			}
		}
	
		
		render("CompanyNewsAdd.jsp");
	}
	/**
	 * 保存修改
	 */
	public void saveNews(){
		String itemid=getPara("id");
		String title=getPara("title");
		String newsDesc=getPara("newsDesc");
		String newsPic=getPara("newsPic");
		String category=getPara("category");
		String infoDesc=getPara("infoDesc");
		String infoAuthor=getPara("infoAuthor");
		String infoSrc=getPara("infoSrc");
		String infoUrl=getPara("infoUrl");
		String keyWords=getPara("keyWords");
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(!(list3.isEmpty())){
			if(itemid!=""&&itemid!=null){
				News news = new News();
				news.set("id",itemid);
				news.set("title", title);
				news.set("news_desc", newsDesc);
				news.set("news_pic", newsPic);
				news.set("category_id", category);
				news.set("info_desc", infoDesc);
				news.set("info_author", infoAuthor);
				news.set("info_src", infoSrc);
				news.set("info_url", infoUrl);
				news.set("key_words", keyWords);
				news.set("update_date",sdf.format(new Date()));
				news.set("sta", "1");
				news.update();
			}else{
				News news = new News();
				news.set("title", title);
				news.set("news_desc", newsDesc);
				news.set("news_pic", newsPic);
				news.set("category_id", category);
				news.set("info_desc", infoDesc);
				news.set("info_author", infoAuthor);
				news.set("info_src", infoSrc);
				news.set("info_url", infoUrl);
				news.set("key_words", keyWords);
				news.set("sta", "1");
				news.set("create_date",sdf.format(new Date()));
				news.set("shop_id", list3.get(0).get("id")==null?"":list3.get(0).get("id"));
				news.save();
			}
		}
		
		redirect("/ypcd/news/companyNewsInit?status=1");
	}
	/**
	 * 新闻分类初始
	 */
	public void newsClassification(){
		List<Dict> list =Dict.dao.getDictsByType("newslb_type");
		setAttr("newslb", list);
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(!(list3.isEmpty())){
			List<Record> list2 =NewsClassfy.dao.findNewsClassfy(list3.get(0).get("id").toString());
			if(!(list2.isEmpty())){
				setAttr("NewsClass", list2);
			}
		}
		
		
		render("NewsClassification.jsp");
	}
	/**
	 * 保存或更新新闻分类
	 */
	public void saveNewsClass(){
		String[] newsId =getParaValues("newsId");
		String[] sortOrder =getParaValues("sortOrder");
		String[] newsName =getParaValues("newsName");
		String[] type2 =getParaValues("type2");
		String[] type1 =getParaValues("type1");
		
		String sortNum =getPara("sortNum");
		String news =getPara("news");
		String type3 =getPara("type3");
		String type4 =getPara("type4");
		
		String boxValues =getPara("boxValues");
		String[] boxVal =boxValues.split(",");
		User user = UserUtils.getUser();
		List<Record> list3 =Basic.dao.findBasicId(user.getId());
		if(newsId!=null&&newsId.length!=0){
			for(int i=0;i<newsId.length;i++){
			if(boxVal[i].equals("1")){
				NewsClassfy newsClassfy =new NewsClassfy();
				newsClassfy.set("id", newsId[i]);
				newsClassfy.set("del_flag", "1");
				newsClassfy.update();
			}else{
				NewsClassfy newsClassfy =new NewsClassfy();
				newsClassfy.set("id", newsId[i]);
				newsClassfy.set("sort_order", sortOrder[i]);
				newsClassfy.set("name", newsName[i]);
				newsClassfy.set("type1", type1[i]);
				newsClassfy.set("type2", type2[i]);
				newsClassfy.set("shop_id", list3.get(0).get("id"));
				newsClassfy.update();
			}	
			
			}
		}
		if(news!=""&&news!=null){
			if(!(list3.isEmpty())){
				NewsClassfy newsClassfy =new NewsClassfy();
				newsClassfy.set("sort_order",sortNum );
				newsClassfy.set("name", news);
				newsClassfy.set("type1", type3);
				newsClassfy.set("type2", type4);
				newsClassfy.set("shop_id", list3.get(0).get("id"));
				newsClassfy.save();
			}
		}
		redirect("/ypcd/news/newsClassification");
	}
}
