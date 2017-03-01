<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>优蚁环保</title>
    <meta name="Keywords" content="优蚁,环保">
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
	<!–[if IE]>  
		<script src="${ctxStatic}/js/html5.js"></script> 
	<![endif]–>
    <style type="text/css">
    	article,aside,dialog,footer,header,section,footer,nav,figure,menu{display:block}
        /*main开始*/
        .mainwrapper{width:100%;background-color: #F7F8F8;min-width: 1000px;}
        .main{width:1000px;margin:0 auto;overflow: hidden;}
        /*左侧图片*/
        .main .mainleft_img{width: 400px;height: 300px;float:left;margin-top:70px;}
        .main .mainleft_img img{width:100%;height:100%;}

        /*登录框开始*/
        .loginbox a:hover{color:#5EC520;}
        .loginbox{width:300px;padding:30px 15px;float:left;border:1px solid #cccccc;margin-left: 130px;background-color: #fff;margin-top: 60px;}
        .loginbox .loginbox_top{height:30px;width:100%;border-bottom: 1px solid #cccccc;}
        .loginbox .loginbox_top span{height:29px;line-height: 30px;width:40%;display: inline-block;text-align: center;cursor: pointer;position: relative;}
        .loginbox .loginbox_top span .new{position:absolute;display: block;width:26px;height:15px;top:-2px;right:5px;background:url(${ctxStatic}/img/llhb/new.png) 0 0 no-repeat;}

        .loginbox .loginbox_top .lb_t_sel{color:#468c38;border-bottom: 3px solid #468c38;}
        .loginbox .loginbox_main{padding:0 10px;margin-top: 20px;width:280px;}
        /*帐号方式登录*/
        .loginbox_main .lb_m_zhanghaologin{width:100%;overflow: hidden;}
        .zhanghaol_uname input,.zhanghaol_upassword input{width:268px;height:20px;padding:5px;border:1px solid #cccccc;}

        .uname_validate,.upassword_validate,.phone_validate,.dynamic_validate {height:20px;line-height: 20px;width:270px;color:red;}


        /*提示样式*/
        .tip_span{line-height: 15px;margin-left: 15px;position: relative;}
        .tip_warning::before{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}

        .lb_m_zhanghaologin .safe{height: 30px;line-height: 30px;}
        .safe .safe_login{float:left;overflow: hidden;}
        .safe .safe_login >*{float:left;}
        .safe .safe_login input{margin-top: 9px;}
        .safe .safe_login label{margin-left:3px;color:#666666;}
        .safe .forget_pw{float:right;margin-right: 15px;position: relative;}
        .safe .forget_pw::after{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/icon2.png) 0 0 no-repeat;position: absolute;top:8px;right:-16px;}

         .login_now{color:#fff;background-color: #5cb531;text-align: center;width:280px;height:30px;line-height: 30px;border:none;font-size: 14px;margin-top:10px;}

        .lb_m_zhanghaologin .zhanghaol_other{width:280px;height:30px;line-height: 30px;margin-top:10px;overflow: hidden;}
        .lb_m_zhanghaologin .zhanghaol_other .qq_login{float:left;margin-left: 17px;position: absolute;}
        .lb_m_zhanghaologin .zhanghaol_other .qq_login::before{content:"";width:16px;height:16px;background:url(${ctxStatic}/img/llhb/litterQQ2.png) 0 0 no-repeat;position: absolute;top:8px;left:-15px;}
        .lb_m_zhanghaologin .zhanghaol_other .register{float:right;color:#ee7800;}
        /*账号方式登录结束*/

        /*微信登录*/
        .loginbox_main .lb_m_weixinlogin{margin-top: 30px;}
        .lb_m_weixinlogin .weixincode{width:145px;height:145px;padding:2px;border:1px solid #cccccc;margin:0 auto;}
        .lb_m_weixinlogin .weixincode img{width:100%;height:100%;}
        .lb_m_weixinlogin >p{text-align: center;margin-top: 10px;}
        .lb_m_weixinlogin >a{display: block;text-align: center;color:#666;}
        /*微信登录结束*/
        /*登录框结束*/

        /*右侧扫码*/
        .main .right_wenxincode{float:left;margin-left: 380px;position: relative;width:120px;position: fixed;top:333px;left:50%;}

        /*重复*/
        .right_wenxincode .rw_img{width:65px;height:80px;position: absolute;top:0;left:20px;}
        .right_wenxincode .rw_img img{width:100%;height:100%;}
        .right_wenxincode .rw_mainbox{width:120px;height:140px;border:1px solid #cccccc;position: relative;float:left;margin-top: 70px;z-index: 5;background-color: #fff;cursor: pointer;}
        .rw_mainbox a{position: absolute;right:5px;top:0;color:#666666;}
        .rw_mainbox .re_mainbox_img{width:80px;height:80px;margin:20px auto 0;}
        .rw_mainbox .re_mainbox_img img{height:100%;height:100%;}
        .rw_mainbox p{text-align: center;line-height: 15px;color:#666666;}
        /*main结束*/
        
        /*only-yes弹出*/
        .btns_yes{margin-top: 15px;}
        .btns_yes .yes-btn{width:100px;height:25px;line-height: 25px;color:#fff;background-color: #5ec520;border:1px solid #5ec520;display: inline-block;}

        .verf_btn{
            width: 40%;
            height: 32px;
            line-height: 32px;
            text-align: center;
            background: #5EC520;
            margin-left: 5%;
            float: right;
            color: #FFFFFF;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">if (window != top){alert("session超时,请重新登录!");top.location.href = location.href;}</script>
    
</head>

<body>
<!--头部 start-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!--头部 end-->
<!-- main开始 -->
<form id="loginForm" action="${ctx}/login" method="post">
<input type="hidden" name="salesmanCode" value="${salesmanCode}" />
<div class="mainwrapper">
    <div class="main">
        <div class="mainleft_img">
            <img src="${ctxStatic}/img/llhb/left_big.png" alt="">
        </div>
        <div class="loginbox">
            <div class="loginbox_top font_3">
                <span class="lb_t_zhanghaologin lb_t_sel" style="width:42%;">账号密码登录</span>
                <span class="lb_t_zhanghaologin" style="width:56%;">动态密码登录<b class="new"></b></span>
            </div>
            <div class="loginbox_main">
                <!-- 微信登录 内容 -->
                <%--<div class="lb_m_weixinlogin" style="display:none" >
                  <div class="weixincode">
                       <img src="${ctxStatic}/img/llhb/erweima.jpg" alt="">
                   </div>
                   <p>微信扫码 快速登录</p>
                   <a href="javascript:void(0)" class="font_1">使用帮助</a>
                </div>
                --%>

                <!-- 帐号登录 内容-->
                <div class="lb_m_zhanghaologin" >
                    <div class="zhanghaol_uname">
                        <input type="text" placeholder="用户名" id="username" name="username" value="${username}">
                        <div class="uname_validate">
							<span class="tip_span"></span>
                        </div>
                    </div>
                    <div class="zhanghaol_upassword">
                        <input type="password" placeholder="密码" id="password" name="password" value="${password}">
                        <div class="upassword_validate">
                            <span class="tip_span"></span>
                        </div>
                    </div>
                    <div class="safe">
                        <span class="safe_login">
                            <input type="checkbox" id="rememberMe" name="rememberMe">
                            <label for="rememberMe">2天内自动登录</label>
                        </span>
                        <a class="forget_pw" href="${ctx}/retrieve/retrievePasswordA">忘记密码</a>
                    </div>
                    <input class="login_now" type="button" value="立即登录" onclick="login();">

                    <div class="zhanghaol_other font_1">
                        <a href="javascript:connectQQ();" class="qq_login" > &nbsp;QQ登录</a>
                        <a href="javascript:void(0)" class="register" onclick="register();">免费注册</a>
                    </div>
                </div>
                <div class="lb_m_phonedynamiclogin" style="display:none;" >
                    <div class="zhanghaol_uname">
                        <input type="text" placeholder="手机号/邮箱" id="phone" name="phone" value="${phone}">
                        <div class="phone_validate">
                            <span class="tip_span"></span>
                        </div>
                    </div>
                    <div class="zhanghaol_uname">
                        <input type="text" placeholder="动态码" id="dynamicNum" name="dynamicNum" value="${dynamicNum}" style="width:45%;">
                        <p class="verf_btn">获取验证码</p>
                        <div class="dynamic_validate">
                            <span class="tip_span"></span>
                        </div>
                    </div>
                    <input class="login_now" type="button" value="立即登录" onclick="phoneLogin();">
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
</form> 
<!-- main结束 -->
<!-- 底部开始 -->
<%@ include file="/WEB-INF/views/include/footer_bottom.jsp" %>
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
<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">
    <%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
    <%=error==null?"":"$('.upassword_validate').find('span').addClass('tip_warning').html('用户、密码错误或账号未激活, 请重试.');"%>
    var phoneErr = '${phoneErr}';


    function login(){
        if($("#username").val()==''){
        	$('.uname_validate').find('span').addClass('tip_warning').html('请输入用户名');
            return;
        } else {
            var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
            if (reg.test($("#username").val())) {
            	$('.uname_validate').find('span').addClass('tip_warning').html('您输入的用户名包含中文字符，请输入非中文字符');
                return;
            }
        }
        if($("#password").val()==''){
        	$('.upassword_validate').find('span').addClass('tip_warning').html('请输入密码');
            return;
        }
        validateLoginName();
        
        	
        
      //  $('#loginForm').submit();
    }

    function phoneLogin(){
        if(checkPhone($("#phone").val()) && checkDynamic($("#dynamicNum").val())){
            $('#loginForm').attr("action","dynamicLogin").submit();
        }
    }

    $(function(){
        //mainwarpper 高度
        $(".mainwrapper").css({"min-height":($(window).height()-$("header").height()-$(".footer_bottomBox").height())+"px"});
        // 内容高度居中
       	//$(".mainleft_img").css({"margin-top":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".mainleft_img").height())/2+"px"});
        //$(".loginbox").css({"margin-top":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px","margin-bottom":($(".mainwrapper").height()-$(".loginbox").outerHeight())/2+"px"});

        //微信登录 帐号登录 切换
        $(".loginbox_top span").click(function(){
            $(this).addClass("lb_t_sel").siblings().removeClass("lb_t_sel");
            if($(this).index()==0){
                $(".lb_m_zhanghaologin").show().next().hide();
            }else{
                $(".lb_m_phonedynamiclogin").show().prev().hide();
            }
        });
        if(!isNull(phoneErr)){
            $(".loginbox_top span:eq(1)").click();
            $(".dynamic_validate").find("span").addClass("tip_warning").html(phoneErr);
        }

        //右侧微信扫码 关闭
        $(".rw_mainbox").click(function(){
            $(".right_wenxincode").hide();
        });
        //回车事件触发
        $("body").keydown(function(e) {
            if (e.which == "13") {//keyCode=13是回车键
                var idx = $(".lb_t_sel:eq(0)").index();
                $('.login_now:eq('+idx+')').click();
            }
        });


    });
	
	function register(){
		location.href="${ctx}/reg";
	}
	
	/**==============登录名权限验证   zhaoyl 2015年12月1日10:18:28=================**/
	function validateLoginName(){
		$.ajax({
			type:"post",
			url:"${ctx}/validateLoginNamePower",
			data:"loginName="+$("#username").val(),
			success:function(data){
				if(data==true){
					$('#loginForm').attr("action","login").submit();
				}else if(data==false){
					showMess("您的用户没有登录权限，请联系客服");
				}else if(data=="error"){
					$('.uname_validate').find('span').addClass('tip_warning').html('用户名不存在或账户未激活');
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
            $(".pl_yes .pl_content p").html("");
        	$(".pl_yes").hide();
    	},3000);
	}
	//隐藏
	function hideMess(){
		$(".popumask").hide();
		$(".pl_yes").hide();
	}

    //跳转到QQ登录
    function connectQQ(){
        window.location.href="https://graph.qq.com/oauth2.0/authorize?response_type=token&client_id=101279218&redirect_uri=http://www.yyhb365.com/login_qq&scope=";
    }

    //获取验证码
    var step = 60;
    $(".verf_btn").click(function(){
        var phone = $("#phone").val();
        if(!checkPhone(phone)){
            return;
        }
        if(step != 60){
            return;
        }
        $(".verf_btn").css({background: "#CCCCCC", color: "#666666"});
        $(".verf_btn").html("重新发送" + step);
        step --;
        var timer = setInterval(function(){
            $(".verf_btn").css({background: "#CCCCCC", color: "#666666"});
            $(".verf_btn").html("重新发送" + step);
            step --;
            if(step < 0){
                $(".verf_btn").css({background: "#5EC520", color: "#FFFFFF"});
                $(".verf_btn").html("重新获取");
                clearInterval(timer);
                step = 60;
            }
        },1000);
        //清除掉手机号码校验错误
        //调用ajax,获取短信验证码
        $('.phone_validate').find('span').removeClass('tip_warning').html('');
        getDynamicCode(phone);
    });

    //校验手机号是否正确
    function checkPhone(phone){
        $('.phone_validate').find('span').removeClass('tip_warning').html('');
        if (!(/^1[3|4|5|8|7][0-9]\d{4,8}$/.test(phone)) && !(/^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/).test(phone)) {
            $('.phone_validate').find('span').addClass('tip_warning').html('请输入正确的手机号码或邮箱');
            return false;
        }else{
            return true;
        }
    }
    //校验动态验证码是否填写
    function checkDynamic(num){
        if (!(/^\d{4}$/.test(num))) {
            $('.dynamic_validate').find('span').addClass('tip_warning').html('请填写正确的验证码');
            return false;
        }else{
            return true;
        }
    }

    function getDynamicCode(phone){
        $.ajax({
            type: "POST",
            url: "${ctx}/conn",
            data: "tel=" + phone,
            dataType: 'text',
            success: function (data) {
                if (data == "ok") {
                    showMess("短信已发送,请注意查收");
                }else{
                    showMess(data);
                }

            }
        });
    }

    function isNull(data){
        return (data == "" || data == undefined || data == null) ? true : false;
    }
</script>

</body>
</html>