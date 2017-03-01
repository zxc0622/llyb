package com.qdum.llhb.trademana.vo;

/**
 * 付款前的VO
 * Created by chao on 2016/1/19.
 */
public class BeforeRechargeInfo extends RechargeInfo {

    /**
     * 支付平台
     */
    private String platform;

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }
}
