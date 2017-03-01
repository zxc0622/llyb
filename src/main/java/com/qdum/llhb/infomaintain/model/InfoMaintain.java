package com.qdum.llhb.infomaintain.model;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

public class InfoMaintain extends Model<InfoMaintain> {
	/**
	 * @author zhaoyl
	 * 资讯维护
	 * 2015年11月18日16:11:26
	 */
	private static final long serialVersionUID = 1L;
	public static final InfoMaintain dao = new InfoMaintain();
	/**
	 * 通过ID获取model
	 */
	public Record getById(Object id){
		String sql = "select *from nm_news_detail where del_flag=0 and id="+id;
		return Db.findFirst(sql);
	}
	/**
	 * 获取资讯列表并分页
	 **/
	public Page<Record> getInfoPage(int pageNum, int pageSize, String type, String title){
		String select = "SELECT sd.label sd_label, nd.* ";
		String sqlExceptSelect = "from (SELECT @rownum:=@rownum+1 AS rownum, if(d.show_order IS NULL,0,1)ord_num, d.* "
										+ "from (SELECT @rownum:=0) r,(select *, IFNULL(update_date,create_date)time from nm_news_detail WHERE del_flag=0 ) AS d ORDER BY ord_num DESC, show_order, time DESC) nd "
								+ " LEFT JOIN (SELECT dict.* from sys_dict dict where dict.del_flag=0 and type='new_type') sd on sd.value = nd.new_type "
								+ " where nd.del_flag=0 ";
		if(type!=null && !type.equals("")){
			sqlExceptSelect+= "  and nd.new_type = '"+type+"'";
		}
		if(title!=null && !title.equals("")){
			sqlExceptSelect+= "  and nd.new_title like '%"+title+"%' ";
		}
		sqlExceptSelect	+=" ORDER BY ord_num DESC, show_order, time DESC";
		return Db.paginate(pageNum, pageSize, select, sqlExceptSelect);
	}
	/**
	 * 删除选中的元素
	 * @param
	 */
	public boolean isDelete(String[] ids,long userId){
		String sql = "update nm_news_detail set del_flag=1,update_by="+userId+",update_date='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"' where ";
		for (String s : ids) {
			sql +=" id="+s+" or";
		}
		sql = sql.substring(0, sql.lastIndexOf("or"));//删除多余的or
		int result = Db.update(sql);
        //更新成功返回更新条数
        return result > 0;
	}
	/**
	 *获取所有资讯列表 
	 *
	 */
	public List<Record> getInfoList(){
		String sql = "SELECT IFNULL(update_date,create_date)time, if(show_order IS NULL,0,1)ord_num, nd.id,nd.new_title "
				+ "from nm_news_detail nd WHERE nd.del_flag=0 and nd.sta=1 ORDER BY ord_num DESC, show_order, time DESC";
		return Db.find(sql);
	}

    public Record getInfoById(String id){
        String sql = "SELECT IFNULL(update_date,create_date)time, if(show_order IS NULL,0,1)ord_num, nd.* "
                + "from nm_news_detail nd WHERE nd.id = ? and nd.del_flag=0 and nd.sta=1 ORDER BY ord_num DESC, show_order, time DESC";
        return Db.findFirst(sql,id);
    }

    public List<Record> getInfoListByAttr(String attr){
		String sql = "SELECT IFNULL(update_date,create_date)time, if(show_order IS NULL,0,1)ord_num, nd.* "
				+ "from nm_news_detail nd WHERE nd.del_flag=0 and nd.sta=1 and nd." +attr+"=1 ORDER BY ord_num DESC, show_order, time DESC limit 0,20";
		return Db.find(sql);
	}

    public List<Record> getInfoListByType(String type){
        String sql = "SELECT IFNULL(update_date,create_date)time, if(show_order IS NULL,0,1)ord_num, nd.* "
                + "from nm_news_detail nd WHERE nd.del_flag=0 and nd.sta=1  and nd.new_type = ? ORDER BY ord_num DESC, show_order, time DESC limit 0,20";
        return Db.find(sql,type);
    }

	/***
	 *通过类别获取列表 
	 */
	public Page<Record> getInfoBytype(int pageNumber, int pageSize,String type){
		String select = "SELECT IFNULL(nd.update_date,nd.create_date)time, if(show_order IS NULL,0,1)ord_num, nd.*";
		String sqlExceptSelect = "from nm_news_detail nd "
				+ "WHERE nd.del_flag = 0 and nd.sta=1  and nd.new_type='"+type+"' ORDER BY ord_num DESC, show_order, time DESC";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}
	
	/**
	 * 首页-行业资讯 zhangxm
	 */
	public List<Record> getIndexInfo(String type,int pageSize){
		String sql="SELECT id,new_type as type,new_title as title,new_content as content,small_img as simg,"
				+ "IF(update_date IS NULL, create_date, update_date) AS time, if(show_order IS NULL,0,1) ord_num "
				+ "FROM nm_news_detail "
				+ "WHERE del_flag='0' AND sta='1' AND new_type='"+type+"'"
				+ " ORDER BY ord_num DESC, show_order, time DESC limit 0,"+pageSize;
		return Db.find(sql);
	}
	
	/**
	 * 首页-行业资讯wyp 2017年1月19日11:34:38
	 */
	public List<Record> getIndexInfo_v2(String type,int pageSize){
		String sql="SELECT id, new_title AS title, new_type AS type, new_content AS content,"
				+ " small_img AS simg, hold_place AS place, hold_time AS htime, create_date AS time"
				+ " FROM nm_news_detail"
				+ " WHERE del_flag = '0' AND sta = '1' AND new_type = '"+type+"'"
				+ " ORDER BY time DESC LIMIT 0,"+pageSize;
		return Db.find(sql);
	}
	
	/***
	 *通过标题获取列表 
	 */
	public Page<Record> getInfoByTitle(int pageNumber,int pageSize,String title){
		String select = "select nd.create_date time, if(show_order IS NULL,0,1)ord_num, nd.*";
		String sqlExceptSelect = "from nm_news_detail nd "
				+ "WHERE nd.del_flag = 0 and nd.sta=1  and nd.new_title LIKE '%"+title+"%' ORDER BY ord_num DESC, show_order, time DESC";
		return Db.paginate(pageNumber, pageSize, select, sqlExceptSelect);
	}

    public List<Record> getYouYiNews() {
        StringBuffer sb = new StringBuffer();
        sb.append(" select id,new_type as type, new_title as title,new_content as content,small_img as simg, ");
        sb.append(" IF(update_date IS NULL, create_date, update_date) AS time, if(show_order IS NULL,0,show_order) ord_num ");
        sb.append(" from nm_news_detail d order by d.isYouyi desc,ord_num, time DESC limit 0,5");
        return Db.find(sb.toString());

    }
    
    /**
     * 获取新闻排行榜
     * wyp
     * 2017年1月17日
     * @return
     */
    public List<Record> getRankList(int pageSize){
		String sql = "SELECT id, new_type AS type, new_title AS title, new_content AS content, small_img AS simg,"
				+ " update_date FROM nm_news_detail"
				+ " WHERE del_flag = '0' AND sta = '1' AND show_order = '1'"
				+ " ORDER BY update_date DESC LIMIT 0,"+pageSize;
    	return Db.find(sql);
    }
    
    /**
     * 获取今日排行
     * wyp
     * 2017年1月17日
     * @return
     */
    public List<Record> getTodayList(int pageSize){
		String sql = "SELECT id, new_title AS title, new_type AS type, new_content AS content, small_img AS simg,"
				+ " hold_place AS place, hold_time AS htime, DATE_FORMAT(create_date, '%Y-%m-%d') AS time,"
				+ " IF ( page_view IS NULL, 0, page_view ) AS page_view"
				+ " FROM nm_news_detail"
				+ " WHERE del_flag = '0' AND sta = '1'"
				+ " ORDER BY time DESC, page_view DESC LIMIT 0,"+pageSize;
    	return Db.find(sql);
    }
    
    /**
     * 获取本周排行、本月排行
     * wyp
     * 2017年1月17日
     * @param pageSize
     * @param day 正数为当前日期的后x天，负数为当前日期的前x天
     * @return
     */
    public List<Record> getWeekList(int pageSize,int day){
    	Calendar cal = Calendar.getInstance();//使用默认时区和语言环境获得一个日历。    
    	cal.add(Calendar.DAY_OF_MONTH, day);//取当前日期的前一天. 
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String now = sdf.format(cal.getTime());
    	
		String sql = "SELECT id, new_title AS title, new_type AS type, new_content AS content, small_img AS simg,"
				+ " hold_place AS place, hold_time AS htime, DATE_FORMAT(create_date, '%Y-%m-%d') AS time,"
				+ " IF ( page_view IS NULL, 0, page_view ) AS page_view"
				+ " FROM nm_news_detail"
				+ " WHERE del_flag = '0' AND sta = '1'"
				+ " AND create_date >= '"+now+"' ORDER BY page_view DESC LIMIT 0,"+pageSize;
    	return Db.find(sql);
    }
    
    /**
     * 获取最新的几条资讯，用来作为轮播图
     * wyp
     * 2017年1月17日
     * @return
     */
    public List<Record> getLatest(int pageSize){
    	String sql = "SELECT id, new_title AS title, new_type AS type, new_content AS content, small_img AS simg,"
    			+ " big_img AS bimg,hold_place AS place, hold_time AS htime, create_date AS time,"
    			+ " IF ( page_view IS NULL, 0, page_view ) AS page_view "
    			+ "FROM nm_news_detail WHERE del_flag = '0' AND sta = '1'"
    			+ " ORDER BY create_date DESC LIMIT 0,"+pageSize;
    	return Db.find(sql);
    }
    
}
