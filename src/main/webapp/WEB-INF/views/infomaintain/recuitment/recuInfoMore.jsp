<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<title>人才招聘—优蚁环保网</title>
<meta name="keywords" content="优蚁环保，人才招聘，环保人才，环保招聘" />
<meta name="description" content="优蚁环保人才招聘，汇聚海量环保行业岗位，为企业和求职者提供招聘平台，帮助企业招聘专业人才，为专业人才提供求职机会。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />

<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search {
	width: 440px;
	margin-top: 50px;
	margin-left: 80px;
}

.header_middle .header_search select {
	float: left;
	height: 35px;
	line-height: 35px;
	width: 92px;
	border: 1px solid #ccc;
}

.header_middle .header_search .h_s_middle {
	float: left;
}

.header_middle .header_search .h_s_middle input {
	width: 280px;
}

.header_middle .header_search .h_s_middle:before {
	content: "";
	display: block;
	width: 20px;
	height: 24px;
	background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;
	position: absolute;
	left: 5px;
	top: 7px;
}

.header_right {
	margin-top: 30px;
}
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1 {
	height: 40px;
	overflow: hidden;
}

.cur_position {
	font-size: 12px;
	color: #666;
	margin: 15px 0;
	float: left;
}

.main_row_1 .btn_1 {
	width: 110px;
	height: 30px;
	line-height: 30px;
	background-color: #ee7800;
	float: right;
	margin-top: 10px;
	margin-left: 10px;
	position: relative;
	cursor: pointer;
}

.main_row_1 .btn_1 a {
	color: #FFF;
	margin-left: 10px;
}

/*头部banner图片 start*/
.main_banner {
	width: 1000px;
	height: 140px;
	position: relative;
	margin-bottom: 30px;
}

/*头部banner图片 end*/

/*每日行情-行情评估 start*/
.main_rows {
	width: 1000px;
	overflow: hidden;
	margin-bottom: 40px;
}

.main_rows .main_left {
	float: left;
	width: 710px;
}

.main_rows .main_left .main_tab {
	border-bottom: 1px solid #ccc;
	position: relative;
	height: 28px;
	width: 710px;
	margin-bottom: 7px;
}

.main_rows .main_left .main_tab .main_tab_1 {
	position: absolute;
	overflow: hidden;
}

.main_rows .main_left .main_tab .main_tab_1 li {
	font-size: 16px;
	color: #333333;
	margin-right: 34px;
	float: left;
	padding-bottom: 7px;
	border-bottom: 3px none #5ec420;
	margin-top: -1px;
	cursor: pointer;
}

.main_rows .main_left .main_tab .main_tab_1 .cur_tab {
	color: #5ec420;
	border-bottom: 3px solid #5ec420;
	margin-top: -1px;
	z-index: 2;
}

.main_rows .main_left .main_list {
	overflow: hidden;
}

.main_rows .main_left .main_list li {
	height: 36px;
	line-height: 36px;
	border-bottom: 1px dashed #cccccc;
}

.main_rows .main_left .main_list li:last-child {
	border-bottom: none;
}

.main_rows .main_left .main_list li a {
	float: left;
	position: relative;
	margin-left: 5px;
	float: left;
	width: 200px;
}

.main_rows .main_left .main_list li a:first-child::before {
	content: "";
	width: 4px;
	height: 4px;
	border-radius: 3px;
	background-color: #333;
	float: left;
	margin-top: 16px;
	margin-right: 5px
}

.main_rows .main_left .main_list li a:hover {
	color: #5EC520;
}

.main_rows .main_left .main_list li a:hover::before {
	background-color: #5EC520;
}

.main_rows .main_left .main_list li span {
	float: right;
	color: #666666;
}

.main_list_box {
	
}

.main_list_box .main_list_p {
	overflow: hidden;
	margin-top: 15px;
}

.main_list_box .main_list_p img {
	float: left;
	margin-right: 10px;
}

.main_list_box .main_list_p dl {
	float: left;
	width: 590px;
}

.main_list_box .main_list_p dl dt:hover {
	color: #5EC520;
	cursor: pointer;
}

.main_list_box .main_list_p dl dd:hover {
	color: #5EC520;
	cursor: pointer;
}

.main_list_box dl dt {
	
}

.main_list_box dl dd {
	color: #9fa0a0;
}

.main_list_box dl dd span {
	color: #5cb531;
	cursor: pointer;
}

/*翻页*/
.fanye {
	margin-top: 20px;
	margin-bottom: 20px;
	overflow: hidden;
}

.fanye .filp a {
	float: left;
	border: 1px solid #ccc;
	height: 32px;
	line-height: 34px;
	background-color: #fff;
	padding: 0 10px;
	text-align: center;
	float: left;
	margin-left: 10px;
	cursor: pointer;
}

.fanye input[type=text] {
	border: 1px solid #ccc;
	height: 32px;
	float: left;
	margin-left: 10px;
	cursor: pointer;
}

.fanye input[type=text]:focus {
	border: 1px solid #ee7800;
}

.fanye input[type=button] {
	border: 1px solid #ccc;
	height: 34px;
	background-color: #fff;
	width: 102px;
	text-align: center;
	float: left;
	margin-left: 10px;
	cursor: pointer;
}

.fanye .fanye_btn input {
	width: 30px;
}

.fanye .gap {
	display: block;
	width: 5px;
	float: left;
	margin-left: 5px;
}

.fanye .filp .cur_fanye_btn {
	background-color: #5cb531;
	width: 30px;
	border: 1px solid #5cb531;
	color: white;
}

/*微信号*/
.main_right {
	width: 267px;
	float: right;
}

.qr_code {
	width: 265px;
	height: 225px;
	border: 1px solid #ccc;
}

.qr_code dt {
	color: #FFF;
	width: 265px;
	text-align: center;
	line-height: 30px;
	background-color: #5cb531;
}

.qr_code dd {
	width: 164px;
	text-align: center;
	margin: auto;
	margin-top: 2px;
}

.zixun_p {
	width: 235px;
	padding: 20px 15px 5px 15px;
	border: 1px solid #ccc;
	margin-top: 20px;
}

.zixun_p_tit {
	margin-top: 0px;
	height: 25px;
	border-bottom: 1px solid #ccc;
}

.zixun_p_tit span {
	float: left;
	margin-top: -1px;
	height: 25px;
	line-height: 25px;
	border-bottom: 3px solid #5EC520;
	position: relative;
	margin-bottom: 13px;
}

.zixun_p ul {
	width: 235px;
	overflow: hidden;
}

.zixun_p ul li {
	float: left;
	width: 110px;
	margin-bottom: 15px;
}

.zixun_p ul li:nth-of-type(2n) {
	margin-left: 15px;
}

.ie8 .zixun_p ul li {
	margin-left: 7px;
}

.zixun_p ul li img {
	width: 110px;
	margin-bottom: 6px;
}

.zixun_p ul li a {
	width: 110px;
	text-align: center;
	display: block;
	line-height: 18px;
}

.zixun_p:nth-of-type(2) ul li a {
	text-align: left;
}

.zixun_p ul li a:nth-of-type(2) {
	color: #9fa0a0;
}

.zixun_p ul li a:nth-of-type(3) {
	color: #9fa0a0;
}
/*左侧悬窗 start*/
.gf_ad_left {
	width: 80px;
	position: absolute;
	top: 298px;
	left: 50%;
	margin-left: -600px;
	z-index: 16;
}

.gf_ad_left img {
	width: 100%;
}
/*左侧悬窗 end*/

/*右侧悬框*/
.gf_ad_right {
	width: 108px;
	height: 305px;
	position: absolute;
	top: 298px;
	right: 50%;
	margin-right: -622px;
	z-index: 15;
}

.r_a_top {
	width: 100%;
	position: absolute;
	z-index: 17;
}

.r_a_down {
	width: 100%;
	position: absolute;
	z-index: 16;
	top: 92px;
}

.r_a_down>div:nth-of-type(1) {
	padding-top: 18px;
}

.r_a_cc {
	width: 100%;
	background-color: #5cb531;
	border-top: 1px solid #efefef;
	padding: 13px 0px;
	overflow: hidden;
}

.r_a_cc span {
	color: #FFF;
	display: block;
	float: left;
	width: 57px;
	margin-left: 13px;
}

.r_a_cc img {
	display: block;
	margin-left: 8px;
	float: left;
}

.r_a_cell {
	width: 100%;
	padding: 10px 0px;
	background-color: #efefef;
}

.r_a_cell p {
	display: block;
	text-align: center;
}

.r_a_cell>p:nth-of-type(2) {
	color: #5cb531;
	font-size: 14px;
}
</style>
</head>
<body>
	<!--头部 start-->
	<header>
	<div class="line_top"></div>
	<div class="headerBox">

		<!--头部上部 start-->
		<%@ include file="/WEB-INF/views/include/headertop.jsp"%>
		<!--头部上部 end-->

		<!--头部中部 start-->
		<div class="header_middle" style="height: 145px;">
			<h1 class="header_logo">
				<a href="javascript:go('${ctx}/index');"> <img
					src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
				</a>
			</h1>
			<div class="header_search">
				<!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
				<div class="h_s_middle font_1">
					<input type="search" placeholder="请输入你要搜索的内容" value="${position}"
						style="border: 1px solid #ccc; margin-left: -1px;" /> <a
						class="font_3" href="javascript:search();"
						style="margin-left: -1px;">搜索</a>
				</div>
			</div>
			<div class="header_right">
				<img src="${ctxStatic}/img/llhb/mall_tel.png">
			</div>
			<div class="clear"></div>
		</div>
		<!--头部中部部 end-->
	</div>

	<!--头部导航 start--> <%@ include
		file="/WEB-INF/views/include/headerbanner.jsp"%>
	<!--头部导航 end--> </header>
	<!--头部 end-->
	<!--中间部分start-->
	<div class="wrapper">
		<div class="main">
			<div class="main_row_1">
				<div class="cur_position">
					当前位置>优蚁网>资讯><span>人才招聘</span>
				</div>
			</div>
			<div class="main_banner">
				<!--头部banner图片 start-->
				<c:forEach items="${mediuAdImgList}" var="mediuAdImg">
					<img
						<c:if test='${not empty mediuAdImg.redirctHref}'>onclick="window.open('${mediuAdImg.redirctHref}')"</c:if>
						src="${mediuAdImg.picAddr}" alt=""
						style="width: 1000px; height: 140px;">
				</c:forEach>
			</div>
			<div class="main_rows">
				<!--左侧开始-->
				<div class="main_left">
					<div class="main_tab">
						<ul class="main_tab_1">
							<li class="cur_tab">优蚁资讯</li>
							<li>环保动态</li>
							<li>环保知识</li>
							<li>展会信息</li>
							<li>项目招标</li>
							<li>人才招聘</li>
						</ul>
					</div>
					<div class="main_list_box">
						<ul class="main_list">
							<c:forEach items="${infoList }" var="info" begin="0">
								<li style="float: left;" onclick="go('${ctx}/infomaintain/recuitment/detail/${info.id}')">
                                    <a href="javascript:void(0)"class="m_r_ul_a tmui-ellipsis color_1" style="width:150px;">${info.position}</a>
                                    <a href="javascript:void(0)"class="m_r_ul_a tmui-ellipsis color_1" style="width:220px;">${info.company_name}</a>
                                    <a href="javascript:void(0)"class="m_r_ul_a tmui-ellipsis color_1" style="width:100px;">${info.location}</a>
                                    <a href="javascript:void(0)"class="m_r_ul_a tmui-ellipsis color_1" style="width:70px;text-align: center;">${info.person_number}</a>
                                    <a href="javascript:void(0)"class="m_r_ul_a tmui-ellipsis color_1" style="width:110px;text-align: center;"><fmt:formatDate value="${info.create_date}" type="both" pattern="yyyy-MM-dd"/></a>


								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="fanye font_1 color_1">
						<c:set var="currentPage" value="${recordPage.pageNumber}" />
						<c:set var="totalPage" value="${recordPage.totalPage}" />
                        <c:if test='${type=="youyi_news"}'><c:set var="actionUrl" value="${ctx}/news/youyi-news/" /></c:if>
                        <c:if test='${type=="ep_news"}'><c:set var="actionUrl" value="${ctx}/news/environmental-information/" /></c:if>
                        <c:if test='${type=="ep_know"}'><c:set var="actionUrl" value="${ctx}/news/knowledge/" /></c:if>
                        <c:if test='${type=="ep_show"}'><c:set var="actionUrl" value="${ctx}/news/exhibition-information/" /></c:if>
                        <c:if test='${type=="pr_bids"}'><c:set var="actionUrl" value="${ctx}/news/project-biding/" /></c:if>
                        <c:if test='${type=="pe_hire"}'><c:set var="actionUrl" value="${ctx}/news/hiring/" /></c:if>

                        <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
						<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
						<%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
					</div>
				</div>
				<!--左侧结束-->
				<div class="main_right">
					<dl class="qr_code">
						<dt class="font_3">优蚁网微信号</dt>
						<dd>
							<img src="${ctxStatic}/img/llhb/zixun_3.png">
						</dd>
						<dd class="font_1 color_1">扫扫关注我们吧</dd>
					</dl>
					<div class="zixun_p">
						<div class="zixun_p_tit">
							<span class="font_3">资讯图片</span>
						</div>
						<ul class="font_1">
							<c:forEach items="${isPicList}" var="isPic" begin="0" end="3">
								<li><img src="${isPic.small_img}"
									style="width: 110px; height: 93px"> <a
									href="javascript:go('${ctx}/news/newsitem/${isPic.id}')"
									title="${isPic.new_title}"
									style="width: 110px; height: 18px; overflow: hidden">${isPic.new_title}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!--最新会展开始-->
					<div class="zixun_p">
						<div class="zixun_p_tit">
							<span class="font_3">最新展会</span>
						</div>
						<ul class="font_1">
							<c:forEach items="${isNewShowList}" var="isNewShow" begin="0"
								end="3">
								<li><img src="${isNewShow.small_img}"
									style="width: 110px; height: 93px"> <a
									href="javascript:go('${ctx}/news/newsitem/${isNewShow.id}')"
									title="${isNewShow.new_title}"
									style="width: 110px; height: 18px; overflow: hidden">${isNewShow.new_title}</a>
									<a title="${isNewShow.hold_time }"
									style="width: 110px; height: 18px; overflow: hidden">时间：${isNewShow.hold_time}</a>
									<a title="${isNewShow.hold_place}"
									style="width: 110px; height: 18px; overflow: hidden">举办地：${isNewShow.hold_place}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!--最新会展结束-->
				</div>
				<!--右侧技术-->
			</div>

		</div>
	</div>
	<!--中间部分end-->

	<!--底部 start-->
	<footer> <%@ include
		file="/WEB-INF/views/include/footer_top.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
	</footer>
	<!--底部 end-->
	<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
	<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
	<script>
		//banner 样式切换
		$(".header_nav ul li").eq(6).addClass("header_nav_sel");
		<!--轮播广告-->
		$(document).ready(
				function() {
					/*获取图片的盒子对象*/
					var $fadeDom = $(".fade_list");
					/*控制轮播的索引*/
					var idx = 0;
					/*定时器*/
					var fadeTimer = null;
					/*轮播时间*/
					var timer = 3000;
					var length = $(".fade_list li").length;
					$(".main_banner .fade_btn").html("");
					$(".fade_list li").each(
							function() {
								$(".main_banner .fade_btn").append(
										'<a href="javascript:void(0);" ></a>');
							});
					$(".main_banner .fade_btn").find("a:first").addClass(
							"h_b_btn_sel");

					$(".fade_btn").on(
							"click",
							"a",
							function() {
								clearInterval(fadeTimer);
								idx = $(this).index();
								changePic(idx);
								$(this).addClass("h_b_btn_sel").siblings()
										.removeClass("h_b_btn_sel");
							}).mouseleave(function() {
						playFader();
					}).mouseover(function() {
						clearInterval(fadeTimer);
					});

					function playFader() {
						fadeTimer = setInterval(function() {
							idx++;
							if (idx == length) {
								idx = 0;
							}
                            changePic(idx);

						}, timer);
					}
					/*执行轮播*/
					playFader();
				});

		function changePic(idx) {
			$(".main_top_nav_middle").find(".fade_btn a").eq(idx).addClass(
					"h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
			$(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
        }

		$(function() {
			var contentNavArr = [];
			var ad_top = $(".header_banner").each(function() {
				contentNavArr.push($(this).offset().top);

			});
			/*滚动条事件*/
			$(window).scroll(function() {
				/*左右悬窗定位*/
				if ($(window).scrollTop() > contentNavArr[0]) {
					$(".nav_bottomlist").show();
					$(".gf_ad_left,.gf_ad_right").css({
						position : "fixed",
						top : "95px"
					});

				} else if ($(window).scrollTop() <= contentNavArr[0]) {
					$(".nav_bottomlist").hide();
					$(".gf_ad_left,.gf_ad_right").css({
						position : "absolute",
						top : "311px"
					});
				}
			});
			$(".content").click(function() {
				go('固废供求-副本-9-17.html');
			});
		})
	</script>
	<!--翻页-->
	<script>
		//上一页
		$(".fanye_left")
				.click(
						function() {
							if ('${currentPage}' != 1) {
								window.location.href = '${actionUrl}${currentPage - 1}${urlParas}';
							}
						});
		//下一页
		$(".fanye_right")
				.click(
						function() {
							if ('${currentPage}' != '${totalPage}') {
								window.location.href = '${actionUrl}${currentPage + 1}${urlParas}';
							}
						});
		//跳转
		$(" .filp input:last").click(function() {
			var text = $(".filp :text:last").val();
			var re = /^[0-9]+$/;
			if (re.test(text) && parseInt(text) <= '${totalPage}') {
				window.location.href = '${actionUrl}' + text + '${urlParas}';
			}
		});
		/*========切换资讯类别的样式========*/
		$(function() {
			var type = "${type}";
			if (type == "youyi_news") {
				$(".main_left .main_tab ul li").eq(0).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(0).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("优蚁资讯");
			} else if (type == "ep_news") {
				$(".main_left .main_tab ul li").eq(1).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(1).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("环保动态");
			} else if (type == "ep_know") {
				$(".main_left .main_tab ul li").eq(2).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(2).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("环保知识");
			} else if (type == "ep_show") {
				$(".main_left .main_tab ul li").eq(3).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(3).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("展会信息");
			} else if (type == "pr_bids") {
				$(".main_left .main_tab ul li").eq(4).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(4).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("项目招标");
			} else {
				$(".main_left .main_tab ul li").eq(5).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(5).siblings().removeClass(
						"cur_tab");
				$(".cur_position span").html("人才招聘");
			}
		});
		/*========切换资讯类别========*/
		$(".main_left .main_tab ul li").click(function() {
			var index = $(this).index();
			var type = "";
			if (index == 0) {
				type = "youyi_news";
                go("${ctx}/news/youyi-news");
			} else if (index == 1) {
				type = "ep_news";
                go("${ctx}/news/environmental-information");

            } else if (index == 2) {
				type = "ep_know";
                go("${ctx}/news/knowledge");

            } else if (index == 3) {
				type = "ep_show";
                go("${ctx}/news/exhibition-information");

            } else if (index == 4) {
				type = "pr_bids";
                go("${ctx}/news/project-biding");

            } else if (index == 5) {
				type = "pe_hire";
                go("${ctx}/news/hiring");

            }
		});
		//搜索
		function search() {
			var value = $(".header_search .h_s_middle input").val();
			if (value != null && value != "") {
				//go("${ctx}/news/search?title=" + value);
				go("${ctx}/infomaintain/recuitment/search?position=" + value);
			}
		}
		//回车键搜索
		$(".header_search .h_s_middle input").focus(function() {
			$(document).on("keydown", function(e) {
				var ev = document.all ? window.event : e;
				if (ev.keyCode == 13) {
					var value = $(".header_search .h_s_middle input").val();
					value = value.replace(/(\s*$)/g, "");
					if (value != "") {
						//go("${ctx}/news/search?title=" + value);
						go("${ctx}/infomaintain/recuitment/search?position=" + value);
					}
				}
			})
		});
		$(".header_search .h_s_middle input").blur(function() {
			$(document).unbind("keydown");
		})
	</script>
</body>
</html>