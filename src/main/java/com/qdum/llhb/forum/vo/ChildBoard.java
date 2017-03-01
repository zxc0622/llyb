package com.qdum.llhb.forum.vo;

import java.math.BigDecimal;

/**
 * 首页分区
 * Created by chao on 2016/1/15.
 */
public class ChildBoard {

    private Long boardID;

    private Long parID;

    private String boardName;

    private Long todayCount;

    private Long postID;

    private BigDecimal totalReplyCount;

    private Long postCount;

    private String postTitle;

    private String content;

    private String createDate;

    private String loginName;

    public Long getBoardID() {
        return boardID;
    }

    public void setBoardID(Long boardID) {
        this.boardID = boardID;
    }

    public Long getParID() {
        return parID;
    }

    public void setParID(Long parID) {
        this.parID = parID;
    }

    public String getBoardName() {
        return boardName;
    }

    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    public Long getTodayCount() {
        return todayCount;
    }

    public void setTodayCount(Long todayCount) {
        this.todayCount = todayCount;
    }

    public Long getPostID() {
        return postID;
    }

    public void setPostID(Long postID) {
        this.postID = postID;
    }

    public BigDecimal getTotalReplyCount() {
        return totalReplyCount;
    }

    public void setTotalReplyCount(BigDecimal totalReplyCount) {
        this.totalReplyCount = totalReplyCount;
    }

    public Long getPostCount() {
        return postCount;
    }

    public void setPostCount(Long postCount) {
        this.postCount = postCount;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }
}
