<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="" />
<title>优蚁环保-危废服务</title>
<meta name="keywords"
	content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description"
	content="优蚁网是一站式网上环保服务平台，为各类企事业单位开展建设项目环境影响评价、环保工程建设与运营、环境检测、固废处置、环保产品买卖等业务提供一站式咨询服务，致力于为供求双方直接对接、减少业务中间环节、节约交易成本、迅速提高业务量。
…">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/weifeifuwu_style.css" />
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search {
	width: 440px;
	margin-top: 50px;
	margin-left: 80px;
}

.header_middle .header_search select {
	float: left;
	height: 35px;
	line-height: 35px;
	width: 92px;
	border: 1px solid #ccc;
}

.header_middle .header_search .h_s_middle {
	float: left;
}

.header_middle .header_search .h_s_middle input {
	width: 280px;
}

.header_middle .header_search .h_s_middle:before {
	content: "";
	display: block;
	width: 20px;
	height: 24px;
	background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;
	position: absolute;
	left: 5px;
	top: 7px;
}

.header_right {
	margin-top: 30px;
}
/*头部中部end*/
/*内容start*/

/*右侧悬框*/
.gf_ad_right {
	width: 108px;
	height: 305px;
	position: absolute;
	top: 298px;
	right: 50%;
	margin-right: -622px;
	z-index: 15;
}

.r_a_top {
	width: 100%;
	position: absolute;
	z-index: 17;
}

.r_a_down {
	width: 100%;
	position: absolute;
	z-index: 16;
	top: 92px;
}

.r_a_down>div:nth-of-type(1) {
	padding-top: 18px;
}

.r_a_cc {
	width: 100%;
	background-color: #5cb531;
	border-top: 1px solid #efefef;
	padding: 13px 0px;
	overflow: hidden;
}

.r_a_cc span {
	color: #FFF;
	display: block;
	float: left;
	width: 57px;
	margin-left: 13px;
}

.r_a_cc img {
	display: block;
	margin-left: 8px;
	float: left;
}

.r_a_cell {
	width: 100%;
	padding: 10px 0px;
	background-color: #efefef;
}

.r_a_cell p {
	display: block;
	text-align: center;
}

.r_a_cell>p:nth-of-type(2) {
	color: #5cb531;
	font-size: 14px;
}
</style>
</head>
<body>
	<!--头部 start-->
	<c:set var="pagename" value="wsorderhandle"></c:set>
	<%@ include file="/WEB-INF/views/include/header_ws.jsp"%>
	<!--头部 end-->
	<!--中间部分start-->
	<div class="wrapper">
		<div class="main">
			<div class="wf-yywfbl-main">
				<dl>
					<dt>
						<img src="${ctxStatic}/img/llhb/weifei_yy_04.png" alt="">
					</dt>
					<dd>
						<h5>为什么需要提前预约危废服务?</h5>
						<img src="${ctxStatic}/img/llhb/weifei_yy_01.png" alt="">
						<div>
							<p>为您优先预留资源,</p>
							<p>保障危废处置无后顾之忧.</p>
						</div>
					</dd>
					<dd>
						<img src="${ctxStatic}/img/llhb/weifei_yy_02.png" alt="">
						<div>
							<p>根据您实际需要专业量身定制,</p>
							<p>提前建议最经济的危废处置方案.</p>
						</div>
					</dd>
					<dd>
						<img src="${ctxStatic}/img/llhb/weifei_yy_03.png" alt="">
						<div>
							<p>享受预约服务专属折扣,</p>
							<p>同等服务,更低价格.</p>
						</div>
					</dd>
				</dl>
			</div>


		</div>
	</div>
	<!--中间部分end-->

	<!--底部 start-->
	<%@ include file="/WEB-INF/views/include/footer_ws.jsp"%>


</body>
</html>


