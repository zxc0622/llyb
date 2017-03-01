<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>数据收集-固废供应列表</title>
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/xinxiguanli_v2.css" />
<style>
.solidChilds {
	display: none;
	float: left;
}

.childshow {
	display: block;
}

table img {
	width: 80%;
	height: 80%;
	max-height: 60px;
}

.tab_main_result table tr th {
	padding: 0;
}

.tab_main_result table tr td:nth-child(7) a h6 {
	width: 34px;
}
</style>
</head>
<body>
	<div class="main_right">
		<div class="cur_position">当前位置>积分兑换>积分发放记录</div>
		<div class="tab_main">
			<div class="tab_title">
				<span class="cur_tab">积分发放记录</span>
			</div>
			<form id="form">
				<!--行业分类筛选-->
				<div class="tab_main_row">
					查询： <input type="text" style="width: 180px" placeholder="请输入用户名"
						value="${userName }" /> <input type="text" style="width: 180px"
						placeholder="请输入电话号码" value="${tel }" /> <input type="button"
						value="查询"
						style="background-color: #5cb531; border: 1px solid #5cb531; color: white;" />
					<input type="button" value="重置" />

				</div>


				<!--筛选结果-->
				<div class="tab_main_result">
					<table>
						<tr>
							<th style="width: 40px">编号</th>
							<th style="width: 120px">用户名</th>
							<th style="width: 140px">手机号</th>
							<th style="width: 80px">姓名</th>
							<th style="width: 100px">总积分</th>
							<th style="width: 120px">积分获取记录</th>
						</tr>
						<c:forEach items="${recordList }" var="record" varStatus="sta">
							<tr>
								<td>${sta.count}</td>
								<td>${record.login_name }</td>
								<td>${record.phone}</td>
								<td>${record.name }</td>
								<td>${record.point_num }</td>
								<td><a href="detile?userId=${record.id}"
									style="color: red; cursor: default;">详情</a></td>

							</tr>

						</c:forEach>
					</table>
				</div>

				<!--翻页-->
				<div class="filp_box">
					<div class="del_all"></div>
					<div class="filp">
						<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
						<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
						<c:set var="currentPage" value="${recordPage.pageNumber}" />
						<c:set var="totalPage" value="${recordPage.totalPage}" />
						<c:set var="actionUrl" value="${ctx}/integrationIssue/selectUser/" />
						<c:set var="urlParas" value="?userName=${userName }&tel=${tel }" />
						<c:set var="pageSizeParaName" value="pageSize" />
						<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
	<script>
		$(function() {
			$(".tab_main_row :button:eq(0)").click(search);
			$(".tab_main_row :button:eq(1)").click(reset);

			/* $("#fenye").next().click(function(){
			    var t =  $(".tab_main_row :text").val();
			    var  paginateFenye =$("#fenye").val();
			    window.location.href="${ctx}/dataCollection/loginLog?paginateFenye="+paginateFenye+"&uname="+t;
			}); */
		});
		$(document).ready(function() {
			//回车事件
			$('#uname').bind('keypress', function(event) {
				if (event.keyCode == "13") {
					search();
				}
			});
			//仅输入数字
			$(".filp :text:last").keyup(function() {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			}).bind("paste", function() { //CTR+V事件处理      
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			}).css("ime-mode", "disabled"); //CSS设置输入法不可用
		});
		//搜索
		function search() {
			//  	var a = $(".tab_main_row select:eq(0)").val();
			var u = $(".tab_main_row :text:eq(0)").val();
			var t = $(".tab_main_row  :text:eq(1)").val();
			window.location.href = "${ctx}/integrationIssue/selectUser/?userName="
					+ u + "&tel=" + t;
		}
		//重置
		function reset() {
			$(".tab_main_row :text").val('');
			//   var t = $(".tab_main_row  :text").val(); 
		}
	</script>
</body>
</html>