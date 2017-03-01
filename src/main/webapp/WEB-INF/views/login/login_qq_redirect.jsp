<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="Keywords" content="优蚁,环保">
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <!–[if IE]>
    <script src="${ctxStatic}/js/html5.js"></script>
    <![endif]–>
    <style type="text/css">
        article,aside,dialog,footer,header,section,footer,nav,figure,menu{display:block}

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
        .fpw_step_box .s_b_step_successbox .s_b_step_done{width:40px;height:40px;border-radius: 20px;background:url(../images/) 0 0 no-repeat;background-color: #cccccc;}
        .fpw_step_box .stepb_numbox_sel .s_b_step_top{color:#ee7800;}
        .fpw_step_box .stepb_numbox_sel .s_b_step_num{background-color: #ee7800;}
        .fpw_step_box .stepb_numbox_sel .s_b_step_done{background:url(../images/) 0 0 no-repeat;background-color: #ee7800;}
        /*顶部步骤结束*/

        /*找回成功 开始*/
        .find_pw_success{margin:0 auto;overflow: hidden;width:640px;margin-top: 100px;}
        .find_pw_success .findpws_l{width:120px;height:120px;float:left;background:url(${ctxStatic}/img/llhb/huge_yes.png) 0 0 no-repeat;}
        .find_pw_success .findpws_r{float:left;margin-left: 15px;padding-top: 8px;}
        .findpws_r h1{font-size:40px;color:#5EC520;font-weight: 400;height:40px;line-height: 40px;}

        .findpws_r p{margin-top: 40px;color:#666666;}

        .findpws_r p a{color:#ee7800;}

    </style>
    <script type="text/javascript">if (window != top){alert("session超时,请重新登录!");top.location.href = location.href;}</script>

</head>
<body>
<!--头部 start-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!--头部 end-->
<!-- main开始 -->
<div class="mainwrapper">
    <div class="main">
        <div class="find_pw_main">

            <div class="find_pw_success">
                <div class="findpws_l"></div>
                <div class="findpws_r">
                    <h1>恭喜您 ! 注册成功 !</h1>

                    <p>您可以<a href="/">返回首页</a>或进入<a href="/home">个人中心</a></p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- main结束 -->
<!-- 底部开始 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- 底部结束 -->
<!-- 只有确定按钮的弹出层 -->
<div class="popumask"></div>
<div class="populayer pl_yes">
    <div class="layer_top" >
        <span>提示</span>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!<br />否则不能完成认证!</p>
        <div class="btns_yes" >
            <a href="javascript:hideMess()"  class="yes-btn">确定</a>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">

    $(function(){
        //mainwarpper 高度
        $(".mainwrapper").css({"min-height":($(window).height()-$("header").height()-$("footer").height())+"px"});
        // 内容高度居中
        $(".mainleft_img").css({"margin-top":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px"});
        $(".loginbox").css({"margin-top":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px"});

    });


</script>
</html>
