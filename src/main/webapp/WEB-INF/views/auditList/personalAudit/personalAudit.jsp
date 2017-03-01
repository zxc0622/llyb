<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>系统审核-个人资料认证</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>系统审核>个人资料认证</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab"><a href="${ctx}/auditList/personalAudit?con=0">待认证</a></span>
            <span onclick=""><a href="${ctx}/auditList/personalAudit?con=1">已认证</a></span>
			<span onclick=""><a href="${ctx}/auditList/personalAudit?con=-1">未通过</a></span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="leibie" onChange="" >
                	<option value="">全部</option>
                    <option value="1">普通个人</option>
                    <option value="2">环保工程师</option>
                </select>

                
                <input type="text" value="${title }"/>

                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table>
                	<tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
						<th style="width:120px">类别</th>
                        <th style="width:120px">用户名</th>
                        <th style="width:160px">真实姓名</th>
						<th style="width:160px">手机号</th>
                        <th style="width:120px">注册时间</th>
                        <c:if test="${con == 0 }">
	                        <th style="width:60px">审核</th>
                        </c:if>
                         <c:if test="${con ne 0 }">
                        	<th style="width:120px">审核时间</th>
                        </c:if>
                         <c:if test="${con eq -1 }">
                        	<th style="width:120px">审核</th>
                        </c:if>
                    </tr>
                    <c:forEach items="${lists }" var="u">
                    	<tr>
                        <td><input type="checkbox" name="choose" ></td>
                        <c:if test="${u.type eq 1 }">
                        	<th>普通个人</th>
                        </c:if>
						<c:if test="${u.type eq 2 }">
                        	<th>环保工程师</th>
                        </c:if>
                        <c:if test="${u.type !=1 && u.type != 2  }">
                        	<th>无</th>
                        </c:if>
                        <th>${u.login_name }</th>
                        <td>${u.name }</td>
                        <td>${u.phone }</td>
                        <td>${fn:substring(u.time, 0, 10)}</td>
                         <c:if test="${con == 0 }">
	                        <td>
	                            <a href="${ctx}/auditList/personalAudit/checkDetails?id=${u.uid}" class="tr_manage_1" style="position:relative;">&nbsp;<h6>审核</h6></a>
	                        </td>
                        </c:if>
                         <c:if test="${con ne 0 }">
                        	<th>${fn:substring(u.dates, 0, 10)}</th>
                        </c:if>
                         <c:if test="${con eq -1 }">
                          <td>
	                            <a href="${ctx}/auditList/personalAudit/checkDetails?id=${u.uid}" class="tr_manage_1" style="position:relative;">&nbsp;<h6>审核</h6></a>
	                        </td>
                        </c:if>
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
				  <c:set var="actionUrl" value="${ctx}/auditList/personalAudit/"/>
				  <c:set var="urlParas" value="?leibie=${leibie }&title=${title }&con=${con }" />
					<c:set var="pageSizeParaName" value="paginateFenye" />
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
     $(function(){
    	if('${con}'==0){
    		$(".tab_title").find("span").eq(0).siblings().removeClass("cur_tab");
 			$(".tab_title").find("span").eq(0).addClass("cur_tab");
 		}
 		if('${con}'==1){
 			$(".tab_title").find("span").eq(1).siblings().removeClass("cur_tab");
 			$(".tab_title").find("span").eq(1).addClass("cur_tab");
 		}
 		if('${con}'==-1){
 			$(".tab_title").find("span").eq(2).siblings().removeClass("cur_tab");
 			$(".tab_title").find("span").eq(2).addClass("cur_tab");
 		}
    	 $("#leibie option").each(function (){
    		 if('${leibie}'== $(this).val()){
    			 $(this).attr('selected','selected');
    		 }
    	 });
    	
    	//搜索
    	$(".tab_main_row :button:eq(0)").click(search);
    	$(".tab_main_row :button:eq(1)").click(reset);


    
     });    
	function search(){
		var a = $(".tab_main_row select:eq(0)").val();
		var t =  $(".tab_main_row :text").val();
		window.location.href="${ctx}/auditList/personalAudit?leibie="+a+"&title="+t+"&con=${con}";
	}
	function reset(){
		$(".tab_main_row select:eq(0)").val('');
		$(".tab_main_row :text").val('');
	}
	

</script>
</body>
</html>