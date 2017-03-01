<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="" />
<title>产废方-基本资料-审核中</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_div {
	padding: 20px;
	border: 1px solid #ccc;
	width: 680px;
	margin: 60px auto 20px;
}

.this_page_div .tip-row-div {
	margin: 0;
}
</style>
</head>
<body>
	<div class="main_right">
		<div class="cur_position">
			当前位置>信息管理>危废服务 <a class="gobackto_wffw"
				href="${ctx}/ws/productwaste/pwbaseinfo/serviceMainIndexPage"
				target="_self">返回危废服务页面</a>
		</div>
		<div class="tab_main">
			<div class="weifei_title">
				<ul>
					<li class="wf_t_sel">
						<div class="txt">基本列表</div>
						<div class="triangle"></div>
					</li>
					<li>
						<div class="txt">查阅合同</div>
						<div class="triangle"></div>
					</li>
<!-- 					<li> -->
<!-- 						<div class="txt">管理计划表</div> -->
<!-- 						<div class="triangle"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="txt">邮寄资料</div> -->
<!-- 						<div class="triangle"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="txt">支付并备案</div> -->
<!-- 						<div class="triangle"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="txt">审批办理中</div> -->
<!-- 						<div class="triangle"></div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="txt">通知收运</div> -->
<!-- 						<div class="triangle"></div> -->
<!-- 					</li> -->
				</ul>
			</div>
			<div class="cff_jibenziliao_steps">
				<ul>
					<li class="c_j_steps_li_1">未填写</li>
					<li class="c_j_steps_li_2">审核中</li>
					<li class="c_j_steps_li_3">已审核通过</li>
				</ul>
				<div class="per-step per-step-hasdone">
					<div class="steps_circle"></div>
				</div>
				<div class="per-step per-step-hasdone">
					<div class="steps_circle">
						<div class="steps_line"></div>
					</div>
				</div>
				<div class="per-step">
					<div class="steps_circle">
						<div class="steps_line"></div>
					</div>
				</div>
			</div>
			<div class="this_page_div">
				<div class="tip-row-div">2、资料审核中，请等待...</div>

			</div>


		</div>
	</div>

	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

	<script>
		
	</script>
</body>
</html>
