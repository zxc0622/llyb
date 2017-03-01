package com.qdum.llhb.forum.vo;

/**
 * 用户发帖排行
 * Created by rongchao on 2016/1/4.
 */
public class UserPostRanklist {

    /**
     * 日排行
     */
    private UserInfo[] dayRanklist;

    /**
     * 周排行
     */
    private UserInfo[] weekRanklist;

    /**
     * 月排行
     */
    private UserInfo[] monthRanklist;

    public UserInfo[] getDayRanklist() {
        return dayRanklist;
    }

    public void setDayRanklist(UserInfo[] dayRanklist) {
        this.dayRanklist = dayRanklist;
    }

    public UserInfo[] getWeekRanklist() {
        return weekRanklist;
    }

    public void setWeekRanklist(UserInfo[] weekRanklist) {
        this.weekRanklist = weekRanklist;
    }

    public UserInfo[] getMonthRanklist() {
        return monthRanklist;
    }

    public void setMonthRanklist(UserInfo[] monthRanklist) {
        this.monthRanklist = monthRanklist;
    }
}
