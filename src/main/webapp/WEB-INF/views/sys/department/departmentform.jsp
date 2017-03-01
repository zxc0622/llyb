<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>部门表单</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

	$(document).ready(function() {
		jQuery("#inputForm").validationEngine({
			onValidationComplete : function(form, valid) {
				if (valid == true) {
				$("#inputForm").unbind();
				form.submit();
				loading('正在提交，请稍等...');
				}
			}
		});		
	});
	
	function formsubmit(formId) {
		$('#' + formId).submit();
	}
</script>
</head>
<body>
	<tags:message content="${message}" />
	<form id="inputForm" action="${ctx}/sys/department/save" method="post">
		<input  id="depmentId" type="hidden" name="department.id" value="${department.id}" />
		<input id="organizationId"  type="hidden" name="organizationid" value="${organizationid}" />
		 ${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/organization">机构管理</a>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/department?id=${organizationid}">部门管理</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty department.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-5 mt20">
        	 <div class="input-group">
            	 <span class="input-group-addon me_search_span">上级部门：</span>
                <tags:treeselect id="department" name="department.parentId" value="${department.parent.id}" labelName="parent.name" labelValue="${department.parent.name}"
						title="部门" url="/sys/department/treeData?organizationid=${organizationid}" allowClear="true" cssClass="form-control br_5 width_b90"  extId="${department.id}"/>
				<span class="span_xing">*</span>
			</div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">部门名称 ：</span>
                <input   type="text" id="departmentCod" name="department.name" value="${department.name}" data-validation-engine="validate[required,ajax[ajaxDepartmentCodeCall]] text-input" maxlength="20" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <input type="text" name="department.principal" value="${department.principal}" data-validation-engine="validate[required,maxSize[10]] text-input" maxlength="10" class="form-control br_5 width_b90" />
                 <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">电话：</span>
                <input type="text" name="department.mobile" value="${department.mobile}" data-validation-engine="validate[custom[phone]]" maxlength="15" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">传真：</span>
                <input type="text" name="department.fax" value="${department.fax}"  maxlength="15" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮政编码：</span>
                <input type="text" name="department.postCode" value="${department.postCode}" maxlength="10" data-validation-engine="validate[custom[mailbox],maxSize[10]] text-input" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮箱：</span>
                <input type="text" name="department.email" value="${department.email}" maxlength="20" data-validation-engine="validate[custom[email]]" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">地址：</span>
                <input type="text" name="department.address" value="${department.address}" maxlength="50" data-validation-engine="validate[maxSize[50]] text-input" class="form-control br_5 width_b90" />
            </div>
        </div>
       
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/department?id=${organizationid}'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>