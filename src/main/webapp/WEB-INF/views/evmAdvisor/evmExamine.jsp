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

	<div style="width: 700px;height: 420px;margin: 10px auto;border: 1px solid #008f01;">
		<!--立即申请start-->
		<form method="post" action="${ctx }/evmAdvisor/consult/add">
			<div class="advisory_agent" style="display:block;">
				<div class="counsel">
					<h3 style="width:200px;">免费环保体检报名</h3>
				</div>
				<div class="theme">
					<input name="advisorConsult.type" type="hidden" value="环保体检"></input>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">联系人:</div>
						<input name="advisorConsult.contact" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">联系电话:</div>
						<input name="advisorConsult.phone" class="phone" type="text" style="width:320px;height:32px;margin-left:6px;"></input>
					</p>
					
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;float:left;line-height:32px;">验证码:</div>
						<input name="code" type="text" style="width:208px;height:32px;margin-left:6px;float:left;"></input>
						<p class="checkCode" style="width:90px;height:34px;height:32px\9;border:1px solid green;margin-left:12px;color:green;float:right;text-align:center;line-height:34px;cursor: pointer;">发送验证码</p>
					</p>
					<p>
						<div style="font-size:16px;width:70px;float:left;text-align:right;">备注:</div>
						<textarea name="advisorConsult.content" style="margin-left:6px;height:94px;width:322px;" onfocus="if (value =='（请输入公司名称、公司地址、公司状况等信息）'){value =''}"onblur="if (value ==''){value='（请输入公司名称、公司地址、公司状况等信息）'}">（请输入公司名称、公司地址、公司状况等信息）</textarea>
					</p>
					
					<div style="background:#008f01;width:324px;height:40px;clear:both;margin:20px 0 0 76px;+margin-top:0;">
						<input class="advisorConsult" type="button" value="提交" style="width:324px;+width:200px;height:40px;background-color:#008f01;border:none;color:#fff;font-size:16px;cursor: pointer;">
					</div>
				</div>
				
			</div>
		</form>
		<!--立即申请end-->
	</div>
	
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
			
		})
	</script>
</body>
</html>