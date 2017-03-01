<%@ page contentType="text/html;charset=utf-8" %>

<style type="text/css">
    /*header添加  重复*/
    header{border-bottom: 1px solid #5EC520;min-width: 1000px;height:200px;}
    .header_middle{margin-bottom: 15px;}
    .header_middle h1{position: relative;}
    .header_middle h1 .welcome{color:#ee7800;border-left: 1px solid #cccccc;padding-left: 10px;position: absolute;top:90px;left:360px;display: block;width:100px;font-weight: 400;height:30px;line-height: 30px;}
    .main input[type=text]:focus,.main input[type=password]:focus{border:1px solid #ee7800;}
</style>

<header >
    <div class="line_top"></div>
    <div class="headerBox">
        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp" %>
        <!--头部上部 end-->
        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo">
                <a href="javascript:void(0);">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台" onclick="window.location.href='index'">
                </a>
                <span class="welcome font_3">欢迎登录</span>
            </h1>

            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>
</header>
