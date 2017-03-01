<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="net.sf.json.JSONArray"%>
<%@ page language="java" import="net.sf.json.JSONObject"%>
<%@ page language="java"
	import="com.qdum.llhb.productmana.ProdTypeUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>优蚁环保—企业身边的环保顾问，国家环保服务业试点，领先的环保行业一站式服务平台</title>
<meta name="keywords" content="优蚁环保，环保顾问，环保服务,环保咨询" />
<meta name="description" content="优蚁环保是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/layui/css/layui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/flexslider/flexslider.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/v2/index.css" />
<style>
.bottom_ad{height:115px;}

/*banner轮播  start*/
.lunbo {
	height: 400px;
	width: 100%;
	position: relative;
	overflow: hidden;
}

.lunbo .imagelist {
	list-style: none;
	width: 500%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.lunbo .imagelist li {
	float: left;
	width: 20%;
	height: 100%;
}

.lunbo .buttons {
	width: 1200px;
	background-color: blue;
	margin: 0 auto;
	position: relative;
}
.lunbo .buttons .leftBut {
	width: 22px;
	height: 35px;
	position: absolute;
	left: -60px;
	top: 182px;
	background: url(/llhb/static/img/v2/index/left.png) no-repeat;
	cursor: pointer;
}

.lunbo .buttons .rightBut {
	width: 22px;
	height: 35px;
	position: absolute;
	right: -60px;
	top: 182px;
	background: url(/llhb/static/img/v2/index/right.png) no-repeat;
	cursor: pointer;
}

.chuantong .imgnav {
	list-style: none;
	position: absolute;
	bottom: 76px;
	left: 50%;
	margin-left: -45px;
	width: 346px;
	height: 20px;
}

.chuantong .imgnav li {
	float: left;
	width: 62px;
	height: 62px;
	margin-right: 10px;
	background: #f00;
	overflow: hidden;
	cursor: pointer;
}

.chuantong .imgnav li.cur {
	border: 3px solid #7ACF39;
}
/*banner轮播  end*/

/*2F轮播  start*/
.lunbo1 {
	height: 300px;
	width: 100%;
	position: relative;
	overflow: hidden;
}

.lunbo1 .imagelist {
	list-style: none;
	width: 500%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
}

.lunbo1 .imagelist li {
	float: left;
	width: 20%;
	height: 100%;
}

.lunbo1 .imagelist li.no0 {
	background: url(/llhb/static/img/v2/index/slide1.jpg) no-repeat center
		center;
}

.lunbo1 .imagelist li.no1 {
	background: url(/llhb/static/img/v2/index/slide2.jpg) no-repeat center
		center;
}

.lunbo1 .imagelist li.no2 {
	background: url(/llhb/static/img/v2/index/slide3.jpg) no-repeat center
		center;
}

/*.lunbo1 .imagelist li.no3 {
	background: url(/llhb/static/img/v2/index/slide3.jpg) no-repeat center
		center;
}*/

.lunbo1 .buttons {
	width: 1200px;
	background-color: blue;
	margin: 0 auto;
	position: relative;
}

.lunbo1 .buttons .leftBut {
	width: 22px;
	height: 35px;
	position: absolute;
	left: -60px;
	top: 140px;
	background: url(/llhb/static/img/v2/index/left.png) no-repeat;
	cursor: pointer;
}

.lunbo1 .buttons .rightBut {
	width: 22px;
	height: 35px;
	position: absolute;
	right: -60px;
	top: 140px;
	background: url(/llhb/static/img/v2/index/right.png) no-repeat;
	cursor: pointer;
}

.chuantong1 .imgnav {
	list-style: none;
	position: absolute;
	bottom: 40px;
	left: 395px;
	width: 446px;
	height: 20px;
}

.chuantong1 .imgnav li {
	float: left;
	width: 120px;
	height: 34px;
	margin-right: 25px;
	background: #697b7f;
	overflow: hidden;
	cursor: pointer;
	color: #fff;
	text-align: center;
	font-size: 14px;
	line-height: 34px;
}

.chuantong1 .imgnav li.cur {
	background: #ee7800;
}
/*2F轮播 end*/

.jq22-search-form {
	width: 474px;
	overflow: hidden;
	float: left;
	margin: 30px 0 0 70px;
}

.jq22-search-form .search-bd {
	height: 25px;
}

.jq22-search-form .search-bd li {
	font-size: 12px;
	height: 25px;
	line-height: 25px;
	float: left;
	cursor: pointer;
	color: #666;
}

.jq22-search-form .search-bd li.selected {
	color: #008f00;
}

.jq22-search-form .search-hd {
	height: 34px;
	background-color: #008f00;
	padding: 3px;
	position: relative;
}

.jq22-search-form .search-hd .search-input {
	width: 370px;
	height: 22px;
	line-height: 22px;
	padding: 6px 0;
	background: none;
	text-indent: 10px;
	border: 0;
	outline: none;
	position: relative;
	left: 3px;
	top: 0;
	z-index: 5;
	margin-left: -10px;
}

.jq22-search-form .search-hd .btn-search {
	width: 96px;
	height: 34px;
	line-height: 34px;
	position: absolute;
	right: 3px;
	top: 3px;
	border: 0;
	z-index: 6;
	cursor: pointer;
	font-size: 18px;
	color: #fff;
	background: none;
	outline: none;
}

.jq22-search-form .search-hd .pholder {
	display: inline-block;
	font-size: 12px;
	color: #999;
	position: absolute;
	left: 0;
	top: 11px;
	z-index: 4;
	padding-left: 12px;
	top: 11px;
}

.jq22-search-form .search-hd .s2,.jq22-search-form .search-hd #s2 {
	display: none;
}

.jq22-search-form .search-hd .s3,.jq22-search-form .search-hd #s3 {
	display: none;
}

.jq22-search-form .search-hd .s4,.jq22-search-form .search-hd #s4 {
	display: none;
}

.jq22-search-form .search-bg {
	width: 370px;
	height: 34px;
	background-color: #fff;
	position: absolute;
	left: 3px;
	top: 3px;
	z-index: 1;
}

/* 环保需求弹框样式start */
.advisory_agents h3{width:100px;height:40px;margin: 0 auto;font-weight:bold;text-align: center;margin-top:80px;font-size:20px;background:url(${ctxStatic}/img/v2/solidsupply/bottom_line.png) 0 36px no-repeat;}
.advisory_agents .details_information{width:616px;height:80px;margin:0 auto;margin-top:76px;}
.advisory_agents .details_information .c_desc{display: block;float: left;width: 500px;overflow: hidden;line-height: 21px;font-weight: normal;margin: 6px 0 0 10px;}
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
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
	<!-- 轮播区及浏览区开始 -->
	<div class="lunbo chuantong">
		<ul class="imagelist">
			<c:forEach items="${bannerlist}" var="b">
				<li>
					<a style="width:100%;height:400px;background: url(${b.getStr('pic_addr')}) center no-repeat;display:block;"
					target="_blank" href="${b.getStr('redirct_href')}" title="${b.getStr('show_name')}"></a>
				</li>
			</c:forEach>
			<!-- 
			<li>
				<a style="width:100%;height:400px;background: url(${bannerlist[0].getStr('pic_addr')}) center no-repeat;display:block;"
				target="_blank" href="${bannerlist[0].getStr('redirct_href')}" title="${bannerlist[0].getStr('show_name')}"></a>
			</li>
			<li>
				<a style="width:100%;height:400px;background: url(${bannerlist[1].getStr('pic_addr')}) center no-repeat;display:block;"
				target="_blank" href="${bannerlist[1].getStr('redirct_href')}" title="${bannerlist[1].getStr('show_name')}"></a>
			</li>
			<li>
				<a style="width:100%;height:400px;background: url(${bannerlist[2].getStr('pic_addr')}) center no-repeat;display:block;"
				target="_blank" href="${bannerlist[2].getStr('redirct_href')}" title="${bannerlist[2].getStr('show_name')}"></a>
			</li> -->
		</ul>
		<div class="buttons">
			<span class="leftBut"></span> <span class="rightBut"></span>
		</div>

	</div>
	<!-- 轮播区及浏览区结束 -->
	<!-- 电商楼层开始 -->
	<div id="mainn">
		<div class="louceng">
			<h2>
				环保专题<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">企业环保工作流程专题知识</b>
			</h2>
			<a class="process"
				href="http://www.yyhb365.com/youyi/process-special.html"
				target="_blank">环保全流程GO</a>
			<ul class="green_icon">
				<%
					String[] names = {"no99", "no98", "no97", "no96", "no95", "no94",
									"no93", "no92"};
							int idx = 0;
				%>
				<c:forEach items="${ads }" var="ads" varStatus="sta">
					<c:if test="${ads.type eq 'M' && ads.stype eq 'S6' }">
						<%
							idx++;
						%>
						<c:choose>
							<c:when test="${empty ads.href }">
								<a target="_blank" href="${ctx }/index/showComing">
									<li class="<%=names[idx - 1]%>"></li> </a>
							</c:when>
							<c:otherwise>
								<a target="_blank" href="${ads.href }">
									<li class="<%=names[idx - 1]%>"></li> </a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!--2F轮播start -->
		<div class="louceng lc2">
			<h2>
				环保顾问<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">专业环保工作指导，助企业环保规范化</b>
			</h2>
			<div class="lunbo1 chuantong1">
				<ul class="imagelist">
					<li class="no0"><a href="#"></a>
					</li>
					<li class="no1"><a href="#"></a>
					</li>
					<li class="no2"><a href="#"></a>
					</li>
				</ul>
				<div class="buttons">
					<span class="leftBut"></span> <span class="rightBut"></span>
				</div>
				<ul class="imgnav">
					<li class="cur">我们的服务</li>
					<li>我们的实力</li>
					<li>我们的资源</li>
				</ul>
			</div>

		</div>
		<!-- 2F轮播end-->
		<div class="louceng lc3">
			<h2>
				明星案列<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">环保顾问服务案例展示</b>
			</h2>
			<a href="${ctx }/advisorCase/intoMoreCase?pageNumber=1"
				target="_blank"><p class="star_case">更多>></p>
			</a>
			<!--明星案列轮播start -->
			<div id="main" role="main">
				<div id="slider_3F" class="flexslider" style="margin: 0;">
					<ul class="slides">
						<c:forEach items="${caseList }" var="caseInfo" varStatus="sta">
							<c:if test="${sta.index%3==0 }">
								<li>
							</c:if>
							<div id="${caseInfo.get('id') }" class="starCaseClick">
								<img src="${caseInfo.get('img') }">
									<p class="lucency">${caseInfo.get('title') }</p>
									<p class="particulars zxx_text">${caseInfo.get('summary') }</p>
							</div>
							<c:if test="${(sta.index-2)%3==0||sta.last}">
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!--明星案列轮播end -->
			<!-- <div class="immediately">
				<img style="cursor:pointer;" src="${ctxStatic}/img/v2/index/apply.jpg">
			</div>
			<form method="post" action="${ctx }/evmAdvisor/consult/add">
				<div class="advisory_agent">
					<div class="counsel">
						<h3>咨询顾问</h3>
					</div>
					<div class="theme">
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;">主题:</div><input type="text" style="width:314px;height:32px;margin-left:6px;padding-left:6px;"></input></p>
		                <p><div style="font-size:16px;width:70px;float:left;;text-align:right;">分类:</div>
		                  <select style="width:323px;height:32px;margin-left:6px;">
		                  <c:forEach items="${consultTypes}" var="type">
							<option value="${type.get('label')}">${type.get("label")}</option>
							</c:forEach>
		                </select>
		                </p>
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;">内容:</div><textarea style="margin-left:6px;height:94px;width:322px;"></textarea></p>
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;">联系人:</div><input type="text" style="width:320px;height:32px;margin-left:6px;"></input></p>
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;">联系电话:</div><input type="text" style="width:320px;height:32px;margin-left:6px;"></input></p>
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;">电子邮箱:</div><input type="text" style="width:320px;height:32px;margin-left:6px;"></input></p>
		                <p><div style="width:70px;text-align:right;float:left;font-size:16px;">QQ:</div><input type="text" style="width:320px;height:32px;margin-left:6px;"></input></p>
		                <p><div style="font-size:16px;width:70px;float:left;text-align:right;float:left;line-height:32px;margin-bottom:20px;">验证码:</div><input type="text" style="width:208px;height:32px;margin-left:6px;float:left;"></input><p class="checkCode" style="width:90px;height:34px;height:32px\9;border:1px solid green;margin-left:12px;color:green;float:right;text-align:center;line-height:34px;cursor: pointer;">发送验证码</p></p>
		                <div style="width:324px;height:40px;background-color:green;clear:both;margin:20px 0 0 76px;"><input class="advisorConsult" type="button" value="提交" style="width:324px;height:40px;background-color:#008f01;border:none;color:#fff;font-size:16px;cursor: pointer;"></div>
		            </div>
					
				</div>
			</form> -->
		</div>
		<div class="louceng lc4">
			<h2>
				资讯信息<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">实时掌握最新最热门的环保行业新闻及原创优蚁资讯</b>
			</h2>
			<div class="The_latest shopp_tabb">
				<div class="hd">
					<h4>环保需求</h4>
					<!-- <span class="current" id="eqreq">环保需求</span>
					<span class="" id="eqquote">环保报价</span> -->
	            </div>
				<p>
					<a href="${ctx}/supply-demand" target="_blank">更多>></a>
				</p>
				<div class="newNeed bd" style="height:355px;">
					<ul class="Info cur">
						<c:forEach items="${crs}" var="c">
							<li>
								<a class="showNeed" data-id="${c.id}" style="cursor:pointer;">
									<span>${c.remarks}</span>
									<span>${c.trade_status}</span>
									<span>
										<fmt:formatDate value="${c.create_date}" pattern="yyyy-MM-dd" />
									</span>
								</a>
							</li>
						</c:forEach>
					</ul>
					<!-- <ul class="Info">
						<c:forEach items="${quotes}" var="q">
							<li>
								<a href="javascript:void(0)" style="cursor:pointer;">
									<c:if test="${q.num eq 1 }">
						            	<span>环评报价</span>
						         	</c:if>
						            <c:if test="${q.num eq 2 }">
						            	<span>监测报价</span>
						          	</c:if>
									<span>${q.name }</span>
									<span>${fn:substring(q.date, 0, 10)}</span>
								</a>
							</li>
						</c:forEach>
					</ul> -->
				</div>
			</div>

			<div class="industry shopp_tabb">
				<div class="hd">
	              <span class="current" sttyel>优蚁资讯</span>
	              <span>行业资讯</span>
            	</div>
				<p>
					<a href="${ctx}/news" target="_blank">更多>></a>
				</p>
				<div class="bd">
				<!-- 优蚁资讯start  -->
				<ul class="trade cur">
					<div
						style="height: 82px; width: 376px; margin: 0 auto; position: relative; margin-top: 19px;">
						<div style="float: left;">
							<img style="width: 108px;height: 82px;" src="${youyiList[0].simg}" />
						</div>
						<div style="float: left;">
							<h3
								style="width: 252px;font-weight: bold;padding-left: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
								<a href="${ctx}/news/newsitem/${youyiList[0].id}" target="_blank">${youyiList[0].title}</a>
							</h3>
							<p
								style="font-size: 12px; width: 265px; color: #9fa0a0; position: absolute; right: -8px; top: 21px; padding-right: 5px;">
								<c:choose>
									<c:when test="${fn:length(youyiList[0].content) >51 }">
	                                    ${fn:substring(youyiList[0].content,0,51) }...
	                                </c:when>
									<c:otherwise>
	                                    ${youyiList[0].content }
	                                </c:otherwise>
								</c:choose>

								<b style="color: #69b83a;"><a
									href="${ctx}/news/newsitem/${youyiList[0].id}" target="_blank">[全文]</a>
								</b> <b style="padding-left: 54px; font-weight: normal;"> <fmt:formatDate
										value="${youyiList[0].time}" pattern="yyyy-MM-dd" /> </b>
							</p>
						</div>
					</div>
					<c:forEach items="${youyiList}" var="n" begin="1" end="7">
						<li class="no1"
							style="width: 240px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 14px 0 0 10px;">
							<a href="${ctx}/news/newsitem/${n.id}" target="_blank">${n.title}
								<span><fmt:formatDate value="${n.time}"
										pattern="yyyy-MM-dd" /> </span> </a></li>
					</c:forEach>
				</ul>
				<!-- 优蚁资讯end  -->
				<!-- 行业资讯start  -->
				<ul class="trade">
					<div
						style="height: 82px; width: 376px; margin: 0 auto; position: relative; margin-top: 19px;">
						<div style="float: left;">
							<img style="width: 108px;height: 82px;" src="${news[0].simg}" />
						</div>
						<div style="float: left;">
							<h3
								style="width: 252px; font-weight: bold;padding-left: 5px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
								<a href="${ctx}/news/newsitem/${news[0].id}" target="_blank">${news[0].title}</a>
							</h3>
							<p
								style="font-size: 12px; width: 265px; color: #9fa0a0; position: absolute; right: -8px; top: 21px; padding-right: 5px;">
								<c:choose>
									<c:when test="${fn:length(news[0].content) >51 }">
	                                    ${fn:substring(news[0].content,0,51) }...
	                                </c:when>
									<c:otherwise>
	                                    ${news[0].content }
	                                </c:otherwise>
								</c:choose>

								<b style="color: #69b83a;"><a
									href="${ctx}/news/newsitem/${news[0].id}" target="_blank">[全文]</a>
								</b> <b style="padding-left: 54px; font-weight: normal;"> <fmt:formatDate
										value="${news[0].time}" pattern="yyyy-MM-dd" /> </b>
							</p>
						</div>
					</div>
					<c:forEach items="${news}" var="n" begin="1" end="7">
						<li class="no1"
							style="width: 240px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 14px 0 0 10px;">
							<a href="${ctx}/news/newsitem/${n.id}" target="_blank">${n.title}
								<span><fmt:formatDate value="${n.time}"
										pattern="yyyy-MM-dd" /> </span> </a></li>
					</c:forEach>
				</ul>
				<!-- 行业资讯end  -->
				</div>
			</div>
			<div class="problems">
				<h4>常见环保问题</h4>
				<p>
					<a href="${ctx}/news/knowledge" target="_blank">更多>></a>
				</p>
				<ul class="questions">
					<c:forEach items="${know}" var="k" begin="0" end="10">
						<li><a href="${ctx}/news/newsitem/${k.id}" target="_blank">
								<span
								style="width: 240px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									${k.title}</span> <b><fmt:formatDate value="${k.time}"
										pattern="yyyy-MM-dd" />
							</b> </a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="louceng lc5">
			<h2>
				优质企业<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">汇集环保行业优质企业，资质认证、实力保障</b>
			</h2>
			<p class="quality"><a href="${ctx}/EntLib" target="_blank">更多>></a></p>
			<div class="main-page">
				<div class="left">
					<div class="nav-back"></div>
					<div class="nav">
						<div class="on">环境评估与认证</div>
						<div>环境工程与运营</div>
						<div>环境监测</div>
						<div style="border-bottom: none;">废物处理处置</div>
					</div>
				</div>
				<div class="right">
					<div class="content-back"></div>
					<div class="content">
						<div>
							<ul>
								<c:forEach items="${yzqy1}" var="y">
									<a href="${ctx}/homepage/${y.companyId}" target="_blank">
										<li>
											<div style="width: 198px;height: 118px;text-align: center;vertical-align: middle; display: table-cell;">
												<img style="max-width: 165px; max-height: 53px;" src="${y.logo}">
											</div>
										</li>
									</a>
								</c:forEach>
							</ul>
						</div>
						<div>
							<ul>
								<c:forEach items="${yzqy2}" var="y">
									<a href="${ctx}/homepage/${y.companyId}" target="_blank">
										<li>
											<div style="width: 198px;height: 118px;text-align: center;vertical-align: middle; display: table-cell;">
												<img style="max-width: 165px; max-height: 53px;" src="${y.logo}">
											</div>
										</li>
									</a>
								</c:forEach>
							</ul>
						</div>
						<div>
							<ul>
								<c:forEach items="${yzqy3}" var="y">
									<a href="${ctx}/homepage/${y.companyId}" target="_blank">
										<li>
											<div style="width: 198px;height: 118px;text-align: center;vertical-align: middle; display: table-cell;">
												<img style="max-width: 165px; max-height: 53px;" src="${y.logo}">
											</div>
										</li>
									</a>
								</c:forEach>
							</ul>
						</div>
						<div>
							<ul>
								<c:forEach items="${yzqy4}" var="y">
									<a href="${ctx}/homepage/${y.companyId}" target="_blank">
										<li>
											<div style="width: 198px;height: 118px;text-align: center;vertical-align: middle; display: table-cell;">
												<img style="max-width: 165px; max-height: 53px;" src="${y.logo}">
											</div>
										</li>
									</a>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="louceng lc6">
			<h2>
				环保商城<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">覆盖环保全行业，一站式采购商品与服务</b>
			</h2>
			<ul class="species_right">
				<li><a href="${ctx}/mall/142" target="_blank">原料</a></li>
				<li><a href="${ctx}/mall/932" target="_blank">设备</a></li>
				<li><a href="${ctx}/mall/308" target="_blank">环境工程</a></li>
				<li><a href="${ctx}/mall/309" target="_blank">环境评估与认证</a></li>
				<li><a href="${ctx}/mall/310" target="_blank">环境检测</a></li>
			</ul>
			<div class="material">
				<p style="width: 396px; height: 265px;">
					<img src="${ctxStatic}/img/v2/index/equipment.jpg"
						style="width: 396px; height: 265px;">
				</p>
				<div class="shop_tab">
					<div class="hd">
						<span class="current raw">环保原料</span> <span class="protection">环保设备</span>
						<span class="last">环保服务</span>
					</div>
					<div class="bd">
						<ul class="cur">
							<c:forEach items="${mat}" var="m">
								<li><a href="${ctx}/mall/${m.id}" target="_blank">${m.name}</a>
								</li>
							</c:forEach>
						</ul>
						<ul>
							<c:forEach items="${equ}" var="e">
								<li><a href="${ctx}/mall/${e.id}" target="_blank">${e.name}</a>
								</li>
							</c:forEach>
						</ul>
						<ul>
							<c:forEach items="${ser}" var="s">
								<li><a href="${ctx}/mall/${s.id}" target="_blank">${s.name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<ul class="merchandise">
				<li
					style="border-right: 0; border-top: 0; width: 199px; height: 217px;"><a
					href="${ctx}/mall/143,158" target="_blank" class="shop1"><img
						src="${ctxStatic}/img/v2/index/6f_lx.jpg">
				</a>
					<div class="filter" style="">滤芯</div></li>
				<li
					style="border-right: 0; border-top: 0; width: 199px; height: 217px;"><a
					href="${ctx}/mall/146,211" target="_blank" class="shop2"><img
						src="${ctxStatic}/img/v2/index/6f_hxt.jpg">
				</a>
					<div class="filter" style="">活性炭</div></li>
				<li
					style="border-right: 0; border-top: 0; width: 199px; height: 217px;"><a
					href="${ctx}/mall/144,174" target="_blank" class="shop3"><img
						src="${ctxStatic}/img/v2/index/6f_clm.jpg">
				</a>
					<div class="filter" style="">超滤膜</div></li>
				<li
					style="border-right: 0; border-top: 0; border-bottom: 0; width: 199px; height: 218px;"><a
					href="${ctx}/mall/933,951" target="_blank" class="shop4"><img
						src="${ctxStatic}/img/v2/index/6f_rhssb.jpg">
				</a>
					<div class="filter" style="">软化水设备</div></li>
				<li
					style="border-right: 0; border-top: 0; border-bottom: 0; width: 199px; height: 218px;"><a
					href="${ctx}/mall/942,1024" target="_blank" class="shop5"><img
						src="${ctxStatic}/img/v2/index/6f_szjcy.jpg">
				</a>
					<div class="filter" style="">水质监控仪</div></li>
				<li
					style="border-right: 0; border-top: 0; border-bottom: 0; width: 199px; height: 218px;"><a
					href="${ctx}/mall/934,961" target="_blank" class="shop6"><img
						src="${ctxStatic}/img/v2/index/6f_yqtlsb.jpg">
				</a>
					<div class="filter" style="">烟气脱硫设备</div></li>
			</ul>
			<div class="surveymeter">
				<a href="${ctx}/mall/939,996" target="_blank" class="shop7"><img
					src="${ctxStatic}/img/v2/index/6f_scstjcy.jpg">
				</a>
				<div class="filter">手持式气体检测仪</div>
			</div>
			<div class="The_eia">
				<a href="${ctx}/mall/309,319" target="_blank" class="shop8"><img
					src="${ctxStatic}/img/v2/index/6f_hpbx.jpg">
				</a>
				<div class="filter">环评编写</div>
			</div>
			<div class="govern">
				<a href="${ctx}/mall/308,311" target="_blank" class="shop9"><img
					src="${ctxStatic}/img/v2/index/6f_dqzlgc.jpg">
				</a>
				<div class="filter">大气治理工程</div>
			</div>
		</div>
		<div class="louceng lc7">
			<h2>
				人才招聘<b
					style="color: #cecece; font-weight: normal; padding-left: 15px;">提供便捷的招聘求职渠道，汇集热门招聘职位</b>
			</h2>
			<div class="recruitment">
				<div class="akk" style="width: 600px; height: 248px; float: left;">
					<ul class="recruitment_left">
						<c:forEach items="${recuInfoList}" var="re" begin="0" end="9">
							<li><a href="${ctx}/infomaintain/recuitment/detail/${re.id}"
								target="_blank"> <span class="environmental">${re.position}</span>
							</a> <a href="${re.company_href}" target="_blank"> <span
									class="syndicate">${re.company_name}</span> <span
									class="date_of"><fmt:formatDate
											value="${re.create_date}" pattern="[MM-dd]" /> </span> </a></li>
						</c:forEach>
					</ul>
				</div>
				<div
					style="width: 1px; height: 200px; background-color: #cecece; float: left; margin-top: 28px;"></div>
				<div class="attk">
					<ul class="recruitment_right">
						<c:forEach items="${recuInfoList}" var="re" begin="10" end="19">
							<li><a href="${ctx}/infomaintain/recuitment/detail/${re.id}"
								target="_blank"> <span class="environmental">${re.position}</span>
							</a> <a href="${re.company_href}" target="_blank"> <span
									class="syndicate">${re.company_name}</span> <span
									class="date_of"><fmt:formatDate
											value="${re.create_date}" pattern="[MM-dd]" /> </span> </a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="recommend_j">
				<p style="font-size: 20px; color: #69b83a;">推荐企业</p>
			</div>
			<!-- 推荐企业start-->
			<div id="main" role="main">
				<section class="slider">
			        <div id="slider_4F" class="flexslider" style="margin:0;height:210px;">
			          <ul class="slides">
			            <!-- <li>
			              <a href="http://www.baidu.com" target="_blank"><div class="enterprises" style="border-right:0;border-bottom:0;width:399px;text-align: center; vertical-align: middle;display: table-cell;"><img style=" max-width: 398px;
    max-height: 138px;" src="${ctxStatic }/img/v2/index/1F.png"></div></a>
			              <div class="enterprises" style="border-right:0;border-bottom:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-bottom:0;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-right:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-right:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises"><img src="images/hb6.jpg"></div>
			            </li>
			            <li>
			              <div class="enterprises" style="border-right:0;border-bottom:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-right:0;border-bottom:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-bottom:0;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-right:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises" style="border-right:0;width:399px;"><img src="images/hb6.jpg"></div>
			              <div class="enterprises"><img src="images/hb6.jpg"></div>
			            </li> -->
			            	<c:forEach items="${recoList}" var="r">
				            <li>
				              <a href="${r[0].redirct_href}" target="_blank"><div class="enterprises recommends" style="background:url(${r[0].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[1].redirct_href}" target="_blank"><div class="enterprises small" style="border-left:0;border-right:0;border-bottom:0;height:69px;background:url(${r[1].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[2].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;border-bottom:0;background:url(${r[2].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[3].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;border-bottom:0;background:url(${r[3].pic_addr}) center no-repeat;"></div></a>
				
				
				              <a href="${r[4].redirct_href}" target="_blank"><div class="enterprises small" style="height:69px;border-bottom:0;background:url(${r[4].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[5].redirct_href}" target="_blank"><div class="enterprises small" style="border-left:0;border-right:0;height:68px;background:url(${r[5].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[6].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;height:68px;background:url(${r[6].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[7].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;height:68px;background:url(${r[7].pic_addr}) center no-repeat;"></div></a>
				
				
				              <a href="${r[8].redirct_href}" target="_blank"><div class="enterprises small" style="height:68px;background:url(${r[8].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[9].redirct_href}" target="_blank"><div class="enterprises small" style="width:198px;border-top:0;border-right:0;background:url(${r[9].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[10].redirct_href}" target="_blank"><div class="enterprises small" style="border-top:0;border-right:0;background:url(${r[10].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[11].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;border-top:0;background:url(${r[11].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[12].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;border-top:0;border-top:0;background:url(${r[12].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[13].redirct_href}" target="_blank"><div class="enterprises small" style="border-right:0;border-top:0;background:url(${r[13].pic_addr}) center no-repeat;"></div></a>
				              <a href="${r[14].redirct_href}" target="_blank"><div class="enterprises small" style="border-top:0;background:url(${r[14].pic_addr}) center no-repeat;"></div></a>
				              
				            </li>
				            </c:forEach>
			          </ul>
			        </div>
		      </section>
		</div>
		<!-- 推荐企业end-->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
	<!-- 新增的填写环保内容start-->
	<div class="bottom_slide_box">
		<div class="bottom_slide_click">
			<div class="zxbj_details">
				<div class="bottom_slide_img"></div>
				<p class="authority tubiao"></p>

			</div>
		</div>
		<div class="slide_box_shade">
			<div class="cons_bj">
				<p class="official"></p>
				<form method="post" action="${ctx }/evmAdvisor/consult/add">
					<div class="cons_bj_c">
						<div class="theme">
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">主题:</div>
								<input name="advisorConsult.title" type="text"
									style="width: 440px; height: 32px; margin-left: 6px; padding-left: 6px;"></input>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">分类:</div>
								<select name="advisorConsult.type"
									style="width: 323px; height: 32px; margin-left: 6px;line-height:32px\9;">
									<option value="">请选择分类</option>
									<c:forEach items="${consultTypes}" var="type">
										<option value="${type.get('label')}">${type.get("label")}</option>
									</c:forEach>
								</select>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">内容:</div>
								<textarea name="advisorConsult.content" style="margin-left: 6px; height: 94px; width: 448px;"></textarea>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">联系人:</div>
								<input name="advisorConsult.contact" type="text"
									style="width: 446px; height: 32px; margin-left: 6px;"></input>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">联系电话:</div>
								<input name="advisorConsult.phone" class="phone" type="text"
									style="width: 446px; height: 32px; margin-left: 6px;"></input>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right;">电子邮箱:</div>
								<input name="advisorConsult.email" type="text"
									style="width: 446px; height: 32px; margin-left: 6px;"></input>
							</p>
							<p>
								<div
									style="width: 70px; text-align: right; float:left; font-size: 16px;">QQ:</div>
								<input type="text" name="advisorConsult.QQ"
									style="width: 446px; height: 32px; margin-left: 6px;"></input>
							</p>
							<p>
								<div
									style="font-size: 16px; width: 70px; float:left; text-align: right; float: left; line-height: 32px; margin-bottom: 20px;">验证码:</div>
								<input name="code" type="text"
									style="width: 300px; height: 32px; margin-left: 10px; float: left;margin-left:6px\9;+margin-left:-4px;"></input>
								<p class="checkCode"
									style="width: 132px; height: 34px; height: 32px; border: 1px solid green; margin-left: 12px; color: green; float: left; text-align: center; line-height: 34px;cursor:pointer;">发送验证码</p>
							</p>
							<div
								style="width: 450px; height: 40px;clear: both; margin: 20px 0 0 76px;+margin-left:38px;+margin-top:0;">
								<input class="advisorConsult" value="提交" type="button"
									style="width: 450px; height: 40px; background-color: #008f01; border: none; color: #fff; font-size: 16px;cursor:pointer;">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 新增的填写环保内容end-->
	<!-- 环保需求弹框start -->
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
					<b style="float: left;">需求描述：</b>
					<b class="c_desc"></b>
				</p>
			<li>
		</ul>
		<div class="attention">
			<p>注：查看该信息联系方式需支付优蚁币10点</p>
			<a
				href="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156',
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
	<!-- 环保需求弹框end -->
	<script type="text/javascript"
		src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
<!-- 	<script type="text/javascript" -->
<%-- 		src="${ctxStatic}/js/v2/index.js"></script> --%>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/v2/textScroll.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery.form.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/v2/slider_banner.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/common.js"></script>

	<script type="text/javascript">
		var oNav = $('#LoutiNav');//导航壳
		var aNav = oNav.find('li');//导航
		var aDiv = $('#mainn .louceng');//楼层
		var oTop = $('#goTop');
		var nav_right = $('.nav_right')
		//回到顶部
		$(window).scroll(function() {
			var winH = $(window).height();//可视窗口高度
			var iTop = $(window).scrollTop();//鼠标滚动的距离

			if (iTop >= $('#header').height()) {
				oNav.fadeIn();
				oTop.fadeIn();
				nav_right.fadeIn();
				//鼠标滑动式改变  
				aDiv.each(function() {
					if (winH + iTop - $(this).offset().top > winH / 1.5) {
						aNav.removeClass('active');
						aNav.eq($(this).index()).addClass('active');
					}
				})
			} else {
				oNav.fadeOut();
				oTop.fadeOut();
				nav_right.fadeOut();
			}
		})
		//点击top回到顶部
		oTop.click(function() {
			$('body,html').animate({
				"scrollTop" : 0
			}, 5000)
		})
		//点击回到当前楼层
		aNav.click(function() {
			var t = aDiv.eq($(this).index()).offset().top;
			$('body,html').animate({
				"scrollTop" : t
			}, 500);
			$(this).addClass('active').siblings().removeClass('active');
		});
		//点击top回到顶部
		function return_top() {
			$('body,html').animate({
				"scrollTop" : 0
			}, 500)
		}
		// 楼层开始结束 
		//第五楼层的js
		$(".main-page .nav div").mouseenter(function() {
			var $this = $(this);
			var index = $this.index();
		}).mouseleave(function() {
			var $this = $(this);
			var index = $this.index();
		}).click(function() {
			var $this = $(this);
			var index = $this.index();
			var l = -(index * 360);
			$(".main-page .nav div").removeClass("on");
			$(".main-page .nav div").eq(index).addClass("on");
			$(".main-page .content div:eq(0)").stop().animate({
				"margin-top" : l
			}, 500);
		});
		
		
		var layer;
		var loadLayer = layui.use([ 'layer' ], function() {
			layer = layui.layer;
		});
		var layerId;

		$(".immediately").click(function(event) {
			/* Act on the event */
			layerId = layer.open({
				title : false,
				type : 1,
				zIndex:99,
				shade : [ 0.5, '#000' ],
				skin : 'layui-layer-rim', //加上边框
				area : [ '550px', '565px' ], //宽高
				content : $('.advisory_agent')
			});

		});
	</script>
	<!--TAB选项卡-->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".shop_tab .hd span").mouseenter(function() {
				$(this).addClass("current").siblings().removeClass("current").parent()
						.siblings(".bd").children("ul").eq($(this).index()).addClass("cur")
						.siblings().removeClass("cur");
			});
		});
	</script>
	<!--TAB-->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".shop_tabb .hd span").mouseenter(function() {
				$(this).addClass("current").siblings()
					.removeClass("current").parent()
					.siblings(".bd").children("ul").eq(
							$(this).index())
					.addClass("cur").siblings()
					.removeClass("cur");
			});
		});
	</script>
	<!--底部TAB-->
	<script type="text/javascript">
		$(function() {
			$(".shop_tabbb .hd span").mouseenter(function() {
				$(this).addClass("current").siblings().removeClass(
						"current").parent().siblings(".bd").children(
						"ul").eq($(this).index()).addClass("cur")
						.siblings().removeClass("cur");
			});

			//文字无缝滚动 
			$(".myscroll").topScroll(5);
			$(".akk").topScroll(5);
			$(".attk").topScroll(5);
			$(".newNeed").topScroll(5);

			//通用头部搜索切换
			$('#search-hd .search-input').on('input propertychange',function() {
				var val = $(this).val();
				if (val.length > 0) {
					$('#search-hd .pholder').hide(0);
				} else {
					var index = $('#search-bd li.selected').index();
					$('#search-hd .pholder').eq(index).show().siblings(
							'.pholder').hide(0);
				}
			})
			$('#search-bd li').click(function() {
				var index = $(this).index();
				$('#search-hd .pholder').eq(index).show().siblings(
						'.pholder').hide(0);
				$('#search-hd .search-input').eq(index).show()
						.siblings('.search-input').hide(0);
				$(this).addClass('selected').siblings().removeClass(
						'selected');
				$('#search-hd .search-input').val('');
			});

			function noticHref(obj) {
				window.open("${ctx}/" + obj);
			}
		});

		$(window).load(function() {
			chuantongV3(400, 5000);
			chuantongV4(400, 6000);

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
			
			
			$('#slider_4F').flexslider({
		        animation: "slide",
		        controlNav: false,
		        animationLoop: true,
		        slideshow: false,
		        slideshowSpeed: 5000,
		        directionNav:true,
		        start: function(slider){
					$('body').removeClass('loading');
		        }
			});
			
		});

		// 最底部区域js 
		$(document).ready(function() {
			var timer=setInterval(donghua,1000);
		    function donghua(){
		        $(".authority ").animate({top:"15px",bottom:"15px"},500,function(){
		            $(".authority ").animate({"top":0,"bottom":0});
		        });
			    $(".authority2 ").animate({top:"15px",bottom:"15px"},500,function(){
		            $(".authority2 ").animate({"top":0,"bottom":0});5
		        });
		    }
		    
			
			$(".bottom_slide_click").click(function() {
				$('.slide_box_shade').slideToggle("slow");
				if ($('.tubiao').hasClass('authority')) {
					$(".tubiao").removeClass('authority').addClass('authority2');
				} else {
					$(".tubiao").removeClass('authority2').addClass('authority');
				}
			});

			//发送验证码
			$(".checkCode").click(function() {
				var msg = "发送成功，请查收！";
				var tel = $(this).parents("form").eq(0).find(".phone").val();
				$.get("${ctx}/conn?tel=" + tel,function(data, status) {
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

			//明星案例点击查看详情
			$("#slider_3F").on("click",".starCaseClick",function() {
				var id = $(this).attr("id");
				window.open("${ctx}/advisorCase/intoCaseDetail?id="+ id);
			});
							
			//限制字符个数
			$(".zxx_text").each(function() {
				var maxwidth = 51;
				if ($(this).text().length > maxwidth) {
					$(this).text($(this).text().substring(0, maxwidth));
					$(this).html($(this).html() + '...');
				}
			});
			
			//4F优蚁咨询行业咨询tab切换
       		$(".shopp_tabb .hd span").mouseenter(function(){
          		$(this).addClass("current").siblings().removeClass("current")
          			.parent().siblings(".bd").children("ul").eq($(this).index())
          			.addClass("cur").siblings().removeClass("cur");
         	});
       		
		});
		
		$(document).ready(function(){
			$(".newNeed").on("click",".showNeed",function(event) {
				var title = $(this).find("span").eq(0).text();
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
			
			$(".erjimenu ul").on("mouseover","li",function(){
				$(".shop_tabb .bd ul li").hide();
			});
			$(".erjimenu ul").on("mouseout","li",function(){
				$(".shop_tabb .bd ul li").show();
			});
			
			$(".hd span").hover(function(){
				var id=$(this).attr("id");
				var href;
				if(id=="eqreq"){
					href="/llhb/supply-demand";
				}else if(id=="eqquote"){
					href="/llhb/quote";
				}
				$(".shopp_tabb p a").attr("href",href);
			});
     	});
	</script>
</body>
</html>