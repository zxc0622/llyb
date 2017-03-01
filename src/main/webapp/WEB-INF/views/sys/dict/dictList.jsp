<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
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
                <span>字典列表</span>
            </div>            
            <tags:message content="${message}"/>
            <form id="searchForm"  action="${ctx}/sys/dict" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
            <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="col-lg-5">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">字典类型：</span>
	                        <select id="type" name="type">
								<option value=""  >--请选择--</option>
								<c:forEach items="${typeList}" var="type">
									<option value="${type}" <c:if test="${type==page.map.type }">selected</c:if> >${type}</option>
								</c:forEach>
						   </select>
	                    </div>
	                </div>
	                 <div class="col-lg-4">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">字典描述：</span>
                          <input name="description" type="text" maxlength="30" value="${page.map.description }"  placeholder="字典描述" class="form-control br_5" />
                    </div>
                </div>
                <button onclick="formSubmit()" class="me_button_two mt3 ml35">查询</button>
                <div class="cb"></div>
                </div>
               
            </div>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">账号列表：</div>
                <div class="fr">
                  <shiro:hasPermission name="sys:dict:edit"> <input type="button" onclick="location.href='${ctx}/sys/dict/form'" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增字典"></shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr>
                       	<th >标签</th>
                       	<th >键值</th>
                       	<th>类型</th>
                       	<th>描述</th>
                       	<th >排序</th>
                       	<shiro:hasPermission name="sys:dict:edit">
                       	<th class="new_server_td01">操作</th>
                       	</shiro:hasPermission></tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无字典信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="dict">
						<tr >
							<td>${dict.label}</td>
								<td>${dict.value}</td>
								<td><a class="cp" href="javascript:" onclick="$('#type').val('${dict.type}');page(1,10);return false;">${dict.type}</a></td>
								<td>${dict.description}</td>
								<td>${dict.sort}</td>
								<shiro:hasPermission name="sys:dict:edit">
								<td class="color_00bfb0">
				    				<a title="修改" class="mr20 cp" href="${ctx}/sys/dict/form?id=${dict.id}">修改</a>
									<a title="删除" class=" mr20 cp" href="${ctx}/sys/dict/delete?id=${dict.id}" onclick="return confirmx('确认要删除该字典吗？', this.href)">删除</a>
				    				<a title="新增键值" class="cp" href="<c:url value='/sys/dict/form?dict.type=${dict.type}'></c:url>">新增键值</a>
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
