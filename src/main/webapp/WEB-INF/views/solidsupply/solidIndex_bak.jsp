<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<link rel="shortcut icon" href="javascript:void(0);"/> 
		<title>优蚁环保</title>
		<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
		<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
		<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
		
		<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/gongyingqiugou_index.js"></script>
       
		<style type="text/css">
           .header_banner_2{height: 50px;width: 100%;position: relative;margin-top: 10px;z-index: 100;border:0px solid red;}
            .header_middle .header_search {margin-left:80px;margin-top:50px;}		
			.header_search .select_div{float:left;height:35px;line-height:35px;position:relative;}
			.header_search  select {float: left;height: 35px;line-height: 35px;width: 92px;border: 1px solid #ccc;}
			.header_middle .header_search .h_s_middlebefore{z-index:1;content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
			.header_search .select_div input{width: 280px;height: 35px;float: left;border: 1px solid #5EC520;text-indent: 28px;box-sizing: border-box;font-size: 12px;}
			.header_search .select_div a{display:block;float:left;height: 35px;line-height:35px;width: 70px;background: #5EC520;color: #FFFFFF;text-align: center;padding:}
            /*固废供求上两块begin*/
            .main_top_nav{height:390px;width: 100%;margin-top: 10px; overflow: hidden;border: 0px solid gray;text-align:center;}

            .main_top_nav_left{float: left;width: 200px;z-index:99;border: 0px solid #5CB531;position: relative; border:1px solid #5CB531;}
            .main_top_nav_left h3{display: block;width:100%;background-color: #5CB531; color: white;height: 50px;text-align: center;line-height: 50px;}
            .left_item{width:80%; height:40px;line-height: 40px;z-index:4;padding-left: 20%;display: block;border-bottom: 1px solid #E5E5E5;background: url("${ctxStatic}/img/llhb/select_right.png") 80% center no-repeat;text-align:left;}
            .left_item_hover{color:#EE7800;border-right:1px solid white;background: url("${ctxStatic}/img/llhb/selected_right.png") 80% center no-repeat; }
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
            .m_t_n_r_content{ overflow:hidden;border-bottom:1px dashed #999;margin-top:10px;vertical-align: middle;}
            .m_t_n_r_content .title{ display: block; line-height: 30px;}
			.m_t_n_r_content .title:hover{color:#5CB531;}
            .m_t_n_r_content .title::before{ content: ""; width: 3px; height: 3px;border-radius: 3px;background-color: #666;float: left;margin-top: 15px; margin-right: 5px;}
            .m_t_n_r_content .time{display: block;float: right;color:#999;}


            .main_top_shop_nav{height:200px; width: 100%; margin-top: 10px; border:1px solid #E5E5E5;}
            .m_t_s_left{float:left;height:100%;width:16%;background-color:#E5E5E5;vertical-align: middle;}
            .m_t_s_left_1{float:left;width:50%;border:0px solid red;margin-top: 30px;}
            .m_t_s_left_1 a{display:block;text-align: right;font-size: 30px;line-height: 35px;color:#5EC520;}
            .m_t_s_left_2{float:left;width:40%;height:140px;margin-top:30px;margin-left:10px;border:0px solid red;}
            .m_t_s_left_2 a{display:block;text-align: left;font-size: 14px;line-height: 18px;}
            .m_t_s_left_shop{height:100%;width:800px;margin-left:199px;border-left:1px solid #E5E5E5;}
            .s_t_s_left_shop_det{float:left;height:100%;width:159px;text-align: center; border-right:1px solid #E5E5E5;}
            .s_t_s_left_shop_det img{width:100%;height:75%;}
            .s_t_s_left_shop_det .title{display: block;color: #000;line-height: 25px;}
            .s_t_s_left_shop_det .bak{display: block;color: #666;line-height: 20px;}
            /*固废供求上两块end*/

            .main_middle_market_nav{height:50px; width:100%;margin-top: 10px; border:1px solid #E5E5E5;text-align: center;}
            .m_m_m_n_title{display: block;float:left;width:100px;background-color:#5EC520;height: 100%;color:white;font-size: 20px;line-height: 50px;margin-right: 20px; }
            .m_m_m_n_content_label{display: block;float:left;line-height: 50px;font-size: 14px;}
            .m_m_m_n_content{position:relative;display: block;float:left;line-height: 40px;font-size: 14px;max-width:70px;height:50px;padding:5px;}
            .m_m_m_n_content:after{;position:absolute;content:"";width:1px;height:15px;background:#333;top:18px;right:0px;}
            .m_m_m_n_content:last-child:after{display:none;}
            .m_m_m_n_content:hover{color:#5EC520;}
            .m_m_m_n_label{display: block;float:left;height:20px;background-color:#EE7800;color: white;line-height: 20px; margin-top:15px;margin-left:100px;margin-right: 10px;  }
            .m_m_m_n_content_right_label{display: block;float: right;line-height: 50px;font-size: 14px;}
            .main_middle_market_nav img{display:block;float:right;margin-right:5px;margin-left:5px;width:20px;heigth:20px;margin-top:15px;}
            .main_middle_market{height:495px; width:100.2%;margin-top:10px;border:0px solid red;}
            .main_middle_market_left{float:left;width:49%;height:100%;border:1px solid #E5E5E5;}
            .main_middle_market_right{float:right;width:48.5%;height:100%;margin-right:0px;border:1px solid #E5E5E5;}
            .m_m_m_l_pic{float:left;height: 100%;border:0px solid red;width:20%;}
            .m_m_m_l_pic div{width:100%;height:50%;}
            .m_m_m_l_pic div img{width:100%;height:100%;}
            .m_m_m_l_pic div div{width:100%;height:30%;background-color: #EE7800;}
             .m_m_m_l_pic div div a:nth-child(1){display:block;color:white;font-weight: bold;line-height: 22px;padding:0 5px;height: 45px;overflow: hidden;}
            .m_m_m_l_pic div div a:nth-child(2){display: block;color:white;line-height:25px;padding:0 5px;}
            .m_m_m_l_pic div div a:nth-child(2):hover{color:#5EC520;}

            .m_m_m_l_r_top{float:left;width:100%;height:60px;border-bottom:1px solid #cccccc; }
            .m_m_m_l_r_top .left{float:left;display:block;height:30px;line-height: 30px;margin-top: 27px;font-size:20px; padding:0 5px;font-weight: bold;border-bottom:3px solid #5EC520;margin-left:5px; }
            .m_m_m_l_r_top .left:hover{cursor:pointer;}
            .m_m_m_l_r_top .right1{float:right;display:block;height:35px;width:70%;line-height: 35px;font-size:28px;color:#5EC520;font-family: 楷体;border:0px solid red;text-align: right;margin-right: 10px; }
            .m_m_m_l_r_top .right1 img{margin-top:10px;}
            .m_m_m_l_r_top .right2{height:20px;border:0px solid red;float: right;margin-right:10px;color:#999;line-height: 20px;}
            .m_m_m_l_r_middle_l{float:left;width:60%;height:390px;border:0px solid red;margin-left:5px;}

            .m_m_m_l_r_middle_l .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;}

            .m_m_m_l_r_middle_l .pic_div{float:left;width:48%;height:200px;border:1px solid #E5E5E5;}
            .pic_div_img_1{width:100%;height:60%;}
            .pic_div_title{display:block;float:left;width:25%;margin-left:5px;color:red;line-height: 20px;height:20px;font-size:16px;font-weight: bold;}
            .pic_div_title_r{color:#5EC520;display: block;float:right;width:70%;line-height: 20px;height:20px;text-align: right;margin-right:2px;}
            .pic_div_bak{display: block;float:left;color:#5EC520;line-height: 25px;margin-left:5px;width:100%;height:25px;}
            .pic_div_img_2{float:left;width:30px;height:30px;margin-left:5px;margin-top: 3px; background:url("${ctxStatic}/img/llhb/company_authentication.png");background-repeat: no-repeat;}
            .pic_div_img_2_title{float:left;margin-left:0px;color: #666;line-height: 30px;height: 30px;}
            .advise_div_left{float:left;width:48%;height:40px;border:1px solid #E5E5E5;position: relative;}
            .advise_div_left:nth-of-type(even){float:right}
            .advise_div_left_img{width:100%;height:100%;}
            .advise_div_left_img_mask{width:100%;height:100%;background-color:rgba(0,0,0,0.5);position: absolute;top:0;left:0;display: none;text-align: center;}
            .advise_div_left_img_mask span{width:100%;line-height: 40px;height: 40px;font-size: 16px;color:white;}
            .advise_div_left:hover .advise_div_left_img_mask{display: block;}

            .advise_div_right{float:right;width:48%;height:40px;border:1px solid #E5E5E5;position: relative;}
            .advise_div_right_img{width:100%;height:100%;}
            .advise_div_right_img img{width:100%;height:100%;}
            .advise_div_right_img_mask{width:100%;height:100%;background-color:rgba(0,0,0,0.5);position: absolute;top:0;left:0;display: none;text-align: center;}
            .advise_div_right_img_mask_span{width:100%;line-height: 120px;height: 120px;font-size: 16px;color:white;}
            .advise_div_right:hover .advise_div_right_img_mask{display: block;}
            .advise_div_right_img{width:100%;height:100%;}

            .m_m_m_l_r_middle_r{float:right;width:16%;height:390px;margin-right: 2%;border:0px solid yellow;text-align: center;overflow: hidden;}
            .m_m_m_l_r_middle_r .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;}
            .m_m_m_l_r_middle_r .resou{display:block;width:65px;padding:0 7%;border:1px solid #E5E5E5;margin-bottom: 8px; height:23px;}
            .m_m_m_l_r_middle_r .resou:hover{color:#5EC520;}

            .m_m_m_r_l_middle_r{float:left;width:96%;height:390px;border:0px solid red;margin-left:10px;}
            .m_m_m_r_l_middle_r_head{width:100%;border-bottom:1px solid #E5E5E5;height:30px;}
            .m_m_m_r_l_middle_r .title{display:block;float:left;width:100%;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;}
            .m_t_n_r_content_2{ overflow:hidden;padding:5px 0;vertical-align: middle;border-bottom:1px dashed #ccc;cursor:pointer;}
            .m_t_n_r_content_a_1{ display: block; line-height: 30px;}
            .m_t_n_r_content_a_1::before{ content: ""; width: 3px; height: 3px;border-radius: 3px;background-color: #666;float: left;margin-top: 15px; margin-right: 5px;}
            .m_t_n_r_content_a_1{float:left;display: block;width: 40%;line-height: 25px;}
            .m_t_n_r_content_2 a{color:#5EC520;}
            .m_t_n_r_content_a_2{float:left;display: block;width: 40%;text-align: center;border:0px solid red;line-height: 25px;}
            .m_t_n_r_content_a_3{float:left;display: block;width: 19%;line-height: 25px;}


            #triangle-right {float:left;margin-top:90px; width: 0; height: 0;border-top: 10px solid transparent; border-left: 10px solid #E5E5E5; border-bottom: 10px solid transparent;}


            /*头部banner图片 start*/
            .main_top_nav_middle{float: left;position:relative;width: 456px; height: 380px; border: 0px solid red;margin-left:10px;}
            .main_top_nav_middle .fade_list {width:100%;height:100%;position:relative;}
            .main_top_nav_middle .fade_list li{position: absolute;z-index:0;left:0;top:0;width:100%;height:100%;padding-top:0px;}
            .main_top_nav_middle .fade_list li a{display: block;width: 100%;height: 100%; margin: 0 auto;}
            .main_top_nav_middle .fade_list li a img{width:100%;height:100%;}
            .main_top_nav_middle .fade_btn {position: absolute;left:0;top:90%;bottom: 10px;z-index:0;width: 96%; text-align: right; border: 0px solid red;}
            .main_top_nav_middle .fade_btn a {display: inline-block;height: 13px;width: 13px;background:#CCCCCC;opacity: 0.5; border-radius: 50%;margin: 3px;z-index: 3;}
            .main_top_nav_middle .fade_btn .h_b_btn_sel{background: #FFFFFF;opacity: 0.8;}
            /*头部banner图片 end*/

            /*左侧悬窗 start*/
            .gf_ad_left{width:80px;position:absolute;top:298px;left:50%; margin-left:-600px;z-index:16;}
            .gf_ad_left img{width:100%;}
            /*左侧悬窗 end*/

            /*右侧悬框*/
            .gf_ad_right{width:108px; height:305px;  position:absolute; top:298px ; right:50%; margin-right:-622px; z-index:15;}
            .r_a_top{width:100%; position:absolute;z-index:17;}
            .r_a_down{width:100%; position:absolute; z-index:16; top:92px;}
            .r_a_down>div:nth-of-type(1){padding-top:18px;}
            .r_a_cc{width:100%;background-color:#5cb531; border-top:1px solid #efefef; padding:13px 0px; overflow:hidden;}
            .r_a_cc span{color:#FFF;display:block; float:left; width:57px; margin-left:13px;}
            .r_a_cc img{display:block; margin-left:8px; float:left; }
            .r_a_cell{ width:100%;padding:10px 0px ; background-color:#efefef;}
            .r_a_cell p{display:block; text-align:center;}
            .r_a_cell>p:nth-of-type(2){color:#5cb531; font-size:14px; }
            
       
        </style>
	</head>
	<body>
		<!--头部 start-->
		<header >
			<div class="line_top"></div>
			<div class="headerBox">
				<!--头部上部 start-->
				<%@ include file="/WEB-INF/views/include/headertop.jsp"%>
				<!--头部上部 end-->
				<!--头部中部 start-->
				<div class="header_middle" style="vertical-align: middle;height: 145px;">
					<h1 class="header_logo" style="display: block;float:left;">
						<a href="${ctx }/index">
							<img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台"/>
						</a>
					</h1>
					<div class="header_search">
						
                        <select >
                            <option value="1">供应</option>
                            <option value="2">求购</option>
                        </select>
						<div class="select_div">
							<span class="h_s_middlebefore"></span>
							<input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;">
							<a class="font_3" href="javascript:sou();" style="margin-left:-1px;">搜索</a>
							<a class="font_3" href="${ctx }/home?str=/solidsupply/solidAdd" style="margin-left:50px;width:100px; background-color:#ee7800;">发布供应</a>
							<a class="font_3" href="${ctx }/home?str=/qiugou" style="margin-left:10px;width:100px;background-color:#ee7800;">发布求购</a>
						</div>
					</div>
					<div class="header_right">
					</div>
					<div class="clear"></div>
				</div>
				<!--头部中部部 end-->
			</div>
			<!--头部banner start-->
			<%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
			<!--头部banner end-->
		</header>
		<!--头部 end-->

		<!--中间部分 start-->
		<div class="wrapper" style="border:0px solid red;">
            <!--主框架 start-->
            <div class="main">
                <div class="font_1"style="margin:10px 0 15px; color:#666">当前位置>优蚁网>固废供求</div>
                <!--供应市场 start-->
                <div class="main_middle_market_nav">
                    <a href="javascript:void(0);" class="m_m_m_n_title"> 供求市场</a>
                    <a href="javascript:void(0);" class="m_m_m_n_content_label">本月新增供求<span style="color:#EE7800;">${num }</span>次</a>
                    <a href="javascript:void(0);" class="m_m_m_n_label">&nbsp;&nbsp;推荐&nbsp;&nbsp;</a>
                    <c:forEach items="${re }" var="re">
                    	<a href="${ctx}/solidsupply/supplyList?typeId=${re.id }" target="_black"  class="m_m_m_n_content tmui-ellipsis">${re.pname }&nbsp;</a>
                    </c:forEach>
                    <!-- <img src="${ctxStatic}/img/llhb/type_setting_label.png" alt=""/>
                    <a href="javascript:void(0);" class="m_m_m_n_content_right_label">设置我感兴趣的行业</a> -->
                </div>
                <!--供应市场 end-->
                <!--供应市场详细  start-->
                <div class="main_middle_market">
                    <div class="main_middle_market_left">
                        <div class="m_m_m_l_pic">
                            <div>
                            	<c:choose>
									<c:when test="${empty ads[0].href }"><img src="${ads[0].addr }"/></c:when>
									<c:otherwise>
										<a href="${ads[0].href}" target="_blank"><img src="${ads[0].addr }"/></a>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div>
                            	<c:choose>
									<c:when test="${empty ads[1].href }"><img src="${ads[1].addr }"/></c:when>
									<c:otherwise>
										<a href="${ads[1].href}" target="_blank"><img src="${ads[1].addr }"/></a>
									</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        <div class="m_m_m_l_r_top"style="width:80%;">
                            <div class="left" onclick="go('${ctx}/solidsupply/supplyList')"><span style="color:#5EC520;">供应</span>市场</div>
                            <div class="right1">
                            		<img src="${ctxStatic}/img/llhb/gyqg_text1.png"/>
                            </div>
                            <div class="right2">发布供应信息，生意即刻找上门</div>
                        </div>
                        <div class="m_m_m_l_r_middle_l">
                            <span class="title">商品推荐</span>
                            <c:forEach items="${d }" var="d">
                            	<div class="pic_div" onclick="goPage('${ctx}/solidsupply/getMess/${d.id }')">
	                            	<c:choose>
			                        	<c:when test="${!empty d.pic1  && d.pic1 != 'null' }"><img class="pic_div_img_1"  src="${d.pic1 }"></c:when>
			                        	<c:when test="${!empty d.pic2  && d.pic2 != 'null' }"><img class="pic_div_img_1"  src="${d.pic2 }"></c:when>
			                        	<c:when test="${!empty d.pic3  && d.pic3 != 'null' }"><img class="pic_div_img_1"  src="${d.pic3 }"></c:when>
			                        	<c:otherwise><img class="pic_div_img_1"  src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
			                        </c:choose>
			                         <c:choose>
			                            <c:when test="${!empty d.lprice  && d.lprice != 'null' && d.lprice != ''}">
			                            	<a href="javascript:void(0);" class="pic_div_title">${d.lprice }</a>
			                            </c:when>
			                            <c:otherwise>
			                             	<a href="javascript:void(0);" class="pic_div_title">面议</a>
			                             </c:otherwise>
		                            </c:choose>
	                                <a href="javascript:void(0);" class="pic_div_title_r">${d.pname }${d.cname }</a>
	                                <a href="javascript:void(0);" class="pic_div_bak tmui-ellipsis">${d.title }</a>
	                                <c:if test="${d.authFlag eq 1 }">
		                                <a href="javascript:void(0);" class="pic_div_img_2"></a>
	                                	<a href="javascript:void(0);" class="pic_div_img_2_title">企业认证</a>
	                                </c:if>
	                            </div>
                            </c:forEach>
                            <%-- <span class="title">活跃供应商</span>
                            <c:forEach items="${supplys }" var="supplys">
                            <div class="advise_div_left" id="${supplys.id }">
                                <div class="advise_div_left_img">
	                                <c:choose>
			                        	<c:when test="${!empty supplys.logoImg  && supplys.logoImg != 'null' }"><img class="advise_div_left_img"  src="${supplys.logoImg }"></c:when>
			                        	<c:otherwise><img class="advise_div_left_img" src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
			                        </c:choose>
                                </div>
                                <div class="advise_div_left_img_mask" onclick="goPage('${ctx}/Library/home/enterpriseHome?enterpriseId=${supplys.id }')">
                                    <span>发布供应${supplys.rank }次</span>
                                </div>
                            </div>
                            </c:forEach> --%>
                        </div>
                        <div class="m_m_m_l_r_middle_r">
                            <span class="title">商品热搜</span>
                            <c:forEach items="${hotq }" var="hotq">
                            	<a href="${ctx}/solidsupply/supplyList?typeId=${hotq.typeId }" target="_black" class="resou tmui-ellipsis" title="${hotq.dname }">${hotq.dname }</a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="main_middle_market_right">
                    <c:set value="${demands }" var="demands" />
                        <div class="m_m_m_l_r_top">
                            <div class="left" onclick="go('${ctx}/qiugou/searchList')"><span style="color:#5EC520;">求购</span>市场</div>
                            <div class="right1">
                            	<img src="${ctxStatic}/img/llhb/gyqg_text2.png"/>
							</div>
                            <div class="right2">发布收购需求，再生资源循环利用</div>
                        </div>
                        <div class="m_m_m_r_l_middle_r">
                            <div class="m_m_m_r_l_middle_r_head" >
                                <span class="title" style="width: 40%;">求购商品</span>
                                <span class="title" style="width: 40%;text-align: center;">采购商所在地</span>
                                <span class="title" style="width: 19%;">发布时间</span>
                            </div>
                            <div class="scroll_list_div"style="width: 467px;height: 397px;overflow: hidden;position:relative;">
                                  <div class="scroll_list"style="overflow: hidden;height: 397px;width:100%;">
                                  <c:forEach items="${demands }" var="q">
                                  		<div class="m_t_n_r_content_2 font_1" onclick="goPage('${ctx}/qiugou/details?id=${q.id }')">
			                                <a class="m_t_n_r_content_a_1 tmui-ellipsis">${q.title }</a>
			                                <a class="m_t_n_r_content_a_2 tmui-ellipsis">${q.aname }${q.bname }</a>
			                                <a class="m_t_n_r_content_a_3">${fn:substring(q.time,0,10) }</a>
			                            </div>
                                  </c:forEach>
                                  </div>
                            </div>
                            <%-- <span class="title" style="margin-top:25px;">活跃采购商</span>
                            <c:forEach items="${dem }" var="dem">
                            	<div class="advise_div_left">
	                                <div class="advise_div_right_img">
	                                    <img src="${dem.logoImg }" />
	                                </div>
	                                <div class="advise_div_left_img_mask" onclick="goPage('${ctx}/Library/home/enterpriseHome?enterpriseId=${dem.id }')">
	                                    <span>发布采购${dem.rank }次</span>
	                                </div>
	                            </div>
                            </c:forEach> --%>
                        </div>
                    </div>
                </div>
                <!--供应市场详细  end-->
            </div>
            <!--主框架 end-->
		</div>
		<!--中间部分 end-->

		<!--底部 start-->
		<footer>
		    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
		    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
		</footer>
        <%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
		<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
		<!--底部 end-->
		<script type="text/javascript">
        $(function(){
        	//滚动
        	smooth_scroll(".scroll_list");
        	setInterval("rollqiugou()",1000*60*30);
        	
    		$(".mall_sort .choese_sort .sort_zh").hide();
    		var contentNavArr = [];
    		var ad_top=$(".header_banner").each(function(){
    		  contentNavArr.push($(this).offset().top);
    		});
    		/*滚动条事件*/
    		$(window).scroll(function(){
    			/*左右悬窗定位*/
    		  	if($(window).scrollTop() >contentNavArr[0]){
    				$(".nav_bottomlist").show();
    			  	$(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});
    		  	}else if($(window).scrollTop() <=contentNavArr[0]){
    			  	$(".nav_bottomlist").hide();
    			  	$(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
    		  	}
    		});
    		$(".content").click(function(){
    			go('固废供求-副本-9-17.html');
    		});
    	});
        $(document).ready(function(){
        	$(".header_nav ul li").eq(2).addClass("header_nav_sel");
			//$(".main_middle_market_nav a:last-child").css("width","0px");
			$('.select_div input').bind('keypress',function(event){
	            if(event.keyCode == "13")  {
	            	sou();
	            }
	        });
		});
        function goPage(str){
        	window.open(str, "_blank");
        }
        function sou(){
        	var v = $(".header_search select").val();
        	var title = $(".select_div input").val();
        	if(v == 1){
        		location.href='${ctx}/solidsupply/supplyList?title='+title;
        	}else{
        		location.href='${ctx}/qiugou/searchList?searchtext='+title;
        	}
        }
        function smooth_scroll(obj){
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
            $dom.children(".m_t_n_r_content_2").on("mouseover",function(){
            	$(this).find("a").css("color","red");
                  clearInterval(scrolltimer);
            }).on("mouseleave",function(){
            	$(this).find("a").css("color","#5EC520");
                  scrolltimer = setInterval(function(){
                        if($scroll_t>=$scroll_h){
                              $scroll_t=0;
                        }
                        $dom.scrollTop(($scroll_t+=0.5));
                  },17);
            });

      }
        function rollqiugou(){
        	window.location.reload();
        }
    </script>

	</body>
</html>


