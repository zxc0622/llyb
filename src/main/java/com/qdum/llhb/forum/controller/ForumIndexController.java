package com.qdum.llhb.forum.controller;

import com.google.common.collect.Lists;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.log.Logger;
import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.forum.model.*;
import com.qdum.llhb.forum.vo.ForumIndexInfo;
import com.qdum.llhb.forum.vo.MainBoard;

/**
 * 论坛首页
 * Created by rongchao on 2016/1/4.
 */
@ControllerBind(controllerKey = "/forum/forumindex")
public class ForumIndexController extends CommonController {

    private static final Logger LOGGER = Logger.getLogger(ForumIndexController.class);

    public void index() {
        setAttr("info", initForumIndexData());
        setAttr("searchList", ForumSearchHistory.dao.getHotWordsList());
        render("forumindex.jsp");
    }

    /**
     * 初始化论坛首页数据
     *
     * @return
     */
    private ForumIndexInfo initForumIndexData() {
        ForumIndexInfo forumIndexInfo = new ForumIndexInfo();
        forumIndexInfo.setForumAdImages(AdImages.dao.getAdImagesByLabelID(41L).toArray(new AdImages[0]));
        forumIndexInfo.setForumAnnouncements(ForumAnnouncements.dao.queryIndexFA().toArray(new ForumAnnouncements[0]));
        forumIndexInfo.setForumBoardList(ForumBoardList.dao.queryIndexForumBoardList().toArray(new MainBoard[0]));
        forumIndexInfo.setForumPosts(ForumPost.dao.queryLastestPosts().toArray(new ForumPost[0]));
        forumIndexInfo.setForumReplys(ForumReply.dao.queryLastestReplys().toArray(new ForumReply[0]));
        forumIndexInfo.setUserPostRanklist(ForumPost.dao.getUserPostRanklist());
        forumIndexInfo.setHotPosts(ForumPost.dao.queryHotPosts().toArray(new ForumPost[0]));
        return forumIndexInfo;
    }
}
