<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>企业_公司相册</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/qiye_style.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/img.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<script type="text/javascript" src="${ctxStatic}/js/img/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/img/public.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/img/ie6PNG.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('*');</script>
<style>
.keTitle{
height:40px;line-height: 40px;color:#5Ec520;padding:0 10px;background-color: #EFEFEF;}
.keTitle span{float:left;}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>

<div class="qy_m_r">
<h1 class="keTitle"><span>公司相册</span></h1>
    <!--效果html开始-->
    <!--图库弹出层 开始-->
    <div class="mskeLayBg"></div>
    <div class="mskelayBox" style="background:transparent;border:0;">
        <div class="mske_html" style="width:974px;height:488px;position:relative;"></div>
    </div>
    <!--图库弹出层 结束-->
    <div class="msKeimgBox">
        <ul>
            <c:forEach items="${album }" var="album">
                <li style="overflow:hidden;">
                    <img src="${album.image }" width="163" height="93"/>
                    <p style="text-align: center;">${album.name}</p>
                    <p style="text-align: center;">${album.createDate}</p>
                    <span class="hidden">
                        <img src="${album.image }"
                             style="max-width:100%;max-height:100%;width:auto;height:auto;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);" />
                    </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
           
<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>

<script>
$(function(){
	$(".gongsixiangce").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
	
})


</script>
</body>
</html>


