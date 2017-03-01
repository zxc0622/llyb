<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<link rel="shortcut icon" href="/llhb/static/img/llhb/bitbug_favicon.ico">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>优蚁环保-注册,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台">
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/css/v2/sys/register.css" />
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
				<form id="mayform" method="post" action="">
					<ul>
						<li>
							<input type='text' id="phone" value="手机号码/邮箱"
							onfocus="if (value =='手机号码/邮箱'){value =''}"
							onblur="if (value ==''){value='手机号码/邮箱'}"
							placeholder="手机号码/邮箱" check="required1" name="username" />
							<p class="tiptext" style="color: red;"></p>
						</li>
						<li>
							<input type="text" id="password" value="密码"
							onfocus="if (value =='密码'){value ='';type='password';}"
							onblur="if (value ==''){value='密码';type='text';}"
							placeholder="密码" name="password" />
						</li>
						<li>
							<input type="text" id="checkCode" value="验证码"
							onfocus="if (value =='验证码'){value =''}"
							onblur="if (value ==''){value='验证码'}"
							placeholder="验证码" name="checkCode" />
							<a class="getCheckCode" href="javascript:void(0)">获取验证码</a>
						</li>
					</ul>
					<div class="clicks">
						<p stye="width:270px;height:43px;background-color:#56b11c;">
							<a id="submitForm">注册</a>
						</p>
					</div>
					<p style="float: left;">
						<input id="mobileAcceptIpt" type="checkbox" checked="checked"
							tabindex="-1" style="vertical-align: middle;">
					</p>
					<div style="padding-left: 10px; float: left; line-height: 12px;">我已经阅读并接受<a href="${ctx}/platform/platformInit?numm=2">《优蚁用户服务协议》</a></div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/js/v2/fromValidate.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			//注册点击事件
			$('.clicks').click(function() {
				var _value = $('#phone').val();
				var msgPEl = $('.tiptext');
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if (!(myreg.test(_value) || email.test(_value))) {
					$('.tiptext').text("手机号或邮箱格式不正确！");
					return;
				}
				
				if(!($("#mobileAcceptIpt").is(':checked'))){
					$('.tiptext').text("您需要接受优蚁用户协议才能注册！");
					return;
				}
				
				var pwd = $('#password').val();
				var code = $('#checkCode').val();
				var isMail = 0;
				if(email.test(_value)){
					isMail=1;
				}
				
				if(pwd == "" || pwd == "密码" || pwd == undefined){
					$('.tiptext').text('请输入密码');
					return;
				}
				
				if(pwd.length < 6){
					$('.tiptext').text('密码长度至少6位');
					return;
				}
				
				if(code == "" || code == "验证码" || code == undefined){
					$('.tiptext').text("请输入验证码！");
					return;
				}
				
				$.ajax({
				    type: "POST",
				    url: "${ctx}/reg/regNewUser",
				    data: {
				    	username:_value,
				    	password:pwd,
				    	checkCode:code,
				    	isMail:isMail
				    },
				    dataType: 'text',
				    success: function (data) {
				    	if(data == 'ok'){
				    		$('.tiptext').text("注册成功，正在登陆...");
				    		setInterval(function(){
				    			var form = $(
				    				'<form method="post" action="${ctx}/login"></form>"'
				    				);
				    			var nameInput = '<input type="text" name="username" value="'+_value+'" />';
				    			var pwdInput = '<input type="text" name="password" value="'+pwd+'" />';
				    			
				    			form.append(nameInput);
				    			form.append(pwdInput);
				    			
				    			form.attr("action","login").submit();
				    					
				    		}, 1000);
				    	}else{
				    		$('.tiptext').text(data);
				    	}
				        return;
				    }
				});
				
			});
			
			$('#phone').blur(function() {
				var _value = $('#phone').val();
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if (myreg.test(_value) || email.test(_value)) {
					$('.tiptext').text("");
				} else {
					if (_value == "" || _value == undefined) {
						$('.tiptext').text("内容不能为空！");
					}else{
						$('.tiptext').text("手机号或邮箱格式不正确！");
					}
				}
			});
			
			//获取验证码绑定点击事件
			$(".getCheckCode").on("click",checkUserIsExit);

			//$("#mayform").checkForm();
			
			//查询用户是否存在
			function checkUserIsExit(){
				var tel = $("#phone").val();
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if (!(myreg.test(tel) || email.test(tel))) {
                	$('.tiptext').text("手机号或邮箱格式不正确！");
                    return;
				}
				$.ajax({
	                type: "POST",
	                url: "${ctx}/reg/checkUserIsExit",
	                data: "tel=" + tel,
	                dataType: 'text',
	                success: function (data) {
	                	if(data == 'ok'){
	                		getCheckCode(tel);
	                	}else{
	                		$('.tiptext').text(data);
	                	}
	                    return;
	                }
	            });
			}
			
			var time_on = true;//是否可以发送验证码
            var timer = null;
        	//获取验证码
            function getCheckCode(tel){
              	$('.tiptext').text("");
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
				    		$('.tiptext').text("验证码发送成功，请注意查收！");
				    	}else{
				    		$('.tiptext').text(data);
				    	}
				        return;
				    }
				});
			}
            
			
		});
	</script>
</body>
</html>