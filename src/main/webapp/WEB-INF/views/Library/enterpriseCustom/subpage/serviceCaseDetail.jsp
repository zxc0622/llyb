<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-服务案例</title>
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<link href="${ctxStatic}/css/v2/enterpriseCustom/enterpriseCustom.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/flexslider/flexslider.css" />
	<link type="text/css" rel="stylesheet"
		href="${ctxStatic}/css/v2/enterpriseCustom/serviceCaseDetail.css"/>
</head>
<body>
<!--头部模块 -->
<%@ include file="../module/head.jsp"%>
<!--导航栏模块 -->
<%@ include file="../module/navigation.jsp"%>
<body>
	<!--产品参数开始-->
	<div class="Joedar_details">
		<div id="preview" class="spec-preview">
			<span class="jqzoom"> <img jqimg="${caseInfo.pic1}"
				src="${caseInfo.pic1}" /> </span>
			<div class="spec-scroll">
				<!-- <a class="prev">&lt;</a>
				<a class="next">&gt;</a> -->
				<div class="items">
					<ul>
						<c:if test="${not empty caseInfo.pic1}">
							<li><img alt="" bimg="${caseInfo.pic1}"
								src="${caseInfo.pic1}" onmousemove="preview(this);"></li>
						</c:if>
						<c:if test="${not empty caseInfo.pic2}">
							<li><img alt="" bimg="${caseInfo.pic2}"
								src="${caseInfo.pic2}" onmousemove="preview(this);"></li>
						</c:if>
						<c:if test="${not empty caseInfo.pic3}">
							<li><img alt="" bimg="${caseInfo.pic3}"
								src="${caseInfo.pic3}" onmousemove="preview(this);"></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="Joedar_from">
			<h2>${caseInfo.case_name}</h2>
			<div class="standard">
				<p style="word-break: break-all;font-size: 16px; color: #146000; padding-top: 25px; line-height: 25px; width: 420px; margin: 0 auto;">${caseInfo.check_standard}</p>
			</div>
			<p style="font-size: 16px; margin-bottom: 14px;">
				<span>价 格：</span>${caseInfo.price}元
			</p>
			<p style="font-size: 16px; margin-bottom: 14px;">
				<span>服务类别：</span>${caseInfo.case_type}
			</p>
			<p style="font-size: 16px; margin-bottom: 14px;">
				<span>工程时长：</span>${caseInfo.time_length}
			</p>
			<p style="font-size: 16px; margin-bottom: 14px;">
				<span>所 在 地：</span>${caseProv}${caseCity}${caseArea}${caseInfo.address}
			</p>
			<div class="Joedar_anli">
				<a class="understand" caseUser="${caseInfo.user_id}"
					style="background-color: #ff8c79;">了解更多案例</a> <a
					class="collectCase" caseId="${caseInfo.id}"
					style="position: absolute; right: 0; bottom: 0;">收藏该案例</a>
			</div>
		</div>
		<div class="Joedar_company">
			<h3>企业信息</h3>
			<p style="font-size: 18px; margin: 28px 0 20px 20px;">${companyInfo.company_name}</p>
			<p style="font-size: 14px; margin-bottom: 16px; margin-left: 20px;">公司电话:${companyInfo.phone}</p>
			<p style="font-size: 14px; margin-bottom: 16px; margin-left: 20px;">公司邮箱:${companyInfo.email}</p>
			<p style="font-size: 14px; margin-bottom: 16px; margin-left: 20px;">所在地区:${companyProv}${companyCity}</p>
			<p style="font-size: 14px; margin-left: 20px;">公司地址:${companyInfo.address}</p>
		</div>
	</div>
	<div class="Company_name">${companyInfo.company_name}</div>
	<div class="description">
		<h3>案列描述</h3>
		<ul>
			<li>项目类别:${caseInfo.case_type}</li>
			<li style="word-break: break-all;">案例名称：${caseInfo.case_name}</li>
			<li>所属行业：${caseInfo.industry1_type_name}/${caseInfo.industry2_type_name}</li>
			<li>项目时间：<fmt:formatDate value="${caseInfo.start_time}"
					pattern="yyyy-MM-dd" />至<fmt:formatDate
					value="${caseInfo.end_time}" pattern="yyyy-MM-dd" /></li>
			<li>项目地址：${caseProv}${caseCity}${caseArea}${caseInfo.address}</li>
			<li>合同金额：${caseInfo.price}元</li>
		</ul>
		<p style="clear: both; font-size: 16px; padding-left: 20px; width: 900px; line-height: 25px;">处理标准：${caseInfo.check_standard}</p>
		<div style="text-indent: 2em;margin-top: 45px; font-size: 16px; padding-left: 20px;line-height: 25px;">${caseInfo.case_desc}</div>
	</div>
	<div class="details_bg">
		<div>
			<c:if test="${not empty caseInfo.pic1}">
				<img alt="" style="max-height: 1000px; max-width: 1000px;"
					bimg="${caseInfo.pic1}" src="${caseInfo.pic1}"
					onmousemove="preview(this);">
			</c:if>
		</div>
		<div>
			<c:if test="${not empty caseInfo.pic2}">
				<img alt="" style="max-height: 1000px; max-width: 1000px;"
					bimg="${caseInfo.pic2}" src="${caseInfo.pic2}"
					onmousemove="preview(this);">
			</c:if>
		</div>
		<div>
			<c:if test="${not empty caseInfo.pic3}">
				<img alt="" style="max-height: 1000px; max-width: 1000px;"
					bimg="${caseInfo.pic3}" src="${caseInfo.pic3}"
					onmousemove="preview(this);">
			</c:if>
		</div>
	</div>

<!--页面底部-->
<%@ include file="../module/bottom.jsp"%>
<script>
	var ctxStatic='${ctxStatic}';//静态文件路径
	var basePath = '${basePath}';
	var showShadeLayer =${showShadeLayer};//是否显示遮罩层（开启编辑模式）
	var companyId='${companyId}';
	var pageNumber='${pageNumber}';
	var totalPage='${totalPage}';
	var ctx="${ctx}";
	var cllFlag = '${cllFlag}';//收藏标志，1为已收藏，2为未收藏
</script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery.jqzoom.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/js/v2/enterpriseCustom/serviceCaseDetail.js"></script>
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