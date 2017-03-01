<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<title>优蚁环保—危废服务，优质，快捷，高效的危废服务</title>
<meta name="keywords"
	content="优蚁环保,危废，危废处理，危废服务" />
<meta name="description"
	content="优蚁环保提供优质和专业的危废服务，线上危废一站式办理，操作简易，高效快捷，资深专家量身打造危废处置方案">
<style type="text/css">
/*banner轮播  start*/
.lunbo {
	height: 400px;
	width: 100%;
	position: relative;
	overflow: hidden;
}

.lunbo .imagelist {
	list-style: none;
	width: 500%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.lunbo .imagelist li {
	float: left;
	width: 20%;
	height: 100%;
}

.lunbo .buttons {
	width: 1200px;
	background-color: blue;
	margin: 0 auto;
	position: relative;
}
.lunbo .buttons .leftBut {
	width: 22px;
	height: 35px;
	position: absolute;
	left: -60px;
	top: 182px;
	background: url(/llhb/static/img/v2/index/left.png) no-repeat;
	cursor: pointer;
}

.lunbo .buttons .rightBut {
	width: 22px;
	height: 35px;
	position: absolute;
	right: -60px;
	top: 182px;
	background: url(/llhb/static/img/v2/index/right.png) no-repeat;
	cursor: pointer;
}

.chuantong .imgnav {
	list-style: none;
	position: absolute;
	bottom: 76px;
	left: 50%;
	margin-left: -45px;
	width: 346px;
	height: 20px;
}

.chuantong .imgnav li {
	float: left;
	width: 62px;
	height: 62px;
	margin-right: 10px;
	background: #f00;
	overflow: hidden;
	cursor: pointer;
}

.chuantong .imgnav li.cur {
	border: 3px solid #7ACF39;
}
/*banner轮播  end*/
</style>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/ws/ws.css" /> 
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
		src="${ctxStatic}/js/v2/slider_banner.js"></script>
<script type="text/javascript">
$(window).load(function(){
	chuantongV3(400, 5000);
});
</script>
</head>
<body>
<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<!-- 轮播区及浏览区开始 -->
<div class="lunbo chuantong">
	<ul class="imagelist">
		<li>
			<a style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/ws/ws1.jpg) center no-repeat;display:block;"
			target="_blank" href="javascript:void(0)" title=""></a>
		</li>
		<li>
			<a style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/ws/ws2.jpg) center no-repeat;display:block;"
			target="_blank" href="javascript:void(0)" title=""></a>
		</li>
		<li>
			<a style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/ws/ws3.jpg) center no-repeat;display:block;"
			target="_blank" href="javascript:void(0)" title=""></a>
		</li>
	</ul>
	<div class="buttons">
		<span class="leftBut"></span> <span class="rightBut"></span>
	</div>
</div>
<!-- 轮播区及浏览区结束 -->
<div class="handle">
		<ul class="intuitive">
			<li>
				<p><img src="${ctxStatic}/img/v2/ws/intuitive.png"></p>
				<span>未办理过危险废物转移手续？不知道准备哪些资料?不懂得如何填写内容？在这里，没有繁冗复杂的文字说明，申报所需填写内容都配有直观易懂的图文说明。</span>
			</li>
			<li>
				<p><img src="${ctxStatic}/img/v2/ws/efficient.png"></p>
				<span>办理过程名目繁多毫无头绪?还得处处电话请教？在这里，办理流程清晰，步骤科学，简单方便。即使从未接触过危废，也能快捷办理申报。</span>
			</li>
			<li style="margin-right:0;">
				<p><img src="${ctxStatic}/img/v2/ws/worry.png"></p>
				<span>被各种要求搞得晕头转向？给了钱却对办理进度无从知晓？在这里，只需四步即可独立完成复杂的办理流程，办理进度一目了然。</span>
			</li>
		</ul>
	</div>
<!-- 预约危废办理start-->
<div class="subscribe">
	<h2>
		<img src="${ctxStatic}/img/v2/ws/advance.png">
	</h2>
	<ul class="reserved">
		<h5>为什么需要提前预约危废服务?</h5>
		<li>
			<p><img src="${ctxStatic}/img/v2/ws/weifei1.png"></p>
			<span style="display:block;">为您优先预留资源,</span>
			<p>保障危废处置无后顾之忧.</p>
		</li>
		<li>
			<p><img src="${ctxStatic}/img/v2/ws/weifei2.png"></p>
			<span style="display:block;">为您优先预留资源,</span>
			<p>保障危废处置无后顾之忧.</p>
		</li>
		<li style="margin-right:0;">
			<p><img src="${ctxStatic}/img/v2/ws/weifei3.png"></p>
			<span style="display:block;">为您优先预留资源,</span>
			<p>保障危废处置无后顾之忧.</p>
		</li>
	</ul>
</div>
<!-- 预约危废办理end-->
<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
</html>


