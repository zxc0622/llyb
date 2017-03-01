<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库</title>
	<meta name="keywords" content="${seo.key_words}">
	<c:choose>
		<c:when test="${empty seo.seo_setting}">
			<meta name="description" content="${seo.company_name}">
		</c:when>
		<c:otherwise>
			<meta name="description" content="${seo.seo_setting}">
		</c:otherwise>
	</c:choose>
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<link href="${ctxStatic}/css/v2/enterpriseCustom/enterpriseCustom.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/flexslider/flexslider.css" />
</head>
<body>
	<div id="TB_overlayBG" class="ss"></div>
	<!--头部模块 -->
	<%@ include file="module/head.jsp"%>
	<!--导航栏模块 -->
	<%@ include file="module/navigation.jsp"%>
	
	<div class="loadSubpage">
	<c:set var="isExist" value="0"></c:set>
	<c:forEach items="${moduleTypes}" var="moduleType">
		<c:choose>
			<c:when test="${moduleType == 1}">
			</c:when>
			<c:when test="${moduleType == 2}">
			</c:when>
			<c:when test="${moduleType == 3}">
				<!--banner图模块 -->
				<%@ include file="module/banner.jsp"%>
			</c:when>
			<c:when test="${moduleType == 4}">
				<!--公司简介模块 -->
				<%@ include file="module/summary.jsp"%>
			</c:when>
			<c:when test="${moduleType == 5}">
				<!--公司历程发展模块-->
				<%@ include file="module/course.jsp"%>
			</c:when>
			<c:when test="${moduleType == 6}">
				<!--服务类型模块-->
				<%@ include file="module/serviceType.jsp"%>
			</c:when>
			<c:when test="${moduleType == 7}">
				<!--服务案例模块-->
				<%@ include file="module/serviceCase.jsp"%>
			</c:when>
			<c:when test="${fn:contains('8,9,10', moduleType)}">
				<c:if test="${isExist==0}">
					<c:set var="isExist" value="1"></c:set>
					<div id="sortable"></div>
				</c:if>
				<c:choose>
					<c:when test="${moduleType == 8}">
						<!--产品展示模块-->
						<%@ include file="module/showProd.jsp"%>
					</c:when>
					<c:when test="${moduleType == 9}">
						<!--企业资质-->
						<%@ include file="module/certificates.jsp"%>
					</c:when>
					<c:when test="${moduleType == 10}">
						<!--企业相册-->
						<%@ include file="module/photos.jsp"%>
					</c:when>
				</c:choose>
			</c:when>
			<c:when test="${moduleType == 11}">
				<!--售后保障/服务模块-->
				<%@ include file="module/serviceProvition.jsp"%>
			</c:when>
		</c:choose>
	</c:forEach>
	</div>
	
	<!--页面底部-->
	<%@ include file="module/bottom.jsp"%>
	
	<!-- 添加模块窗口 -->
	<div class="modules" style="display: none;">
		<h2>
			添加模块<a class="close"></a>
		</h2>
		<div class="mainlist">
			<span class="notHave2Module" style="width:auto;">暂无可添加模块！</span>
			<ul class="serviceType modulesUl">
			</ul>
			<div style="width: 530px; padding: 20px 0 0 20px;">
				<div class="ensure">
					<a id="modules_sure" class="submitModules"><span>确定</span></a>
					<a id="modules_cancel" class="close"><span class="abolish">取消</span></a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		var ctxStatic='${ctxStatic}';//静态文件路径
		var basePath = '${basePath}';
		var showShadeLayer =${showShadeLayer};//是否显示遮罩层（开启编辑模式）
		var companyId='${companyId}';
	</script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-ui.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.bigcolorpicker.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
	<script type="text/javascript" src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eYf9sA6yVTFHlh9ytU4a0EYY&services=&t=20160513110936"></script>
	<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/common.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/library.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
	</body>
</html>