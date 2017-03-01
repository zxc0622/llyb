<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
		<title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
		<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
		<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
		<style>
			/*页面修改*/
			.header_banner .b_l_nav li{width:118px;}
            /*固废供求上两块begin*/
            .main_top_nav{height:390px;width: 100%;margin-top: 10px; overflow: hidden;border: 0px solid gray;text-align:center;}

            .main_top_nav_left{float: left;width: 200px;z-index:4;border: 0px solid #5CB531;position: relative; border:1px solid #5CB531;}
            .main_top_nav_left h3{display: block;width:100%;background-color: #5CB531; color: white;height: 50px;text-align: center;line-height: 50px;}
            .left_item{width:80%; height:40px;line-height: 40px;z-index:4;padding-left: 20%;display: block;border-bottom: 1px solid #E5E5E5;background: url("${ctxStatic}/img/llhb/select_right.png") 80% center no-repeat;text-align:left;background-color:#fff;}
            .left_item_hover{background:#fff;color:#EE7800;border-right:1px solid white;background: url("${ctxStatic}/img/llhb/selected_right.png") 80% center no-repeat; }
            .left_sub_div{width:400px;height:100%;position:absolute;z-index:4;top:50px;left:202px;border-top:1px solid #E5E5E5;border-right: 1px solid #E5E5E5; border-bottom: 1px solid #E5E5E5;background-color: white;}
            .left_sub_item{position:absolute;width: 100%; height: 100%;border: 0px solid green;}
            .left_sub_item .title{height: 33px;width:80%;margin-left:10%;margin-top:10px;line-height: 33px;overflow: hidden;border-bottom: 1px solid #E5E5E5; position: relative;color:#000000;}
            .left_sub_item .content{width:80%;margin-left:10%;line-height: 28px;overflow: hidden;list-style-type: disc;}
            .left_sub_item .content>a:hover{color:#5CB531;}
            .left_sub_item .content>span{color:#333;}
            .left_sub_item .title>span{cursor: pointer;}
            .left_sub_item .title>span:hover{color:#5CB531;}


            .main_top_nav_right{float: right; width: 28%;height: 378px;border: 1px solid #E5E5E5;margin-left: 0.5%;padding: 0 20px;text-align:left; }
            .m_t_n_r_title{width: 100%; height: 30px;line-height: 30px;border-bottom: 1px solid #cccccc; position: relative;}
            .m_t_n_r_title span{ font-size: 16px;color: #5EC520;  border-bottom: 3px solid #5EC520;padding-bottom: 3px; cursor: pointer;}
            .m_t_n_r_content{ overflow:hidden;border-bottom:1px dashed #999;vertical-align: middle;}
            .m_t_n_r_content .title{ display: block; line-height: 20px;color:#5EC520;}
			.m_t_n_r_content .title:hover{color:red;}
            .m_t_n_r_content .title::before{ content: ""; width: 3px; height: 3px;border-radius: 3px;background-color: #666;float: left;margin-top: 10px; margin-right: 5px;}
            .m_t_n_r_content .time{display: block;float: right;color:#5EC520;}


            .main_top_shop_nav{height:200px; width: 100%; margin-top: 10px; border:1px solid #E5E5E5;}
            .m_t_s_left{float:left;height:100%;width:16%;background-color:#E5E5E5;vertical-align: middle;}
            .m_t_s_left_1{float:left;width:50%;border:0px solid red;margin-top: 30px;}
            .m_t_s_left_1 a{display:block;text-align: right;font-size: 30px;line-height: 35px;color:#5EC520;}
            .m_t_s_left_2{float:left;width:40%;height:140px;margin-top:30px;margin-left:10px;border:0px solid red;}
            .m_t_s_left_2 a{display:block;text-align: left;font-size: 14px;line-height: 18px;}
            .m_t_s_left_shop{height:100%;width:800px;margin-left:199px;border-left:1px solid #E5E5E5;}
            .s_t_s_left_shop_det{float:left;height:100%;width:159px;text-align: center; border-right:1px solid #E5E5E5;}
            .s_t_s_left_shop_det img{width:100%;height:100%;}
            .s_t_s_left_shop_det .title{display: block;color: #000;line-height: 25px;}
            .s_t_s_left_shop_det .bak{display: block;color: #666;line-height: 20px;}
            /*头部banner图片 start*/
            .main_top_nav_middle{float: left;position:relative;width: 456px; height: 380px; border: 0px solid red;margin-left:10px;}
            .main_top_nav_middle .fade_list {width:100%;height:100%;position:relative;}
            .main_top_nav_middle .fade_list li{position: absolute;z-index:0;left:0;top:0;width:100%;height:100%;padding-top:0px;}
           /*  .main_top_nav_middle .fade_list li a{display: block;width: 100%;height: 100%; margin: 0 auto;} */
            .main_top_nav_middle .fade_list li img{width:100%;height:100%;}
            .main_top_nav_middle .fade_btn {position: absolute;left:0;top:90%;bottom: 10px;z-index:0;width: 96%; text-align: right; border: 0px solid red;}
            .main_top_nav_middle .fade_btn a {display: inline-block;height: 13px;width: 13px;background:#CCCCCC;opacity: 0.5; border-radius: 50%;margin: 3px;z-index: 3;}
            .main_top_nav_middle .fade_btn .h_b_btn_sel{background: #FFFFFF;opacity: 0.8;}
            /*头部banner图片 end*/
            /*固废供求上两块end*/

            /*banner 右侧悬窗修改*/
            .header_banner .b_r_nav{height:40px;line-height:40px;border-bottom:1px solid #ccc;}
            .header_banner .b_r_items a{display:block;width:78px;text-align:center;font-size:12px;position:absolute;top:15px;left:0;color:#333;}
            .header_banner .b_r_items{display:none;height:80px;position:relative;}
            .header_banner .b_r_items_1{display:block;}
            .header_banner .b_r_items a p{margin-top:3px;}
            .header_banner .b_r_notice{padding:5px 15px;border-top:1px solid #ccc;}
            .b_r_top_login{height:110px;padding:15px 15px 0;}
            .header_banner .b_r_notice a{display:block;margin-bottom:5px;color:#5ec520;font-size:12px;}
            .header_banner .b_r_notice a:hover{color:red}
            .b_r_top_login_t{height:80px;}
            .b_r_top_login_t .b_r_top_login_t_l{width:70px;height:70px;float:left;border-radius: 35px;margin-left: 15px;}
            .b_r_top_login_t .b_r_top_login_t_l img{width:100%;height:100%;}
            .b_r_top_login_t .b_r_top_login_t_r{float:left;margin-left:10px;margin-top: 15px; }
            .b_r_top_login_b{overflow: hidden;}
            .b_r_top_login_b a.when-mouseover{display:block;float:left;height:30px;line-height: 30px;color:#fff;text-align: center;background-color: #5ec520;border:1px solid #5ec520;width:100px;}
            .b_r_top_login_b a{display:block;float:left;height:30px;line-height: 30px;color:#333;text-align: center;background-color: #e9e9e9;border:1px solid #ccc;width:100px;}
			.secondType{color:#5EC520;}
			.li-sel{color:#5EC520;}
			.sel2{color:#5EC520;}
			
			.index_bottom_scroll{position:relative;width:998px;overflow: hidden;height:122px;}
			.c3_bottom .c3_b_companyList{position: absolute;top:0;left:0;height:120px;}
			/*触角摆动*/
			@-webkit-keyframes ant_shakel{
				from{transform: rotate(-73deg);}
				to{transform: rotate(-11deg);}
			}
			@-moz-keyframes ant_shakel{
				from{transform: rotate(-73deg);}
				to{transform: rotate(-11deg);}
			}
			@-o-keyframes ant_shakel{
				from{transform: rotate(-73deg);}
				to{transform: rotate(-11deg);}
			}
			@keyframes ant_shakel{
				from{transform: rotate(-73deg);}
				to{transform: rotate(-11deg);}
			}
			@-webkit-keyframes ant_shaker{
				from{transform: rotate(-10deg);}
				to{transform: rotate(19deg);}
			}
			@-moz-keyframes ant_shaker{
				from{transform: rotate(-10deg);}
				to{transform: rotate(19deg);}
			}
			@-o-keyframes ant_shaker{
				from{transform: rotate(-10deg);}
				to{transform: rotate(19deg);}
			}
			@keyframes ant_shaker{
				from{transform: rotate(-10deg);}
				to{transform: rotate(19deg);}
			}
			/*声音效果*/
			.ad_right .ad_r_img{height: 88px;position: relative;overflow: hidden;width: 170px;left: -37px;}
			.ad_right .ad_r_img img{width:195px;}
			@-webkit-keyframes ant_voice{
				0%{opacity:0;}
				100%{opacity:1;}
			}
			@-moz-keyframes ant_voice{
				0%{opacity:0;}
				100%{opacity:1;}
			}
			@-o-keyframes ant_voice{
				0%{opacity:0;}
				100%{opacity:1;}
			}
			@keyframes ant_voice{
				0%{opacity:0;}
				100%{opacity:1;}
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
				<div class="header_middle">
					<h1 class="header_logo">
						<a href="${ctx }/index">
							<img src="${ctxStatic}/img/llhb/logo.png" class="logoimg"/>
							<img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_left" />
							<img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_right" />
							<img src="${ctxStatic}/img/llhb/ant1_left.png" class="ant ant_left" style="z-index: 2;"/>
							<img src="${ctxStatic}/img/llhb/ant1_right.png" class="ant ant_right"style="z-index: 2;" />
						</a>
						<span>“互联网+”环保综合服务平台</span>
					</h1>
					<div class="header_search">
						<div class="h_s_top">
							<input type="hidden" id="biaoji" value="0">
							<a class="li-sel" href="javascript:che(0);">企业库</a>&nbsp;<span>|</span>
						&nbsp;<a href="javascript:che(1);">供应</a>&nbsp;<span>|</span>
						&nbsp;<a href="javascript:che(2);">求购</a>&nbsp;<span>|</span>
						&nbsp;<a href="javascript:che(3);">商城</a>&nbsp;<span>|</span>
						&nbsp;<a href="javascript:che(4);">资讯</a>
						</div>
						<div class="h_s_middle font_1">
							<span class="h_s_middlebefore"></span>
							<input type="search" id="searchtext" placeholder="请输入关键字"/>
							<a class="font_3" id="searchtop" href="javascript:goPage();">搜索</a>
						</div>
						<div class="h_s_bottom font_1">
							<c:forEach items="${re }" var="re">
		                    	<a target="_blank" href="${ctx}/solidsupply/supplyList?typeId=${re.id }" target="_black"  >${re.pname }&nbsp;</a>
		                    </c:forEach>
						</div>
					</div>
					<!-- 右上小广告 -->
					<div class="header_right">
						<ul>
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
									<c:choose>
										<c:when test="${empty ads.href }">
											<li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
										</c:when>
										<c:otherwise>
											<li><div class="h_r_img"><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></div></li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</ul>
						<a href="javascript:void(0);" class="h_r_next">&gt;</a>
					</div>
					<div class="clear"></div>
				</div>
				<!--头部中部部 end-->
			</div>

			<!--头部banner start-->
			<div class="header_banner">
				
				<!--头部导航 start-->
				<%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
				<!--头部导航 end-->
				
				<!--头部banner图片 start-->
				<!-- 中间大广告 -->
				<ul class="h_b_list">
					<c:forEach items="${ads }" var="ads">
						<c:if test="${ads.type eq 'C' && ads.stype eq 'S2' }">
							<c:choose>
								<c:when test="${empty ads.href }"><li><img src="${ads.addr }"/></li></c:when>
								<c:otherwise>
									<li><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></li>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</ul>
				<!--头部banner图片 end-->
				
				<!--头部banner小圆圈 start-->
				<div class="h_b_btn"></div>
				<!--头部banner小圆圈 end-->

				<!--头部banner左侧 start-->
				<div class="b_l_img"><img src="${ctxStatic}/img/llhb/ant1_left.png" alt=""style="position: absolute;left:4px;top:12px;transform-origin: 80% 100% 0px;transform: rotate(-51deg);-webkit-animation:ant_shakel 2s ease-in-out infinite alternate;-moz-animation:ant_shakel 2s ease-in-out infinite alternate;animation:ant_shakel 2s ease-in-out infinite alternate;">
					<img src="${ctxStatic}/img/llhb/ant1_right.png" alt=""style="position: absolute;left:25px;top:-9px;transform-origin: 80% 100%;-webkit-animation:ant_shaker 2s ease-in-out infinite alternate;-moz-animation:ant_shaker 2s ease-in-out infinite alternate;animation:ant_shaker 2s ease-in-out infinite alternate;"><img src="${ctxStatic}/img/llhb/bannerleft_none.png"/></div>
				<div class="banner_left">
                    <ul class="b_l_nav">
                        <li data-in="0"><a href="javascript:void(0);"class="b_l_nav_sel" data-in="0">环评报价</a></li>
                        <li data-in="1"><a href="javascript:void(0);" data-in="1">监测报价</a></li>
                    </ul>
                    <div class="b_l_form" style="position:relative;">
                        <p class="b_l_formTop" style="position:absolute; top:-30px;">多年行业经验沉淀，为您提供精确报价</p>
                        <p class="b_l_formTop" style="position:absolute; top:-30px;">按项报价，专业直观</p>
                        <form class="font_1" >
                            <input type="text" placeholder="您的姓名" name="name"/>
                            <input type="text" placeholder="您的电话" name="tel"/>
                            <input type="text" placeholder="公司名称" name="comp_name"/>
                            <input type="text" placeholder="备注信息（选填）" name="remarks"/>
                            <div>
                                <select class="b_l_f_province">
                                    <option value="">省</option>
                                        <c:forEach var="province" items="${provinceList }">
                                            <c:choose>
                                                <c:when test="${oriProId eq province.id}">
                                                    <option value="${province.id}" selected>${province.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${province.id}">${province.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                    </c:forEach>
                                </select>
                                <select class="b_l_f_city">
                                    <option value="">市</option>
                                </select>
                                <div class="clear"></div>
                            </div>
                            <input onclick="sub()" class="banner_left_submit" type="button" value="立即申请"/>
                        </form>
                    </div>
                    
                </div>
				<!--头部banner左侧 end-->

				<!--头部banner右侧 start-->
				<div class="banner_right">
					<!-- <div class="b_r_top" style="display: none">
						<a href="javascript:void(0);">会员入口</a>
						<a href="javascript:void(0);">我要竞价</a>
						<a href="javascript:void(0);" class="b_a_1">站内留言</a>
					</div> -->
					<div class="b_r_top_login">
						<div class="b_r_top_login_t">
							<div class="b_r_top_login_t_l">
								<img src="${ctxStatic}/img/llhb/index-head-pic.png" alt="">
							</div>
							<div class="b_r_top_login_t_r">
								<span style="width:20px;float:left;">Hi,</span><span id="wel" style="float:left;display:block;width:90px;overflow:hidden;" class="tmui-ellipsis" ><shiro:principal property="loginName"/></span>
								<div class="clear"></div>
								<p style="color:#999">欢迎来到优蚁网</p>
								<span id="hidden" style="display:none"><shiro:principal property="loginName"/></span>
							</div>
						</div>
						<div class="b_r_top_login_b"></div>
					</div>
					<div class="b_r_nav">
						<a href="javascript:void(0);" class="b_r_nav_sel">买家服务</a>
						<a href="javascript:void(0);">卖家服务</a>
						<a href="javascript:void(0);">综合服务</a>
					</div>
					<div class="b_r_itemsBox">
						<!--<div class="b_r_items b_r_items_1">
							<a href="javascript:void(0);" class="buy_1">
								<div class="b_r_i_img"></div>
								<p>竞宝</p>
							</a>
							<a href="javascript:void(0);" class="buy_2">
								<div class="b_r_i_img"></div>
								<p>求购</p>
							</a>
							<a href="javascript:void(0);" class="buy_3">
								<div class="b_r_i_img"></div>
								<p>找产品</p>
							</a>
						</div>-->
                        <div class="b_r_items b_r_items_1">
							<a href="${ctx }/home?str=/qiugou" class="buy_1">
								<div class="b_r_i_img"></div>
								<p>求购</p>
							</a>
							<a href="${ctx }/mall"class="buy_2">
								<div class="b_r_i_img"></div>
								<p>找产品</p>
							</a>
							<a href="javascript:void(0);" class="buy_3">
								<div class="b_r_i_img"></div>
								<p>意见反馈</p>
							</a>
						</div>
						<div class="b_r_items b_r_items_2">
							<a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit"class="seller_1">
								<div class="b_r_i_img"></div>
								<p>开商铺</p>
							</a>
							<a href="${ctx }/solidsupply/supplyList" class="seller_2">
								<div class="b_r_i_img"></div>
								<p>供应</p>
							</a>
							<a href="${ctx }/home?str=/solidsupply/solidAdd" class="seller_3">
								<div class="b_r_i_img"></div>
								<p>发布产品</p>
							</a>
						</div>
						<div class="b_r_items b_r_items_3">
							<a href="${ctx }/home?str=/ypcd/adsManage/adsAdd" class="word_1">
								<div class="b_r_i_img"></div>
								<p>广告服务</p>
							</a>
							<a href="${ctx }/platform/indexIconInit" class="word_2">
								<div class="b_r_i_img"></div>
								<p>全网营销</p>
							</a>
							<a href="javascript:void(0);" class="word_3">
								<div class="b_r_i_img"></div>
								<p>信誉认证</p>
							</a>
						</div>
					</div>
					<div class="b_r_notice">
						<div class="scroll_list2"style="width:206px;height:106px;overflow:hidden;">
								<c:forEach items="${noticList}" var="notic">
								 	<c:choose>
										<c:when test="${notic.remarks=='1'}">
											<a class="tmui-ellipsis" href="javascript:void(0);" onclick="noticHref('${notic.ntContent}')">[公告]${notic.ntTitile}</a>
										</c:when>
										<c:otherwise>
									    <a style="height:21px;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;" href="${ctx}/notice/noticDetail?id=${notic.id}">[公告]${notic.ntTitile}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</div>
					</div>
				</div>
				<!--头部banner右侧 end-->
			</div>
			<!--头部banner end-->
		</header>
		<!--头部 end-->
		
		<!--中间部分 start-->
		<div class="wrapper">
			<%@ include file="/WEB-INF/views/include/indexfooter_ad.jsp"%>
			<!--中间内容 start-->
			<div class="main">
				<!--综合信息 start-->
				<div class="content0 contentNav">
					<!--综合信息导航 start-->
					<div class="c0_nav">
						<nav class="font_3">
							<a class="c0_nav_sel tuijian" href="javascript:void(0);">推荐企业</a>
							<a class="fuwu" href="javascript:void(0);">服务企业</a>
							<a class="chuzhi" href="javascript:void(0);">环境友好</a>
						</nav>
						<a href="${ctx }/EntLib">+企业库</a>
					</div>
					<!--综合信息导航 end-->

					<!--综合信息图片 start-->
					<!-- 推荐企业 -->
					<div class="c0_img" style="display:block;">
						<div class="c0_img_left">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S1' && ads.ttype eq 'left'}">
									<c:choose>
										<c:when test="${empty ads.href || ads.href == '' }"><img data-index="${ads.href }" src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img data-index="${ads.href }" src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
						<div class="c0_img_middle">
							<ul>
								<c:forEach items="${ads }" var="ads">
									<c:if test="${ads.type eq 'M' && ads.stype eq 'S1' && ads.ttype eq 'center'}">
										<c:choose>
											<c:when test="${empty ads.href }"><li><img src="${ads.addr }"/></li></c:when>
											<c:otherwise>
												<li><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="c0_img_right">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S1' && ads.ttype eq 'right'}">
									<c:choose>
										<c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- 服务企业 -->
					<div class="c0_img">
						<div class="c0_img_left">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S2' && ads.ttype eq 'left'}">
									<c:choose>
										<c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
						<div class="c0_img_middle">
							<ul>
								<c:forEach items="${ads }" var="ads">
									<c:if test="${ads.type eq 'M' && ads.stype eq 'S2' && ads.ttype eq 'center'}">
										<c:choose>
											<c:when test="${empty ads.href }"><li><img src="${ads.addr }"/></li></c:when>
											<c:otherwise>
												<li><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="c0_img_right">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S2' && ads.ttype eq 'right'}">
									<c:choose>
										<c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- 环境友好 -->
					<div class="c0_img">
						<div class="c0_img_left">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S3' && ads.ttype eq 'left'}">
									<c:choose>
										<c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
						<div class="c0_img_middle">
							<ul>
								<c:forEach items="${ads }" var="ads">
									<c:if test="${ads.type eq 'M' && ads.stype eq 'S3' && ads.ttype eq 'center'}">
										<c:choose>
											<c:when test="${empty ads.href }"><li><img src="${ads.addr }"/></li></c:when>
											<c:otherwise>
												<li><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<div class="c0_img_right">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S3' && ads.ttype eq 'right'}">
									<c:choose>
										<c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
										<c:otherwise>
											<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<!-- 横幅1 -->
					<div class="content_bottom">
						<%int x = 0; %>
						<c:forEach items="${ads }" var="ads">
							<c:if test="${ads.type eq 'C' && ads.stype eq 'S3' }">
								<% x++;
								if(x == 1){%>
								<c:choose>
									<c:when test="${empty ads.href }">
										<a target="_blank" href="${ctx}/hazardous-wastes"><img src="${ads.addr }"/></a>
									</c:when>
									<c:otherwise>
										<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
									</c:otherwise>
								</c:choose>	
								<%}%>
							</c:if>
						</c:forEach>
					</div>
					<!--综合信息图片 end-->
				</div>
				<!--综合信息 end-->

				<!--1F固废竞价 start-->
				<div class="content1 contentNav">
					<div class="content_title">
						<a href="${ctx }/solidSupply" class="c_t_floor">1F&nbsp;&nbsp;&gt;固废供求</a>
						<p class="c_t_detail font_1">供求信息快速匹配，满足环保行业深度、全面的需求。</p>
						<p class="c_t_right font_1">新增供求:<span>${num }</span></p>
					</div>

					<!--1F流程图 start-->
					<p class="c1_top" style="display: none;">
						<span class="font_3">竞价流程</span><span class="font_1">公开,透明的在线竞价方式,保障企业的再生资源品种的定价权</span>
					</p>
					<ul class="c1_flow" style="display: none;">
						<li onclick="go('注册登录/注册.html')">
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">注册会员</p>
						</li>
						<li>
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">废物评估</p>
						</li>
						<li onclick="go('main.html?name=竞价')">
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">前期准备</p>
						</li>
						<li onclick="go('固废竞价/固废竞价_详情.html')">
							<div class="c1_f_img" ></div>
							<p class="c1_f_txt">开始竞价</p>
						</li>
						<li onclick="go('固废竞价/固废竞价_详情.html')">
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">竞价动态</p>
						</li>
						<li>
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">竞价结束</p>
						</li>
						<li class="c1_flow_last">
							<div class="c1_f_img"></div>
							<p class="c1_f_txt">分享交流</p>
						</li>
					</ul>
					<!--1F流程图 end-->

					<div class="c1_main" style="display: none;">
						<!--1F热门推荐 start-->
						<div class="c1_m_left">
							<div class="c1_m_title font_3">
								<span class="c1_m_t_left">热门推荐</span>
							</div>
							
							<dl>
								<dt>
									<span class="c1_m_left_hot font_3">热门成交</span>
									<a href="javascript:void(0);"class="font_1">更多&nbsp;+</a>
								</dt>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交废旧三元催化器</a>
									<span class="c1_m_l_time">1小时前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交PE管道破碎料</a>
									<span class="c1_m_l_time">4小时前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交PE管道料</a>
									<span class="c1_m_l_time">1天前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交HDPE大桶料</a>
									<span class="c1_m_l_time">2天前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交EPS热熔块</a>
									<span class="c1_m_l_time">10天前</span>
								</dd>

								<dt>
									<span class="c1_m_left_hot font_3">热门求购</span>
									<a href="javascript:void(0);" class="font_1">更多&nbsp;+</a>
								</dt>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">求购PP汽车几饰减料</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">求购废旧二手电动车</a>
									<span class="c1_m_l_time">2个月前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">报废红旗汽车</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">求购钢丝胎胶块</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">求购废旧硅橡胶</a>
									<span class="c1_m_l_time">一个月</span>
								</dd>

								<dt>
									<span class="c1_m_left_hot font_3">热门供应</span>
									<a href="javascript:void(0);" class="font_1">更多&nbsp;+</a>
								</dt>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">供应库存微型小汽车</a>
									<span class="c1_m_l_time">3个月前</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">供应汽车地毯开花料</a>
									<span class="c1_m_l_time">1个月</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">供应废旧钢丝胎</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">供应三元乙丙管坯胶</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
								<dd class="font_1">
									<a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">供应EPS热熔块</a>
									<span class="c1_m_l_time">长期</span>
								</dd>
							</dl>
						</div>
						<!--1F热门推荐 end-->

						<!--1F竞价动态 start-->
						<div class="c1_m_right">
							<div class="c1_m_title font_3">
								<span class="c1_m_t_left">竞价动态</span>
								<a class="c1_m_t_right font_1" href="javascript:void(0);">更多&nbsp;+</a>
							</div>
							
							<div class="c1_m_r_list">
								<ul>
									<li>
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img1.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									<li>
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img2.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									<li style="margin-right:0">
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img3.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									<li>
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img4.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									<li>
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img5.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									<li style="margin-right:0">
										<div class="c1_m_r_img"><div class="c1_m_r_img"><img src="${ctxStatic}/img/llhb/c1_r_img6.png"/></div></div>
										<div class="c1_m_r_top">长期供应粗碳酸锌</div>
										<p class="font_1">当前价&nbsp;<span class="font_3">￥9.5万</span>(16次出价)</p>
										<p class="font_1">评估价&nbsp;¥7.6万</p>
										<p class="font_1">距结束&nbsp;<span>06时01分39秒</span></p>
										<div class="c1_m_r_bottom font_1">
											<p><span>50539次</span><span>围观</span></p>
											<p><span>12人</span><span>报名</span></p>
										</div>
										<div class="c1_m_r_now font_1">正在进行</div>
									</li>
									
								</ul>
							</div>
						</div>
						<!--1F竞价动态 end-->
					</div>
					<!--固废供求页添加  主体上方导航栏 start-->
					<div class="main_top_nav" >
					    <div class="main_top_nav_left">
					        <h3 class="font_3">所有产品分类</h3>
					        <ul>
					        	<c:set value="${solids[0].id }" var="parentId"></c:set>
					        	<c:forEach items="${solids}" var="solid" >
					        		<c:if test="${solid.parentId == parentId}">
					        			<li class="left_item font_3" value="${solid.id }">${solid.name }
					        				<div class="left_sub_div hidden" >
							                    <div class="left_sub_item hidden">
							                        <div class="title">
							                            <span>${solid.name }</span>
							                        </div>
							                        <div class="content font_1">
							                        	<c:forEach items="${solids}" var="solidChild" >
											        		<c:if test="${solidChild.parentId == solid.id}">
											        			<a href="${ctx}/solidsupply/supplyList?typeId=${solidChild.id }">${solidChild.name }</a> <span>&nbsp;|&nbsp;</span>
											        		</c:if>
											        	</c:forEach>
							                        </div>
							                    </div>
						                	</div>
					        			</li>
					        		</c:if>
					        	</c:forEach>
					        </ul>
					      
					    </div>
					    <div class="main_top_nav_middle">
					        <!--头部banner图片 start-->
					        <ul class="fade_list">
					        	<c:forEach items="${ads }" var="ads">
									<c:if test="${ads.type eq 'C' && ads.stype eq 'S5' }">
										<c:choose>
											<c:when test="${empty ads.href }"><li><img src="${ads.addr }"/></li></c:when>
											<c:otherwise>
												<li><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></li>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
					        </ul>
					        <!--头部banner小圆圈 start-->
					        <div class="fade_btn"></div>
					        <!--头部banner小圆圈 end-->
					    </div>
					    <div class="main_top_nav_right">
					        <div class="m_t_n_r_title">
					            <span>供求动态</span>
					            <a href="${ctx }/supply-demand" class="fr font_1" style="color:#ee7800;">更多+</a>
					        	
					        </div>
					        <div class="scroll_list1"style="height:330px;width:280px;overflow:hidden;color:">
						        <c:forEach items="${ds }" var="ds">
						        	<div class="m_t_n_r_content font_1">
						        		<c:choose>
						        			<c:when test="${ds.type == 's' }">
						        				<a class="title tmui-ellipsis" title="${ds.info_title }" href="${ctx}/solidsupply/getMess/${ds.id }" target="_blank">${ds.info_title }</a>
						        			</c:when>
						        			<c:otherwise>
						        				<a class="title tmui-ellipsis" title="${ds.info_title }" href="${ctx}/qiugou/details?id=${ds.id }" target="_blank">${ds.info_title }</a>
						        			</c:otherwise>
						        		</c:choose>
							            <a class="time">${fn:substring(ds.time,5,10) } ${ds.pname }</a>
							        </div>
						        </c:forEach>	
					        </div>
					    </div>
					</div>
					<!--固废供求页添加  主体上方导航栏 end-->
					<!--固废供求页添加  实力商家 start-->
					<div class="main_top_shop_nav" >
					    <div class="m_t_s_left">
					        <div class="m_t_s_left_1 font_3">
					            <a href="javascript:void(0);">实</a>
					            <a href="javascript:void(0);">力</a>
					            <a href="javascript:void(0);">商</a>
					            <a href="javascript:void(0);">家</a>
					        </div>
					        <div class="m_t_s_left_2">
					            <a href="javascript:void(0);">行</a>
					            <a href="javascript:void(0);">业</a>
					            <a href="javascript:void(0);">实</a>
					            <a href="javascript:void(0);">力</a>
					            <a href="javascript:void(0);">商</a>
					            <a href="javascript:void(0);">家</a>
					            <a href="javascript:void(0);">入</a>
					            <a href="javascript:void(0);">驻</a>
					        </div>
					    </div>
					    <div id="triangle-right"></div>
					    <div class="m_t_s_left_shop">
					    	<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S4'}">
									<c:choose>
										<c:when test="${empty ads.href }"><div class="s_t_s_left_shop_det"><img src="${ads.addr }"/></div></c:when>
										<c:otherwise>
											<div class="s_t_s_left_shop_det"><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></div>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
					    </div>
					</div>
					<!--固废供求页添加  实力商家 end-->
					<div class="content_bottom">
						<%int y = 0; %>
						<c:forEach items="${ads }" var="ads">
							<c:if test="${ads.type eq 'C' && ads.stype eq 'S3' }">
								<% y++;
								if(y == 2){%>
								<c:choose>
									<c:when test="${empty ads.href }">
										<a target="_blank" href="${ctx}/news"><img src="${ads.addr }"/></a>
									</c:when>
									<c:otherwise>
										<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
									</c:otherwise>
								</c:choose>
								<%}%>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<!--1F固废竞价 end-->

				<!--2F环保商城 start-->
				<div class="content2 contentNav">
					<div class="content_title">
						<a href="${ctx }/mall" class="c_t_floor">2F&nbsp;&nbsp;&gt;环保商城</a>
						<p class="c_t_detail font_1">全网布局，全新渠道，一站式采购</p>
						<p class="c_t_right font_1">新增商品数:<span>${proNum }</span></p>
					</div>
					<!--2F左侧导航 start-->
					<div class="c2_left">
						<ul class="c2_l_nav">
							<li class="li_sel" data-index="${equ[0].pid }">
								<a class="font_3 c2_l_nav_shebei" href="javascript:void(0);" ><i></i>设备&nbsp;&gt;</a>
							</li>
							<li data-index="${mat[0].pid }">
								<a class="font_3 c2_l_nav_yuanliao" href="javascript:void(0);" ><i></i>原料&nbsp;&gt;</a>
							</li>
							<li data-index="${ser[0].pid }">
								<a class="font_3 c2_l_nav_fuwu" href="javascript:void(0);" ><i></i>服务&nbsp;&gt;</a>
							</li>
						</ul>
						<div class="c2_l_img">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'C' && ads.stype eq 'S4' }">
									<img src="${ads.addr }"/>
								</c:if>
							</c:forEach>
							
						</div>
					</div>
					<!--2F左侧导航 end-->

					<!--2F右侧内容 start-->
					<div class="c2_right" style="display:block">
						<input id="order" value="p.low_price desc,p.page_view desc" type="hidden" />
						<div class="c2_r_items c2_r_classify font_1" style="display:block">
							<p>设备分类</p>
				        	<c:forEach items="${equ}" var="equ" >
				        			<a href="javascript:void(0);" data-index="${equ.id }">${equ.name }</a>
				        	</c:forEach>
							<div><a href="${ctx }/mall" class="c2_r_more">更多分类&gt;</a></div>
						</div>
						<div class="c2_r_items c2_r_classify font_1" style="display:block">
							<p>原料分类</p>
							<c:forEach items="${mat}" var="mat" >
				        			<a href="javascript:void(0);" data-index="${mat.id }">${mat.name }</a>
				        	</c:forEach>
							<div><a href="${ctx }/mall" class="c2_r_more">更多分类&gt;</a></div>
						</div>
						<div class="c2_r_items c2_r_classify font_1" style="display:none">
							<p>服务分类</p>
							<c:forEach items="${ser}" var="ser" >
				        			<a href="javascript:void(0);" data-index="${ser.id }">${ser.name }</a>
				        	</c:forEach>
							<div><a href="${ctx }/mall" class="c2_r_more">更多分类&gt;</a></div>
						</div>
						<div class="c2_r_items c2_r_synth font_1">
							<p>综合</p>
							<!-- <a href="javascript:void(0);">销量&or;</a>-->
							<a class="sel2" href="javascript:order('p.low_price desc',0);">价格&or;</a>
							<a href="javascript:order('p.page_view desc',1);">人气&or;</a>
							<!-- <a href="javascript:void(0);">信誉&and;</a>-->
						</div>
						<div class="c2_r_search font_1">
								<input id="title" type="search" placeholder="请输入关键词搜索"/><a href="javascript:list();" class="c2_r_s_btn"></a>
						</div>
						<div class="clear"></div>
						<div class="c2_r_imglist">
							<ul></ul>
						</div>
					</div>

					<!--2F右侧内容 end-->
					<div class="clear"></div>
					<div class="content_bottom">
						<%int z = 0; %>
						<c:forEach items="${ads }" var="ads">
							<c:if test="${ads.type eq 'C' && ads.stype eq 'S3' }">
								<% z++;
								if(z == 3){%>
								<c:choose>
									<c:when test="${empty ads.href }">
										<a target="_blank" href="${ctx}/platform/aboutUsInit?index=1"><img src="${ads.addr }"/></a>
									</c:when>
									<c:otherwise>
										<a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
									</c:otherwise>
								</c:choose>	
								<%}%>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<!--2F环保商城 end-->

				<!--3F行业资讯 start-->
				<div class="content3 contentNav">
					<div class="c3_left">
						<div class="content_title">
							<a href="${ctx }/news" class="c_t_floor">3F&nbsp;&nbsp;&gt;行业资讯</a>
							<p class="c_t_detail font_1">最新最热环保资讯</p>
							<a href="${ctx }/news" class="c_t_right font_1">更多+</a></p>
						</div>
						<!--3F左侧信息导航 start-->
						<ul class="c3_l_nav font_3">
							<li class="active"><a href="javascript:void(0);">环保动态</a></li>
							<li><a href="javascript:void(0);">环保知识</a></li>
							<li><a href="javascript:void(0);">展会信息</a></li>
							<div class="c3_l_nav_active"><div></div></div>
						</ul>
						<!--3F左侧信息导航 end-->

						<!--3F左侧信息内容 start-->
						<ul class="c3_l_items">
							<li>
								<div class="c3_l_img" style="cursor:pointer"  onclick="goPro('${news[0].id }')">
									<c:choose>
										<c:when test="${news[0].simg == '' || empty news[0].simg}"><img src="${ctxStatic}/img/llhb/default.png"/></c:when>
										<c:otherwise><img src="${news[0].simg }" /></c:otherwise>
									</c:choose>
									<div class="c3_l_img_bottom">
										<div class="c3_l_img_shadow"></div>
										<p class="c3_l_img_txt">${news[0].title }</p>
									</div>
								</div>
								<dl class="c3_l_txt">
									<dt>
										<h4 class="font_3">
											<a href="javascript:goPro('${news[1].id }');">${news[1].title }</a>
											<span class="font_1">${fn:substring(news[1].time,5,10)}</span>
										</h4>
										<c:choose>
											<c:when test="${fn:length(news[1].content) >54 }">
												<p class="font_1">${fn:substring(news[1].content,0,54) }...<a href="javascript:goPro('${news[1].id }');" >[详细]</a></p>
											</c:when>
											<c:otherwise>
												<p class="font_1">${news[1].content }<a href="javascript:goPro('${news[1].id }');" >[详细]</a></p>
											</c:otherwise>
										</c:choose>
									</dt>
									<dd >
										<a href="javascript:goPro('${news[2].id }');" class="c3_l_news tmui-ellipsis">${news[2].title }</a>
										<span class="c3_l_time font_1">${fn:substring(news[2].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${news[3].id }');" class="c3_l_news tmui-ellipsis">${news[3].title }</a>
										<span class="c3_l_time font_1">${fn:substring(news[3].time,5,10)}</span>
									</dd>
									<dd >
										<dd >
										<a href="javascript:goPro('${news[4].id }');" class="c3_l_news tmui-ellipsis">${news[4].title }</a>
										<span class="c3_l_time font_1">${fn:substring(news[4].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${news[5].id }');" class="c3_l_news tmui-ellipsis">${news[5].title }</a>
										<span class="c3_l_time font_1">${fn:substring(news[5].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${news[6].id }');" class="c3_l_news tmui-ellipsis">${news[6].title }</a>
										<span class="c3_l_time font_1">${fn:substring(news[6].time,5,10)}</span>
									</dd>
								</dl>
							</li>
							<li>
								<div class="c3_l_img" style="cursor:pointer" onclick="goPro('${know[0].id }');">
									<c:choose>
										<c:when test="${know[0].simg == '' }"><img src="${ctxStatic}/img/llhb/default.png"/></c:when>
										<c:otherwise><img src="${know[0].simg }"/></c:otherwise>
									</c:choose>
									<div class="c3_l_img_bottom">
										<div class="c3_l_img_shadow"></div>
										<p class="c3_l_img_txt" >${know[0].title }</p>
									</div>
								</div>
								<dl class="c3_l_txt">
									<dt>
										<h4 class="font_3">
											<a href="javascript:goPro('${know[1].id }');">${know[1].title }</a>
											<span class="font_1">${fn:substring(know[1].time,5,10) }</span>
										</h4>
										<c:choose>
											<c:when test="${fn:length(know[1].content) >54 }">
												<p class="font_1">${fn:substring(know[1].content,0,54) }...<a href="javascript:goPro('${know[1].id }');" >[详细]</a></p>
											</c:when>
											<c:otherwise>
												<p class="font_1">${know[1].content }<a href="javascript:goPro('${know[1].id }');" >[详细]</a></p>
											</c:otherwise>
										</c:choose>
									</dt>
									<dd >
										<a href="javascript:goPro('${know[2].id }');" class="c3_l_news tmui-ellipsis">${know[2].title }</a>
										<span class="c3_l_time font_1">${fn:substring(know[2].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${know[3].id }');" class="c3_l_news tmui-ellipsis">${know[3].title }</a>
										<span class="c3_l_time font_1">${fn:substring(know[3].time,5,10)}</span>
									</dd>
									<dd >
										<dd >
										<a href="javascript:goPro('${know[4].id }');" class="c3_l_news tmui-ellipsis">${know[4].title }</a>
										<span class="c3_l_time font_1">${fn:substring(know[4].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${know[5].id }');" class="c3_l_news tmui-ellipsis">${know[5].title }</a>
										<span class="c3_l_time font_1">${fn:substring(know[5].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${know[6].id }');" class="c3_l_news tmui-ellipsis">${know[6].title }</a>
										<span class="c3_l_time font_1">${fn:substring(know[6].time,5,10)}</span>
									</dd>
								</dl>
							</li>
							<li>
								<div class="c3_l_img" style="cursor:pointer" onclick="goPro('${show[0].id }');">
									<c:choose>
										<c:when test="${show[0].simg == '' }"><img src="${ctxStatic}/img/llhb/default.png"/></c:when>
										<c:otherwise><img src="${show[0].simg }"/></c:otherwise>
									</c:choose>
									<div class="c3_l_img_bottom">
										<div class="c3_l_img_shadow"></div>
										<p class="c3_l_img_txt">${show[0].title }</p>
									</div>
								</div>
								<dl class="c3_l_txt">
									<dt>
										<h4 class="font_3">
											<a href="javascript:goPro('${show[1].id }');">${show[1].title }</a>
											<span class="font_1">${fn:substring(show[1].time,5,10)}</span>
										</h4>
										<c:choose>
											<c:when test="${fn:length(show[1].content) >54 }">
												<p class="font_1">${fn:substring(show[1].content,0,54) }...<a href="javascript:goPro('${show[1].id }');" >[详细]</a></p>
											</c:when>
											<c:otherwise>
												<p class="font_1">${show[1].content }<a href="javascript:goPro('${show[1].id }');" >[详细]</a></p>
											</c:otherwise>
										</c:choose>
									</dt>
									<dd >
										<a href="javascript:goPro('${show[2].id }');" class="c3_l_news tmui-ellipsis">${show[2].title }</a>
										<span class="c3_l_time font_1">${fn:substring(show[2].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${show[3].id }');" class="c3_l_news tmui-ellipsis">${show[3].title }</a>
										<span class="c3_l_time font_1">${fn:substring(show[3].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${show[4].id }');" class="c3_l_news tmui-ellipsis">${show[4].title }</a>
										<span class="c3_l_time font_1">${fn:substring(show[4].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${show[5].id }');" class="c3_l_news tmui-ellipsis">${show[5].title }</a>
										<span class="c3_l_time font_1">${fn:substring(show[5].time,5,10)}</span>
									</dd>
									<dd >
										<a href="javascript:goPro('${show[6].id }');" class="c3_l_news tmui-ellipsis">${show[6].title }</a>
										<span class="c3_l_time font_1">${fn:substring(show[6].time,5,10)}</span>
									</dd>
								</dl>
							</li> 
						</ul>
						<!--3F左侧信息内容 end-->
					</div>

					<!--3F右侧话题列表 start-->
					<!--<div class="c3_right">
						<ul class="c3_r_nav font_3">
							<li><a class="active" href="javascript:void(0);">&gt;热点话题</a></li>
							<li><a href="javascript:void(0);">&gt;常见问题</a></li>
						</ul>
						<div class="c3_r_itemsbox">
							<div class="c3_r_items topic">
								<p class="c3_r_i_sign font_1">签到人数:<span>3270420</span></p>
								<ul class="c3_r_i_posts">
									<li>
										<a class="tmui-ellipsis" href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
									<li>
										<a class="tmui-ellipsis" href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
									<li>
										<a class="tmui-ellipsis" href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
								</ul>
								<p class="c3_r_i_more"><a href="javascript:void(0);">点击查看更多热门话题</a></p>
							</div>
							<div class="c3_r_items question" style="display:none">
								<p class="c3_r_i_sign font_1">签到人数:<span>9999999</span></p>
								<ul class="c3_r_i_posts">
									<li>
										<a href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
									<li>
										<a href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
									<li>
										<a href="javascript:void(0);">8月20日佛山市场废镍价格行情</a>
										<p class="font_1"><span class="c3_r_posts_reply">12回复</span><span class="c3_r_posts_time">08.18</span></p>
									</li>
								</ul>
								<p class="c3_r_i_more"><a href="javascript:void(0);">点击查看更多热门话题</a></p>
							</div>
						</div>
					</div>-->
                   <!--V1.0--> 
                    <div class="c3_right">
						<ul class="c3_r_nav font_3">
							<li><a class="active" href="javascript:void(0);">&gt;常见问题</a></li>
						</ul>
						<div class="c3_r_itemsbox">
							<div class="c3_r_items topic">
								<ul class="c3_r_i_posts tmui-ellipsis">
						 		<c:forEach items="${problemList}" var="info" varStatus="status">
									<li onclick="window.open('${ctx}/platform/commenProblem?remark=${info.id}&type=1125');">${info.quesTitle}</li>
								</c:forEach>
								</ul>
								<p class="c3_r_i_more"><a href="${ctx }/platform/commenProblem?type=1125">点击查看更多常见问题</a></p>
							</div>
						</div>
					</div>
                    
					<!--3F右侧话题列表 end-->

					<!--3F底部公司列表 start-->
					<div class="c3_bottom">
						<div class="index_bottom_scroll">
							<ul class="c3_b_companyList">
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'M' && ads.stype eq 'S5' }">
									<c:choose>
										<c:when test="${empty ads.href }"><li><div class="c3_b_logo"><img src="${ads.addr }"/></div></li></c:when>
										<c:otherwise>
											<li><div class="c3_b_logo"><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></div></li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							</ul>
						</div>
						<ul class="c3_b_advantage">
							<li>
								<a href="${ctx }/platform/indexIconInit?index=0">
									<img src="${ctxStatic}/img/llhb/c3_ba1.png" />
									<p>全网营销</p>
								</a>
							</li>
							<li>
								<a href="${ctx }/platform/indexIconInit?index=1">
									<img src="${ctxStatic}/img/llhb/c3_ba2.png" />
									<p>专业服务</p>
								</a>
							</li>
							<%-- <li onclick="go('固废竞价/固废竞价_详情.html')">
								<img src="${ctxStatic}/img/llhb/c3_ba3.png" />
								<p>公开竞价</p>
							</li> --%>
							<li>
								<a href="${ctx }/platform/indexIconInit?index=2">
									<img src="${ctxStatic}/img/llhb/c3_ba4.png" />
									<p>精准报价</p>
								</a>
							</li>
							<li>
								<a href="${ctx }/platform/indexIconInit?index=3">
									<img src="${ctxStatic}/img/llhb/c3_ba7.png" />
									<p>危废服务</p>
								</a>
							</li>
							<li>
								<a href="${ctx }/platform/indexIconInit?index=4">
									<img src="${ctxStatic}/img/llhb/c3_ba5.png" />
									<p>诚信交易</p>
								</a>
							</li>
							<%-- <li>
								<img src="${ctxStatic}/img/llhb/c3_ba6.png" />
								<p>现场评估</p>
							</li> --%>
						</ul>
					</div>
					<!--3F底部公司列表 end-->
				</div>
				<!--3F行业资讯 end-->
			</div>
			<!--中间内容 end-->
		</div>
		<!--中间部分 end-->

		<!--底部 start-->
		<footer>
			<%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
			<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
		</footer>
		<!--底部 end-->

		<!-- 首页底部弹出 -->
		<div class="index-bottom-pl">
			<div class="index-bottom-pl-mask"></div>
			<div class="index-bottom-pl-main">
				<a href="javascript:void(0)"class="font_3">X</a>
				<div class="i-b-pl-mainl">
				</div>
				<div class="i-b-pl-mainr">
					<div class="i-b-pl-mr-l">
						<p>今日已有<span>${eqcount.eqcount}</span>人获取环评报价</p>
						<div class="font_1">
							<input type="text"style="width:130px"placeholder="手机号" id="bottomtel">
							<input type="text"style="width:80px"placeholder="验证码" id="bottomcode">
							<a href="javascript:getcode()"class="btn bottombtn"style="width:100px;">点击获取验证码</a>
						</div>
						<div class="font_1">
							<input type="text"style="width:100px"placeholder="姓名">
							<input type="text"style="width:110px"placeholder="公司名">
							<a href="javascript:subfirst();" class="btn"style="width:100px;background-color:#ee7800">提交</a>
						</div>
					</div>
					<div class="i-b-pl-mr-r">
						<span>扫一扫,关注有礼</span>
						<div class="saomacode">
							<img alt="" src="${ctxStatic}/img/llhb/erweima.png">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="index-bottom-pl-changel"></div>
		<!-- 首页底部弹出 结束-->
		
		<div class="popumask"></div>
        <!-- 立即申请弹出层 -->
		<div class="populayer pl_index_shenqing">
		    <div class="layer_top">
		        <a href="javascript:void(0)" class="close_btn">X</a>
		    </div>
		    <div class="pl_content ">
		        <h3>恭喜您申请成功 !</h3>
		        <p class="font_3">30分钟内将有环保顾问与您联系,确认您的需求 !</p>
		        <div class="per-row row-xiangmuleibie">
		        	<span>项目类别 :</span>
		        	<select>
		        		<option value="">&nbsp;</option>
		        		<option value="">金属制品</option>
		        	</select>
		        	<select name="" id="">
			        	<option value="">&nbsp;</option>
		        		<option value="">金属制品加工制造</option>
		        	</select>
		        </div>
		        <div class="per-row row-jianshedidian">
		        	<span>建设地点 :</span>
		        	<select name="" id="">
		        		<option value="">省/市</option>
		        		<option value="">省/1</option>
		        		<option value="">省/2</option>
		        		<option value="">省/3</option>
		        		<option value="">省/4</option>
		        		<option value="">省/5</option>
		        	</select>
		        	<select name="" id="">
		        		<option value="">省/市</option>
		        	</select>
		        	<select name="" id="">
		        		<option value="">县</option>
		        	</select>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span class="l_square checkone_sel"></span><span>是</span></p>
    	                <p><span class="l_square "></span><span>否</span></p>
    	            </div>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span class="l_square checkone_sel"></span><span>是</span></p>
    	                <p><span class="l_square "></span><span>否</span></p>
    	            </div>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span class="l_square checkone_sel"></span><span>是</span></p>
    	                <p><span class="l_square "></span><span>否</span></p>
    	            </div>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span class="l_square checkone_sel"></span><span>是</span></p>
    	                <p><span class="l_square "></span><span>否</span></p>
    	            </div>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span class="l_square checkone_sel"></span><span>是</span></p>
    	                <p><span class="l_square "></span><span>否</span></p>
    	            </div>
		        </div>
		        <div class="per-row">
		        	<span class="result_span_title">是否涉及喷漆工艺 :</span>
		        	<div class="checkone checkon_person">
    	                <p><span>选择</span><span class="l_square"></span></p>
    	            </div>
		        </div>
		        <div class="per-row check">
		        	
		        </div>
		        <div class="per-row">
		        	<span>项目名称 :</span>
		        	<input type="text">
		        </div>
		        <div class="per-row">
		        	<input type="text"placeholder="手机号"style="width:152px">
		        	<input type="text"placeholder="验证码"style="width:100px">
		        	<a href="javascript:void(0)"class="btn">点击获取验证码</a>
		        </div>
		        <div style="margin-top: 30px;">
		        	<a href="javascript:void(0)" class="btn"
		        		>立即提交</a>
		        </div>
		    </div>
        </div>
        <!-- 立即申请结束 -->
        <!--意见反馈开始-->
        <div class="populayer pl_index_view">
		    <div class="layer_top">
		        <a href="javascript:void(0)" class="close_btn">X</a>
		    </div>
		    <div class="pl_view">
		        <div class="per-row">
		        	<p><span>*</span>留言内容</p>
		        	<textarea></textarea>
		        </div>
		        <div class="per-row">
		        	<p>与您联系</p>
		        	<ul class="contact">
                    	<li><input class="need" type="radio" name="con" checked>需要</li>
                        <li><input class="no_need" type="radio" name="con">不需要</li>
                    </ul>
		        </div>
                <div class="per-row">
                    <p>联系人</p>
                    <input type="text">
                </div>
		        <div class="need_no">
                	<div class="per-row">
		        		<p>联系电话</p>
		        		<input type="text">
		        	</div>
                    <div class="per-row">
		        		<p>电子邮件</p>
		        		<input type="text">
		        	</div>
                    <div class="per-row">
		        		<p>QQ</p>
		        		<input type="text">
		        	</div>
                </div>
                <div class="per-row">
                    <p><span>*</span>验证码</p>
                    <input type="text" style="width:100px;">
                    <a><input type="button" value="点击显示" style="background-color:#ccc;"></a>
                </div>
                <div class="per-row">
                    <p>&nbsp;</p>
                    <input type="button" value="提交">
                	<input type="reset" value="重写">
                </div>
		    </div>  
		</div>
		<!--意见反馈结束--> 
		<div class="popumask aa" style="z-index: 1;"></div>
		<div class="populayer pl_normal bb" style="z-index:22;">
			<div class="layer_top">
			   <span>提示</span>
			   <a href="javascript:void(0)" class="close_btn">X</a>
			</div>
			<div class="pl_content font_3">
			    <p></p>
			</div>
		</div>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
		<script language="JavaScript" type="text/javascript">
			if ((navigator.userAgent.indexOf('MSIE') >= 0)
					&& (navigator.userAgent.indexOf('Opera') < 0)){
				$(".populayer").css("left","30%").css("top","35%");
			}
		</script>
		<script type="text/javascript">
			var time_on=true;//验证码
	        var timer = null;
			$(function(){
				var abc = $(".b_l_f_province option:selected").val();
				if(abc){
					selectCity();
				}
			});
			$(document).ready(function(){
				smooth_scroll(".scroll_list1",".m_t_n_r_content");
				
				if($(".scroll_list2 a").length>4){
					smooth_scroll(".scroll_list2");	
				}
				
				
				
				index_bottom_scroll();
				loginName();
				$(".header_nav ul li").eq(0).addClass("header_nav_sel");
				$(".c2_r_classify").children("a").on("click",function(){
					$(this).addClass("secondType").siblings().removeClass("secondType");	
					list();
				});
				setInterval("window.location.reload()",1800000); //半小时刷新一次
				 $(".b_l_f_province").change(selectCity);
				 /*限制搜索框下 a的数量*/
				h_s_bottom_a();
				$(".c2_r_classify").each(function(){
					var s_total_width=0;
					$(this).children("a").each(function(){
						s_total_width+=$(this).width();
						if(parseInt(s_total_width)>600){
							$(this).hide();
						}
					});
				});
				$(".c2_r_classify").hide().eq(0).show().find("a").eq(0).addClass("secondType");
				$(".content span:last-child").hide();
				list();
				$(".populayer .layer_top a").click(function(){
		            $(this).parents(".populayer").fadeOut(function(){
		            	var on=false;
		                $(".populayer").each(function(){
		                	if($(this).is(":visible")){
		                		on=true;
		                	}
		                });
		                if(!on){
		                	$(".popumask").fadeOut();
		                }
		            });
		        });
				$('#searchtext').bind('keypress',function(event){
		            if(event.keyCode == "13")  {
		            	goPage();
		            }
		        });
				$('#title').bind('keypress',function(event){
		            if(event.keyCode == "13")  {
		            	list();
		            }
		        });
			});
			function list(){
				var typeFirst = $(".c2_l_nav .li_sel").attr("data-index");
				var typeSecond = $(".secondType").attr("data-index");
				var title= $("#title").val();
				var order=$("#order").val();
				$.ajax({
					type:"POST",
					url:"${ctx}/index/getProList",
					data:"typeFirst="+typeFirst+"&typeSecond="+typeSecond+"&title="+title+"&order="+order,
					dataType:'json',
					success:function(data){
						$(".c2_r_imglist ul").empty();
						var str="";
						var src="";
						$.each(data,function(index,item){
							if(item.pic1 != "" && item.pic1 != null){
								src=item.pic1;
							}else if(item.pic2 != "" && item.pic2 != null){
								src=item.pic2;
							}else if(item.pic3 != "" && item.pic3 != null){
								src=item.pic3;
							}else{
								src='${ctxStatic}/img/llhb/default.png';
							}
							str+='<li><div class="c2_r_imgbox"><img src="'+src+'" onclick="HbshopDe('+item.id+')"/></div>'+
							'<p class="c2_r_intro tmui-ellipsis" onclick="HbshopDe('+item.id+')">'+item.title+'</p>'+
							'<p class="c2_r_company font_1 tmui-ellipsis">'+item.cname+'</p>';
							if(item.flag == '1'){
								str+='<p class="authflag font_1">企业认证</p></li>';
							}else{
								str+='<p></p></li>';
							}
						});
						$(".c2_r_imglist ul").html(str);
					}
				});
			}
			//更新时间、价格、人气
			function order(str,obj){
				$("#order").val(str);
				$(".c2_r_synth a").eq(obj).addClass("sel2").siblings().removeClass("sel2");
				list();
			}
			function che(i){
				var p = "";
				switch (parseInt(i)){
				case 0:
					p = "请输入企业名称";
					break;
				case 1:
					p = "请输入供应一般固体废物信息";
					break;
				case 2:
					p = "请输入求购一般固体废物信息";
					break;
				case 3:
					p = "请输入环保设备、原料、服务名称";
					break;
				case 4:
					p = "请输入资讯关键词";
					break;
				}
				$("#searchtext").attr("placeholder",p);
				$(".h_s_top a").eq(i).addClass("li-sel").siblings().removeClass("li-sel");
				$("#biaoji").val(i);
			}
			function goPage(){
				var num=$("#biaoji").val();
				var title=$("#searchtext").val();
				switch (parseInt(num)){
				case 0:
					location.href='${ctx}/EntLib?enterprise='+title;
					break;
				case 1:
					location.href='${ctx}/solidsupply/supplyList?title='+title;
					break;
				case 2:
					location.href='${ctx}/qiugou/searchList?searchtext='+title;
					break;
				case 3:
					location.href='${ctx}/mall?proName='+title;
					break;
				case 4:
					location.href='${ctx}/news?title='+title;
					break;
				}
			}
			function HbshopDe(id){
				window.open('${ctx}/mall/detail/'+id);
			}
			function goPro(id){
				window.open('${ctx}/news/newsitem/'+id);
			}
			function loginName(){
				var loginName=$("#hidden").html();
				if(loginName == "" || loginName == undefined){
					var t = new Date();
					var h = t.getHours();
					var str = "";
					if(h>=6 && h<12){
						str = "上午好";
					}else if(h>=12 && h<18){
						str = "下午好";
					}else{
						str = "晚上好";
					}
					$("#wel").html(str);
					$(".b_r_top_login_b").html('<a href="${ctx }/login"class="when-mouseover">登录</a><a href="${ctx}/reg">立即注册</a>');
				}else{
					$(".b_r_top_login_b").html('<a href="${ctx }/logout"class="when-mouseover" style="margin-left:55px;">退出</a>');
				}
			}
			 function selectCity(){
				var province = $(".b_l_f_province option:selected").val();
          	   $(".b_l_f_city").text('');
	          	   if(!province){
	          		   var htmlss="<option value='0'>市</option>";
	          		 $(".b_l_f_city").append(htmlss);

	          	   }else{
		            	   $.ajax({
		         			type : "POST",
		       				url : "${ctx}/protection/getCity",
		       				data : "province=" + province,
		       				dataType : 'json',
		       				success : function(data) {
		       					var htmls = "<option value='0'>市</option>";
		       					$.each(data,function(index, item) {
		       						htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
		       					});
		       					$(".b_l_f_city").append(htmls);
								$(".b_l_f_city option").each(function (){
									if('${oriCityId}'==$(this).val()){
										$(this).prop('selected','selected');

									}
								});
		       				}
		       			});
	          		}
	            }
			 
			 function sub(str){
				var pre = "";
				if(str!=""){
					pre=str;
				}
				var index = $(".b_l_nav_sel").parent().attr('data-in');
             	var name = $("form input").eq(0).val();
             	var tel = $("form input").eq(1).val();
             	var compname = $("form input").eq(2).val();
             	var remarks = $("form input").eq(3).val();
             	var prov = $(".b_l_f_province option:selected").val();
             	var city = $(".b_l_f_city option:selected").val();
             	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
            	if(name==""||tel==""||compname==""){
            		showMess("请先完善信息");

            	}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
            		showMess("请输入正确的手机号码");

            	}else{
     		        location.href="${ctx}/quote?pre="+pre+"&name="+ name+"&tel="+tel+"&compname="+compname+"&remarks="+remarks+"&prov="+prov+"&city="+city+"&index="+index;
            	}
			 }
		 function showMess(str){
           	$(".aa").show();
       		$(".bb .pl_content p").html(str);
           	$(".bb").show();
           	setTimeout(function(){
           		$(".aa").hide();
           		$(".bb .pl_content p").html("");
               	$(".bb").hide();
           	},3000);
           }
		 function h_s_bottom_a(){
			var total_width=0;
			$(".h_s_bottom a").each(function(){
				total_width+=$(this).width();
				if(parseInt(total_width)>350){
					$(this).hide();
				}
			});
		}
			$(".close_btn").click(function(){
				$(".popumask").hide();
				$(".populayer").hide();
			});
		      //验证码倒计时
	        function getcode(){
		    	var tel = $("#bottomtel").val();
		    	var code = $("#bottomcode").val();
	        	 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
	       			 showMess("请输入正确的手机号码");

	              }else{
	            	  if(time_on){
	                      var time = 30;
	                      clearInterval(timer);
	                      $(this).css({background:"#CCCCCC", color:"#666666"});
	                      $(this).html("重新获取(" + time + ")");
	                      timer = setInterval(function(){
	                          time --;
	                          $(".bottombtn").html("重新获取(" + time + ")");
	                         
	                          if(time > 0){
	                              time_on=false;

	                          }else{
	                              clearInterval(timer);
	                              	$(".bottombtn").html("重新获取");
	                                $(".bottombtn").css({background:"#5EC520", color:"#FFFFFF"});
	                             
	                              time_on=true;
	                          }
	                      },1000);
	                      
	                  }
	                   
	              $.ajax({
	      				type : "POST",
	      				url : "${ctx}/conn",
	      				data : "tel=" + tel,
	      				dataType : 'text',
	      				success : function(data) { 
	      				}
	      			});  
	              }
	        	
	        }
		     function subfirst(){
		    	 var code = $("#bottomcode").val();
		    	 var tel = $("#bottomtel").val();
		    	 var name = $(".index-bottom-pl .font_1:eq(1) input:eq(0)").val();
		    	 var compname = $(".index-bottom-pl .font_1:eq(1) input:eq(1)").val();
		    	 if(name==""||tel==""||compname==""||code==""){
	            		showMess("请先完善信息");

	            	}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
	            		showMess("请输入正确的手机号码");

	            	}else{
	            		$.ajax({
	    	 				type : "POST",
	    	 				url : "${ctx}/checkCode",
	    	 				data : "tel=" + tel+"&checkCode="+code,
	    	 				dataType : 'text',
	    	 				success : function(data) { 
	    	 					if(data!="ok"){
	    	 						showMess(data);

	    	 					}else{
				     		        location.href="${ctx}/quote?name="+ name+"&tel="+tel+"&compname="+compname+"&index=0";
	    	 					}
	    	 				}
	            		});
	            	}
		    	
		     }
		     function smooth_scroll(obj,sub){
                 var $dom = $(obj);
                 $dom.append($dom.html());
                 var $scroll_h=$dom.get(0).scrollHeight/2;
                 var $scroll_t=0;
                 var scrolltimer = setInterval(function(){
                       if($scroll_t>=$scroll_h){
                             $scroll_t=0;
                       }
                       $dom.scrollTop(($scroll_t+=0.5));
                 },17);
                 $dom.children(sub?sub:"a").on("mouseover",function(){
                       clearInterval(scrolltimer);
                 }).on("mouseleave",function(){
                       scrolltimer = setInterval(function(){
                             if($scroll_t>=$scroll_h){
                                   $scroll_t=0;
                             }
                             $dom.scrollTop(($scroll_t+=0.5));
                       },17);
                 });
           }
		     function index_bottom_scroll(){
					/*获取图片的盒子对象*/
					var $ulDom = $(".c3_b_companyList");
					/*滚动时间*/
					var s_time =2000;
					var li_width=$ulDom.children('li').outerWidth();
					var $uldom_chi = $ulDom.children('li').clone();
					$ulDom.append($uldom_chi);
					/*获取长度*/
					var length = $ulDom.children().length;
					
					$ulDom.css({"left":0,"width":li_width*length});
					var index = 0;
					/*banner的定时器轮播*/
					
					var autoplay_timer =setInterval(function(){
						autoscroll();
					},s_time);
					function autoscroll(){
						$ulDom.stop(true).animate({"left":-1 * li_width},function(){
					        $ulDom.css({"left":0});
					        var $first = $ulDom.find("li:first");
					        $ulDom.append($first);
					    });
					}
					$ulDom.children('li').on("mouseover",function(){
						clearInterval(autoplay_timer);
					}).on("mouseleave",function(){
						autoplay_timer =setInterval(function(){
							autoscroll();
						},s_time);
					});

				}
				function noticHref(obj){
					 window.open("${ctx}/"+obj);
				}
		</script>
		
	</body>
    <script>
        window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},
            "share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},
            "selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};
        with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
    </script>
</html>


