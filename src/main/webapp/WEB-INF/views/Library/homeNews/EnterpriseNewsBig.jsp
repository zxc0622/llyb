<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>企业_新闻中心_大图</title>
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
                        <span>新闻中心</span>
                        
                    </div>
                    
                    <div class="qy_m_r_d_main">
                        <div class="xinwen_detail">
                        <c:forEach items="${ newsList}" var="newList">
                        <c:choose>
                        	<c:when test="${flagS==newList.shang}">
	                            <h5>${newList.title }</h5>
	                            <p class="sub-title">
	                                <span>来源:${newList.infoSrc}</span><span>发布时间：${newList.createDate}</span><span>作者：${newList.infoAuthor }</span>                 
	                            </p>
	                            <p>${newList.newsDesc}</p>
	                            <img src="${newList.newsPic}" alt="">
	                            <div class="btns">
	                                <a href="${ctx}/homepage/news/${enterpriseId}">返回</a>
	                                <a href="javascript:clickUPDown('${newList.id}',0,'${newList.shopId}');">上一篇</a>
	                                <a href="javascript:clickUPDown('${newList.id}',1,'${newList.shopId}');">下一篇</a>
	                            </div>
                        	</c:when>
                        	<c:when test="${fn:length(newsList)<2}">
                        		<c:if test="${newList.shang==2}">
	                        		  <h5>${newList.title}</h5>
		                            <p class="sub-title">
		                                <span>来源:${newList.infoSrc}</span><span>发布时间：${newList.createDate}</span><span>作者：${newList.infoAuthor }</span>                 
		                            </p>
		                            <p>${newList.newsDesc}</p>
		                            <img src="${newList.newsPic}" alt="">
		                            <div class="btns">
		                                <a href="${ctx}/homepage/news/${enterpriseId}">返回</a>
		                                <c:if test="${flagS==1}">
		                                	<a href="javascript:clickUPDown('${newList.id}',0,'${newList.shopId}');">上一篇</a>
		                                	<a class="has-none">下一篇</a>
		                                </c:if>
		                                  <c:if test="${flagS==0}">
		                                	<a class="has-none" >上一篇</a>
		                                	<a href="javascript:clickUPDown('${newList.id}',1,'${newList.shopId}');">下一篇</a>
		                                </c:if>
		                                
		                            </div>
	                            </c:if>
                        	</c:when> 
                        </c:choose>
                        	
                        </c:forEach>
                        </div>
                    </div>
                </div>
                
                
            </div>
            <!-- qy_m_r 中间右侧结束 -->
<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>
<script>
$(function(){
	$(".xinwenzhongxin").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
});
function clickUPDown(obj,str,shopId){
	var str1='${enterpriseId}';
	window.location.href="${ctx}/Library/homeNews/enterpriseNewsBig?bigId="+obj+"&flag="+str+"&shopId="+shopId+"&enterpriseId="+str1+"";
}

</script>
</body>
</html>


