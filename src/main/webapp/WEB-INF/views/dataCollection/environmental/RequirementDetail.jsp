<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>信息管理-商品管理-审核中</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
/*搜索框样式*/
.main_des{float:left; margin-left:120px; margin-top:50px;} 
.main_des input{cursor:pointer; background-color:white;}
.main_des dl{width:220px;}
.main_des dl dt{font-size:18px; color:#333; font-weight:bolder;line-height:30px;margin-bottom:40px;}
.main_des dl dd{font-size:14px; color:#666; line-height:30px;display: block;}
.main_des dl dd span{margin-left:20px;}
.main_des input{width:102px; height:30px; line-height:30px; border:1px solid #ccc; text-align:center; margin-right:10px; margin-top:30px;}
.main_des input:hover{background-color:#5cb531; border:1px solid #5cb531; color:white}
.main_des_div{float:left;border:0px solid #ccc;width:100%;text-align: left;line-height: 30px;border-bottom: 1px dashed #CCC;}
.main_des .d_name{display: block;width:20%;float:left;border:0px solid red;}
.main_des .d_value{display: block;width:30%;float:left;border:0px solid red;}
.tab_main{height: 344px;}
.tab_main_result{margin-top: 3px;}
/*标题绿色*/
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>环保需求信息列表>需求详情</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span class="cur_tab">需求详情</span>
        </div>
         <div class="main_des" style="border:0px solid red;width:90%;margin-left:5%;margin-top: 60px;display: none;">
                        <dl style="width:100%;">
                            <dt style="text-align: center;border:0px solid yellow;width:100%;margin-bottom: 20px;color:red;">${requirement.remarks }</dt>
                            <c:set var="name" value="${requirement.name }"></c:set>
                            <c:set var="phone" value="${requirement.phone }"></c:set>
                            <c:set var="cName" value="${requirement.company_name }"></c:set>
                            <div class="main_des_div ">
                                <div class="d_name">公司名称</div>
                                <div class="d_value">${requirement.company_name }</div>
                                <div class="d_name">联系人</div>
                                <div class="d_value">${requirement.name }</div>
                            </div>
                            <div class="main_des_div " >
                                <div class="d_name">联系方式</div>
                                <div class="d_value">${requirement.phone }</div>
                                <div class="d_name">需求状态</div>
                                <div class="d_value" <c:if test="${requirement.trade_status == '已解决'}"> style='color:red;'</c:if> >${requirement.trade_status }</div>
                            </div>
                            <div class="main_des_div ">
                                <div class="d_name">需求时间</div>
                                <c:set var="createdate" value="${requirement.create_date }"></c:set>
                                <div class="d_value"><c:out value="${fn:substring(createdate,0,10) }"></c:out></div>
                            </div>
                            <div class="main_des_div">
                                <div class="d_name">需求描述</div>
                                <div class="d_value" style="width:80%;text-align: left;">${requirement.requirement_describe }</div>
                            </div>
                           <div class="main_des_div seeInfo" style="display:block" >
                              <c:if test="${empty companyNameList }">
                           			  <div class="d_value" style="width:80%;text-align: left; margin-left: -2px;color: red;">此信息还没有公司查看</div>
                              </c:if>
                              <c:if test="${!empty companyNameList }">
                                    <div class="d_value" style="width:80%;text-align: left; margin-left: -2px;">查看此信息的公司如下:</div>
                              </c:if>
                           </div>
                            <div class="main_des_div seeInfo" style="display:block">
                            	<c:forEach items="${companyNameList}" var="com">
                            	<c:choose>
                            	<c:when test="${fn:length(com.company_name)>6 }">
                            	<div class="d_name">
                            		<input type="button" value="${fn:substring(com.company_name,0,6) }**" style="background-color:#5cb531;color:white; margin-right:10px;"/>
                            	</div>
                            	</c:when>
                            	<c:otherwise>
                            	<div class="d_name">
                            		<input type="button" value="${com.company_name }" style="background-color:#5cb531;color:white; margin-right:10px;"/>
                                </div>
                                </c:otherwise>
                                
                           		</c:choose>
                            	</c:forEach>
                           </div>
                        </dl>
                    </div>
	</div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
	//搜索
	function searchCret(){
		$("form").submit();
	}
	
	//选择用户类型
	$(function(){
		if("${type}"!=null && "${type}"!=""){
			$(".t_m_ul_s .t_m_li_left select option[value="+'${type}'+"]").prop("selected",true);
		}
		
		 $(".main_des").css("display","block");
		    var h1 = $(".main_p_left").height();
		    var h2 = $(".main_des").height();
		    if(h2 > h1){
		        $(".main_des").css("margin-top",20 );
		        $(".main_p").css("height",h2+50);
		        $(".main_p_left").css("height",h2+50);
		        $(".pro_info").css("height",h2+50);
		    }else{
		        $(".main_des").css("margin-top",( h1- h2 )/3 );
		        $(".main_des").css("display","block");
		    }
	})
	
</script>
</body>
</html>