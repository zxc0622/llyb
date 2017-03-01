<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>优蚁环保-企业库，优蚁环保企业库汇集优秀环保公司</title>
<meta name="keywords" content="优蚁环保,企业库,环保公司" />
<meta name="description"
	content="优蚁环保汇集专业的环保公司供您挑选，了解服务价格、查看服务案例、寻找环保公司，就来优蚁环保！优蚁环保是企业和用户的最佳选择">
<link rel="shortcut icon"
	href="/llhb/static/img/llhb/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/css/v2/enterpriseLibrary/enterprise.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/layui/css/layui.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<!--企业分类start-->
	<div class="mall_areas">
		<ul class="area_cont font_1 color_1">
			<p
				style="width: 104px; height: 40px; line-height: 40px; float: left; text-align: center; background-color: #f3f3f3; font-size: 16px; margin-right: 22px; border-right: 1px solid #ccc;">企业分类</p>
			<div style="width: 1016px;">
				<li type="" class="test">全部</li>
				<c:forEach items="${types }" var="type">
					<li type="${type.get("value")}">${type.get("label") }</li>
				</c:forEach>
				<li type="0">其它</li>
			</div>
		</ul>
	</div>
	<!--企业分类end-->
	<!--所在地start-->
	<div class="mall_area">
		<ul class="area_cont font_1 color_1">
			<p
				style="width: 104px; height: 80px; line-height: 80px; float: left; text-align: center; background-color: #f3f3f3; font-size: 16px; margin-right: 22px; border-right: 1px solid #ccc;">所在地</p>
			<div style="width: 1016px;">
				<li prov="" class="">不限</li>
				<c:forEach items="${pro}" var="pro">
					<li prov="${pro.get('id') }">${pro.get("name") }</li>				
				</c:forEach>
			</div>
		</ul>
	</div>
	<!--所在地end-->
	<div class="Enterprise">
	<c:forEach items="${companys }" var="company">
		<div class="particulars">
			<a href="${ctx }/Library/enterpriseCustom/${company.get("id") }" target="_blank"><h3 class="comName">${company.companyName }</h3></a>
			<p class="icons">
				<span style="background-position:${company.youyiFlag!=1?'0 -35px':'0 0'}" class="actor"></span> 
				<span style="background-position:${company.authFlag!=1?'-30px -35px':'-30px 0'}" class="firm"></span> 
				<span style="background-position:${company.xFlag!=1?'-60px -35px':'-60px 0'}" class="personal"></span>
			</p>
			<p style="clear: both; margin: 0 0 20px 24px;font-size: 16px;">服务类别: ${empty company.get("typeName")?"其他":company.get("typeName") }</p>
			<span
				style="width: 540px; font-size: 14px; clear: both; margin: 32px 24px; display: block; color: #7d7d7d;">主营行业:
				${company.get("major") }</span>
			<div style="margin-left: 24px; float: left;">
				<p>所在地区: ${company.prov}/${company.city}</p>
				<p>
					<span
						style="width: 200px; height: 20px; display: block; padding-left: 28px; font-size: 14px; color: #ffa31f; px; background: url(${ctxStatic}/img/v2/enterpriseLibrary/phone.png) no-repeat; margin-top: 16px;">${company.phone }</span>
				</p>
			</div>
			<div style="margin-left: 394px; float: left;">
				<p>
					口碑值(总分180）:<b style="color: #ffaa30;margin-left:32px; padding-left: 3px;">180</b>
				</p>
				<p>
					<span
						style="width: 200px; height: 20px; display: block; font-size: 14px; color: #ffa31f; px; background: url(${ctxStatic}/img/v2/enterpriseLibrary/stars.png) 50px 2px no-repeat; margin-top: 16px;">信誉度</span>
				</p>
			</div>
			<div class="circumstance">
				<p>
					<c:choose>
						<c:when test="${not empty company.get('img')}">
							<img style="width:100%;height:100%;" src="${company.get('img')}">
						</c:when>
						<c:otherwise>
							<img style="max-width:287px;max-height:272px;" src="${company.get('logoImg')}">
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
	</c:forEach>
	</div>
	<div class="paging" style="width:1200px;margin:0 auto;margin-bottom: 45px;"></div>
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
<script type="text/javascript"
	src="${ctxStatic }/layui/layui.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/js/llhb/layeruiPagingExt.js"></script>
<script type="text/javascript">
	$(function(){
		//分页插件
		paging($(".paging"), ${totalPage}, ${pageNumber}, function(divElSelector, obj, first){
			if(!first){
				var type=$(".mall_areas .cur_area").attr("type");
				var prov=$(".mall_area .cur_area").attr("prov");
				location.href="${ctx}/EntLib?type="+type+"&prov="+prov+"&pageNumber="+obj.curr;
			}
		},'#008f00');
		$(".paging").on("mouseover mouseout",".layui-laypage-btn",function(event){
			if(event.type == "mouseover"){
				$(this).css("background-color","#008f00");
				$(this).css("color","#FFF");
			}else if(event.type == "mouseout"){
				$(this).css("background-color","#FFF");
				$(this).css("color","#000");
			}
		});
		
		$(".Enterprise").on("mouseover  mouseout",".comName",function(event){
			if(event.type == "mouseover"){
				$(this).css("color","#5ec420");
			}else if(event.type == "mouseout"){
				$(this).css("color","#666");
			}
		});
		
		function selectEp(){
			var type=$(".mall_areas .cur_area").attr("type");
			var prov=$(".mall_area .cur_area").attr("prov");
			location.href="${ctx}/EntLib?type="+type+"&prov="+prov;
		}
		$(".mall_areas li").click(function(){
			if(!$(this).hasClass("cur_area")){
				$(".mall_areas li").removeClass("cur_area");
				$(this).addClass("cur_area");
				selectEp();
			}
		});
		$(".mall_area li").click(function(){
			if(!$(this).hasClass("cur_area")){
				$(".mall_area li").removeClass("cur_area");
				$(this).addClass("cur_area");
				selectEp();
			}
		});
		$(".mall_area li[prov='${empty prov?'':prov}']").addClass("cur_area");
		$(".mall_areas li[type='${empty type?'':type}']").addClass("cur_area");
	})
</script>
</body>
</html>