package com.qdum.llhb.forum.vo;

import com.qdum.llhb.admana.model.AdImages;
import com.qdum.llhb.forum.model.ForumAnnouncements;
import com.qdum.llhb.forum.model.ForumBoardList;
import com.qdum.llhb.forum.model.ForumPost;
import com.qdum.llhb.forum.model.ForumReply;

/**
 * 论坛首页对象
 * Created by rongchao on 2016/1/4.
 */
public class ForumIndexInfo {

    /**
     * 论坛最新图片
     */
    private AdImages[] forumAdImages;

    /**
     * 论坛最新主题
     */
    private ForumPost[] forumPosts;

    /**
     * 最新回复
     */
    private ForumReply[] forumReplys;

    /**
     * 热帖
     */
    private ForumPost[] hotPosts;

    /**
     * 论坛分区
     */
    private MainBoard[] forumBoardList;

    /**
     * 论坛公告
     */
    private ForumAnnouncements[] forumAnnouncements;

    /**
     * 用户发帖排行
     */
    private UserPostRanklist userPostRanklist;

    public AdImages[] getForumAdImages() {
        return forumAdImages;
    }

    public void setForumAdImages(AdImages[] forumAdImages) {
        this.forumAdImages = forumAdImages;
    }

    public ForumPost[] getForumPosts() {
        return forumPosts;
    }

    public void setForumPosts(ForumPost[] forumPosts) {
        this.forumPosts = forumPosts;
    }

    public ForumReply[] getForumReplys() {
        return forumReplys;
    }

    public void setForumReplys(ForumReply[] forumReplys) {
        this.forumReplys = forumReplys;
    }

    public ForumPost[] getHotPosts() {
        return hotPosts;
    }

    public void setHotPosts(ForumPost[] hotPosts) {
        this.hotPosts = hotPosts;
    }

    public MainBoard[] getForumBoardList() {
        return forumBoardList;
    }

    public void setForumBoardList(MainBoard[] forumBoardList) {
        this.forumBoardList = forumBoardList;
    }

    public ForumAnnouncements[] getForumAnnouncements() {
        return forumAnnouncements;
    }

    public void setForumAnnouncements(ForumAnnouncements[] forumAnnouncements) {
        this.forumAnnouncements = forumAnnouncements;
    }

    public UserPostRanklist getUserPostRanklist() {
        return userPostRanklist;
    }

    public void setUserPostRanklist(UserPostRanklist userPostRanklist) {
        this.userPostRanklist = userPostRanklist;
    }
}
