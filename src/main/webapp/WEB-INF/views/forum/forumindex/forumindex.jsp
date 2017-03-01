<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <!--[if IE 8 ]>
    <html lang="en" class="ie8"> <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp" %>
    <title>论坛</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>

    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
    <style>
        /*头部中部start*/
        .header_middle .header_search {
            width: 440px;
            margin-top: 50px;
            margin-left: 80px;
        }

        .header_middle .header_search select {
            float: left;
            height: 35px;
            line-height: 35px;
            width: 92px;
            border: 1px solid #ccc;
        }

        .header_middle .header_search .h_s_middle {
            float: left;
        }

        .header_middle .header_search .h_s_middle input {
            width: 372px;
        }

        .header_middle .header_search .h_s_middle:before {
            content: "";
            display: block;
            width: 20px;
            height: 24px;
            background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;
            position: absolute;
            left: 5px;
            top: 7px;
        }

        .header_right {
            margin-top: 30px;
        }

        /*头部中部end*/
        /*内容start*/

        /*页面修改*/
        input[type=text], .tab_main input[type=password] {
            border: 1px solid #ccc;
            height: 30px;
            text-indent: 5px;
        }

        select {
            border: solid 1px #C9CACA;;
            text-indent: 3px;
            color: #666666;
            height: 32px;
        }

        /*当前位置*/
        .main_row_1 {
            overflow: hidden;
        }

        .cur_position {
            font-size: 12px;
            color: #666;
            margin: 10px 0;
            float: left;
            line-height: 30px;
        }

        .cur_position input {
            width: 290px;
        }

        .cur_position select {
            width: 90px;
        }

        .cur_position .btn {
            width: 70px;
            margin-left: 20px;
        }

        .luntan_resou {
            margin-left: 50px;
        }

        .luntan_resou a {
            margin-right: 20px;
            color: #ccc;
        }

        .luntan_top {
            height: 300px;
            border: 1px solid #ccc;
        }

        .luntan_title {
            height: 40px;
            line-height: 40px;
            color: #fff;
            background: #5ec420;
            padding: 0 20px;
            font-size: 16px;
        }

        .luntan_top .luntan_title {
            color: #666;
            background: #f2f2f2;
        }

        .luntan_top_sub {
            width: 248px;
        }

        .luntan_title a {
            color: #fff;
        }

        /*论坛左侧*/
        .luntan_left {
            width: 755px;
            margin: 15px 15px 50px 0;
        }

        .luntan_neirong {
            border: 1px solid #ccc;
            border-top: none;
        }

        .luntan_neirong_sub {
            width: 365px;
            padding: 15px 0 15px 5px;
        }

        .luntan_tip {
            width: 44px;
            height: 44px;
            background: url(${ctxStatic}/img/llhb/luntan_tip.png) 0 0 no-repeat;
        }

        .luntan_tip_act {
            background: url(${ctxStatic}/img/llhb/luntan_tip_act.png) 0 0 no-repeat;
        }

        .luntan_tip + div {
            margin-left: 10px;
        }

        .luntan_tip + div a {
            color: #5ec520;
            max-width: 200px;
        }

        .luntan-class {
            font-size: 14px;
            line-height: 25px;
        }

        .luntan_fatieshijian {
            margin: 0 5px;
        }

        /*论坛左侧 结束*/
        /*论坛右侧*/
        .luntan_right {
            width: 230px;
            margin-top: 15px;
            margin-bottom: 50px;
        }

        .luntangonggao, .luntan_fatiepaihang {
            border: 1px solid #ccc;
        }

        .luntan_fatiepaihang {
            margin-top: 15px;
        }

        .paihang {
            padding: 0 5px;
            height: 100%;
        }

        .luntan_title .paihang_current {
            color: #666;
            background: #fff;
        }

        .paihang_users {
            width: 55px;
            color: #666;
            overflow: hidden;
            font-size: 12px;
            margin: 10px;
            text-align: center;
        }

        .paihang_users img {
            height: 55px;
            width: 100%;
        }

        .paihang_users p {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /*论坛右侧 结束*/

        /*页面修改end*/

        /*列表样式*/
        .two_list_l {
            overflow: hidden;
            margin: 5px 0;
            width: 100%;
        }

        .two_list_l ul li {
            height: 25px;
            line-height: 25px;
            padding-left: 20px;
        }

        .two_list_l ul li a {
            float: left;
            position: relative;
            margin-left: 5px;
            float: left;
            width: 210px;
        }

        .two_list_l ul li a:before {
            content: "";
            width: 4px;
            height: 4px;
            border-radius: 3px;
            background-color: #333;
            float: left;
            margin-top: 10px;
            margin-right: 5px
        }

        .two_list_l ul li a:hover {
            color: #5EC520;
        }

        .two_list_l ul li a:hover:before {
            background-color: #5EC520;
        }

        .two_list_l ul li span {
            float: right;
            color: #666666;
        }

        .zixunshouye_huanbaozhishi .two_list_l ul li a {
            width: 315px;
        }

        .zixunshouye_xiangmuzhaobiao .two_list_l ul li a {
            width: 232px;
        }

        /*列表样式结束*/

        .main_row_1 .btn_1 {
            width: 110px;
            height: 30px;
            line-height: 30px;
            background-color: #ee7800;
            float: right;
            margin-top: 10px;
            margin-left: 10px;
            position: relative;
            cursor: pointer;
        }

        .main_row_1 .btn_1 a {
            color: #FFF;
            margin-left: 10px;
        }

        /*头部banner图片 start*/
        .main_banner {
            width: 500px;
            height: 400px;
            position: relative;
            margin-bottom: 15px;
        }

        .main_banner .fade_list {
            width: 100%;
            height: 100%;
            position: relative;
        }

        .main_banner .fade_list li {
            position: absolute;
            z-index: 0;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        }

        .main_banner .fade_list li a {
            display: block;
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }

        .main_banner .fade_list li a img {
            width: 100%;
            height: 100%;
        }

        .main_banner .fade_btn {
            position: absolute;
            left: 50%;
            margin-left: -48px;
            bottom: 2px;
            z-index: 0;
            width: 100px;
            text-align: right;
        }

        .main_banner .fade_btn a {
            display: inline-block;
            width: 13px;
            height: 13px;
            background: #CCCCCC;
            opacity: 0.5;
            border-radius: 13px;
            margin: 3px;
            z-index: 3;
            -moz-border-radius: 13px;
            -webkit-border-radius: 13px;
        }

        .main_banner .fade_btn .h_b_btn_sel {
            background: #FFFFFF;
            opacity: 0.8;
        }

        /*头部banner图片 end*/

        /*左侧悬窗 start*/
        .gf_ad_left {
            width: 80px;
            position: absolute;
            top: 298px;
            left: 50%;
            margin-left: -600px;
            z-index: 16;
        }

        .gf_ad_left img {
            width: 100%;
        }

        /*左侧悬窗 end*/

        /*右侧悬框*/
        .gf_ad_right {
            width: 108px;
            height: 305px;
            position: absolute;
            top: 298px;
            right: 50%;
            margin-right: -622px;
            z-index: 15;
        }

        .r_a_top {
            width: 100%;
            position: absolute;
            z-index: 17;
        }

        .r_a_down {
            width: 100%;
            position: absolute;
            z-index: 16;
            top: 92px;
        }

        .r_a_down > div:nth-of-type(1) {
            padding-top: 18px;
        }

        .r_a_cc {
            width: 100%;
            background-color: #5cb531;
            border-top: 1px solid #efefef;
            padding: 13px 0px;
            overflow: hidden;
        }

        .r_a_cc span {
            color: #FFF;
            display: block;
            float: left;
            width: 57px;
            margin-left: 13px;
        }

        .r_a_cc img {
            display: block;
            margin-left: 8px;
            float: left;
        }

        .r_a_cell {
            width: 100%;
            padding: 10px 0px;
            background-color: #efefef;
        }

        .r_a_cell p {
            display: block;
            text-align: center;
        }

        .r_a_cell > p:nth-of-type(2) {
            color: #5cb531;
            font-size: 14px;
        }
        .luntan_neirong_sub .max-width{
            max-width:170px;
        }

    </style>
</head>
<body>
<!--头部 start-->
<header>
    <%--最新图片--%>
    <c:set var="pics" value="${info.forumAdImages}"></c:set>
    <%--最新主题--%>
    <c:set var="themes" value="${info.forumPosts}"></c:set>
    <%--最新回复--%>
    <c:set var="replys" value="${info.forumReplys}"></c:set>
    <%--热帖--%>
    <c:set var="hotPosts" value="${info.hotPosts}"></c:set>
    <%--分区--%>
    <c:set var="boardList" value="${info.forumBoardList}"></c:set>
    <%--公告--%>
    <c:set var="announcements" value="${info.forumAnnouncements}"></c:set>
    <%--日排行--%>
    <c:set var="dayRanklist" value="${info.userPostRanklist.dayRanklist}"></c:set>
    <%--周排行--%>
    <c:set var="weekRanklist" value="${info.userPostRanklist.weekRanklist}"></c:set>
    <%--月排行--%>
    <c:set var="monthRanklist" value="${info.userPostRanklist.monthRanklist}"></c:set>
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp" %>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo">
                <a href="javascript:void(0);">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <%--<div class="header_search">
                <!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a>
                </div>
            </div>--%>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <div class="header_banner" style="height:45px;overflow: visible;">
        <!--头部导航 start-->
        <%@ include file="/WEB-INF/views/include/headerbanner.jsp" %>
        <!--头部导航 end-->
    </div>
    <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main clearfix">
        <div class="main_row_1">
            <div class="cur_position clearfix">

                <input id="post_title" type="text" placeholder="请输入你要搜索的内容" class="fl">
                <select class="fl" name="" id="">
                    <option value="">帖子</option>
                </select>
                <a id="post_search" href="javascript:void(0)" class="btn fl">搜索</a>
                <div class="luntan_resou fl">
                    <span>热搜:</span>
                    <c:forEach items="${searchList}" var="search" begin="0" end="3">
                        <a href="javascript:go('${ctx}/forum/list/?isSubSearch=true&boardId=${boardId}&searchContent=${search.search_content}')">${search.search_content}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- 论坛上部 -->
        <div class="clearfix">
            <div class="luntan_top fl" style="margin-right: 2px;">
                <div class="luntan_top_sub fl" style="border-right: 1px solid #fff;">
                    <div class="luntan_title clearfix">
                        <span class="fl">最新图片</span>
                    </div>
                    <!-- 轮播 -->
                    <div class="main_banner" style="width:220px;height:220px;margin:20px auto;">
                        <!--头部banner图片 start-->
                        <ul class="fade_list">
                            <c:choose>
                                <c:when test="${empty pics}">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <img src="${ctxStatic}/img/llhb/mark_banner_1.png"/>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pics}" var="pic" varStatus="picStatus">
                                        <li <c:if test="${picStatus.index eq 0}">style="display: none;"</c:if>>
                                            <c:choose>
                                                <c:when test="${empty pic.attrs.redirct_href}">
                                                    <a href="javascript:void(0);">
                                                        <img src="${pic.picAddr}"/>
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="javascript:forumindex.openNewPage.ad('${pic.attrs.redirct_href}');">
                                                        <img src="${pic.picAddr}"/>
                                                    </a>
                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                        <!--头部banner小圆圈 start-->
                        <div class="fade_btn"></div>
                        <!--头部banner小圆圈 end-->
                    </div>
                    <!-- 轮播结束 -->
                </div>
                <div class="luntan_top_sub fl">
                    <div class="luntan_title clearfix">
                        <span class="fl">最新主题</span>
                    </div>
                    <!-- 列表样式 -->
                    <div class="two_list_l">
                        <ul>
                            <c:forEach items="${themes}" var="theme" varStatus="themeStatus">
                                <li>
                                    <a href="javascript:forumindex.openNewPage.theme('${theme.forumPost.id}');"
                                       class="m_r_ul_a tmui-ellipsis color_1">
                                            ${theme.forumPost.post_title}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 列表样式结束 -->
                </div>

            </div>
            <div class="luntan_top fl">
                <div class="luntan_top_sub fl" style="border-right: 1px solid #fff;">
                    <div class="luntan_title clearfix">
                        <span class="fl">最新回复</span>
                    </div>
                    <!-- 列表样式 -->
                    <div class="two_list_l">
                        <ul>
                            <c:forEach items="${replys}" var="reply" varStatus="replyStatus">
                                <li>
                                    <a href="javascript:forumindex.openNewPage.reply('${reply.forumReply.post_id}')"
                                       class="m_r_ul_a tmui-ellipsis color_1">
                                            ${reply.forumReply.rp_content}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 列表样式结束 -->
                </div>
                <div class="luntan_top_sub fl">
                    <div class="luntan_title clearfix">
                        <span class="fl">热帖</span>
                    </div>
                    <!-- 列表样式 -->
                    <div class="two_list_l">
                        <ul>
                            <c:forEach items="${hotPosts}" var="hotPost" varStatus="hotPostStatus">
                                <li>
                                    <a href="javascript:forumindex.openNewPage.hotPost('${hotPost.forumPost.post_id}')"
                                       class="m_r_ul_a tmui-ellipsis color_1">
                                            ${hotPost.forumPost.post_title}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 列表样式结束 -->
                </div>
            </div>
        </div>
        <!-- 论坛上部 结束-->

        <!-- 论坛左侧 -->
        <div class="luntan_left fl">
            <c:forEach items="${boardList}" var="board" varStatus="boardStatus">
                <div class="luntan_title clearfix">
                    <span class="fl">${board.mainName}</span>
                    <div class="fr">
                        <span>分区版主:</span>
                        <a href="javascript:void(0)" class="fr">${board.masterName}</a>
                    </div>
                </div>
                <div class="luntan_neirong clearfix">
                    <c:forEach items="${board.childBoard}" var="childBoard">
                        <div class="luntan_neirong_sub fl clearfix">
                            <c:choose>
                                <c:when test="${childBoard.todayCount eq 0}">
                                    <div class="luntan_tip fl">

                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="luntan_tip luntan_tip_act fl">

                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="fl">
                                <div class="luntan-class"
                                     onclick="forumindex.openNewPage.board('${childBoard.boardID}');">
                                    <a href="javascript:void(0)" style="cursor:hand">${childBoard.boardName}</a><a
                                        href="javascript:void(0)">(${childBoard.todayCount})</a>
                                </div>
                                <div>
                                    主题: <span>${empty childBoard.postCount ? 0 : childBoard.postCount}</span>, 帖数
                                    <span>${empty childBoard.totalReplyCount ? 0 : childBoard.totalReplyCount}</span>
                                </div>
                                <div><span class="tmui-ellipsis fl max-width"
                                           href="javascript:void(0)">${childBoard.postTitle}</span>
                                    <span class="fl luntan_fatieshijian">${childBoard.createDate}</span><span
                                            class="fl">${childBoard.loginName}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
        <!-- 论坛左侧 结束-->

        <!-- 论坛右侧 -->
        <div class="luntan_right fr">
            <div class="luntangonggao">
                <div class="luntan_title clearfix">
                    <span class="fl">论坛公告</span>
                    <%--<div class="fr">
                        <a href="javascript:void(0)" class="fr">MORE+</a>
                    </div>--%>
                </div>
                <!-- 列表样式 -->
                <div class="two_list_l">
                    <ul>
                        <c:forEach items="${announcements}" var="announcement" varStatus="announcementStatus">
                            <li>
                                <a href="javascript:forumindex.openNewPage.announcement('${announcement.forumAnnouncements.ann_href}');"
                                   class="m_r_ul_a tmui-ellipsis color_1">
                                        ${announcement.forumAnnouncements.ann_title}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- 列表样式结束 -->
            </div>
            <div class="luntan_fatiepaihang clearfix">
                <div class="luntan_title clearfix">
                    <span class="fl">用户发贴排行</span>
                    <div class="fr clearfix">
                        <a href="javascript:void(0)" class="paihang paihang_current fl">日</a>
                        <a href="javascript:void(0)" class="paihang fl">周</a>
                        <a href="javascript:void(0)" class="paihang fl">月</a>
                    </div>
                </div>
                <div class="clearfix paihang_users_div">
                    <c:set var="defaultImg" value="${ctxStatic}/img/llhb/photo.png"></c:set>
                    <c:forEach items="${dayRanklist}" var="dayUser" varStatus="dayUserStatus">
                        <div class="paihang_users fl" title="${dayUser.name}">
                            <img src="${empty dayUser.pic ? defaultImg : dayUser.pic}"
                                 alt="">
                            <p>${dayUser.name}</p>
                        </div>
                    </c:forEach>
                </div>
                <div class="clearfix paihang_users_div" style="display: none">
                    <c:forEach items="${weekRanklist}" var="weekUser" varStatus="weekUserStatus">
                        <div class="paihang_users fl" title="${weekUser.name}">
                            <img src="${empty weekUser.pic ? defaultImg  : weekUser.pic}"
                                 alt="">
                            <p>${weekUser.name}</p>
                        </div>
                    </c:forEach>
                </div>
                <div class="clearfix paihang_users_div" style="display: none">
                    <c:forEach items="${monthRanklist}" var="monthUser" varStatus="monthUserStatus">
                        <div class="paihang_users fl" title="${monthUser.name}">
                            <img src="${empty monthUser.pic ? defaultImg : monthUser.pic}"
                                 alt="">
                            <p>${monthUser.name}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- 论坛右侧 结束-->


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
<!--左侧悬窗 start-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp" %>


<%@ include file="/WEB-INF/views/include/rightLine.jsp" %>

<script>
    var forumindex = {};

    forumindex.openNewPage = {
        openWin: function (url) {
            window.open(url);
        },
        //广告
        ad: function (url) {
            this.openWin(url);
        },
        //主题跳转
        theme: function (id) {
            var url = "${ctx}/forum/forumlistUser?fid=" + id;
            this.openWin(url);
        },
        //最新回复跳转
        reply: function (id) {
            var url = "${ctx}/forum/forumlistUser?fid=" + id;
            this.openWin(url);
        },
        //热帖跳转
        hotPost: function (id) {
            var url = "${ctx}/forum/forumlistUser?fid=" + id;
            this.openWin(url);
        },
        //分区跳转
        board: function (id) {
            //TODO:分区页面地址
            var url = "${ctx}/forum/list?boardId=" + id;
            this.openWin(url);
        },
        //公告跳转
        announcement: function (url) {
            this.openWin(url);
        },
        //发帖排行跳转
        ranklist: function (id) {
            //TODO:发帖排行页面地址
            var url = "" + id;
            this.openWin(url);
        }
    };

    //
    <!--轮播广告-->
    $(document).ready(function () {
        $(".header_nav ul li").eq(7).addClass("header_nav_sel");
        /*获取图片的盒子对象*/
        var $fadeDom = $(".fade_list");
        /*控制轮播的索引*/
        var idx = 0;
        /*定时器*/
        var fadeTimer = null;
        /*轮播时间*/
        var timer = 3000;
        var length = $(".fade_list li").length;
        $(".main_banner .fade_btn").html("");
        $(".fade_list li").each(function () {
            $(".main_banner .fade_btn").append('<a href="javascript:void(0);" ></a>');
        });
        $(".main_banner .fade_btn").find("a:first").addClass("h_b_btn_sel");

        $(".fade_btn").on("click", "a", function () {
            clearInterval(fadeTimer);
            idx = $(this).index();
            changePic(idx);
            $(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }).mouseleave(function () {
            playFader();
        }).mouseover(function () {
            clearInterval(fadeTimer);
        });

        function playFader() {
            fadeTimer = setInterval(function () {
                idx++;
                if (idx == length) {
                    idx = 0;
                }
                changePic(idx);

            }, timer);
        }

        /*执行轮播*/
        playFader();
    });

    function changePic(idx) {
        $(".main_banner").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
    }

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
        //帖子搜索
        $("#post_search").click(function () {
            go('${ctx}/forum/list?isSubSearch=true&boardId=${boardId}&searchContent=' + $("#post_title").val());
        });
    });

    // 排行 日周月切换
    $(function () {
        $(".luntan_fatiepaihang .luntan_title a").click(function () {
            var index = $(this).index();
            $(this).addClass('paihang_current').siblings().removeClass('paihang_current');
            $('.paihang_users_div').eq(index).show().siblings('.paihang_users_div').hide();
        });
    });
</script>

</body>
</html>


