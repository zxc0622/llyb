<%
    /* *
     *功能：即时到账交易接口接入页
     *版本：3.3
     *日期：2012-08-14
     *说明：
     *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
     *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

     *************************注意*****************
     *如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
     *1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
     *2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
     *3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
     *如果不想使用扩展功能请把扩展功能参数赋空值。
     **********************************************
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.qdum.llhb.common.alipay.config.*" %>
<%@ page import="com.qdum.llhb.common.alipay.util.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.qdum.llhb.common.utils.OrderCodeUtil" %>
<%@ page import="com.qdum.llhb.sys.utils.UserUtils" %>
<%@ page import="com.qdum.llhb.trademana.vo.BeforeRechargeInfo" %>
<%@ page import="com.qdum.llhb.trademana.model.RechargeRecord" %>
<%@ page import="com.jfinal.kit.StrKit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>支付宝即时到账交易接口</title>
</head>
<%
    ////////////////////////////////////请求参数//////////////////////////////////////
    String gateway = AlipayConfig.gateway;
    String contextPath = request.getContextPath();
    //支付类型
    String payment_type = "1";
    //必填，不能修改
    //服务器异步通知页面路径
    //String notify_url = "http://".concat(gateway).concat(contextPath).concat("/alipay/instant2account/notify_url.jsp");
    //需http://格式的完整路径，不能加?id=123这类自定义参数

    //页面跳转同步通知页面路径
    String return_url = "http://".concat(gateway).concat(contextPath).concat("/alipay/instant2account/return_url.jsp");
    //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

    String error_notify_url = "http://".concat(gateway).concat(contextPath).concat("/trademana/rechargeonline/errorNotify");

    //订单名称
    //String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"), "UTF-8");
    String subject = "优蚁在线充值";
    //必填

    //付款金额
    //String total_fee = new String(request.getParameter("WIDtotal_fee").getBytes("ISO-8859-1"), "UTF-8");
    String total_fee = request.getParameter("WIDtotal_fee");
    //必填

    //手续费
    String charges = request.getParameter("charges");

    //充值金额
    String rechargeAmount = request.getParameter("rechargeAmount");

    String platform = request.getParameter("platform");

    BeforeRechargeInfo beforeRechargeInfo = new BeforeRechargeInfo();
    beforeRechargeInfo.setRechargeAmount(rechargeAmount);
    beforeRechargeInfo.setCharges(charges);
    beforeRechargeInfo.setPlatform(platform);
    beforeRechargeInfo.setRealPrice(total_fee);

    //商户订单号
    //String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
    String out_trade_no = RechargeRecord.dao.createRechargeOrder(beforeRechargeInfo);
    //商户网站订单系统中唯一订单号，必填

    //String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"), "UTF-8");
    String body = "优蚁在线充值";
    //商品展示地址
    //String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"), "UTF-8");
    //String show_url = request.getParameter("WIDshow_url");
    //需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

    //防钓鱼时间戳
    String anti_phishing_key = AlipaySubmit.query_timestamp();
    //若要使用请调用类文件submit中的query_timestamp函数

    //客户端的IP地址
    //String exter_invoke_ip = "221.0.0.1";
    //非局域网的外网IP地址，如：221.0.0.1

    //用户ID
    Long userID = UserUtils.getUser().getId();

    //////////////////////////////////////////////////////////////////////////////////

    if (StrKit.notBlank(out_trade_no)) {
        //把请求参数打包成数组
        Map<String, String> sParaTemp = new HashMap<String, String>();
        sParaTemp.put("service", "create_direct_pay_by_user");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("seller_id", AlipayConfig.seller_id);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
        sParaTemp.put("payment_type", payment_type);
        //sParaTemp.put("notify_url", notify_url);
        sParaTemp.put("return_url", return_url);
        sParaTemp.put("error_notify_url", error_notify_url);
        sParaTemp.put("out_trade_no", out_trade_no);
        sParaTemp.put("subject", subject);
        sParaTemp.put("total_fee", total_fee);
        sParaTemp.put("body", body);
        sParaTemp.put("extra_common_param", "userID".concat(":").concat(userID.toString()));
        //sParaTemp.put("show_url", show_url);
        sParaTemp.put("anti_phishing_key", anti_phishing_key);
        //sParaTemp.put("exter_invoke_ip", exter_invoke_ip);

        //建立请求
        String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
        out.println(sHtmlText);
    } else {
        out.println("充值失败，创建订单时出错~~!");
    }

%>
<body>
</body>
</html>
