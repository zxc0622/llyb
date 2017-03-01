<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>优蚁环保</title>
<meta name="Keywords" content="优蚁,环保">
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/css/v2/sys/login.css" />
<style type="text/css">
.msg{
	width: 270px;
    height: 20px;
    position: absolute;
    bottom: 122px;
    font-size: 14px;
    padding-left: 20px;
    line-height: 24px;
    color: red;
    font-weight: bold;
/*     background: url(/llhb/static/img/v2/register/prompt.png) 0 5px no-repeat; */
    
}

.getCheckCode {
    display: inline-block;
    width: 100px;
    height: 30px;
    background-color: #5ec520;
    color: white;
    line-height: 30px;
    text-align: center;
    cursor: pointer;
}

.checkCode{
	display:none;
}

</style>
</head>
<body>
	<div class="register_screen">
		<div class="login_logo">
			<div class="content">
				<p style="width: 135px; margin: 0 auto; margin-bottom: 55px;">
					<a href="${ctx}/index" target="_blank" style="outline: none;">
						<img src="${ctxStatic}/img/v2/register/login_logo.png" style="border:0;">
					</a>
				</p>
				<form id="mayform" method="post" action="${ctx}/login">
					<ul>
						<li class="pwd"><input type="text" name="username" id="username" placeholder="用户名"
							style="width: 270px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
							check="required pw1" value="${empty username?'用户名':username}"
							onfocus="if (value =='用户名'){value =''}"
							onblur="if (value ==''){value='用户名'}" />
							</li>
						<li class="pwd"><input type="text" id="password" name="password" placeholder="密码"
							style="width: 270px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
							check="required pw1" value="${empty password?'密码':password}"
							onfocus="if (value =='密码'){value ='';type='password';}"
							onblur="if (value ==''){value='密码';type='text';}" /></li>
						<li class="checkCode"><input type="text" name="phone" id="phone" placeholder="手机号/邮箱"
							style="width: 270px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
							check="required pw1" value="${empty phone?'手机号/邮箱':phone}"
							onfocus="if (value =='手机号/邮箱'){value =''}"
							onblur="if (value ==''){value='手机号/邮箱'}" />
							</li>
						<li class="checkCode"><input type="text" id="dynamicNum" name="dynamicNum" placeholder="验证码"
							style="width: 166px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
							check="required pw1" value="${empty username?'验证码':username}"
							onfocus="if (value =='验证码'){value =''}"
							onblur="if (value ==''){value='验证码'}" />
							<a class="getCheckCode" style="cursor: pointer;">获取验证码</a>
							</li>
					</ul>
					<div class="login">
						<p style="width:270px;height:36px;background-color:#56b11c;">
							<input class="lg" type="button" value="登录" style="cursor: pointer;width: 270px; height: 36px; background-color: #56b11c; color: #fff; font-size: 16px; border: 0; line-height: 36px;" />
						</p>
					</div>
					<p style="float: left;">
						<input id="mobileAcceptIpt" type="checkbox" name="rememberMe">
					</p>
					<span class="msg"></span>
					<div style="padding-left: 10px; line-height: 12px; float: left;">2天内自动登录</div>
				</form>
				<ul class="quicks">
					<li><a class="loginType" href="javascript:void(0);">动态密码登录</a></li>
					<li><a href="https://graph.qq.com/oauth2.0/authorize?response_type=token&client_id=101279218&redirect_uri=http://www.yyhb365.com/login_qq&scope=">QQ登录</a></li>
					<li><a href="${ctx}/reg">免费注册</a></li>
					<li><a href="${ctx}/retrieve/retrievePasswordA" style="color: #56b11c;">忘记密码</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/js/v2/fromValidate.js"></script>
	<script type="text/javascript">if (window != top){alert("session超时,请重新登录!");top.location.href = location.href;}</script>
	<script type="text/javascript">
	
		<%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
	    <%=error==null?"":"$('.msg').text('用户、密码错误或账号未激活, 请重试.');"%>
	    
	    $(function(){
	    	var isPhoneLogin=false;
	    	$(".loginType").click(function(){
	    		var text=$(this).text();
	    		if(text=="动态密码登录"){
	    			$(".pwd").hide();
	    			$(".checkCode").show();
	    			$(this).text("账号密码登录");
	    			$('#mayform').attr("action","login");
	    			isPhoneLogin=true;
	    		}else{
	    			$(".checkCode").hide();
	    			$(".pwd").show();
	    			$(this).text("动态密码登录");
	    			$('#mayform').attr("action","dynamicLogin");
	    			isPhoneLogin=false;
	    		}
	    	});
	    	
	    	//动态验证码登录时，如果登录失败，则执行
	    	if(!${empty loginErr}){
		    	$(".loginType").click();
		    	$(".msg").text("${loginErr}");
		    }
	    	
	    	$('#phone').blur(function() {
				if (checkPhoneEmail($("#phone").val())) {
					$('.msg').text("");
				} else {
					if (_value == "" || _value == undefined) {
						$('.msg').text("内容不能为空！");
					}else{
						$('.msg').text("手机号或邮箱格式不正确！");
					}
				}
			});
			
			function checkPhoneEmail(tel){
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if (!(myreg.test(tel) || email.test(tel))) {
                	$('.msg').text("手机号或邮箱格式不正确！");
                    return false;
				}
				return true;
			}
			
			//校验动态验证码是否填写
		    function checkDynamic(num){
		        if (!(/^\d{4}$/.test(num))) {
		            $('.msg').text('请填写正确的验证码');
		            return false;
		        }else{
		            return true;
		        }
		    }

			//查询用户是否存在
			function checkUserIsExit(){
				var tel = $("#phone").val();
				if (!checkPhoneEmail(tel)) {
                	$('.msg').text("手机号或邮箱格式不正确！");
                    return;
				}
				getCheckCode(tel);
			}
			
			$(".getCheckCode").click(function(){
				checkUserIsExit();
			});
			
			var time_on = true;//是否可以发送验证码
            var timer = null;
        	//获取验证码
            function getCheckCode(tel){
              	$('.msg').text("");
                if (time_on) {
                    var time = 60;
                    clearInterval(timer);
	        		$(".getCheckCode").off("click",checkUserIsExit);
	        		$(".getCheckCode").css("cursor","not-allowed");
                    $(".getCheckCode").css({background: "#CCCCCC", color: "#666666"});
                    $(".getCheckCode").html("重新获取(" + time + ")");
                    timer = setInterval(function () {
                        time--;
                        $(".getCheckCode").html("重新获取(" + time + ")");
                        if (time > 0) {
                            time_on = false;
                            return;
                        } else {
                            clearInterval(timer);
                        	$(".getCheckCode").on("click",checkUserIsExit);
                        	$(".getCheckCode").css("cursor","pointer");
                            $(".getCheckCode").html("重新获取");
                            $(".getCheckCode").css({background: "#5EC520", color: "#FFFFFF"});
                            time_on = true;
                        }
                    }, 1000);
                }
				$.ajax({
				    type: "POST",
				    url: "${ctx}/conn",
				    data: "tel=" + tel,
				    dataType: 'text',
				    success: function (data) {
				    	if(data == 'ok'){
				    		$('.msg').text("验证码发送成功，请注意查收！");
				    	}else{
				    		$('.msg').text(data);
				    	}
				        return;
				    }
				});
			}
        	
            function phoneLogin(){
                if(checkPhoneEmail($("#phone").val()) && checkDynamic($("#dynamicNum").val())){
                    $('#mayform').attr("action","dynamicLogin").submit();
                }
            }
	    	
			function login(){
				if(isPhoneLogin){
					phoneLogin();
				}else{
					var username=$("#username").val();
					var password=$("#password").val();
			        if(username==''||username=='用户名'){
			        	$('.msg').text('请输入用户名!');
			            return;
			        } else {
			        	var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
			            if (reg.test($("#username").val())) {
			            	$('.msg').text('用户名不能包含中文字符!');
			                return;
			            }
			        }
			        if(password==''||password=='密码'){
			        	$('.msg').text('请输入密码!');
			            return;
			        }
			        validateLoginName();
				}
		    }
			
			$(".lg").on("click",login);
		
			function validateLoginName(){
				$.ajax({
					type:"post",
					url:"${ctx}/validateLoginNamePower",
					data:"loginName="+$("#username").val(),
					success:function(data){
						if(data==true){
							$('#mayform').attr("action","login").submit();
						}else if(data==false){
							$('.msg').text('"账户无登录权限，请联系客服!');
						}else if(data=="error"){
							$('.msg').text('用户名不存在或账户未激活!');
						}
					}
				})
			}
			
		 	//回车事件触发
	        $("body").keydown(function(e) {
	            if (e.which == "13") {//keyCode=13是回车键
	                $('.lg').click();
	            }
	        });
	    })
	</script>
</body>
</html>