<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>部门详情</title>
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
	<form id="inputForm" action="" method="post">
	<input id="departmentId" type="hidden" name="department.id" value="${department.id}" />
	<input id="organizationId" type="hidden" name="organizationid" value="${organizationid}" />
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/organization">机构管理</a>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/department?id=${organizationid}">部门管理</a>
            <span style="margin-left:2px;">></span>
            <span>部门详情</span>
        </div>
        <div class="col-lg-5 mt20">
        	 <div class="input-group">
            	 <span class="input-group-addon me_search_span">所属机构：</span>
                 <span class="me_search_span">${department.organization.name} </span>
			</div>
        </div>
        <div class="col-lg-5 mt20">
        	 <div class="input-group">
            	 <span class="input-group-addon me_search_span">上级部门：</span>
                 <span class="me_search_span">${department.parent.name} </span>
			</div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">部门姓名 ：</span>
                <span class="me_search_span">${department.name} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <span class="me_search_span">${department.principal} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">电话：</span>
                <span class="me_search_span">${department.mobile} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">传真：</span>
                <span class="me_search_span">${department.fax} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮政编码：</span>
                <span class="me_search_span">${department.postCode} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮箱：</span>
                <span class="me_search_span">${department.email} </span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">地址：</span>
                <span class="me_search_span">${department.address} </span>
            </div>
        </div>
       
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="location.href='${ctx}/sys/department?id=${organizationid}'" class="me_button_two mr20" value="返回">
        </div>
    </div>

	</div>
	</form>
</body>

</html>