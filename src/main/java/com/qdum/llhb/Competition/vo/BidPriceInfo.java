package com.qdum.llhb.Competition.vo;

/**
 * 时间间距
 * Created by rongchao on 2015/12/30.
 */
public class BidPriceInfo {

    /**
     * 时间间距类型 “距开始” “距结束”
     */
    private String distanceType;

    /**
     * 时间间隔
     */
    private Long timeDistance;

    public String getDistanceType() {
        return distanceType;
    }

    public void setDistanceType(String distanceType) {
        this.distanceType = distanceType;
    }

    public Long getTimeDistance() {
        return timeDistance;
    }

    public void setTimeDistance(Long timeDistance) {
        this.timeDistance = timeDistance;
    }
}
