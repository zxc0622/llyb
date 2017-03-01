<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp" %>
    <title>交易管理_在线充值_1</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
    <style type="text/css">
        form {
            margin-top: 30px;
        }

        /*在线充值_1*/
        .tab_main_row .r-r-span {
            margin-right: 20px;
        }

        .tab_main_row .r-r-span span {
            color: #ee7800;
        }

        .bank {
            overflow: hidden;
            width: 100%;
        }

        .bank li {
            float: left;
            border: 1px solid #ccc;
            margin-top: 15px;
            margin-right: 15px;
            width: 187px;
            height: 46px;
        }

        .bank li:nth-child(3n) {
            margin-right: 0
        }

        .bank li:hover {
            border: 1px solid #5EC520;
        }

        .bank li:last-child {
            line-height: 46px;
            text-indent: 5px;
            background: url(${ctxStatic}/img/llhb/select_down.png) 170px center no-repeat;
        }

        .hide-bank {
            display: none;
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
                <span>银行汇款</span>--%>
                <span onclick="goUrl('${ctx}/trademana/rechargerecord/rechargeRecord')">充值记录</span>
            </div>

            <form action="" method="post" id="rechargeForm" target="_blank">
                <input type="hidden" value="${rechargeInfo.realPrice}" name="WIDtotal_fee">
                <input type="hidden" value="${rechargeInfo.charges}" name="charges">
                <input type="hidden" value="${rechargeInfo.rechargeAmount}" name="rechargeAmount">
                <div class="tab_main_row ">

                    <label>充值金额</label>
                    <div class="row_right font1">
                        <span class="r-r-span"><span>${rechargeInfo.rechargeAmount}</span>元</span>
                        <span class="r-r-span">手续费 :<span>${rechargeInfo.charges}</span>元</span>
                        <span class="r-r-span">实收金额 :<span>${rechargeInfo.realPrice}</span>元</span>
                    </div>
                </div>
                <div class="tab_main_row">
                    <label>第三方平台</label>
                    <div class="row_right no3-pingtai">
                        <input type="radio" name="platform" value="alipay" checked>
                        <img src="${ctxStatic}/img/llhb/alipay.png" alt="">
                        <%-- <input type="radio"><img src="${ctxStatic}/img/llhb/tenpay.png" alt="">--%>
                    </div>
                </div>
                <%--<div class="tab_main_row">
                    <label>网银在线</label>
                    <div class="row_right" style="width:600px;margin-bottom: 30px;">
                        <div class="m_r_title">
                            <span class="m_r_tname" style="margin-left: 0">网银支付</span>
                            <span>信用卡支付</span>
                        </div>
                        <ul class="bank">
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-iacboc.png"
                                                                  alt=""></a></li>
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-cconb.png" alt=""></a>
                            </li>
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-bochina.png"
                                                                  alt=""></a></li>
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-aboc.png" alt=""></a>
                            </li>
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-boc.png" alt=""></a>
                            </li>
                            <li><a href="javascript:void(0)"><img src="${ctxStatic}/img/llhb/bank-cpb.png" alt=""></a>
                            </li>
                            <li class="hide-bank"><a href="javascript:void(0)"><img
                                    src="${ctxStatic}/img/llhb/bank-cmb.png" alt=""></a></li>
                            <li class="hide-bank"><a href="javascript:void(0)"><img
                                    src="${ctxStatic}/img/llhb/bank-ccb.png" alt=""></a></li>
                            <li class="hide-bank"><a href="javascript:void(0)"><img
                                    src="${ctxStatic}/img/llhb/bank-sb.png" alt=""></a></li>
                            <li class="show-more-bank">展开更多银行</li>
                        </ul>
                    </div>
                </div>--%>
                <div class="save_or_return">
                    <a href="javascript:rechargeonline2.event.confirm();" class="save_btn">确认支付</a>
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
    $(function () {
        $(".no3-pingtai input[type=radio]").click(function () {
            $(this).siblings('input[type=radio]').attr("checked", false);
        });

        $(".show-more-bank").click(function () {
            $(".hide-bank").show();
            $(this).hide();
        });
        $(".tab_main_row .m_r_title span").click(function () {
            $(this).addClass('m_r_tname').siblings('span').removeClass('m_r_tname');
        });
    });

    var rechargeonline2 = {};

    rechargeonline2.event = {
        confirm: function () {
            var payType = $('input:radio:checked').val();
            if (payType = "alipay") {
                rechargeonline2.payType.alipay();
            }
            $("#rechargeForm").submit();
        }
    };

    rechargeonline2.payType = {
        alipay: function () {
            var url = "${ctx}/alipay/instant2account/alipayapi.jsp";
            $("#rechargeForm").attr("action", url);
        }
    }
</script>
</body>
</html>


