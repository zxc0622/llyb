<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>明星案例详情</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/css/v2/advisorCase/advisorCaseDetail.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<div class="Star_case_details">
	<!--左边文字内容区域-->
		<div class="Text_details">
			<div class="treatment_project">
				<p>首页 > 环保顾问 > 明星案例</p>
				<h2>${caseDetail.get("title") }</h2>
				<span>时间：${caseDetail.get("create_date") }  来源：${caseDetail.get("source") }</span>
			</div>
			<div class="Text_description">
				${caseDetail.get("content") }
			</div>
		</div>
	<!--左边文字内容区域end-->
	<!--其他案例区域-->
		<div class="other_case">
			<div class="Ad_Image">
				<img src="${ctxStatic }/img/v2/advisorCase/Ad_Image.jpg" alt="" />
			</div>
			<ul class="other_case_bottom">
				<h4>其他案例</h4>
				<c:forEach items="${otherCase }" var="caseInfo">
					<li id="${caseInfo.get('id') }">
						<img src="${caseInfo.get('img') }">
						<p class="lucency">${caseInfo.get('title') }</p>
					</li>
				</c:forEach>
			</ul>
		</div>
	<!--其他案例区域end-->
	</div>
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<script type="text/javascript">
		$(function(){
			$(".other_case_bottom").on("click","li",function(){
				var id = $(this).attr("id");
				window.open("${ctx}/advisorCase/intoCaseDetail?id="+id);
			});
		})
</script>
</body>
</html>