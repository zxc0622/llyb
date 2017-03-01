<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>优蚁环保-环保报价,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
<link rel="shortcut icon"
	href="/llhb/static/img/llhb/bitbug_favicon.ico" />
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description"
	content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/css/v2/enterpriseLibrary/enterprise.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/layui/css/layui.css" />
<style>
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
.offer{width:1200px;margin:0 auto;margin-top: 30px;margin-bottom: 50px;}
.offer h2{height:32px;border-bottom:1px solid #7fc77f;font-size:20px;color:#008f00;}
.offer .The_list{clear:both;/* padding-left:10px; */width:1200px;height:40px;padding-left:10px\9;border-bottom:1px solid #7fc77f;}
.offer .The_list li{float:left;width:175px;font-weight:bold;font-size:14px;line-height:38px;color: #008f00;}
.offer table{margin-bottom:40px;}
.offer tr:hover{background-color:#fafafa;color:#69b83a;}
.offer th{text-align:left;font-size:14px;padding:0 0 20px 10px;width:21%;font-weight:bold;cursor:pointer;}
.offer td{height:38px;font-size:14px;min-width:83px;border-bottom:1px dashed #e6e6e6;padding-left:10px;cursor:pointer;padding: 10px 80px 10px 10px;}

.user_name{width:1200px;height:360px;}
.user_name li{width:1200px;height:58px;border-bottom:1px dashed #e6e6e6;}
.user_name li span{width:165px;height:58px;display:block;margin-left:10px;line-height:58px;float:left;overflow: hidden;text-overflow: ellipsis; white-space: nowrap;font-size:14px;}
.user_name li .situation{width:490px;}
</style>
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="lunbo chuantong">
		<ul class="imagelist">
			<li><a
				style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/quote/quote.jpg) center no-repeat;display:block;"
				 href="javascript:void(0)"></a>
			</li>
		</ul>
		<div class="buttons">
			<span class="leftBut"></span> <span class="rightBut"></span>
		</div>
	</div>

	<!-- 环保报价开始 -->
	<div class="offer">
		<h2>最新申请环保服务</h2>
		<ul class="The_list">
			<li style="padding-left: 10px;">用户名</li>
			<li>服务类型</li>
			<li>项目地点</li>
			<li>申请时间</li>
			<li style="width: 400px; text-align: center;">项目情况</li>
		</ul>
	<div class="user_name textScroll">    
     <ul>
		<c:forEach items="${crs}" var="s">
            <li>
             <span>${s.name }</span>
            <c:if test="${s.num eq 1 }">
             <span>环评报价</span>
            </c:if>
             <c:if test="${s.num eq 2 }">
             <span>监测报价</span>
            </c:if>
            <span>${s.aaname }</span>
            <span>${fn:substring(s.date, 0, 10)}</span>
            <span class="situation">公司名为${s.comp_name },项目名称为${s.pro_name },该项目位于${s.aname }${s.aaname },类别为${s.hname }</span>
          	</li>
         </c:forEach>
     </ul>
     </div>
	</div>
	<!-- 环保报价结束 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<script type="text/javascript"
		src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/layui/layui.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/js/llhb/layeruiPagingExt.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/v2/slider_banner.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/v2/textScroll.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".textScroll").topScroll(5);
		});
	</script>
</body>
</html>