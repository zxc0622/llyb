package com.qdum.llhb.fund.vo;

import java.math.BigDecimal;

/**
 * 用户账户信息
 * Created by chao on 2016/1/21.
 */
public class UserAccountInfo {

    /**
     * 账户信息
     */
    private String accountName;

    /**
     * 余额
     */
    private BigDecimal balance;

    /**
     * 用户ID
     */
    private Long userID;

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }
}
