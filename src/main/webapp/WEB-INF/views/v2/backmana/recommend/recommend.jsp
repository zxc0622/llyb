<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>推荐服务</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/backmana/recommend/choose.css" /> 
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/layeruiPagingExt.js"></script>
</head>
<body>
	<div class="prwum">
		<p class="present">当前位置>信息管理>推荐服务</p>
		<h3>推荐服务</h3>
		<div class="serve">
			<div class="protection">
				<span class="hbfw">环保服务</span>
				<input class="hbfw_text" type="text">
				<span class="hbfw">提交时间</span>
				<input class="create_time" onclick="layui.laydate({elem: this, max: laydate.now()})">
				<input class="search_need" type="submit" value="搜索需求">
				<span class="push">推送</span>
			</div>
			<ul class="redact">
				<c:forEach items="${ss}" var="s">
					<li style="margin: 8px 0;">
						<input type="checkbox" class="pitch" data-id="${s.id}" data-phone="${s.phone}" data-name="${s.name}">
						<a href="javascript:void(0)"style="text-align: left;">${s.remarks}</a>
						<a href="javascript:void(0)">${s.company_name}</a>
						<a href="javascript:void(0)">${s.name}</a>
						<a href="javascript:void(0)">${s.phone}</a>
						<a href="javascript:void(0)">${s.trade_status}</a>
						<a href="javascript:void(0)"><fmt:formatDate pattern="yyyy-MM-dd" value="${s.create_date}" /></a>
					</li>
				</c:forEach>
			</ul>
			<div id="need_page">
			
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

var layer;
var loadLayer=layui.use(['layer'], function(){
	layer = layui.layer;
});

layui.use('laydate', function(){
	  var laydate = layui.laydate;
});

$(function(){
	//推送弹框
	$(".push").click(function(event) {
		parent.window.recommendCompany();
	});
	
	
	//需求分页
	paging("need_page", ${totalPage}, 1, function(divElSelector, obj, first){
			if(!first){
				getNeedByAjax(obj.curr);
			}
		},'#5ec520');
	
	//获取需求ajax方法
	function getNeedByAjax(pageNumber){
		var remarks = $(".hbfw_text").val();
		var createDate = $(".create_time").val();
		var totalPage = 0;
		$.ajax({
			type:"post",
			url:"${ctx}/backmana/recommend/getNeedForAjax",
			async:false,
			data:{
				remarks:remarks,
				createDate:createDate,
				pageNumber:pageNumber
			},
			dataType:"json",
			success:function(data){
				$(".redact").empty();
				totalPage = data[0].totalPage;
				$.each(data[0].list,function(index,item){
					var aa = '<li style="margin: 8px 0;">'+
								'<input type="checkbox" class="pitch" data-id="'+item.columns.id+'" data-phone="'+item.columns.phone+'" data-name="'+item.columns.name+'">'+
								'<a href="javascript:void(0)"style="text-align: left;">'+item.columns.remarks+'</a>'+
								'<a href="javascript:void(0)">'+item.columns.company_name+'</a>'+
								'<a href="javascript:void(0)">'+item.columns.name+'</a>'+
								'<a href="javascript:void(0)">'+item.columns.phone+'</a>'+
								'<a href="javascript:void(0)">'+item.columns.trade_status+'</a>'+
								'<a href="javascript:void(0)">'+item.columns.ctime+'</a>'+
							'</li>';
					$(".redact").append(aa);
				});
			}
		});
		return totalPage;
	}
	
	//搜索需求
	$(".search_need").click(function(){
		var totalPage = getNeedByAjax(1);
		paging("need_page", totalPage, 1, function(divElSelector, obj, first){
			if(!first){
				getNeedByAjax(obj.curr);
			}
		},'#5ec520');
	});
	
});


</script>
</html>