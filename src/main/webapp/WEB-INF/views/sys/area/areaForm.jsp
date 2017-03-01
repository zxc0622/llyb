<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>区域管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				jQuery("#inputForm").validationEngine(
						{
							promptPosition : "centerRight",
							onValidationComplete : function(form, valid) {
								if (valid == true) {
									var area = $("#areaName").val();
									if (area == "") {
										jQuery('#areaName').validationEngine(
												'showPrompt', '*请选择', 'error',
												true);

									} else {
										$("#inputForm").unbind();
										form.submit();
										loading('正在提交，请稍等...');
									}
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

<form id="inputForm" action="${ctx}/sys/area/save" method="post">
		<input type="hidden" name="area.id" value="${area.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/area/">区域列表</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty area.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">上级区域：</span>
					<tags:treeselect id="area" name="area.parentId"
					value="${area.parent.id}" labelName="parent.name"
					labelValue="${area.parent.name}" title="区域"
					url="/sys/area/treeData" cssClass="form-control br_5 width_b90"
					extId="${area.id}" />
					<span class="span_xing">*</span>          
			</div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">区域名称：</span>
					<input id="area_name" name="area.name" type="text" maxlength="30" value="${area.name }" class="form-control br_5 width_b90" data-validation-engine="validate[required] text-input" />
					<span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">区域类型：</span>
				<select name="area.type" >
					<c:forEach items="${fns:getDictList('sys_area_type')}" var="type">
						<option value="${type.value }"
							<c:if test="${type.value == area.type}">selected</c:if>>${type.label }</option>
					</c:forEach>
				</select>				
				<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">区域编码：</span>
                <input name="area.code" type="text" value="${area.code }" class="form-control br_5 width_b90" />
            </div>
        </div>
       
       <div class="col-lg-5 mt20">
            <div class="input-group">
                 <span class="input-group-addon me_search_span">备注：</span>
					<textarea class="form-control br_5 width_b90 resize_none" maxlength="30" name="area.remarks"></textarea>
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm')" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/area/'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>