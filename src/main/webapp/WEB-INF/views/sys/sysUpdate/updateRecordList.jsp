<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/layui/css/layui.css" />
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<style>

.textCenter{text-align: center;}

</style>
</head>
<body>
	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col width="100">
			<col width="100">
			<col>
			<col width="200">
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>操作人员</th>
				<th>更新记录</th>
				<th>更新时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${recordList}" var="record" varStatus="sta">
				<tr>
					<td class="textCenter">${sta.index }</td>
					<td class="textCenter">${record.get("name") }</td>
					<td>${record.get("mark") }</td>
					<td class="textCenter">${record.get("update_time") }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
