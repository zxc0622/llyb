<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<title>新注册用户列表</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>

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
.tab_main_result table tr th{text-indent:5px;}
.tab_main_result table tr td a:hover{cursor:pointer;color:#5cb531}
.tab_main_result table tr td:nth-of-type(6) {
	cursor: pointer;
	color: #000000;
}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>数据收集>新注册用户列表</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span class="cur_tab">新注册用户列表</span>
        </div>
        <form action="${ctx}/dataCollection/newUsers/query" method="post">
        	<!--行业分类筛选-->
            <div class="tab_main_row clearfix">
	            <ul>
	            	<li><span>账号：</span><input name="account" value="${account}" type="text" style="width:150px; magin-right:50px;"/></li>
		            <li><span>姓名：</span><input name="name" value="${name}" type="text" style="width:150px; magin-right:50px;"/></li>
					<li class="t_m_li_left">
						<span>类型：</span>
						<select name="type" id="pro_type" onChange="" >
							<option value="">选择用户类型</option>
							<option value='企业' <c:if test="${type eq '企业'}">selected </c:if> >企业</option>
							<option value='个人' <c:if test="${type eq '个人'}">selected </c:if> >个人</option>
						</select>
					</li>
	            </ul>
	            <ul class="t_m_ul_s">
	            	<li class="t_m_li_left">
	            		<span>时间：</span>
						<input id="startTime" name="startTime" type="text" class="mh_date" readonly style="width:100px;" value="${startTime}"/>&nbsp;~&nbsp;
						<input id="endTime" name="endTime" type="text" class="mh_date" readonly style="width:100px;" value="${endTime}"/>
	                </li>
	                <li class="t_m_li_right"><input onclick="search()" type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white; margin-right:10px;"/>
	                <input id="clear_all" type="button" onclick="clearAll()" value="重置"/></li>
	            </ul>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table id="table_audit">
                	<tr>
                        <th style="width:110px">公司名</th>
                        <th style="width:100px">注册时间</th>
                        <th style="width:100px">联系人</th>
                        <th style="width:100px">手机号</th>
                        <th style="width:100px">电话</th>
						<th style="width:100px">邮箱</th>
						<th style="width:60px">类型</th>
						<th style="width:60px">查看</th>
                    </tr>
                   
               	   	<c:forEach var="user" items="${page.list}">
	                <tr id="${user.id}" >
						<td>${user.company_name}</td>
	                	<td><fmt:formatDate value="${user.create_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	                  	<td>${user.lxr}</td>
	                  	<td>${user.phone}</td>
	                  	<td>${user.tel}</td>
	                  	<td>${user.email}</td>
						<td>${user.leibie}</td>
	                   	<td>
	                   		<c:if test="${user.leibie eq '个人'}">
	                       	<a href="javascript:goUrl('${ctx}/dataCollection/user/person?id=${user.id}')">详情</a>
	                   		</c:if>
	                   		<c:if test="${user.leibie eq '企业'}">
	                       	<a href="javascript:goUrl('${ctx}/dataCollection/user/company?id=${user.c_id}')">详情</a>
	                   		</c:if>
	                   	</td>
	                 </tr> 
                   </c:forEach>
                  
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
				<c:set var="pageSize" scope="page" value="${page.pageSize}"/>
                <c:set var="totalRow" scope="page" value="${page.totalRow}"/>
                <c:set var="currentPage" value="${page.pageNumber}"/>
                <c:set var="totalPage" value="${page.totalPage}"/>
                <c:set var="actionUrl" value="${ctx}/dataCollection/newUsers/query/"/>
                <c:set var="urlParas" value="?account=${account}&name=${name}&type=${type}&startTime=${startTime}&endTime=${endTime}"/>
                <c:set var="pageSizeParaName" value="pageSize"/>
                <%@ include file="/WEB-INF/views/pager/_paginate.jsp" %>
            </div>
		</form>
        
	</div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>

<script>
	$(function (){
		$("#startTime,#endTime").manhuaDate({
			Event : "click",//可选
			Left : 0,//弹出时间停靠的左边位置
			Top : -16,//弹出时间停靠的顶部边位置
			fuhao : "-",//日期连接符默认为-
			isTime : false,//是否开启时间值默认为false
			beginY : 1949,//年份的开始默认为1949
			endY :2100//年份的结束默认为2049
		});
	});

	//搜索
	function search(){
		$("form").submit();
	}
 	//重置
    function clearAll(){
    	$(".tab_main_row ul:eq(0) li input").val("");
    	$(".t_m_ul_s .t_m_li_left select option[value='']").prop("selected",true);
    }
	
</script>
</body>
</html>