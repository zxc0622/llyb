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
	<title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台">
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/css/v2/sys/forgot.css" />
</head>
<body>
	<div class="register_screen">
		<div class="login_logo">
			<div class="content">
				<div class="step-body" id="myStep">
					<div class="step-header">
						<ul>
							<li><p>用户验证</p></li>
							<li><p>重置密码</p></li>
							<li><p>修改成功</p></li>
						</ul>
					</div>
					<div class="step-content">
						<div class="step-list">
							<form id="mayform" method="post" action="success.html">
								<ul>
									<li>
										<input type="text" id="phoneMail"
										name="phone" value="手机号码/邮箱"
										onfocus="if (value =='手机号码/邮箱'){value =''}"
										onblur="if (value ==''){value='手机号码/邮箱'}" />
									</li>
									<li style="position: relative;">
										<input type="text" id="checkCode"
										value="验证码" onfocus="if (value =='验证码'){value =''}"
										onblur="if (value ==''){value='验证码'}" />
										<input type="button" value="验证码" style="cursor: pointer;" class="getCheckCode" />
									</li>

								</ul>
							</form>
						</div>
						<div class="step-list">
							<form id="mayform" method="post" action="success.html">
								<ul>
									<li><input type="text" id="newPwd"
										style="width: 270px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
										name="phone" value="新密码"
										onfocus="if (value =='新密码'){value ='';type='password'}"
										onblur="if (value ==''){value='新密码';type='text'}" /></li>
									<li><input type="text" id="reNewPwd"
										style="width: 270px; height: 43px; line-height: 43px; color: #63b62f; border: 0; border-bottom: 1px solid #63b62f;"
										name="phone" value="再次输入"
										onfocus="if (value =='再次输入'){value ='';type='password'}"
										onblur="if (value ==''){value='再次输入';type='text'}" /></li>
								</ul>
							</form>
						</div>
						<div class="step-list">
							<h2>修改成功</h2>
							<div class="shop_tabb">
								<ul class="hd">
									<a href="${ctx}/login"><li class="current">前往登录</li></a>
									<a href="${ctx}/index"><li cass="home_page">进入首页</li></a>
								</ul>
							</div>
						</div>

					</div>

				</div>
				<form id="mayform" method="post" action="success.html">

					<div class="present">
						<p stye="width:270px;height:36px;background-color:#56b11c;">
							<input type="button" id="nextBtn" value="提交"
								style="width: 270px; text-align: center; height: 36px; cursor: pointer; background-color: #56b11c; color: #fff; font-size: 16px; border: 0; line-height: 36px;" />
						</p>
					</div>
					<p class="tiptext" style="color:red;"></p>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/js/v2/fromValidate.js"></script>
<script src="${ctxStatic }/js/v2/jquery.step.js"></script>
<script type="text/javascript">
	$(function() {
		var stepNum = 1;//步骤标记
		
		$("#mayform").checkForm();
		
		var step = $("#myStep").step();
		//提交按钮的点击事件
		$("#nextBtn").click(function(event) {
			sub();
		});
		
		//获取验证码点击事件
		$(".getCheckCode").click(function(){
			var tel = $("#phoneMail").val();
			var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
			if (!(myreg.test(tel) || email.test(tel))) {
				$('.tiptext').text("请输入正确手机号或邮箱！");
				return;
			}
			
			checkUserIsExit(tel);
			
		});
		
		//查询用户是否存在，存在即发送验证码
		function checkUserIsExit(tel){
			$.ajax({
                type: "POST",
                url: "${ctx}/retrieve/checkUserIsExit",
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
		
		//获取验证码方法
		function getCheckCode(tel){
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
		
		//提交按钮触发的事件
		function sub(){
			if(stepNum == 1){
				var tel = $("#phoneMail").val();
				var code = $("#checkCode").val();
				
				var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if (!(myreg.test(tel) || email.test(tel))) {
					$('.tiptext').text("手机号或邮箱格式不正确！");
					return;
				}
				
				if(null == code || code == ""|| code == "验证码" || code == undefined){
					$('.tiptext').text("请输入验证码");
					return;
				}
				
				//校验验证码
				$.ajax({
				    type: "POST",
				    url: "${ctx}/retrieve/checkTheCode",
				    data: {
				    	username:tel,
				    	checkCode:code
				    },
				    dataType: 'text',
				    success: function (data) {
				    	if(data == 'ok'){
				    		$('.tiptext').text("");
				    		stepNum = 2;
				    		step.nextStep();
				    	}else{
				    		$('.tiptext').text(data);
				    	}
				        return;
				    }
				});
				
			}else if(stepNum == 2){
				var isMail = 0;
				var tel = $("#phoneMail").val();
				var newPwd = $("#newPwd").val();
				var reNewPwd = $("#reNewPwd").val();
				if(newPwd.length < 6){
					$('.tiptext').text("密码长度必须大于6位数");
					return;
				}
				if(newPwd != reNewPwd){
					$('.tiptext').text("两次输入的密码不一致");
					return;
				}
				var email = /^\w+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}$/i;
				if(email.test(tel)){
					isMail=1;
				}
				
				//保存新密码
				$.ajax({
				    type: "POST",
				    url: "${ctx}/retrieve/saveNewPwd",
				    data: {
				    	username:tel,
				    	newPwd:newPwd,
				    	isMail:isMail
				    },
				    dataType: 'text',
				    success: function (data) {
				    	if(data == 'ok'){
				    		$('.tiptext').text("");
				    		stepNum = 3;
				    		step.nextStep();
				    		$(".present").hide();
				    	}else{
				    		$('.tiptext').text(data);
				    	}
				        return;
				    }
				});
			}
		}
		
		
	});
</script>
</html>