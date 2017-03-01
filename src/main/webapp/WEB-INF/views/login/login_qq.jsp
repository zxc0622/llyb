<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
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
        .dis_none{display: none;}


        /*header添加  重复*/
        header{border-bottom: 1px solid #5EC520;min-width: 1000px;}
        .header_middle{margin-bottom: 15px;}
        .header_middle h1{position: relative;}
        .header_middle h1 .welcome{color:#ee7800;border-left: 1px solid #cccccc;padding-left: 10px;position: absolute;top:66px;left:351px;display: block;width:100px;font-weight: 400;height:30px;line-height: 30px;margin-left: 15px;}
        .main input[type=text]:focus,.main input[type=password]:focus{border:1px solid #ee7800;}

        /*main开始*/
        .mainwrapper{width:100%;background-color: #F7F8F8;min-width: 1000px;}
        .main{width:1000px;margin:0 auto;overflow: hidden;}
        /*左侧图片*/
        .main .mainleft_img{width: 400px;height: 300px;float:left;margin-top:100px;}
        .main .mainleft_img img{width:100%;height:100%;}


        /*注册*/
        .main .register{width: 300px;border: solid 1px #CCCCCC; background: #FFFFFF;padding: 20px 20px;float:left;margin:80px 0 30px 130px;}
        .r_title{height: 40px;margin-bottom: 5px;}
        .r_title .r_t_sel{color: #4F9028;border-bottom: 3px solid #4F9028;}
        .r_title p{float: left;width:50%;text-align: center;line-height: 40px;border-bottom: solid 1px #CCCCCC;cursor: pointer;}
        .main .register .text_ipt{width: 100%;height: 30px;border: solid 1px #CCCCCC;text-indent:15px;}
        .main .register .r_tip{height: 23px;color: red;}
        .main .r_verfication{height: 40px;}
        .main .r_verfication input{width:40%;border: solid 1px #CCCCCC;height: 30px;float: left;text-indent:15px;}
        .main .r_verfication p{width:40%;height: 32px;line-height: 32px;text-align: center;background: #5EC520;margin-left: 10%;float:right;color: #FFFFFF;cursor: pointer;}
        .main .r_agree{height: 40px;line-height: 40px;}
        .main .r_agree input{position: relative;top: 2px;color: #666666;}
        .main .r_agree label a{color: #5EC520;}
        .main .r_regnow{width: 100%;height: 30px;line-height: 30px;text-align: center;color:#FFFFFF;background: #5EC520;margin-top: 10px;cursor:pointer;}

        /*右侧扫码*/
        .main .right_wenxincode{float:left;margin-left: 380px;position: relative;width:120px;position: fixed;top:423px;left:50%;}

        /*重复*/
        .right_wenxincode .rw_img{width:65px;height:80px;position: absolute;top:0;left:20px;}
        .right_wenxincode .rw_img img{width:100%;height:100%;}
        .right_wenxincode .rw_mainbox{width:120px;height:140px;border:1px solid #cccccc;position: relative;float:left;margin-top: 70px;z-index: 5;background-color: #fff;cursor: pointer;}
        .rw_mainbox a{position: absolute;right:5px;top:0;color:#666666;}
        .rw_mainbox .re_mainbox_img{width:80px;height:80px;margin:20px auto 0;}
        .rw_mainbox .re_mainbox_img img{height:100%;height:100%;}
        .rw_mainbox p{text-align: center;line-height: 15px;color:#666666;}
        /*main结束*/
        .qqband{width:320px;height:212px;margin-top:80px;background:#fff;padding:20px;border:1px solid #ccc;}
        .qqhead{display: block;height:120px;width:120px;margin:20px auto 0;border:1px solid #ccc;}
        .qqname{margin-top: 10px;text-align: center;color:#666;}

        /*only-yes弹出*/
        .btns_yes{margin-top: 15px;}
        .btns_yes .yes-btn{width:100px;height:25px;line-height: 25px;color:#fff;background-color: #5ec520;border:1px solid #5ec520;display: inline-block;}

    </style>
    <script type="text/javascript">if (window != top){alert("session超时,请重新登录!");top.location.href = location.href;}</script>
    <script>
        if (window.location.hash.length != 0){
            var hrf = window.location.href;
            hrf = hrf.replace("#","");
            window.location.href = hrf;
        }

    </script>
</head>
<body>
<!--头部 start-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!--头部 end-->
<!-- main开始 -->
<form id="loginForm" action="${ctx}/login_qq_valid" method="post">
<div class="mainwrapper">
    <div class="main">
        <div class="qqband fl">
            <div class="r_title">
                <p class="r_t_sel"style="text-align:left;color:#666;text-indent: 20px;"><img src="${ctxStatic}/img/llhb/litterQQ2.png" alt="">&nbsp;QQ</p>
                <p>&nbsp;</p>
            </div>
            <a class="qqhead" href="javascript:void(0)"><img src="${userInfo.figureurl_qq_2}" alt="" style="width:100%;height:100%;"></a>
            <p class="qqname">${userInfo.nickname}</p>
        </div>
        <div class="register">
            <div class="r_title">
                <p class="r_t_sel">已有的优蚁网帐号</p>
                <p>&nbsp;</p>
            </div>
            <div class="clearfix">
                <a class="fr" href="${ctx}/retrieve/retrievePasswordA" style="color:#666;margin-bottom: 5px;">忘记密码?</a>
            </div>
            <div class="r_members">
                <input type="text" placeholder="请输入用户名" class="text_ipt" id="username" name="username"/>
                <p class="r_tip" style="visibility: hidden;">
                    <img src="${ctxStatic}/img/llhb/wrong.png"/>
                    <span class="font_1"></span>
                </p>
            </div>
            <div class="r_pwd">
                <input type="password" placeholder="请输入您的密码" class="text_ipt" id="password" name="password"/>
                <p class="r_tip" style="visibility: hidden;">
                    <img src="${ctxStatic}/img/llhb/wrong.png"/>
                    <span class="font_1"></span>
                </p>
            </div>
            <div class='clearfix'>
                <a href="javascript:void(0);" class="btn fl" onclick="bindAccount();" id="bind_btn">立即绑定</a>
                <div class="fr"style="margin-top:5px;">
                    <span style="color:#666;">没有帐号?</span>
                    <a href="javascript:void(0)" style="color:#ee7800;" onclick="loginByQq()">跳过此步</a>
                </div>
            </div>

        </div>
        <div class="right_wenxincode font_1">
            <div class="rw_img">
                <img src="${ctxStatic}/img/llhb/top_mayi.png" alt="">
            </div>
            <div class="rw_mainbox">
                <a href="javascript:void(0)">X</a>
                <div class="re_mainbox_img">
                    <img src="${ctxStatic}/img/llhb/erweima.jpg" alt="">
                </div>
                <p>微信扫一扫</p>
                <p>关注优蚁网</p>
            </div>
        </div>
    </div>
</div>
    <input type="hidden" name="openid" id="openid" value="${openid}" />
    <input type="hidden" name="accessToken" id="accessToken" value="${accessToken}" />
    <input type="hidden" name="nickname" id="nickname" value="${userInfo.nickname}" />
    <input type="hidden" name="headImg" id="headImg" value="${userInfo.figureurl_qq_2}" />
    <input type="hidden" name="qqBindToken" id="qqBindToken" value="${qqBindToken}" />
</form>
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
    <%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
    <%=error==null?"":"$('.r_pwd p').css(\"visibility\",\"visible\");$('.r_pwd p span').html('用户、密码错误或账号已被停用, 请重试.');"%>
    var tip = "${tip}";
    if(tip != ""){
        showMess(tip);
    }
    // 绑定按钮响应事件
    function bindAccount(){
        $("#loginForm").attr("action","${ctx}/login_qq_valid");
        //清空之前的错误提示信息
        $('.r_members p').css("visibility","hidden");
        $('.r_members p span').html('');
        $('.r_pwd p').css("visibility","hidden");
        $('.r_pwd p span').html('');

        if($("#username").val()==''){
            $('.r_members p').css("visibility","visible");
            $('.r_members p span').html('请输入用户名');
            return;
        } else {
            var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
            if (reg.test($("#username").val())) {
                $('.r_members p').css("visibility","visible");
                $('.r_members p span').html('您输入的用户名包含中文字符，请输入非中文字符');
                return;
            }
        }
        if($("#password").val()==''){
            $('.r_pwd p').css("visibility","visible");
            $('.r_pwd p span').html('请输入密码');
            return;
        }
        validateLoginName();

    }

    //使用QQ直接登录,不与任何账户绑定
    function loginByQq(){
        $("#loginForm").attr("action","${ctx}/login_qq_redirect?jumpBind=1&access_token=${accessToken}").submit();
    }


    $(function(){
        //mainwarpper 高度
        $(".mainwrapper").css({"min-height":($(window).height()-$("header").height()-$("footer").height())+"px"});
        // 内容高度居中
        $(".mainleft_img").css({"margin-top":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px"});
        $(".loginbox").css({"margin-top":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px"});


        //微信登录 帐号登录 切换
        $(".loginbox_top span").click(function(){
            $(this).addClass("lb_t_sel").siblings().removeClass("lb_t_sel");
            if($(this).index()==0){
                $(".lb_m_weixinlogin").show().next().hide();
            }else{
                $(".lb_m_zhanghaologin").show().prev().hide();
            }
        });

        //右侧微信扫码 关闭
        $(".rw_mainbox").click(function(){
            $(".right_wenxincode").hide();
        });
        //回车事件触发
        $("body").keydown(function(e) {
            if (e.which == "13") {//keyCode=13是回车键
                $('.login_now').click();
            }
        });

    });

    /**==============登录名权限验证   zhaoyl 2015年12月1日10:18:28=================**/
    function validateLoginName(){
        $.ajax({
            type:"post",
            url:"${ctx}/validateLoginNamePower",
            data:"loginName="+$("#username").val(),
            success:function(data){
                if(data==true){
                    $('#loginForm').submit();
                }else if(data==false){
                    showMess("您的用户没有登录权限，请联系客服");
                }else if(data=="error"){
                    $('.r_members p').css("visibility","visible");
                    $('.r_members p span').html('请输入正确的用户名');
                }
            }
        })
    }

    //显示弹出框
    function showMess(str){
        $(".popumask").show();
        $(".pl_yes .pl_content p").html(str);
        $(".pl_yes").show();
        setTimeout(function(){
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        },3000);
    }
    //隐藏
    function hideMess(){
        $(".popumask").hide();
        $(".pl_yes").hide();
    }

</script>
</html>
