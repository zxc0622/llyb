package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class NewsClassfy extends Model<NewsClassfy>{

	/**
	 * 新闻分类实体
	 */
	private static final long serialVersionUID = 1L;
	public static NewsClassfy dao = new NewsClassfy();

	public List<Record> findNewsClassfy(String id){
		String sql ="SELECT"+
						" t. NAME,"+
						" t. id,"+
						" t.sort_order AS sortOrder,"+
						" t.type1,"+
						" t.type2,"+
						" s.label"+
						" 	FROM"+
						" cs_manage_news_category t"+
						" 	LEFT JOIN sys_dict s ON t.type2 = s."+
						" VALUE"+
						" 	AND s.del_flag = '0'"+
						" 	AND s.type = 'newslb_type'"+
						" WHERE"+
						" t.del_flag = '0'"+
						" AND t.shop_id = '"+id+"'";
		return Db.find(sql);
	}
}
