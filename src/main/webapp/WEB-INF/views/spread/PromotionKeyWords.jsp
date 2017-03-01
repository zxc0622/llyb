<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/> 
<title>推广关键词列表</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
.isgreen{color:#5ec520;}

.tab_main .tab_main_row{height:auto;}
.tab_main_result table tr{height: auto;}
.tab_main_result table tr td{padding:3px;}
.sub_banzhu{margin:0 3px;}
.tab_main input[type="text"]{height:28px;width:150px;}
.m_r15{margin-right: 15px;}
.tab_main_row{margin-top: 10px;}
select{height:30px;}
table th{border-bottom: 1px solid #ccc;}
table td{border-bottom: 1px dashed #ccc;}


</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>推广关键词</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">推广关键词</span>
        </div>
        <form action="${ctx}/spread/spreadList" method="post" id="formID">
            <div class="tab_main_row clearfix">
                <select name="leibie" id="selectId">
                    <option value="a">请选择类型</option>
                    <option value="S">供应</option>
                    <option value="D">求购</option>
                    <option value="E">企业库</option>
                </select>
                <input type="text" name="spreadName" value="${spreadName}">
                <a href="javascript:search()" class="btn">查询</a>
                <a href="${ctx}/spread/infoSpread" class="btn">新增</a>
            </div>
            <div class="tab_main_row clearfix">
                <table style="width:715px;">
                    <tr>
                        <th>词条名称</th>
                        <th>类别</th>
                        <th>投放人</th>
                        <th>开始日期</th>
                        <th>结束日期</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${spreadList}" var="spreadList" varStatus="status">
                    <tr id="index${spreadList.id}">
                        <td >${spreadList.name}</td>
                        <c:choose>
                        	<c:when test="${spreadList.rankType=='S'}">
                        	 <td>供应推广</td>
                        	</c:when>
                        	<c:when test="${spreadList.rankType=='D'}">
                        	 <td>求购推广</td>
                        	</c:when>
                        	<c:otherwise>
                        	 <td>企业库推广</td>
                        	</c:otherwise>
                        </c:choose>
                        <td >
                            ${spreadList.compName}
                        </td>
                        <td>${spreadList.startTime}</td>
                        <td>${spreadList.endTime}</td>
                        <td style="width:66px">
                        <a href="javascript:updateSpread('${spreadList.id}')" class="isgreen">修改</a>
                        <a href="javascript:delSpread('${spreadList.id}')" class="isgreen">删除</a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
           <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                </div> -->
            </div>
                 <!--翻页-->
                    <div class="filp_box">
                        <div class="filp">
	                        <c:set var="currentPage" value="${recordPage.pageNumber}" />
							<c:set var="totalPage" value="${recordPage.totalPage}" />
							<c:set var="actionUrl" value="${ctx}/spread/spreadList/"/>
							<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
							<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                            <c:set var="pageSizeParaName" value="pageSize" />
                            <c:set var="urlParas" value="?spreadName=${spreadName}&leibie=${leibie }" />
							<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                        </div>
                    </div>
            <!--筛选结果-->
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
    	var str='${leibie}';
    	$("#selectId").find("option[value="+str+"]").attr("selected","selected");
    	
    });
    function search(){
    	$("#formID").submit();
    } 
    
  //删除单项
	function delSpread(obj){
		$.ajax({
    		type : "POST",
    		url : "${ctx}/spread/delSpread",
    		dataType : "json",
    		async : false,
    		data : "id=" + obj + "",
    		success : function(data) {
    			if(data==0){
    				$("#index"+obj).remove();
    			}
    			
    		}
    	}); 
	}
  // 修改
  function updateSpread(obj){
	  location.href="${ctx}/spread/infoSpread?id="+obj;
  }
</script>
</body>
</html>
