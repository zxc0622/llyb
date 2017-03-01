<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门管理</title>
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
            	<span>基础设置</span>
            	<span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/organization">机构管理</a>
                <span style="margin-left:2px;">></span>
                <span>部门管理</span>
            </div>
            
            <tags:message content="${message}"/>
            <form id="searchForm"  action="" method="post">
				
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">部门列表：</div>
                <div class="fr">
                    <input type="button" onclick="location.href='${ctx}/sys/department/form?organizationid=${organizationid}'" class="me_button_two" id="me_four_pop_click" value="+&nbsp;新增部门">                  
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table id="treeTable" width="100%" >
                       <tr>
                       <th>部门名称</th>
                       <th>负责人</th>
                       <th>电话</th>
                       <th>传真</th>
                       <th>邮政编码</th>
                       <th>邮箱</th>
                       <th>地址</th>
                       <th>操作</th>
                       </tr>                       
                        <c:if test="${list.size() == 0}">
							<tr>
								<td colspan="8" align="center">暂无部门信息</td>
							</tr>
						</c:if>
					<c:if test="${list.size() > 0}">   
                       <c:forEach items="${list}" var="department">
						<tr id="${department.id}" pId="${department.parent.id ne 1?department.parent.id:'0'}">
							<td>${department.name}</td>
							<td>${department.principal}</td>
							<td>${department.mobile}</td>
							<td>${department.fax}</td>
							<td>${department.postCode}</td>
							<td>${department.email}</td>
							<td>${department.address}</td>
							<td class="color_00bfb0">
							 	<a title="修改" class="mr20 cp" href="${ctx}/sys/department/form?id=${department.id}&organizationid=${organizationid}">修改</a>
								<a title="删除" class="mr20 cp" href="${ctx}/sys/department/delete?id=${department.id}&organizationid=${organizationid}" onclick="return confirmx('要删除该部门吗？', this.href)">删除</a>
								<a title="新增下级部门" class="mr20 cp" href="${ctx}/sys/department/form?department.parentId=${department.id}&organizationid=${organizationid}">新增下级部门</a>
								<a title="部门详情" class="cp" href="${ctx}/sys/department/details?id=${department.id}&organizationid=${organizationid}">部门详情</a>
							</td>
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
