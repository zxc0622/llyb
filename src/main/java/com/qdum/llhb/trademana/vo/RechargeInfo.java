package com.qdum.llhb.trademana.vo;

/**
 * 在线充值VO
 * Created by chao on 2016/1/15.
 */
public class RechargeInfo {

    /**
     * 充值金额
     */
    private String rechargeAmount;

    /**
     * 手续费
     */
    private String charges;

    /**
     * 实收金额
     */
    private String realPrice;

    public String getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(String rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public String getCharges() {
        return charges;
    }

    public void setCharges(String charges) {
        this.charges = charges;
    }

    public String getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(String realPrice) {
        this.realPrice = realPrice;
    }
}
