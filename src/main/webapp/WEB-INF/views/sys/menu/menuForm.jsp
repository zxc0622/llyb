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
						var menu = $("#menuName").val();
						if(menu==""){
							jQuery('#menuName').validationEngine('showPrompt', '*请选择', 'error', true);
						}else{
							$("#inputForm").unbind();
							form.submit();
							loading('正在提交，请稍等...');
						}
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
 <form id="inputForm"  action="${ctx}/sys/menu/save" method="post" >
            <input type="hidden" name="menu.id" value="${menu.id}"/>
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/menu/">菜单列表</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty menu.id?'修改':'新增'}</span>
        </div>

        <tags:message content="${message}"/>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">上级菜单：</span>
                <tags:treeselect id="menu" name="menu.parentId" value="${menu.parentId}" labelName="parent.name" labelValue="${menu.parent.name}"
					title="菜单" url="/sys/menu/treeData" allowClear="true" cssClass="form-control br_5 width_b90" extId="${menu.id}"/>
					<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">菜单名称：</span>
                <input name="menu.name" type="text" maxlength="20" value="${menu.name}" data-validation-engine="validate[required]" class="form-control br_5 width_b90" />
				<span class="span_xing">*</span>
            </div>
        </div>
        
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">菜单排序：</span>
                <input name="menu.sort" type="text" maxlength="8" value="${menu.sort}" data-validation-engine="validate[required,custom[integer]]" class="form-control br_5 width_b90" />
				<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 me_a_checkbox">
            <div class="input-group">
                <span class="input-group-addon me_search_span">可见状态：</span>
						<c:forEach items="${fns:getDictList('show_hide')}" var="show_hide"> 
								<input class="fl me_a_radio" data-validation-engine="validate[required]" type="radio" name="menu.isShow" value="${show_hide.value }"
								<c:if test="${show_hide.value==menu.isShow }">checked="true"</c:if> />
								<span class="fl pl5 pr5">${show_hide.label}</span>
					    </c:forEach>
				<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">目标链接：</span>
                <input type="text"  name="menu.href" maxlength="40" value="${menu.href}" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">目标框架：</span>
                <input name="menu.target" type="text" maxlength="30"  value="${menu.target}" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">权限标志：</span>
                <input name="menu.permission" type="text" maxlength="100" value="${menu.permission}" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/menu'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>
</html>