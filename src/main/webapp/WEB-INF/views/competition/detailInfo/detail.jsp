<%--
  Created by IntelliJ IDEA.
  User: rongchao
  Date: 2015/12/23
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.qdum.llhb.Competition.enumvalue.BidPriceStatusEnum" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<% request.setAttribute("end", BidPriceStatusEnum.END.getValue()); %>
<% request.setAttribute("within", BidPriceStatusEnum.WITHIN.getValue()); %>
<% request.setAttribute("notCome", BidPriceStatusEnum.NOT_COME.getValue()); %>
<% request.setAttribute("curDate", new Date()); %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if IE 8 ]>
    <html lang="en" class="ie8"> <![endif]-->
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp" %>
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题.">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gufeijiaoyi_xiangqing.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>


    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/dateUtil.js"></script>
    <script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>

    <style>
        .mg-t60 {
            margin-top: 60px;
        }

        .mg-l15 {
            margin-left: 15px;
        }

        .mg-t15 {
            margin-top: 15px;
        }

        .mg-l30 {
            margin-left: 30px;
        }

        .mg-l40 {
            margin-left: 40px;
        }

        /*提醒设置弹出层*/
        .pl-remind-set {
            width: 499px;
            padding-bottom: 0px;
            z-index: 21;
        }

        .pl-remind-set .pl-remind-set-con {
            padding: 30px 30px;
        }

        .rs-con-t {
            border-bottom: 1px solid #ccc;
            padding-bottom: 15px;
            overflow: hidden;
        }

        .rs-con-t > div {
            float: left;
            overflow: hidden;
            margin-left: 1px;
        }

        .rs-con-tl {
            padding-right: 15px;
            border-right: 1px solid #ccc;
        }

        .rs-con-tl-img {
            float: left;
            background: url(${ctxStatic}/img/llhb/gufei-pl-img1.png) 0 0 no-repeat;
            width: 85px;
            height: 45px;
        }

        .rs-con-tr-img {
            float: left;
            background: url(${ctxStatic}/img/llhb/gufei-pl-img2.png) 0 0 no-repeat;
            width: 75px;
            height: 45px;
        }

        .rs-con-div {
            float: left;
        }

        .rs-con-div > span {
            text-align: left;
            display: block;
            margin-top: -3px;
        }

        .rs-con-div > p {
            color: #333;
            font-size: 24px;
        }

        .rs-con-mid {
            padding: 20px 0;
            overflow: hidden;
        }

        .rs-con-mid .rs-con-midl, .rs-con-mid .rs-con-midr {
            float: left;
        }

        .rs-con-mid .rs-con-midr {
            float: right;
        }

        .rs-con-midl .tipstyle {
            font-size: 14px;
            color: #333;
            display: block;
            text-align: left;
        }

        .rs-con-midl .tipstyle span {
            font-size: 12px;
            color: #666;
        }

        .rs-con-mid-row {
            overflow: hidden;
            color: #333;
        }

        .rs-con-mid-row > * {
            float: left;
        }

        .disnone-row {
            display: none;
            height: 24px;
            margin: 6px 0;
        }

        .disnone-row span {
            display: block;
            width: 81px;
            text-align: right;
        }

        .disnone-row input {
            height: 20px;
            line-height: 20px;
            text-indent: 10px;
            border: 1px solid #ccc;
            margin-left: 5px;
        }

        .populayer .checkone {
            width: 250px;
            margin: 5px 0;
        }

        .checkone p {
            float: left;
            overflow: hidden;
            width: 85px;
            margin-left: 0;
            color: #333;
        }

        .checkone p span {
            float: left;
            margin-left: 11px;
        }

        .checkone p .l_square {
            width: 14px;
            height: 14px;
            border: 1px solid #5cb531;
            margin-top: 3px;
            cursor: pointer;
            margin-left: 0;
        }

        .change-phonenumber {
            color: #ee7800;
            float: right;
        }

        .get-messagevlidate {
            border: 1px solid #ccc;
            background-color: #eee;
            height: 20px;
            margin-left: 5px;
        }

        .rs-con-mid {
            border-bottom: 1px solid #ccc;
        }

        .rs-con-midr {
            margin-right: 20px;
        }

        .rs-con-midr > span {
            display: block;
            text-align: center;
            color: #666;
        }

        .rs-con-midr .midr-saomacode {
            width: 120px;
            height: 120px;
            background: url(${ctxStatic}/img/llhb/erweima.png) 0 0 no-repeat;
            background-size: cover;
        }

        .rs-con-b {
            margin-top: 15px;
            overflow: hidden;
        }

        .rs-con-b .btn {
            float: left;
            margin-right: 10px;
            width: 100px;
        }

        .hiddenDom {
            display: none;
        }

        /*yesorno弹出*/
        .btns-yesorno {
            margin-top: 15px;
        }

        .btns-yesorno .yes-btn {
            width: 100px;
            height: 25px;
            line-height: 25px;
            color: #fff;
            background-color: #5ec520;
            border: 1px solid #5ec520;
            margin-right: 100px;
            display: inline-block;
        }

        .btns-yesorno .no-btn {
            width: 100px;
            height: 25px;
            line-height: 25px;
            color: #666;
            background-color: #e9e9e9;
            border: 1px solid #ccc;
            display: inline-block;
        }

        .leadStatus td {
            color: #ee7800;
        }

        .leadStatusSpan {
            color: #fff;
            background-color: #ee7800;
            border: 1px solid #ee7800;
            padding: 1px 2px;
        }
    </style>

</head>
<body>
<input type="hidden" value="${detail.competitionDetail.id}" id="compID">
<input type="hidden" value="${detail.competitionDetail.comp_start_time}" id="compStartTime">
<input type="hidden" value="${detail.competitionDetail.comp_period}" id="compPeriod">
<!--头部 start-->
<header>
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp" %>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <%@ include file="/WEB-INF/views/include/comp_header_middle.jsp" %>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <div class="header_banner" style="height:45px; overflow:visible;">
        <!--头部导航 start-->
        <%@ include file="/WEB-INF/views/include/headerbanner.jsp" %>
        <!--头部导航 end-->
    </div>
    <!--头部banner end-->
</header>
<!--头部 end-->

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>固废竞价>竞品详情
            </div>
            <shiro:user>
                <a href="javascript:void(0)" class="btn cur_position_btn"
                   style="background-color: #ee7800;margin-right: 56px"
                   onclick="competition.win.spikToReleasePage();">发布竞品</a>
            </shiro:user>
            <shiro:guest>
                <a href="javascript:void(0)" class="btn cur_position_btn"
                   style="background-color: #ee7800;margin-right: 56px"
                   onclick="competition.win.tip('对不起，登录后才能发布竞品');">发布竞品</a>
            </shiro:guest>
        </div>

        <!-- 拍卖pm-main模块 -->
        <div class="pm-main">
            <div class="pm-title">
                <%--<h4>危废品</h4><span>长期大量供应</span>--%>
                <h4>危废品</h4><span>${detail.competitionDetail.comp_title}</span>
            </div>

            <!-- 拍卖左侧     -->
            <div class="pm-l">
                <div class="pm-l-bimg mg-t60 mg-l15">
                    <c:choose>
                        <c:when test="${empty detail.competitionDetail.pic1}">
                            <img src="${ctxStatic}/img/llhb/default.png" alt="">
                        </c:when>
                        <c:otherwise>
                            <img src="${detail.competitionDetail.pic1}" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="pm-l-limgs mg-t15 mg-l15">
                    <div class="pm-l-limg">
                        <c:choose>
                            <c:when test="${empty detail.competitionDetail.pic1}">
                                <img src="${ctxStatic}/img/llhb/default.png" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${detail.competitionDetail.pic1}" alt="">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="pm-l-limg">
                        <c:choose>
                            <c:when test="${empty detail.competitionDetail.pic2}">
                                <img src="${ctxStatic}/img/llhb/default.png" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${detail.competitionDetail.pic2}" alt="">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="pm-l-limg">
                        <c:choose>
                            <c:when test="${empty detail.competitionDetail.pic3}">
                                <img src="${ctxStatic}/img/llhb/default.png" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${detail.competitionDetail.pic3}" alt="">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="pm-l-bottom font_1 mg-l15">
                    <span class="l-b-span1"><span
                            id="bmNum">${empty detail.competitionDetail.bmNum ? 0 : detail.competitionDetail.bmNum}</span>人报名</span>
                    <span class="l-b-span2"><span
                            id="remindNum">${empty detail.competitionDetail.remindNum ? 0 : detail.competitionDetail.remindNum}</span>人设置提醒</span>
                    <span class="l-b-span3"><span
                            id="viewNum">${empty detail.competitionDetail.page_view ? 0 : detail.competitionDetail.page_view}</span>次围观</span>
                </div>
            </div>
            <!-- 拍卖左 结束 -->
            <!-- 拍卖中部 -->
            <div class="pm-mid mg-t60">
                <c:if test="${detail.competitionDetail.bidPriceInfo.distanceType eq within}">
                    <div class="zhengzaijinxing font_1">
                        正在进行
                    </div>
                </c:if>
                <div class="pm-mid-div1 ">
                    <div class="pm-mid-div1-row1 mg-l40">
                        <span class="span-l">当前价</span>
                        <span class="row1-span-r1 mg-l15">${empty detail.competitionDetail.bid_price ? '0.00' : detail.competitionDetail.bid_price}</span>
                        <span class="row1-span-r2">元</span>
                        <%--<a href="javascript:void(0)" class="font_1">竞买帮助</a>--%>
                    </div>
                    <div class="pm-mid-div1-row2 mg-l40 mg-t15" id="endDistance">
                        <%--<span class="span-l">距结束</span>
                        <span class="row2-span-type1 mg-l15">00</span>
                        <span class="row2-span-type2">天</span>
                        <span class="row2-span-type1">00</span>
                        <span class="row2-span-type2">时</span>
                        <span class="row2-span-type1">00</span>
                        <span class="row2-span-type2">分</span>
                        <span class="row2-span-type1">00</span>
                        <span class="row2-span-type2">秒</span>--%>
                    </div>
                </div>
                <div class="pm-mid-div2">

                    <div class="pm-mid-div2-row1 mg-l40 mg-t15">
                        <span class="span-l">出价</span>
                        <span class="div2-row2-input mg-l15">
                            <c:choose>
                                <c:when test="${empty detail.competitionRecords.totalRow || detail.competitionRecords.totalRow eq 0}">
                                    <input type="text" readonly
                                           value="${detail.competitionDetail.starting_price + detail.competitionDetail.least_increase}"
                                           id="bidPrice">
                                    <input type="hidden"
                                           value="${detail.competitionDetail.starting_price + detail.competitionDetail.least_increase}"
                                           id="leastestPrice">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" readonly
                                           value="${detail.competitionRecords.list[0].columns.bid_price + detail.competitionDetail.least_increase}"
                                           id="bidPrice">
                                    <input type="hidden"
                                           value="${detail.competitionRecords.list[0].columns.bid_price + detail.competitionDetail.least_increase}"
                                           id="leastestPrice">
                                </c:otherwise>
                            </c:choose>
                            <a href="javascript:void(0)" class="addprice">+</a>
                            <a href="javascript:void(0)" class="subprice">-</a>
                        </span>
                    </div>
                    <div class="pm-mid-div2-row2 mg-l40 mg-t15">
                        <span class="span-l">&nbsp;&nbsp;&nbsp;</span>
                        <shiro:user>
                            <c:choose>
                                <c:when test="${detail.competitionDetail.bidPriceInfo.distanceType eq notCome}">
                                    <c:choose>
                                        <c:when test="${detail.competitionDetail.user_margin_money eq 0 || empty detail.competitionDetail.user_margin_money}">
                                            <a href="javascript:void(0)" class="btn mg-l15" style="width:202px;"
                                               onclick="competition.method.doPayMarginAjax()"
                                               id="payMarginBtn">报名交保证金</a>
                                            <a href="javascript:void(0)" class="btn mg-l15"
                                               style="width:202px;background-color: #E5E5E5;color:#333;display: none">竞价还未开始</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:void(0)" class="btn mg-l15"
                                               style="width:202px;background-color: #E5E5E5;color:#333"
                                               id="compBtn">竞价还未开始</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:when test="${detail.competitionDetail.bidPriceInfo.distanceType eq within}">
                                    <c:choose>
                                        <c:when test="${detail.competitionDetail.user_margin_money eq 0 || empty detail.competitionDetail.user_margin_money}">
                                            <a href="javascript:void(0)" class="btn mg-l15" style="width:202px;"
                                               onclick="competition.method.doPayMarginAjax()"
                                               id="payMarginBtn">报名交保证金</a>
                                            <a href="javascript:void(0)" class="btn mg-l15"
                                               style="width:202px;display: none"
                                               onclick="competition.method.doCompAjax()" id="compBtn">出价</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:void(0)" class="btn mg-l15"
                                               style="width:202px"
                                               onclick="competition.method.doCompAjax()" id="compBtn">出价</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="btn mg-l15"
                                       style="width:202px;background-color: #E5E5E5;color:#333">竞价已结束</a>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${empty detail.competitionDetail.remind_create_time}">
                                    <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr"
                                       onclick="competition.method.doGetUserInfo();">结束前提醒</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr">已设置结束前提醒</a>
                                </c:otherwise>
                            </c:choose>
                        </shiro:user>
                        <shiro:guest>
                            <c:choose>
                                <c:when test="${detail.competitionDetail.bidPriceInfo.distanceType eq end}">
                                    <a href="javascript:void(0)" class="btn mg-l15"
                                       style="width:202px;background-color: #E5E5E5;color:#333">竞价已结束</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="btn mg-l15" style="width:202px"
                                       onclick="competition.win.tip('对不起，登录后才能报名参加竞价!')">报名交保证金</a>
                                    <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr"
                                       onclick="competition.win.tip('对不起，登录后才能设置结束前提醒!')">结束前提醒</a>
                                </c:otherwise>
                            </c:choose>
                        </shiro:guest>
                        <%--<shiro:user>
                            <c:choose>
                                <c:when test="${empty detail.competitionDetail.remind_create_time}">
                                    <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr"
                                       onclick="competition.method.doGetUserInfo();">结束前提醒</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr">已设置结束前提醒</a>
                                </c:otherwise>
                            </c:choose>
                        </shiro:user>--%>
                        <%--<shiro:guest>
                            <a href="javascript:void(0)" class="div2-row2-r font_1" id="remindStr"
                               onclick="competition.win.tip('对不起，登录后才能设置结束前提醒!')">结束前提醒</a>
                        </shiro:guest>--%>
                    </div>
                    <div class="tip-row-div">
                        <span class="font_1">提示 : 先报名交保证金再出价.至少两人报名方可成交.</span>
                        <a href="javascript:void(0)" class="close">X</a>
                    </div>
                </div>
                <div class="pm-mid-div3 mg-t15 mg-l40">
                    <div class="div3-l font_1">
                        <p>起拍价 :
                            <span>${empty detail.competitionDetail.starting_price ? '0.00' : detail.competitionDetail.starting_price}</span>
                        </p>
                        <%--<p>起拍价 : <span>4855.00</span></p>--%>
                    </div>
                    <div class="div3-mid font_1">
                        <p>保证金 : <span>${detail.competitionDetail.margin_money}</span></p>
                        <input type="hidden" id="compMarginMoney"
                               value="${empty detail.competitionDetail.margin_money ? '0.00' : detail.competitionDetail.margin_money}">
                        <%--<p>保证金 : <span>1500.00</span></p>--%>
                    </div>
                    <div class="div3-r font_1">
                        <p>类型 : <span>${detail.competitionDetail.typeName}</span></p>
                        <%--<p>类型 : <span>危险固废</span></p>--%>
                    </div>
                </div>
            </div>
            <!-- 拍卖中部结束 -->

            <!-- 拍卖右侧 -->
            <div class="pm-r">
                <div class="pm-r-t mg-l30">
                    <span>竞买记录</span>
                    <span class="font_1 l_span">(${detail.competitionRecords.totalRow}次出价)</span>
                </div>
                <div class="pm-r-midt mg-l30">
                    <table width="100%">
                        <c:choose>
                            <c:when test="${empty detail.competitionRecords.list}">
                                <tr>
                                    <td>暂无竞买记录</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <th>状态</th>
                                    <th>竞拍人</th>
                                    <th>价格</th>
                                </tr>
                                <c:forEach items="${detail.competitionRecords.list}" var="record"
                                           varStatus="recordStatus">
                                    <tr>
                                        <td>
                                    <span>
                                        <c:choose>
                                            <c:when test="${recordStatus.index eq 0}">领先</c:when>
                                            <c:otherwise>出局</c:otherwise>
                                        </c:choose>
                                    </span>
                                        </td>
                                        <td>${record.columns.nick_name}</td>
                                        <td>￥${record.columns.bid_price}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>
                <div class="pm-r-midb mg-l30">

                    <div class="mibb-div">
                        <div class="mibb-div-img img1">

                        </div>

                        <p class="font_1">现场评估</p>
                    </div>
                    <div class="mibb-div">
                        <div class="mibb-div-img img2">

                        </div>

                        <p class="font_1">专业服务</p>
                    </div>
                    <div class="mibb-div">
                        <div class="mibb-div-img img3">

                        </div>

                        <p class="font_1">诚信交易</p>
                    </div>
                </div>
                <div class="pm-r-b mg-l30">
                    <p class="font_1">扫码用手机出价</p>
                    <div class="saomacode">

                    </div>
                </div>

            </div>
            <!-- 拍卖右侧 结束-->

        </div>
        <!-- 拍卖pm-main模块 结束-->
        <div class="clear"></div>
        <!-- 竞拍流程 -->
        <div class="gufei-jinpailiucheng">
            <div class="jplc-l">
                <p>竞拍流程</p>
                <%--<a href="javascript:void(0)" class="font_1">更多帮助</a>--%>
            </div>
            <div class="jplc-r">
                <!-- 产处用户首页上的模块 复用样式 -->
                <div class="biddingp_main">
                    <ul>
                        <li class="b_m_jingjia b_m_sel">参与竞价</li>
                        <li class="b_m_chenggong">竞价成功</li>
                        <li class="b_m_hetong">签订合同</li>
                        <li class="b_m_fuwu">推荐服务</li>
                        <li class="b_m_huping">双方互评</li>
                    </ul>
                    <p class="font_1" style="display:block">
                        参与竞价：优蚁网为用户提供公开、透明的竞价平台，灵活性的竞拍形式，门槛低，参与面广，提高成交率，让企业以更合理的价格完成交易。</p>
                    <p class="font_1">竞价成功：操作简单，手续费低，达成交易即开始确认合同关系。</p>
                    <p class="font_1">签订合同：多套专业合同模板，更标准化选择满足用户需求，专业第三方监管服务，打造环保产业市场诚信体系。</p>
                    <p class="font_1">推荐服务：优蚁网提供一站式无忧环保服务，帮助企业开展环保业务，解决环保工作，减少业务攻关环节，推广营销，提高业务量。</p>
                    <p class="font_1">双方互评：作为第三方的电子服务平台，优蚁网设置双方互评、项目回访与维权，监督并规范化市场行为，保障用户满意度。</p>
                </div>
            </div>
        </div>
        <!-- 竞拍流程 结束-->

        <!-- tab切换 -->
        <div class="tab-border">
            <div class="tab-change-title ">
                <ul>
                    <li class="act-tab"><a href="#jpgonggao">竞拍公告</a></li>
                    <li><a href="#jpjieshao">竞品介绍</a></li>
                    <li><a href="#jjjilu">竞价记录</a></li>
                </ul>
            </div>
        </div>

        <!-- tab切换结束 -->

        <!-- 竞拍公告内容 部分-->
        <div class="jpgg-neirong">
            <div class="m_r_title"><span class="m_r_tname">重要提示</span></div>
            <div class="zhongyaotishi mg-t15">
                <p>1、竞买前请务必遵照《竞买公告》要求，进行实地看样、调查物品信息、了解竞买资质、委托代理及尾款支付方式等内容。 如违反相关规定，您的账号将会受到影响并产生其它后果，请理性参与竞价！</p>
                <p>2、 竞价双方企业资质已审核，但竞品介绍（图片、文字、视频等）及资质文件均由企业自行发布并上传，所有竞品相关信息一经发布责任自负。</p>
            </div>
            <div class="paimaigonggao" id="jpgonggao" style="margin-bottom:20px;padding-top: 45px;">

                <div class="m_r_title"><span class="m_r_tname">竞买公告</span></div>
                <%--<div class="jingmaigonggao-div1 mg-t15">

                    <h4 style="margin:15px 0 45px;">竞价公告</h4>
                    <p>一、竞买物品基本情况、企业基本情况详情见下表。</p>
                    <p>二、竞买人条件：所有优蚁环保注册用户均可参与竞买，因不符合条件参加竞买的，由竞买人自行承担相应的法律责任。</p>
                    <p>三、如需咨询、看样，请联系平台客服再约定具体时间及方式。</p>
                    <p>
                        四、竞买方式：①所有参与竞价的商品在规定的时间内开始竞价。竞价时间结束后，无底价商品由出价最高者拍得。②所有参与竞价的商品在规定的时间内开始竞价。竞价时间结束后，对于有底价商品，若出价大于最低成交价，则出价最高者拍得该商品；若出价低于最低成交价则不成交。</p>
                    <p>五、竞买物品以实物现状为准，优蚁环保不承担竞买物品的瑕疵保证。特别提醒，有意者请亲自实地看样，未看样的竞买人视为已对本竞买实物现状进行确认，责任自负。</p>
                    <p>六、竞买完成：您可登陆优蚁环保后台查询竞价商品的状态。</p>
                    <p>七、对于恶意捣乱、购买后恶意退货者，优蚁环保有权终止其账户的竞买资格。</p>

                </div>
                <div class="jingmaigonggao-div2 mg-t15">
                    <img src="${ctxStatic}/img/llhb/jingmaigonggao-div2.png" alt="">
                </div>--%>
                ${detail.competitionDetail.comp_announ}
            </div>

            <!-- 竞品介绍 -->
            <div class="jingpinjieshao" id="jpjieshao" style="padding-top: 45px;">
                <div class="m_r_title"><span class="m_r_tname">竞品描述</span></div>
                <%--<div class="jingpinmiaoshu mg-t15">
                    <p>1.竞拍前请务必遵照《竞买公告》、《竞买须知》及《标的物情况介绍表》要求，进行实地看样、调查标的物信息（如过户要求、违章情况等）、了解竞买资质、委托代理及尾款支付方式等内容。
                        如违反相关规定，您的保证金可能会被法院划扣并产生其他司法处罚等后果，请理性参拍！</p>
                    <p>2.竞买人如欲委托他人参拍的，请提前与法院确认是否可行并办理相应的委托手续，否则法院将视被委托人为实际竞买人并办理交割手续。
                        因未办理委托手续导致的二次过户风险及因此产生的相关税费由竞买人自行承担。</p>
                </div>

                <div class="jingpinmiaoshu-div2 mg-t15">
                    <img src="${ctxStatic}/img/llhb/jingmaigonggao_div2.jpg" alt="">
                </div>--%>
                ${detail.competitionDetail.comp_desc}


                <div class="m_r_title"><span class="m_r_tname">检验报告</span></div>
                <div class="jianyanbaogao mg-t15">
                    <c:choose>
                        <c:when test="${empty detail.competitionDetail.testing_report}">
                            <p>暂无检验报告</p>
                        </c:when>
                        <c:otherwise>
                            <img src="${detail.competitionDetail.testing_report}" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="m_r_title"><span class="m_r_tname">所在地</span></div>
                <div class="suozaidi mg-t15">
                    <p>竟拍品所在地: <span>${detail.competitionDetail.prov_name}</span>
                        <span>${detail.competitionDetail.city_name}</span></p>
                </div>
            </div>

            <!-- 竞价记录 -->
            <div class="jingjiajilu" id="jjjilu" style="padding-top: 45px;">
                <div class="m_r_title"><span class="m_r_tname">竞价记录</span></div>
                <div class="jingjiajilu mg-t15">
                    <table>
                        <c:choose>
                            <c:when test="${empty detail.competitionRecords.list}">
                                <tr>
                                    <td>暂无竞买记录</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <th width="12%">状态</th>
                                    <th width="15%">竞拍人</th>
                                    <th width="30%">价格</th>
                                    <th>时间</th>
                                </tr>
                                <tbody id="bottomRecords">
                                <c:forEach items="${detail.competitionRecords.list}" var="record"
                                           varStatus="recordStatus">
                                    <tr <c:if test="${recordStatus.index eq 0}">class="leadStatus"</c:if>>
                                        <td>
                                        <span <c:if test="${recordStatus.index eq 0}">class="leadStatusSpan"</c:if>>
                                            <c:choose>
                                                <c:when test="${recordStatus.index eq 0}">领先</c:when>
                                                <c:otherwise>出局</c:otherwise>
                                            </c:choose>
                                        </span>
                                        </td>
                                        <td>${record.columns.nick_name}</td>
                                        <td>${record.columns.bid_price}</td>
                                        <td><fmt:formatDate value="${record.columns.create_date}"
                                                            pattern="yyyy-MM-dd hh:mm:ss"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>

            </div>
            <div class="btns-div">
                <input id="pageNumber" type="hidden" value="${detail.competitionRecords.pageNumber}">
                <input id="totalRow" type="hidden" value="${detail.competitionRecords.totalRow}">
                <input id="totalPage" type="hidden" value="${detail.competitionRecords.totalPage}">
                <c:choose>
                    <c:when test="${detail.competitionRecords.totalPage le 1}">
                        <a href="javascript:void(0)" class="btn hiddenDom" style="background-color: #E5E5E5;color:#333"
                           id="nextBtn">下一页</a>
                        <a href="javascript:void(0)" class="btn hiddenDom" style="margin-right: 15px;"
                           id="prevBtn">上一页</a>
                    </c:when>
                    <c:when test="${detail.competitionRecords.pageNumber eq 1}">
                        <a href="javascript:void(0)" class="btn" style="background-color: #E5E5E5;color:#333"
                           id="nextBtn">下一页</a>
                        <a href="javascript:void(0)" class="btn hiddenDom" style="margin-right: 15px;"
                           id="prevBtn">上一页</a>
                    </c:when>
                    <c:when test="${detail.competitionRecords.totalPage eq detail.competitionRecords.pageNumber}">
                        <a href="javascript:void(0)" class="btn hiddenDom" style="background-color: #E5E5E5;color:#333"
                           id="nextBtn">下一页</a>
                        <a href="javascript:void(0)" class="btn" style="margin-right: 15px;"
                           id="prevBtn">上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)" class="btn" style="background-color: #E5E5E5;color:#333"
                           id="nextBtn">下一页</a>
                        <a href="javascript:void(0)" class="btn" style="margin-right: 15px;"
                           id="prevBtn">上一页</a>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
        <!-- 拍卖公告结束 -->


    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>

    <!--底部上部信息 start-->
    <%@ include file="/WEB-INF/views/include/footer_top.jsp" %>
    <!--底部上部信息 end-->

    <!--底部下部信息 start-->
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp" %>
    <!--底部下部信息 end-->
</footer>
<!--底部 end-->
<%@ include file="/WEB-INF/views/include/rightLine.jsp" %>
<div id="template" style="display: none">
    <table id="recorders">
        <tr>
            <td><span>出局</span></td>
            <td>M7026</td>
            <td>24,200</td>
            <td>2015年09月14日 10:05:13</td>
        </tr>
    </table>
    <div id="daojishitemp">
        <span class="span-l">距结束</span>
        <span class="row2-span-type1 mg-l15">00</span>
        <span class="row2-span-type2">天</span>
        <span class="row2-span-type1">00</span>
        <span class="row2-span-type2">时</span>
        <span class="row2-span-type1">00</span>
        <span class="row2-span-type2">分</span>
        <span class="row2-span-type1">00</span>
        <span class="row2-span-type2">秒</span>
    </div>
</div>
<script>
    $(function () {
        competition.btnEvent.bindNextBtn();
        competition.btnEvent.bindPrevBtn();
        competition.btnEvent.bindChange();
    });

    var competition = {};
    competition.method = {
        //获取竞价记录
        getRecordsAjax: function (data) {
            var url = "${ctx}/competition/detailInfo/getRecoders";
            $.post(url, data, function (json) {
                if (json.isSuccess) {
                    $("#bottomRecords").empty();
                    var records = json.obj.list;
                    var pageNumber = json.obj.pageNumber;
                    var totalRow = json.obj.totalRow;
                    var totalPage = json.obj.totalPage;
                    $.each(records, function (index, value) {
                        var status = "出局";
                        if (pageNumber == 1) {
                            if (index == 0) {
                                status = "领先";
                            }
                        }
                        competition.drawDom.bottomRecord(value, status);
                    });
                    competition.method.afterPageAjax(pageNumber, totalRow, totalPage);
                }
            }).error(function () {
                competition.win.tip("获取竞价记录失败，请尝试刷新页面重新操作一次~")
            });
        },
        afterPageAjax: function (pageNumber, totalRow, totalPage) {
            $("#pageNumber").val(pageNumber);
            $("#totalRow").val(totalRow);
            $("#totalPage").val(totalPage);
            if (totalRow == 0) {
                $("#prevBtn").addClass("hiddenDom");
                $("#nextBtn").addClass("hiddenDom")
            } else if (pageNumber == 1) {
                $("#prevBtn").addClass("hiddenDom");
                $("#nextBtn").removeClass("hiddenDom")
            } else if (pageNumber == totalPage) {
                $("#prevBtn").removeClass("hiddenDom");
                $("#nextBtn").addClass("hiddenDom")
            } else {
                $("#prevBtn").removeClass("hiddenDom");
                $("#nextBtn").removeClass("hiddenDom")
            }

        },
        //提交保证金
        doPayMarginAjax: function () {
            var compMarginMoney = $("#compMarginMoney").val();
            competition.win.confirmWin("此竞品的保证金为" + compMarginMoney + "元，是否确认报名?", function () {
                var url = "${ctx}/competition/detailInfo/payMargin";
                var compID = $("#compID").val();
                var data = {id: compID};
                $.post(url, data, function (json) {
                    debugger;
                    if (json.isSuccess) {
                        competition.win.tip("报名成功");
                        competition.drawDom.afterPayMargin();
                        var bmNum = parseInt($("#bmNum").text());
                        competition.drawDom.updateNumberInfo("bmNum", bmNum + 1);
                    } else {
                        competition.win.tip(json.msg);
                    }
                    competition.win.closeConfirmWin();
                }).error(function () {
                    competition.win.tip("出错了~！请尝试刷新页面重新操作~");
                });
            });
        },
        //设置提醒
        doRemindAjax: function () {
            var url = "${ctx}/competition/detailInfo/setRemind";
            var compID = $("#compID").val();
            var data = {id: compID};
            $.post(url, data, function (json) {
                if (json.isSuccess) {
                    competition.win.closeRemindWin();
                    $("#remindStr").text("已设置结束前提醒");
                    var remindNum = parseInt($("#remindNum").text());
                    competition.drawDom.updateNumberInfo("remindNum", remindNum + 1);
                } else {
                    competition.win.tip(json.msg);
                }
            }).error(function () {
                competition.win.tip("出错了~！请尝试刷新页面重新操作~");
            });
        },
        //竞价
        doCompAjax: function () {
            var bindMoney = $("#bidPrice").val();
            competition.win.confirmWin("您此次出价为" + bindMoney + "元，是否确认出价？", function () {
                var url = "${ctx}/competition/detailInfo/bidding";
                var compID = $("#compID").val();
                var data = {id: compID, bidPrice: bindMoney};
                $.post(url, data, function (json) {
                    if (json.isSuccess) {
                        var url = "${ctx}/competition/detailInfo?id=" + compID;
                        window.open(url, "_self");
                    } else {
                        competition.win.tip(json.msg);
                    }
                    competition.win.closeConfirmWin();
                }).error(function () {
                    competition.win.tip("对不起，出错了~！请尝试刷新页面重新操作~");
                });
            });
        },
        //获取个人信息
        doGetUserInfo: function () {
            var url = "${ctx}/competition/detailInfo/getUserInfo";
            var data = {};
            $.post(url, data, function (json) {
                        $("#userPhone").text(json.phone);
                        $("#userEmail").text(json.email);
                        competition.win.openRemindWin();
                        competition.btnEvent.popConfirm();
                    })
                    .error(function () {
                        competition.win.tip("获取用户信息失败!");
                    });
        }
    };

    //校验相关
    competition.validater = {
        //检查电话
        checkPhone: function (id) {
            debugger;
            var phone = $("#" + id).html();
            var phoneReg = /^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/;
            if (phone == "") {
                competition.win.tip("请填写电话及移动电话");
                return false;
            } else if (phoneReg.test(phone)) {
                return true;
            } else {
                competition.win.tip("请填写正确的电话及移动电话");
                return false;
            }
        },
        //检查邮箱
        checkEmail: function (id) {
            var email = $("#" + id).html();
            var emailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            if (email == "") {
                competition.win.tip("请填写邮箱");
                return false;
            } else if (emailReg.test(email)) {
                return true;
            } else {
                competition.win.tip("请填写正确的邮箱");
                return false;
            }
        },
        //获取选中的提醒方式
        getChecked: function () {
            debugger;
            var currentClass = this;
            var isPassed = true;
            $("#remindWin .checkone_sel").each(function () {
                var id = $(this).parent().next().attr("id");
                if (id == "userPhone") {
                    if (!currentClass.checkPhone(id)) {
                        isPassed = false;
                        return false;
                    }
                } else {
                    if (!currentClass.checkEmail(id)) {
                        isPassed = false;
                        return false;
                    }
                }
            });
            return isPassed;
        }
    };

    //按钮时间类
    competition.btnEvent = {
        //给下一页按钮绑定事件
        bindNextBtn: function () {
            $("#nextBtn").bind("click", function () {
                competition.btnEvent.pageBtnCallbackFunc("next");
            });
        },
        //给上一页按钮绑定事件
        bindPrevBtn: function () {
            $("#prevBtn").bind("click", function () {
                competition.btnEvent.pageBtnCallbackFunc("prev");
            });
        },
        //上一页和下一页按钮的绑定回调事件
        pageBtnCallbackFunc: function (pageType) {
            var pageNumber = "";
            if (pageType == "next") {
                pageNumber = parseInt($("#pageNumber").val()) + 1;
            } else {
                pageNumber = parseInt($("#pageNumber").val()) - 1;
            }
            var compID = $("#compID").val();
            var data = {
                id: compID,
                pageNumber: pageNumber
            };
            competition.method.getRecordsAjax(data);
        },
        //设置提醒弹出框中确定按钮的点击事件
        popConfirm: function () {
            $(".rs-con-b a").eq(0).bind("click", function () {
                if (competition.validater.getChecked()) {
                    competition.method.doRemindAjax();
                }
            });
        },
        //设置提醒弹出框中取消按钮的点击事件
        popCancel: function () {
            $(".rs-con-b a").eq(1).bind("click", function () {
                $(".popumask").trigger('click');
            });
        },
        //加减竞价按钮绑定事件
        givePrice: function () {
            //加价按钮事件
            $(".pm-mid-div2-row1 .div2-row2-input .addprice").click(function () {
                var value = Number($(".pm-mid-div2-row1 .div2-row2-input input").val());
                var leastIncrease = Number(${detail.competitionDetail.least_increase});
                var result = accAdd($(".pm-mid-div2-row1 .div2-row2-input input").val(), leastIncrease);
                $(".pm-mid-div2-row1 .div2-row2-input input").eq(0).val(result.toFixed(2));
            });
            //减价按钮事件
            $(".pm-mid-div2-row1 .div2-row2-input .subprice").click(function () {
                var value = parseFloat($(".pm-mid-div2-row1 .div2-row2-input input").val());
                var leastPrice = parseFloat($("#leastestPrice").val());
                if (value > leastPrice) {
                    var result = accSub($(".pm-mid-div2-row1 .div2-row2-input input").val(), ${detail.competitionDetail.least_increase});
                    $(".pm-mid-div2-row1 .div2-row2-input input").eq(0).val(result);
                } else {

                }
            });
        },
        bindChange: function () {
            $(".change-phonenumber").bind("click", function () {
                competition.win.spikToUserPage();
            });
        },
        bindEndRemindBtn: function () {
            competition.method.doGetUserInfo();
        }
    };

    //工具类
    competition.utils = {
        //格式化时间
        formatDate: function (dateStr) {
            var date = dateUtil.getDate(dateStr);
            var resultDate = date.format("yyyy-MM-dd hh:mm:ss");
            return resultDate;
        }
    };

    //动态画Dom相关
    competition.drawDom = {
        //动态画下方分页获取竞买记录Dom方法
        bottomRecord: function (data, status) {
            var recorders = $("#recorders tr").clone();
            $(recorders).find("td").eq(0).find("span").text(status);
            $(recorders).find("td").eq(1).text(data.nick_name);
            $(recorders).find("td").eq(2).text(data.bid_price);
            $(recorders).find("td").eq(3).text(competition.utils.formatDate(data.create_date));
            $("#bottomRecords").append($(recorders));
        },
        //缴纳保证金后事件
        afterPayMargin: function () {
            //$("#payMarginBtn").css("display", "none");
            var btn = $("#payMarginBtn").next();
            $("#payMarginBtn").remove();
            btn.css("display", "");
        },
        //画距结束
        drawEndDistance: function (type, d, h, m, s) {
            var djs = $("#daojishitemp").clone();
            if (type == "${within}") {
                $(djs).find("span").eq(0).text("距结束");
            } else if (type == "${notCome}") {
                $(djs).find("span").eq(0).text("距开始");
            } else {
                $("#endDistance").append("<span>竞价已结束</span>");
                return;
            }
            $(djs).find("span").eq(1).text(d);
            $(djs).find("span").eq(3).text(h);
            $(djs).find("span").eq(5).text(m);
            $(djs).find("span").eq(7).text(s);
            $("#endDistance").empty();
            $(djs).find("span").each(function () {
                $("#endDistance").append($(this));
            });
        },
        updateNumberInfo: function (domID, result) {
            $("#" + domID).html(result);
        }
    };

    //窗口相关
    competition.win = {
        //跳转新窗口
        openWin: function (url) {
            window.open(url);
        },
        spikToReleasePage: function () {
            var url = "${ctx}/home?str=/competition/inforMan/add";
            this.openWin(url);
        },
        //打开结束前提醒弹出框
        openRemindWin: function () {
            $(".pl-remind-set").show();
            $(".popumask").show();
        },
        //关闭结束前提醒弹出框
        closeRemindWin: function () {
            $(".populayer").fadeOut();
            $(".popumask").fadeOut();
        },
        //跳转到个人信息页面
        spikToUserPage: function () {
            //TODO: by rongch url填写个人信息修改页面
            var url = "${ctx}/home?str=/perinfo";
            this.openWin(url);
        },
        //不带确定的提示框
        tip: function (msg) {
            $(".popumask").show();
            $(".pl_normal .pl_content p").html(msg);
            $(".pl_normal").show();
            setTimeout(function () {
                $(".popumask").fadeOut();
                $(".pl_normal .pl_content p").html("");
                $(".pl_normal").hide();
            }, 3000);
        },
        //带确定的提示框 确定方法要自己在子页面写,$(".yes-btn", window.parent.document).unbind().on("click",func);
        confirmWin: function (msg, callbackFunc) {
            $(".pl_yesorno .pl_content p").text(msg);
            $(".pl_yesorno").show();
            $(".popumask").show();
            $(".yes-btn").unbind().on("click", callbackFunc);
            $(".no-btn").unbind().on("click", competition.win.closeConfirmWin);
        },
        closeConfirmWin: function () {
            $(".pl_yesorno .pl_content p").text("");
            $(".pl_yesorno").fadeOut();
            $(".popumask").fadeOut();
        }
    };
</script>
<script>
    function checktime(time) {
        if (time < 10) {
            time = "0" + time;
            return time;
        } else {
            return time;
        }
    }

    function show_l_time(type, lefttime) {
        var d = checktime(parseInt(lefttime / (24 * 60 * 60)));
        var h = checktime(parseInt(lefttime / (60 * 60) % 24));
        var m = checktime(parseInt(lefttime / 60 % 60));
        var s = checktime(parseInt(lefttime % 60));
        competition.drawDom.drawEndDistance(type, d, h, m, s);
    }

    function djs(type, lefttime) {
        if (type != "${end}") {
            var lt = parseInt(lefttime);
            setInterval(function () {
                lt = lt - 1;
                show_l_time(type, lt);
            }, 1000);
        } else {
            competition.drawDom.drawEndDistance("${end}", 0, 0, 0, 0);
        }

    }
    $(function () {
        djs("${detail.competitionDetail.bidPriceInfo.distanceType}", "${detail.competitionDetail.bidPriceInfo.timeDistance}");
    });


    $(function () {
        var contentNavArr = [];
        var ad_top = $(".header_banner").each(function () {
            contentNavArr.push($(this).offset().top);

        });
        /*滚动条事件*/
        $(window).scroll(function () {
            /*左右悬窗定位*/
            if ($(window).scrollTop() > contentNavArr[0]) {
                $(".nav_bottomlist").show();
                $(".gf_ad_left,.gf_ad_right").css({position: "fixed", top: "95px"});


            } else if ($(window).scrollTop() <= contentNavArr[0]) {
                $(".nav_bottomlist").hide();
                $(".gf_ad_left,.gf_ad_right").css({position: "absolute", top: "311px"});
            }
        });
        $(".content").click(function () {
            go('固废供求-副本-9-17.html');
        });
    });

    /**
     ** 加法函数，用来得到精确的加法结果
     ** 说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。
     ** 调用：accAdd(arg1,arg2)
     ** 返回值：arg1加上arg2的精确结果
     **/
    function accAdd(arg1, arg2) {
        var r1, r2, m, c;
        try {
            r1 = arg1.toString().split(".")[1].length;
        }
        catch (e) {
            r1 = 0;
        }
        try {
            r2 = arg2.toString().split(".")[1].length;
        }
        catch (e) {
            r2 = 0;
        }
        c = Math.abs(r1 - r2);
        m = Math.pow(10, Math.max(r1, r2));
        if (c > 0) {
            var cm = Math.pow(10, c);
            if (r1 > r2) {
                arg1 = Number(arg1.toString().replace(".", ""));
                arg2 = Number(arg2.toString().replace(".", "")) * cm;
            } else {
                arg1 = Number(arg1.toString().replace(".", "")) * cm;
                arg2 = Number(arg2.toString().replace(".", ""));
            }
        } else {
            arg1 = Number(arg1.toString().replace(".", ""));
            arg2 = Number(arg2.toString().replace(".", ""));
        }
        return (arg1 + arg2) / m;
    }

    /**
     ** 减法函数，用来得到精确的减法结果
     ** 说明：javascript的减法结果会有误差，在两个浮点数相减的时候会比较明显。这个函数返回较为精确的减法结果。
     ** 调用：accSub(arg1,arg2)
     ** 返回值：arg1加上arg2的精确结果
     **/
    function accSub(arg1, arg2) {
        var r1, r2, m, n;
        try {
            r1 = arg1.toString().split(".")[1].length;
        }
        catch (e) {
            r1 = 0;
        }
        try {
            r2 = arg2.toString().split(".")[1].length;
        }
        catch (e) {
            r2 = 0;
        }
        m = Math.pow(10, Math.max(r1, r2)); //last modify by deeka //动态控制精度长度
        n = (r1 >= r2) ? r1 : r2;
        return ((arg1 * m - arg2 * m) / m).toFixed(n);
    }
</script>
<!-- 弹出层 题型设置 -->
<div class="popumask"></div>
<div class="populayer pl-remind-set" id="remindWin">
    <div class="layer_top">
        <span>提醒设置</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content pl-remind-set-con font_1">
        <div class="rs-con-t">
            <div class="rs-con-tl">
                <div class="rs-con-tl-img">

                </div>
                <div class="rs-con-div">
                    <span>${detail.competitionDetail.comp_start_time}</span>
                    <p>开拍时</p>
                </div>
            </div>
            <div class="rs-con-tr">
                <div class="rs-con-tr-img">

                </div>
                <div class="rs-con-div">
                    <span>${detail.competitionDetail.comp_end_time}</span>
                    <p>结束前30分钟</p>
                </div>
            </div>
        </div>
        <div class="rs-con-mid">
            <div class="rs-con-midl">
                <span class="tipstyle">提醒方式 <span>(您可以在我的拍卖-设置中找到哦 ! )</span></span>
                <div class="rs-con-mid-row checkone">
                    <p>
                        <span class="l_square checkone_sel"></span>
                        <span class="mid-row-dtitle">手机短信 :</span>
                    </p>

                    <span id="userPhone">13025568256</span>
                    <a href="javascript:void(0)" class="change-phonenumber">修改</a>
                </div>
                <%--<div class="rs-con-mid-row disnone-row">
                    <span class="mid-row-dtitle">手机号 :</span>
                    <input type="text" class="row-input" style="width:162px;">
                </div>
                <div class="rs-con-mid-row disnone-row">
                    <span class="mid-row-dtitle">验证码 :</span>
                    <input type="text" class="row-input" style="width:100px;">
                    <a href="javascript:void(0)" class="get-messagevlidate">手机短信免费获取</a>
                </div>--%>

                <%--<div class="rs-con-mid-row checkone">
                    <p>
                        <span class="l_square checkone_sel"></span>
                        <span class="mid-row-dtitle">阿里旺旺 :</span>
                    </p>
                    <span>13025568256</span>

                </div>--%>
                <div class="rs-con-mid-row checkone">
                    <p>
                        <span class="l_square checkone_sel"></span>
                        <span class="mid-row-dtitle">邮箱 :</span>
                    </p>
                    <span id="userEmail"></span>

                </div>
            </div>
            <div class="rs-con-midr">
                <span>扫码用手机出价</span>
                <div class="midr-saomacode">

                </div>
            </div>

        </div>
        <div class="rs-con-b">
            <a href="javascript:void(0)" class="btn" style="border:1px solid #5CB531">确定</a>
            <a href="javascript:void(0)" class="btn"
               style="border:1px solid #ccc;background-color: #fff;color:#666;">取消</a>
        </div>
    </div>
</div>
<!-- 弹出层 提醒设置结束 -->
<!-- 带是否按钮的弹出层 -->
<div class="populayer pl_yesorno">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!<br/>否则不能完成认证!</p>

        <div class="btns-yesorno">
            <a href="javascript:void(0)" class="yes-btn">确定</a>
            <a href="javascript:void(0)" class="no-btn">取消</a>
        </div>
    </div>
</div>
<div class="populayer pl_normal">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>

    </div>
</div>
<!--图标提示-->
<script>

    $(function () {
        //tab切换
        tab_scroll_change();
        //竞价流程  点击
        $(".biddingp_main ul li").click(function () {
            if ($(this).hasClass("b_m_sel")) {

            } else {
                $(this).siblings().removeClass("b_m_sel").end().addClass("b_m_sel");
                $(".biddingp_main>p").eq($(this).index()).show().siblings("p").hide();
            }
        });

        //拍卖图片覆盖切换
        $(".pm-l-limg").mouseover(function (event) {
            /* Act on the event */
            $(".pm-l-bimg").find("img").attr("src", $(this).find("img").attr("src"));
        });

        //报名保证金小提示
        $(".tip-row-div a").click(function () {
            $(".tip-row-div").hide();
        });

        //出价 加减
        competition.btnEvent.givePrice();
        //弹出层方法
        populayer_fn(".pm-mid-div2-row2 .div2-row2-r");
        //提醒设置弹出层
//        $(".change-phonenumber").click(function () {
//            $(".disnone-row").slideToggle("fast");
//        });
        $(".checkone p .l_square").unbind('click').on("click", function () {
            $(this).toggleClass('checkone_sel');
        });
        competition.btnEvent.popCancel();
    });

    //tab切换
    function tab_scroll_change() {
        var tab_scroll_top = $(".tab-change-title").offset().top;
        $(window).scroll(function () {
            if ($(window).scrollTop() >= tab_scroll_top) {
                $(".tab-change-title").addClass("fixed-t-c-title");
            } else {
                $(".tab-change-title").removeClass("fixed-t-c-title");
            }


        });
        $(".tab-change-title li").click(function () {
            $(this).addClass('act-tab').siblings().removeClass('act-tab');
        });
    }

    // 弹出层方法
    function populayer_fn(btn) {
        $(".popumask").css({"width": $(window).width() + "px", "height": $(window).height() + "px"});
        //弹出层 添加对号
        $(".checkone p .l_square").click(function () {
            $(this).parent().parent().find("span").removeClass("checkone_sel");
            $(this).addClass("checkone_sel");
        });
        //弹出层 关闭
        $(".populayer .layer_top a").click(function () {
            competition.win.closeRemindWin();
        });
        $(".popumask").click(function () {
            competition.win.closeRemindWin();
        });
        //弹出层 进入优蚁
        // $(".populayer register_done").click(function(){
        //     //跳转页面
        //     //location.assign("https://www..com");
        // });
    }
</script>

</body>
</html>



