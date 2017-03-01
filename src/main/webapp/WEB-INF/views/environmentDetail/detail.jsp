<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>

<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
 .header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
.header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
.header_middle .header_search .h_s_middle{float:left;}
.header_middle .header_search .h_s_middle input{width:280px;}
.header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
.header_right{margin-top:17px;}
.showtwo{display:none;}
.showone{display:block;}

 /*yesorno弹出*/
.btns-yesorno{margin-top: 15px;}
.btns-yesorno .yes-btn{width:100px;height:25px;line-height: 25px;color:#fff;background-color: #5ec520;border:1px solid #5ec520;margin-right: 100px;display: inline-block;}
.btns-yesorno .no-btn{width:100px;height:25px;line-height: 25px;color:#666;background-color: #e9e9e9;border:1px solid #ccc;display: inline-block;}
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF;}
/*发布固废供求的弹窗*/
.tanchu_1{position:absolute; width:335px; height:458px; border:1px solid #5cb531;background-color:white; right:0; top:30px; z-index:10;}
.tanchu_1 .fabu_top{padding:20px; width:295px;}
.tanchu_1 .fabu_top p{font-size:18px; color:#333; margin-bottom:40px;}
.tanchu_1 .fabu_top .fabu_1{margin-left:20px; margin-bottom:24px; overflow:hidden;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_p{float:left;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(1) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0 0; padding:0px 20px;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(2) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0px -60px; padding:0px 20px;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(3) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0 -110px; padding:10px 20px;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c{float:left;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c li:nth-of-type(1){font-size:12px; color:#666; line-height:20px;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c li:nth-of-type(2){font-size:14px; color:#333; line-height:20px;}
.tanchu_1 .fabu_bottom{overflow:hidden;padding:10px 0 0 10px; border-top:1px solid #5cb531; margin-top:14px;}
.tanchu_1 .fabu_b_left{color:#333; font-size:14px; width:203px; float:left; margin-right:10px;}
.tanchu_1 .fabu_b_left li p{color:#5cb531; float:left;}
.tanchu_1 .fabu_b_left li:nth-of-type(2){color:#999; font-size:12px;}
.tanchu_1 .fabu_b_left li span{float:right;}
.tanchu_1 .fabu_b_right{float:left; width:102px; margin-top:-6px;}
.tanchu_1 .fabu_b_right img{margin-left:10px;}
/*ie8*/
.ie8 .tanchu_1 .fabu_top p{margin-bottom:20px;}
.ie8 .tanchu_1 .fabu_top .fabu_1{margin-bottom:10px;}

/*设备图 规格 供应商信息*/
.main_product{overflow:hidden; width:1000px;margin-bottom:20px;}
.main_product .main_p{width:998px; border:1px solid #ccc; min-height:340px}
.main_p_left{width:690px; height:340px; overflow:hidden; float:left;}
.main_pic{float:left; width:270px; border-right:1px solid #ccc; height:340px;}
.main_pic dt{border-bottom:1px solid #ccc; width:270px; height:270px;}
.main_pic dt img{width:270px; height:270px;}
.main_pic dd{width:56px; height:56px; float:left; margin:6px 17px;}
.main_pic dd img{width:56px; height:56px;}
.main_des{float:left; margin-left:120px; margin-top:50px;} 
.main_des input{cursor:pointer; background-color:white;}
.main_des dl{width:220px;}
.main_des dl dt{font-size:18px; color:#333; font-weight:bolder;line-height:30px;margin-bottom:40px;}
.main_des dl dd{font-size:14px; color:#666; line-height:30px;display: block;}
.main_des dl dd span{margin-left:20px;}
.main_des input{width:102px; height:30px; line-height:30px; border:1px solid #ccc; text-align:center; margin-right:10px; margin-top:30px;}
.main_des input:hover{background-color:#5cb531; border:1px solid #5cb531; color:white}
.main_des_div{float:left;border:0px solid #ccc;width:100%;text-align: left;line-height: 30px;border-bottom: 1px dashed #CCC;}
.main_des .d_name{display: block;width:20%;float:left;border:0px solid red;}
.main_des .d_value{display: block;width:30%;float:left;border:0px solid red;}
/*供应商信息*/
.pro_info{width:250px; float:left; border-left:1px solid #ccc; height:340px; padding-left:40px}
.pro_info.showone,.pro_info.showtwo{padding-left:40px;}
.pro_info_tit{margin-top:20px; width:220px; height:80px}
.pro_info_tit a{font-size:18px; color:#ee7800; font-weight:bolder; display:block; margin-bottom:10px;}
.pro_info_tit .h6_1{background-image:url(${ctxStatic}/img/llhb/mall_01.png); background-repeat:no-repeat; background-position:0px 0px; width:20px; line-height:24px; float:left; margin-right:6px;}
.pro_info_tit .h6_2{background-image:url(${ctxStatic}/img/llhb/mall_01.png); background-repeat:no-repeat; background-position:-23px 0px; width:20px; line-height:24px; float:left;}
.pro_info_tit a h6{position:absolute;left:0px; bottom:4px;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; z-index:6;}


.pro_info ul li{line-height:28px;}
.pro_info ul .h6_3 a{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; padding:0 10px; background-position:-70px 0px;}
.h6_3 a{cursor:pointer;}
.h6_3 h6{position:absolute; left:80px;bottom:-16px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}
.pro_info ul li span{margin-left:10px;}
.pro_info_icon .info_1{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:0 0; padding:0 8px; cursor:pointer;}
.pro_info_icon .info_2{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:-22px 0; padding:0 8px;cursor:pointer;}
.pro_info_icon .info_3{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:-45px 0; padding:0 10px;cursor:pointer;}
.pro_info_icon .info_11{position:absolute; left:20px;bottom:-16px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}
.pro_info_icon .info_12{position:absolute; left:60px;bottom:-16px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}
.pro_info_icon .info_13{position:absolute; left:32px;bottom:-16px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}

.browse{margin-top:4px;}
/*main_bottom*/
.main_bottom{overflow:hidden; width:1000px;}
.main_b_l{float:left; }
.main_b_l .main_1{}
.main_b_l .main_1 .main_1_tit{overflow:hidden; height:30px;}
.main_b_l .main_1 .main_1_tit li{float:left; width:120px; margin-right:10px; border:1px solid #ccc; text-align:center; line-height:30px; font-size:16px;height:30px; cursor:pointer;}
.main_b_l .main_1 .main_1_de{width:720px; border:1px solid #ccc; margin-top:-1px;}
.main_b_l .main_1 .main_1_tit .cur_tit{background-color:#4f9028; border:1px solid #4f9028; color:white;}

.de_1{width:670px; margin:auto; height:560px;}


/*供应商其他商品*/
.main_2{ margin-top:15px; overflow:hidden; width:722px;}
.main_2 .main_2_tit{position:relative;}
.main_2 .main_2_tit a{width:156px; line-height:30px; border:1px solid #5cb531; background-color:#5cb531; color:white; font-size:16px; display:block; text-align:center;}
.main_2 .main_2_tit .flip{position:absolute; z-index:6; overflow:hidden; top:9px; right:0;}
.main_2 .main_2_tit .flip li{background-image:url(${ctxStatic}/img/llhb/mall_dot1.png); background-repeat:no-repeat; width:14px; height:14px; float:left; margin-right:8px; cursor:pointer;}
.main_2 .main_2_tit .flip .cur_flip{background-image:url(${ctxStatic}/img/llhb/mall_dot2.png);}

.main_2_de{margin-top:20px; height:162px;overflow:hidden;}
.main_2_de .product_1{float:left; width:167px; height:160px; border:1px solid #e5e5e5;margin-right:15px;margin-bottom:15px;}
.main_2_de .product_1:nth-child(4n){margin-right:0;}
.main_2_de .product_1:hover{border:1px solid #5cb531;}
.main_2_de .product_1 dl{}
.main_2_de .product_1 dl dt{color:#333; font-size:14px; line-height:30px; margin-left:6px; display:block;cursor:pointer;}
.main_2_de .product_1 dl dt:hover{color:#5EC520;}

.product_1 img{display:block;width:167px;height:127px;}

.main_3{ margin-top:15px; overflow:hidden;width:722px;}
.main_3 .main_3_tit{position:relative;}
.main_3 .main_3_tit a{width:156px; line-height:30px; border:1px solid #5cb531; background-color:#5cb531; color:white; font-size:16px; display:block; text-align:center;}
.main_3 .main_3_tit .flip{position:absolute; z-index:6; overflow:hidden; top:9px; right:0;}
.main_3 .main_3_tit .flip li{background-image:url(${ctxStatic}/img/llhb/mall_dot1.png); background-repeat:no-repeat; width:14px; height:14px; float:left; margin-right:8px;cursor:pointer;}
.main_3 .main_3_tit .flip .cur_flip{background-image:url(${ctxStatic}/img/llhb/mall_dot2.png);}
.main_3_de{margin-top:20px; height:205px;overflow:hidden;position:relative;}
.main_3_de .product_1{float:left; width:167px; height:200px; border:1px solid #e5e5e5;margin-right:15px;margin-bottom:15px;}
.main_3_de .product_1:nth-child(4n){margin-right:0;}
.main_3_de .product_1:hover{border:1px solid #5cb531;}

.main_3_de .product_1 dl dt{height:26px;color:#333; font-size:14px; line-height:26px; margin-left:6px; cursor:pointer;}
.main_3_de .product_1 dl dt:hover{color:#5ec520;}
.main_3_de .product_1 dl dd{height:12px;font-size:12px; color:#666; line-height:12px;margin-left:6px;}
.main_3_de .product_1 dl dd:nth-of-type(1):hover{color:#5ec520; cursor:pointer}
.main_3_de .scroll-div-3{position:absolute;top:0;left:0;}


/*问答动态*/
.main_4{overflow:hidden; margin-top:40px;}
.main_4 .main_4_tit{overflow:hidden;}
.main_4 .main_4_tit{ width:120px; margin-right:10px; border:1px solid #5cb531; text-align:center; line-height:30px; font-size:16px; display:block; background-color:#5cb531; color:white;}
.main_4 .main_4_de{width:720px; border:1px solid #ccc;margin-top:-1px;}

.main_4 .main_qa{ padding:25px 0px;border-bottom:1px dashed #ccc; width:690px; margin-left:15px;}
.main_4 .main_qa dt{font-size:14px; color:#333; font-weight:bolder; line-height:30px; overflow:hidden;}
.main_4 .main_qa dt span{color:#5cb531;}
.main_4 .main_qa dt h5{font-size:12px; color:#999; float:right; font-weight:normal; margin-top:2px;}
.main_4 .main_qa dd{font-size:12px; color:#666; line-height:22px;}

/*翻页*/
.fanye{margin-top:20px; margin-bottom:20px;overflow:hidden; margin-left:240px;}
.fanye a{float:left; line-height:30px; margin-left:10px;}
.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]:focus{border:1px solid #ee7800;}
.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye .fanye_btn input{width:30px;}

.fanye .fanye_btn .cur_fanye_btn{background-color:#5cb531; border:1px solid #5cb531; color:white;}


.c1_main .c1_m_left{float:left;width:235px; border:1px solid #ccc; padding:10px; margin-bottom:20px;}

.tj_box{margin-top:20px;}
.tj_1{width:235px; margin-bottom:10px; overflow:hidden;}
.qy_1{width:115px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
.qy_1 img{width:100%;height:100%;}
.qy_1:hover p,.qy_1:hover a{display:block;}
.qy_1 p{width:115px; height:68px; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;filter:Alpha(Opacity=80);}
.qy_1 a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}
.product_1 img{display:block;width:167px;height:127px;}

.pro_info{padding-left:0;width:257px;}
.pro_info_tip{width:90%;height:50px; margin-left:5%;margin-top:80px;line-height: 20px;border:1px solid #F7AB00;background-color: #FFFDEE;text-align: center;padding-top:10px;}
.pro_info_tip2{width:90%; margin-left:5%;line-height: 20px;border:0px solid #F7AB00;text-align: center;}
.pro_info_tip_a{display: block;float: left;margin-left: 0px;width: 45%;height:35px;line-height:35px;background-color:#EE7800;color:white;margin-top:10px; }
.pro_info_tip_a_2{display: block;float: right;margin-right: 0px;width: 45%;height:35px;line-height:35px;border:1px solid #CCCCCC; margin-top:10px; }


</style>
</head>
<body>
<!--头部 start-->
<header >
	<div class="line_top"></div>
	<div class="headerBox">
		<%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle" style="height: 145px;">
            <h1 class="header_logo">
                <a href="${ctx }/index">
                     <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
             <div class="header_search">
	            <select >
	                <option value='1'>环保需求</option>
	            </select>
	            <div class="h_s_middle font_1">
	                <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
	                <a class="font_3" href="javascript:sou();" style="margin-left:-1px;">搜索</a>
	            </div>
	        </div>
	        <div class="header_right">
	            <img src="${ctxStatic}/img/llhb/mall_tel.png">
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
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
    	<div class="main_row_1">
        	<div class="cur_position">
        		当前位置>优蚁网>环保供求>需求详情
        	</div>
            <div class="btn_1 font_1" style="margin-right:50px;text-align: center;">
            	<a href="${ctx}/addNeed" target="_blank">发布环保需求</a>
            </div>
        </div>   
        <!--商品图+商品规格+供应商信息start-->
        <div class="main_product">
        	<div class="main_p">
            	<div class="main_p_left">
                    <div class="main_des" style="border:0px solid red;width:90%;margin-left:5%;margin-top: 60px;display: none;">
                        <dl style="width:100%;">
                            <dt style="text-align: center;border:0px solid yellow;width:100%;margin-bottom: 20px;color:red;">${requirement.remarks }</dt>
                            <c:set var="name" value="${requirement.name }"></c:set>
                            <c:set var="phone" value="${requirement.phone }"></c:set>
                            <c:set var="cName" value="${requirement.company_name }"></c:set>
                            <div class="main_des_div nameOrphoneOne">
                                <div class="d_name">公司名称</div>
                                <div class="d_value"><c:out value="${fn:substring(cName,0,2) }********"></c:out></div>
                                <div class="d_name">联系人</div>
                                <div class="d_value"><c:out value="${fn:substring(name,0,1) }**"></c:out></div>
                            </div>
                            <div class="main_des_div nameOrphoneOne">
                                <div class="d_name">联系方式</div>
                                <div class="d_value"><c:out value="${fn:substring(phone,0,3) }********"></c:out></div>
                                <div class="d_name">需求状态</div>
                                <div class="d_value" <c:if test="${requirement.trade_status == '已解决'}"> style='color:red;'</c:if> >${requirement.trade_status }</div>
                            </div>
                            <div class="main_des_div nameOrphoneOne">
                                <div class="d_name">需求时间</div>
                                <c:set var="createdate" value="${requirement.create_date }"></c:set>
                                <div class="d_value"><c:out value="${fn:substring(createdate,0,10) }"></c:out></div>
                            </div>
                            <div class="main_des_div nameOrphoneTwo" style="display: none;">
                                <div class="d_name">公司名称</div>
                                <div class="d_value">${requirement.company_name }</div>
                                <div class="d_name">联系人</div>
                                <div class="d_value">${requirement.name }</div>
                            </div>
                            <div class="main_des_div nameOrphoneTwo" style="display: none;">
                                <div class="d_name">联系方式</div>
                                <div class="d_value">${requirement.phone }</div>
                                <div class="d_name">需求状态</div>
                                <div class="d_value" <c:if test="${requirement.trade_status == '已解决'}"> style='color:red;'</c:if> >${requirement.trade_status }</div>
                            </div>
                            <div class="main_des_div nameOrphoneTwo" style="display: none;">
                                <div class="d_name">需求时间</div>
                                <c:set var="createdate" value="${requirement.create_date }"></c:set>
                                <div class="d_value"><c:out value="${fn:substring(createdate,0,10) }"></c:out></div>
                            </div>
                            <div class="main_des_div">
                                <div class="d_name">需求描述</div>
                                <div class="d_value" style="width:80%;text-align: left;">${requirement.requirement_describe }</div>
                            </div>
                        </dl>
                    </div>
                </div>
                <!--供应商信息-->
                <div class="pro_info showone" >
                    <div class="pro_info_tip">
                        查看该信息联系方式需支付<br/>
                        <span style="color:#EE7800;">优蚁币</span>10点
                    </div>
                    <div style="width: 40px;height: 30px;" class="litterMoney">
                    <label style="display: none;margin-left: 120px;margin-top:70px;z-index: 999; position:absolute;font-size: 12px;color:#5cb531;border: 1px solid #5cb531;background-color: #fff;padding: 0px 5px;">请登录后查看余额</label>
                    </div>
                    <div class="pro_info_tip2" >
                    <div style="margin-bottom: 1px;">
                    <div class="showTips" >
                        <span style="font-weight: bold;">我的优蚁币</span><br/>
                        <a href="javascript:void(0);" class="yuer">余额&nbsp;
                            <img src="${ctxStatic}/img/llhb/jifen_youyib.png" alt="" style="margin-top: -5px;"/>
                            &nbsp;<span>${money}</span>&nbsp;
                            <img src="${ctxStatic}/img/llhb/icon2.png" alt="" style="margin-top: -5px;"/>
                        </a><br/>
                        </div>
                        <div id="checkRe" style="margin-top: 10px;">
                        <a href="javascript:paymoney();" class="pro_info_tip_a font_3" id="nowCheck" >立即支付</a>
                        <a href="javascript:helpme();" class="pro_info_tip_a_2 font_3">联系客服</a>
                        </div>
                        </div>
                        <div class="paymoneySuccess" style="margin-left: 8px;margin-top: 30px">
                        <span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
        <div class="main_bottom">
    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
<div class="popumask" style="z-index: 1;"></div>
<div class="populayer pl_normal" >
    <div class="layer_top">
    	<span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p></p>
    </div>
</div>
    <div class="populayer pl_yesorno">
            <div class="layer_top">
                <span>提示</span>
                <a href="javascript:hideMessYes()" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3">
                <p>请将星标栏目填写完成后保存!<br />否则不能完成认证!</p>
                <div class="btns-yesorno">
                    <a href="javascript:void(0)" class="yes-btn">确定</a>
                    <a href="javascript:void(0)" class="no-btn">取消</a> 
                </div>
            </div>
        </div>
<script>
$(function(){
    $(".main_des").css("display","block");
    var h1 = $(".main_p_left").height();
    var h2 = $(".main_des").height();
    if(h2 > h1){
        $(".main_des").css("margin-top",20 );
        $(".main_p").css("height",h2+50);
        $(".main_p_left").css("height",h2+50);
        $(".pro_info").css("height",h2+50);
    }else{
        $(".main_des").css("margin-top",( h1- h2 )/3 );
        $(".main_des").css("display","block");
    }


	var contentNavArr = [];
	var ad_top=$(".header_banner").each(function(){
	  contentNavArr.push($(this).offset().top);
	
	});
	//绑定事件.
	if('${unLoginUser}'==1){
		$(".showTips").mouseover(function(){
			//setTimeout("alert('5 seconds!')",5000);
			$(".showone label").css("display","block");
		});
		$(".showTips").mouseout(function(){
			//setTimeout("alert('5 seconds!')",5000);
			$(".showone label").css("display","none");
		});
	}
	
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
	//需求详情上下居中
})
</script>

<!--我要评价-->
<script>
	if('${flag}'==0){
		$(".nameOrphoneOne").css("display","none");
		$(".nameOrphoneTwo").css("display","block");
		$("#checkRe").css("display","none");
		//按钮失效.
	   // document.getElementById("nowCheck").href="#"
		$('.paymoneySuccess').find('span'). html('您已经支付成功');
		
	}else{
		$(".nameOrphoneTwo").css("display","none");
		$(".nameOrphoneOne").css("display","block");
		$("#checkRe").css("display","block");
	}

	var check_eva_num;
	$(".de_3 .evaluate_me .check_eva ul").mousedown(function(){
		check_eva_num=$(".de_3 .evaluate_me .check_eva ul").index(this);
		if(check_eva_num==0){
			$(".de_3 .evaluate_me .check_eva ul").find("li:eq(0)").css("background-image","url(${ctxStatic}/img/llhb/check_2.png)");
			$(this).find("li").first().css("background-image","url(${ctxStatic}/img/llhb/check_1.png)");	
		}
		if(check_eva_num==1){
			$(".de_3 .evaluate_me .check_eva ul").find("li:eq(0)").css("background-image","url(${ctxStatic}/img/llhb/check_2.png)");
			$(this).find("li").first().css("background-image","url(${ctxStatic}/img/llhb/check_1.png)");	
		}
		if(check_eva_num==2){
			$(".de_3 .evaluate_me .check_eva ul").find("li:eq(0)").css("background-image","url(${ctxStatic}/img/llhb/check_2.png)");
			$(this).find("li").first().css("background-image","url(${ctxStatic}/img/llhb/check_1.png)");	
		}
    });
    $(".de_3 .evaluate_bottom ul li").mousedown(function(){
		$(".de_3 .evaluate_bottom ul li:eq(0)").toggleClass("qh_niming");
	
	})
</script>
<!--图标提示-->
<script>
	$("h6").hide();
	$(".h6_1").mouseover(function(){
		$(".pro_info_tit h6:eq(0)").show();
    });
    $(".h6_2").mouseover(function(){
		$(".pro_info_tit h6:eq(1)").show();
     });
    $(".h6_3 a").mouseover(function(){
		$(".h6_3 h6").show();
    });
    $(".h6_1,.h6_2,.h6_3").mouseout(function(){
		$("h6").hide();
    });
    $(".pro_info_icon span").mouseover(function(){
		var h6_num1=$(".pro_info_icon span").index(this);
		$(".pro_info_icon h6:eq("+h6_num1+")").show();
    });
    $(".pro_info_icon span").mouseout(function(){
		$("h6").hide();
	})
</script>

<!--发布固废供求消息弹窗-->
<script>
	$(".tanchu_1").hide();
	var tanchuang_num;
	$(".main_row_1 .btn_1 a").mousedown(function(){
		tanchuang_num=$(".main_row_1 .btn_1 a").index(this);
		if(tanchuang_num==0){
			$(".tanchu_1").hide();
			$(".tanchu_1:eq(0)").show();
		}
		if(tanchuang_num==1){
			$(".tanchu_1").hide();
			$(".tanchu_1:eq(1)").show();
		}
    });
    $(".main_row_1 .btn_1").mouseleave(function(){
		$(".tanchu_1").hide();

});
    $(".tanchu_1").mouseover(function(){
		$(this).show();

});
    $(".tanchu_1").mouseleave(function(){
		$(this).hide();
	})
        </script>    


<!--商品图片大小切换-->
<script>
	var dt_num;
	$(".main_pic dd").mouseover(function(){
		$(".main_pic dt img:eq(0)").attr("src",$(this).find("img").attr("src"));
	})
</script>
<!--商品详情、累计评价、我要评价切换-->
<script>
	$(".de_2").hide();
	$(".de_3").hide();
	var de_num;
	$(".main_1 .main_1_tit li").mousedown(function(){
		de_num=$(".main_1 .main_1_tit li").index(this);
		$(".main_1 .main_1_tit li").removeClass("cur_tit");
		$(this).addClass("cur_tit");
		if(de_num==0){
			$(".de_1").show();
			$(".de_2").hide();
			$(".de_3").hide();		
		}else if(de_num==1){
			$(".de_2").show();
			$(".de_1").hide();
			$(".de_3").hide();		
		}else if(de_num==2){
			$(".de_3").show();
			$(".de_2").hide();
			$(".de_1").hide();		
		}

});
    $(".main_1 .score_r a").mousedown(function(){
		$(".de_1").hide();
		$(".de_2").hide();
		$(".de_3").show();
		$(".main_1 .main_1_tit li").removeClass("cur_tit");
		$(".main_1 .main_1_tit li:eq(2)").addClass("cur_tit");	
	})
</script> 

<!--切换其他商品-->
<script>
	
	var product_1_2_h=$(".main_3_de .product_1").outerHeight(true);
	$(".main_2 .flip li").mousedown(function(){
		var flip_num=$(".main_2 .flip li").index(this);
		$(".main_2 .flip li").removeClass("cur_flip");
		$(this).addClass("cur_flip");
		$(".main_2_de .scroll-div-2").css("top",-(flip_num * product_1_2_h));
	});
	var product_1_3_h=$(".main_3_de .product_1").outerHeight(true);
	$(".main_3 .flip li").mousedown(function(){
		var flip_num1=$(".main_3 .flip li").index(this);
		$(".main_3 .flip li").removeClass("cur_flip");
		$(this).addClass("cur_flip");
		$(".main_3_de .scroll-div-3").css({top:-(flip_num1 * product_1_3_h)});
	});
</script>
<!--评价切换-->
<script>
	$(".asse_con").hide();
	$(".asse_con:first").show();
	var asse_num1;
	$(".asse_tit li").mousedown(function(){
		asse_num1=$(".asse_tit li").index(this);
		$(".asse_tit li").removeClass("asse_cur_tit");
		$(this).addClass("asse_cur_tit");
		$(".asse_con").hide();
		$(".asse_con:eq("+asse_num1+")").show();
	
		
	})
</script>
<!--翻页-->
<script>
	var wd_num=0;
	$(".fanye .fanye_btn input").mousedown(function(){
		wd_num=$(".fanye .fanye_btn input").index(this);
		$(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
		$(this).addClass("cur_fanye_btn");

});
    $(".fanye .fanye_left").mousedown(function(){
		if(wd_num>0&wd_num<=2){
			$(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
			$(".fanye_btn input:eq("+wd_num+")").prev().addClass("cur_fanye_btn");
			wd_num=wd_num-1;	
		}

});
    $(".fanye .fanye_right").mousedown(function(){
		if(wd_num>=0&wd_num<2){
			$(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
			$(".fanye_btn input:eq("+wd_num+")").next().addClass("cur_fanye_btn");
			wd_num=wd_num+1;	
		}

});
    function goOther(id){
		 location.href = "${ctx}/qiugou/details?id="+id;
	}
	function goChat(id){
		window.open("${ctx}/home?str=/memSerevice/communication/goChat?id="+id, "_blank");
	}
	function goMail(id){
		window.open("${ctx}/home?str=/memSerevice/message?uid="+id, "_blank");
	}
	//收藏
	function collect(id){
		$.ajax({
			type:"POST",
			url:"${ctx}/qiugou/collect",
			data: "collectId="+id+"&id=${qiugouid}",
			dataType:'text',
			success:function(data){
				showMess(data);
			}
		});
	}
	
	 //不带确定的提示框
    function showMess(str){
    	$(".popumask").show();
		$(".pl_normal .pl_content p").html(str);
    	$(".pl_normal").show();
    	setTimeout(function(){
    		$(".popumask").fadeOut();
			$(".pl_normal .pl_content p").html("");
        	$(".pl_normal").hide();
    	},3000);
    }
    //支付优蚁币
    function paymoney(){
    	showMessYes("确定支付？");
		$(".yes-btn").unbind().on("click",function(){
		    	$.ajax({
					type:"POST",
					url:"${ctx}/environmentDetail/paymoney",
					data:"requireUserId=${requirement.id}&userId=${u.id}",
					dataType:'json',
					success:function(data){
						if(data.msg ==  '成功支付'){
                            hideMessYes();
                            $('.nameOrphoneOne').css("display","none");
                            $('.nameOrphoneTwo').css("display","block");
                            $('.yuer').find('span').html(data.obj);
                            $("#checkRe").css("display","none");
                            //按钮失效.
                            //document.getElementById("nowCheck").href="#"
							$('.paymoneySuccess').find('span'). html('您已经支付成功');
                        //    $('#nowCheck').attr("disabled", true);
						}else{
							if(data.msg=='请先登录'){
								data.msg='请先<span style="color:red">登录</sapn>';
                                showMess(data.msg);
                                hideMessYes();
                                setTimeout(function(){
                                    $(".popumask").fadeOut();
                                    $(".pl_normal .pl_content p").html("");
                                    $(".pl_normal").hide();
                                    location.href = '${ctx}/login';
                                },3000);
							}else if(data.msg == '余额不足'){
								data.msg='您的优蚁币不足，请联系在线客服为您充值';
                                showMess(data.msg);
                                hideMessYes();
                                setTimeout(function(){
                                    $(".popumask").fadeOut();
                                    $(".pl_normal .pl_content p").html("");
                                    $(".pl_normal").hide();
                                },3000);
                            }else if(data.msg=='余额为零'){
                            	data.msg='您的优蚁币不足，请联系在线客服为您充值';
                            	showMess(data.msg);
                                hideMessYes();
                            }
						}
					}
				});
		});
		
		
    }
    $(".no-btn").unbind().on("click",function(){
    	$(".pl_yesorno .pl_content p").text("");
    	$(".pl_yesorno").fadeOut();
    	$(".popumask").fadeOut();
    });
    function showMessYes(str){
    	$(".pl_yesorno .pl_content p").text(str);
    	$(".pl_yesorno").show();
    	$(".popumask").show();
    }
    $(document).ready(function(){
		$(".header_nav ul li").eq(3).addClass("header_nav_sel");
		$('.header_search input').bind('keypress',function(event){
            if(event.keyCode == "13")  {
            	sou();
            }
        });
	});
    function sou(){
		var s = $(".header_search select").val();
		var title=$(".header_search input").val();
		if(s == '1'){
            location.href = '${ctx}/solidsupply/hbDemandQuery?title=' + title;
        }else{
    		location.href='${ctx}/qiugou/searchList?searchtext='+title;
    	}
    }
    function goPic(str){
		 if(str != ""){
			window.open(str, "_blank");
			 
		 }
		}
    function goPage(str){
		location.href='${ctx}'+str;
	}
    function helpme(){
    	window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');
    }
    function hideMessYes() {
        $(".pl_yesorno .pl_content p").text("");
        $(".pl_yesorno").fadeOut();
        $(".popumask").fadeOut();
    }
</script>


<!--推荐商家-->

<!--<script>
	$(".qy_1 p").hide();
	$(".qy_1 a").hide();
	var qy_num;
	$(".qy_1 img").mouseover(function(){
		qy_num=$(".qy_1 img").index(this);	
		$(".qy_1 p").hide();
		$(".qy_1 a").hide();
		$(".qy_1 p:eq("+qy_num+")").show();
		$(".qy_1 a:eq("+qy_num+")").show();	
	})
	$(".qy_1 img").mouseleave(function(){
		$(".qy_1 p").hide();
		$(".qy_1 a").hide();

	})
	
</script>-->
</body>
</html>