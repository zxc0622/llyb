<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp" %>
    <title>交易管理_在线充值</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
    <style type="text/css">
        form {
            margin-top: 30px;
        }

    </style>

</head>
<body>
<div class="main">
    <!-- 右侧开始 -->
    <div class="main_right">
        <div class="m_r_position font_1">当前位置>交易管理>在线充值</div>
        <div class="tab_main">
            <div class="m_r_title">
                <span class="m_r_tname">在线充值</span>
                <%--<span onclick="goUrl('交易管理/交易管理_充值卡充值.html')">充值卡充值</span>
                <span onclick="goUrl('交易管理/交易管理_充值记录_银行汇款.html')">银行汇款</span>--%>
                <span onclick="goUrl('${ctx}/trademana/rechargerecord/rechargeRecord')">充值记录</span>
            </div>

            <form action="">
                <div class="tab_main_row ">

                    <label>当前余额</label>
                    <div class="row_right font1">
                        <span>${remindSum eq 0 ? "0.00" : remindSum}</span>
                    </div>
                    <span class="tip_span tip_normal">元</span>

                </div>

                <div class="tab_main_row ">

                    <label>充值金额</label>
                    <div class="row_right font1">
                        <input type="text" style="width:160px;" id="rechargeAmount" value="800.00" readonly>
                    </div>
                    <span class="tip_span tip_normal">元</span>

                </div>


                <div class="save_or_return">
                    <a href="javascript:rechargeonline.btnClick.bindNextBtn();" class="save_btn">下一步</a>

                </div>

            </form>
        </div>
    </div>
    <!-- 右侧结束 -->

</div>

<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">

    var rechargeonline = {};

    rechargeonline.validator = {
        //判断字符串是否为空
        isEmpty: function (str) {
            if (str == "" || str.length == 0 || str <= 0) {
                rechargeonline.win.tip("充值金额不能为空，且大于0！");
                return true;
            } else {
                return false;
            }
        },
        //判断字符串是否位数字
        isNumber: function (num) {
            if (isNaN(num)) {
                rechargeonline.win.tip("充值金额只能填写数字!");
                return false;
            } else {
                var dot = num.indexOf(".");
                if (dot >= 0) {
                    var dotCnt = num.substring(dot + 1, num.length);
                    if (dotCnt.length > 2) {
                        rechargeonline.win.tip("充值金额最多精确到分!");
                        return false;
                    }
                }
                return true;
            }
        },
        //检查充值金额
        checkRechargeAmount: function (rechargeAmount) {
            if (this.isEmpty(rechargeAmount)) {
                return false;
            } else if (!this.isNumber(rechargeAmount)) {
                return false;
            } else {
                return true;
            }
        }
    };

    rechargeonline.btnClick = {
        bindNextBtn: function () {
            debugger;
            var rechargeAmount = $("#rechargeAmount").val();
            if (rechargeonline.validator.checkRechargeAmount(rechargeAmount)) {
                var url = "${ctx}/trademana/rechargeonline/secondStepRecharge?rechargeAmount="
                        + rechargeAmount;
                rechargeonline.win.openSelfWin(url);
            }
        }
    };

    rechargeonline.win = {
        tip: function (msg) {
            window.parent.showMess(msg);
        },
        //当前窗口打开新的页面
        openSelfWin: function (url) {
            window.open(url, "_self");
        }
    };

</script>
</body>
</html>


