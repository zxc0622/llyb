<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>推荐服务</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/layui/css/layui.css" />
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/layeruiPagingExt.js"></script>
	<style>
		/* 环保需求弹框样式start */
		.advisory_agents h3{width:100px;height:40px;margin: 0 auto;font-weight:bold;text-align: center;margin-top:80px;font-size:20px;background:url(${ctxStatic}/img/v2/solidsupply/bottom_line.png) 0 36px no-repeat;}
		.advisory_agents .details_information{width:616px;height:80px;margin:0 auto;margin-top:76px;}
		.advisory_agents .details_information .c_desc{display: block;float: left;width: 500px;overflow: hidden;line-height: 21px;font-weight: normal;margin: 6px 0 0 0;}
		.advisory_agents .details_information b{font-size:14px;}
		.advisory_agents .details_information span{font-size:14px;}
		.advisory_agents li {float:left;line-height:35px;}
		.advisory_agents li p{font-size:14px;}
		.advisory_agents .attention{width:100%;height:100px;background-color:#ececec;position:absolute;bottom:0;}
		.advisory_agents .attention p{font-size:16px;color:#008f00;line-height:100px;padding-left:48px;}
		.advisory_agents .attention .Customer{width:120px;height:34px;background-color:#008f00;color:#fff;line-height:34px;text-align:center;font-size:14px;position:absolute;bottom:33px;right:191px;}
		.advisory_agents .attention .payment{width:120px;height:34px;background-color:#ee7800;color:#fff;line-height:34px;text-align:center;font-size:14px;position:absolute;bottom:33px;right:51px;}
		/* 环保需求弹框样式end */
	</style>
</head>
<body>
	<c:choose>
		<c:when test="${err == 0 || err==2}">
			<!-- 环保需求弹框start -->
			<div class="advisory_agents">
				<h3 class="boxTitle">${rr.remarks}</h3>
				<ul class="details_information">
					<li><p style="width: 500px;">
							<b>公司名称：</b><span class="c_comName">${rr.company_name}</span>
						</p>
					<li>
					<li><p style="width: 300px;">
							<b>联&nbsp;系&nbsp;人&nbsp;：</b><span class="c_contact">${rr.name}</span>
						</p>
					<li>
					<li><p style="width: 260px; margin-left: 30px;">
							<b>联系方式：</b><span class="c_phone">${rr.phone}</span>
						</p>
					<li>
					<li><p style="width: 300px;">
							<b>发布时间：</b><span class="c_date"><fmt:formatDate value="${rr.create_date}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
						</p>
					<li>
					<li><p>
							<b style="float: left;">需求描述：</b>
							<b class="c_desc">${rr.requirement_describe}</b>
						</p>
					<li>
				</ul>
				<div class="attention positive">
					<c:if test="${err == 0}">
						<p class="negtips">您已支付</p>
					</c:if>
					<c:if test="${err == 2}">
						<p class="negtips"></p>
					</c:if>
				</div>
			</div>
			<!-- 环保需求弹框end -->
		</c:when>
		<c:otherwise>
			<h3 style="margin-top: 20px;margin-left: 20px;">发生了一个错误，请联系客服</h3>
		</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">
$(function(){
	
	//接单
	$(".accept").click(function(){
		var rid = $(this).attr("data-id");
		var flag = 2;
		acceptOrRefuse(rid,flag)
	});
	
	//拒绝
	$(".refuse").click(function(){
		var rid = $(this).attr("data-id");
		var flag = 3;
		acceptOrRefuse(rid,flag)
	});
	
	//接单、拒绝通用方法
	function acceptOrRefuse(rid,flag){
		$.ajax({
			type: "POST",
			url: "${ctx}/userhomepage/acceptOrRefuse",
			data: "recommendId=" + rid+"&flag="+flag,
			dataType: 'text',
			success: function (data) {
				if(data == "ok"){
					var tips = "";
					if(flag == 2){
						tips = "已接单，请及时联系需求方！";
					}else if(flag == 3){
						tips = "已拒绝，该单将推送给其他的公司！！";
					}
					$(".attention").empty();
					$(".attention").append("<p class='negtips'>"+tips+"</p>");
				}else{
					$(".attention").empty();
					$(".attention").append("<p class='negtips'>"+data+"</p>");
				}
				
			}
		});
	}

});
</script>
</html>