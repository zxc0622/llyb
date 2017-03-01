<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
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
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
        
        <style type="text/css">

            
           
            /*header添加  重复*/
            header{border-bottom: 1px solid #5EC520;min-width: 1000px;}
            .header_middle{margin-bottom: 15px;}
            .header_middle h1{position: relative;}
            .header_middle h1 .welcome{color:#ee7800;border-left: 1px solid #cccccc;padding-left: 10px;position: absolute;top:66px;left:351px;display: block;width:100px;font-weight: 400;height:30px;line-height: 30px;}
            

            /*main开始*/
            .mainwrapper{width:100%;background-color: #F7F8F8;min-width: 1000px;padding:10px 0;}
            .main{width:1000px;margin:0 auto;overflow: hidden;}
            
            /*找回密码_main开始*/
            .find_pw_main{margin-top:40px;}
            .find_pw_main .find_pw_selstyle{height:40px;line-height: 40px;width:700px;margin:0 auto;text-align: center;background-color: #FFFDEE;color:#ee7800;position: relative;border:1px solid #cccccc;}
            .find_pw_main .find_pw_selstyle .fpw_sels_right{width:34px;height:34px;background:url(${ctx}/img/llhb/big_yes.png) 0 0 no-repeat;display: inline-block;position: absolute;top:5px;left:130px;}
            .find_pw_main .fpw_style{height:100px;width:700px;margin:0 auto;background-color: #fff;position: relative;border:1px solid #cccccc;}
            .find_pw_main .style_1{margin-top: 15px}
            .find_pw_main .style_2{margin-top: 2%}
            .fpw_style a:hover .style_img{background:url(${ctxStatic}/img/llhb/shouji_2.png) 0 0 no-repeat;}
            .fpw_style a:hover .style_content .s_c_title{color:#5EC520;}
            .find_pw_main .fpw_style a{display: block;width:100%;height:100%;}
            .find_pw_main .fpw_style .style_img{width:60px;height:60px;background:url(${ctxStatic}/img/llhb/shouji_1.png) 0 0 no-repeat;position: absolute;top:20px;left:210px;}
            .find_pw_main .fpw_style .style_content{width:250px;height:60px;position:absolute;top:20px;left:280px; }
            .fpw_style .style_content .s_c_title{font-size: 18px;margin-top: 10px}
            .fpw_style .style_content .s_c_detail{color:#666666;margin-top: 5px;display: block;}
            /*找回密码_main结束*/
            /*main结束*/
        </style>
    </head>
    <body>
        <!--头部 start-->
        <header >
            <div class="line_top"></div>
            <div class="headerBox">

                <!--头部上部 start-->
                 <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
                <!--头部上部 end-->

                <!--头部中部 start-->
                <div class="header_middle">
                    <h1 class="header_logo">
                        <a href="javascript:void(0);">
                            <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台"/>
                        </a>
                        <span class="welcome font_3">找回密码</span>
                    </h1>
                    
                    <div class="clear"></div>
                </div>
                <!--头部中部部 end-->
            </div>      
        </header>
        <!--头部 end-->

        <!-- main开始 -->
        <div class="mainwrapper">
            <div class="main">
                <div class="find_pw_main">
                    <p class="find_pw_selstyle"><i class="fpw_sels_right"></i>基于账户及操作环境的检测,我们将提供以下方式供您选择</p>
                    <div class="fpw_style style_1">
                        <a href="javascript:void(0)">
                            <div class="style_img"></div>
                            <div class="style_content" onclick="go('${ctx}/retrieve/retrievePasswordB')">
                                <p class="s_c_title">通过手机验证码</p>
                                <span class="s_c_detail font_1">如果您是用手机注册的,请选择此</span>
                            </div>
                        </a>
                    </div>
                     <div class="fpw_style style_2">
                        <a href="javascript:void(0)">
                            <div class="style_img"></div>
                            <div class="style_content" onclick="go('${ctx}/retrieve/retrieveEmailPasswordB')">
                                <p class="s_c_title">通过邮箱验证</p>
                                <span class="s_c_detail font_1">如果您是用邮箱注册的,请选择此</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- main结束 -->

        <!-- 底部开始 -->
        <footer>
            <!--底部下部信息 start-->
            <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
            <!--底部下部信息 end-->
        </footer>


        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
        $(function(){
            //mainwarpper 高度
            $(".mainwrapper").height($(window).height()-$("header").height()-$("footer").height());

        });

        </script>
    </body>
</html>
