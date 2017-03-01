package com.qdum.llhb.forum.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

public class ForumSearchHistory extends Model<ForumSearchHistory> {

	/**
	 * 论坛搜索历史实体
	 * @author zhaoyl
	 * @time 2016年1月6日16:21:26
	 */
	private static final long serialVersionUID = 1L;
	public static ForumSearchHistory dao = new ForumSearchHistory();
	
	/**
	 * 获取热搜词
	 * @param boardId -- 版块id
	 * @return List<Record>
	 * @author zhaoyl
	 * @time 2016年1月6日16:25:30
	 * */
	public List<Record> getHotWordsList(){
		String sql = "select count(*) title_count,fsh.search_content from forum_search_history fsh " +
				"where fsh.del_flag = 0 group by fsh.search_content order by title_count desc";
		return Db.find(sql);
	}
	/**
	 * 通过boardId获取热搜词
	 * @param boardId -- 版块id
	 * @return List<Record>
	 * @author zhaoyl
	 * @time 2016年1月6日16:25:30
	 * */
	public List<Record> getHotWordsList(long boardId){
		String sql = "select count(*) title_count,fsh.search_content from forum_search_history fsh " +
				"where fsh.del_flag = 0 and fsh.board_id = "+boardId+" group by fsh.search_content order by title_count desc";
		return Db.find(sql);
	}

}
