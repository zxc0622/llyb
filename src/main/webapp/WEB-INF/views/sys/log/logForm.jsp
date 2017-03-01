<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志详情</title>
	<meta name="decorator" content="default"/>
</head>
<body>
<form id="inputForm" action="${ctx}/sys/user/save" method="post">
	<input id="userId" type="hidden" name="user.id" value="${user.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
    	
    	<div class="me_secondary_nav">
            <span>系统管理</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/log/">日志列表</a>
            <span style="margin-left:2px;">></span>
            <span>详情</span>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">操作系统：</span>
                <span class="me_search_span">${log.platform}</span>	
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">浏览器信息：</span>
				<span class="me_search_span">${log.browser}</span>	            
			</div>
        </div>
        
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">提交方式：</span>
                <span class="me_search_span">${log.method }</span>                
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">异步请求：</span>
                <span class="me_search_span">${not empty log.isAjax?'yes':'no'}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">操作模块：</span>
                <span class="me_search_span">${log.moudle}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">执行动作：</span>
                <span class="me_search_span">${log.action }</span>
            </div>
        </div>
      
      <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">引用页：</span>
                <span class="me_search_span">${log.referer}</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">提交参数：</span>
                <span class="me_search_span">${log.parameter}</span>
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="location.href='${ctx}/sys/log/'" class="me_button_two" value="返回">
        </div>
    </div>

	</div>
	</form>
</body>
</html>