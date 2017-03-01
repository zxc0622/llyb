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
.tab_main .tab_main_row{height:auto}
.tab_main_row ul li{float:left; margin:20px;}
.tab_main_row ul .t_m_li_left{margin-left:17px}
.tab_main_row ul .t_m_li_right{float:right}
.tab_main_row ul li select{width:150px;}
.tab_main_row .t_m_ul_s{padding-right:36px;}
/*标题绿色*/
.tab_main_result table tr{height:50px;}
.tab_main_result table tr td:nth-of-type(2):hover{color:#5cb531;}
.tab_main_result table tr th{text-indent:5px;}
.tab_main_result table tr td a:hover{cursor:pointer;color:#5cb531}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>系统管理>账号列表</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span class="cur_tab">账号列表</span>
        </div>
        <form action="${ctx}/dataCollection/user" method="post">
        	<!--行业分类筛选-->
            <div class="tab_main_row clearfix">
	            <ul>
	            	<li><span>账号：</span><input name="account" value="${account}" type="text" style="width:150px; magin-right:50px;"/></li>
		            <li><span>姓名：</span><input name="name" value="${name}" type="text" style="width:150px; magin-right:50px;"/></li>
		            <li><span>手机号：</span><input name="phone" value="${phone}" type="text" style="width:150px; magin-right:50px;"/></li>
	            </ul>
	            <ul class="t_m_ul_s">
	            	<li class="t_m_li_left">
	            		<span>类型：</span>
	            		<select name="type" id="pro_type" onChange="" >
	                	<option value="">选择用户类型</option>
	                	<c:forEach var="type" items="${dictList}">
	                		<option value="${type.value}">${type.label}</option>
	                	</c:forEach> 
	                	</select>
	                </li>
	                <li class="t_m_li_right"><input onclick="searchCret()" type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white; margin-right:10px;"/>
	                <input id="clear_all" type="button" onclick="clearAll()" value="重置"/></li>
	            </ul>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table id="table_audit">
                	<tr>
                		<th style="width:100px">序号</th>
                        <th style="width:110px">账号</th>
                        <th style="width:120px">用户类型</th>
                        <th style="width:120px">姓名</th>
                        <th style="width:130px">手机号</th>
                        <th style="width:60px">查看</th>
                    </tr>
                   
               	   	<c:forEach var="user" items="${userList}">
               	  	<c:if test="${user.auditCount ne 0}">
	                <tr id="${user.id}" >  
	                	<td>${user.row_num}</td>
	                  	<td>${user.login_name}</td>
	                  	<td>${user.n_label}</td> 
	                  	<td>${user.name}</td>
	                  	<td>${user.sp_phone}</td>
	                   	<td>
	                   		<c:if test="${user.u_r eq 0}">
	                       	<a href="javascript:goUrl('${ctx}/dataCollection/user/person?id=${user.sp_userid}')">详情</a>
	                   		</c:if>
	                   		<c:if test="${user.u_r eq 1}">
	                       	<a href="javascript:goUrl('${ctx}/dataCollection/user/company?id=${user.sc_id}&userId=${user.sc_user_id}')">详情</a>
	                   		</c:if>
	                   	</td>
	                 </tr> 
	                 </c:if>
                   </c:forEach> 
                  
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
				<c:set var="pageSize" scope="page" value="${recordPage.pageSize}"/>
                <c:set var="totalRow" scope="page" value="${recordPage.totalRow}"/>
                <c:set var="currentPage" value="${recordPage.pageNumber}"/>
                <c:set var="totalPage" value="${recordPage.totalPage}"/>
                <c:set var="actionUrl" value="${ctx}/dataCollection/user/"/>
                <c:set var="urlParas" value="?account=${account}&name=${name}&phone=${phone}&type=${type}"/>
                <c:set var="pageSizeParaName" value="pageSize"/>
                <%@ include file="/WEB-INF/views/pager/_paginate.jsp" %>
            </div>
		</form>
        
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
	/* //上一页
	$(".prev_page").click(function(){
		var curPage = $(".filp a span").eq(1).html();//获取当前页码
		if(curPage!=1){
			curPage--;
			location.href="${ctx}/dataCollection/user?pageNumber="+curPage+"&account=${account}&name=${name}&phone=${phone}&type=${type}";
			}
	});
	//下一页
	$(".next_page").click(function(){
		var curPage = $(".filp a span").eq(1).html();//获取当前页码
		var totalPage =  $(".filp a span").eq(2).html();//获取总页数
		if(curPage!=totalPage){
			curPage++;
			location.href="${ctx}/dataCollection/user?pageNumber="+curPage+"&account=${account}&name=${name}&phone=${phone}&type=${type}";
		}
	}); 
	//跳转
   	$(".filp input:last").click(function(){
   		var curPage = $(".filp :text:last").val();
   		var totalPage =  $(".filp a span").eq(2).html();//获取总页数
   		if(parseInt(curPage)<=parseInt(totalPage) && parseInt(curPage)>=1){
   			location.href="${ctx}/dataCollection/user?pageNumber="+curPage+"&account=${account}&name=${name}&phone=${phone}&type=${type}";		
   		}
   	}); */
 	//重置
    function clearAll(){
    	$(".tab_main_row ul:eq(0) li input").val("");
    	$(".t_m_ul_s .t_m_li_left select option[value='']").prop("selected",true);
    }
	//选择用户类型
	$(function(){
		if("${type}"!=null && "${type}"!=""){
			$(".t_m_ul_s .t_m_li_left select option[value="+'${type}'+"]").prop("selected",true);
		}
	})
	
</script>
</body>
</html>