<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>明星案例更多</title>
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic }/css/v2/advisorCase/moreCase.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<div class="even_more">
		<p style="padding: 20px 0 30px 0; font-size: 14px;">首页 > 明星案例</p>
		<ul class="more_list">
			<c:forEach items="${caseList }" var="caseInfo">
				<li>
					<div id="${caseInfo.get('id') }"
						style="width: 370px; height: 312px; float: left; margin-right:30px; background-color: #f6f6f6; position: relative;cursor:pointer;">
						<img src="${caseInfo.get('img')}" >
							<p class="lucency">${caseInfo.get("title") }</p>
							<p class="particulars zxx_text">${caseInfo.get("summary") }</p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div style="height:34px;width:1200px;margin:0 auto;" class="pagination"></div>
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/layeruiPagingExt.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".more_list").on("click","div",function(){
				var id = $(this).attr("id");
				window.open("${ctx}/advisorCase/intoCaseDetail?id="+id);
			});
			
			//分页
			paging($(".pagination"),${"totalPage"},${"pageNumber"},function(divElSelector, obj, first){
				if(!first){
					window.location.href="${ctx}/advisorCase/intoMoreCase?pageNumber="+obj.curr;
				}
			});
		})
</script>
</body>
</html>