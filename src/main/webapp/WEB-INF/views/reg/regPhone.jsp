<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/18
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>优蚁环保-手机端,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
    <meta name="Keywords" content="优蚁网是环保行业专业的危废代办平台">
    <meta name="description" content="优蚁网是环保行业专业的危废代办平台">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <!--[if lt IE 9]>
    <script>
        (function () {
            document.createElement("header");
            document.createElement("footer");
            var inputs = document.getElementsByName("input");
            for (var i = 0; i < inputs.longth; i++) {
                if (inputs[i].placeholder != '') {
                    alert("1");
                }
            }
        })()
    </script>
    <![endif]-->
    <style type="text/css">
        /*main开始*/
        .mainwrapper {
            width: 100%;
            background-color: #F7F8F8;
        }

        .main {
            width: 100%;
            margin: 0 auto;
            overflow: hidden;
        }

        /*注册*/
        .main .register {
            width: 80%;
            border: solid 1px #CCCCCC;
            background: #FFFFFF;
            padding: 10px 20px;
            margin: 10px auto;
        }

        .main .register .r_title {
            height: 40px;
            margin-bottom: 15px;
        }

        .main .register .r_title .r_t_sel {
            color: #4F9028;
            border-bottom: 3px solid #4F9028;
        }

        .main .register .r_title p {
            float: left;
            width: 50%;
            text-align: center;
            line-height: 40px;
            border-bottom: solid 1px #CCCCCC;
            cursor: pointer;
        }

        .main .register .text_ipt {
            width: 100%;
            height: 30px;
            border: solid 1px #CCCCCC;
            text-indent: 15px;
        }

        .main .register .r_tip {
            height: 23px;
            color: red;
            font-size: 12px;
        }

        .main .register .r_tip img{
            margin-top:4px;
        }

        .main .r_verfication {
            height: 40px;
        }

        .main .r_verfication input {
            width: 40%;
            border: solid 1px #CCCCCC;
            height: 30px;
            float: left;
            text-indent: 15px;
        }

        .main .r_verfication p {
            width: 40%;
            height: 32px;
            line-height: 32px;
            text-align: center;
            background: #5EC520;
            margin-left: 10%;
            float: right;
            color: #FFFFFF;
            cursor: pointer;
        }

        .main .r_verfication_2 {
            height: 40px;
        }

        .main .r_verfication_2 input {
            width: 40%;
            border: solid 1px #CCCCCC;
            height: 30px;
            float: left;
            text-indent: 15px;
        }

        .main .r_verfication_2 p {
            width: 40%;
            height: 32px;
            line-height: 32px;
            text-align: center;
            background: #5EC520;
            margin-left: 10%;
            float: right;
            color: #FFFFFF;
            cursor: pointer;
        }

        .main .r_agree {
            height: 40px;
            line-height: 40px;
        }

        .main .r_agree input {
            position: relative;
            top: 2px;
            color: #666666;
        }

        .main .r_agree label a {
            color: #5EC520;
        }

        .main .r_regnow {
            width: 40%;
            height: 30px;
            margin-left:30%;
            line-height: 30px;
            text-align: center;
            color: #FFFFFF;
            background: #5EC520;
            margin-top: 10px;
            cursor: pointer;
        }

        .main .btn-connot {
            width: 40%;
            height: 30px;
            line-height: 30px;
            text-align: center;
            background: #e5e5e5;
            color: #333;;
            margin-top: 10px;
            cursor: pointer;
        }

        .populayer {
            width: 80%;
            transform: none;
            top: 30%;
            left: 10%;
        }

        .login_show {
            display: none;
        }

    </style>
</head>
<body>
<!-- main开始 -->
<div class="mainwrapper">
    <p style="color: #F7F8F8;">优蚁网是环保行业专业的危废代办平台</p>
    <div class="main" style="border:0px solid red;">
        <img src="${ctxStatic}/img/llhb/phone_reg_top_pic.png" alt="" style="display:block;width:90%;height:100px;margin:5px auto;">
        <div class="register">
            <div class="r_title" style="font-size: 18px;">
                <p class="r_t_sel">新用户注册</p>
                <p>登录</p>
            </div>
            <form id="regForm" action="" method="post">
            <p class="r_tip">
                <img src="${ctxStatic}/img/llhb/wrong.png" class="totalErr" style="display:none;float:left;"/>
                <span class="font_1 totalErr" style="display:none;float:left;">以下内容均需全部正确填写</span>
            </p>
            <div class="r_members reg_show">
                <input type="text" placeholder="手机号" class="text_ipt" id="username" name="login_name"
                       onblur="blurUsername(this);"/>
                <p class="r_tip">
                    <img src="${ctxStatic}/img/llhb/wrong.png" class="usernameErr"
                         style="display:none;float:left;"/>
                    <span class="font_1 usernameErr" style="display:none;float:left;">请填写正确的手机号码</span>
                </p>
            </div>
            <div class="r_pwd reg_show">
                <input type="password" placeholder="密码" class="text_ipt" id="password" name="password"
                       onblur="checkPwd();"/>
                <p class="r_tip">
                    <img src="${ctxStatic}/img/llhb/wrong.png" class="passwordErr"
                         style="display:none;float:left;"/>
                    <span class="font_1 passwordErr" id="passwordErr"
                          style="display:none;float:left;">密码长度应不小于六位</span>
                    <%-- <img src="${ctxStatic}/img/llhb/yes_1.png" id="duigou" style="display:none"/> --%>
                </p>
                <%--<p class="r_tip">
                    <img src="${ctxStatic}/img/llhb/yes_1.png"/>
                </p>--%>
            </div>
            <!--企业 end-->
            <div class="r_verfication reg_show">
                <input type="text" placeholder="验证码" id="checkCode"/>
                <p class="verf_btn">获取验证码</p>
            </div>
            <div class="r_agree reg_show">
                <input type="checkbox" checked="checked"/>
                <label class="font_1">我已经阅读并接受<a href="${ctx }/platform/platformInit?numm=2">《优蚁用户服务协议》</a></label>
            </div>
            <%--<input type="hidden" name="phoneToken" value="${userToken}">--%>
            </form>
            <!--企业 begin-->
           <%-- ===============================alter By rongchao START=========================================--%>
            <form id="loginForm" action="${ctx}/phoneLogin" method="post" >
            <div class="r_company_name   login_show">
                <input type="text" placeholder="手机号" id="loginName" class="text_ipt" name="username" value="${username}"/>
                <p class="r_tip">
                    <img src="${ctxStatic}/img/llhb/wrong.png" class="loginNameErr"
                         style="display:none;float:left;"/>
                    <span></span>
                </p>
            </div>
            <div class="r_verfication_2 login_show">
                <input type="text" placeholder="验证码" id="checkCode2" name="checkCode" value="${checkCode}"/>
                <p class="verf_btn_2">获取验证码</p>
            </div>
            <div class="login_show" style="border:0px solid red;width:100%;height:20px;margin-top:-8px;">
                <p class="r_tip" style="float:left;">
                    <img src="${ctxStatic}/img/llhb/wrong.png" class="loginPwdErr"
                         style="display:none;float:left;"/>
                    <span></span>
                </p>
            </div>
            <input type="hidden" name="salesmanCode" value="${salesmanCode}" />
            </form>
            <%--===============================alter By rongchao END=========================================--%>
            <div class="clearfix">
                <div class=" r_regnow fl zhuce reg_show">
                    <p>立即注册</p>
                </div>
                <div class="r_regnow fl denglu login_show">
                    <p>登录</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 错误弹出层 -->
<div class="popumask popumasks"></div>
<div class="populayer pl_normal populayers">
    <div class="layer_top">
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3" id="contentText">
        <p>请先完善信息!</p>
    </div>
</div>

<!-- main结束 -->
<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
    var timer = null;
    var time_on = true;
    var mess_time;
    //获取登录失败后的错误信息
    <%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
    <%=error==null?"":"$('.loginNameErr').css(\"display\",\"block\");$('.loginNameErr').next().html('手机号,验证码错误或账号已被停用, 请重试.');"%>

    //获取验证码方法
    function get_verfication() {
        var aa = 0;
        var tele = $("#username").val();
        var bb = false;
        $.ajax({
            type: "POST",
            url: "${ctx}/reg/checkTelExists",
            data: "tel=" + tele,
            async: false,
            dataType: 'text',
            success: function (data) {
                if (data != "ok") {
                    mess(data);
                    bb = false;
                } else {
                    bb = true;
                }
            }
        });
        if (bb == false) {
            return;
        }
        if (!(/^1[3|4|5|8][0-9]\d{8}$/.test(tele))) {
            mess("请输入正确的手机号码");

        } else {
            if (time_on) {
                var time = 30;
                clearInterval(timer);
                $(this).css({background: "#CCCCCC", color: "#666666"});
                $(this).html("重新获取(" + time + ")");
                timer = setInterval(function () {
                    time--;
                    $(".r_verfication .verf_btn").html("重新获取(" + time + ")");
                    if (time > 0) {
                        time_on = false;
                        msgSta = "";

                    } else {
                        clearInterval(timer);
                        $(".r_verfication .verf_btn").html("重新获取");
                        $(".r_verfication .verf_btn").css({background: "#5EC520", color: "#FFFFFF"});
                        time_on = true;
                    }
                }, 1000);

            }
            $.ajax({
                type: "POST",
                url: "${ctx}/conn",
                data: "tel=" + tele,
                dataType: 'text',
                success: function (data) {
                    if (data != "ok") {
                        //mess(data);

                    }

                }
            });

        }
    }

    function get_verfication_2(){
        var userName = $("#loginName").val();
        //判断手机号是否正确
        if (!(/^1[3|4|5|8][0-9]\d{8}$/.test(userName))) {
            mess("请输入正确的手机号码");
            return;
        }
        //发送短信
        var time = 30;
        clearInterval(timer);
        $(this).css({background: "#CCCCCC", color: "#666666"});
        $(this).html("重新获取(" + time + ")");
        timer = setInterval(function () {
            time--;
            $(".r_verfication_2 .verf_btn_2").html("重新获取(" + time + ")");
            if (time > 0) {
                time_on = false;
                msgSta = "";

            } else {
                clearInterval(timer);
                $(".r_verfication_2 .verf_btn_2").html("重新获取");
                $(".r_verfication_2 .verf_btn_2").css({background: "#5EC520", color: "#FFFFFF"});
            }
        }, 1000);
        $.ajax({
            type: "POST",
            url: "${ctx}/conn",
            data: "tel=" + userName,
            dataType: 'text',
            success: function (data) {
                if (data != "ok") {
                    mess(data);
                }
            }
        });

    }


    //判断浏览器方法
    function getExplorer() {
        var explorer = window.navigator.userAgent;
        var my_explorer;
        //ie
        if (explorer.indexOf("MSIE") >= 0) {
            return my_explorer = "ie";
        }
        //firefox
        else if (explorer.indexOf("Firefox") >= 0) {
            return my_explorer = "Firefox";
        }
        //Chrome
        else if (explorer.indexOf("Chrome") >= 0) {
            return my_explorer = "Chrome";
        }
    }
    $(function () {

        //mainwarpper 高度
        $(".mainwrapper").css({"min-height": ($(window).height() - $("header").height() - $("footer").height()) + "px"});
        // 内容高度居中
        $(".register").css({"margin-top": ($(".mainwrapper").height() - $(".register").height() - 180) / 2 + "px"});
        $(".mainleft_img").css({"margin-top": ($(".mainwrapper").height() - $(".mainleft_img").height()) / 2 + "px"});
        $(".loginbox").css({"margin-top": ($(".mainwrapper").height() - $(".loginbox").outerHeight()) / 2 + "px"});
        //注册头部banner切换
        $(".main .register .r_title p").on("click",function(){
            $(this).addClass("r_t_sel").siblings().removeClass("r_t_sel");
            p_index = $(this).index();
            if(!p_index){
                $(".reg_show").show();
                $(".login_show").hide();
                //setNull();
            }else{
                $(".reg_show").hide();
                $(".login_show").show();
                //setNull();
            }
         });
        //获取验证码
        $(".r_verfication .verf_btn").on("click", get_verfication);
        $(".r_verfication_2 .verf_btn_2").on("click", get_verfication_2);
        populayer_fn();
        //登录按钮绑定
        $(".denglu").click(denglu);
        //如果有错误信息,则将登录tab页展示出来
        <%=error==null?"":"$('.main .register .r_title p:eq(1)').click();"%>
    });
    //注册 弹出层方法
    function populayer_fn(btn) {
        if (btn) {
            console.log(btn);
            $(btn).click(function () {
                $(".populayer").show();
                $(".popumask").show();

            });

        }
        $(".popumask").css({"width": $(window).width() + "px", "height": $(window).height() + "px"});
        //弹出层 添加对号
        $(".checkone p .l_square").click(function () {
            $(this).parent().parent().find("span").removeClass("checkone_sel");
            $(this).addClass("checkone_sel");
        });
        //弹出层 关闭
        $(".populayer .layer_top a").click(function () {
            $(".populayer").fadeOut();
            $(".popumask").fadeOut();
        });
        $(".popumask").click(function () {
            $(".populayer").fadeOut();
            $(".popumask").fadeOut();
        });
        $(".close_btn").click(function () {
            clearInterval(mess_time);
            $(".populayer").fadeOut();
            $(".popumask").fadeOut();
        });
        //弹出层 进入优蚁
        // $(".populayer register_done").click(function(){
        //     //跳转页面
        //     //location.assign("https://www/llhb/staticcom");
        // });s
    }

    $(function () {
        p_index = 0;
        flagGlobal = false;
        var leibie;
        //注册
        $(".zhuce").bind("click", function () {
            var username = $("#username").val();
            var password = $("#password").val();
            var telephone = $("#telephone").val();
            var checkCode = $("#checkCode").val();
            var gouxuan = $('input[type=checkbox]').is(':checked');
            if ($.trim(username) == "" || $.trim(password) == "" || $.trim(checkCode) == "") {
                mess("请先完善信息");
                flagGlobal = false;
                return;
            } else if (!(/^1[3|4|5|8|7]\d{9}$/.test(username))) {
                mess("请输入正确的手机号码");
                return;
            } else {
                flagGlobal = true;
            }
            var userNameFlag = blurUsername();
            var passwordFlag = checkPwd();
            if (!userNameFlag || !passwordFlag ) {
                mess("请注意提示!");
                flagGlobal = false;
                return;
            }
            //先判断是否有填写信息
            if (flagGlobal) {
                gouxuan = $('input[type=checkbox]').is(':checked');
                if (!gouxuan) {
                    mess("请先同意服务条款!");
                    return;
                }
                //注册
                $.ajax({
                    type: "POST",
                    url: "${ctx}/reg/regPhoneSave",
                    data: "userToken=${userToken}&checkCode=" + $("#checkCode").val() + "&salesmanCode=${salesmanCode}&username=" + username + "&password=" + password + "&leixing=company",
                    dataType: 'text',
                    success: function (data) {
                        if (data == 'weifei') {
                            mess("注册成功");
                            setTimeout(function () {
                                location.href = "${ctx}/home?str=/ws/productwaste/pwbaseinfo/notfilledPage";
                            }, 3000);
                        } else if (data != 'ok') {
                            mess(data);

                        }

                    }
                });

            }// if(flagGlobal)
        });


    });
    //校验用户名
    function blurUsername() {
        var username = $("#username").val();
        var flag = false;
        var regEx = /^1[3|4|5|8|7]\d{9}$/; //手机正则表达式
        var flag = regEx.test(username);
        if (!flag) {
            $(".usernameErr").css("display", "block");
            flagGlobal = false;
            flag = false;
        } else {
            flagGlobal = true;
            $(".usernameErr").css("display", "none");
            flag = true;
        }
        return flag;
    }
    function checkPwd() {
        var pwd1 = $("#password").val().length;
        var flag = false;
        if (pwd1 < 6) {
            $(".passwordErr").css("display", "block");
            flag = false;
        } else {
            $(".passwordErr").css("display", "none");
            flag = true;
        }
        return flag;
    }
    //校验邮箱
    function blurEmail() {
        var email = $("#email").val();
        var flag = false;
        var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        if (!re.test(email)) {
            $(".emailErr").css("display", "block");
            flag = false;
            return;
        } else {
            $(".emailErr").css("display", "none");
            flag = true;
        }
        return flag;
    }
    function getValue() {
        var username = $("#username").val();
        var password = $("#password").val();
        var telephone = $("#telephone").val();
        var compName = $("#compName").val();
        var lianxiName = $("#lianxiName").val();
        var email = $("#email").val();
    }
    //置空信息
    function setNull() {
        $("#username").val('');
        $("#password").val('');
        $("#password2").val('');
        $("#telephone").val('');
        $("#checkCode").val('');
        $("#compName").val('');
        $("#lianxiName").val('');
        $("#email").val('');
    }
    function mess(str) {
        var ss = "<p>" + str + "</P>";
        $(".populayers #contentText").empty().append(ss);
        $(".populayers").show();
        $(".popumasks").show();
        mess_time = setInterval(function () {
            $(".close_btn").click();
        }, 3000);
    }

    //发送短信
    function getverf() {
        $.ajax({
            type: "POST",
            url: "${ctx}/conn",
            data: "tel=" + $("#telephone").val(),
            dataType: 'text',
            success: function (data) {
            }
        });
    }
    function denglu() {
        //校验用户名
        if($("#loginName").val()==''){
            $('.loginNameErr').css("display","block");
            $('.loginNameErr').next().html('请输入手机号');
            return;
        } else {
            var reg = /^1[3|4|5|8|7]\d{9}$/;
            if (!reg.test($("#loginName").val())) {
                $('.loginNameErr').css("display","block");
                $('.loginNameErr').next().html('请输入正确的手机号');
                return;
            }
        }
        if($("#checkCode2").val()==''){
            $('.loginPwdErr').css("display","block");
            $('.loginPwdErr').next().html('请输入验证码');
            return;
        }
        validateLoginName();
    }
    function validateLoginName(){
        $.ajax({
            type:"post",
            url:"${ctx}/validateLoginNamePower",
            data:"loginName="+$("#loginName").val(),
            success:function(data){
                if(data==true){
                    $('#loginForm').submit();
                }else if(data==false){
                    mess("您的用户没有登录权限，请联系客服");
                }else if(data=="error"){
                    mess("用户名不存在");
                }
            }
        })
    }
</script>
<script type="text/javascript">
    var not_in_mm_css = "https://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/not_in_mm2a7a3f.css";
    var windowwx_css = "https://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_winwx2c2c35.css";
    var tid = "";
    var aid = "";
    var clientversion = "0";
    var appuin = "MzA4OTg1MTE4Ng==";

    var source = "23";
    var scene = 75;

    var itemidx = "";

    var _copyright_stat = "0";
    var _ori_article_type = "";

    var nickname = "";
    var appmsg_type = "9";
    var ct = "1457436571";
    var user_name = "gh_27c869721d7c";
    var user_name_new = "";
    var fakeid   = "";
    var version   = "";
    var is_limit_user   = "0";
    var msg_title = "";
    var msg_desc = "";
    var msg_cdn_url = "${ctxStatic}/img/llhb/reg_phone_img.jpg";
    var msg_link = "http://mp.weixin.qq.com/s?__biz=MzA4OTg1MTE4Ng==&amp;mid=403228126&amp;idx=7&amp;sn=778ba2694d268c455ed5ccbd5a7169f2#rd";
    var user_uin = "0"*1;
    var msg_source_url = '';
    var img_format = 'jpeg';
    var srcid = '0309aY1byCQG1tCWTc0TKtrm';
    var networkType;
    var appmsgid = '' || '403228126';
    var comment_id = "0" * 1;
    var comment_enabled = "" * 1;
    var is_need_reward = "0" * 1;
    var is_https_res = ("" * 1) && (location.protocol == "https:");

    var devicetype = "";
    var source_username = "";
    var profile_ext_signature = "" || "";
    var reprint_ticket = "";
    var source_mid = "";
    var source_idx = "";

    var show_comment = "";
    var __appmsgCgiData = {
        can_use_page : "0"*1,
        is_wxg_stuff_uin : "0"*1,
        card_pos : "",
        copyright_stat : "0",
        source_biz : "",
        hd_head_img : "http://wx.qlogo.cn/mmhead/Q3auHgzwzM4AIAiaIPaurmNlWa8uHFuo2wt6OO6cz2RuasRYaPrHIqQ/0"||(window.location.protocol+"//"+window.location.host + "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/appmsg/pic_rumor_link.2x264e76.jpg")
    };
    var _empty_v = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/pages/voice/empty26f1f1.mp3";

    var copyright_stat = "0" * 1;

    var pay_fee = "" * 1;
    var pay_timestamp = "";
    var need_pay = "" * 1;

    var need_report_cost = "0" * 1;

    window.wxtoken = "";
    if(!!window.__initCatch){
        window.__initCatch({
            idkey : 27613,
            startKey : 0,
            limit : 128,
            reportOpt : {
                uin : uin,
                biz : biz,
                mid : mid,
                idx : idx,
                sn  : sn
            }



        });
    }
</script>
</body>
</html>
