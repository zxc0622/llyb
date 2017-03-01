<%@ page import="com.qdum.llhb.trademana.enumvalue.RechargeStatusEnum" %>
<%@ page import="com.qdum.llhb.trademana.enumvalue.PlatformEnum" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
    request.setAttribute("success", RechargeStatusEnum.success.toString());
    request.setAttribute("fail", RechargeStatusEnum.fail.toString());
    request.setAttribute("ordered", RechargeStatusEnum.ordered.toString());
    request.setAttribute("alipayPlatform", PlatformEnum.alipay.toString());
    request.setAttribute("eBankPlatform", PlatformEnum.eBank.toString());
    request.setAttribute("otherPlatform", PlatformEnum.other.toString());
%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp" %>
    <title>交易管理_充值记录</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
    <style type="text/css">
        form {
            margin-top: 30px;
            margin-left: 20px;
        }

        .tab_main_row > select {
            min-width: 100px;
            height: 31px;;
            line-height: 30px;
        }

        input[type=text] {
            border: 1px solid #cccccc;
            text-indent: 10px;
            width: 150px;
        }

        input[type=text]:focus {
            border: 1px solid #ee7800;
        }

        .btn {
            width: 120px;
            line-height: 30px;
            height: 30px;
            text-align: center;
            color: #fff;
            background-color: #5cb531;
            display: inline-block;
            margin-left: 5px;
            padding-top: 1px;
        }

        .normal_btn {
            margin-left: 5px;
            width: 100px;
            line-height: 30px;
            height: 30px;
            text-align: center;
            color: #666666;
            display: inline-block;
            border: 1px solid #cccccc;
        }

        /*table样式*/
        .youyi_table {
            margin-top: 30px;
            margin-left: 20px;
        }

        .youyi_table tr {
            height: 30px;
            line-height: 30px
        }

        .youyi_table tr td, .youyi_table tr th {
            padding: 0 15px;
            border: 1px solid #ccc;
        }
    </style>

</head>
<body>
<div class="main">
    <!-- 右侧开始 -->
    <div class="main_right">
        <div class="m_r_position font_1">当前位置>交易管理>充值记录</div>
        <div class="tab_main">
            <div class="m_r_title">
                <span onclick="goUrl('${ctx}/trademana/rechargeonline/firstStepRecharge')">在线充值</span>
                <%--<span onclick="goUrl('交易管理/交易管理_充值卡充值.html')">充值卡充值</span>
                <span onclick="goUrl('交易管理/交易管理_充值记录_银行汇款.html')">银行汇款</span>--%>
                <span class="m_r_tname">充值记录</span>
            </div>

            <form action="${ctx}/trademana/rechargerecord/rechargeRecord">
                <div class="tab_main_row ">
                    <select name="platform">
                        <option value="${alipayPlatform}">支付平台</option>
                    </select>
                    <input type="text" name="startDate" class="mh_date" id="startDate" readonly style="width:100px;"
                           value=<fmt:formatDate value="${startDate}" pattern="yyyy-MM-dd"/>>
                    <span class="font_1">至</span>
                    <input type="text" name="endDate" class="mh_date" id="endDate" readonly style="width:100px;"
                           value=<fmt:formatDate value="${endDate}" pattern="yyyy-MM-dd"/>>
                    <input type="submit" id="sub_btn" style="display: none;">
                    <input type="reset" id="reset_btn" style="display: none;">
                    <a href="javascript:event.submitForm();" class="btn">搜索</a>
                    <a href="javascript:event.resetForm();" class="normal_btn">重置</a>
                </div>
            </form>
            <table class="youyi_table">
                <tr>
                    <th style="width: 50px;">流水号</th>
                    <th style="width: 60px;">充值金额</th>
                    <th style="width: 45px;">手续费</th>
                    <th style="width: 60px;">实收金额</th>
                    <th style="width: 60px;">支付平台</th>
                    <th style="width: 60px;">下单时间</th>
                    <th style="width: 60px;">支付时间</th>
                    <th>状态</th>
                </tr>
                <c:choose>
                    <c:when test="${not empty userRechargeRecords}">
                        <c:forEach items="${userRechargeRecords}" var="userRechargeRecord">
                            <tr class="font_1">
                                <td>${userRechargeRecord.resultMap.serial_number}</td>
                                <td>${userRechargeRecord.resultMap.amount} 元</td>
                                <td>${userRechargeRecord.resultMap.charge} 元</td>
                                <td>${userRechargeRecord.resultMap.real_amount} 元</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${alipayPlatform eq userRechargeRecord.resultMap.platform}">
                                            支付宝
                                        </c:when>
                                        <c:when test="${eBankPlatform eq userRechargeRecord.resultMap.platform}">
                                            网银支付
                                        </c:when>
                                        <c:otherwise>
                                            其他
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><fmt:formatDate
                                        value="${userRechargeRecord.resultMap.order_time}"
                                        pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td><fmt:formatDate
                                        value="${userRechargeRecord.resultMap.payment_time}"
                                        pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${userRechargeRecord.resultMap.status eq success}">
                                            支付成功
                                        </c:when>
                                        <c:when test="${userRechargeRecord.resultMap.status eq ordered}">
                                            未支付
                                        </c:when>
                                        <c:otherwise>
                                            支付失败
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr class="font_1">
                            <td colspan="8" align="center">暂无充值记录</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
        </div>
    </div>
    <!-- 右侧结束 -->
</div>


<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/getUrlParam.js"></script>
<script type="text/javascript">
    var event = {
        submitForm: function () {
            $("#sub_btn").trigger("click");
        },
        resetForm: function () {
            $("#reset_btn").trigger("click");
        }
    };

    $(function () {
        $("input#startDate").manhuaDate({
            Event: "click",//可选
            Left: 0,//弹出时间停靠的左边位置
            Top: -16,//弹出时间停靠的顶部边位置
            fuhao: "-",//日期连接符默认为-
            isTime: false,//是否开启时间值默认为false
            beginY: 1949,//年份的开始默认为1949
            endY: 2100//年份的结束默认为2049
        });

        $("input#endDate").manhuaDate({
            Event: "click",//可选
            Left: 0,//弹出时间停靠的左边位置
            Top: -16,//弹出时间停靠的顶部边位置
            fuhao: "-",//日期连接符默认为-
            isTime: false,//是否开启时间值默认为false
            beginY: 1949,//年份的开始默认为1949
            endY: 2100//年份的结束默认为2049
        });

        win.tipRecharge();
    });

    var win = {
        tip: function (str) {
            window.parent.showMess(str);
        },
        tipRecharge: function () {
            var isHas = UrlParm.hasParm("isSuccess");
            if (isHas) {
                if (UrlParm.parm("isSuccess") == 1) {
                    win.tip("充值成功！");
                } else {
                    win.tip("充值失败！");
                }
            }
        }
    };

</script>
</body>
</html>


