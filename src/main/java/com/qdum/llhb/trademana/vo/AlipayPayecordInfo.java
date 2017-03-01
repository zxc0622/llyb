package com.qdum.llhb.trademana.vo;

/**
 * 支付宝平台页面跳转同步参数说明
 * Created by chao on 2016/1/18.
 */
public class AlipayPayecordInfo {

    /**
     * 表示接口调用是否成功，并不表明业务处理结果。
     */
    private String isSuccess;

    /**
     * DSA、RSA、MD5三个值可选，必须大写。
     */
    private String signType;

    /**
     * 请参见签名验证
     */
    private String sign;

    /**
     * 对应商户网站的订单系统中的唯一订单号，非支付宝交易号。需保证在商户网站中的唯一性。是请求时对应的参数，原样返回。
     */
    private String outTradeNo;

    /**
     * 商品的标题/交易标题/订单标题/订单关键字等
     */
    private String subject;

    /**
     * 对应请求时的payment_type参数，原样返回。
     */
    private String paymentType;

    /**
     * 标志调用哪个接口返回的链接。
     */
    private String exterface;

    /**
     * 该交易在支付宝系统中的交易流水号。最长64位
     */
    private String tradeNo;

    /**
     * 交易目前所处的状态。成功状态的值只有两个：
     * TRADE_FINISHED（普通即时到账的交易成功状态）；
     * TRADE_SUCCESS（开通了高级即时到账或机票分销产品后的交易成功状态）
     */
    private String tradeStatus;

    /**
     * 支付宝通知校验ID，商户可以用这个流水号询问支付宝该条通知的合法性。
     */
    private String notifyID;

    /**
     * 通知时间（支付宝时间）。格式为yyyy-MM-dd HH:mm:ss。
     */
    private String notifyTime;

    /**
     * 返回通知类型。
     */
    private String notifyType;

    /**
     * 卖家支付宝账号，可以是Email或手机号码。
     */
    private String sellerEmail;

    /**
     * 买家支付宝账号，可以是Email或手机号码。
     */
    private String buyerEmail;

    /**
     * 卖家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。
     */
    private String sellerID;

    /**
     * 买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。
     */
    private String buyerID;

    /**
     * 该笔订单的资金总额，单位为RMB-Yuan。取值范围为[0.01,100000000.00]，精确到小数点后两位。
     */
    private String totalFee;

    /**
     * 对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。
     */
    private String body;

    /**
     * 用于商户回传参数，该值不能包含“=”、“&”等特殊字符。如果用户请求时传递了该参数，则返回给商户时会回传该参数。
     */
    private String extraCommonParam;

    /**
     * 本参数用于信用支付。它代表执行支付操作的操作员账号所属的代理人的支付宝唯一用户号。以2088开头的纯16位数字。
     */
    private String agentUserID;

    private String userID;

    private String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(String isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getSignType() {
        return signType;
    }

    public void setSignType(String signType) {
        this.signType = signType;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getExterface() {
        return exterface;
    }

    public void setExterface(String exterface) {
        this.exterface = exterface;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public String getTradeStatus() {
        return tradeStatus;
    }

    public void setTradeStatus(String tradeStatus) {
        this.tradeStatus = tradeStatus;
    }

    public String getNotifyID() {
        return notifyID;
    }

    public void setNotifyID(String notifyID) {
        this.notifyID = notifyID;
    }

    public String getNotifyTime() {
        return notifyTime;
    }

    public void setNotifyTime(String notifyTime) {
        this.notifyTime = notifyTime;
    }

    public String getNotifyType() {
        return notifyType;
    }

    public void setNotifyType(String notifyType) {
        this.notifyType = notifyType;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public String getSellerID() {
        return sellerID;
    }

    public void setSellerID(String sellerID) {
        this.sellerID = sellerID;
    }

    public String getBuyerID() {
        return buyerID;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }

    public String getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(String totalFee) {
        this.totalFee = totalFee;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getExtraCommonParam() {
        return extraCommonParam;
    }

    public void setExtraCommonParam(String extraCommonParam) {
        this.extraCommonParam = extraCommonParam;
    }

    public String getAgentUserID() {
        return agentUserID;
    }

    public void setAgentUserID(String agentUserID) {
        this.agentUserID = agentUserID;
    }
}
