package com.qdum.llhb.trademana.AlipayParams;

/**
 * 页面跳转同步参数说明
 * Created by chao on 2016/1/19.
 */
public class SyncParams {

    /**
     * 表示接口调用是否成功，并不表明业务处理结果。 	不可空
     */
    public static final String IS_SUCCESS = "is_success";

    /**
     * DSA、RSA、MD5三个值可选，必须大写。 	不可空
     */
    public static final String SIGN_TYPE = "sign_type";

    /**
     * 请参见签名验证 	不可空
     */
    public static final String SIGN = "sign";

    /**
     * 对应商户网站的订单系统中的唯一订单号，非支付宝交易号。需保证在商户网站中的唯一性。是请求时对应的参数，原样返回。 	可空
     */
    public static final String OUT_TRADE_NO = "out_trade_no";

    /**
     * 商品的标题/交易标题/订单标题/订单关键字等。 	可空
     */
    public static final String SUBJECT = "subject";

    /**
     * 对应请求时的payment_type参数，原样返回。 	可空
     */
    public static final String PAYMENT_TYPE = "payment_type";

    /**
     * 标志调用哪个接口返回的链接。 	可空
     */
    public static final String EXTERFACE = "exterface";

    /**
     * 该交易在支付宝系统中的交易流水号。最长64位。 	可空
     */
    public static final String TRADE_NO = "trade_no";

    /**
     * 交易目前所处的状态。成功状态的值只有两个：
     * TRADE_FINISHED（普通即时到账的交易成功状态）；
     * TRADE_SUCCESS（开通了高级即时到账或机票分销产品后的交易成功状态） 	可空
     */
    public static final String TRADE_STATUS = "trade_status";

    /**
     * 支付宝通知校验ID，商户可以用这个流水号询问支付宝该条通知的合法性。 	可空
     */
    public static final String NOTIFY_ID = "notify_id";

    /**
     * 通知时间（支付宝时间）。格式为yyyy-MM-dd HH:mm:ss。 	可空
     */
    public static final String NOTIFY_TIME = "notify_time";

    /**
     * 返回通知类型。 	可空
     */
    public static final String NOTIFY_TYPE = "notify_type";

    /**
     * 卖家支付宝账号，可以是Email或手机号码。 	可空
     */
    public static final String SELLER_EMAIL = "seller_email";

    /**
     * 买家支付宝账号，可以是Email或手机号码。 	可空
     */
    public static final String BUYER_EMAIL = "buyer_email";

    /**
     * 卖家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。 	可空
     */
    public static final String SELLER_ID = "seller_id";

    /**
     * 买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字。 	可空
     */
    public static final String BUYER_ID = "buyer_id";

    /**
     * 该笔订单的资金总额，单位为RMB-Yuan。取值范围为[0.01,100000000.00]，精确到小数点后两位。 	可空
     */
    public static final String TOTAL_FEE = "total_fee";

    /**
     * 对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。 	可空
     */
    public static final String BODY = "body";

    /**
     * 用于商户回传参数，该值不能包含“=”、“&”等特殊字符。如果用户请求时传递了该参数，则返回给商户时会回传该参数。 	可空
     */
    public static final String EXTRA_COMMON_PARAM = "extra_common_param";

    /**
     * 本参数用于信用支付。它代表执行支付操作的操作员账号所属的代理人的支付宝唯一用户号。以2088开头的纯16位数字。 	可空
     */
    public static final String AGENT_USER_ID = "agent_user_id";
}

