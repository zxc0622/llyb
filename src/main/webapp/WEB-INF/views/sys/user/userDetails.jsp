<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="me_content_right">
       <div class="me_four_pop_right fl">
    	  <div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/user/">用户管理</a>
            <span style="margin-left:2px;">></span>
            <span>详情</span>
         </div>
         <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">姓名：</span>
                <span class="me_search_span">${user.name}</span>		
            </div>
        </div>
         <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">账号：</span>
                <span class="me_search_span">	${user.loginName}	</span>		
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">用户类型：</span>
                <span class="me_search_span">	${fns:getDictLabel(user.type,'user_type', '无')}	</span>	
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">使用状态：</span>
                <span class="me_search_span">
                <c:if test="${user.onState == 0}">正在使用</c:if>
                <c:if test="${user.onState == 1}">停止使用</c:if>
				</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">角色管理：</span>
                 <span class="me_search_span">${user.roleNames}</span>
            </div>
        </div>
        <c:if test="${user.type != 3}"> 
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">机构：</span>
                 <span class="me_search_span">${user.person.organization.name}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">部门：</span>
                 <span class="me_search_span">${user.person.department.name}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">手机号：</span>
                 <span class="me_search_span">${user.person.phone}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮箱：</span>
                 <span class="me_search_span">${user.person.email}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注：</span>
                 <span class="me_search_span">${user.person.remarks}</span>
            </div>
        </div>
      </c:if>
       <div class="cb"></div>
        <div class="me_qd_qx mt70">
        <c:if test="${user.type != 3}">
	        <input type="button" onclick="location.href='${ctx}/sys/user'" class="me_button_two mr20" value="返回">
	    </c:if>
	    <c:if test="${user.type == 3}">
	        <input type="button" onclick="location.href='${ctx}/sys/user/student'" class="me_button_two mr20" value="返回">
	    </c:if>
        </div>
    </div>
	</div>
</body>

</html>