<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/5
  Time: 14:38
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>论坛后台-消息提醒</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

    <style>
        .isgreen{color:#5ec520;}
        .tab_main .tab_main_row{height:auto;}
        .massage_list li div a{margin:0 5px;}
        .massage_list li div{width:600px;}
        .massage_list li{width:665px;border-bottom: 1px dashed #ccc;padding-bottom: 5px;}
        .user_head{height:55px;width:55px;margin-right: 5px;}
        .before_time{margin-left: 5px;color:#666;}
        .ltht_liuyan{display: none;}
        .tab_title span span{margin-left: 0;}
        .finger{cursor: pointer}
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>论坛管理>消息提醒</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">帖子<span>(${mounts[0]["mount"]})</span></span>
            <span>留言<span>(${mounts[1]["mount"]})</span></span>
        </div>
        <form action="">
            <div class="ltht_tiezi">
                <ul class="massage_list">
                    <c:forEach var="a" items="${one}">
                        <li class="clearfix">
                            <c:if test="${not empty a.headImg}">
                                <img class="fl user_head" src="${a.headImg}" alt="">
                            </c:if>
                            <c:if test="${empty a.headImg}">
                                <img class="user_head fl" src="${ctxStatic}/img/llhb/default.png" alt="">
                            </c:if>
                            <div class="fl">
                                <span class="before_time">${fn:substring(a.create_date, 0, 19)}</span>
                                <a class="isgreen" href="javascript:void(0)">${a.login_name}</a>
                                回复了您的帖子
                               <%-- <a class="isgreen" href="javascript:void(0)">我们的论坛成立了</a>--%>
                                <a class="isgreen finger" onclick="chakan('${a.mes_href}')">查看</a>

                            </div>
                        </li>
                    </c:forEach>

                </ul>
                <!--翻页-->
                <div class="filp_box">
                    <%--<div class="del_all">
                        <input type="button" value="删除选中"/>
                    </div>--%>
                    <div class="filp">
                        <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                        <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                        <c:set var="currentPage" value="${recordPage.pageNumber}" />
                        <c:set var="totalPage" value="${recordPage.totalPage}" />
                        <c:set var="actionUrl" value="${ctx}/forum/messageCall/"/>
                        <c:set var="urlParas" value="?" />
                        <c:set var="pageSizeParaName" value="paginateFenye" />
                        <%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                    </div>
                </div>
            </div>
           <%-- <div class="ltht_liuyan">
                <ul class="massage_list">
                    <c:forEach items="${two}" var="b">
                        <li class="clearfix">
                            <img src="${ctxStatic}/img/llhb/photo.png" alt="" class="user_head fl">
                            <div class="fl">
                                <span class="before_time">${fn:substring(b.create_date, 0, 19)}</span>
                                <a class="isgreen" href="javascript:void(0)">${b.login_name}</a>
                                给您留言

                                <a class="isgreen" onclick="chakan('${b.mes_href}')">查看</a>

                            </div>
                        </li>
                    </c:forEach>

                </ul>
                <!--翻页-->
                <div class="filp_box">
                    &lt;%&ndash;<div class="del_all">
                        <input type="button" value="删除选中"/>
                    </div>&ndash;%&gt;
                    <div class="filp">
                        <c:set var="pageSize" scope="page" value="${recordPage1.pageSize}" />
                        <c:set var="totalRow" scope="page" value="${recordPage1.totalRow}" />
                        <c:set var="currentPage" value="${recordPage1.pageNumber}" />
                        <c:set var="totalPage" value="${recordPage1.totalPage}" />
                        <c:set var="actionUrl" value="${ctx}/forum/messageCall/"/>
                        <c:set var="urlParas" value="?" />
                        <c:set var="pageSizeParaName" value="paginateFenye" />
                        <%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                    </div>
                </div>
            </div>--%>
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
        $(".tab_title>span").click(function(){
            var index=$(this).index();
            $(this).addClass('cur_tab').siblings().removeClass('cur_tab');
            /*$("form > div").eq(index).show().siblings().hide();*/
            location.href="${ctx}/forum/messageCallre";
        });
    });
function  chakan(str){
    window.open(str,"_blank");
}
</script>
</body>
</html>
