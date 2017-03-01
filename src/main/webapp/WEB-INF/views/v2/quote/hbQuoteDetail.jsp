<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<title>优蚁环保-环保报价,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description"
	content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/layui/css/layui.css" />
<style type="text/css">
.main {
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
	margin-bottom: 90px;
	margin-top: 40px;
}

.main .title {
	width: 600px;
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
	color: #008f01;
	margin-top: 30px;
	margin-bottom: 30px;
}

.main .summary li {
	font-size: 14px;
	line-height: 24px;
}

.main .values li {
	font-size: 14px;
	line-height: 20px;
}

.main .btn {
	width: 180px;
	height: 38px;
	background: #369100;
	display: block;
	margin: 0 auto;
	color: #fff;
	line-height: 38px;
	font-size: 16px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<div class="main">
		<div style="width:700px;margin:0 auto;border: 1px solid #008f01;">
			<div style="width: 600px; margin: 0 auto;">
				<p class="title">
					根据专家团队多年行业经验沉淀,<br />收集您的项目详情如下:
				</p>
				<ul class="summary">
					<li>姓 &nbsp; 名 ：${r.name }</li>
					<li>电 &nbsp; 话 ：${r.tel }</li>
					<li class="color_red">公司名：${r.comp_name }</li>
					<li class="color_red">项目名称：${r.pro_name }</li>
					<li class="color_red">地址：${r.aname } ${r.aaname} ${r.ssaname }</li>
					<li class="color_red">类别：${r.hname }</li>
				</ul>
				<ul class="values">
					<c:forEach items="${offds }" var="d" varStatus="sta">
						<c:set value="${fn:substring(array, sta.index, sta.index+1)  }"
							var="ct"></c:set>
						<c:if test="${d.type_id eq 1}">
							<c:if test="${ct eq 1 }">
								<li><input type="checkbox" checked="checked"
									disabled="disabled" />${d.detail_type_name }</li>
							</c:if>
						</c:if>
						<c:if test="${d.type_id eq 0}">
							<c:if test="${ct ne 0 }">
								<li><input type="checkbox" checked="checked"
									disable="disabled" />${d.detail_type_name }</li>
							</c:if>
						</c:if>
					</c:forEach>
				</ul>
				<div class="">
					<span style="font-size: 16px; line-height: 28px; display: block;">报价信息
						:</span>
					<div class="quoteMsg">${r.reremark}</div>
				</div>
				<div class="remark">
					<p class="per-row-p"
						style="font-size: 14px; line-height: 35px; display: block;">备注：</p>
					<p class="per-row-p" style="text-indent: 36px;">1、平台提供的报价结果为区域平均价格，具体价格以实际情况为准，仅供参考；</p>
					<p class="per-row-p" style="text-indent: 36px;">2、平台1个工作日内推荐专业环评公司与您取得联系并提供服务。</p>
				</div>
				<c:if test="${bs ne 1}">
					<div class="per-row appr">
						<p class="per-row-p"
							style="font-size: 16px; line-height: 35px; display: block;">您对报价结果:</p>
						<input type="radio" name="xiangmu_result" value="1"><span
							class="color_lv">满意</span> <input type="radio"
							name="xiangmu_result" value="0"><span class="color_lv">一般</span>
						<input type="radio" name="xiangmu_result" value="-1"><span
							class="color_lv">不满意</span>
					</div>
					<div style="margin-top: 30px; text-align: center;">
						<a href="javascript:void(0)" class="btn">立即提交</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<script type="text/javascript"
		src="${ctxStatic }/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/layui/layui.js"></script>
	<script type="text/javascript">
		$(function(){
			var layer;
			layui.use([ 'layer'], function() {
				layer = layui.layer;
			});
			
			$(".btn").click(function(){
            	var appr = $("input[type='radio']:checked").val();
            	if(appr == undefined){
            		layer.msg("请先选择满意度",function(){});
            	}else{
            		$.ajax({
              			type : "POST",
            				url : "${ctx}/protection/envAppr",
            				data : "appr="+appr+"&eid=${r.id}",
            				dataType : 'text',
            				success : function(data) { 
            					location.href="${ctx}/index";
            				}
            			}); 
            	}
			});
		});
	</script>
</body>
</html>