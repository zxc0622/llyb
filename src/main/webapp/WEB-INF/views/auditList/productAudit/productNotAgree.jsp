<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>商品审核</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
    .tab_main_result table tr td:nth-of-type(6){cursor:pointer; color:#333;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>系统审核>商品审核</div>
    <div class="tab_main">
        <div class="tab_title">
            <span onclick="goUrl('${ctx}/auditList/productAudit')">待审核</span>
            <span onclick="goUrl('${ctx}/auditList/productAudit/pass')">已审核</span>
			<span class="cur_tab" onclick="">审核未通过</span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="" onChange="" >
                	<option value="">分类</option>
                	<c:forEach items="${pcrList}" var="pcr">
                	<c:choose>
                	<c:when test="${pcr.id eq typeFirst}">
                	<%-- <c:set var="proPcrId" value="${pcr.id}" scope="session"></c:set>
                	<c:set var="proPcrId" value="${pcr.name}" scope="session"></c:set> --%>
                	<option value="${pcr.id}" selected="selected">${pcr.name}</option>
                	</c:when>
                	<c:otherwise>
                	<option value="${pcr.id}">${pcr.name}</option>
                	</c:otherwise>
                	</c:choose>
                	</c:forEach>
                </select>

                
                <input id="proName" type="text" value="${proName}"/>

                <input id="search" type="button" value="搜索" onClick="searchPro()" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置" onclick="clearAll()"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table>
                	<tr>
                        <th style="width:20px"><input type="hidden" name="allChecked" onClick="SelectAll()"></th>
						<th style="width:120px">图片</th>
                        <th style="width:160px">标题</th>
                        <th style="width:120px">商品类别</th>
                        <th style="width:100px">发布人</th>
                        <th style="width:120px">发布时间</th>
                        <th style="width:120px">审核时间</th>


                        <!-- <th style="width:60px">查看</th> -->
                    </tr>
                    <c:forEach items="${proList}" var="pro">
                    <tr>
                        <td><input type="hidden" name="choose" value="${pro.id}"></td>
                        <c:choose>
                        <c:when test="${not empty pro.pic1}">
                        <th><img src="${pro.pic1}" style="width:80px; height:60px;"></th>
                        </c:when>
                        <c:when test="${not empty pro.pic2}" >
                        <th><img src="${pro.pic2}" style="width:80px; height:60px;"></th>
                        </c:when>
                        <c:otherwise>
                        <th><img src="${pro.pic3}" style="width:80px; height:60px;"></th>
                        </c:otherwise>
                        </c:choose>
                        <td>${pro.pro_name}</td>
                        <td>${pro.pcr_name}</td>
                        <td>${pro.company_name}</td>
                        <td><fmt:formatDate value="${pro.create_date}" type="both" pattern="yyyy-MM-dd" /></td>
                        <td><fmt:formatDate value="${pro.shenhe_time}" type="both" pattern="yyyy-MM-dd" /></td>

                    <%-- <td>
                            <a onclick="goUrl('${ctx}/auditList/productAudit/seeProDetail?id=${pro.id}')" style="position:relative;" class="tr_manage_1">&nbsp;<h6 style="display: none;">查看</h6></a>         
                        </td> --%>
                    </tr>
                    </c:forEach>
                  
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all">
                </div>
                <c:set var="pageSize" scope="page" value="${recordPage.pageSize}"/>
                <c:set var="totalRow" scope="page" value="${recordPage.totalRow}"/>
                <c:set var="currentPage" value="${recordPage.pageNumber}"/>
                <c:set var="totalPage" value="${recordPage.totalPage}"/>
                <c:set var="actionUrl" value="${ctx}/auditList/productAudit/notAgree/"/>
                <c:set var="urlParas" value="?typeFirst=${typeFirst}&proName=${proName}"/>
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
	<!--复选框-->
	function SelectAll() {
		 var checkboxs=document.getElementsByName("choose");
		 for (var i=0;i<checkboxs.length;i++) {
		  var e=checkboxs[i];
		  e.checked=!e.checked;
		 }
		 
	}
	
	<!--管理的修改删除-->
	$("h6").hide();
	$(".tr_manage_1").mouseover(function(){
		$(this).find("h6").show();
	});
	$(".tr_manage_2").mouseover(function(){
		$(this).find("h6").show();
	});
	$(".tr_manage_1").mouseout(function(){
		$("h6").hide();
	});
	$(".tr_manage_2").mouseout(function(){
		$("h6").hide();
	});
    /*  //上一页
   	$(".prev_page").click(function(){
   		var curPage = $(".filp a span").eq(1).html();//获取当前页码
   		if(curPage!=1){
   			curPage--;
   	   		location.href="${ctx}/auditList/productAudit/notAgree?pageNum="+curPage+"&typeFirst=${typeFirst}&proName=${proName}";
   		}
   	});
   	//下一页
   	$(".next_page").click(function(){
   		var curPage = $(".filp a span").eq(1).html();//获取当前页码
   		var totalPage =  $(".filp a span").eq(2).html();//获取总页数
   		if(curPage!=totalPage){
   			curPage++;
   	   		location.href="${ctx}/auditList/productAudit/notAgree?pageNum="+curPage+"&typeFirst=${typeFirst}&proName=${proName}";
   		}
   	});
  	//跳转
   	$(".filp input:last").click(function(){
   		var curPage = $(".filp :text:last").val();
   		var totalPage =  $(".filp a span").eq(2).html();//获取总页数
   		if(parseInt(curPage)<=parseInt(totalPage) && parseInt(curPage)>=1){
   	   		location.href="${ctx}/auditList/productAudit/notAgree?pageNum="+curPage+"&typeFirst=${typeFirst}&proName=${proName}";
   		}
   	}); */
   	//搜索
   	function searchPro(){
   		location.href="${ctx}/auditList/productAudit/notAgree?typeFirst="+$(".tab_main_row select option:selected").val()+"&proName="+$("#proName").val();
   	}
   	//重置
   	function clearAll(){
   		$(".tab_main_row select option[value='']").prop("selected",true);
   		$("#proName").val("");
   	}
 </script>
 </body>
</html>