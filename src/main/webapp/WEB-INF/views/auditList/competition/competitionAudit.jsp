<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>系统审核-竞价审核</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
	table img{width:80%;height:80%;max-height:60px;}
	.tab_main_result table tr th{padding:0 ;}
	.tab_main_result table tr td:nth-child(7) a h6{width:34px;}

	/*.tab_main_result table tr td:nth-of-type(6){color:#5cb531;}*/

	.auth span{float:left;overflow:visible;}
	.auth span:first-child{margin-right:0px;line-height:28px;}
	.auth .ge{width:28px;height:28px;background:url(${ctxStatic}/img/llhb/icons.png) -71px -178px no-repeat;right:70px;display:block;}
	.auth .qi{width:28px;height:28px;background:url(${ctxStatic}/img/llhb/icons.png) -140px -178px no-repeat;right:10px;display:block;}
	.auth .geno{width:28px;height:28px;background:url(${ctxStatic}/img/llhb/icons.png) -71px -228px no-repeat;right:70px;display:block;}
	.auth .qino{width:28px;height:28px;background:url(${ctxStatic}/img/llhb/icons.png) -140px -228px no-repeat;right:10px;display:block;}
	
	.tab_main_result table tr td{text-indent: 0px;padding-right: 15px;}
    .tab_main_result table th{text-indent: 0px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>系统审核>竞价审核</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab"><a href="${ctx}/auditList/competition?con=1">待审核</a></span>
            <span onclick=""><a href="${ctx}/auditList/competition?con=2">已审核</a></span>
			<span onclick=""><a href="${ctx}/auditList/competition?con=0">审核未通过</a></span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="leibie" onChange="" >
                	<option value="">行业</option>
                    <c:forEach items="${ps }" var="p">
                    	<option value="${p.id }">${p.name }</option>
                    </c:forEach>
                </select>

                
                <input type="text" value="${title }"/>

                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
				<c:if test="${con eq 1}">
					<input  onclick="passOrNot(2,'')" type="button" value="通过" />
					<input  onclick="parent.showText('请填写不通过的原因')" type="button" value="不通过" />
				</c:if>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table>
                	<tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
						<th style="width:120px">图片</th>
                        <th style="width:120px">标题</th>
                        <th style="width:160px">行业</th>
                        <th style="width:120px">发布时间</th>
						<th style="width:120px">发布人</th>
						<th style="width:160px">认证</th>
                        <c:if test="${con == 1 }">
		                      <th style="width:120px">审核</th>
                        </c:if>
                        <c:if test="${con ne 1 }">
                        	<th style="width:120px">审核时间</th>
                        </c:if>
                        
                    </tr>
                    <c:forEach items="${lists }" var="u">
                    	<tr>
	                        <td><input type="checkbox" name="choose" value="${u.iid}"></td>
	                        <c:if test="${not empty u.pic1 }">
	                        	<th><img src="${u.pic1 }"></th>
	                        </c:if>
	                       <c:if test="${empty u.pic1 && not empty u.pic2}">
	                        	<th><img src="${u.pic2 }"></th>
	                        </c:if>
	                        <c:if test="${empty u.pic1 && empty u.pic2 && not empty u.pic3}">
	                        	<th><img src="${u.pic3 }"></th>
	                        </c:if>
	                        <c:if test="${empty u.pic1 && empty u.pic2 &&empty u.pic3}">
	                        	<th><img src="${ctxStatic}/img/llhb/default.png"></th>
	                        </c:if>
	                        <td>${u.comp_title }</td>
	                        <td>${u.pname }</td>
	                        <td>${fn:substring(u.time, 0, 10)}</td>
							<td>${u.uname}</td>
							<td class="auth"><span>${u.types}</span><span class="${u.pauth}"></span><span class="${u.cauth}"></span></td>
	                        <c:if test="${con == 1 }">
		                        <td>
		                            <a class="tr_manage_1" href="${ctx}/auditList/competition/checkSee?paramId=${u.iid}" style="position:relative;color: #5EC520">&nbsp;<h6>审核</h6></a>
		                        </td>
                       		 </c:if>
                       		 <c:if test="${con ne 1 }">
		                        <td>${fn:substring(u.dates, 0, 10)}</td>
                       		 </c:if>
	                        <td>
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
				  <c:set var="actionUrl" value="${ctx}/auditList/competition/"/>
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
    	if('${con}'==1){
    		$(".tab_title").find("span").eq(0).siblings().removeClass("cur_tab");
 			$(".tab_title").find("span").eq(0).addClass("cur_tab");
 		}
 		if('${con}'==2){
 			$(".tab_title").find("span").eq(1).siblings().removeClass("cur_tab");
 			$(".tab_title").find("span").eq(1).addClass("cur_tab");
 		}
 		if('${con}'==0){
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
		window.location.href="${ctx}/auditList/competition?leibie="+a+"&title="+t+"&con=${con}";
	}
	function reset(){
		$(".tab_main_row select:eq(0)").val('');
		$(".tab_main_row :text").val('');
		var a = $(".tab_main_row select:eq(0)").val();
		var t =  $(".tab_main_row :text").val();
		window.location.href="${ctx}/auditList/competition?leibie="+a+"&title="+t+"&con=${con}";
	}
	


	function passOrNot(res,content){
		parent.hideMessYes();
		var value =[];
		$('input[name="choose"]:checked').each(function(){
			value.push($(this).val());
		});
		if(value == "" || value == null){
			parent.showMess("请选择！");
		}else{
			$.ajax({
				type:"POST",
				url:"${ctx}/auditList/competition/pass",
				data: "pid="+value+"&flag="+res+"&content="+content,
				dataType:'json',
				success:function(data){
					if(data == false){
						parent.showMess("审核失败!");
					}else{
						parent.showMess("审核成功!");
						window.location.href="${ctx}/auditList/competition?leibie=${leibie}&title=${title}&con=${con}";
					}
				}
			});
		}
	}
	function getText(content){
		var res = 'N';
		passOrNot(0,content);
	}
</script>
</body>
</html>