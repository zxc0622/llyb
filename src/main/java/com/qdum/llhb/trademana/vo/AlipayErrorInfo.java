package com.qdum.llhb.trademana.vo;

/**
 * Created by chao on 2016/1/20.
 */
public class AlipayErrorInfo {

    /**
     * 签约的支付宝账号对应的支付宝唯一用户号。以2088开头的16位纯数字组成。 	不可空
     */
    private String partner;

    /**
     * 对应商户网站的订单系统中的唯一订单号，非支付宝交易号。需保证在商户网站中的唯一性。是请求时对应的参数，原样返回。 	不可空
     */
    private String outTradeNo;

    /**
     * 当出现多个错误时，将错误码用“|”连接起来。错误码详情参见请求出错时的通知错误码。 	不可空
     */
    private String errorCode;

    /**
     * 当商户通过该接口发起请求时，如果出现提示报错，支付宝会根据请求出错时的通知错误码通过异步的方式发送通知给商户。该功能需要联系支付宝开通。是请求时对应的参数error_notify_url的原样返回。 	不可空
     */
    private String returnUrl;

    /**
     * 买家支付宝账号。若有买家信息返回，则同时返回buyer_email和buyer_id。 	可空
     */
    private String buyerEmail;

    /**
     * 买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。若有买家信息返回，则同时返回buyer_email和buyer_id。 	可空
     */
    private String buyerID;

    /**
     * 卖家支付宝账号。若有卖家信息返回，则同时返回seller_email和seller_id。 	可空
     */
    private String sellerEmail;

    /**
     * 卖家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。若有卖家信息返回，则同时返回seller_email和seller_id。 	可空
     */
    private String sellerID;

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    public String getReturnUrl() {
        return returnUrl;
    }

    public void setReturnUrl(String returnUrl) {
        this.returnUrl = returnUrl;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public String getBuyerID() {
        return buyerID;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getSellerID() {
        return sellerID;
    }

    public void setSellerID(String sellerID) {
        this.sellerID = sellerID;
    }
}
