<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>机构管理</title>
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
		var type =  $('#type').val();
		if(type == null || type ==''){
			top.$.jBox.tip("请选择机构类型!");
			return false;
		}
		$('#'+formId).submit();
	}
</script>
</head>
<body>
	<tags:message content="${message}" />
	<form id="inputForm" action="${ctx}/sys/organization/save" method="post">
	<input id="organizationId" type="hidden" name="organization.id" value="${organization.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>基础设置></span>
            <span style="margin-left:2px;"></span>
            <a href="${ctx}/sys/organization">机构管理</a>>
            <span style="margin-left:2px;"></span>
            <span>${not empty organization.id?'修改':'新增'}</span>
        </div>
            <div class="col-lg-12 mt20">
            <div class="input-group">            
                <span class="input-group-addon me_search_span">机构类型：</span>
                <select id="type" name="organization.type">
                    <option value="">请选择机构类型</option>
                    <c:forEach items="${fns:getDictList('sys_organization_type')}" var="dict">
						<option value="${dict.value}"
							<c:if test="${dict.value == organization.type}">selected</c:if>>${dict.label}</option>
					</c:forEach>
                </select>
                <span class="span_xing">*&nbsp;青软实训机构，机构类型选择青软实训</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">机构名称：</span>
                <input type="text" id="classInfoName" name="organization.name" value="${organization.name}" maxlength="20" data-validation-engine="validate[required,maxSize[20],ajax[ajaxOrganizationNameCall]] text-input" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <input type="text" name="organization.principal" value="${organization.principal}" maxlength="10" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
            	<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">电话：</span>
                <input type="text" name="organization.tel" value="${organization.tel}" maxlength="20" data-validation-engine="validate[required]]" class="form-control br_5 width_b90" />
            	<span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">区域：</span>
                <tags:treeselect id="area" name="organization.areaId" value="${organization.area.id}" labelName="area.id" dataMsgRequired="false" labelValue="${organization.area.name}"
					title="地区" url="/sys/area/treeData" allowClear="true" cssClass="form-control br_5 width_b90"  extId="${area.id}"/>
					<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">地址：</span>
                <input type="text" name="organization.addr" value="${organization.addr}" maxlength="30" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
       <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">传真：</span>
                <input type="text" name="organization.fax" value="${organization.fax}" maxlength="20" data-validation-engine="validate[maxSize[20]]" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮政编码：</span>
                <input type="text" name="organization.postCode" value="${organization.postCode}" maxlength="6" data-validation-engine="validate[custom[mailbox],maxSize[20]]" class="form-control br_5 width_b90" />
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮箱：</span>
                <input type="text" name="organization.email"  value="${organization.email}" maxlength="25" data-validation-engine="validate[custom[email],maxSize[20]]" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注：</span>
                <input type="text" name="organization.remarks" value="${organization.remarks}" maxlength="20" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
            <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/organization'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>