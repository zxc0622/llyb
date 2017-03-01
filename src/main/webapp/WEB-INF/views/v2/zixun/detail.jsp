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
	<title>${info.new_title}-优蚁环保网</title>
	<meta name="keywords" content="<c:if test="${info.seo_key_words =='' || empty info.seo_key_words }">${info.new_title}</c:if><c:if test="${info.seo_key_words !='' }">${info.seo_key_words}</c:if>" />
	<meta name="description" content="<c:if test="${deal_content =='' || empty deal_content }">${info.new_title}</c:if><c:if test="${deal_content !='' }">${fn:substring(deal_content,0,150)}...</c:if>" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/detail.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="informations">
	<!--左边文字内容区域-->
		<div class="Text_details">
			<div class="treatment_project">
				<p>首页>资讯>正文</p>
				<h2>${info.new_title}</h2>
				<span style="float: left;line-height: 28px;">时间：<fmt:formatDate value="${info.time}" type="both" pattern="yyyy-MM-dd"/>  来源：${info.source}</span>
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
			<div class="Text_description">${info.new_content}</div>
		</div>
	<!--左边文字内容区域end-->
	<!--其他案例区域-->
		<div class="other_cases">
			<div class="Ad_Image">
				<a href="http://www.yyhb365.com/youyi/authority-special.html" target="_blank"><img src="${ctxStatic}/img/v2/zixun/Ad_Image.jpg" alt="中国环境保护部服务行业试点" /></a>
			</div>
			<ul class="hots">
				<h4>今日热门</h4>
				<c:forEach items="${today}" var="t">
					<div style="height:99px;width:300px;margin:0 auto;position:relative;margin-top:22px;">
		                <div style="float:left;width: 128px;height: 99px;">
		                	<a href="${ctx}/news/newsitem/${t.id}" target="_blank"><img style="max-width: 128px;max-height: 99px;" src="${t.simg}"></a>
		                </div>
		                <div style="float:left;">
							<h3 style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;padding-left:10px;font-size:16px;">${t.title}</h3>
							<p style="font-size:14px;width:154px;color:#686868;position:absolute;right:5px;top:30px;line-height:24px;">${fn:substring(t.content, 0, 16)}...<a href="${ctx}/news/newsitem/${t.id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a></p>
		                </div>
	              	</div>
				</c:forEach>
			</ul>
		</div>
	<!--其他案例区域end-->
	</div>
	<div class="handover">
		<c:if test="${not empty prevInfo }"><p>上一篇：<a href="${ctx}/news/newsitem/${prevInfo.id}" title="${prevInfo.new_title}">${fns:abbr(prevInfo.new_title,50)}</a></p></c:if>
		<c:if test="${not empty nextInfo }"><p>下一篇：<a href="${ctx}/news/newsitem/${nextInfo.id}" title="${nextInfo.new_title}">${fns:abbr(nextInfo.new_title,50)}</a></p></c:if>
	</div>
	
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>