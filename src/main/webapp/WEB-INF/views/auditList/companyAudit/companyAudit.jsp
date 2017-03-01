<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>系统审核-公司资料认证</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
.tab_main_result table tr td{text-indent:0px;}
.tab_main_result table th{text-indent:0px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>系统审核>公司资料认证</div>
    <div class="tab_main">
        <div class="tab_title">
            <span ><a href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=0">待认证</a></span>
            <span ><a href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=1">已认证</a></span>
			<span ><a href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=-1">未通过</a></span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="companyTypeId" onChange="" >
                	<option value="0">全部</option>
                    <option value="3">产生废物</option>
                    <option value="4">处置废物</option>
					<option value="5">环保公司</option>
					<option value="6">其他</option>
                </select>

                
                <input type="text" id="companyName" value="${companyName}"/>

                <input type="button" value="搜索" onclick="searchCompanyName()" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置" onclick="resetName()"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table>
                	<tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
						<th style="width:120px">类别</th>
                        <th style="width:120px">公司名</th>
                        <th style="width:120px" id="userName">用户名</th>
                        <th style="width:160px">所在地</th>
						<th style="width:160px">行业</th>
                        <th style="width:120px">注册时间</th>
                        <th style="width:120px" id="shenheTime">审核时间</th>
                        <th style="width:60px" id="shenH">审核</th>
                    </tr>
                    <c:forEach items="${companyAll }" var="companyAll">
	                     <tr>
	                        <td><input type="checkbox" name="choose" ></td>
	                        <c:choose>
	                        	<c:when test="${companyAll.type=='3' }">
	                        		<th>产生废物</th>
	                        	</c:when>
	                        	<c:when test="${companyAll.type=='4' }">
	                        		<th>处置废物</th>
	                        	</c:when>
	                        	<c:when test="${companyAll.type=='5' }">
	                        		<th>环保公司</th>
	                        	</c:when>
	                        	<c:when test="${companyAll.type=='6' }">
	                        		<th>其他</th>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<th></th>
	                        	</c:otherwise>
	                        </c:choose>
							
	                        <th>${companyAll.companyname}</th>
	                        <th class="th_user_name">${companyAll.userName}</th>
	                        <td>${companyAll.prov}${companyAll.city}</td>
	                        <td>${companyAll.name }</td>
	                        <td>${companyAll.createDate }</td>
	                        <td class="td_time">${companyAll.approveDate }</td>
	                        <td>
	                            <a class="tr_manage_1 shenhe"  href="${ctx}/auditList/companyAudit/companyData?id=${companyAll.id}&userId=${companyAll.userId}&itemFlag=1" style="position:relative;">&nbsp;<h6>审核</h6></a>
	                      		<a class="tr_manage_1 chakan"  href="${ctx}/auditList/companyAudit/companyData?id=${companyAll.id}&userId=${companyAll.userId}&itemFlag=2" style="position:relative;">&nbsp;<h6>查看</h6></a>
	                        </td>
	                      </tr>
                    </c:forEach>
                   
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all">
                </div>
                <div class="filp">
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
					<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
					<c:set var="currentPage" value="${recordPage.pageNumber}" />
					<c:set var="totalPage" value="${recordPage.totalPage}" />
					<c:set var="pageSizeParaName" value="pageSize" />
					<c:set var="urlParas" value="?authFlag=${authFlag}&companyName=${companyName}&companyType=${companyType}" />
					<c:set var="actionUrl" value="${ctx}/auditList/companyAudit/companyAuditInit/"/>
					<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                </div>
            </div>
		</form>
	</div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>

<%--//上一页--%>
<%--$(".prev_page").click(function(){--%>
	<%--if('${currentPage}'!=1){--%>
		<%--window.location.href='${actionUrl}${currentPage - 1}${urlParas}?authFlag=${authFlag}';--%>
	<%--}--%>
<%--});--%>
<%--//下一页--%>
<%--$(".next_page").click(function(){--%>
	<%--if('${currentPage}'!='${totalPage}'){--%>
		<%--window.location.href='${actionUrl}${currentPage + 1}${urlParas}?authFlag=${authFlag}';--%>
	<%--}--%>
<%--});--%>
<%--//跳转--%>
 <%--$(" .filp input:last").click(function(){--%>
	<%--var text = $(".filp :text:last").val();--%>
	<%--window.location.href='${actionUrl}'+text+'${urlParas}?authFlag=${authFlag}';--%>
<%--});--%>
	<!--复选框-->
	function SelectAll() {
		 var checkboxs=document.getElementsByName("choose");
		 for (var i=0;i<checkboxs.length;i++) {
		  var e=checkboxs[i];
		  e.checked=!e.checked;
		 }
		 
	}
	
	$(function(){
		var str ='${authFlag}';
		var companyType= '${companyType}';
		if(str==0){
			$("#shenheTime").remove();
			$(".td_time").remove();
			$(".chakan").remove();
			$(".tab_title").find("span").eq(0).addClass("cur_tab");
		}
		if(str==1){
			$("#shenH").remove();
			$("#userName").remove();
			$(".th_user_name").remove();
			$(".shenhe").remove();
			$(".tab_title").find("span").eq(1).addClass("cur_tab");
		}
		if(str==-1){
			$(".tr_manage_1").remove();
			$("#shenH").remove();
			$("#userName").remove();
			$(".th_user_name").remove();
			$(".tab_title").find("span").eq(2).addClass("cur_tab");
		}
		$("#companyTypeId").val(companyType);
		
		
	});
		
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
    function searchCompanyName(){
		window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=${authFlag}&companyName="+$("#companyName").val()+"&companyType="+$("#companyTypeId").val()+"";	
	}
	//重置
	 function resetName(){
		$(".tab_main_row select").val('');
        $(".tab_main_row :text").val('');
		window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=${authFlag}&companyType="+'';	
    }
</script>
</body>
</html>
