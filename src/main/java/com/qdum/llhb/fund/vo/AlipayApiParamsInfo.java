package com.qdum.llhb.fund.vo;

/**
 * 支付宝Api所需参数信息
 * Created by chao on 2016/1/25.
 */
public class AlipayApiParamsInfo {

    /**
     * WIDemail 付款账号
     */
    private String email;

    /**
     * WIDaccount_name 付款账户名
     */
    private String accountName;

    /**
     * WIDpay_date 付款当天日期
     */
    private String payDate;

    /**
     * WIDbatch_no 批次号
     */
    private String batchNo;

    /**
     * WIDbatch_fee 付款总金额
     */
    private Float batchFee;

    /**
     * WIDbatch_num 付款笔数
     */
    private Integer batchNum;

    /**
     * WIDdetail_data 付款详细数据
     */
    private String detailData;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public Float getBatchFee() {
        return batchFee;
    }

    public void setBatchFee(Float batchFee) {
        this.batchFee = batchFee;
    }

    public Integer getBatchNum() {
        return batchNum;
    }

    public void setBatchNum(Integer batchNum) {
        this.batchNum = batchNum;
    }

    public String getDetailData() {
        return detailData;
    }

    public void setDetailData(String detailData) {
        this.detailData = detailData;
    }
}
