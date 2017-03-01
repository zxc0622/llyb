<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>状态变更</title>
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
		var classId = $("#classId").val();
		if(classId == null || classId == ""){
			top.$.jBox.tip("请选择班级");
			return false;
		}
		var studentNo = document.getElementsByName('student.studentNo');
		 for(i = 0; i < studentNo.length; i++) {
			 var sNo = studentNo[i].value;
			 for(g = 0; g < studentNo.length; g++) {
				 if(sNo !=null && sNo !='' && studentNo[g].value == sNo  && g !=i ) {
					 top.$.jBox.tip("输入的学号有重复，请检查");
					return false;
				 }
			 }
		 }
		$('#inputForm').submit();
	}

</script>
</head>
<body>
	<tags:message content="${message}" />
	<form id="inputForm"   action="${ctx}/sys/user/getChange" method="post">
	
	<input id="userId" type="hidden" name="user.id" value="${user.id}" />
	
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/user">账号管理</a>
            <span style="margin-left:2px;">></span>
           		状态变更
        </div>
        <c:forEach items="${userList}" var="user" varStatus="status" >
        <input  type="hidden" name="user.id" value="${user.id}" />
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">姓名：</span>
                <span class="me_search_span">${not empty user.name?'${user.name}':'${user.student.name}'}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">账号：</span>
                <span class="me_search_span">${user.loginName}</span>
            </div>
        </div>
        </c:forEach>
        <div class="cb"></div>
        <div class="me_qd_qx mt20">
	        <input type="button" class="me_button_two mr20" onclick="javascript:formsubmit(inputForm) " onclick="return confirmx('确认要删除该用户吗？', this.href)" value="全部变更">
	        <input type="button" onclick="location.href='${ctx}/sys/user'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消变更">
        </div>
    </div>
	</div>
	</form>
	

	
	
</body>

</html>