<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!--[if IE 8 ]>
    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
    <title>优蚁环保-注册,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">

<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="${ctxStatic}/css/llhb/peculiar.css" />
<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/validation.js"></script>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript">
var layer;
layui.use(['layer'],function(){layer = layui.layer;});
</script>
<!–[if IE]>
<script src="${ctxStatic}/js/html5.js"></script>
<![endif]–>
<style type="text/css">
.dis_none {
	display: none;
}

/*header添加  重复*/
/*  header{border-bottom: 1px solid #5EC520;min-width: 1000px;}
         .header_middle{margin-bottom: 15px;}
         .header_middle h1{position: relative;}
         .header_middle h1 .welcome{color:#ee7800;border-left: 1px solid #cccccc;padding-left: 10px;position: absolute;top:66px;left:351px;display: block;width:100px;font-weight: 400;height:30px;line-height: 30px;}
         .main input[type=text]:focus,.main input[type=password]:focus{border:1px solid #ee7800;} */

/*main开始*/
.mainwrapper {
	width: 100%;
	background-color: #F7F8F8;
	min-width: 1000px;
}

.main {
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
}

/*左侧图片*/
.main .mainleft_img {
	width: 400px;
	height: 300px;
	float: left;
	margin-top: 100px;
}

.main .mainleft_img img {
	width: 100%;
	height: 100%;
}

/*注册*/
.main .register {
	width: 300px;
	border: solid 1px #CCCCCC;
	background: #FFFFFF;
	padding: 20px 20px;
	float: left;
	margin: 00px 0 00px 130px;
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
	/*width: 50%;*/
	width: 100%;
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
	width: 100%;
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	background: #5EC520;
	margin-top: 10px;
	cursor: pointer;
}

/*右侧扫码*/
.main .right_wenxincode {
	float: left;
	margin-left: 380px;
	position: relative;
	width: 120px;
	position: fixed;
	top: 423px;
	left: 50%;
}

/*重复*/
.right_wenxincode .rw_img {
	width: 65px;
	height: 80px;
	position: absolute;
	top: 0;
	left: 20px;
}

.right_wenxincode .rw_img img {
	width: 100%;
	height: 100%;
}

.right_wenxincode .rw_mainbox {
	width: 120px;
	height: 140px;
	border: 1px solid #cccccc;
	position: relative;
	float: left;
	margin-top: 70px;
	z-index: 5;
	background-color: #fff;
	cursor: pointer;
}

.rw_mainbox a {
	position: absolute;
	right: 5px;
	top: 0;
	color: #666666;
}

.rw_mainbox .re_mainbox_img {
	width: 80px;
	height: 80px;
	margin: 20px auto 0;
}

.rw_mainbox .re_mainbox_img img {
	height: 100%;
	height: 100%;
}

.rw_mainbox p {
	text-align: center;
	line-height: 15px;
	color: #666666;
}

/*main结束*/
.layui-layer-setwin {
	top: 10px;
}

.layui-layer-ico {
	background: url(${ctxStatic}/js/layer/skin/default/icon_white.png)
		no-repeat;
}
</style>
</head>
<body>
	<!--头部 start-->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!--头部 end-->

	<!-- main开始 -->
	<div class="mainwrapper">
		<div class="main">
			<div class="mainleft_img">
				<img src="${ctxStatic}/img/llhb/left_big.png" alt="">
			</div>
			<div class="register">
				<div class="r_title">
					<p class="r_t_sel" style="font-size: 18px;">新用户注册</p>
				</div>
				<div class="r_members">
					<input type="text" placeholder="手机号/邮箱" class="text_ipt"
						id="username" />
					<p class="r_tip">
						<img src="${ctxStatic}/img/llhb/wrong.png" class="usernameErr"
							style="display: none; float: left;" /> <span
							class="font_1 usernameErr" id="usernameErr"
							style="display: none; float: left;"></span>
					</p>
				</div>
				<div class="r_pwd">
					<input type="password" placeholder="密码" class="text_ipt"
						id="password" />
					<p class="r_tip">
						<img src="${ctxStatic}/img/llhb/wrong.png" class="passwordErr"
							style="display: none; float: left;" /> <span
							class="font_1 passwordErr" id="passwordErr"
							style="display: none; float: left;">密码长度应不小于六位</span>
					</p>
				</div>
				<div class="r_regnow" onclick="regClick();">
					<p>同意协议并注册</p>
				</div>
				<div class="r_agree">
					<input type="checkbox" checked="checked" id="checked" /> <label
						class="font_1">我已经阅读并接受<a
						href="${ctx }/platform/platformInit?numm=2">《优蚁用户服务协议》</a></label>
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
	<!-- main结束 -->

	<!-- 底部开始 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- 底部结束 -->

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

	<!-- 错误弹出层结束 -->
	<!-- 弹出层 -->
	<div class="popumask"></div>
	<div id="divHtml" style="display: none;">
		<div
			style="float: left; width: 30%; height: 80%; border: 0px solid red; margin-top: 20px;">
			<div class="icon icon-iphone"
				style="background-color: darkorange; width: 60px; height: 60px; border-radius: 30px; border: 0px solid blue; margin-left: 40px; margin-top: 5px;">
				<div class="icon-iphone-rectangle-1"></div>
				<div class="icon-iphone-rectangle-2"></div>
				<div class="icon-iphone-rectangle-3"></div>
				<div class="icon-iphone-line"></div>
				<span class="name"></span>
			</div>
		</div>
		<div
			style="float: left; width: 68%; height: 50%; border: 0px solid blue; margin-top: 20px;">
			<p
				style="height: 22px; line-height: 22px; font-size: 20px; color: #AB844E;">马上验证手机,完成注册!</p>
			<p style="line-height: 30px; font-size: 12px;">
				短信验证码已发送至&nbsp;<span style="color: #AB844E;" class="hidePhone"></span>
			</p>
			<input type="text"
				style="width: 150px; height: 20px; border-radius: 5px; border: 1px solid #E4E4E4; padding: 5px 5px 5px 5px;" />
			<a href="javascript:void(0);"
				style="width: 80px; background-color: #4F9028; color: white; padding: 7px 20px 7px 20px; border-radius: 5px; margin-left: 10px;"
				onclick="verifyCode(this);">验证</a>
			<p style="font-size: 12px; margin-top: 5px;" class="timeP">
				(<span style="color: darkorange" class="timeSpan"></span>)秒后重新发送
			</p>
			<a href="javascript:void(0);"
				style="font-size: 12px; color: #0000FF; display: none; margin-top: 5px; margin-left: 5px;"
				class="timeA" onclick="reGetDynamicCode();">重新发送</a>
		</div>
	</div>
	<div id="emailHtml" style="display: none;">
		<div
			style="float: left; width: 30%; height: 80%; border: 0px solid red; margin-top: 20px;">
			<div class="icon icon-iphone"
				style="background-color: darkorange; width: 60px; height: 60px; border-radius: 30px; border: 0px solid blue; margin-left: 40px; margin-top: 5px;">
				<div class="icon-iphone-rectangle-1"></div>
				<div class="icon-iphone-rectangle-2"></div>
				<div class="icon-iphone-rectangle-3"></div>
				<div class="icon-iphone-line"></div>
				<span class="name"></span>
			</div>
		</div>
		<div
			style="float: left; width: 68%; height: 50%; border: 0px solid blue; margin-top: 20px;">
			<p
				style="height: 22px; line-height: 22px; font-size: 20px; color: #AB844E;">马上激活账户,完成注册!</p>
			<p style="line-height: 30px; font-size: 12px;">
				激活邮件已发送至&nbsp;<span style="color: #AB844E;" class="hideEmail" id="DynamicEmailNum">yy*****@126.com</span>
			</p>
			<a href="javascript:void(0);"
				style="display: block; background-color: #4F9028; color: white; padding: 10px 50px 10px 50px; border-radius: 5px; margin-left: 10px; margin-top: 5px; width: 31%;"
				onclick="comeEmailCheck()">进入邮箱查看</a>
			<p style="font-size: 12px; margin-top: 20px;">没有收到邮件?</p>
			<ul style="font-size: 12px; list-style: disc; margin-left: 20px;">
				<li>可能被误认为垃圾邮件,请在垃圾邮件目录下找找</li>
				<li class="timeA">没有收到的话,您还可以(<span style="color: darkorange;"class="timeSpan">23</span>)秒后重新发送 激活邮件
				</li>
				<li class="timeB" style="display:none;">没有收到的话,您还可以<a href="#"
				    style="font-size: 12px; color: #0000FF; margin-top: 5px; margin-left: 5px;"
					 onclick="reGetDynamicEmail();">重新发送</a> 激活邮件
				</li>
			</ul>

		</div>
	</div>
	<!-- 弹出层结束 -->


	<!-- js -->
	<script type="text/javascript">
		var layer;
		layui.use(['layer'],function(){layer = layui.layer;});
		var smsSeconds = 30;
		function regClick() {
			var username = $("#username").val();
			var password = $("#password").val();
			//校验用户名
			if (!verifyUsername(username)) {
				return;
			}
			//校验密码
			if (!verifyPassword(password)) {
				return;
			}
			//校验该手机号/邮箱是否注册过,若已注册,提示用户
			if ("phone" == isPhoneOrEmail()) {
				$.ajax({
					type : "POST",
					url : "${ctx}/reg/checkTelAndSendCode",
					data : "tel=" + username,
					dataType : 'text',
					success : function(data) {
						if (data == "ok") {
							getDynamicCode(username);
						} else {
							mess(data);
						}
					}
				});
			}else if ("email" == isPhoneOrEmail()) {
				$.ajax({
					type : "POST",
					url : "${ctx}/reg/checkEmailAndSendCode",
					data : "email="+username+"&password="+password,
					dataType : 'text',     
					success : function(data) {
						if (data == "ok") {
					        var emailHtml = $("#emailHtml").html();
							layer.open({
								type : 1, //page层
								area : [ '430px', '280px' ],
								title : [ '邮箱注册','height:30px;line-height:30px;background-color:#4F9028;color:white;' ],
								closeBtn : [ 1 ],
								shade : 0.6, //遮罩透明度
								moveType : 1, //拖拽风格，0是默认，1是传统拖动
								shift : -1, //0-6的动画形式，-1不开启
								content : emailHtml
							});
							getDynamicEmailCode();
						} else{
							mess(data);
						}
					}
				});
			}
		}

		//校验用户名是否为手机号
		function verifyUsername(phone) {
			var regPhoneExp = /^1[3|4|5|7|8][0-9]\d{8}$/;
			var regEmailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (regPhoneExp.test(phone) || regEmailExp.test(phone)) {
				return true;
			} else {
				mess("请输入正确的手机号码或邮箱");
				return false;
			}
		}
		//校验用户输入的为手机号还是邮箱
		function isPhoneOrEmail() {
			var userName = $("#username").val();
			var regPhoneExp = /^1[3|4|5|7|8][0-9]\d{8}$/;
			var regEmailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (regPhoneExp.test(userName)) {
				return "phone";
			} else if (regEmailExp.test(userName)) {
				return "email";
			}
		}

		//校验密码
		function verifyPassword(password) {
			var regExp = /^.{6,16}$/;
			if (regExp.test(password)) {
				return true;
			} else {
				mess("密码不能少于6位");
				return false;
			}
		}

		//发送短信验证码
		function getDynamicCode() {
			var phone = $("#username").val();
			popSmsCode();
			$.ajax({
				type : "POST",
				url : "${ctx}/conn",
				data : "tel=" + phone,
				dataType : 'text',
				success : function(data) {
					if (data == "ok") {

					} else {
						layer.alert(data);
					}
				}
			});
		}
		var step = smsSeconds;
		//弹出短信验证码校验框
		function popSmsCode() {
			var phone = $("#username").val();
			if (step != smsSeconds) {
				return;
			}
			$(".hidePhone").html(phone.substr(0, 3) + "******" + phone.substr(9, 11));
			$(".timeSpan").html(step);
			step--;
			var timer = setInterval(function() {
				$(".timeSpan").html(step);
				step--;
				if (step < 0) {
					$(".timeP").css("display", "none");
					$(".timeA").css("display", "block");
					clearInterval(timer);
					step = smsSeconds;
				}
			}, 1000);

			var divHtml = $("#divHtml").html();
			layer.open({
						type : 1, //page层
						area : [ '400px', '210px' ],
						title : [ '手机验证',
								'height:30px;line-height:30px;background-color:#4F9028;color:white;' ],
						closeBtn : [ 1 ],
						shade : 0.6, //遮罩透明度
						moveType : 1, //拖拽风格，0是默认，1是传统拖动
						shift : -1, //0-6的动画形式，-1不开启
						content : divHtml
					});
		}
		//邮箱中文字的替换
		function getDynamicEmailCode(){
			var step = smsSeconds;
            var email = $("#username").val();	
            $(".timeA").css("display", "");
         	$(".timeB").css("display", "none");
            $(".hideEmail").html(email.substr(0,2)+"*****"+email.substr(email.indexOf('@')));
            $(".timeSpan").html(step);
			step--;
			var timer = setInterval(function() {
				$(".timeSpan").html(step);
				step--;
				if (step < 0) {
					$(".timeA").css("display", "none");
		         	$(".timeB").css("display", "");
					clearInterval(timer);
					step = smsSeconds;
				}
			}, 1000);
		}
		//再次发送邮件发送邮件
		function reGetDynamicEmail(){
			var username = $("#username").val();
			var password = $("#password").val();
			$.ajax({
				type : "POST",
				url : "${ctx}/reg/checkEmailAndSendCode",
				data : "email="+username+"&password="+password,
				dataType : 'text',     
				success : function(data) {
					if (data == "ok") {
				         layer.alert("再次发送邮件成功，请进入您的邮箱查看");
					} else{
						mess(data);
					}
				}
			});

		}
		
		// 重新发送短信校验码
		function reGetDynamicCode() {
			var phone = $("#username").val();
			if (step != smsSeconds) {
				return;
			}
			var phone = $("#username").val();
			$(".timeP").css("display", "block");
			$(".timeA").css("display", "none");
			$(".timeSpan").html(step);
			step--;
			var timer = setInterval(function() {
				$(".timeSpan").html(step);
				step--;
				if (step < 0) {
					$(".timeP").css("display", "none");
					$(".timeA").css("display", "block");
					clearInterval(timer);
					step = smsSeconds;
				}
			}, 1000);
			$.ajax({
				type : "POST",
				url : "${ctx}/conn",
				data : "tel=" + phone,
				dataType : 'text',
				success : function(data) {
					if (data == "ok") {

					} else {
						layer.alert(data);
					}
				}
			});
		}
		//验证验证码是否正确
		function verifyCode(mThis) {
			var username = $("#username").val();
			var password = $("#password").val();
			var checkCode = $(mThis).prev().val();
			//       alert(checkCode);
			if (!/^[0-9]{4}$/.test(checkCode)) {
				layer.alert("请输入正确的验证码");
				return;
			}
			$.ajax({
				type : "POST",
				url : "${ctx}/reg/saveRegister",
				data : "checkCode=" + checkCode + "&username=" + username
						+ "&password=" + password + "&telephone=" + username,
				dataType : 'text',
				success : function(data) {
					if (data != 'ok') {
						layer.alert(data);
					} else {
						layer.alert("注册成功");
						setTimeout(function() {
							window.location.href = '${ctx}/home';
						}, 3000);
					}
				}
			})
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
		$(function() {
			//mainwarpper 高度
			$(".mainwrapper").css(
					{"min-height" : ($(window).height()
								- $("header").height() - $("footer").height())
								+ "px"});
			// 内容高度居中
			$(".register").css(
					{"margin-top" : ($(".mainwrapper").height() - $(
								".register").height())
								/ 2 - 20 + "px"});
			$(".mainleft_img").css(
					{"margin-top" : ($(".mainwrapper").height() - $(
								".mainleft_img").height())
								/ 2 + "px"});
			$(".loginbox").css(
					{"margin-top" : ($(".mainwrapper").height() - $(
								".loginbox").outerHeight())
								/ 2 + "px"});
			populayer_fn();
			//右侧微信扫码 关闭
			$(".rw_mainbox").click(function() {
				$(".right_wenxincode").hide();
			});

		});
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

		function mess(str) {
			var ss = "<p>" + str + "</P>";
			$(".populayers #contentText").empty().append(ss);
			$(".populayers").show();
			$(".popumasks").show();
			setTimeout(function() {
				$(".popumasks").fadeOut();
				$(".populayers #contentText").html("");
				$(".populayers").hide();
			}, 3000);
		}
		//跳转邮箱的官网.
		function comeEmailCheck() {
			var emailName = $("#username").val();
			emailName = emailName.substr(emailName.indexOf('@')+1);
			if(emailName=="163.com"){
				window.open("http://mail.163.com/");
			}else if(emailName=="qq.com"){
				window.open("http://mail.qq.com/");
			}else if(emailName=="sina.com"||emailName=="vip.sina.com"){
				window.open("http://mail.sina.com");
			}else if(emailName=="126.com"){
				window.open("http://mail.126.com");
			}else if(emailName=="sohu.com"){
				window.open("http://mail.sohu.com");
			}else if(emailName=="139.com"){
				window.open("http://mail.139.com");
			}else if(emailName=="hotmail.com"){
				window.open("http://mail.hotmail.com");
			}else if(emailName=="gmail.com"){
				window.open("http://mail.gmail.com");
			}else if(emailName=="wo.com.cn"){
				window.open("http://mail.wo.com.cn");
			}else if(emailName=="189.cn"){
				window.open("http://mail.189.cn");
			}else if(emailName=="21cn.com"){
				window.open("http://mail.21cn.com");
			}else{
				layer.alert("你注册的邮箱不是常用邮箱,请更换一个邮箱");
			}
		}
	</script>
</body>
</html>