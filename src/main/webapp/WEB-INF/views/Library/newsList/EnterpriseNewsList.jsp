<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>企业_新闻中心_列表</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/qiye_style.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>
.qy_m_r_d_main .point-list li{font-size: 14px;padding:5px 0;}
.qy_m_r_d_main .point-list li a{width:500px;}
.qy_m_r_d_main .point-list li:not(:last-child){border-bottom:1px dashed #ccc;}
.dis_none{display: none;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
            <div class="qy_m_r">
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>新闻中心</span>
                        
                    </div>
                    
                    <div class="qy_m_r_d_main">
                        <ul class="point-list">
                        <c:forEach items="${newsList }" var="newsList">
                          <li><a  onclick="searchNews(${newsList.id },${enterpriseId})">${newsList.title}</a><span>${newsList.createDate}</span></li>                      
                        </c:forEach>
                        </ul>
                        <div class="fanye font_1 color_1">
                            <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
							<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" /> 
                            <c:set var="currentPage" value="${recordPage.pageNumber}" />
							<c:set var="totalPage" value="${recordPage.totalPage}" />
							<c:set var="actionUrl" value="${ctx}/homepage/news/${enterpriseId}"/>
							<%@ include file="/WEB-INF/views/pager/_paginate2.jsp"%>
                       </div>
                    </div>
                </div>
                
                
            </div>
            <!-- qy_m_r 中间右侧结束 -->
<%--<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>--%>
<script type="text/javascript">
function searchNews(obj,enterpriseId){
	window.location.href="${ctx}/Library/homeNews/enterpriseNewsBig?newsId="+obj+"&flag=2&enterpriseId="+enterpriseId+"";
}
$(function(){
	$(".xinwenzhongxin").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
})
</script>
</body>
</html>


