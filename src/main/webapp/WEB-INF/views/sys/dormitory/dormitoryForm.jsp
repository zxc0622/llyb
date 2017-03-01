<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>宿舍管理</title>
<meta name="decorator" content="default"/>
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
		var organizationId=$('#organizationId').val();
		if(organizationId==null||organizationId==''){
			top.$.jBox.tip("请选择所属机构");
			return false;
		}
		$('#' + formId).submit();
	}
</script>
</head>
<body>
	<tags:message content="${message}" />
	<form id="inputForm" action="${ctx}/sys/dormitory/save" method="post">
	<input id="dormitoryId" type="hidden" name="dormitory.id" value="${dormitory.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/dormitory">宿舍管理</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty dormitory.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">所属机构：</span>
                <select id="organizationId" name="dormitory.organizationId">
                <option value="">请选择所属机构</option>
                  <c:forEach items="${organizationList}" var="organization">
                     <option  value="${organization.id}" <c:if test="${organization.id==dormitory.organizationId}"> selected="selected"</c:if>>${organization.name}</option>
                  </c:forEach>
                </select>
                <span class="span_xing">*</span>
                
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">宿舍编号：</span>
                <input type="text" id="dormitoryCod" name="dormitory.code" value="${dormitory.code}" maxlength="20" data-validation-engine="validate[required,ajax[ajaxDormitoryCodeCall]] text-input" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注信息：</span>
                <input type="text" name="dormitory.remarks" value="${dormitory.remarks}" maxlength="30" class="form-control br_5 width_b90" />
            </div>
        </div>
        
        
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/dormitory'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>