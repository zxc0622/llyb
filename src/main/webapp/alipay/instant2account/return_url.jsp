<%
    /* *
     功能：支付宝页面跳转同步通知页面
     版本：3.2
     日期：2011-03-17
     说明：
     以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
     该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

     //***********页面功能说明***********
     该页面可在本机电脑测试
     可放入HTML等美化页面的代码、商户业务逻辑程序代码
     TRADE_FINISHED(表示交易已经成功结束，并不能再对该交易做后续操作);
     TRADE_SUCCESS(表示交易已经成功结束，可以对该交易做后续操作，如：分润、退款等);
     //********************************
     * */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.qdum.llhb.common.alipay.util.AlipayCore" %>
<%@ page import="com.qdum.llhb.common.alipay.util.AlipayNotify" %>
<%@ page import="com.qdum.llhb.trademana.AlipayParams.SyncParams" %>
<%@ page import="com.qdum.llhb.trademana.model.AlipayPayRecord" %>
<%@ page import="com.qdum.llhb.trademana.vo.AlipayPayecordInfo" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.qdum.llhb.fund.model.Fund" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>支付宝页面跳转同步通知页面</title>
</head>
<body>
<%
    //获取支付宝GET过来反馈信息
    Map<String, String> params = new HashMap<String, String>();
    Map requestParams = request.getParameterMap();
    for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
        String name = (String) iter.next();
        String[] values = (String[]) requestParams.get(name);
        String valueStr = "";
        for (int i = 0; i < values.length; i++) {
            valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
        }
        //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
        //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
        params.put(name, valueStr);
    }

    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
    //商户订单号

    String out_trade_no = request.getParameter(SyncParams.OUT_TRADE_NO);

    //支付宝交易号

    String trade_no = request.getParameter(SyncParams.TRADE_NO);

    //交易状态
    String trade_status = request.getParameter(SyncParams.TRADE_STATUS);

    String extraCommonParam = request.getParameter(SyncParams.EXTRA_COMMON_PARAM);

    String userID = extraCommonParam.split(":")[1];
    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
    String contextPath = request.getContextPath();
    //计算得出通知验证结果
    boolean verify_result = AlipayNotify.verify(params);
    if (verify_result) {//验证成功
        //////////////////////////////////////////////////////////////////////////////////////////
        //请在这里加上商户的业务逻辑程序代码
        AlipayPayecordInfo alipayPayecordInfo = new AlipayPayecordInfo();
        alipayPayecordInfo.setIsSuccess(request.getParameter(SyncParams.IS_SUCCESS));
        alipayPayecordInfo.setSignType(request.getParameter(SyncParams.SIGN_TYPE));
        alipayPayecordInfo.setSign(request.getParameter(SyncParams.SIGN));
        alipayPayecordInfo.setOutTradeNo(out_trade_no);
        alipayPayecordInfo.setSubject(request.getParameter(SyncParams.SUBJECT));
        alipayPayecordInfo.setPaymentType(request.getParameter(SyncParams.PAYMENT_TYPE));
        alipayPayecordInfo.setExterface(request.getParameter(SyncParams.EXTERFACE));
        alipayPayecordInfo.setTradeNo(trade_no);
        alipayPayecordInfo.setTradeStatus(trade_status);
        alipayPayecordInfo.setNotifyID(request.getParameter(SyncParams.NOTIFY_ID));
        alipayPayecordInfo.setNotifyTime(request.getParameter(SyncParams.NOTIFY_TIME));
        alipayPayecordInfo.setNotifyType(request.getParameter(SyncParams.NOTIFY_TYPE));
        alipayPayecordInfo.setSellerEmail(request.getParameter(SyncParams.SELLER_EMAIL));
        alipayPayecordInfo.setBuyerEmail(request.getParameter(SyncParams.BUYER_EMAIL));
        alipayPayecordInfo.setSellerID(request.getParameter(SyncParams.SELLER_ID));
        alipayPayecordInfo.setBuyerID(request.getParameter(SyncParams.BUYER_ID));
        alipayPayecordInfo.setTotalFee(request.getParameter(SyncParams.TOTAL_FEE));
        alipayPayecordInfo.setBody(request.getParameter(SyncParams.BODY));
        alipayPayecordInfo.setExtraCommonParam(extraCommonParam);
        alipayPayecordInfo.setAgentUserID(request.getParameter(SyncParams.AGENT_USER_ID));
        alipayPayecordInfo.setUserID(userID);
        //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
        if (trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")) {
            //判断该笔订单是否在商户网站中已经做过处理
            //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
            //如果有做过处理，不执行商户的业务程序
            Fund.dao.recharge(alipayPayecordInfo);
        }

        //该页面可做页面美工编辑
        response.sendRedirect(contextPath.concat("/home?str=/trademana/rechargerecord/rechargeRecord?isSuccess=1"));
        //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

        //////////////////////////////////////////////////////////////////////////////////////////
    } else {
        //该页面可做页面美工编辑
        response.sendRedirect(contextPath.concat("/home?str=/trademana/rechargerecord/rechargeRecord?isSuccess=0"));
    }
%>
</body>
</html>