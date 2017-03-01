<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="main">
    <!-- 左侧开始 -->
    <div class="main_left">
        <!-- 左上 -->
        <div class="m_l_top">
            <div class="m_l_t_left">
                <c:if test="${u.headImg == null}">
                    <img src="${ctxStatic}/img/llhb/photo.png">
                </c:if>
                <c:if test="${u.headImg != null}">
                    <img src="${u.headImg}" style="width:80px;height:80px;">
                </c:if>
                <p class="font_1" style="">优蚁达人</p>
            </div>
            <div class="m_l_t_right">
                <c:choose>
                    <c:when test="${u.personauth eq 1 }"><a href="javascript:void(0)" class="t_r_ge"></a></c:when>
                    <c:otherwise><a href="javascript:void(0)" class="t_r_ge_no"></a></c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${u.youauth eq 1 }"><a href="javascript:void(0)" class="t_r_shang"></a></c:when>
                    <c:otherwise><a href="javascript:void(0)" class="t_r_shang_no"></a></c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${u.comauth eq 1 }"><a href="javascript:void(0)" class="t_r_qi"></a></c:when>
                    <c:otherwise><a href="javascript:void(0)" class="t_r_qi_no"></a></c:otherwise>
                </c:choose>
                <div class="t_r_uname tmui-ellipsis" title="${u.uname }">${u.uname }</div>
                <div class="t_r_uid font_1 clearfix"><span class="fl">会员ID号:</span><span class="tmui-ellipsis fl"
                                                                                         style="width:55px"
                                                                                         title="${u.loginName }">${u.loginName }</span>
                </div>
                <div class="t_r_uvipl font_1 clearfix"><span class="fl">会员级别:</span><span class="tmui-ellipsis fl"
                                                                                          style="width:55px">${u.label }</span>
                </div>
            </div>
            <div class="m_l_t_bottom font_1">
                <span>资料完成度:<span class="finish_data">${u.dataCompletion }%</span></span>
                <c:if test="${u.dataCompletion !='100' }">
                    <a href="${ctx }/home?str=/perinfo" target="_parent">完善资料</a>
                </c:if>
                <div class="t_b_ziliao">
                    <div></div>
                </div>
            </div>
        </div>
        <!-- 左中 -->
        <div class="m_l_mid">
            <a class="m_l_mid_a_xiaoxi" href="${ctx }/home?str=/memSerevice/communication" target="_parent"
               title="对话"></a>
            <a class="m_l_mid_a_xinjian" href="${ctx }/home?str=/memSerevice/message/mailbox?index=2" target="_parent"
               title="消息"></a>
            <a class="m_l_mid_a_yyb" href="http://yyhb365.com/notice/noticThree" target="_parent" title="积分"></a>
        </div>
        <!-- 左下 -->
        <div class="m_l_bottom">

            <c:set var="str" value="${str }"></c:set>
            <ul class="m_l_b_ul">
                <c:forEach items="${menus}" var="menu" varStatus="idxStatus">
                    <c:if test="${menu.parentId eq 372}">
                        <!-- 透明遮罩层 star -->
                        <div class="transparent_mask_layer"
                             style="width:220px; height:36px; z-index: 5;position:fixed; display:none; cursor:pointer;"></div>
                        <!-- 透明遮罩层 end -->
                        <li class="l_b_yiji ${menu.icon}" data_index="${menu.icon }" style="display:block"> ${menu.name}
                            <span>+</span></li>
                        <ul class="l_b_erji">
                            <c:forEach items="${menus}" var="menuChild">
                                <c:if test="${menuChild.parentId eq menu.id}">
                                    <!-- 透明遮罩层 star -->
                                    <div class="transparent_mask_layer"
                                         style="width:220px; height:36px; z-index: 5;position:fixed; display:none; cursor:pointer;"></div>
                                    <!-- 透明遮罩层 end -->
                                    <c:choose>
                                        <c:when test="${u.label eq '个人' && (u.operator_code == null || u.operator_code == '') }">
                                            <c:choose>
                                                <c:when test="${menuChild.parentId eq 374 || menuChild.id eq 385}">
                                                    <li class=""><a href="javascript:void(0)" onclick="showMess('请先到会员资料中完善公司资料再进行${menuChild.name}');" target="${not empty menuChild.target?menuChild.target:'rightIframe'}">&nbsp;${menuChild.name}</a>
                                                </c:when>
                                                <c:when test="${fn:contains(str, menuChild.href) == false || empty menuChild.href}">
                                                    <li class=""><a href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" target="${not empty menuChild.target?menuChild.target:'rightIframe'}">&nbsp;${menuChild.name}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class=""><a class="l_b_2sel" href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" target="${not empty menuChild.target?menuChild.target:'rightIframe'}">&nbsp;${menuChild.name}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${fn:contains(str, menuChild.href) == false || empty menuChild.href}">
                                                    <li class=""><a href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" target="${not empty menuChild.target?menuChild.target:'rightIframe'}">&nbsp;${menuChild.name}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class=""><a class="l_b_2sel" href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" target="${not empty menuChild.target?menuChild.target:'rightIframe'}">&nbsp;${menuChild.name}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    <ul class="l_b_sanji font_1">
                                        <div class="blankdiv"></div>
                                        <c:forEach items="${menus}" var="menuChilds">
                                            <c:if test="${menuChilds.parentId eq menuChild.id && fn:indexOf(menuChilds.href, '/sys/') eq -1}">
                                                <li class=""><a
                                                        href="${fn:indexOf(menuChilds.href, '://') eq -1?ctx:''}${not empty menuChilds.href?menuChilds.href:'/404'}"
                                                        target="${not empty menuChilds.target?menuChilds.target:'rightIframe'}">
                                                    &nbsp;${menuChilds.name}</a></li>
                                            </c:if></c:forEach>
                                    </ul>
                                    </li>
                                </c:if></c:forEach>
                        </ul>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<!-- 左侧结束 -->
<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/getUrlParam.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        notRead();
        $(".l_b_2sel").parent().addClass("l_b_2sel");
        $(".l_b_2sel").parent().parent().show();
        var d = $(".l_b_2sel").parent().parent().prev().attr("data_index");
        var c = "l_b_1sel_" + d;
        $(".m_l_bottom .l_b_erji .l_b_2sel").parent().parent().prev().addClass("l_b_1sel").addClass(c).find("span").text("-");
        $(".m_l_bottom .m_l_b_ul ul").each(function () {
            if ($(this).html().replace(/(^\s*)|(\s*$)/g, "") == "") {
                $(this).prev().find("span").remove();
            }
        });
        //三级菜单效果
        $(".m_l_bottom .l_b_erji li ul li").parent().parent().addClass("has-sanji");
        //根据数据调整资料完成度
        var finish_data = $(".m_l_t_bottom .finish_data").text();
        $(".t_b_ziliao div").css("width", finish_data);
        //左侧banner展开收缩
        $(".m_l_bottom .l_b_yiji").on("click", function () {
            $(this).next("ul").slideToggle("normal",function(){
                var hei = $(".main_left").height();
                if(hei > 1000){
                    window.parent.document.getElementById('leftIframe').height = hei;
                }else{
                    window.parent.document.getElementById('leftIframe').height = 1000;
                }
            });
            $(this).siblings("li").next("ul").slideUp();
            $(this).siblings("li").each(function () {
                var li_span = $(this).find("span").text();
                if (li_span == "-") {
                    $(this).find("span").text("+");
                }
            });
            this_span = $(this).find("span").text();
            this_span == "+" ? $(this).find("span").text("-") : $(this).find("span").text("+");
            $(this).addClass("l_b_1sel").siblings("li").removeClass("l_b_1sel");
            var li_index = $(this).attr("data_index");
            li_sel_class = "l_b_1sel_" + li_index;
            $(this).addClass(li_sel_class);
            $(this).siblings("li").each(function () {
                var sib_index = $(this).attr("data_index");
                var sib_sel_class = "l_b_1sel_" + sib_index;
                $(this).removeClass(sib_sel_class);
            });
        });
        //左侧banner展开后子项目的点击
        $(".m_l_bottom .l_b_erji li").on("click", function () {
            $(".m_l_bottom li").removeClass("l_b_2sel");
            $(this).addClass("l_b_2sel");
            $(".m_l_bottom a").removeClass("l_b_2sel");
            $(this).children("a").addClass("l_b_2sel");
            $(this).children("a").attr("id","reloadRightIframe");
        });
    });
    //未读消息对话
    function notRead() {
        var mess = parseInt($(".headtop a", window.parent.document).eq(0).find("span").html());
        var chat = parseInt($(".headtop a", window.parent.document).eq(1).find("span").html());
        if (mess > 0) {
            $(".m_l_mid a").eq(1).html(mess).addClass("m_l_mid_sel");
        } else {
            $(".m_l_mid a").eq(1).html("").removeClass("m_l_mid_sel");
        }
        if (chat > 0) {
            $(".m_l_mid a").eq(0).html(chat).addClass("m_l_mid_sel");
        } else {
            $(".m_l_mid a").eq(0).html("").removeClass("m_l_mid_sel");
        }
    }

    function showMess(str) {
        window.parent.showMess(str);
    }
</script>
</body>
</html>