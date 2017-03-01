package com.qdum.llhb.forum.controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.ibm.icu.text.SimpleDateFormat;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DateUtils;
import com.qdum.llhb.forum.model.ForumBoardList;
import com.qdum.llhb.forum.model.ForumPost;
import com.qdum.llhb.forum.model.ForumSearchHistory;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/forum/list")
public class ForumListController extends Controller {
	public void index(){
		String type = getPara("type");
		setAttr("type",type);
		String order = getPara("order");
		setAttr("order",order);
		boolean isSubSearch = false;
		if(getParaToBoolean("isSubSearch") != null){
			isSubSearch = getParaToBoolean("isSubSearch");
		}
		String searchContent = getPara("searchContent");
		setAttr("searchContent",searchContent);
		String boardIdStr = getPara("boardId");
		setAttr("boardId",boardIdStr);
		long boardId = 0L;
		if(boardIdStr != null && !"".equals(boardIdStr)){
			boardId = Long.parseLong(boardIdStr);
		}
		
		/*搜索时添加热搜表*/
		ForumSearchHistory fsh = new ForumSearchHistory();
		if(boardIdStr != null && !"".equals(boardIdStr)){
			fsh.set("board_id", boardId);
		}
		fsh.set("search_content",searchContent);
		User user = UserUtils.getUser();
		fsh.set("create_by", user.getId());
		fsh.set("create_date", new Date());
		fsh.save();
		
		setAttr("boardName",ForumBoardList.dao.getName(boardId));//设置板块名称和父级名称
		setAttr("isSubSearch",isSubSearch);
		setAttr("typeCountList",ForumPost.dao.getCount());//帖子类型数量
		setAttr("postStat",ForumPost.dao.getStatByBoardId(boardId));//新增帖子数量和排名
		setAttr("titleRecord",ForumPost.dao.getTitleCount(boardId));//主题数量
		if(boardIdStr!=null && !"".equals(boardIdStr)){
			setAttr("searchList",ForumSearchHistory.dao.getHotWordsList(boardId));//热门搜索列表
		}else{
			setAttr("searchList",ForumSearchHistory.dao.getHotWordsList());//热门搜索列表
		}
		String preDay = getPara("preDay");
		setAttr("preDay",preDay);
		if(preDay != null && !"".equals(preDay)){
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			int days = Integer.parseInt(preDay);
			calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR)-days);
			Date date = calendar.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			preDay = sdf.format(date);
		}
		Page<Record> postPage = ForumPost.dao.getPostPage(getParaToInt(0,1), 20,type,order,getPara("boardId"),searchContent,preDay);
		setAttr("pageNumber",getParaToInt(0,1));
		if(postPage != null){
			List<Record> postList = postPage.getList();
			for (Record record : postList) {
				if(record.getDate("re_time")!=null){
					record.set("remarks", new DateUtils().setPastTime(record.getDate("re_time")));
				}
				if(record.getDate("create_date")!=null){
					record.set("ma_days", new DateUtils().setPastTime(record.getDate("create_date")));
				}
			}
			setAttr("postList",postList);
			setAttr("recordPage",postPage);
		}
		render("forumList.jsp");
	}
}
