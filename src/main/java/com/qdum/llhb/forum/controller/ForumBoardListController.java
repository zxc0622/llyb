package com.qdum.llhb.forum.controller;

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.forum.model.ForumBoardList;
import com.qdum.llhb.forum.model.ForumBoardMaster;
import com.qdum.llhb.forum.vo.MainBoardInfo;
import com.qdum.llhb.forum.vo.SubBoardInfo;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;


@ControllerBind(controllerKey="/forum/board")
public class ForumBoardListController extends Controller  {
	public void index(){
		List<Record> fbAllList = ForumBoardList.dao.getAll();
		List<Record> fbmList = ForumBoardMaster.dao.getList();
		setAttr("boardList",boardList(fbAllList,fbmList));
		render("boardMana.jsp");
	}
	/**
	 * 版块包装类
	 * */
	private List<MainBoardInfo> boardList(List<Record> fbAllList, List<Record> fbmList){
		List<MainBoardInfo> list = Lists.newArrayList();
		if(fbAllList != null){
			for (Record e : fbAllList) {
				if(e.getLong("par_id")==0L){
					MainBoardInfo mbi = new MainBoardInfo();
					List<SubBoardInfo> subBoardList = Lists.newArrayList();
					for (Record sub : fbAllList) {
						SubBoardInfo sbi = new SubBoardInfo();
						if(sub.getLong("par_id")==e.getLong("id")){
							List<Record> subMasterList = Lists.newArrayList();
							if(fbmList != null){
								for(Record master : fbmList){
									if(master.getLong("board_id")==sub.getLong("id")){
										subMasterList.add(master);
									}
								}
							}
							sbi.setId(sub.getLong("id"));
							sbi.setName(sub.getStr("board_name"));
							sbi.setMasterList(subMasterList);
							subBoardList.add(sbi);
						}
					}
					List<Record> masterList = Lists.newArrayList();
					if(fbmList != null){
						for (Record master : fbmList){
							if(master.getLong("board_id")==e.getLong("id")){
								masterList.add(master);
							}
						}
					}
					mbi.setId(e.getLong("id"));
					mbi.setName(e.getStr("board_name"));
					mbi.setSubBoardList(subBoardList);
					mbi.setMasterList(masterList);
					list.add(mbi);
				}
			}
		}
		return list;
	}
	/**
	 * 板块编辑
	 * */
	public void editor(){
		String boardId = getPara("boardId");
		setAttr("boardId",boardId);
		setAttr("board",ForumBoardList.dao.getById(Long.parseLong(boardId)));
		setAttr("masterList",ForumBoardMaster.dao.getList(Long.parseLong(boardId)));
		render("boardEditor.jsp");
	}
	/**
	 * 添加版主
	 * */
	public void masterAdd(){
		String loginName = getPara("loginName");
		String boardId = getPara("boardId");
		User user = User.dao.getIdByName(loginName);
		if(user!=null){
			Record record = ForumBoardMaster.dao.getBoardMaster(Long.parseLong(boardId), user.getId());
			if(record==null){
				ForumBoardMaster fbm = new ForumBoardMaster();
				fbm.set("board_id", Long.parseLong(boardId));
				fbm.set("user_id", user.getId());
				fbm.set("create_by", UserUtils.getUser().getId());
				fbm.set("create_date",new Date());
				fbm.save();
				renderText("yes");//表示添加成功
			}else{
				renderText("no");//表示添加失败，该用户已经是本版块版主，
			}
		}else{
			renderJson(false);//表示该用户不存在
		}
	}
	/**
	 * 删除版主
	 * */
	public void delete(){
		boolean isDeleted = ForumBoardMaster.dao.isDeleted(getParaToLong("id"));
		renderJson(isDeleted);
	}
}
