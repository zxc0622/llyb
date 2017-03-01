<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel :5});
			var str ='${leibie}';
			
			$("#type option[value="+str+"]").attr("selected","selected");
			$(".select2-chosen").text($("#type option[value="+str+"]").text());
		});
		
		function leibies(){
			$("#lbID").val($("#type").val())
			$("#searchForm").submit();
		}
		function hrefLb(obj,str){
			//var arr=$("#type").val();
			if(str=='1'){
				window.location.href="${ctx}/sys/forum/form?id="+obj+"";
			}else if(str=='2'){
				window.location.href="${ctx}/sys/forum/form?create.parentId="+obj+"";
			}else if(str=='3'){
				window.location.href="${ctx}/sys/forum/form?";
			}else if(str=='4'){
				window.location.href="${ctx}/sys/forum/delete?id="+obj+"";
			}
		
		}
	</script>
	
</head>
<body>
    <div class="me_content_right">
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/category/">版块列表</a>
            </div>
           <%--  <tags:message content="${message}"/> --%>
            <form id="searchForm"  action="${ctx}/sys/category/index" method="post">
				 <tags:message content="${message}"/>
			<input type="hidden" name="leibie" id="lbID"/>
			<div class="rwo"style="margin-left:-37px;">
	                <div class="col-lg-5"style="margin-bottom:15px;">
	                    <%-- <div class="input-group">
	                        <span class="input-group-addon me_search_span">类别：</span>
	                        <select id="type" name="type" onchange="leibies()" >
	                        <option value="1"  >--请选择--</option>
                      	 	<c:forEach items="${fleibie}" var="fleibie">
	                        <option value="${fleibie.type}"  >${fleibie.name}</option>
	                        </c:forEach>
								
								
						   </select>
	                    </div> --%>
	                </div>
	                <div class="col-lg-4">
                    </div>
	         </div>
             <div class="cb"></div>
             
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">版块列表：</div>
                <div class="fr">
                    <input type="button" onclick="hrefLb('','3')" class="me_button_two" id="me_four_pop_click" value="+&nbsp;新增版块">                  
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table id="treeTable" width="100%" >
		            	<tr>
		            	<th>版块名称</th>
		                <th>版块序号</th>
		                <th>备注</th>
		                	<th>操作</th>
                       <c:if test="${fn:length(list) eq 0}">
							<tr>
								<td colspan="5" align="center">暂无类别信息</td>
							</tr>
						</c:if>
			 		<c:if test="${fn:length(list) > 0}">   
                       <c:forEach items="${list}" var="category">
						<tr id="${category.id}" pId="${category.parentId }">
							<td>${category.boardName}</td>
							<td>${category.showOrder}</td>
                        	<td>${category.remarks}</td>
							 <td class="color_00bfb0">
							 	<a title="修改" class="mr20 cp" onclick="hrefLb(${category.id},'1')" href="javascript:void(0)">修改</a>
								<a title="删除" class="mr20 cp" href="javascript:hrefLb(${category.id},'4');" onclick="return confirmx('要删除该类别及所有子类别项吗？', this.href)">删除</a>
								<a title="添加子版块" class="cp" onclick="hrefLb(${category.id},'2')" href="javascript:void(0)">添加子版块</a>
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
</html>
