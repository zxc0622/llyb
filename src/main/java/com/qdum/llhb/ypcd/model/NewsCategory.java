package com.qdum.llhb.ypcd.model;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;


public class NewsCategory extends Model<NewsCategory>{

	/**
	 * 新闻分类实体
	 */
	private static final long serialVersionUID = 1L;
	public static NewsCategory dao = new NewsCategory();


	public List<Record> findNewsCategory(String id){
		String sql ="select id,name from cs_manage_news_category"+
				" where shop_id='"+id+"'";
		return Db.find(sql);
	}
}
