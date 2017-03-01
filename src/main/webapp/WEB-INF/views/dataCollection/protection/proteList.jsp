<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>数据收集-环保报价列表</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
/*标题绿色*/
.tab_main_result table tr td:nth-of-type(3):hover{color:#5cb531;}


</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>数据收集>环保报价</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span class="cur_tab">环保报价</span>
          
        </div>
        <form action="">
            <!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="leibie" onChange="" >
                    <option value="0">所有分类</option>
                    <option value="1">环评报价</option>
                    <option value="2">监测报价</option>
                </select>
                <input type="text" style="width:330px"/>
                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
                <table>
                    <tr>
						<th style="width:40px">编号</th>
                        <th style="width:80px">姓名</th>
                        <th style="width:63px">服务类型</th>
                        <th style="width:85px">项目地点</th>
                        <th style="width:66px">申请时间</th>
                        <th style="width:150px">项目情况</th>
						<th style="width:80px">操作</th>
                    </tr>
                   <c:forEach items="${lists }" var="s" varStatus="sta">

		                        <tr>
									<td>${sta.count}</td>
		                            <td>${s.name }</td>
		                            <c:if test="${s.num eq 1 }">
			                            <td>环评报价</td>
		                            </c:if>
		                             <c:if test="${s.num eq 2 }">
			                            <td>监测报价</td>
		                            </c:if>
		                            <td>${s.aaname }</td>
		                            <td>${fn:substring(s.date, 0, 10)}</td>
		                            <td style="color:black">公司名为${s.comp_name },项目名称为${s.pro_name },该项目位于${s.aaname }${s.ssaname},电话为${s.tel }</td>
									<td>
										<a href="javascript:deleteRe('${s.num}','${s.eid}')" style="position:relative;color: #5ec520;">删除</a>&nbsp;&nbsp;<a href="javascript:details('${s.num}','${s.eid}')" style="position:relative;color: #5ec520;">详情</a>
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
				  <c:set var="actionUrl" value="${ctx}/dataCollection/protection/proteList/"/>
				  <c:set var="urlParas" value="?leibie=${leibie }&title=${title }" />
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
    $(function(){
    	 $("#leibie option").each(function (){
    		 if('${leibie}'== $(this).val()){
    			 $(this).attr('selected','selected');
    		 }
    	 });
    	 if('${title}'){
    		 $(".tab_main_row :text").val('${title}');
    	 }
    	//搜索
    	$(".tab_main_row :button:eq(0)").click(search);
    	
    	//重置
    	$(".tab_main_row :button:eq(1)").click(reset);

    });
    function search(){
		var a = $(".tab_main_row select:eq(0)").val();
		var t =  $(".tab_main_row :text").val();
		window.location.href="${ctx}/dataCollection/protection/proteList?leibie="+a+"&title="+t;
	}
	function reset(){
		$(".tab_main_row select:eq(0)").val('');
		$(".tab_main_row :text").val('');
	}  


	//删除
	function  deleteRe(num,eid){
		parent.showMessYes("确定删除？");
		$(".yes-btn", window.parent.document).unbind().on("click",function(){
			$(".pl_yesorno", window.parent.document).hide();
		$.ajax({
			type : "POST",
			url : "${ctx}/dataCollection/protection/delete",
			data : "num=" + num+"&eid=" + eid,
			dataType: 'text',
			success: function(data) {
				parent.showMess(data);
				location.reload();
			}
		});
		});
	}
	function  details(num,eid){
		var a = $(".tab_main_row select:eq(0)").val();
		var t =  $(".tab_main_row :text").val();
		if(num == 1){
			//环评
			window.open("${ctx}/protection/table?pid="+eid+"&bs=1","_blank");
			//location.href="${ctx}/protection/table?pid="+eid;
		}else if(num == 2){
			//监测
			window.open("${ctx}/protection/tableSur?pid="+eid+"&bs=1","_blank");
			//location.href="${ctx}/protection/tableSur?pid="+eid;
		}

	}
</script>
</body>
</html>
