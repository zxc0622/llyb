<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>宿舍管理</title>
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
            	<span>基础设置</span>
                <span style="margin-left:2px;">></span>
                <span>宿舍管理</span>
            </div>
            <form id="searchForm"  action="${ctx}/sys/dormitory" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
             <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
                <div class="rwo mt15 mb15">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">宿舍编号：</span>
	                        <input name="code" type="text"  maxlength="15" value="${page.map.code}"  placeholder="宿舍编号" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                <div class="cb"></div>
                </div>
            </div>
            <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">宿舍列表：</div>
                <div class="fr">
                <shiro:hasPermission name="sys:dormitory:edit">
                  <input type="button" onclick="location.href='${ctx}/sys/dormitory/form'" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增宿舍">
                </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr><th>所属机构</th><th>宿舍编号</th><th>备注</th><th>操作</th></tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="5" align="center">暂无宿舍信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="dormitory">
						<tr>
                            <td>${dormitory.organization.name}</td>
						    <td>${dormitory.code}</td>
							<td>${dormitory.remarks}</td>
							<shiro:hasPermission name="sys:dormitory:edit">
							<td class="color_00bfb0">
			    				<a title="修改" class="mr20 cp" href="${ctx}/sys/dormitory/form?id=${dormitory.id}">修改</a>
								<a title="删除" class="cp" href="${ctx}/sys/dormitory/delete?id=${dormitory.id}" onclick="return confirmx('确认要删除该宿舍吗？', this.href)">删除</a>
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
