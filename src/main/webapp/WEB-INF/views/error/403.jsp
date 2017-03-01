<%@ page contentType="text/html;charset=utf-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/>
        <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <style type="text/css">
            body{overflow: hidden;}
            .main{width:700px;margin:0 auto;}
            .main h5{font-size: 30px;font-weight: 400;margin-top: 150px;margin-bottom: 15px;}
            .main p{margin-top:10px;}
            .main p span{font-weight: 800;}
        </style>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        
    </head>
    <body>
        <div class="main clearfix">
            <div class="fl">
                <img src="${ctxStatic}/img/llhb/errorpage_img_03.png" alt="">
            </div>
            <div class="fl"style="margin-left: 30px;">
                <h5>您访问的网页出错了！</h5>
                <p><span>可能原因：</span>网址不存在，DNS服务器未响应、网络连接异常</p>
                <p><span>建议操作：</span>检查网址是否正确，或刷新重试</p>
            </div>
        </div>
        <!-- js -->
        <script type="text/javascript">
            $(function () {
                $("body").css("height",$(window).height());
                $(".main").css({"margin-top":($(window).height()-$(".main img").height())/2});
            });

        </script>
    </body>
</html>