<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="" />
<title>企业_荣誉资质</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/qiye_style.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/img.css" />
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<script type="text/javascript" src="${ctxStatic}/js/img/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/img/public.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/img/ie6PNG.js"></script>
<script type="text/javascript">
	DD_belatedPNG.fix('*');
</script>
<style>
    /*隐藏页数修改功能*/
    .hbshop_disnone {
        display: none;
    }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
	<!-- qy_m_r 中间右侧 -->
	<div class="qy_m_r">
		<div class="qy_m_r_div">
			<div class="qy_m_r_d_title">
				<span>荣誉资质</span>

			</div>

			<div class="qy_m_r_d_main">
				<div class="qiye_rongyuzizhi">
					<table>
						<tr>
							<th>证书</th>
							<th>证书名称</th>
							<th>发证机构</th>
							<th>发证日期</th>
							<th>到期日期</th>
						</tr>
						<c:forEach items="${honorList}" var="honorList">
							<tr>
								<td class="small_pic"><img  src="${honorList.cerPic}" alt="">
									<span class="hidden"> <img src="${honorList.cerPic}"
										style="max-width:100%;max-height:100%;width:auto;height:auto;position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);" />
								</span>
								</td>
								<td>${honorList.infoTitle}</td>
								<td>${honorList.cerOrg}</td>
								<td>${honorList.startDate}</td>
								<td>${honorList.pastDate}</td>
							</tr>
						</c:forEach>

					</table>
				</div>
				<div class="fanye font_1 color_1">
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
					<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
					<c:set var="currentPage" value="${recordPage.pageNumber}" />
					<c:set var="totalPage" value="${recordPage.totalPage}" />
					<c:set var="actionUrl" value="${ctx}/homepage/qualification/${enterpriseId}" />
					<%@ include file="/WEB-INF/views/pager/_paginate2.jsp"%>

				</div>
			</div>
		</div>

	</div>


	<!--效果html开始-->
	<!--图库弹出层 开始-->

	<div class="mskeLayBg"></div>
	<div class="mskelayBox" style="background:transparent;border:0;">
		<div class="mske_html" style="width:974px;height:488px;position:relative;"></div>
	</div>
	<!--图库弹出层 结束-->
	<!-- qy_m_r 中间右侧结束 -->
	<%--<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>--%>
	<script>
		$(function() {
			$(".rongyuzizhi").parent().addClass("header_nav_sel").siblings()
					.removeClass("header_nav_sel");

			$(".mskeLayBg").height($(document).height());

			$(".hidden").hide();
			$(".small_pic").click(function() {
				$(".mske_html").html($(this).find(".hidden").html());
				$(".mskeLayBg").show();
				$(".mskelayBox").fadeIn(300)

			});
			
			$(".mskelayBox").click(function() {
				$(".mskeLayBg,.mskelayBox").hide()
			});
			
			$(".mskeTogBtn").click(function() {
				$(".msKeimgBox").toggleClass("msKeimgBox2");
				$(this).toggleClass("mskeTogBtn2")
			});

		})
	</script>
</body>
</html>