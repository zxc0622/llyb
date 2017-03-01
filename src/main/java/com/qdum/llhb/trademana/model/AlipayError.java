package com.qdum.llhb.trademana.model;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.trademana.vo.AlipayErrorInfo;

import java.util.Date;

/**
 * 支付宝交易错误通知表
 * Created by chao on 2016/1/20.
 */
public class AlipayError extends Model<AlipayError> {

    public static AlipayError dao = new AlipayError();

    /**
     * 主键，自增
     */
    public static final String ID = "id";

    /**
     *
     */
    public static final String USER_ID = "user_id";

    /**
     * 合作者身份ID
     */
    public static final String PARTNER = "partner";

    /**
     * 商户网站唯一订单号
     */
    public static final String OUT_TRADE_NO = "out_trade_no";

    /**
     * 错误码
     */
    public static final String ERROR_CODE = "error_code";

    /**
     * 请求出错时的通知页面路径
     */
    public static final String RETURN_URL = "return_url";

    /**
     * 买家支付宝账号
     */
    public static final String BUYER_EMAIL = "buyer_email";

    /**
     * 买家支付宝账户号
     */
    public static final String BUYER_ID = "buyer_id";

    /**
     * 卖家支付宝账号
     */
    public static final String SELLER_EMAIL = "seller_email";

    /**
     * 卖家支付宝账户号
     */
    public static final String SELLER_ID = "seller_id";

    /**
     *
     */
    public static final String CREATE_BY = "create_by";

    /**
     *
     */
    public static final String CREATE_DATE = "create_date";

    /**
     *
     */
    public static final String REMARKS = "remarks";

    /**
     * 删除标志，默认为0，删除为1
     */
    public static final String DEL_FLAG = "del_flag";

    /**
     * 创建支付宝错误日志
     *
     * @return
     */
    public Boolean createAlipayErrorLog(AlipayErrorInfo alipayErrorInfo) {
        AlipayError alipayError = new AlipayError();
        alipayError.set(PARTNER, alipayErrorInfo.getPartner());
        alipayError.set(OUT_TRADE_NO, alipayErrorInfo.getOutTradeNo());
        alipayError.set(ERROR_CODE, alipayErrorInfo.getErrorCode());
        alipayError.set(RETURN_URL, alipayErrorInfo.getReturnUrl());
        alipayError.set(BUYER_EMAIL, alipayErrorInfo.getBuyerEmail());
        alipayError.set(BUYER_ID, alipayErrorInfo.getBuyerID());
        alipayError.set(SELLER_EMAIL, alipayErrorInfo.getSellerEmail());
        alipayError.set(SELLER_ID, alipayErrorInfo.getSellerID());
        alipayError.set(CREATE_DATE, new Date());
        alipayError.set(DEL_FLAG, false);
        return alipayError.save();
    }
}
