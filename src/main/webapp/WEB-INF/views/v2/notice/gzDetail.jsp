<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<title>${info.ntTitile}</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/detail.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="informations">
	<!--左边文字内容区域-->
		<div class="Text_details">
			<div class="treatment_project">
				<p>首页>资讯>公告</p>
				<h2>${info.ntTitile}</h2>
				<span style="float: left;line-height: 28px;">时间：${info.createDate}</span>
				<div class="bdsharebuttonbox" style="float: left;margin-left: 20px;">
					<a href="#" class="bds_qzone" data-cmd="qzone"></a>
					<a href="#" class="bds_tsina" data-cmd="tsina"></a>
					<a href="#" class="bds_tqq" data-cmd="tqq"></a>
					<a href="#" class="bds_renren" data-cmd="renren"></a>
					<a href="#" class="bds_weixin" data-cmd="weixin"></a>
					<a href="#" class="bds_more" data-cmd="more"></a>
					<a class="bds_count" data-cmd="count"></a>
				</div>
			</div>
			<div class="Text_description">${info.ntContent}</div>
		</div>
	<!--左边文字内容区域end-->
	<!--其他案例区域-->
		<div class="other_cases">
			<div class="Ad_Image">
				<a href="http://www.yyhb365.com/youyi/authority-special.html" target="_blank"><img src="${ctxStatic}/img/v2/zixun/Ad_Image.jpg" alt="中国环境保护部服务行业试点" /></a>
			</div>
			<ul class="hots">
				<h4 style="padding-left: 10px;">最新公告</h4>
				<c:forEach items="${infoList}" var="i" begin="0" end="3">
					<div style="height:99px;width:300px;margin:0 auto;position:relative;margin-top:22px;">
		                <div style="float:left;">
							<a href="${ctx}/notice/noticDetail?id=${i.id}" target="_blank"><h3 style="width: 200px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;padding-left:10px;font-size:16px;">${i.ntTitile}</h3></a>
							<p style="font-size:14px;width:280px;color:#686868;position:absolute;left:10px;top:30px;line-height:24px;">${fn:substring(i.ntContent, 0, 30)}...<a href="${ctx}/notice/noticDetail?id=${i.id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a></p>
		                </div>
	              	</div>
				</c:forEach>
			</ul>
		</div>
	<!--其他案例区域end-->
	</div>
	<div class="handover">
		<c:if test="${not empty prevInfo }"><p>上一篇：<a href="${ctx}/notice/noticDetail?id=${prevInfo.id}" title="${prevInfo.ntTitile}">${fns:abbr(prevInfo.ntTitile,50)}</a></p></c:if>
		<c:if test="${not empty nextInfo }"><p>下一篇：<a href="${ctx}/notice/noticDetail?id=${nextInfo.id}" title="${nextInfo.ntTitile}">${fns:abbr(nextInfo.ntTitile,50)}</a></p></c:if>
	</div>
	
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	
	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>