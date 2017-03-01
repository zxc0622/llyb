<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>班级收费模板管理</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="me_content_right">
    <div class="me_content_start">
    		<div class="table_one">
            <table width="75%" >
                       <tr>
                       <th width="10%">
                        <input type="checkbox" name="selecteditemall" title="全选" onclick="javascript:selectall();" />
                       </th>
                       <th>收费项目</th>
                       </tr>
                       <c:forEach items="${fns:getDictList('charg_type')}" var="dict">
						<tr>
						  <td><input type="checkbox"  id="selecteditem"  name="selecteditem" value="${dict.value}"/></td>
                          <td>${dict.label}</td>
						</tr>
						
					</c:forEach>
          </table>
            </div>	
    </div>
	</div>
</body>
<html>
