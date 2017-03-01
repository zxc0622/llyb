<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie9" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<title>优蚁环保顾问-企业环保顾问-免费环保在线咨询-专业环保服务平台-优蚁环保网</title>
	<meta name="keywords" content="环保顾问，环评，环境监测，环保验收，排污许可证" />
	<meta name="description" content="有环保问题，上优蚁环保网！优蚁环保网拥有专业的环保顾问团队，为企业提供专业的、便捷的环保服务！">
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/flexslider/flexslider.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/css/v2/evmAdvisor/evmAdvisor.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<!-- 轮播区及浏览区开始 -->
	<div id="main" role="main">
		<div id="slider" class="flexslider">
			<ul class="slides ke_l">
				<li
					style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/evmAdvisor/banner.jpg) center no-repeat;"></li>
				<li
					style="width:100%;height:400px;background: url(${ctxStatic}/img/v2/evmAdvisor/banner1.jpg) center no-repeat;"></li>
			</ul>
		</div>
	</div>
	<!-- 轮播区及浏览区结束 -->
	<!--六大基础服务start-->
	<div class="liu_da">
		<h2>六大基础服务</h2>
		<div class="shu_zi">
			<div class="no_one">
				<h4>企业环保体检服务</h4>
				<p>勘察企业现场，对企业的环保相关文件及审批情况进行了解，检查企业环保设施运行情况，排查环境安全隐患，提出合理化整改意见</p>
			</div>
			<div class="no_two">
				<h4>企业档案建立指导服务</h4>
				<p>指导企业建立健全环保档案，达到环保监察一企一档要求</p>
			</div>
			<div class="no_three">
				<h4>排污申报表填报咨询指导服务</h4>
				<p>指导企业完成排污申报表填写，协助解决企业在申报表填写过程中提出的问题。</p>
			</div>
			<div class="no_four">
				<h4>环保手续办理指导服务</h4>
				<p>指导企业办理相关环保手续，协助解决企业办理环保手续过程中遇到的问题。如环评、验收、排污许可证等手续指导。</p>
			</div>
			<div class="no_five">
				<h4>环保基础知识培训班服务</h4>
				<p>及时反馈解决企业在生产经营过程中遇到的环保问题，提出合理化意见。</p>
			</div>
			<div class="no_six">
				<h4>线上环保问题咨询服务</h4>
				<p>协助企业掌握本行业环保知识，了解环保行业政策及法律法规，降低环保违法风险。</p>
			</div>
		</div>
	</div>
	<!--六大基础服务end-->

	<!--定制服务开始-->
	<div class="ding_zhi">
		<h2>定制服务</h2>
		<div class="dz_bg">
			<div class="service" style="position: relative;">
				<div class="you1" style="cursor:default;">环评服务</div>
				<div class="you2" style="cursor:default;">环保设施验收服务</div>
				<div class="you3" style="cursor:default;">清洁生产、节能评估服务</div>
				<div class="you4" style="cursor:default;">应急预案服务</div>
				<div class="you5" style="cursor:default;">环保法律咨询与环保违法行政复议服务</div>
				<div class="you6" style="cursor:default;">危险废物处置指导服务</div>
				<div class="you7" style="cursor:default;">排污许可证办理服务</div>
				<div class="you8" style="cursor:default;">环保知识专题培训服务</div>
				<div class="you9" style="cursor:default;">环保工程服务</div>
			</div>
		</div>
	</div>
	<!--定制服务end-->
	<!--明星案列开始-->
	<div class="mx_stars">
		<h2>明星案列</h2>
		<!--明星案列轮播start -->

		<div id="main" role="main">
			<div id="slider_3F" class="flexslider" style="margin: 0;">
				<ul class="slides">
					<c:forEach items="${caseList }" var="caseInfo" varStatus="sta">
						<c:if test="${sta.index%3==0 }">
							<li>
						</c:if>
						<div id="${caseInfo.get('id') }" class="caseClick">
							<img src="${caseInfo.get('img') }">
								<p class="lucency">${caseInfo.get('title') }</p>
								<p class="particulars zxx_text">${caseInfo.get('summary') }</p>
						</div>
						<c:if test="${(sta.index-2)%3==0 }">
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!--明星案列end-->
	<!--立即申请start-->
	<div class="immediately">
		<img style="cursor: pointer;" src="${ctxStatic}/img/v2/evmAdvisor/shen_q.png">
	</div>
	<form method="post" action="${ctx }/evmAdvisor/consult/add">
		<div class="advisory_agent">
			<div class="counsel">
				<h3>咨询顾问</h3>
			</div>
			<div class="theme">
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">主题:</div>
						<input name="advisorConsult.title" type="text" style="width:314px;height:32px;margin-left:6px;padding-left:6px;"></input>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">分类:</div>
						<select name="advisorConsult.type" style="width:323px;height:32px;margin-left:6px;">
							<c:forEach items="${consultTypes}" var="type">
								<option value="${type.get('label')}">${type.get("label")}</option>
							</c:forEach>
						</select>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">内容:</div>
						<textarea name="advisorConsult.content" style="margin-left:6px;height:94px;width:322px;"></textarea>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">联系人:</div>
						<input name="advisorConsult.contact" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">联系电话:</div>
						<input name="advisorConsult.phone" class="phone" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">电子邮箱:</div>
						<input name="advisorConsult.email" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					<p>
						<div style="width:70px;text-align:right;float:left;font-size:16px;">QQ:</div>
						<input name="advisorConsult.QQ" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;float:left;line-height:32px;margin-bottom:20px;">验证码:</div>
						<input name="code" type="text" style="width:208px;height:32px;margin-left:6px;float:left;"></input>
						<p class="checkCode" style="width:90px;height:34px;height:32px\9;border:1px solid green;margin-left:12px;color:green;float:right;text-align:center;line-height:34px;">发送验证码</p>
					</p>
					<div style="background:#008f01;width:324px;height:40px;clear:both;margin:20px 0 0 76px;+margin-top:0;">
						<input class="advisorConsult" type="button" value="提交" style="width:324px;+width:200px;height:40px;background-color:#008f01;border:none;color:#fff;font-size:16px;">
					</div>
				</div>
			
		</div>
	</form>
	<!--立即申请end-->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery.form.js"></script>
	<script type="text/javascript">
		var layer;
		var loadLayer = layui.use([ 'layer' ], function() {
			layer = layui.layer;
		});
		$(function() {
			$(".immediately").click(function(event) {
				/* Act on the event */
				layer.open({
					title : false,
					type : 1,
					shade : [ 0.5, '#000' ],
					skin : 'layui-layer-rim', //加上边框
					area : [ '550px', '565px' ], //宽高
					content : $('.advisory_agent')
				});
			});
			//限制字符个数
			$(".zxx_text").each(function() {
				var maxwidth = 51;
				if ($(this).text().length > maxwidth) {
					$(this).text($(this).text().substring(0, maxwidth));
					$(this).html($(this).html() + '...');
				}
			});
			$(".shop_tabbb .hd span").mouseenter(
					function() {
						$(this).addClass("current").siblings().removeClass(
								"current").parent().siblings(".bd").children(
								"ul").eq($(this).index()).addClass("cur")
								.siblings().removeClass("cur");
					});

			//头部搜索切换的js start
			//通用头部搜索切换
			$('#search-hd .search-input').on(
					'input propertychange',
					function() {
						var val = $(this).val();
						if (val.length > 0) {
							$('#search-hd .pholder').hide(0);
						} else {
							var index = $('#search-bd li.selected').index();
							$('#search-hd .pholder').eq(index).show().siblings(
									'.pholder').hide(0);
						}
					})
			$('#search-bd li').click(
					function() {
						var index = $(this).index();
						$('#search-hd .pholder').eq(index).show().siblings(
								'.pholder').hide(0);
						$('#search-hd .search-input').eq(index).show()
								.siblings('.search-input').hide(0);
						$(this).addClass('selected').siblings().removeClass(
								'selected');
						$('#search-hd .search-input').val('');
					});

			//$(".Nav_right li a").click(function() {
				//$(".Nav_right li a").css("color", "black");
				//$(this).css("color", "#008e00");
				//window.open($(this).attr("url"));
			//});
			//头部搜索切换的js end

			var serviceSummary = [
					'推荐有实力环评资质单位供企业选择，并进行跟踪服务。',
					'推荐有环保验收资质单位供企业选择，并进行跟踪服务，保证工程质量。',
					'推荐有清洁生产资质单位供企业选择，并进行跟踪服务。',
					'提供法律咨询服务，推荐环保领域资深律师供企业选择。',
					'协助企业按要求做好危险废物处置及规范化管理，达到危废规范化管理的要求。',
					'协助企业按要求做好危险废物处置及规范化管理，达到危废规范化管理的要求。',
					'帮助企业审批排污许可证办理，降低企业环保成本投入（不含监测费）。',
					'针对特定行业，安排省环保学校资深专业人士进行相应行业环保知识专题讲座。',
					'推荐环保工程资质单位供企业选择，并进行工程设计方案审核服务。' ];

			//定制服务事件
			var text = "";
			var size = "";
			var lineHeight = "";
			$(".service div").hover(function() {
				var index = $(this).attr("class").replace("you", "");
				text = $(this).text();
				size = $(this).css("font-size");
				lineHeight = $(this).css("line-height");
				$(this).text(serviceSummary[Number(index) - 1]);
				$(this).css("background", "#17ba94");
				$(this).css("height", "auto");
				$(this).css("font-size", "16px");
				$(this).css("z-index", "9");
				$(this).css("line-height", "25px");
				$(this).css("padding", "5px");
			}, function() {
				$(this).text(text);
				$(this).css("font-size", size);
				$(this).css("z-index", "1");
				$(this).css("line-height", lineHeight);
				$(this).css("background", "none");
				$(this).css("text-align", "center");
				$(this).css("padding", "0");
			});

			//发送验证码
			$(".checkCode").click(function() {
				var msg = "发送成功，请查收！";
				var tel = $(this).parents("form").eq(0).find(".phone").val();
				$.get("${ctx}/conn?tel=" + tel, function(data, status) {
					if (data != "ok") {
						msg = data;
					}
					layer.msg(msg);
				});
			});

			//提交咨询环保顾问
			$(".advisorConsult").click(function() {
				var options = {
					success : function(data, status) {
						layer.msg(data.msg);
						if (data.sta) {
							layer.close(layerId);
						}
					}
				};
				$(this).parents("form").eq(0).ajaxSubmit(options);
			});
			
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
			
			$('#slider_3F').flexslider({
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

			//明星案例点击查看详情
			$("#slider_3F").on("click", ".caseClick", function() {
				var id = $(this).attr("id");
				window.open("${ctx}/advisorCase/intoCaseDetail?id=" + id);
			});
		})
	</script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			
			$(".slides .caseClick").eq(2).css("margin-right","45px");
			$(".slides .caseClick").eq(2).css("margin-left","45px");
			
			//var divs = $(".slides .caseClick");
			//var len = divs.length;
			//for(var i=0;i<len;i++){
				//if((i+2)%3 == 0){
					//$(".slides .caseClick").eq(i).css("margin-right","45px");
					//$(".slides .caseClick").eq(i).css("margin-left","45px");
				//}
			//}
		});
</script>
</body>
</html>