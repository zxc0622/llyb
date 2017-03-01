<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>班级教师模板管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function formSubmit(){
		$("#searchForm").submit();
}
</script>
</head>
<body>
	<div class="me_content_right">
    <div class="me_content_start">
    <form id="searchForm"  action="${ctx}/sys/classinfo/addteacherfrom" method="post">
    	<div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
	                <div class="cb"></div>
	                <div class="rwo mt15 mb15 ">
	                <div class="col-lg-3">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">班级教师：</span>
	                        <input name="classteacher" type="text"  maxlength="10" value="${classteacher}"  placeholder="班级教师" class="form-control br_5" />
	                    </div>
	                </div>
	                <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                </div>
                </div>
            
            </div>
    		<div class="table_one">
            <table width="100%" >
                       <tr>
                       <th width="10%">
                        <input type="checkbox" name="selecteditemall" title="全选" onclick="javascript:selectall();" />
                       </th>
                       <th>班级教师</th>
                       </tr>
                       <c:if test="${user.size() ==0 }">
                       		<tr>
							  <td colspan="2" align="center">暂无班级教师信息</td>
							</tr>
                       </c:if>
                       <c:if test="${user.size() > 0 }">
                       <c:forEach items="${user}" var="user">
						<tr>
						  <td><input type="checkbox"  id="selecteditem"  name="selecteditem" value="${user.id}"/></td>
                          <td>
                          ${user.name}
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
<html>
