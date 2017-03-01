<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>企业_公司介绍</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/qiye_style.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
            <!-- qy_m_r 中间右侧 -->
            <div class="qy_m_r">
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>公司介绍</span>
                    </div>
                    <div class="qy_m_r_d_main">
                        <p>${companyList.shopDesc}</p>
                    </div>
                </div>
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>公司档案</span>
                    </div>
                    <div class="qy_m_r_d_main">
                        <table class="qiye_dang_an">
                           <tr>
	                    	<th>公司名称</th>
		                        <td>${company.companyname}</td>
		                        <th>公司地址</th>
		                        <td>${company.address}</td>
	                       </tr>
		                    <tr>
		                    	<th>公司类型</th>
		                        <td>${company.enterprisetype}</td>
		                        <th>公司电话</th>
		                        <td>${company.phoneenterprise}</td>
		                    </tr>
		                    <tr>
		                    	<th>主营业务</th>
		                        <td>${company.major}</td>
		                        <th>公司传真</th>
		                        <td>${company.companyfax}</td>
		                    </tr>
		                    <tr>
		                    	<th>行业类别</th>
		                        <td>${company.name}</td>
		                        <th>公司邮箱</th>
		                        <td>${company.email}</td>
		                    </tr>
		                    <tr>
		                    	<th>营业执照</th>
		                        <td>
                                    <c:if test="${company.licenseimg == null || company.licenseimg == ''}">
                                        <img style="width:20px;height:16px;display:block;" src="${ctxStatic}/img/llhb/icon_1.png"/>
                                    </c:if>
                                    <c:if test="${company.licenseimg != null && company.licenseimg != ''}">
                                        <img style="width:80px;height:60px;display:block;" src="${company.licenseimg}" onclick="popPic('${company.licenseimg}')"/>
                                    </c:if>
                                </td>
		                        <th>邮政编码</th>
		                        <td>${company.postalcode}</td>
		                    </tr>
		                    <tr>
		                        <th>申请人信息</th>
		                        <td colspan=3>${company.username}</td>
		                    </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- qy_m_r 中间右侧结束 -->
<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script>
var layer;
layui.use(['layer'],function(){layer = layui.layer;});
$(function(){
	$(".gongsijieshao").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
});
    function popPic(pic){
        layer.open({
            type: 1,
            title:false,
            area: ['600px', '360px'],
            shadeClose: true, //点击遮罩关闭
            closeBtn: 0,
            content: '<img src="'+pic+'" style="width:100%;height:100%;" onclick="layer.closeAll();"/>'
        });
    }
</script>
</body>
</html>


