<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>类别管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				jQuery("#inputForm").validationEngine(
						{
							promptPosition : "centerRight",
							onValidationComplete : function(form, valid) {
								debugger;
								if (valid == true) {
									var area = $("#createName").val();
									if (area == "") {
										jQuery('#createName').validationEngine(
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
	function formsubmit() {
		$('#inputForm').submit();
		
		
	}
</script>
</head>
<body>

<form id="inputForm" action="${ctx}/sys/forum/save" method="post">
		<input type="hidden" name="create.id" value="${create.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/category/">版块列表</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty create.id?'修改':'新增'}</span>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">上级版块：</span>
					<tags:treeselect id="area" name="create.parentId"
					value="${create.parentId}" labelName="parentw.name"
					labelValue="${create.parentw.boardName}" title="区域"
					url="/sys/forum/treeData" cssClass="form-control br_5 width_b90"
					extId="${create.id}" />
					<span class="span_xing">*</span>    
			</div>
        </div> 
         <input type="hidden" value="${id}" name="id">
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">版块名称：</span>
					<input id="createName" name="create.boardName" type="text" maxlength="30" value="${create.boardName }" class="form-control br_5 width_b90" data-validation-engine="validate[required] text-input" />
					<span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">版块序号：</span>
				<input name="create.showOrder" type="text" value="${create.showOrder }" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' class="form-control br_5 width_b90" />				
            </div>
        </div> 
        <%-- <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">类别编码：</span>
                <input name="create.code" type="text" value="${create.code }" class="form-control br_5 width_b90" />
            </div>
        </div> --%>
       
       <div class="col-lg-5 mt20">
            <div class="input-group">
                 <span class="input-group-addon me_search_span">备注：</span>
					<textarea class="form-control br_5 width_b90 resize_none" maxlength="30" name="create.remarks">${create.remarks }</textarea>
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="formsubmit()" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/forum/index'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>