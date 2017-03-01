<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel :5});
		});
	</script>
	
</head>
<body>
    <div class="me_content_right">
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/area/">区域列表</a>
            </div>
            <tags:message content="${message}"/>
            <form id="searchForm"  action="" method="post">
				
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">区域列表：</div>
                <div class="fr">
                  <shiro:hasPermission name="sys:area:edit"> 
                    <input type="button" onclick="location.href='${ctx}/sys/area/form'" class="me_button_two" id="me_four_pop_click" value="+&nbsp;新增区域">                  
                  </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table id="treeTable" width="100%" >
		            	<tr>
		            	<th>区域名称</th>
		                <th>区域编码</th>
		                <th>区域类型</th>
		                <th>备注</th>
		                <shiro:hasPermission name="sys:area:edit">
		                	<th>操作</th>
                		</shiro:hasPermission>                 
                        <c:if test="${fn:length(list) eq 0}">
							<tr>
								<td colspan="5" align="center">暂无区域信息</td>
							</tr>
						</c:if>
					<c:if test="${fn:length(list) > 0}">   
                       <c:forEach items="${list}" var="area">
						<tr id="${area.id}" pId="${area.parentId ne 1?area.parentId:'0'}">
							<td>${area.name}</td>
							<td>${area.code}</td>
							<td>${fns:getDictLabel(area.type, 'sys_area_type', '无')}</td>
                        	<td>${area.remarks}</td>
							<shiro:hasPermission name="sys:area:edit">
							 <td class="color_00bfb0">
							 	<a title="修改" class="mr20 cp" href="${ctx}/sys/area/form?id=${area.id}">修改</a>
								<a title="删除" class="mr20 cp" href="${ctx}/sys/area/delete?id=${area.id}" onclick="return confirmx('要删除该区域及所有子区域项吗？', this.href)">删除</a>
								<a title="添加下级区域" class="cp" href="${ctx}/sys/area/form?area.parentId=${area.id}">添加下级区域</a>
							</td></shiro:hasPermission>
						</tr>
					</c:forEach>
				</c:if>
          </table>
            </div>
            </form>
        </div>
    </div>
</body>
</html>
