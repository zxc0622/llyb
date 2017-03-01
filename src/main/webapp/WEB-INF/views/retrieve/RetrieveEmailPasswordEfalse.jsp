<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/>
        <title>优蚁环保-找回密码,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
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
            .mainwrapper{width:100%;background-color: #F7F8F8;min-width: 1000px;}
            .main{width:1000px;margin:0 auto;overflow: hidden;}
            .main input[type=text]:focus,.main input[type=password]:focus{border:1px solid #ee7800;}
            
            /*找回密码_main开始*/
            .find_pw_main{margin-top:40px;}

            /*顶部步骤开始*/
            .fpw_step_box{margin:0 auto;overflow: hidden;width:700px;}
            .fpw_step_box .s_b_lineshort{float:left;height:4px;width:60px;border-radius:4px;background-color: #cccccc;margin-top: 50px}
            .fpw_step_box .s_b_linelong{float:left;height:4px;width:200px;border-radius:4px;background-color: #cccccc;margin-top: 50px}
            .fpw_step_box .stepb_line_sel{background-color: #ee7800;}
            .fpw_step_box .s_b_step_numbox,.fpw_step_box .s_b_step_successbox{float:left;margin:0 10px;position: relative;margin-top: 32px}
            .fpw_step_box .s_b_step_numbox .s_b_step_top,.fpw_step_box .s_b_step_successbox .s_b_step_top{position: absolute;color:#666666;top:-27px;left:-65%;width:90px;text-align: center;}
            .fpw_step_box .s_b_step_numbox .s_b_step_num{width:40px;height:40px;border-radius: 20px;background-color: #cccccc;color:#fff;font-size: 22px;font-weight: bold;line-height: 40px;text-align: center;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_top{color:#ee7800;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_num{background-color: #ee7800;}
            /*顶部步骤结束*/
            
            /*找回成功 开始*/
            .find_pw_success{margin:0 auto;overflow: hidden;width:640px;margin-top: 30px;}
            .find_pw_success .findpws_l{width:120px;height:120px;float:left;background:url(${ctxStatic}/img/llhb/huge_yes.png) 0 0 no-repeat;}
            .find_pw_success .findpws_r{float:left;margin-left: 30px;margin-top: 50px;}
            .findpws_r h1{font-size:40px;color:#5EC520;font-weight: 400;height:40px;line-height: 40px;}
            .findpws_r p{color:#666666;}
            .findpws_r p:first-of-type{margin-top: 15px;}
            
            .findpws_r p span{color:#ee7800;font-size: 30px;}
            /*找回成功 结束*/

           
        
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
                    <!--顶部 步骤 --><!-- 
                   <div class="fpw_step_box">
                       <div class="s_b_lineshort stepb_line_sel"></div>
                       <div class="s_b_step_numbox stepb_numbox_sel">
                           <span class="s_b_step_top">输入邮箱名</span>
                           <div class="s_b_step_num">1</div>
                       </div>
                       <div class="s_b_linelong stepb_line_sel"></div>
                       <div class="s_b_step_numbox stepb_numbox_sel">
                           <span class="s_b_step_top">发送邮件</span>
                           <div class="s_b_step_num">2</div>
                       </div>
                       <div class="s_b_linelong stepb_line_sel"></div>
                       <div class="s_b_step_numbox stepb_numbox_sel">
                           <span class="s_b_step_top">找回密码</span>
                           <div class="s_b_step_num">3</div>
                       </div>
                       <div class="s_b_lineshort stepb_line_sel"></div>
                   </div>
                    -->
                    <!-- 顶部步骤结束 -->
                    <div class="find_pw_success">
                        <div class="findpws_r">
                            <h1>对不起 , 邮箱重置密码不成功,请</h1><br>
                            <h1>重新点击邮件中的重置按钮.</h1>
                        </div>
                        
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
                var timer=setInterval(function(){
                    var count=$(".countdown").html();
                    --count;
                    if(count>0){
                        $(".countdown").html(count);
                    }else{
                        clearInterval(timer);
                        //跳转页面
                      //  go('${ctx}/login')
                    }
                    
                },1000);
                
            });


        </script>
    </body>
</html>
