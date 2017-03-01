<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			jQuery("#inputForm").validationEngine({
				onValidationComplete:function(form, valid){
					if(valid==true){
						$("#inputForm").unbind();
						form.submit();
						loading('正在提交，请稍等...');
					}
				}
			});
		});
		function formsubmit(formId){
			$('#'+formId).submit();
		}
	</script>
</head>
<body> 
      <form id="inputForm" action="${ctx}/sys/dict/save" method="post">
	<input type="hidden" name="dict.id" value="${dict.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/dict">字典列表</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty dict.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">字典标签：</span>
                <input name="dict.label" type="text" maxlength="30"  value="${dict.label}" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
            	<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">字典键值：</span>
                <input name="dict.value" type="text" maxlength="20" value="${dict.value}" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
				<span class="span_xing">*</span>
            </div>
        </div>
        
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">字典类型：</span>
                <input name="dict.type" type="text" maxlength="30" value="${dict.type}" data-validation-engine="validate[required]"  class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">字典描述：</span>
                <input name="dict.description" type="text" maxlength="30" value="${dict.description}" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
				<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">字典排序：</span>
				<input name="dict.sort" type="text" maxlength="8" value="${dict.sort}" data-validation-engine="validate[required,custom[integer]]" class="form-control br_5 width_b90"/>     
				<span class="span_xing">*</span>       
			</div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/dict'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>
	</div>
	</form>    
 </body>
</html>