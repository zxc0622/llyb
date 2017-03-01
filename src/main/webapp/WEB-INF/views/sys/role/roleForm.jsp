<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		jQuery("#inputForm").validationEngine({
			onValidationComplete:function(form, valid){
				if(valid==true){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);

					$("#inputForm").unbind();
					form.submit();
					loading('正在提交，请稍等...');
				}
			}
		});
		
		var setting = {check:{enable:true,nocheckInherit:true}, view:{selectedMulti:false},
				data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
					tree.checkNode(node, !node.checked, true, true);
					return false;
				}}};
		
		// 用户-菜单
		var zNodes=[<c:forEach items="${menuList}" var="menu">
						{id:${menu.id}, pId:${not empty menu.parentId?menu.parentId:0}, name:"${not empty menu.parent.id?menu.name:'功能菜单'}"},
				    </c:forEach>];
		
		// 初始化树结构
		var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
		// 默认选择节点
		var ids = "${role.menuIds}".split(",");
		for(var i=0; i<ids.length; i++) {
			var node = tree.getNodeByParam("id", ids[i]);
			try{tree.checkNode(node, true, false);}catch(e){}
		}
		// 默认展开全部节点
		tree.expandAll(true);
	});
	
	function formsubmit(formId){		
		$('#'+formId).submit();
		
	}
	</script>
</head>
<body>
<form id="inputForm" action="${ctx}/sys/role/save" method="post">
	<input type="hidden" name="role.id" value="${role.id }" />
          ${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/role">角色列表</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty role.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">角色名称：</span>
                <input id="oldName" name="oldName" type="hidden" value="${role.name}">
                <input name="role.name" type="text" maxlength="20"  value="${role.name}" data-validation-engine="validate[required] text-input" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">描述：</span>
                <input name="role.roleType" type="text" maxlength="20"  value="${role.roleType}" class="form-control br_5 width_b90" />
            </div>
        </div>
        
         <div class="col-lg-5 mt20">
            <div class="input-group">
            	<span class="input-group-addon me_search_span" >机构：</span>
            	<input type="hidden" id="organizationId" name="organizationId" value="${role.organizationId}" >
            	<select name="role.organizationId" id="organizationId" onchange="show();">
            		<option value="">请选择机构</option>
            		<c:forEach items="${organizationList}" var="organization">
            			<option <c:if test="${organization.id == role.organizationId}">selected="selected"</c:if> value="${organization.id}">${organization.name}</option>
            		</c:forEach>
            	</select>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
            	<span class="input-group-addon me_search_span" >部门：</span>
            		 <tags:treeselect id="department" extIdValue="organizationId" name="role.departmentId" value="${role.departmentId}" labelName="parent.name" labelValue="${role.department.name}"
						title="部门" required="false" url="/sys/user/treeData" allowClear="true" cssClass="form-control br_5 width_b90"  extId="${department.id}"/>
            </div>
        </div>
        
        <div class="col-lg-10 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">角色授权：</span>
                <div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
 				<input type="hidden" id="menuIds" name="menuIds" value="${role.menuIds }"/>
            </div>
        </div>
       
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/role'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
	<script type="text/javascript">
	function show(){
		var schoolId = $('#schoolId').val();
		$('#department').val("");
		$('#departmentName').val("");
		if(schoolId != null && schoolId != ""){
			$('#organizationId').val(schoolId);
		}
	}
	</script>
	
</body>

</html>