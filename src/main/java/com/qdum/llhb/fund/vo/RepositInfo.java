package com.qdum.llhb.fund.vo;

/**
 * 提现信息
 * Created by chao on 2016/1/22.
 */
public class RepositInfo {

    /**
     * 操作用户ID
     */
    private String userID;

    /**
     * 支付宝账号
     */
    private String alipayAccount;

    /**
     * 提现金额
     */
    private float amount;

    /**
     * 手续费
     */
    private float fee;

    private String remark;

    private String accountName;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAlipayAccount() {
        return alipayAccount;
    }

    public void setAlipayAccount(String alipayAccount) {
        this.alipayAccount = alipayAccount;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
}
