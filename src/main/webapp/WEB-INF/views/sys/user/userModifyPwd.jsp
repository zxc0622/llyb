<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>修改密码</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

	$(document).ready(function() {
		jQuery("#inputForm").validationEngine({
			onValidationComplete : function(form, valid) {
				if (valid == true) {//输入框都不为空
					$("#inputForm").unbind();
					form.submit();
				}
			}
		});
	});
	
	function formsubmit(){
			$("#inputForm").submit();
	}
</script>
</head>
<body>
<tags:message content="${message}"/>
<form id="inputForm" action="${ctx}/sys/user/modifyPwd" method="post">
	<input id="userId" type="hidden" name="user.id" value="${user.id}" />
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <span>修改密码</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">用户姓名：</span>
                <span class="me_search_span">${user.name }</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">原始密码：</span>
                <input type="password" maxlength="30" name="Password" value="" data-validation-engine="validate[required,minSize[6],ajax[ajaxPassword]] text-input" class="form-control br_5 width_b90" />
				<span class="span_xing">*</span>
            </div>
        </div>
        
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">密码：</span>
                <input id="newPassword" name="newPassword" type="password" value="" maxlength="20" data-validation-engine="validate[required,minSize[6]] text-input" class="form-control br_5 width_b90"/>
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">确认密码：</span>
                <input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" class="form-control br_5 width_b90"  data-validation-engine="validate[equals[newPassword]] text-input" data-errormessage-value-missing="*确认密码必须相同" />
				<span class="span_xing">*</span>
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/user'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>
	</div>
	</form>
</body>
</html>