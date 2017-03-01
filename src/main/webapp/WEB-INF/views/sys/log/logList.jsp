<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志管理</title>
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
                <a href="${ctx}/sys/log/">日志列表</a>
            </div>
            
            <tags:message content="${message}"/>
            <form id="searchForm"  action="${ctx}/sys/log/" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
            <div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="col-lg-5">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">请求方式：</span>
	                        <select name="method">
								<option value="">请选择请求方式</option>
								<option value="GET" <c:if test='${"GET"==page.map.method}'>selected</c:if> >GET</option>
								<option value="POST" <c:if test='${"POST"==page.map.method}'>selected</c:if> >POST</option>
								<option value="PUT" <c:if test='${"PUT"==page.map.method}'>selected</c:if> >PUT</option>
								<option value="DELETE" <c:if test='${"DELETE"==page.map.method}'>selected</c:if> >DELETE</option>
								<option value="TRACE" <c:if test='${"TRACE"==page.map.method}'>selected</c:if> >TRACE</option>
								<option value="HEAD" <c:if test='${"HEAD"==page.map.method}'>selected</c:if> >HEAD</option>
								<option value="OPTIONS" <c:if test='${"OPTIONS"==page.map.method}'>selected</c:if> >OPTIONS</option>
							</select>
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">模块：</span>
	                          <input name="moudle" type="text"  maxlength="15" value="${page.map.moudle }"  placeholder="模块" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="cb"></div>
                </div>
                <div class="rwo mt15 mb15">
	                <div class="col-lg-5">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">动作：</span>
	                        <input name="action" type="text"  maxlength="30" value="${page.map.action }"  placeholder="动作" class="form-control br_5" />
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">操作人：</span>
	                          <input name="operator" type="text"  maxlength="15" value="${page.map.operator}"  placeholder="操作人" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>	                
	                <div class="cb"></div>
                </div>
            </div>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">日志列表：</div>
                <div class="fr">
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr>
                        <th>方式</th>
                        <th>模块</th>
                        <th>动作</th>
                        <th>操作人</th>
                        <th>时间</th>
                        <th>操作</th>
                        </tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无日志信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}"> 
						<c:forEach items="${page.list}" var="log">
							<tr>
								<td>${log.method}</td>
								<td>${log.moudle}</td>
								<td>${log.action}</td>
								<td>${log.user.name}</td>
								<td>${log.createDate.toString()}</td>
								<td class="color_00bfb0">
									<a title="详情" class="cp" href="${ctx}/sys/log/form?id=${log.id}">详情</a>
								</td>
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
