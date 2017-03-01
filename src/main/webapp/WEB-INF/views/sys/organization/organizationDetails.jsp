<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>机构管理</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="me_content_right">
       <div class="me_four_pop_right fl">
    	  <div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/organization/">机构管理</a>
            <span style="margin-left:2px;">></span>
            <span>机构详细信息</span>
         </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">机构类型：</span>
                <span class="me_search_span">	${fns:getDictLabel(organization.type,'sys_organization_type','无')}	</span>		
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">机构名称：</span>
                <span class="me_search_span">	${organization.name}	</span>	
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <span class="me_search_span">	${organization.principal}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">电话：</span>
                <span class="me_search_span">	${organization.tel}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">区域：</span>
                <span class="me_search_span">	${organization.area.name}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">地址：</span>
                <span class="me_search_span">	${organization.addr}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">传真：</span>
                <span class="me_search_span">	${organization.fax}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮政编码：</span>
                <span class="me_search_span">	${organization.postCode}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">邮箱：</span>
                <span class="me_search_span">	${organization.email}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注：</span>
                <span class="me_search_span">	${organization.remarks}	</span>
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="location.href='${ctx}/sys/organization/'" class="me_button_two mr20" value="返回">
        </div>
    </div>
	</div>
</body>

</html>