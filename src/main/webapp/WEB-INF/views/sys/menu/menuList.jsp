<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel :3});
		});
    	function updateSort() {
	    	$("#searchForm").attr("action", "${ctx}/sys/menu/updateSort");
	    	$("#searchForm").submit();
	    	loading('正在提交，请稍等...');
    	}
	</script>
	
</head>
<body>
 <div class="me_content_right">
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/menu">菜单列表</a>
            </div>
            
            <tags:message content="${message}"/>
            <form id="searchForm"  action="" method="post">
				
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">菜单列表：</div>
                <div class="fr">
                  <shiro:hasPermission name="sys:menu:edit"> 
                  	<input type="button" onclick="updateSort()" class="me_button_two mr5" id="me_four_pop_click" value="更新排序">
                    <input type="button" onclick="location.href='${ctx}/sys/menu/form'" class="me_button_two" id="me_four_pop_click" value="+&nbsp;新增菜单">                  
                  </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table id="treeTable" width="100%" >
                       <tr>
                       <th>名称</th>
                       <th>链接</th>
                       <th>排序</th>
                       <th>可见</th>
                       <th>权限标识</th>
                       <shiro:hasPermission name="sys:menu:edit">
                       <th>操作</th>
                       </shiro:hasPermission>
                       </tr>                       
                        <c:if test="${fn:length(list) == 0}">
							<tr>
								<td colspan="7" align="center">暂无菜单信息</td>
							</tr>
						</c:if>
					<c:if test="${fn:length(list) > 0}">   
                       <c:forEach items="${list}" var="menu">
						<tr id="${menu.id}" pId="${menu.parent.id ne 1?menu.parent.id:'0'}">
							<td><i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i>${menu.name}</td>
							<td>${menu.href}</td>
							<td><shiro:hasPermission name="sys:menu:edit">
										<input type="hidden" name="ids" value="${menu.id}"/>
										<input name="sorts" type="text" onkeyup= "this.value=this.value.replace(/[^\d]/g,'')" style="width:40px;height:30px;margin:0;padding:0;text-align:center;line-height:30px;border:1px solid #c9c9c9;" value="${menu.sort}"/>
								</shiro:hasPermission>
								<shiro:lacksPermission name="sys:menu:edit">
										${menu.sort}
								</shiro:lacksPermission>
							</td>
							<td>${menu.isShow eq 1?'显示':'隐藏'}</td>
							<td>${menu.permission}</td>
							<shiro:hasPermission name="sys:menu:edit">
							 <td class="color_00bfb0">
							 	<a title="修改" class="mr20 cp" href="${ctx}/sys/menu/form?id=${menu.id}">修改</a>
								<a title="删除" class="mr20 cp" href="${ctx}/sys/menu/delete?id=${menu.id}" onclick="return confirmx('要删除该菜单及所有子菜单项吗？', this.href)">删除</a>
								<a title="新增下级菜单" class="cp" href="${ctx}/sys/menu/form?menu.parentId=${menu.id}">新增下级菜单</a>
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
