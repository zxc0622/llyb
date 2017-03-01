<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>编码管理-后台</title>
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
select{height:32px;}
table th{border-bottom: 1px solid #ccc;}
table td{border-bottom: 1px dashed #ccc;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>后台管理>编码管理</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">编码管理</span>
        </div>
        <form action="">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">搜索 :</div>
                <input class="fl m_r15" value="${searchName}" type="text" placeholder="输入要搜索的姓名">
                <a class="btn fl search" href="javascript:void(0)">搜索</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">姓名 :</div>
                <input class="fl m_r15" value="${name}" type="text" placeholder="输入姓名">
                <a class="btn get_code fl " href="javascript:void(0)">生成编码</a>
            </div>
            <div class="tab_main_row clearfix" >
                <div class="fl m_r15">链接:</div>
                <input style="width: 285px;" value="${href}" class="fl m_r15" type="text" placeholder="链接编码"readonly>
            </div>
            <div class="tab_main_row clearfix">
                <div class="m_r15">链接列表 :</div>
                <table style="width:715px;">
                    <tr>
                        <th>姓名</th>
                        <th>链接</th>
                        <th style="width:85px">生成时间</th>
                        <!-- <th>操作</th> -->
                    </tr>
                    <c:forEach items="${saleCodeList}" var="saleCode">
                    <tr>
                        <td >${saleCode.name}</td>
                        <td style="max-width:500px">
                            ${saleCode.href}
                        </td>
                        <td>${fn:substring(saleCode.create_date,0,10)}</td>
                       <%--  <td style="width:66px"><a href="javascript:goUrl('${ctx}/salesmancode/delete?id=${saleCode.id}')"class="isgreen">删除</a></td> --%>
                    </tr>
                    </c:forEach>
                    <!-- <tr>
                        <td >凡达方法</td>
                        <td >
                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                        </td>
                        <td style="max-width:500px">2016-01-06</td>
                        <td style="width:66px"><a href="javascript:void(0)"class="isgreen">删除</a></td>
                    </tr>
                    <tr>
                        <td >凡达方法</td>
                        <td style="max-width:500px">
                            xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                        </td>
                        <td>2016-01-06</td>
                        <td style="width:66px"><a href="javascript:void(0)"class="isgreen">删除</a></td>
                    </tr> -->
                </table>
           <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                </div> -->
            </div>
            
            <!--筛选结果-->
            <!--翻页-->
                    
             <div class="filp_box">
                 <div class="filp">
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}"/>
		            <c:set var="totalRow" scope="page" value="${recordPage.totalRow}"/>
		            <c:set var="currentPage" value="${recordPage.pageNumber}"/>
		            <c:set var="totalPage" value="${recordPage.totalPage}"/>
		            <c:set var="actionUrl" value="${ctx}/salesmancode/"/>
		            <c:set var="urlParas" value="?searchName=${searchName}"/>
		            <c:set var="pageSizeParaName" value="pageSize"/>
            <%@ include file="/WEB-INF/views/pager/_paginate.jsp" %>
                 </div>
             </div> 
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
    	//生成编码
    	$(".get_code").click(function(){
    		var name = $(this).parent().find("input").val();
    		$.ajax({
    			type:"post",
    			url:"${ctx}/salesmancode/getCode",
    			data:"name="+name,
    			async:false,
    			success:function(data){
    				if(data.isSuccess == true){
    					location.href="${ctx}/salesmancode?name="+data.obj.name+"&href="+data.obj.href;
    					parent.showMess(data.msg);
    				}else{
    					parent.showMess(data.msg);
    				}
    				
    			}
    		});
    	});
    	//搜索
    	$(".search").click(function(){
    		var searchName = $(this).parent().find("input").val();
    		goUrl("${ctx}/salesmancode?searchName="+searchName);
    	});
    });
               
</script>
</body>
</html>