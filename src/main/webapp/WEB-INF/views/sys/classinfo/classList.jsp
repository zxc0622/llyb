<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>班级管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
    	return false;
    }
	
	</script>
</head>
<body>
          <div class="me_content_right">
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>基础设置</span>
                <span style="margin-left:2px;">></span>
                <span>班级管理</span>
            </div>
            <form id="searchForm"  action="${ctx}/sys/classinfo" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<input id="classid" name="classid" type="hidden" value="${classInfo.id}"/>
            	<div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">班级编号：</span>
							<input name="code" type="text"  maxlength="15" value="${page.map.code}"  placeholder="班级编号" class="form-control br_5" />	                   
						</div>
	                </div>
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">班级名称：</span>
	                          <input name="name" type="text"  maxlength="15" value="${page.map.name}"  placeholder="班级名称" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="cb"></div>
                </div>
                <div class="rwo mt15 mb15">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">年级：</span>
	                        <input name="grade" type="text"  maxlength="4" value="${page.map.grade}"  placeholder="年级" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                
	                <div class="cb"></div>
                </div>
            </div>
             <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">班级列表：</div>
                <div class="fr">
                <shiro:hasPermission name="sys:class:edit">
               		<input type="button" onclick="location.href='${ctx}/sys/classinfo/form'" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增班级">
                </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr>
                           <th>所属机构</th>
                       	   <th>年级</th>
                       	   <th>班级编号</th>
                       	   <th>班级名称</th>
                       	   <th>负责人</th>
                       	   <th>操作</th>
                       </tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无班级信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="classInfo">
						<tr>
                            <td>${classInfo.organization.name}</td>
                            <td>${classInfo.grade}</td>
						    <td>${classInfo.code}</td>
							<td>${classInfo.name}</td>
							<td>${classInfo.principal}</td>
							<shiro:hasPermission name="sys:class:edit">
							<td class="color_00bfb0">
			    				<a title="修改" class="mr20 cp" href="${ctx}/sys/classinfo/form?id=${classInfo.id}">修改</a>
								<a title="删除" class="mr20 cp" href="${ctx}/sys/classinfo/delete?id=${classInfo.id}" onclick="return confirmx('确认要删除该班级吗？', this.href)">删除</a>
								<a title="学员考勤" class="mr20 cp" href="${ctx}/sys/Attendance?classId=${classInfo.id}">学员考勤</a>
								<a title="班级详情" class=" cp" href="${ctx}/sys/classinfo/details?id=${classInfo.id}&organizationId=${classInfo.organizationId}">班级详情</a>
							</td>
							</shiro:hasPermission>
						</tr>
					</c:forEach>
				</c:if>
          </table>
            </div>
            </form>
        </div>
        <div class="dede_pages">${page}</div>
    </div>	
</body>
</html>
