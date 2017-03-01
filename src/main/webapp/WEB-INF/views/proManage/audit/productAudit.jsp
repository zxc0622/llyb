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
/*标题绿色*/
.tab_main_result table tr td:nth-of-type(2):hover{color:#5cb531;}
.tab_main_result table tr th{text-indent:5px;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>商品管理</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span onclick="goUrl('${ctx}/proManage/add')">添加商品</span>
            <span onclick="goUrl('${ctx}/proManage/issue')">已发布</span>
            <span class="cur_tab">审核中</span>
            <span onclick="goUrl('${ctx}/proManage/notAgree')">未通过</span>
            <span onclick="goUrl('${ctx}/proManage/past')">已过期</span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="pro_type" onChange="" >
                	<option value="0">所有分类</option>
                	<c:forEach var="type" items="${listType}">
                		<option value="${type.id}">${type.name}</option>
                	</c:forEach>
                </select>
                <input id="pro_name" type="text" style="width:330px"/>
                <input id="search" data-model="4" type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input id="clear_all" type="button" value="重置"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table id="table_audit" data-num="${num}">
                	<tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
                        <th style="width:110px">图片</th>
                        <th style="width:120px">标题</th>
                        <th style="width:120px">商品类别</th>
                        <th style="width:130px">添加时间</th>
                        <th style="width:120px">浏览</th>
                        <th style="width:60px">管理</th>
                    </tr>
                   
               	  <c:forEach var="proList" items="${auditList}">
               	  	<c:if test="${proList.auditCount ne 0}">
	                <tr id="${proList.id}" >  
                 		<td><input class="del_choose" type="checkbox" name="choose" ></td>
                 		<c:choose>
                 		<c:when test='${not empty proList.pic1}'>
                 		<td><img src='${proList.pic1}' width="82px" height="60px"></td>
                 		</c:when>
                 		<c:when test="${not empty proList.pic2 }">
                 		<td><img src='${proList.pic2}' width="82px" height="60px"></td>
                 		</c:when>
                 		<c:otherwise>
                 		<td><img src='${proList.pic3}' width="82px" height="60px"></td>
                 		</c:otherwise>
                 		</c:choose>
	                  	<td>${proList.pro_name}</td>
	                  	<td>${proList.name}</td> 
	                  	<td>${proList.create_date}</td>
	                  	<td>${proList.page_view}</td>
	                   	<td>
	                   	   <a onclick="goUrl('${ctx}/proManage/add?id=${proList.id}')" class="tr_manage tr_manage_1">&nbsp;</a>
	                       <a class="tr_manage tr_manage_2">&nbsp;</a>
	                       <h6>修改</h6>
	                       <h6>删除</h6>
	                   	</td>
	                 </tr> 
	                 </c:if>
                   </c:forEach>
                  
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all" style="margin-right:120px">
                	<input id="del_selected" type="button" value="删除选中"/>
                </div>
                <div class="filp">
                	<input id="prev_page" type="button" value="上一页" style="width:60px;"/>
                    <input id="next_page" type="button" value="下一页" style="width:60px;"/>
                    <a >共<span id="audit_count">${auditCount}</span><span>条</span><span id="cur_page">${curPage}</span><span>/</span><span id="count_page">${countPage}</span>页</a>
                    <input id="page_num" value="1" type="text" style="width:30px;">
                    <input id="go_page" type="button" value="跳转" style="width:60px;">
			                    每页显示<input type="text" id="fenye" style="width:30px;" value="${num}">条
			        <input id="changePageSize" type="button" value="确定" style="width:60px;">
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
	
	//<!--管理的修改删除-->
	$(document).ready(function(){
		$("h6").hide();
	});
	$("#table_audit").on("mouseover",".tr_manage",function(){
		x=$(".tr_manage").index(this);
		$("h6:eq("+x+")").show();
	});
	$("#table_audit").on("mouseout",".tr_manage",function(){
		x=$(".tr_manage").index(this);
		$("h6:eq("+x+")").hide();
	});
	var searchModel = 4; 
    function search(){
    	var typeValue = $("#pro_type option:selected").val();
    	var proName = $("#pro_name").val();
		if(typeValue!=0 && proName!=""){
			searchModel = 1;
		}else if(typeValue!=0 && proName==""){
			searchModel = 2;
		}else if(typeValue==0 && proName!=""){
			searchModel = 3;
		}else if(typeValue==0 && proName==""){
			searchModel = 4;
		}
    }
    //查询
	$("#search").click(function(){
		search();
		$(this).attr("data-model",searchModel);
		var curPage = $("#cur_page").html();
		selectAudit(1);
	});
	//查询方法
	function selectAudit(curPage){
		searchModel = $("#search").attr("data-model");
		//pageSize = $("#changePageSize").prev().val();
		if(searchModel != ""){
			var stt = "";
			var stth = "<tr>"
		                +"<th style='width:20px'><input type='checkbox' name='allChecked' onClick='SelectAll()'></th>"
		                +"<th style='width:110px'>图片</th>"
		                +"<th style='width:120px'>标题</th>"
		                +"<th style='width:120px'>商品类别</th>"
		                +"<th style='width:130px'>添加时间</th>"
		                +"<th style='width:120px'>浏览</th>"
		                +"<th style='width:60px'>管理</th>"
                	  +"</tr>";
            window.parent.document.getElementById('rightIframe').height = 0;
			$.ajax({
				type:"get",
				url:"${ctx}/proManage/audit/searchAudit",
				data:"typeValue="+$("#pro_type option:selected").val()+"&searchModel="+searchModel
					+"&proName="+$("#pro_name").val()+"&curPage="+curPage+"&pageSize="+pageSize,
				success:function(data){
					//var num = $("#table_audit").attr("data-num");//获取每页条数
					$.each(data,function(index,item){
						if(item.auditCount != 0){
							var pic = "";
							if(item.pic1 != null && item.pic1 != ""){
								pic = item.pic1;
							}else if(item.pic2 != null && item.pic2 != ""){
								pic = item.pic2;
							}else{
								pic = item.pic3;
							}
							stt +="<tr id="+item.id+" >"
									+"<td><input class='del_choose' type='checkbox' name='choose' ></td>"
				                  	+"<td><img src='"+pic+"' width='82px' height='60px'></td>"
				                  	+"<td>"+item.pro_name+"</td>"
				                  	+"<td>"+item.name+"</td>"
				                  	+"<td>"+item.create_date+"</td>"
				                  	+"<td>"+item.page_view+"</td>"
				                   	+"<td>"
				                       +"<a class='tr_manage tr_manage_2'>&nbsp;</a>"
				                       +"<h6>删除</h6>"
				                   	+"</td>"
				                 +"</tr> " ;
							 
						}
						pageSize = item.num;
						$("#audit_count").html(item.auditCount);
						$("#cur_page").html(item.curPage);
						$("#count_page").html(Math.ceil(item.auditCount/item.num));
					});
					$("#table_audit").html(stth+stt);
					$("h6").hide();
					var mainHeight = $(".main_right").height();
					window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
				}
			})
		}
	}
    //重置
    $("#clear_all").click(function(){
    	$("#pro_type option").eq(0).prop("selected",true);
        $("#pro_name").val("");
    });
    //从表格里删除
    $("#table_audit").on("click",".tr_manage_2",function(){
    	var id = $(this).parent().parent().attr("id")+",";
    	delAudit(id);
    });
    //删除所选
    $("#del_selected").click(function(){
    	var id ="";
    	var trLen = $("#table_audit tr").length;
    	for(var i=1; i<trLen; i++){
    		if($("#table_audit tr").eq(i).find(".del_choose").prop("checked")){
    			id += $("#table_audit tr").eq(i).attr("id")+",";
    		}
    	}
    	delAudit(id);
    });
    //删除审核中的商品
    function delAudit(id){
    	$.ajax({
    		type:"post",
    		url:"${ctx}/proManage/audit/delAudit",
    		data:"id="+id,
    		success:function(data){
    			var curPage = $("#cur_page").html();
    			var countPage = $("#count_page").html;
    			if(parseInt(curPage)<parseInt(countPage)){
    				selectAudit(curPage);//
    			}else{
    				selectAudit(curPage-1);//从查询上页的内容
    			}
    		}
    	})
    }
    //上一页
    $("#prev_page").click(function(){
    	var curPage = $("#cur_page").html();
    	var countPage = $("#count_page").html();
    	if(parseInt(curPage)>1){
    		curPage--;
    		selectAudit(curPage);
    		$("#cur_page").html(curPage);
    	}
    });
    //下一页
    $("#next_page").click(function(){
    	var curPage = $("#cur_page").html();
    	var countPage = $("#count_page").html();
    	debugger;
    	if(parseInt(curPage)<parseInt(countPage)){
    		curPage++;
    		selectAudit(curPage);
    		$("#cur_page").html(curPage);
    	}
    });
    //跳转页面
    $("#go_page").click(function(){
    	var pageNum = $("#page_num").val();
    	var countPage = $("#count_page").html();
    	var re = /^[0-9]+$/;
    	if(re.test(pageNum) && parseInt(pageNum)<=parseInt(countPage)){
    		$("#cur_page").html(pageNum);
    		selectAudit(pageNum);
    	}
    });
    //每页条数更改
    var pageSize="";
    $("#changePageSize").click(function(){
    	pageSize = $(this).prev().val();
    	var re = /^[0-9]+$/;
    	if(pageSize!="" && parseInt(pageSize)>=1 && re.test(pageSize)){
    		//alert(pageSize);
    		selectAudit(1)
    	}else{
    		parent.showMess("请输入正确的显示条数");
    	}
    })
   
</script>
</body>
</html>