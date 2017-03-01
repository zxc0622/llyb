<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
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
                <span>机构管理</span>
            </div>
            <form id="searchForm"  action="${ctx}/sys/organization" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
            <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
                <div class="rwo mt15 mb15">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">机构名称：</span>
	                        <input name="name" type="text"  maxlength="20" value="${page.map.name }"  placeholder="机构名称" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                <div class="cb"></div>
                </div>
            </div>
            <tags:message content="${message}" />
             <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">机构列表：</div>
                <div class="fr">
                 <input type="button" onclick="location.href='${ctx}/sys/organization/form'" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增机构信息">
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr>
                          <th width="15%">机构类型</th>
                          <th width="15%">机构名称</th>
                          <th width="10%">负责人</th>
                          <th width="15%">电话</th>
                          <th width="15%">传真</th>
                          <shiro:hasPermission name="sys:organization:edit">
                          <th width="30%">操作</th>
                          </shiro:hasPermission>
                          </tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无机构信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="organization">
						<tr >
						    <td>${fns:getDictLabel(organization.type,'sys_organization_type','无')}</td>	
							<td>${organization.name}</td>
							<td>${organization.principal}</td>
							<td>${organization.tel}</td>
							<td>${organization.fax}</td>
							<shiro:hasPermission name="sys:organization:edit">
							  <td class="color_00bfb0">
			    				<a title="修改" class="cp mr20" href="${ctx}/sys/organization/form?id=${organization.id}">修改</a>
 								<a title="删除" class="cp mr20" href="${ctx}/sys/organization/delete?id=${organization.id}" onclick="return confirmx('确认要删除该机构吗？', this.href)">删除</a>
								<a title="机构详情" class="cp mr20" href="${ctx}/sys/organization/details?id=${organization.id}">机构详情</a>
								<a title="部门管理 (学院或企业部门)" class="cp" href="${ctx}/sys/department?id=${organization.id}">部门管理(学院或企业部门)</a>
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
