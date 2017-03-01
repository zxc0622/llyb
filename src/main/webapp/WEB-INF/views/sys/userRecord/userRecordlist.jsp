<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>账号日志管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
    	return false;
    }
	function formSubmit(){
		$("#searchForm").submit();
	}
	    
    </script>
</head>
<body>
            <div class="me_content_right">            
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/userRecord/">账号日志列表</a>
            </div>
            <form id="searchForm"  action="${ctx}/sys/userRecord/" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
            <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">账号：</span>
	                        <input name="loginName" type="text"  maxlength="15" value="${page.map.loginName}"  placeholder="账号" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">姓名：</span>
	                          <input name="name" type="text"  maxlength="15" value="${page.map.name}"  placeholder="姓名" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                <div class="cb"></div>
                </div>
            </div>
            
            <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">账号日志列表：</div>
                <div class="fr">
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            
            <table width="100%" >
                       <tr>
                       <th class="sort-column login_name">账号</th>
                       <th>用户类型</th>
                       <th>用户操作</th>
                       <th>姓名</th>
                       <th>用户机构</th>
                       <th>用户部门</th>
                       <th>手机号</th>
                       <th>角色</th>
                       <th>使用状态</th>
                       <th>操作人</th>
                       <th>操作时间</th>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="11" align="center">暂无账号日志信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="userRecord">
						<tr>
							<td>${userRecord.loginName}</td>
							<td>${fns:getDictLabel(userRecord.type,'user_type', '无')}</td>
							<td>${userRecord.dispose}</td>
							<td>${userRecord.name}</td>
							<td>${userRecord.organization.name}</td>
							<td>${userRecord.department.name}</td>
							<td>${userRecord.phone}</td>
							<td>${userRecord.role}</td>
							<td>${fns:getDictLabel(userRecord.onState,'user_state', '无')}</td>
							<td>${userRecord.user.name}</td>
							<td><fmt:formatDate value="${userRecord.updateDate}" pattern="yyyy-MM-dd HH:mm"/></td>
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
