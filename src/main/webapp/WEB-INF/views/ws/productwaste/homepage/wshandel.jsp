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
	<c:set var="pagename" value="wshandel"></c:set>
	<%@ include file="/WEB-INF/views/include/header_ws.jsp"%>
	<!--头部 end-->
	<!--中间部分start-->
	<div class="wrapper">
		<div class="main">
			<div class="wf-wfbl-main-total">
				<div class="wf-wfbl-main">

					<div class="wf-wfbl-m-div">
						<img src="${ctxStatic}/img/llhb/weifei_wfbl_04_03.png" alt="">
						<div class="wf-wfbl-m-div-r">
							未办理过危险废物转移手续？不知道准备哪些资料?不懂得如何填写内容？在这里，没有繁冗复杂的文字说明，申报所需填写内容都配有直观易懂的图文说明。
						</div>
					</div>
				</div>
				<div class="wf-wfbl-main">

					<div class="wf-wfbl-m-div">
						<img style="margin-left:42px;" src="${ctxStatic}/img/llhb/weifei_wfbl_05_03.png" alt="">
						<div class="wf-wfbl-m-div-r">
							办理过程名目繁多毫无头绪?还得处处电话请教？在这里，办理流程清晰，步骤科学，简单方便。即使从未接触过危废，也能快捷办理申报。</div>
					</div>
				</div>
				<div class="wf-wfbl-main">

					<div class="wf-wfbl-m-div">
						<img style="margin-left:56px;" src="${ctxStatic}/img/llhb/weifei_wfbl_06_03.png" alt="">
						<div class="wf-wfbl-m-div-r">
							被各种要求搞得晕头转向？给了钱却对办理进度无从知晓？在这里，只需四步即可独立完成复杂的办理流程，办理进度一目了然。</div>
					</div>
				</div>

			</div>


		</div>
	</div>
	<!--中间部分end-->

	<!--底部 start-->
	<%@ include file="/WEB-INF/views/include/footer_ws.jsp"%>

</body>
</html>


