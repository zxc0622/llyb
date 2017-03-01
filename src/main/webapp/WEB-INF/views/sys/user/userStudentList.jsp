<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>账号管理</title>
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
        	<div class="me_change_all">
        		<a class="me_change_a cp fl" href="${ctx}/sys/user" id="mendian">账号管理</a>
            	<a class="me_change_a1 cp fl  me_change_befault" href="${ctx}/sys/user/student" id="cangku">学员账号管理</a>
        	</div>
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/user/student">学员账号列表</a>
            </div>
            <form id="searchForm"  action="${ctx}/sys/user/student" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
            <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">账号：</span>
	                        <input name="loginName" type="text"  maxlength="15" value="${page.map.loginName }"  placeholder="账号" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">姓名：</span>
	                          <input name="name" type="text"  maxlength="15" value="${page.map.name }"  placeholder="姓名" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">手机号：</span>
	                          <input name="phone" type="text"  maxlength="11" value="${page.map.phone }"  placeholder="手机号" class="form-control br_5" />
	                    </div>
	                </div>
	            <div class="cb"></div>
                </div>
                <div class="row mt15 mb15">
            	  <div class="col-lg-4">
	                <div class="input-group">
	                    <span class="input-group-addon me_search_span">班级：</span>
	                      <select  name="classname" id="classid" onchange="fore();" >
			            		<option value="">请选择班级</option>
			            		<c:forEach items="${classInfoList}" var="classinfo">
			            			<option value="${classinfo.id}" <c:if test="${classinfo.id == page.map.classname}">selected="selected"</c:if >>${classinfo.name}</option>
			            		</c:forEach>
            				</select>
	                </div>
	            </div>
	               <div class="col-lg-4">
		                <div class="input-group">
		                    <span class="input-group-addon me_search_span">使用状态：</span>
		                      <select  name="onState" id="onState" onchange="fore();" >
				            		<option value="">请选择使用状态</option>
				            		 <c:forEach items="${fns:getDictList('user_state')}" var="dict">
										<option value="${dict.value }"<c:if test="${dict.value == page.map.onState}">selected</c:if>>${dict.label}</option>
									</c:forEach>
	            			</select>
		                </div>
	            	</div>
	            	<div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">学号：</span>
	                          <input name="stuNo" type="text"  maxlength="15" value="${page.map.stuNo }"  placeholder="学号" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                <div class="cb"></div>
                </div>
            </div>
            <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">账号列表：</div>
                <div class="fr">
                  <shiro:hasPermission name="sys:user:edit"> </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            
            <table width="100%" >
                       <tr>
                       <th class="sort-column login_name">账号</th>
                       <th>姓名</th>
                       <th>班级</th>
                       <th>学号</th>
                       <th>手机号</th>
                       <th>使用状态</th>
                       <shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无账号信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="user">
						<tr>
							<td>${user.loginName}</td>
							<td>${user.name}</td>
							<td>${user.student.classInfo.name}</td>
							<td>${user.student.studentNo}</td>
							<td>${user.student.phone}</td>
							<td>${fns:getDictLabel(user.onState,'user_state', '无')}</td>
							<shiro:hasPermission name="sys:user:edit"><td class="color_00bfb0">
			    				<a title="修改" class="mr20 cp" href="${ctx}/sys/user/form?id=${user.id}">修改</a>
			    				<c:if test="${user.onState == 0 }">
								<a title="帐户停用" class="mr20 cp" href="${ctx}/sys/user/getChange?id=${user.id}" onclick="return confirmx('确认要修改用户使用状态吗？', this.href)">帐户停用</a>
								</c:if>
								<c:if test="${user.onState == 1 }">
								<a title="恢复使用" class="mr20 cp" href="${ctx}/sys/user/getChangeOne?id=${user.id}" onclick="return confirmx('确认要修改用户停用状态吗？', this.href)">恢复使用</a>
								</c:if>
								<a title="详情" class="mr20 cp" href="${ctx}/sys/user/details?id=${user.id}">详情</a>
							</td></shiro:hasPermission>
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
