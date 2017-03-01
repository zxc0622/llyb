<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/30
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>论坛</title>
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>


    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>

    <style>
        /*头部中部start*/
        .header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
        .header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
        .header_middle .header_search .h_s_middle{float:left;}
        .header_middle .header_search .h_s_middle input{width:372px;}
        .header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
        .header_right{margin-top:30px;}
        /*头部中部end*/
        /*内容start*/

        /*页面修改*/
        input[type=text],.tab_main input[type=password]{border:1px solid #ccc; height:30px;text-indent: 5px;}
        select {border: solid 1px #C9CACA;;text-indent: 3px;color: #666666; height:32px;}
        /*当前位置*/
        .main_row_1{overflow:hidden;}
        .cur_position{font-size:12px; color:#666; margin:10px 0;line-height: 30px;}
        .cur_position input{width:290px;}
        .cur_position select{width:90px;}
        .cur_position .btn{width:70px;margin-left: 20px;}
        .cur_position + div{font-size: 12px;color:#666;}
        .luntan_resou{margin-left: 50px;}
        .luntan_resou a{margin-right: 20px;color:#ccc;}

        .ltliebiao_fatie_fanye{margin-top: 15px;}
        /*翻页*/
        input[type=button]{border:1px solid #ccc; height:33px;background-color:#fff; padding:0 5px; text-align:center;}
        input[type=button].cur_page{background:#5ec520;color:#fff;}
        /*翻页 结束*/

        /*左侧悬窗 start*/
        .gf_ad_left{width:80px;position:absolute;top:298px;left:50%; margin-left:-600px;z-index:16;}
        .gf_ad_left img{width:100%;}
        /*左侧悬窗 end*/

        /*右侧悬框*/
        .gf_ad_right{width:108px; height:305px;  position:absolute; top:298px ; right:50%; margin-right:-622px; z-index:15;}
        .r_a_top{width:100%; position:absolute;z-index:17;}
        .r_a_down{width:100%; position:absolute; z-index:16; top:92px;}
        .r_a_down>div:nth-of-type(1){padding-top:18px;}
        .r_a_cc{width:100%;background-color:#5cb531; border-top:1px solid #efefef; padding:13px 0px; overflow:hidden;}
        .r_a_cc span{color:#FFF;display:block; float:left; width:57px; margin-left:13px;}
        .r_a_cc img{display:block; margin-left:8px; float:left; }
        .r_a_cell{ width:100%;padding:10px 0px ; background-color:#efefef;}
        .r_a_cell p{display:block; text-align:center;}
        .r_a_cell>p:nth-of-type(2){color:#5cb531; font-size:14px; }

        /*页面修改*/
        .ltyonghu_mian{margin-top: 10px;}
        .ltyonghu_for_admin{margin:5px 0;}
        .ltyonghu_for_admin a{color:#666;}
        .ltyonghu_for_admin a:not(.btn):hover{color:#5EC520;}
        .ltyonghu_lou_div a:not(.btn):hover{color:#5EC520;}
        .ltyonghu_lou_div{border:1px solid #ccc;background: #f2f2f2;padding-bottom: 0px;}
        .ltyonghu_lou{border-bottom:none;}
        .ltyonghu_lou_first{border-bottom: 1px solid #ccc;}
        /*楼_左侧*/
        .lou_left{width:160px;height:100%;background: #f2f2f2;font-size: 12px;color:#666;text-align: center;}
        .isgreen{color:#5ec520;}
        .lou_l_LandR,.lou_r_title{height:55px;line-height: 55px;}
        .lou_l_uname,.lou_r_top{height:35px;line-height: 35px;border-bottom: 1px dashed #ccc;margin-bottom: 5px;}
        .lou_l_uname{text-indent: -63px;}
        .lou_l_upic{margin:20px auto 15px;display: block;width:108px;height:108px;}
        .lou_l_uzandut,.lou_l_renzheng{display: inline-block;}
        .lou_l_uzandut .fl:first-child{border-right:1px solid #ccc;}
        .lou_l_uzandut .fl{padding:0 10px;}
        .lou_l_uzandut .fl span{display: block;}

        .lou_l_renzheng>div{height:30px;width:30px;}
        /*认证图标*/
       /* .renzheng_you{background:url(${ctxStatic}/img/llhb/renzheng_2.png) 0 -33px no-repeat;}
        .renzheng_qi{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -28px -33px no-repeat;}
        .renzheng_tong{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -55px -33px no-repeat;}
        .renzheng_you_act{background:url(${ctxStatic}/img/llhb/renzheng_2.png) 0 2px no-repeat;}
        .renzheng_qi_act{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -28px 2px no-repeat;}
        .renzheng_tong_act{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -55px 2px no-repeat;}*/

        .sendmassage{margin-top: 25px;}
        /*楼_左侧 结束*/

        /*楼_右侧*/
        .lou_right{padding:0 15px;width: 805px;background: #fff;padding-bottom: 5px;}
        .lou_r_title{font-size: 18px;}
        .lou_r_con{min-height:333px;border-bottom: 1px dashed #ccc;padding-bottom: 5px;}
        .lou_r_bottom{height:40px;line-height: 40px;}

        .a_resp:before{float: left;margin-top:12px;margin-right: 5px;content: "";width:17px;height: 17px;display: inline-block;background: url(${ctxStatic}/img/llhb/ltyonghu_resp.png) 0 0 no-repeat;}
        .a_resp_extend{border:1px solid #ccc;border-bottom: none;line-height: 1;margin-top: 10px;padding: 5px 10px 6px;background: #fff;}
        .a_resp_extend:before{content: "收起";background:transparent;width:32px;margin: 0;}

        /*回复展开*/
        .resp_div{display: none;border:1px solid #ccc;padding:10px;font-size: 12px;margin-top: -2px;padding-bottom: 0;margin-bottom: 10px;width:784px;}
        .each_resp{border-bottom: 1px dashed #ccc;padding: 5px 0;}
        .each_resp_top >img{height:50px;width:50px;}
        .each_resp_con{margin-left: 10px;}
        .my_resp{margin:5px auto;}
        .my_resp textarea{display: block;width:772px;border:1px solid #ccc;padding:5px;margin-bottom: 5px;}
        .my_resp .btn{width:80px;}

        /*楼_右侧 结束*/

        .ltyonghu_talk{height: 85px;line-height: 85px;margin-top: 2px;color:#666;}
        .submit_myresp_div{height:30px;line-height: 30px;color:#666;margin:15px 0;}
        /*页面修改 结束*/



        .header_banner{height:45px;overflow:visible;}


        .xfno{background:url(${ctxStatic}/img/llhb/renzheng_2.png) 0 -33px no-repeat;}
        .qino{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -28px -33px no-repeat;}
        .geno{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -55px -33px no-repeat;}
        .xf{background:url(${ctxStatic}/img/llhb/renzheng_2.png) 0 2px no-repeat;}
        .qi{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -28px 2px no-repeat;}
        .ge{background:url(${ctxStatic}/img/llhb/renzheng_2.png) -55px 2px no-repeat;}
        .yanse{color:#5ec520;
            float: left;}

        .attachment_div{border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
        .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
        .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
        .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
        .add_attachment_btn>a{color:#5EC520;}

        .lou_r_con img{max-width: 700px;}
    </style>
</head>
<body>
<!--头部 start-->
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start--
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->


        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo">
                <a href="javascript:void(0);">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
                <div class="h_s_middle font_1">
                    <input type="search" id="text" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" onclick="searchtext()" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <div class="header_banner"style="margin-top: 15px;">
        <!--头部导航 start-->
        <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
        <!--头部banner end-->
        <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main clearfix">
        <div class="main_row_1">
            <div class="cur_position"></div>
            <div>
                当前位置>${pos.lname}><a style="cursor: pointer;color: #5EC520" onclick="board(${pos.bid})">${pos.bname}</a>>${t.board_name}
            </div>
        </div>
        <div class="ltliebiao_fatie_fanye clearfix">
            <a href="javascript:posting()"class="fl btn">发帖</a>
            <div class="fanye fr">
                <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                <c:set var="currentPage" value="${recordPage.pageNumber}" />
                <c:set var="totalPage" value="${recordPage.totalPage}" />
                <c:set var="actionUrl" value="${ctx}/forum/forumlistUser/"/>
                <c:set var="urlParas" value="?fid=${fid}&paramUid=${paramUid}" />
                <c:set var="pageSizeParaName" value="paginateFenye" />
                <%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
            </div>
        </div>

        <div class="ltyonghu_mian">
            <c:set var="len" value="${fn:length(admin)}"></c:set>
            <c:set value="false" var="yes"></c:set>
            <!-- 管理员有删除回复 -->
            <c:forEach items="${admin}" var="m">
                <c:if test="${user.id eq m.user_id}">
                    <c:set var="yes" value="true"></c:set>
                </c:if>
            </c:forEach>
            <c:if test="${yes eq true}">
                <div class="ltyonghu_for_admin">
                    <a href="javascript:deletetheme()">删除主题</a> |
                    <a href="javascript:poptop()" id="pop">取消置顶 |</a>
                    <a href="javascript:puttop()" id="put">置顶 |</a>
                    <a href="javascript:nojiajing()" id="adst">取消加精</a>
                    <a href="javascript:jiajing()" id="add">加精</a>
                  <%-- <c:choose>
                        <c:when test="${t.is_top eq 1}">
                            <a href="javascript:poptop()" id="pop">取消置顶</a> |
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:puttop()" id="put">置顶</a> |
                        </c:otherwise>
                    </c:choose>
                   <c:choose>
                        <c:when test="${t.good eq 1}">
                            <a href="javascript:nojiajing()" id="adst">取消加精</a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:jiajing()" id="add">加精</a>
                        </c:otherwise>
                    </c:choose>--%>



                </div>
            </c:if>


            <!-- 管理员有删除回复 -->
            <div class="ltyonghu_lou_div">
                <div class="ltyonghu_lou ltyonghu_lou_first clearfix">

        <div class="ltyonghu_lou_div" >
            <c:if test="${currentPage eq 1}">
                <div class="ltyonghu_lou ltyonghu_lou_first clearfix">
                    <div class="lou_left fl">
                        <div class="lou_l_LandR">
                            查看: <span class="isgreen">${t.page_view}</span>
                            | 回复:<span class="isgreen">${num.num}</span>
                        </div>
                        <div class="lou_l_uname">
                                <%--<c:if test="${u.is_anony eq true}">
                                    匿名
                                </c:if>
                                <c:if test="${u.is_anony eq false}">
                                    ${u.login_name}
                                </c:if>--%>
                                ${t.login_name}
                        </div>
                        <c:if test="${not empty t.head_img}">
                            <img class="lou_l_upic" src="${t.head_img}" alt="">
                        </c:if>
                        <c:if test="${empty t.head_img}">
                            <img class="lou_l_upic" src="${ctxStatic}/img/llhb/default.png" alt="">
                        </c:if>
                            <%-- <img class="lou_l_upic" src="${ctxStatic}/img/llhb/photo.png" alt="">--%>

                        <div class="clearfix lou_l_uzandut">
                                <%-- <div class="fl">
                                     <span class="isgreen">268</span>
                                     <span>主题</span>
                                 </div>
                                 <div class="fl">
                                     <span class="isgreen">268</span>
                                     <span>帖子</span>
                                 </div>--%>
                        </div>
                        <div class="lou_l_renzheng clearfix">

                            <div class="renzheng_you fl ${t.xauth}">

                            </div>

                            <div class="renzheng_qi_act fl ${t.cauth}">

                            </div>
                            <c:if test="${t.pauth}">

                            </c:if>
                            <div class="renzheng_tong_act fl ${t.pauth}">

                            </div>
                        </div>
                            <%--<div class="sendmassage">
                                <a href="javascript:void(0)">
                                    <img src="${ctxStatic}/img/llhb/ltyonghu_sendm.png" alt="">
                                    发消息
                                </a>
                            </div>--%>



                    </div>
                    <div class="lou_right fl">
                        <div class="lou_r_title tmui-ellipsis">
                                ${t.post_title}
                        </div>
                        <div class="lou_r_top">
                            <img src="${ctxStatic}/img/llhb/ltyonghu_user.png" alt="">
                            发表于
                            <span>${fn:substring(t.fdate,0,19)}</span>
                            |
                            <a href="javascript:onlysee('${t.uid}')">只看该作者</a>
                        </div>
                        <div class="lou_r_con" style="overflow: hidden;">
                                ${t.post_content}
                        </div>
                            <%--<div class="lou_r_bottom clearfix">

                                <a class="fr a_resp" href="javascript:togglehuifu('${u.id}')"><span>回复</span>
                                    <script>
                                        $(function(){
                                            huifu(${u.id});
                                        })

                                    </script>
                                    <span></span></a>
                            </div>--%>
                        <c:set var="zz" value="${fn:substring(t.create_date,0,19)}"></c:set>
                            <%--<div class="resp_div" >
                                <c:forEach  items="${rts}" var="t" varStatus="stat">
                                    <c:if test="${t.reply_id eq t.id}" var="aa" >
                                        <div class="each_resp" >
                                            <div class="each_resp_top clearfix">
                                                <c:if test="${not empty t.head_img}">
                                                    <img class="fl" src="${t.head_img}" alt="">
                                                </c:if>
                                                <c:if test="${empty t.head_img}">
                                                    <img class="fl" src="${ctxStatic}/img/llhb/default.png" alt="">
                                                </c:if>


                                            </div>

                                        </div>
                                    </c:if>
                                </c:forEach>



                            </div>--%>
                        <c:forEach items="${as}" var="a">
                            <div class="attachment_div" >
                                <a href="javascript:void(0);" class="tmui-ellipsis font_1" title="${a.attach_name}">${a.attach_name}</a>
                                     <a href="javascript:void(0);" class="font_1" onclick="downloada('${a.attach_href}')">下载</a>
                                <input type="hidden" name="attach_name" value="${a.attach_name}"/>
                                <input type='hidden' name='attach_href' value='${a.attach_href}'>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </c:if>


        </div>


                    <c:forEach items="${lists}" var="u" varStatus="sta" >
                        <div class="ltyonghu_lou_div" id="${u.id}">

                            <div class="ltyonghu_lou ltyonghu_lou_first clearfix">
                                <div class="lou_left fl">
                                    <%--<c:if test="${sta.index eq 0 && currentPage eq 1}">
                                        <div class="lou_l_LandR">
                                            查看: <span class="isgreen">${u.page_view}</span>
                                            | 回复:<span class="isgreen">${fn:length(lists)}</span>
                                        </div>
                                    </c:if>--%>
                                    <div class="lou_l_uname">
                                        <c:if test="${u.is_anony eq true}">
                                        匿名
                                        </c:if>
                                        <c:if test="${u.is_anony eq false}">
                                            ${u.login_name}
                                        </c:if>

                                    </div>
                                    <c:if test="${not empty u.head_img}">
                                        <img class="lou_l_upic" src="${u.head_img}" alt="">
                                    </c:if>
                                    <c:if test="${empty u.head_img}">
                                        <img class="lou_l_upic" src="${ctxStatic}/img/llhb/default.png" alt="">
                                    </c:if>
                                   <%-- <img class="lou_l_upic" src="${ctxStatic}/img/llhb/photo.png" alt="">--%>

                                    <div class="clearfix lou_l_uzandut">
                                       <%-- <div class="fl">
                                            <span class="isgreen">268</span>
                                            <span>主题</span>
                                        </div>
                                        <div class="fl">
                                            <span class="isgreen">268</span>
                                            <span>帖子</span>
                                        </div>--%>
                                    </div>
                                    <div class="lou_l_renzheng clearfix">

                                        <div class="renzheng_you fl ${u.xauth}">

                                        </div>

                                        <div class="renzheng_qi_act fl ${u.cauth}">

                                        </div>
                                        <c:if test="${u.pauth}">

                                        </c:if>
                                        <div class="renzheng_tong_act fl ${u.pauth}">

                                        </div>
                                    </div>
                                    <%--<div class="sendmassage">
                                        <a href="javascript:void(0)">
                                            <img src="${ctxStatic}/img/llhb/ltyonghu_sendm.png" alt="">
                                            发消息
                                        </a>
                                    </div>--%>
                                        <c:if test="${yes eq true}">
                                        <div class="ltyonghu_for_admin">
                                            <a href="javascript:stoptalking('${u.login_name}')">禁言</a>
                                        </div>
                                    </c:if>


                                </div>
                                <div class="lou_right fl">
                                   <%-- <c:if test="${sta.index eq 0 && currentPage eq 1}">
                                        <div class="lou_r_title tmui-ellipsis">
                                                ${u.post_title}
                                        </div>
                                    </c:if>--%>

                                    <div class="lou_r_top">
                                        <img src="${ctxStatic}/img/llhb/ltyonghu_user.png" alt="">
                                        发表于
                                        <span>${fn:substring(u.create_date,0,19)}</span>
                                        |
                                        <a href="javascript:onlysee('${u.uid}')">只看该作者</a>
                                    </div>
                                    <div class="lou_r_con">
                                       <%-- <c:choose>
                                            <c:when test="${sta.index eq 0 && currentPage eq 1}">
                                                ${u.post_content}
                                            </c:when>
                                            <c:otherwise>
                                                ${u.rp_content}
                                            </c:otherwise>
                                        </c:choose>--%>
                                               ${u.rp_content}
                                    </div>
                                    <div class="lou_r_bottom clearfix">
                                        <c:if test="${yes eq true}">
                                            <a class="fl" href="javascript:deleteReply('${u.id}')">删除回复</a>
                                        </c:if>
                                        <a class="fr a_resp" href="javascript:togglehuifu('${u.id}')"><span>回复</span>
                                            <script>
                                                $(function(){
                                                    huifu(${u.id});
                                                })

                                            </script>
                                            <span></span></a>
                                    </div>
                                    <c:set var="zz" value="${fn:substring(u.create_date,0,19)}"></c:set>
                                    <div class="resp_div" >
                                        <c:forEach  items="${rts}" var="t" varStatus="stat">
                                            <c:if test="${t.reply_id eq u.id}" var="aa" >
                                                <div class="each_resp" id="${t.id}" >
                                                    <div class="each_resp_top clearfix">
                                                        <c:if test="${not empty u.head_img}">
                                                            <img class="fl" src="${u.head_img}" alt="">
                                                        </c:if>
                                                        <c:if test="${empty u.head_img}">
                                                            <img class="fl" src="${ctxStatic}/img/llhb/default.png" alt="">
                                                        </c:if>

                                                        <div class="each_resp_con fl">
                                                            <c:if test="${not empty t.uuname}">
                                                               <span class="yanse">${u.login_name}</span> 回复${t.uuname}:${t.trace_content}
                                                            </c:if>
                                                            <c:if test="${empty t.uuname}">
                                                                <span class="yanse">${u.login_name}</span>:${t.trace_content}
                                                            </c:if>

                                                        </div>
                                                    </div>
                                                    <div class="each_resp_bottom clearfix" >
                                                        <div class="fr">
                                                            <!-- 管理员有删除回复 -->
                                                            <c:if test="${yes eq true}">
                                                <a href="javascript:deleteReplyTo('${t.id}')">删除回复</a>
                                            </c:if>
                                                            <!-- 管理员有删除回复 -->
                                                            <span>${fn:substring(u.create_date,0,19)} </span>
                                                            <a href="javascript:reportPrev('${t.id}','${u.uid}','${u.id}','${u.login_name}')" class="">回复</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>


                                        <!-- 回复框 -->
                                        <div class="my_resp clearfix" id="${u.id}">
                                            <textarea name="" id="" onfocus="denglu()"  rows="2"></textarea>
                                            <a href="javascript:report('${u.uid}','${u.id}','${u.login_name}')" class="btn fr">发表</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </c:forEach>


                </div>

            </div>
            <div class="ltliebiao_fatie_fanye clearfix">
                <%--<a href="javascript:posting()"class="fl btn">发帖</a>--%>
                <div class="fanye fr">
                    <div class="filp">
                        <%--<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                        <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                        <c:set var="currentPage" value="${recordPage.pageNumber}" />
                        <c:set var="totalPage" value="${recordPage.totalPage}" />
                        <c:set var="actionUrl" value="${ctx}/forum/forumlistUser/"/>
                        <c:set var="urlParas" value="?fid=${fid}" />
                        <c:set var="pageSizeParaName" value="paginateFenye" />--%>
                        <%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
                    </div>
                </div>
            </div>
<form action="${ctx}/forum/reportReply" method="POST" id="form1">
            <div class="ltyonghu_talk">
                <img src="${ctxStatic}/img/llhb/ltyonghu_talk_03.png" alt="">
                随便说说你的想法，或者有什么问题？和大家一起探讨吧
            </div>

            <textarea style="margin-left: 0px;display: none;"  name="rp_content"  id="rp_content"  cols="85" rows="30"></textarea>
            <script   id="editor" type="text/plain" style="height:250px;margin-top: 5px;width:100%;"></script>

            <div class="clearfix submit_myresp_div">
                <div class="fl">
                    <input style="margin:9px 5px 0 0" onfocus="denglu()" class="fl annoy" type="checkbox">匿名
                </div>
                <a href="javascript:reportReply()" class="fr btn">发表回复</a>
            </div>
    <input type="hidden" name="is_anony" value="" id="checkbox">
    <input type="hidden" name="post_id" value="${fid}">
    <input type="hidden"  value="${user.id}" name="create_by">
    <input type="hidden"  value="${today}" name="create_date">
    <input type="hidden"  value="${fid}" name="parmamfid">
</form>
        </div>


    </div>
</div>
<!--中间部分end-->
<div class="popumask" style="z-index: 1;"></div>
<div class="populayer pl_normal" >
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p></p>
    </div>
</div>

<!--底部 start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>

<script>
   // alert('${yes}');
    var traceId = "";//被回复者的id
    // <!--轮播广告-->
    $(document).ready(function(){
        //初始化
        if('${t.is_top}' == 1){
            $("#pop").show();
            $("#put").hide();
        }else{
            $("#pop").hide();
            $("#put").show();
        }
        if('${t.good}'==1){
            $("#adst").show();
            $("#add").hide();
        }else{
            $("#adst").hide();
            $("#add").show();
        }


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
        $(".fade_list li").each(function(){
            $(".main_banner .fade_btn").append('<a href="javascript:void(0);" ></a>');
        });
        $(".main_banner .fade_btn").find("a:first").addClass("h_b_btn_sel");

        $(".fade_btn").on("click","a",function(){
            clearInterval(fadeTimer);
            idx = $(this).index();
            changePic(idx);
            $(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }).mouseleave(function(){
            playFader();
        }).mouseover(function(){
            clearInterval(fadeTimer);
        });

        function playFader(){
            fadeTimer = setInterval(function(){
                idx++;
                if(idx == length){
                    idx = 0;
                }
                changePic(idx);

            },timer);
        }
        /*执行轮播*/
        playFader();
    });

    function changePic(idx){
        $(".main_banner").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
    }

    $(function(){
        $(".header_nav ul li").eq(7).addClass("header_nav_sel");
        //实例化编辑器
        var ue = UE.getEditor("editor",{
            toolbars: [[
                'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'preview',  '|',/*'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',*/
                'simpleupload'
            ]],imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
        });
        ue.addListener("focus", function (type, event) {
            denglu();
        });

        var contentNavArr = [];
        var ad_top=$(".header_banner").each(function(){
            contentNavArr.push($(this).offset().top);

        });

        /*滚动条事件*/
        $(window).scroll(function(){
            /*左右悬窗定位*/
            if($(window).scrollTop() >　contentNavArr[0]){
                $(".nav_bottomlist").show();
                $(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});


            }else if($(window).scrollTop() <=　contentNavArr[0]){
                $(".nav_bottomlist").hide();
                $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
            }
        });
        $(".content").click(function(){
            go('固废供求-副本-9-17.html');
        });
    });

   /* $(function(){
        //lou_height();
//点击回复
        $(".a_resp").click(function(){
            var that=$(this);
            that.toggleClass('a_resp_extend');
            that.find("span").toggle();
            that.parent().next('.resp_div').slideToggle();
        });
    });*/
    function  togglehuifu(uid){

        var c = "#"+uid+' .a_resp';
        var that = $(c);
        that.toggleClass('a_resp_extend');
        that.find("span").toggle();
        that.parent().next('.resp_div').slideToggle();
        huifu(uid);
    }

    function lou_height(){
        $(".lou_left").each(function(){
            var lou_h=$(this).parents(".ltyonghu_lou").height();
            $(this).height(lou_h);
        });
    }
    /**
     * 删除主题
     */
    function  deletetheme(){
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/deletetheme",
            data:"fid=${fid}",
            dataType:"json",
            success:function (data){
                if(data == true){
                    showMess("删除成功");
                    setTimeout(function(){
                        location.href='${ctx}/forum/forumindex';
                    },3000);
                }
            }
        });

    }
    /**
     * 置顶
     */
    function  puttop(){
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/puttop",
            data:"fid=${fid}",
            dataType:"json",
            success:function (data){
                if(data == true){
                    $("#put").hide();
                    $("#pop").show();
                    showMess("操作成功");
                }
            }
        });
    }
    /**
     * 取消置顶
     */
    function  poptop(){
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/poptop",
            data:"fid=${fid}",
            dataType:"json",
            success:function (data){
                if(data == true){
                    $("#put").show();
                    $("#pop").hide();
                    showMess("操作成功");
                }
            }
        });
    }
    /**
     * 删除回复
     *
     */
    function  deleteReply(rid){
       /* parent.showMessYes("确定删除？");
        $(".yes-btn", window.parent.document).unbind().on("click",function(){
            $(".pl_yesorno", window.parent.document).hide();
            $.ajax({
                type:"POST",
                url:"${ctx}/forum/deleteReply",
                data:"fid=${fid}&rid="+rid,
                dataType:"json",
                success:function (data){
                    if(data == true){
                        showMess("操作成功");
                        location.reload();
                    }
                }
            });
        });*/
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/deleteReply",
            data:"fid=${fid}&rid="+rid,
            dataType:"json",
            success:function (data){
                if(data == true){
                    showMess("操作成功");
                    location.reload();
                }
            }
        });
    }
    /**
     * 禁言
     */
    function  stoptalking(uname){
        /*$.ajax({
            type:"POST",
            url:"${ctx}/forum/stoptalking",
            data:"uid="+user,
            dataType:"json",
            success:function (data){
                if(data == true){
                    showMess("操作成功");
                }
            }
        });*/
        location.href='${ctx}/home?str=/forum/manage/blacklist?loginName='+uname;//跳转到禁言页面
    }
    /**
     * 只看该作者
     */
    function  onlysee(uid){
       /* $.ajax({
            type:"POST",
            url:"${ctx}/forum/onlysee",
            data:"fid=${fid}&paramUid="+uid,
            dataType:"json",
            success:function (data){

            }
        });*/
        location.href="${ctx}/forum/forumlistUser?paramUid="+uid+"&fid=${fid}";
    }
    /**
     * 发表  回复的回复
     */
     function report(uid,rid,name){
       if(!'${user.id}'){
            showMess("请先登录，否则无权操作");
            return;
        }
        if('${b}'){
            showMess("您被禁言了哦");
            return;
        }
        var ffid = traceId;
        var  text = $(('#'+rid)).find("textarea").val();
        if(name !=''&&name!='undefined'){
            if(text.indexOf(('回复'+name+":")) != -1){
                text = text.substr(('回复'+name+":").length,text.length);
            }else{
                ffid='';
            }
        }

        $.ajax({
            type:"POST",
            url:"${ctx}/forum/report",
            data:"fid="+uid+"&tid="+ffid+"&rid="+rid+"&content="+text+"&forumid=${fid}",
            dataType:"json",
            success:function (data){
                var htmls = "";
                $.each(data,function(index,item){
                    htmls +='<div class="each_resp" id="'+item.id+'"><div class="each_resp_top clearfix">';
                    if(item.head_img!='undefined'&&!item.head_img&&item.head_img!='null'&&item.head_img!=null){
                        htmls+='<img class="fl" src="'+item.head_img+'" alt="">';
                    }else{
                        htmls+='<img class="fl" src="${ctxStatic}/img/llhb/default.png" alt="">';
                    }
                    htmls+=  ' <div class="each_resp_con fl">';
                    if(!item.uuname){
                        htmls+= '<span class="yanse">'+item.login_name+'</span>'+":"+item.trace_content;
                    }else{
                        htmls +='<span class="yanse">'+item.login_name+'</span>'+"回复"+item.uuname+":"+item.trace_content;
                    }
                    htmls+='</div></div>';
                    htmls+='<div class="each_resp_bottom clearfix" ><div class="fr">';

                    if('${yes}'){
                        htmls+='<a href="javascript:deleteReplyTo('+item.id+')">删除回复</a>';
                    }
                    htmls+='<span>'+item.tdate+'</span>';
                    htmls +='<a href="javascript:reportPrev('+item.id+','+item.uid+','+item.reply_id+'';
                    htmls+=')" class="testaa">回复</a></div></div></div>';

                });
                traceId="";
                $(".my_resp").before(htmls);
                $(('#'+rid)).find("textarea").val('');

            }
        });
    }
  /*  function  test(uid,rid,name){
        report(uid,rid,'${user.loginName}');
    }*/

    //不带确定的提示框
    function showMess(str){
        $(".popumask").show();
        $(".pl_normal .pl_content p").html(str);
        $(".pl_normal").show();
        setTimeout(function(){
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        },3000);
    }

    function reportPrev(fid,tid,rid,name){
        //fid是replytrace的id
        traceId = fid;
        if(name='undefined'){
            name = '${user.loginName}';

        }
        var retx = '回复'+name+":";
        $(('#'+rid)).find("textarea").val(retx);
    }
    /**
     * 删除回复的回复
    /**/
    function deleteReplyTo(tid){
       /* parent.showMessYes("确定删除？");
        $(".yes-btn", window.parent.document).unbind().on("click",function(){
            $(".pl_yesorno", window.parent.document).hide();
            $.ajax({
                type:"POST",
                url:"${ctx}/forum/deleteReplyTo",
                data:"fid="+tid,
                dataType:"json",
                success:function (data){
                    if(data==true){
                        var a = '#'+tid;
                        $(a).remove();
                    }
                }
            });
        });*/
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/deleteReplyTo",
            data:"fid="+tid,
            dataType:"json",
            success:function (data){
                if(data==true){
                    showMess("删除成功");
                    var a = '#'+tid;
                    $(a).remove();
                }
            }
        });
    }

     /**
     * 发表回复
     */
     function  reportReply(){
        if(!'${user.id}'){
            showMess("请先登录，否则无权操作");
            return;
        }
         if('${b}'){
             showMess("您被禁言了哦");
             return;
         }
        var content = UE.getEditor('editor').getContent();
        if(!content){
            showMess("输入回复的内容");
            return;
        }
        var a = $("input[type='checkbox']").is(':checked');
        if(a){
            $("#checkbox").val('1');
        }else{
            $("#checkbox").val('0');
        }
        $("#rp_content").val(content);
        $('#form1').submit();
    }
    /**
     * 发帖
     */
    function posting(){
        location.href="${ctx}/forum/posting?boradId=${pos.bid}";

    }
    /**
     * 加精
     */
    function  jiajing(){
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/jiajing",
            data:"fid=${fid}",
            dataType:"json",
            success:function (data){
                if(data == true){
                    $("#add").hide();
                    $("#adst").show();
                    showMess("操作成功");
                }
            }
        });
    }
    /**
     * 取消加精
     * @param uid
     */
    function nojiajing(){
        $.ajax({
            type:"POST",
            url:"${ctx}/forum/nojiajing",
            data:"fid=${fid}",
            dataType:"json",
            success:function (data){
                if(data == true){
                    $("#add").show();
                    $("#adst").hide();
                    showMess("操作成功");
                }
            }
        });
    }
    function  huifu(uid){
        var b = "#"+uid+' .each_resp';
        var c = "#"+uid+' .a_resp';
        var aa = $(b).length;
        $(c).html("回复("+aa+")");
    }
    function  denglu(){
        if(!'${user.id}'){
            showMess("请先登录，否则无权操作");

        }
    }
   //下载附件
   function downloada(str){
       window.open(str);
   }
    function board(str){
        go('${ctx}/forum/list?boardId='+str);
    }
    function  searchtext(){
        location.href='${ctx}/forum/list?isSubSearch=true&searchContent='+$("#text").val();
    }
   $('#text').bind('keypress',function(event){
       if(event.keyCode == "13")  {
           searchtext();
       }
   });
</script>

</body>
</html>


