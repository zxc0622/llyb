package com.qdum.llhb.trademana.AlipayParams;

/**
 * 请求出错时通知参数说明
 * Created by chao on 2016/1/19.
 */
public class ErrorNotifyParams {

    /**
     * 签约的支付宝账号对应的支付宝唯一用户号。以2088开头的16位纯数字组成。 	不可空
     */
    public static final String partner = "partner";

    /**
     * 对应商户网站的订单系统中的唯一订单号，非支付宝交易号。需保证在商户网站中的唯一性。是请求时对应的参数，原样返回。 	不可空
     */
    public static final String out_trade_no = "out_trade_no";

    /**
     * 当出现多个错误时，将错误码用“|”连接起来。错误码详情参见请求出错时的通知错误码。 	不可空
     */
    public static final String error_code = "error_code";

    /**
     * 当商户通过该接口发起请求时，如果出现提示报错，支付宝会根据请求出错时的通知错误码通过异步的方式发送通知给商户。该功能需要联系支付宝开通。是请求时对应的参数error_notify_url的原样返回。 	不可空
     */
    public static final String return_url = "return_url";

    /**
     * 买家支付宝账号。若有买家信息返回，则同时返回buyer_email和buyer_id。 	可空
     */
    public static final String buyer_email = "buyer_email";

    /**
     * 买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。若有买家信息返回，则同时返回buyer_email和buyer_id。 	可空
     */
    public static final String buyer_id = "buyer_id";

    /**
     * 卖家支付宝账号。若有卖家信息返回，则同时返回seller_email和seller_id。 	可空
     */
    public static final String seller_email = "seller_email";

    /**
     * 卖家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。若有卖家信息返回，则同时返回seller_email和seller_id。 	可空
     */
    public static final String seller_id = "seller_id";
}
