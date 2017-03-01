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
<title>优蚁环保-环保供求，提供环保行业最新需求和服务提供商的信息</title>
<link rel="shortcut icon"
	href="/llhb/static/img/llhb/bitbug_favicon.ico">
<meta name="keywords" content="优蚁环保,需求,服务，供应商">
<meta name="description"
	content="优蚁环保供求市场，提供环保行业最新需求信息、环保业务供应商信息。优蚁环保有专业的环保公司提供服务，优蚁环保，中国领先的环保行业一站式服务平台环保服务">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/css/v2/solidsupply/solidIndex.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/flexslider/flexslider.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	
	<!-- 轮播区及浏览区开始 -->
	<!-- <div id="main" role="main">
		<div id="slider" class="flexslider">
			<ul class="slides ke_l">
				<li
					style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/evmAdvisor/banner.jpg) center no-repeat;"></li>
				<li
					style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/evmAdvisor/banner1.jpg) center no-repeat;"></li>
			</ul>
		</div>
	</div> -->
	<!-- 轮播区及浏览区结束 -->
	
	<div class="demand_tab">
		<ul class="professional_work">
			<p class="operation" style="display:none;">环保业务</p>
			<li class="currentss">不限分类</li>
			<c:forEach items="${nt}" var="n">
				<li>${n.label}</li>
			</c:forEach>
		</ul>
		<div class="write">
			<div class="caption">
				<h3 class="typeTitle">不限分类</h3>
				<p>
					<button class="layui-btn select">查询</button>
				</p>
				<p>
					<input class="layui-input endDate" placeholder="截止日期"
						onclick="layui.laydate({elem: this, festival: true})">
				</p>
				<p>
					<input class="layui-input startDate" placeholder="开始日期"
						onclick="layui.laydate({elem: this, festival: true})">
				</p>
				<p class="submission">
					<select class="sta" style="width: 200px; height: 28px;">
						<option value="提交中">提交中</option>
                    	<option value="洽谈中">洽谈中</option>
                    	<option value="已解决">已解决</option>
					</select>
				</p>

				<table align="center" width="870" border=0 bordercolor="#00ff99">
					<tbody class="immediately">
						<ul class="The_list">
							<li style="padding-left: 10px;">环保业务</li>
							<li>联系人</li>
							<li>联系方式</li>
							<li>需求状态</li>
							<li style="width: 100px;">需求时间</li>
						</ul>
						<c:forEach items="${crs}" var="c">
							<tr data-id="${c.get('id')}">
								<td class="hbType">${c.get('remarks')}</td>
								<td>${c.get('name')}</td>
								<td>${c.get('phone')}</td>
								<td>${c.get('trade_status')}</td>
								<td>${c.get('create_date')}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="paging"></div>
		</div>
	</div>
	<div class="advisory_agents non-payment" style="display: none;">
		<h3 class="boxTitle">环评编写</h3>
		<ul class="details_information">
			<li><p style="width: 380px;">
					<b>公司名称：</b><span class="c_comName"></span>
				</p>
			<li>
			<li><p style="width: 156px; margin-left: 80px;">
					<b>联系人：</b><span class="c_contact"></span>
				</p>
			<li>
			<li><p style="width: 380px;">
					<b>联系方式：</b><span class="c_phone"></span>
				</p>
			<li>
			<li><p style="width: 156px; margin-left: 80px;">
					<b>需求状态：</b><span class="c_sta"></span>
				</p>
			<li>
			<li><p style="width: 500px;">
					<b>需求时间：</b><span class="c_date"></span>
				</p>
			<li>
			<li><p>
					<!-- <b>需求描述:</b><span class="c_desc"></span> -->
					<b style="float: left;">需求描述：</b>
					<b class="c_desc"></b>
				</p>
			<li>
		</ul>
		<div class="attention">
			<p>注：查看该信息联系方式需支付优蚁币10点</p>
			<a href="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156',
			 '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"
				class="Customer">联系客服</a> <a href="javascript:void(0)" data-rid=""
				class="payment">立即支付</a>
		</div>
	</div>
	<div class="advisory_agents paied" style="display: none;">
		<h3 class="boxTitle">环评编写</h3>
		<ul class="details_information">
			<li><p style="width: 380px;">
					<b>公司名称：</b><span class="c_comName"></span>
				</p>
			<li>
			<li><p style="width: 156px; margin-left: 80px;">
					<b>联系人：</b><span class="c_contact"></span>
				</p>
			<li>
			<li><p style="width: 380px;">
					<b>联系方式：</b><span class="c_phone"></span>
				</p>
			<li>
			<li><p style="width: 156px; margin-left: 80px;">
					<b>需求状态：</b><span class="c_sta"></span>
				</p>
			<li>
			<li><p style="width: 500px;">
					<b>需求时间：</b><span class="c_date"></span>
				</p>
			<li>
			<li><p>
					<b style="float: left;">需求描述：</b>
					<b class="c_desc"></b>
				</p>
			<li>
		</ul>
		<div class="attention">
			<p>您已支付优蚁币</p>
		</div>
	</div>
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
<script type="text/javascript"
	src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/layui/layui.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/js/llhb/layeruiPagingExt.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/js/v2/slider_banner.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
	
<script type="text/javascript">
$(function(){
	
	$('#slider').flexslider({
		animation : "slide",
		controlNav : false,
		animationLoop : true,
		slideshow : false,
		slideshowSpeed : 3000,
		directionNav : true,
		start : function(slider) {
			$('body').removeClass('loading');
		}
	});
	
	
	var layer;
	var laydate;
	var loadLayer=layui.use(['layer','laydate'], function(){
		layer = layui.layer;
		laydate = layui.laydate;
	});
	
	
	$(".immediately").on("click","tr",function(event) {
		var title = $(this).find("td").eq(0).text();
		$(".boxTitle").text(title);
		var reqId = $(this).attr("data-id");
		var boxSelector = ".non-payment";
		$.ajax({
			type: "POST",
			url: "${ctx}/environmentDetail/show",
			data: "requirementId=" + reqId,
			dataType: 'json',
			success: function (data) {
				var box;
				if(data.flag == "0"){
					box = $(".paied");
					boxSelector = ".paied";
				}else{
					box = $(".non-payment");
					$(".attention").css("display","");
					boxSelector = ".non-payment";
					box.find(".payment").attr("data-rid",data.id);
				}
				box.find(".c_comName").text(data.company_name);
				box.find(".c_contact").text(data.name);
				box.find(".c_phone").text(data.phone);
				box.find(".c_sta").text(data.trade_status);
				box.find(".c_date").text(data.create_time);
				box.find(".c_desc").text(data.requirement_describe);
				
				//弹框
				layer.open({
					title: false,
					type: 1,
					shade: [0.5, '#000'],
					skin: 'layui-layer-rim', //加上边框
					area: ['800px', '565px'], //宽高
					content: $(boxSelector)
				});
			}
 		});
		
	});
	
	$(".payment").click(function(){
		var reqId = $(this).attr("data-rid");
		$.ajax({
			type: "POST",
			url: "${ctx}/environmentDetail/paymoney",
			data: "requireUserId=" + reqId,
			dataType: 'json',
			success: function (data) {
				if(data.msg == "ok"){
					layer.msg("支付成功");
					$(".non-payment").find(".c_comName").text(data.comName);
					$(".non-payment").find(".c_contact").text(data.contact);
					$(".non-payment").find(".c_phone").text(data.phone);
					$(".attention").css("display","none");
				}else if(data.msg == "请先登录"){
					layer.msg(data.msg);
					setTimeout(function(){
						window.open("${ctx}/login");
					},3000);
				}else{
					layer.msg(data.msg);
				}
			}
 		});
	});
	var pageNumber=${empty pageNumber?1:pageNumber};
	var totalPage=${empty totalPage?1:totalPage};

	//分页
	paging($(".paging"), totalPage, pageNumber, function(divElSelector, obj, first){
		if(!first){
			pageNumber=obj.curr;
			select();
		}
	},'#008f00');
	
	$(".select").on("click",function(){
		pageNumber=1;
		select();
	});
	
	$(".professional_work li").click(function(){
		$(".typeTitle").text($(this).text());
		$(".sta").val("提交中");
		$(".startDate").val("");
		$(".endDate").val("");
		pageNumber=1;
		$(".professional_work li").removeClass("currentss");
		$(this).addClass("currentss");
		select();
	});
		
	//查询方法
	function select(){
		var type=$(".currentss").text();
		var startDate=$(".startDate").val();
		var endDate=$(".endDate").val();
		var sta=$(".sta").val();
		startDate=startDate==""||startDate==undefined?'1999-01-01':startDate;
		endDate=endDate==""||endDate==undefined?'9999-01-01':endDate;
		sta=sta==""||sta==undefined?'提交中':sta;
		
		$.post("${ctx}/solidsupply/select",{
			type:type,
			startDate:startDate,
			endDate:endDate,
			sta:sta,
			pageNumber:pageNumber
		},function(data,status){
			$(".immediately tr").remove();
			
			if(-1==data){
				$(".paging").html("");
				layer.msg("没有更多数据了");
			}else{
				resetData(data);
			}
		});
	}
	
	//数据加载方法
	function resetData(data){
		var trEl="<tr data-id=''>"+
		            "<td></td>"+
		            "<td></td>"+
		            "<td></td>"+
		            "<td></td>"+
		            "<td></td>"+
		        "</tr>";
       	var tempTrEl;
       	var txt;
       	var qrm;
       	for(var i=2;i<data.length;i++){
       		debugger;
       		qrm=data[i];
       		tempTrEl=$(trEl);
       		tempTrEl.attr("data-id",qrm.id);
       		tempTrEl.find("td").each(function(index,el){
       			switch(index){
       			case 0:
       				txt=qrm.remarks;
       				break;
       			case 1:
       				txt=qrm.name;
       				break;
       			case 2:
       				txt=qrm.phone;
       				break;
       			case 3:
       				txt=qrm.trade_status;
       				break;
       			case 4:
       				txt=qrm.create_date;
       				break;
       			}
       			$(el).text(txt);
       		});
       		$(".immediately").append(tempTrEl);
       	}
       	
       	paging($(".paging"), data[1], data[0], function(divElSelector, obj, first){
			if(!first){
				pageNumber=obj.curr;
				select();
			}
		},'#008f00');
	};
	
	$(".paging").on("mouseover mouseout",".layui-laypage-btn",function(event){
		if(event.type == "mouseover"){
			$(this).css("background-color","#008f00");
			$(this).css("color","#FFF");
		}else if(event.type == "mouseout"){
			$(this).css("background-color","#FFF");
			$(this).css("color","#000");
		}
	});
});
			
</script>
</html>