<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>${pro.pro_name}-优蚁环保网</title>
<meta name="keywords" content="<c:if test="${pro.seo_key_words =='' || empty pro.seo_key_words }">${pro.pro_name}</c:if><c:if test="${pro.seo_key_words !='' }">${pro.seo_key_words}</c:if>" />
<meta name="description" content="<c:if test="${proDesc =='' || empty proDesc }">${pro.pro_name}</c:if><c:if test="${proDesc !='' }">${fn:substring(proDesc,0,100)}...</c:if>" />
<link href="${ctxStatic}/css/v2/hbshop/detail.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.Description p {text-align: left;color: #000;font-size: 14px;}
</style>
</head>
<body>
<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<div class="biggest_box">
<!--左边的内容start-->
   <div class="particulars_left">
		<div style="width:340px;float:left;">
			<div class="tb-booth tb-pic tb-s310">
				<c:choose>
					<c:when test="${not empty pro.pic1}">
						<a href="${pro.pic1}"><img src="${pro.pic1}" rel="${pro.pic1}" class="jqzoom" /></a>
					</c:when>
					<c:when test="${not empty pro.pic2}">
						<a href="${pro.pic2}"><img src="${pro.pic2}" rel="${pro.pic2}" class="jqzoom" /></a>
					</c:when>
					<c:otherwise>
						<a href="${pro.pic3}"><img src="${pro.pic3}" rel="${pro.pic3}" class="jqzoom" /></a>
					</c:otherwise>
				</c:choose>
			</div>
			<ul class="tb-thumb" id="thumblist">
				<c:if test="${not empty pro.pic1}">
					<li class="tb-selected"><div class="tb-pic tb-s40"><a href="javascript:void(0)"><img style="width: 72px;height: 72px;" src="${pro.pic1}" mid="${pro.pic1}" big="${pro.pic1}"></a></div></li>
				
				</c:if>
				<c:if test="${not empty pro.pic2}">
					<li class="tb-selected"><div class="tb-pic tb-s40"><a href="javascript:void(0)"><img style="width: 72px;height: 72px;"  src="${pro.pic2}" mid="${pro.pic2}" big="${pro.pic2}"></a></div></li>
				
				</c:if>
				<c:if test="${not empty pro.pic3}">
					<li class="tb-selected"><div class="tb-pic tb-s40"><a href="javascript:void(0)"><img style="width: 72px;height: 72px;"  src="${pro.pic3}" mid="${pro.pic3}" big="${pro.pic3}"></a></div></li>
				
				</c:if>
<!-- 
				<li><div class="tb-pic tb-s40"><a href="#"><img  src="${ctxStatic}/img/v2/hbshop/02_small.jpg" mid="${ctxStatic}/img/v2/hbshop/02_mid.jpg" big="${ctxStatic}/img/v2/hbshop/02.jpg"></a></div></li>

				<li><div class="tb-pic tb-s40"><a href="#"><img src="${ctxStatic}/img/v2/hbshop/03_small.jpg" mid="${ctxStatic}/img/v2/hbshop/03_mid.jpg" big="${ctxStatic}/img/v2/hbshop/03.jpg"></a></div></li>

				<li><div class="tb-pic tb-s40"><a href="#"><img src="${ctxStatic}/img/v2/hbshop/03_small.jpg" mid="${ctxStatic}/img/v2/hbshop/03_mid.jpg" big="${ctxStatic}/img/v2/hbshop/03.jpg"></a></div></li>
			 -->
			</ul>
		</div>
	
		<div class="Joedar_from">
	         <h2>${pro.pro_name}</h2>
	         <div class="standard">
	           <p style="font-size:16px;color:#146000;padding-top:25px;line-height:25px;width:420px;margin:0 auto;text-align: left;">
	           	<span style="display: block;float:left;line-height:40px;font-size:16px;">价格:</span>
    			<span style="color:#c40000;font-size: 30px;font-weight:bold;line-height:36px;">
	           	<c:choose>
	           		<c:when test="${empty pro.low_price && empty pro.high_price}">面议</c:when>
	           		<c:otherwise>${pro.low_price}</c:otherwise>
	           	</c:choose>
	           	<c:if test="${not empty pro.low_price && not empty pro.high_price}">~${pro.high_price}</span><span style="color:#c40000;">元/${pro.unit_label}</span></c:if>
	           
	           </p>
	         </div>
	         <p style="font-size:16px;margin-bottom:14px;text-align: left;color: #000;">
	         	<span style="font-size:16px;">供应量 : </span>
	         	<c:choose>
	           		<c:when test="${not empty pro.amount}">
						<fmt:parseNumber value='${pro.amount}' type='number' integerOnly='true'/>${pro.unit_label}
					</c:when>
	           		<c:otherwise>-</c:otherwise>
	           	</c:choose>
	         </p>
	         <p style="font-size:16px;margin-bottom:14px;text-align: left;color: #000;"><span style="font-size:16px;">有效期 : </span>${pro.past_date > '9999-12-30'? '长期有效':(fn:substring(pro.past_date,0,10))}</p>
	         <p style="font-size:16px;margin-bottom:14px;text-align: left;color: #000;"><span style="font-size:16px;">所在地 : </span>${pro.p_prov_name}&nbsp;${pro.p_city_name}</p>
	         <div class="Joedar_anli">
	           <a href="javascript:void(0)" class="understand" style="background-color:#008f01;">收藏该商品</a>
	           <a href="javascript:void(0)" class="askPrice" style="position:absolute;right: 0;bottom: 0;">我要询价</a>
	         </div>
	    </div> 
        <div class="Description">
	          <div class="details_tab">
		            <div class="hd">
		              <span class="current">商品详情</span>
		              <span>累计评价</span>
		            </div>
		            <div class="bd">
		              <ul class="cur">
		                <li>
		                	<p class="pro_desc">${pro.pro_desc}</p>
						<div style="width:852px;">
							<c:if test="${not empty pro.pic1}">
								<img src="${pro.pic1}" style="width:100%;">
							</c:if>
							<c:if test="${not empty pro.pic2}">
								<img src="${pro.pic2}" style="width:100%;">
							</c:if>
							<c:if test="${not empty pro.pic3}">
								<img src="${pro.pic3}" style="width:100%;">
							</c:if>
						</div>
		                </li>
		              </ul>
		              
		              <ul>
		                <li>
		                	<div class="cumulative">
							<h5>累计评价(124)</h5>
							<p class="rate">
								<span style="font-size:42px;color:#c40000;display:block;margin:20px 0;">80%</span>
								<span style="width:120px;text-align:center;display:block;margin-bottom: 10px;">好评率</span>
								<span style="width:120px;height:20px;display:block;background:url(${ctxStatic}/img/v2/hbshop/stars.png) no-repeat;"></span>
							</p>
							<p style="float:left;">
								<span style="width:1px;height:40px;background:#b2b2b2;margin-top:40px;display:block;float:left;"></span>
								<span style="width: 14px;display: block; float: left; margin: 28px 0 0 32px;line-height: 17px;">大家印象</span>                       
							</p>
							<p style="float:left;margin:29px 0 0 38px;width:545px;">
								<span>
									<span style="width:3px;height:30px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius.png)">
									</span>
									<span style="width:170px;height:30px;line-height:30px;text-align:center;color:#008f01;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_middle.png)">价格蛮便宜的
									</span>
									<span style="width:3px;height:30px;margin-right:4px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_right.png) repeat-x">
									</span>
								</span>
								<span>
									<span style="width:3px;height:30px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius.png)">
									</span>
									<span style="width:94px;height:30px;line-height:30px;text-align:center;color:#008f01;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_middle.png)">大品牌
									</span>
									<span style="width:3px;height:30px;margin-right:4px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_right.png) repeat-x">
									</span>
								</span>
								<span>
									<span style="width:3px;height:30px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius.png)">
									</span>
									<span style="width:120px;height:30px;line-height:30px;text-align:center;color:#008f01;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_middle.png)">大品牌
									</span>
									<span style="width:3px;height:30px;margin-right:4px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_right.png) repeat-x">
									</span>
								</span>
								<span>
									<span style="width:3px;height:30px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius.png)">
									</span>
									<span style="width:70px;height:30px;line-height:30px;text-align:center;color:#008f01;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_middle.png)">很好
									</span>
									<span style="width:3px;height:30px;float:left;display:block;background:url(${ctxStatic}/img/v2/hbshop/radius_right.png) repeat-x">
									</span>
								</span>
							</p>
						</div>
						<!-- <ul class="estimate">
							<li>
								<p style="width:412px;float:left;margin:0 94px 0 6px;padding:20px 0;">
									<span style="display:block;">除尘器质量不错，公司的服务态度很好希望下次能够继续合作</span>
									<span style="display:block;margin-top:10px;">2016-11-4</span>
								</p>
								<p style="width:74px;float:left;padding:20px 0;">
									<span>价格:50000</span>
									<span>产品:除尘器</span>
								</p>
								<p style="width:212px;float:left;">
									<span style="position: absolute;right:46px;top:32px;">啊斯旺</span>
								</p>
							</li>
							<li>
								<p style="width:412px;float:left;margin:0 94px 0 6px;padding:20px 0;">
									<span style="display:block;">除尘器质量不错，公司的服务态度很好希望下次能够继续合作</span>
									<span style="display:block;margin-top:10px;">2016-11-4</span>
								</p>
								<p style="width:74px;float:left;padding:20px 0;">
									<span>价格:50000</span>
									<span>产品:除尘器</span>
								</p>
								<p style="width:212px;float:left;">
									<span style="position: absolute;right:46px;top:32px;">啊斯旺</span>
								</p>
							</li>
						</ul>
		                </li>
		              </ul> -->
		            </div>
	          </div>
        </div>

    </div>
<!--左边的内容end-->
<div class="Looked">
	<h5>供应商其他产品</h5>
	<c:forEach items="${otherPro}" var="o">
		<div class="ceramic">
			<c:choose>
				<c:when test="${not empty o.pic1}">
					<a href="${ctx}/mall/detail/${o.id}" target="_blank"><img src="${o.pic1}" style="width:100%;"></a>
				</c:when>
				<c:when test="${not empty o.pic2}">
					<a href="${ctx}/mall/detail/${o.id}" target="_blank"><img src="${o.pic1}" style="width:100%;"></a>
				</c:when>
				<c:otherwise>
					<a href="${ctx}/mall/detail/${o.id}" target="_blank"><img src="${o.pic1}" style="width:100%;"></a>
				</c:otherwise>
			</c:choose>
			<span style="font-size:16px;margin: 12px 0 10px 0;">${empty o.sname?o.tname:o.sname}</span>
			<span style="font-size:14px;color:#7d7d7d;margin-bottom:15px;">${o.pro_name}</span>
			<span style="font-size:12px;color:#7d7d7d;">${o.company_name}</span>
		</div>
	</c:forEach>
</div>

</div>

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.imagezoom.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(".jqzoom").imagezoom();
	$("#thumblist li a").click(function(){
		$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");

		$(".jqzoom").attr('src',$(this).find("img").attr("mid"));

		$(".jqzoom").attr('rel',$(this).find("img").attr("big"));
	});
	
	//商品详情和累计评价选项卡切换
	$(".details_tab .hd span").mouseenter(function(){
        $(this).addClass("current").siblings().removeClass("current").parent().siblings(".bd").children("ul").eq($(this).index()).addClass("cur").siblings().removeClass("cur");
      });
	
	
	//初始化layer
	var layer;
	layui.use(['layer'],function(){
		layer = layui.layer;
	});
	
	var loginFlag = '${loginFlag}';//登录标志
	var collectFlag = '${collectFlag}';
	if(collectFlag == "1"){
		$(".understand").text("已收藏");
	}else{
		$(".understand").on("click",collect);
	}
	//收藏商品
	function collect(){
		if(collectFlag == "1"){
			layer.msg("您已经收藏了改商品");
			return;
		}
		if(loginFlag == "1"){
			var collectId = ${pro.id};
			$.ajax({
				type:"post",
				url:"${ctx}/hbshop/businessCollect",
				data:"type=4"+"&collectId="+collectId,
				success:function(data){
					if(data == true){
						layer.msg("收藏成功");
						setTimeout(function(){close();},3000);
					}else if(data == false){
						layer.msg("已收藏");
						setTimeout(function(){close();},3000);
					}else{
						layer.msg("收藏失败");
					}
				}
			})
		}else{
			layer.msg('请先登录');
		}
	}
	
	//询价
	$(".askPrice").click(function(){
		if(loginFlag == "1"){
			window.open("${ctx}/home?str=/memSerevice/communication/goChat?id=${pro.user_id}","_blank");
		}else{
			layer.msg("请先登录");
		}
	});
	
});

</script>
 </body>
 </html>