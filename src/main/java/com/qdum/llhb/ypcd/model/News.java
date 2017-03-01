package com.qdum.llhb.ypcd.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class News extends Model<News>{

	/**
	 *新闻实体
	 */
	private static final long serialVersionUID = 1L;
	public static News dao = new News();

	/**
	 * 查询审核信息
	 */
	public Page<Record> findNews(String title,String fenlei,int pageNumber,int pageSize,String sta,Long id){
		String sql ="";
			sql=	" FROM"+
					" cs_manage_news t"+
					" LEFT JOIN cs_manage_news_category s ON t.category_id = s.id"+
					" WHERE"+
					" t.shop_id = '"+id+"'"+
					" AND t.del_flag='0'"+
					" AND t.sta='"+sta+"'";
					if(title!=""&&title!=null){
					sql+=" and t.title like '%"+title+"%'";
					}
					if(!"0".equals(fenlei)&&fenlei!=null){
					sql+=" and t.category_id='"+fenlei+"'";
					}
					sql+=" order by t.create_date desc";
		return  Db.paginate(pageNumber, pageSize,"select s.NAME,t.id,t.title,DATE_FORMAT(t.create_date, '%Y-%m-%d') as createDate,t.page_view AS pageView",sql);
	}
	/**
	 * 根据所传ID 查询新闻信息
	 */
	public List<Record> findNewsID(String id){
		String sql="SELECT"+
					" *"+
					" FROM"+
					" cs_manage_news "+
					" where id='"+id+"'"+
					" and del_flag='0'"+
					" order by create_date desc";
		return Db.find(sql); 
	}
	/**
	 *首页- 根据所传ID 查询新闻信息
	 */
	public List<Record> findNewsSy(String id){
		String sql="SELECT"+
					" id,"+
					" shop_id as shopId,"+
					" 2 as shang,"+
					" title,"+
					" info_src AS infoSrc,"+
					" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
					" news_desc AS newsDesc,"+
					" news_pic AS newsPic"+
					" FROM"+
					" cs_manage_news "+
					" where id='"+id+"'"+
					" and del_flag='0'"+
					" order by create_date desc";
		return Db.find(sql); 
	}
	/**
	 * 上一篇，下一篇
	 * @param id
	 * @param bigId
	 * @param flag
	 * @return
	 */
	public List<Record> findNewsList(String id,String flag,String shopId){
		String sql="";
		if(flag.equals("1")){
			sql="("+
					" SELECT"+
							" 1 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id > "+id+""+
							" and shop_id='"+shopId+"'"+
							" and del_flag='0'"+
							" ORDER BY"+
						" id "+
							" LIMIT 1"+
						" )"+
					" UNION ALL"+
					"("+
					" SELECT"+
							" 2 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id = "+id+""+
						" and shop_id='"+shopId+"'"+
						" and del_flag='0'"+
							" ORDER BY"+
						" id DESC"+
							" LIMIT 1"+
						" )";
		}else if(flag.equals("0")){
			sql="("+
					" SELECT"+
							" 0 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id < "+id+""+
						" and shop_id='"+shopId+"'"+
						" and del_flag='0'"+
							" ORDER BY"+
						" id DESC"+
							" LIMIT 1"+
						" )"+
					" UNION ALL"+
					"("+
					" SELECT"+
							" 2 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id = "+id+""+
						" and shop_id='"+shopId+"'"+
						" and del_flag='0'"+
							" ORDER BY"+
						" id DESC"+
							" LIMIT 1"+
						" )";
		}else {
			sql="("+
					" SELECT"+
							" 0 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id < "+id+""+
						" and shop_id='"+shopId+"'"+
						" and del_flag='0'"+
							" ORDER BY"+
						" id DESC"+
							" LIMIT 1"+
						" )"+
					" UNION ALL"+
					"("+
					" SELECT"+
							" 2 AS shang,"+
							" id,"+
							" shop_id as shopId,"+
							" title,"+
							" info_src AS infoSrc,"+
							" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
							" news_desc AS newsDesc,"+
							" news_pic AS newsPic"+
							" FROM"+
						" cs_manage_news"+
							" WHERE"+
						" id = "+id+""+
						" and shop_id='"+shopId+"'"+
						" and del_flag='0'"+
							" ORDER BY"+
						" id DESC"+
							" LIMIT 1"+
						" )"+
					" UNION ALL"+	
					" ("+
						" SELECT"+
						" 1 AS xia,"+
						" id,"+
						" shop_id as shopId,"+
						" title,"+
						" info_src AS infoSrc,"+
						" DATE_FORMAT(create_date, '%Y-%m-%d') AS createDate,"+
						" news_desc AS newsDesc,"+
						" news_pic AS newsPic"+
						" FROM"+
							" cs_manage_news"+
							" WHERE"+
							" id > "+id+""+
							" and shop_id='"+shopId+"'"+
							" and del_flag='0'"+
							" ORDER BY"+
							" id"+
							" LIMIT 1"+
							" )";
		}
		return Db.find(sql); 
	}
	/**
	 * 根据所传ID 分页查询新闻信息
	 */
	public Page<Record> findPageNewsID(int pageNumber,int pageSize,String id){
		String sql=	" FROM"+
					" cs_manage_news "+
					" where shop_id='"+id+"'"+
					" and del_flag='0'"+
					" order by create_date desc";
		return Db.paginate(pageNumber, pageSize, "select id,title,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,news_desc as newsDesc,news_pic as newsPic,info_author as infoAuthor,info_src as infoSrc", sql); 
	}
	/**
	 * 根据所传ID 查询前7条新闻信息
	 */
	public List<Record> findPageNewsIDS(String id){
		String sql=	" select id,title,DATE_FORMAT(create_date, '%Y-%m-%d') as createDate,news_desc as newsDesc,news_pic as newsPic,info_author as infoAuthor,info_src as infoSrc FROM"+
					" cs_manage_news "+
					" where shop_id='"+id+"'"+
					" and del_flag='0'"+
					" order by create_date desc";
		return Db.find(sql); 
	}
	/**
	 * 查询店铺ID
	 */
	public List<Record> findId(String id){
		String sql ="select s.id from sys_company t"+
				" LEFT JOIN cs_settings_basic s "+
				" on t.user_id=s.user_id"+
				" and s.del_flag='0'"+
				" where t.id= ?"+
				" and t.del_flag='0'";
		return Db.find(sql,id);
	}
}
