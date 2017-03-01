<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>优蚁环保—企业身边的环保顾问，国家环保服务业试点，领先的环保行业一站式服务平台</title>
    <meta name="keywords" content="优蚁环保，环保顾问，环保服务,环保咨询" />
    <meta name="description" content="优蚁环保是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index_new.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
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
        .header_banner .b_r_notice a{display:block;margin-bottom:5px;color:#333;font-size:12px;}
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
        .a{background-color: blue;}
        .main_middle_market_left{float:left;width:49%;height:99%;border:1px solid #E5E5E5;}
        .main_middle_market_right{float:right;width:48.5%;height:99%;margin-right:0px;border:1px solid #E5E5E5;}
        .m_m_m_l_r_top{float:left;width:100%;height:40px;border-bottom:1px solid #cccccc;text-align: center; }
        .m_m_m_l_r_top .right2{height:40px;border:0px solid red;margin-right:10px;color:#999;line-height: 40px;font-size:20px;}

        .m_m_m_l_r_middle_l{float:left;width:74%;height:450px;border:0px solid red;margin-left:5px;overflow: hidden;}
        .m_m_m_l_r_middle_l .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;float:left;width:100%;text-align: left;margin-bottom: 26px;}
        .m_m_m_l_r_middle_r{float:right;width:23%;height:390px;margin-right: 2px;border:0px solid yellow;text-align: center;overflow: hidden;margin-top:30px;}
        .m_m_m_l_r_middle_r .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;}
        .m_m_m_l_r_middle_r .resou{display:block;width:98%;padding:0 0%;border:1px solid #E5E5E5;margin-bottom: 8px; height:30px;line-height: 30px;}
        .m_m_m_l_r_middle_r .resou:hover{color:#5EC520;}
        .resou_selected{color:#5EC520;}

        .scroll_list1 table{width:100%;}
        .scroll_list1 table tr{border-bottom: 1px dashed #ccc;}
        .scroll_list1 table tr{color:#000;}
        .scroll_list1 table tr:hover{background-color: #efefef;cursor: pointer;color:red;}
        .scroll_list1 table tr th{font-size: 16px;padding:2px;}
        .scroll_list1 table tr td{padding:2px;min-width:80px;}

        .c3_bottom .c3_b_advantage li{float:left;padding:10px 27px;cursor: pointer;}
        .c3_bottom .c3_b_advantage li:hover p{color:#5EC520;}
        .c3_bottom .c3_b_advantage li img{width:70px;height:70px;display: block}
        .c3_bottom .c3_b_advantage li p{margin-top: 15px;text-align: center;}

        .info_a:hover{color:#5EC520}

        .pic_div{float:left;width:165px;height:50px;border:0px solid #E5E5E5;position: relative;padding:5px 10px;transition: width 0.5s ease, linear 0s;list-style-type:none;margin-top:10px;overflow:hidden;}
        .pic_div_img_1{width:165px;height:50px;float:left;border:1px solid #E5E5E5;display: block;}
        .pic_div_img_2{width:165px;height:50px;float:left;margin-left:0px;}
        .pic_div_hidden{position: absolute;top: 5px;left:10px;background: #fff none repeat scroll 0 0;border: 3px solid #8fe087;display: block;width:165px;height: 50px;opacity: 0;overflow: hidden;transition: width 0.5s linear 0s;}

        .pic_div_real{width:355px;height:150px;border:0px solid red;position: relative;}
        .pic_div_real_em{border-bottom: 1px dotted #ddd;display: block;font-style: normal;font-weight: bold;line-height: 60px;padding-bottom: 5px;height:51px;overflow: hidden;}
        .pic_div_real_em_span{width:150px;margin-left:10px;float:left;text-align: center;}
        .pic_div_real_p{color: #999;cursor: default;line-height: 18px;padding: 5px;text-align:left;font-size: 12px;}
        .pic_div_real_p_span {color: #2a781f;display: block;font-size: 14px;line-height: 22px;width:80%;margin-left: 10%;text-align: center;}
        .pic_div_real_span {background: #8fe087 none repeat scroll 0 0;bottom: 0;color: #fff;display: block;height: 20px;line-height: 20px;position: absolute;right: 0;text-align: center;width: 70px;padding:0 10px;}

		/*发布需求弹出框样式start */
		.require-box{width:298px;height:370px;background-color: #FFFFFF;border: 1px solid #CCC;font-family: "微软雅黑";position: absolute;z-index: 11;top: 35px;left: 236px;display:none;}
		.rb-item{margin-top: 6px;margin-left: 32px;position: relative;}
		.rb-inoneline{display: inline-block;}
		.rb-p1{font-size: 14px;margin-top: 10px;margin-left: 10px;color: #000000;}
		.rb-p2{font-size: 12px;color: #7A7A7A;margin-bottom: 2px;}
		.rb-p3{font-size: 14px;color: #7A7A7A;}
		.rb-a{display: block;margin-top: 5px;margin-left: 36px;width:224px;height:42px;background-color: #EF7800;color: #FFFFFF;text-align: center;line-height: 42px;font-size: 18px;cursor: pointer;}
		.rb-word{padding-top: 5px;position: relative;top: -8px;}
		.rb-imgdiv{height:46px;width:46px;}
		.rb-word p{height: 16px;}
		/*发布需求弹出框样式end */

    </style>
	
	<script type="text/javascript">
    	//发布需求弹出框js
       	$(function(){
       		$(".h_s_middle a").eq(1).mouseover(function(){
       			$(".require-box").show();
       		});
       		
       		$(".h_s_middle a").eq(1).mouseout(function(){
       			$(".require-box").hide();
       		});
       		
       		$(".require-box").mouseenter(function(){
				$(".require-box").show();
   			});
   			$(".require-box").mouseleave(function(){
   				$(".require-box").hide();
   			});
       		
       	});
	</script>
	
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
                    <img src="${ctxStatic}/img/llhb/logo.gif" alt="优蚁环保—企业身边的环保顾问" class="logoimg" alt="环保服务平台"/>
                    <img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_left" alt="环保服务平台"/>
                    <img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_right" alt="环保服务平台"/>
                    <img src="${ctxStatic}/img/llhb/ant1_left.png" class="ant ant_left" style="z-index: 2;"alt="环保服务平台"/>
                    <img src="${ctxStatic}/img/llhb/ant1_right.png" class="ant ant_right"style="z-index: 2;" alt="环保服务平台"/>
                </a>
                <span>环保部环境服务业试点单位</span>
            </h1>
            <div class="header_search">
                <div class="h_s_top">
                    <input type="hidden" id="biaoji" value="0">
                    <a class="li-sel" href="javascript:che(0);">企业库</a>&nbsp;<span>|</span>
                    &nbsp;<a href="javascript:che(1);">环保需求</a>&nbsp;<span>|</span>
                    &nbsp;<a href="javascript:che(2);">商城</a>&nbsp;<span>|</span>
                    &nbsp;<a href="javascript:che(3);">资讯</a>
                </div>
                <div class="h_s_middle font_1">
                    <span class="h_s_middlebefore"></span>
                    <input type="search" id="searchtext" placeholder="请输入关键字"/>
                    <a class="font_3" id="searchtop" href="javascript:goPage();">搜索</a>
                    <a class="font_3" href="javascript:void(0);" onclick="window.open('${ctx}/addNeed');" style="width:135px; margin-left:50px;background-color:#ee7800;">发布环保需求</a>
                	<!-- 发布需求弹出框start -->
					<div class="require-box">
						<p class="rb-p1">发布您的环保需求，坐等环保顾问为您解决！</p>
						<div class="rb-item">
							<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/afterpublic.png);"></div>
							<div class="rb-inoneline rb-word">
								<p class="rb-p2">需求发布后</p>
								<p class="rb-p3">30分钟内环保顾问主动联系您</p>
							</div>
						</div>
						
						<div class="rb-item">
							<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/fivecomresp.png);"></div>
							<div class="rb-inoneline rb-word">
								<p class="rb-p2">每个需求</p>
								<p class="rb-p3">至少3家环保公司参与报价</p>
							</div>
						</div>
						
						<div class="rb-item">
							<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/goodreputation.png);"></div>
							<div class="rb-inoneline rb-word">
								<p class="rb-p2">98%的需求</p>
								<p class="rb-p3">得到了圆满解决</p>
							</div>
						</div>
						
						<div class="rb-item">
							<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/free.png);"></div>
							<div class="rb-inoneline rb-word">
								<p class="rb-p2">所有需求</p>
								<p class="rb-p3">不向企业收取任何服务费</p>
							</div>
						</div>
						
						<a style="width: 224px;height:42px;background-color: #EF7800;" class="rb-a" onclick="window.open('${ctx}/addNeed');">立即发布环保需求</a>
						
					</div>
                	<!-- 发布需求弹出框end -->
                </div>
                <div class="h_s_bottom font_1">
                </div>
            </div>
            <!-- 右上小广告 -->
            <div class="header_right">
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
        <div  class="banner_direction"  style="left: 0px; ">&lt;</div>
        <div  class="banner_direction"  style="left: auto; right: 0px;">&gt;</div>
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

            <div class="b_r_top_login">
                <a href="${ctx }/home"class="when-mouseover">
                    <div class="b_r_top_login_t" onclick="">
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
                </a>
            </div>

            <div class="b_r_nav">
                <a href="javascript:void(0);" class="b_r_nav_sel">买家服务</a>
                <a href="javascript:void(0);">卖家服务</a>
                <a href="javascript:void(0);">综合服务</a>
            </div>
            <div class="b_r_itemsBox">
                <div class="b_r_items b_r_items_1">
                    <a href="http://hbxq.yyhb365.com/youyipc.html" target="_blank" class="buy_1">
                        <div class="b_r_i_img"></div>
                        <p>需求</p>
                    </a>
                    <a href="${ctx }/mall"class="buy_2">
                        <div class="b_r_i_img"></div>
                        <p>找产品</p>
                    </a>
                    <a href="javascript:void(0);" class="buy_3" onclick='advice()'>
                        <div class="b_r_i_img"></div>
                        <p>意见反馈</p>
                    </a>
                </div>
                <div class="b_r_items b_r_items_2">
                    <a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit"class="seller_1">
                        <div class="b_r_i_img"></div>
                        <p>开商铺</p>
                    </a>
                    <a href="${ctx }/solidsupply/hbDemandQuery" class="seller_2">
                        <div class="b_r_i_img"></div>
                        <p>供求</p>
                    </a>
                    <a href="${ctx }/home?str=/proManage/add" class="seller_3">
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
                <div class="scroll_list2"style="margin-top:5px;width:206px;height:30px;overflow:hidden;line-height: 30px;">
                    <c:forEach items="${noticList}" var="notic">
                        <c:choose>
                            <c:when test="${notic.remarks=='1'}">
                                <a class="tmui-ellipsis" style="display:none;font-size:14px;" href="javascript:void(0);" onclick="noticHref('${notic.ntContent}')">[公告]${notic.ntTitile}</a>
                            </c:when>
                            <c:otherwise>
                                <a style="display:none;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;font-size:14px;" href="${ctx}/notice/noticDetail?id=${notic.id}">[公告]${notic.ntTitile}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="scroll_list3"style="width:206px;height:50px;overflow:hidden;margin-top:20px;border: 0px solid #5ec520;">
                    <c:forEach items="${newComs}" var="com">
                        <a class="tmui-ellipsis" href="${com.remarks}" target="_blank" title="${com.company_name}" >[最新签约]${com.company_name}</a>
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
        <div class="c3_bottom" style="border:1px solid #E8E8E8;height:160px;">
            <div class="pic">
                <a target="_blank" href="http://www.yyhb365.com/youyi/process-special.html"><img class="img1" width="305px" src="${ctx }/static/img/llhb/img1.png" border="0/"></a>
                <a target="_blank" href="http://www.yyhb365.com/youyi/process-special.html"><img class="img2" width="305px" src="${ctx }/static/img/llhb/img2.png" border="0/"></a>
            </div>
            <ul class="c3_b_advantage contentNav">
                <%
                    String[] names = {"环保工程","环境检测","环评编写","节能改造","清洁生产","危废服务","项目验收","应急预案"};
                    int idx = 0;
                %>
                <c:forEach items="${ads }" var="ads" varStatus="sta">
                    <c:if test="${ads.type eq 'M' && ads.stype eq 'S6' }">
                        <%
                            idx ++;
                        %>
                        <li>
                            <c:choose>
                            <c:when test="${empty ads.href }">
                            <a target="_blank" href="${ctx }/index/showComing">
                                </c:when>
                                <c:otherwise>
                                <a target="_blank" href="${ads.href }">
                                    </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${empty ads.addr }">
                                            <img src="${ctxStatic}/img/llhb/hb0<%=idx%>.png"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ads.addr }"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${empty ads.imgname }">
                                            <p><%=names[idx-1]%></p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>${ads.imgname}</p>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>

        <!--1F 资讯 start-->
        <div  class="content3 contentNav">
            <div class="c3_left" style="width:99.8%;">
                <div class="content_title">
                    <a href="${ctx }/news" class="c_t_floor">1F&nbsp;&nbsp;&gt;行业资讯</a>
                    <p class="c_t_detail font_1">实时掌握最新最热门的环保行业新闻及原创优蚁资讯</p>
                    <a href="${ctx }/news" class="c_t_right font_1">更多+</a></p>
                </div>
                <!--1F左侧信息导航 start-->
                <ul class="c3_l_nav font_3">
                    <li class="active"><a href="javascript:void(0);">环保动态</a></li>
                    <li><a href="javascript:void(0);">环保知识</a></li>
                    <li><a href="javascript:void(0);">展会信息</a></li>
                    <li><a href="javascript:void(0);">优蚁资讯</a></li>
                    <div class="c3_l_nav_active"><div></div></div>
                </ul>
                <!--1F左侧信息导航 end-->

                <!--1F左侧信息内容 start-->
                <ul class="c3_l_items" style="width:98%;">

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
                                <c:when test="${fn:length(news[1].content) >100 }">
                                    <p class="font_1">${fn:substring(news[1].content,0,100) }...<a href="javascript:goPro('${news[1].id }');" >[详细]</a></p>
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
                                <c:when test="${fn:length(know[1].content) >100 }">
                                    <p class="font_1">${fn:substring(know[1].content,0,100) }...<a href="javascript:goPro('${know[1].id }');" >[详细]</a></p>
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
                                <c:when test="${fn:length(show[1].content) >100 }">
                                    <p class="font_1">${fn:substring(show[1].content,0,100) }...<a href="javascript:goPro('${show[1].id }');" >[详细]</a></p>
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
                    <li>
                        <div class="c3_l_img" style="cursor:pointer" <c:if test="${youYiNews[0] ne null}">onclick="goPro('${youYiNews[0].id }')"</c:if>>
                            <c:choose>
                                <c:when test="${youYiNews[0].simg == '' || empty youYiNews[0].simg}"><img src="${ctxStatic}/img/llhb/default.png"/></c:when>
                                <c:otherwise><img src="${youYiNews[0].simg }" /></c:otherwise>
                            </c:choose>
                            <div class="c3_l_img_bottom">
                                <div class="c3_l_img_shadow"></div>
                                <p class="c3_l_img_txt">${youYiNews[0].title }</p>
                            </div>
                        </div>
                        <dl class="c3_l_txt">
                            <dt>
                            <h4 class="font_3">
                                <c:if test="${youYiNews[1] eq null}">
                                    <a href="javascript:void(0);">${youYiNews[1].title }</a>
                                </c:if>
                                <c:if test="${youYiNews[1] ne null}">
                                    <a href="javascript:goPro('${youYiNews[1].id }');">${youYiNews[1].title }</a>
                                </c:if>
                                <span class="font_1">${fn:substring(youYiNews[1].time,5,10)}</span>
                            </h4>
                            <c:choose>
                                <c:when test="${youYiNews[1] eq null}">
                                    <p class="font_1"><a href="javascript:void(0);" >[详细]</a></p>
                                </c:when>
                                <c:when test="${fn:length(youYiNews[1].content) >100 }">
                                    <p class="font_1">${fn:substring(youYiNews[1].content,0,100) }...<a href="javascript:goPro('${youYiNews[1].id }');" >[详细]</a></p>
                                </c:when>
                                <c:otherwise>
                                    <p class="font_1">${youYiNews[1].content }<a href="javascript:goPro('${youYiNews[1].id }');" >[详细]</a></p>
                                </c:otherwise>
                            </c:choose>
                            </dt>
                            <dd >
                                <c:choose>
                                    <c:when test="${youYiNews[2] eq null}">
                                        <a href="javascript:void(0);" class="c3_l_news tmui-ellipsis"></a>
                                        <span class="c3_l_time font_1"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goPro('${youYiNews[2].id }');" class="c3_l_news tmui-ellipsis">${youYiNews[2].title }</a>
                                        <span class="c3_l_time font_1">${fn:substring(youYiNews[2].time,5,10)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                            <dd >
                                <c:choose>
                                    <c:when test="${youYiNews[3] eq null}">
                                        <a href="javascript:void(0);" class="c3_l_news tmui-ellipsis"></a>
                                        <span class="c3_l_time font_1"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goPro('${youYiNews[3].id }');" class="c3_l_news tmui-ellipsis">${youYiNews[3].title }</a>
                                        <span class="c3_l_time font_1">${fn:substring(youYiNews[3].time,5,10)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                            <dd >
                                <c:choose>
                                    <c:when test="${youYiNews[4] eq null}">
                                        <a href="javascript:void(0);" class="c3_l_news tmui-ellipsis"></a>
                                        <span class="c3_l_time font_1"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goPro('${youYiNews[4].id }');" class="c3_l_news tmui-ellipsis">${youYiNews[4].title }</a>
                                        <span class="c3_l_time font_1">${fn:substring(youYiNews[4].time,5,10)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                            <dd >
                                <c:choose>
                                    <c:when test="${youYiNews[5] eq null}">
                                        <a href="javascript:void(0);" class="c3_l_news tmui-ellipsis"></a>
                                        <span class="c3_l_time font_1"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goPro('${youYiNews[5].id }');" class="c3_l_news tmui-ellipsis">${youYiNews[5].title }</a>
                                        <span class="c3_l_time font_1">${fn:substring(youYiNews[5].time,5,10)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                            <dd >
                                <c:choose>
                                    <c:when test="${youYiNews[6] eq null}">
                                        <a href="javascript:void(0);" class="c3_l_news tmui-ellipsis"></a>
                                        <span class="c3_l_time font_1"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript:goPro('${youYiNews[6].id }');" class="c3_l_news tmui-ellipsis">${youYiNews[6].title }</a>
                                        <span class="c3_l_time font_1">${fn:substring(youYiNews[6].time,5,10)}</span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                        </dl>
                    </li>
                </ul>
                <!--1F左侧信息内容 end-->
            </div>

        </div>
        <%--1F 横幅 start--%>
        <div class="content_bottom">
            <%int y = 0; %>
            <c:forEach items="${ads }" var="ads">
                <c:if test="${ads.type eq 'C' && ads.stype eq 'S3' }">
                    <% y++;
                        if(y == 1){%>
                    <c:choose>
                        <c:when test="${empty ads.href }">
                            <a target="_blank" href="http://www.yyhb365.com/youyi/process-special.html"><img src="${ads.addr }" alt="优蚁环保网—生产型企业环保工作全流程"/></a>                        </c:when>
                        <c:otherwise>
                            <a target="_blank" href="#" ><img src="${ads.addr }"/></a>
                        </c:otherwise>
                    </c:choose>
                    <%}%>
                </c:if>
            </c:forEach>
        </div>　
        <%--1F 横幅 end--%>
        <!--2F 环保供求 start-->
        <div class="content1 contentNav">
            <div class="content_title">
                <a href="${ctx }/supply-demand" class="c_t_floor">2F&nbsp;&nbsp;&gt;环保供求</a>
                <p class="c_t_detail font_1">全面展示环保需求企业信息，精准对接实力环保公司</p>
                <p class="c_t_right font_1" style="float:left;margin-left:20px;">新增需求:<span>${newHbNum }</span></p>
            </div>
            <!--固废供求页添加  主体上方导航栏 start-->
            <div class="main_top_nav" style="height:495px;">
                <div class="main_middle_market_left">
                    <div class="m_m_m_l_r_top"style="width:100%;">
                        <div class="right2">环保业务提供商
                            <a href="${ctx}/EntLib?fenlei=环保服务&enterprise=&prov=0&descSj=&descRq=" class="c_t_right font_1" style="float:right;margin-right:0px;color: #EF7801;margin-top:10px;">更多+</a></p>
                        </div>
                    </div>
                    <div class="m_m_m_l_r_middle_l">
                                <span class="title">服务推荐
                                    <a href="javascript:void(0);" class="hbgq_hyp" onclick="getRandomCompanyType();">换一批</a>
                                </span>
                        <ul id="pic_ul" style="width:950px;display: block;float:left;">
                            <c:forEach items="${com}" var="c" varStatus="sta">
                                <li class="pic_div">
                                    <a href="javascript:void(0);">
                                        <c:choose>
                                            <c:when test="${!empty c.img  && c.img != 'null' }"><img class="pic_div_img_1" title="${c.name}"  src="${c.img }"></c:when>
                                            <c:otherwise><img class="pic_div_img_1" title="${c.name}"   src="${ctxStatic}/img/llhb/qiyeku01.png"></c:otherwise>
                                        </c:choose>
                                    </a>
                                    <div class="pic_div_hidden"
                                         <c:if test="${sta.count == 10}">style="left:-175px;top:-55px;" </c:if>
                                         <c:if test="${sta.count % 2 == 0}">style="left:-175px;" </c:if>
                                         <c:if test="${sta.count >  8}">style="top:-55px;" </c:if>
                                    >
                                        <div class="pic_div_real">
                                            <em class="pic_div_real_em">
                                                <c:choose>
                                                    <c:when test="${!empty c.img  && c.img != 'null' }"><img class="pic_div_img_2" title="${c.name}"  src="${c.img }"></c:when>
                                                    <c:otherwise><img class="pic_div_img_2" title="${c.name}"   src="${ctxStatic}/img/llhb/qiyeku01.png"></c:otherwise>
                                                </c:choose>
                                                <span class="tmui-ellipsis pic_div_real_em_span" style="">${c.name}</span>

                                            </em>
                                            <p class="pic_div_real_p">
                                                        <span  class="tmui-ellipsis pic_div_real_p_span">
                                                                ${c.name}
                                                        </span>
                                                <c:out value="${fn:substring(c.shop_desc,0,50) }..."></c:out>
                                            </p>
                                                    <span class="pic_div_real_span">
                                                        <a target="_blank" href="javascript:void(0);" onclick="goQiYeKu(${c.id})" style="color:white;">进入首页</a>
                                                    </span>
                                        </div>
                                    </div>
                                </li>
                                <c:if test="${sta.count % 2 == 0}">
                                    <div class="clear"></div>
                                </c:if>
                            </c:forEach>
                        </ul>

                    </div>
                    <div class="m_m_m_l_r_middle_r" >
                        <span class="title">服务业务</span>
                        <c:forEach items="${hbTypes }" var="type" varStatus="sta">
                            <a href="javascript:void(0);"  class="resou tmui-ellipsis" title="${type.name }" onclick="getCompanyByType(this,${type.code})">
                                    ${type.name }
                                <input type="hidden" id="hb_type_${sta.index+1}" value="${type.code}">
                            </a>
                        </c:forEach>

                    </div>

                </div>
                <div class="main_middle_market_right" >
                    <div class="m_m_m_l_r_top"style="width:100%;">
                        <div class="right2">环保业务需求信息
                            <a href="${ctx}/supply-demand" class="c_t_right font_1" style="float:right;margin-right:0px;color: #EF7801;margin-top:10px;">更多+</a></p>
                        </div>

                    </div>
                    <select style="height:30px; width:90px;line-height: 30px;border:solid 1px #C9CACA;margin-top:5px;">
                        <option value="环保业务">全部</option>
                        <c:forEach items="${cts}" var="s">
                            <option value="${s.remarks }">${s.remarks}</option>
                        </c:forEach>
                    </select>
                    <label style="margin-left: 30px;"></label>
                    <input id="startTime" name="startTime" type="text" class="mh_date" style="width:100px;margin-top:5px;" value="${startTime}"/>&nbsp;~&nbsp;
                    <input id="endTime" name="endTime" type="text" class="mh_date" style="width:100px;margin-top:5px;" value="${endTime}"/>
                    <a href="javascript:selectrequrieByDate()"
                       style="display:block;float:right;height:30px;line-height: 30px;color:#fff;text-align: center;background-color: #5ec520;border:1px solid #5ec520;width:60px; margin-right: 5px;margin-top:5px;">
                        查找</a>
                    <div class="for_scroll_table" style="position:relative; height: 43px;margin-top:15px;"></div>
                    <div class="scroll_list1" style="height:400px;width:100%;overflow:hidden;">
                        <table id="tavle">
                            <thead class="scroll_thead">
                            <tr>
                                <td>环保业务</td>
                                <td>联系人</td>
                                <td>联系方式</td>
                                <td>需求状态</td>
                                <td>需求时间</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sss }" var="s">
                                <!-- 过滤掉状态为'提交'的数据 -->
                                <c:if test="${s.trade_status != '提交'}">
                                    <tr onclick="supplyDetail('${s.id }','${s.trade_status}')">
                                        <td>${s.remarks }</td>
                                        <td>
                                            <c:set var = "name" value="${s.name }"></c:set>
                                            <c:out value="${fn:substring(name,0,1) }**"></c:out>
                                        </td>
                                        <td>
                                            <c:set var = "phone" value="${s.phone }"></c:set>
                                            <c:out value="${fn:substring(phone,0,3) }********"></c:out>
                                        </td>
                                        <td <c:if test="${s.trade_status == '已解决'}"> style='color:red;'</c:if> >
                                                ${s.trade_status}
                                        </td>
                                        <td>
                                            <c:set var  = "createDate" value="${s.create_date }"></c:set>
                                            <c:out value="${fn:substring(createDate,0,10) }"></c:out>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--2F 环保供求 end-->

        <%--2F 横幅 start--%>
        <div class="content_bottom">
            <%int x = 0; %>
            <c:forEach items="${ads }" var="ads">
                <c:if test="${ads.type eq 'C' && ads.stype eq 'S3' }">
                    <% x++;
                        if(x == 2){%>
                    <c:choose>
                        <c:when test="${empty ads.href }">
                            <a target="_blank" href="http://www.yyhb365.com/news/newsitem/63"><img src="${ads.addr }" alt="豪丰环保专业基地招商入驻"/></a>
                        </c:when>
                        <c:otherwise>
                            <a target="_blank" href="${ads.href }"><img src="${ads.addr }" alt="豪丰环保专业基地招商入驻"/></a>
                        </c:otherwise>
                    </c:choose>
                    <%}%>
                </c:if>
            </c:forEach>
        </div>
        <%--2F 横幅 end--%>

        <!--3F环保商城 start-->
        <div class="content2 contentNav">
            <div class="content_title">
                <a href="${ctx }/mall" class="c_t_floor">3F&nbsp;&nbsp;&gt;环保商城</a>
                <p class="c_t_detail font_1">覆盖环保全行业，一站式采购商品与服务</p>
                <p class="c_t_right font_1">新增商品数:<span>${proNum }</span></p>
            </div>
            <!--3F左侧导航 start-->
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
                <div class="c2_l_img" style="border:0px solid red;height:203px;">
                    <c:forEach items="${ads }" var="ads">
                        <c:if test="${ads.type eq 'C' && ads.stype eq 'S4' }">
                            <img src="${ads.addr }"/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!--3F左侧导航 end-->

            <!--3F右侧内容 start-->
            <div class="c2_right" style="display:block">
                <input id="order" value="time desc" type="hidden" />
                <div class="c2_r_items c2_r_classify font_1" style="display:block">
                    <p>设备分类</p>
                    <c:forEach items="${equ}" var="equ" >
                        <a href="javascript:void(0);" data-index="${equ.id }">${equ.name }</a>
                    </c:forEach>
                    <div><a href="${ctx }/mall" class="c2_r_more">更多分类&gt;</a></div>
                </div>
                <div class="c2_r_items c2_r_classify font_1" style="display:none;">
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
                    <a class="sel2" href="javascript:order('time desc',0);">时间&or;</a>
                    <a href="javascript:order('low_price desc',1);">价格&or;</a>
                    <a href="javascript:order('page_view desc',2);">人气&or;</a>
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

            <!--3F右侧内容 end-->
            <div class="clear"></div>
        </div>
        <!--3F环保商城 end-->

        <!--最底部 start-->
        <div class="content3 contentNav">
        </div>
        <!--最底部 end-->
        <!--综合信息 start-->
        <div class="content0 contentNav" style="margin-bottom: 10px;" id="comp_div">
            <!--综合信息导航 start-->
            <div class="c0_nav">
                <nav class="font_3">
                    <a class="c0_nav_sel tuijian" href="javascript:void(0);">推荐企业</a>
                </nav>
                <a href="${ctx }/EntLib" style="background: #fff;float:right;margin-right:0px;font-size: 12px;color: #EF7801;margin-top:10px;">更多+</a>
            </div>
            <!--综合信息导航 end-->

            <!--综合信息图片 start-->
            <!-- 推荐企业 -->
            <c:forEach items="${adsLabel }" var="adsLabel" varStatus="sta">
                <div class="c0_img" <c:if test="${sta.index == 0}">style="display:block;" </c:if>>
                    <div class="c0_img_left">
                        <c:forEach items="${ads }" var="ads">
                            <c:if test="${ads.type eq 'M' && ads.stype eq adsLabel.type && ads.ttype eq 'left'}">
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
                                <c:if test="${ads.type eq 'M' && ads.stype eq adsLabel.type && ads.ttype eq 'center'}">
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
                            <c:if test="${ads.type eq 'M' && ads.stype eq adsLabel.type && ads.ttype eq 'right'}">
                                <c:choose>
                                    <c:when test="${empty ads.href }"><img src="${ads.addr }"/></c:when>
                                    <c:otherwise>
                                        <a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div onclick="compGo(-1);" class="comp_direction"  style="left: 0px; ">&lt;</div>
                    <div onclick="compGo(1);"  class="comp_direction"  style="left: auto; right: 0px;">&gt;</div>
                </div>
            </c:forEach>
            <div class="btns">
                <c:forEach items="${adsLabel }" var="adsLabel" varStatus="sta">
                    <div onclick="clickCompanyBtn(this)" class="circle_btn <c:if test="${sta.index == 0}">act</c:if>">${sta.index + 1}</div>
                </c:forEach>
            </div>
        </div>
        <!--综合信息 end-->


        <!-- 人才招聘dom -->
        <div class="job_fairs">
            <div class="job_fairs_title">
                <span class="job_fairs_subtitle">人才招聘</span>
                <span class="job_fairs_more">
                    <a href="${ctx }/news/hiring" target="_blank" class="c_t_right font_1">更多+</a>
                </span>
            </div>
            <div class="job_fairs_content">
                <ul>
                    <c:forEach items="${recuInfoList}" var="info">
                    <li >
                        <span onclick="goTo1(${info.id})" class="job_fairs_little_title">${info.position}</span>
                        <p onclick="goTo2('${info.company_href}')" title="${info.company_name}">${info.company_name}</p>
                    </li>
                    </c:forEach>

                </ul>

            </div>
        </div>
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


<div class="index-bottom-pl-changel"></div>
<!-- 首页底部弹出 结束-->

<%--<div class="popumask"></div>--%>
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

<%--<div class="popumask aa" style="z-index: 21;"></div>--%>
<div class="populayer pl_normal bb" style="z-index:22;">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p></p>
    </div>
</div>
<input type="hidden" id="hb_page_num" value="1">
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index_new.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>

<script language="JavaScript" type="text/javascript">
    if ((navigator.userAgent.indexOf('MSIE') >= 0)
            && (navigator.userAgent.indexOf('Opera') < 0)){
        $(".populayer").css("left","30%").css("top","35%");
    }
</script>
<script type="text/javascript">
    function goTo1(obj){
        window.open('${ctx}/infomaintain/recuitment/detail/'+obj);
    }


    $(function(){
        //开始时间
        $("#startTime,#endTime").manhuaDate({
            Event : "click",//可选
            Left : 0,//弹出时间停靠的左边位置
            Top : -16,//弹出时间停靠的顶部边位置
            fuhao : "-",//日期连接符默认为-
            isTime : false,//是否开启时间值默认为false
            beginY : 1949,//年份的开始默认为1949
            endY :2100//年份的结束默认为2049
        });
    });


    function selectrequrieByDate(){
        var enviroment = $(".main_middle_market_right select option:selected").val();
        var startTime = $('#startTime').val();
        var endTime = $('#endTime').val();
        $.ajax({
            type:"POST",
            url:"${ctx}/index/selectRequriebyDate",
            data:"enviroment="+enviroment+"&startTime="+startTime+"&endTime="+endTime,
            dataType:'json',
            success:function(data){
                var sttr="";
                var flag=0;
                $(".scroll_list1 #tavle tbody").empty();
                $.each(data, function(index, item) {
                    sttr+='<tr onclick="supplyDetail(\''+item.id+'\',\''+item.trade_status+'\')">';
                    sttr+= '<td>'+item.remarks+'</td>';
                    var name = item.name.substring(0,1);
                    sttr+='<td>'+name+'**'+'</td>';
                    var phone = item.phone.substring(0,3);
                    sttr+='<td>'+phone+'*******'+'</td>';
                    if(item.trade_status=="已解决"){
                        sttr+='<td style=\'color:red;\'>'+item.trade_status+'</td>';
                    }else{
                        sttr+='<td>'+item.trade_status+'</td>';
                    }
                    var create = item.create_date.substring(0,10);
                    sttr+='<td>'+create+'</td></tr>';
                    flag++;
                });
                $(".scroll_list1 #tavle tbody").append(sttr);
                clearInterval(scrolltimer2);
                if(flag>13){
                    clearInterval(scrolltimer2);
                    smooth_scroll2(".scroll_list1","tr");
                }
            }
        });
    }

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
                $.each(data.shortTime,function(index,item){
                    if(item.pic1 != "" && item.pic1 != null){
                        src=item.pic1;
                    }else if(item.pic2 != "" && item.pic2 != null){
                        src=item.pic2;
                    }else if(item.pic3 != "" && item.pic3 != null){
                        src=item.pic3;
                    }else{
                        src='${ctxStatic}/img/llhb/default.png';
                    }
                    str +='<li><div class="c2_r_imgbox" style="position:relative;"><img src="'+src+'" onclick="HbshopDe('+item.id+')"/>';
                    str += '<img style="position:absolute;left:0;top:0;width:50px;height:50px;" src="${ctxStatic}/img/llhb/corner.png" />';
                    str += '</div>';
                    str += '<p class="c2_r_intro tmui-ellipsis" onclick="HbshopDe('+item.id+')">'+item.title+'</p>'+
                            '<p class="c2_r_company font_1 tmui-ellipsis">'+item.cname+'</p>';

                    if(item.flag == '1'){
                        str+='<p class="authflag font_1">企业认证</p></li>';
                    }else{
                        str+='<p></p></li>';
                    }
                });
                $.each(data.longTime,function(index,item){
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
                        str+='<p style="margin-top:5px;"></p></li>';
                    }
                });
                $(".c2_r_imglist ul").html(str);
            }
        });
    }


    function goPage(){
        var num=$("#biaoji").val();
        var title=$("#searchtext").val();
        var value = $("#searchtext").val();
        switch (parseInt(num)){
            case 0:
                location.href='${ctx}/EntLib?enterprise='+title;
                break;
            case 1:
                location.href='${ctx}/supply-demand?title='+title;
                break;
            case 2:
                location.href='${ctx}/mall?proName='+title;
                break;
            case 3:
                if(value!=null && value!=""){
                    window.location.href="${ctx}/news/search?title="+value;
                }else{
                    location.href='${ctx}/news?title='+title;
                }
                break;
        }
    }
    function HbshopDe(id){
        window.open('${ctx}/mall/detail/'+id);
    }
    function goPro(id){
        window.open('${ctx}/news/newsitem/'+id);
    }
    function goQiYeKu(id){
        window.open('${ctx}/homepage/'+id);
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



    function noticHref(obj){
        window.open("${ctx}/"+obj);
    }


    function getCompanyByType(mThis,type){
        clearInterval(freshHbServiceTimer);
        $(mThis).addClass("resou_selected");
        $(mThis).siblings().removeClass("resou_selected");
        $(".pic_div").remove();
        $("#hb_page_num").val(1);
        //根据类型获取对应的企业
        $.ajax({
            type : "POST",
            url : "${ctx}/index/getCompanyByType",
            data : "type=" + type+"&num=10",
            dataType : 'json',
            success : function(data) {
                generateHtml(data);
                refreshHbService();
            }
        });
    }

    function getRandomCompanyType(){
        var idx = $(".resou_selected:eq(0)").index();
        var type = $("#hb_type_"+idx).val();
        var pageNum = parseInt($("#hb_page_num").val()) + 1;
        //根据类型获取对应的企业
        $.ajax({
            type : "POST",
            url : "${ctx}/index/getRandomCompanyByType",
            data : "type=" + type+"&num=10" + "&pageNum=" + pageNum,
            dataType : 'json',
            success : function(data) {
                if(pageNum > data.totalPage){
                    $("#hb_page_num").val(0);
                    return;
                }else if(pageNum == data.totalPage){
                    $("#hb_page_num").val(0);
                    $(".pic_div").remove();
                }else{
                    $("#hb_page_num").val(pageNum);
                    $(".pic_div").remove();
                }

                generateHtml(data.list);
                refreshHbService();
            }
        });
    }

    function supplyDetail(id,trade_status){
        if(trade_status=='洽谈中'){
            showMess("该环保需求已在洽谈中,请查看<提交中>的信息");
        }else if(trade_status=='已解决'){
            showMess("该环保需求已解决,请查看<提交中>的信息");
        }else if(trade_status=='关闭中'){
            showMess("该环保需求已关闭,请查看<提交中>的信息");
        }else{
            window.open('${ctx}/supply-demand/details/'+id);
        }
    }






</script>

</body>
</html>


