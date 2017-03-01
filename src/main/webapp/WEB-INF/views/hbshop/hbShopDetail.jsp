<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>${pro.pro_name}-优蚁环保网</title>
<meta name="keywords" content="<c:if test="${pro.seo_key_words =='' || empty pro.seo_key_words }">${pro.pro_name}</c:if><c:if test="${pro.seo_key_words !='' }">${pro.seo_key_words}</c:if>" />
<meta name="description" content="<c:if test="${proDesc =='' || empty proDesc }">${pro.pro_name}</c:if><c:if test="${proDesc !='' }">${fn:substring(proDesc,0,100)}...</c:if>" />
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
<!-- 图片上传js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
.header_middle .header_search select{float:left; height:35px; line-height:35px; width:90px; border:1px solid #ccc;}
.header_middle .header_search .h_s_middle{float:left;}
.header_middle .header_search .h_s_middle input{width:280px;}
.header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}

/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}
/*发布固废供求的弹窗*/
.tanchu_1{position:absolute; width:335px; height:360px; border:1px solid #5EC520;background-color:white; right:0; top:30px; z-index:10;}
.tanchu_1 .fabu_top{padding:20px; width:295px;}
.tanchu_1 .fabu_top p{font-size:18px; color:#333; margin-bottom:20px;}
.tanchu_1 .fabu_top .fabu_1{margin-left:20px; margin-bottom:20px; overflow:hidden;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_p{float:left;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(1) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0 0; padding:0px 20px;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(2) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0px -60px; padding:0px 20px;}
.tanchu_1 .fabu_top .fabu_1:nth-of-type(3) .fabu_1_p{background-image:url(${ctxStatic}/img/llhb/icon9.png); background-repeat:no-repeat;background-position:0 -110px; padding:10px 20px;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c{float:left;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c li:nth-of-type(1){font-size:12px; color:#666; line-height:20px;}
.tanchu_1 .fabu_top .fabu_1 .fabu_1_c li:nth-of-type(2){font-size:14px; color:#333; line-height:20px;}
.tanchu_1 .fabu_bottom{overflow:hidden;padding:10px 0 0 10px; border-top:1px solid #5EC520; margin-top:4px;}
.tanchu_1 .fabu_b_left{color:#333; font-size:14px; width:203px; float:left; margin-right:10px;}
.tanchu_1 .fabu_b_left li p{color:#5EC520; float:left;}
.tanchu_1 .fabu_b_left li:nth-of-type(2){color:#999; font-size:12px;}
.tanchu_1 .fabu_b_left li span{float:right;}
.tanchu_1 .fabu_b_right{float:left; width:102px; margin-top:-6px;}
.tanchu_1 .fabu_b_right img{margin-left:10px;}
/*ie8*/
.ie8 .tanchu_1 .fabu_top p{margin-bottom:10px;}
.ie8 .tanchu_1 .fabu_top .fabu_1{margin-bottom:0px;}

/*设备图 规格 供应商信息*/
.main_product{overflow:hidden; width:1000px;margin-bottom:20px;}
.main_product .main_p{width:998px; border:1px solid #ccc; height:340px}
.main_p_left{width:690px; height:340px; overflow:hidden; float:left;}
.main_pic{float:left; width:270px; border-right:1px solid #ccc; height:340px;}
.main_pic dt{border-bottom:1px solid #ccc; width:270px; height:270px;}
.main_pic dt img{width:270px; height:270px;}
.main_pic dd{width:56px; height:56px; float:left; margin:6px 17px;}
.main_pic dd img{width:56px; height:56px;}
.main_des{float:left; margin-left:40px; margin-top:20px;} 
.main_des input{cursor:pointer; background-color:white;}
.main_des dl{width:350px;}
.main_des dl dt{font-size:18px; color:#333; font-weight:bolder;line-height:30px;margin-bottom:20px;max-height: 120px;overflow: hidden;min-height: 80px;}
.main_des dl dd{font-size:14px; color:#666; line-height:30px;}
.main_des dl dd span{margin-left:20px;}
.main_des input{width:102px; height:30px; line-height:30px; border:1px solid #ccc; text-align:center; margin-right:10px;float:left;margin-top: 20px;}
.main_des input:hover{background-color:#5cb531; border:1px solid #5cb531; color:white}
/*供应商信息*/
.pro_info{width:250px; float:left; border-left:1px solid #ccc; height:340px; padding-left:40px}
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
.pro_info_icon .info_13{position:absolute; left:100px;bottom:-16px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}

.browse{margin-top:4px;}
/*main_bottom*/
.main_bottom{overflow:hidden; width:1000px;}
.main_b_l{float:left; }
.main_b_l .main_1{}
.main_b_l .main_1 .main_1_tit{overflow:hidden; height:30px;}
.main_b_l .main_1 .main_1_tit li{float:left; width:120px; margin-right:10px; border:1px solid #ccc; text-align:center; line-height:30px; font-size:16px;height:30px; cursor:pointer;}
.main_b_l .main_1 .main_1_de{width:720px; border:1px solid #ccc; margin-top:-1px;}
.main_b_l .main_1 .main_1_tit .cur_tit{background-color:#4f9028; border:1px solid #4f9028; color:white;}

.de_1{width:670px; margin:auto; min-height:100px;overflow-x:auto;}
.de_2{width:720px;padding-bottom:20px;  overflow:hidden;}
.de_3{width:720px; padding-bottom:20px;  overflow:hidden;}

/*累计评价*/
/*好评率 综合评分 发送评价*/
.de_2 .score_all{padding:30px 20px 20px 20px;overflow:hidden;border-bottom:1px solid #ccc;}
.de_2 .score_all .score_l{ float:left;font-size:16px; border-right:1px solid #ccc; padding:20px 30px 20px 0;}
.de_2 .score_all .score_l span{font-size:48px; color:#ee7800; display:block;}

.de_2 .score_all .score_c{float:left; margin-left:30px; padding-right:30px; border-right:1px solid #ccc; overflow:hidden;}
.de_2 .zh_1,.zh_2{overflow:hidden;}
.de_2 .zh_1 dt,.zh_2 dt{float:left; margin-top:2px; width:64px;}
.de_2 .score_all .score_c .zh_1 dd{ float:left;}
.de_2 .score_all .score_c .zh_1 dd img{margin-right:2px;}
.de_2 .score_all .score_c .zh_2 dd:nth-of-type(1){width:180px; height:12px; background-color:#e6e6e6; float:left; margin-top:6px;}
.de_2 .score_all .score_c .zh_2 dd:nth-of-type(1) p{height:12px; background-color:#ee0000;}
.de_2 .score_all .score_c .zh_2 dd:nth-of-type(2){float:left;margin-top:2px; margin-left:12px; }
/*发送评价*/
.de_2 .score_all .score_r{float:left; margin-left:40px; overflow:hidden; margin-top:10px;}
.de_2 .score_r span{ color:#666; font-size:14px; display:block; margin-bottom:6px;}
.de_2 .score_r a{width:140px; line-height:32px; text-align:center; background-color:#5cb531; color:white; display:block;}

/*大家印象 及评价详情*/
.de_2 .impression{overflow:hidden; padding:20px;}
.de_2 .impression p{float:left; width:130px; color:#666; font-size:14px; line-height:50px;}
.de_2 .impression ul{float:left; width:540px;}
.de_2 .impression ul li{line-height:20px; border:1px solid #ee7800; padding:0 16px 0 16px; float:left; margin-right:10px; margin-bottom:10px; color:#ee7800; font-size:12px; cursor:pointer;}

.de_2 .assess{padding:0px 20px 20px 20px;}
.de_2 .asse_tit{overflow:hidden;}
.de_2 .asse_tit li{float:left; margin-right:20px; cursor:pointer;}
.de_2 .asse_tit .asse_cur_tit{border-bottom:3px solid #4f9028; color:#4f9028;}
.asse_con{}
.asse_row{overflow:hidden; padding:10px 0 10px 0; border-bottom:1px solid #ccc;}
.asse_row .person_row{float:left; width:60px; margin-right:40px;}
.asse_row .person_row img{overflow:hidden;}
.asse_row .person_row a{font-size:12px; display:block; cursor:pointer;}
.asse_row dl dt{font-size:12px; color:#000; margin-bottom:10px;}
.asse_row dl dd{}
.asse_row dl img{margin-right:10px;}
.asse_row dl span{font-size:12px; color:#999; float:right; margin-top:28px;}

/*我要评价*/
.evaluate_me{overflow:hidden; padding:20px 0 20px 20px;}
.evaluate_me .check_eva{overflow:hidden; margin-bottom:12px;}
.evaluate_me .check_eva ul{margin-right:40px; float:left;}
.evaluate_me .check_eva ul li{float:left; line-height:18px;}
.evaluate_me .check_eva ul .check_1{margin-right:10px;padding-left:7px;padding-right:7px; background-image:url(${ctxStatic}/img/llhb/check_2.png); background-position:center; background-repeat:no-repeat; margin-top:2px; cursor:pointer;}
.evaluate_me .check_eva ul li:nth-of-type(2){margin-right:6px;}
.evaluate_me .biaoqian{}
.evaluate_me .biaoqian span{float:left; color:#333; font-size:14px;}
.evaluate_me .biaoqian ul{float:left; margin-left:8px;}
.evaluate_me .biaoqian ul li{line-height:20px; border:1px solid #ee7800; padding:0 16px 0 16px; float:left; margin-right:10px; margin-bottom:10px; color:#ee7800; font-size:12px;cursor:pointer;} 

.evaluate_con{width:720px; border-bottom:1px solid #ccc; border-top:1px solid #ccc; height:130px;}
.evaluate_con textarea{padding:10px; border:0; width:700px; height:110px;}
.evaluate_bottom{padding-top:10px;}
.evaluate_bottom input{float:left; margin-left:20px;}
.evaluate_bottom a{background-image:url(${ctxStatic}/img/llhb/icon8.png); background-position:left center; background-repeat:no-repeat; padding-left:20px; color:#ee7800; margin-left:240px; float:left; margin-right:20px; line-height:15px; margin-top:4px; cursor:pointer;}
.evaluate_bottom a span{color:#999; font-size:12px;}
.evaluate_bottom ul{float:left;}
.evaluate_bottom ul li{float:left; color:#666; }
.evaluate_bottom ul .niming{margin-right:10px;padding-left:7px;padding-right:7px;margin-top:2px; cursor:pointer;}
.evaluate_bottom ul .niming{background-image:url(${ctxStatic}/img/llhb/check_1.png); background-position:center; background-repeat:no-repeat; }
.evaluate_bottom ul .qh_niming{background-image:url(${ctxStatic}/img/llhb/check_2.png); background-position:center; background-repeat:no-repeat;}

/*供应商其他商品*/
.main_2{ margin-top:15px; overflow:hidden; width:722px;}
.main_2 .main_2_tit{position:relative;}
.main_2 .main_2_tit a{width:156px; line-height:30px; border:1px solid #5cb531; background-color:#5cb531; color:white; font-size:16px; display:block; text-align:center;}
.main_2 .main_2_tit .flip{position:absolute; z-index:6; overflow:hidden; top:9px; right:0;}
.main_2 .main_2_tit .flip li{background-image:url(${ctxStatic}/img/llhb/mall_dot1.png); background-repeat:no-repeat; width:14px; height:14px; float:left; margin-right:8px; cursor:pointer;}
.main_2 .main_2_tit .flip .cur_flip{background-image:url(${ctxStatic}/img/llhb/mall_dot2.png);}

.main_2_de{margin-top:20px; height:162px;overflow:hidden;position:relative;}
.main_2_de .product_1{float:left; width:167px; height:160px; border:1px solid #e5e5e5;margin-right:15px;margin-bottom:15px;}
.main_2_de .product_1:nth-child(4n){margin-right:0;}
.main_2_de .product_1:hover{border:1px solid #5cb531;}
.main_2_de .product_1 dl{}
.main_2_de .product_1 dl dt{color:#333; font-size:14px; line-height:30px; margin-left:6px; display:block;cursor:pointer;}
.main_2_de .product_1 dl dt:hover{color:#5EC520;}

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
.fanye{margin-top:20px; margin-bottom:20px;overflow:hidden;}
.fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]:focus{border:1px solid #ee7800;}
.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye .fanye_btn input{width:30px;}

.fanye .filp .cur_fanye_btn{background-color:#5cb531;width:30px; border:1px solid #5cb531; color:white;}

.c1_main .c1_m_left{float:left;width:235px; border:1px solid #ccc; padding:10px; margin-bottom:20px;}

.tj_box{margin-top:20px;}
.tj_1{width:117px; margin-bottom:10px; overflow:hidden;float:left;}
.qy_1{width:115px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
.qy_1 img{width:110px;}
.qy_1:hover p,.qy_1:hover a{display:block;}
.qy_1 p{width:115px; height:68px; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;filter:Alpha(Opacity=80);}
.qy_1 a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}
#other_pro_self{overflow:hidden;position:absolute;top:0;left:0;}

.evaluate_pics{overflow: hidden;padding:5px 0;}
.evaluate_pic{float:left;height:120px;width:120px;border:1px solid #ccc;margin:0 11px;position: relative;}
.evaluate_pic img{width:100%;height:100%;}
.p_label{border-color:#4f9028; color:#4f9028;}

 /*上传图片弹出框*/
.pl_commit_pic{width:300px;}
.pl_commit_pic .pl_content{padding:15px 0 5px;}
.select-commit label{margin-right: 30px;color:#666;}
.select-commit-content{margin:15px 0;padding:0 40px;}
.net-pic{display: none;}
.pl_commit_pic .btns{overflow: hidden;}
.pl_commit_pic .btns a:nth-child(1){float:left;width:100px;height:30px;line-height: 30px;background-color: #5EC520;color:#fff;text-align: center;margin-left: 40px;}
.pl_commit_pic .btns a:nth-child(2){float:left;width:100px;height:30px;line-height: 30px;background-color: #ccc;color:#666;text-align: center;margin-left: 20px;}
.delete_evaluate_pic{width:100%;height:100%;background-color: #000;opacity: 0.7;color:#fff;line-height: 121px;cursor:pointer;text-align: center;display: none;position: absolute;top:0;left:0;}
.evaluate_pic:hover .delete_evaluate_pic{display: block;}

/*隐藏条数更改*/
.hbshop_disnone{display:none;}

</style>
</head>
<body>
<!--头部 start-->
<header >
    <div class="line_top"></div>
    <div class="headerBox">
        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
       <input id="login_name" type="hidden" value="<shiro:principal property="name"/>">
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle">
        	
            <h1 class="header_logo" style="height:145px;">
                <a href="javascript:go('${ctx}/index');">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <select>
                <c:forEach items="${typeList}" var="list">
                	<option value="${list.id}">${list.name}</option>
                </c:forEach>
                </select>
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:search();" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
             <div class="header_right">
               <a class="font_3" href="javascript:void(0);" onclick="window.open('http://hbxq.yyhb365.com/youyipc.html');" style="display:block;height: 35px;line-height:35px;background: #5EC520;color: #FFFFFF;text-align: center;;width:130px;margin-top:65px;margin-left:50px; background-color:#ee7800;">发布环保需求</a>
               <%--  <ul>
                    <c:forEach items="${ads}" var="ads">
						<c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
							<li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
						</c:if>
					</c:forEach>
                </ul>
                <a href="javascript:void(0);" class="h_r_next">&gt;</a>
       --%>      </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

   <!--头部导航 start-->
	<%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
	<!--头部导航 end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
    	<div class="main_row_1">
        	<div class="cur_position">
        		当前位置>优蚁网>环保商城>${fn:substring(pro.first_name,0,2)}详情
        	</div>


        </div>
        <!--商品图+商品规格+供应商信息start-->
        <div class="main_product">
        	<div class="main_p">
        		<input id="proId" type="hidden" value="${pro.id}" />
        		<input id="createBy" type="hidden" value="${pro.create_by}"/>
            	<div class="main_p_left">
                	<dl class="main_pic">
                    	<dt>
                    	<c:choose>
                    		<c:when test="${not empty pro.pic1 }">
                        	<img src="${pro.pic1}">
                        	</c:when>
                        	<c:when test="${not empty pro.pic2 }">
                        	<img src="${pro.pic2}">
                        	</c:when>
                        	<c:otherwise>
                        	<img src="${pro.pic3}">
                        	</c:otherwise>
                        </c:choose>
                        </dt>
                        <c:choose>
                        <c:when test="${not empty pro.pic1}">
                        <dd><img src="${pro.pic1}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${not empty pro.pic2}">
                        <dd><img src="${pro.pic2}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${not empty pro.pic3}">
                        <dd><img src="${pro.pic3}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                    </dl>
                   
                    <div class="main_des" style="border:0px solid red;min-height: 90%;">
                    	<dl>
                        	<dt>${pro.pro_name}</dt>
                            <dd>价&nbsp;&nbsp;&nbsp;格<span><c:choose><c:when test="${empty pro.low_price && empty pro.high_price}">面议</c:when><c:otherwise>${pro.low_price}</c:otherwise></c:choose><c:if test="${not empty pro.low_price && not empty pro.high_price}">~${pro.high_price}元/${pro.unit_label}</c:if></span></dd>
                            <dd>供应量<span><fmt:parseNumber value='${pro.amount}' type='number' integerOnly='true'/>${pro.unit_label}</span></dd>
                            <dd>所在地<span>${pro.p_prov_name}&nbsp;${pro.p_city_name}</span></dd>
                            <dd>有效期<span>${pro.past_date > '9999-12-30'? '长期有效':(fn:substring(pro.past_date,0,10))}</span></dd>
                        </dl>
                        <input class="font_1" type="button" value="我要询价" onclick="dialogue()">
                        <input class="font_1" type="button" value="收藏该商品" onclick="collect()">
                    </div>
                </div>
                <!--供应商信息-->
                <div class="pro_info">
                	<div class="pro_info_tit" style="position:relative;">
                    	<a>供应商信息</a>
                    	<c:if test="${not empty pro.ps_id}">
                    	<a class="h6_1" href="javascript:void(0)">&nbsp;<h6 class="font_1">手机号认证</h6></a>
                    	</c:if>
                        <c:if test="${not empty pro.cf_id}">
                        <a class="h6_2" href="javascript:void(0)">&nbsp;<h6 class="font_1">诚信档案</h6></a>
                        </c:if>
                        
                    </div>
                    <ul class="font_1">
                    	<li>公司名<span></span><a href="javascript:window.open('${ctx}/homepage/${pro.c_id}')" style='color:#ee7800'>${pro.company_name}</a></span></li>
                        <li class="h6_3" style="position:relative;">联系人<span>${pro.real_name}${not empty pro.ps_sex? (pro.ps_sex eq 'M'? '(先生)':'(女士)'):''}</span><a onclick="dialogue()">&nbsp;</a>
                        	<h6 >点击交谈/留言</h6>
                        </li>
                        <li class="pro_info_icon" style="position:relative;">会&nbsp;&nbsp;&nbsp;员<span <c:if test="${status eq 1}">class='info_1'</c:if>>&nbsp;</span><span class="info_3" onclick="sendEmail()">&nbsp;</span>
                        	<h6 class="info_11">当前在线</h6>
                            <h6 class="info_12" >发送邮件</h6>
                        </li>
                        <li>电&nbsp;&nbsp;&nbsp;话<span>${pro.c_phone}</span></li>
                        <li>手&nbsp;&nbsp;&nbsp;机<span>${pro.ps_phone}</span></li>
                        <li>地&nbsp;&nbsp;&nbsp;区<span>${pro.c_prov_name}-${pro.c_city_name}</span></li>
                        <li>地&nbsp;&nbsp;&nbsp;址<span>${pro.c_address}</span></li>
                        
                    </ul>
                </div>   
            </div>
            <!--浏览次数-->
            <div class="browse font_1" style="color:#999;">
            	<img src="${ctxStatic}/img/llhb/mall_04.png";>
                浏览次数(<span>${pro.page_view}</span>人气)
            </div>
        </div>       
        
        <div class="main_bottom">
        	<!--商品详情、累计评价、我要评价-->
        	<div class="main_b_l">
            	<div class="main_1">
                	<ul class="main_1_tit">
                    	<li class="cur_tit">商品详情</li>
                        <li onclick="praiseLabelLoad()">累计评价</li>
                        <li onclick="clearPraClass()">我要评价</li>
                 	</ul>
                    <!--商品详情-->
                    <div class="main_1_de">
                    	<div class="de_1">
                        	${pro.pro_desc}
                        </div>
                        <div class="de_2">
                        	<div class="score_all">
                            	<div class="score_l">
                            		<c:if test="${goodCount==null || goodCount=='' || goodCount=='undefined'}">
                            		<c:set var="goodCount" value="${0}"/>
                            		</c:if>
                            		<c:if test="${mediumCount==null || mediumCount=='' || mediumCount=='undefined'}">
                            		<c:set var="mediumCount" value="${0}"/>
                            		</c:if>
                            		<c:if test="${badCount==null || badCount=='' || badCount=='undefined'}">
                            		<c:set var="badCount" value="${0}"/>
                            		</c:if>
                            		<c:set var="count" value="${goodCount+mediumCount+badCount}"/>
                                	<span><fmt:formatNumber type='number' value="${count != 0? 100*goodCount/count:0}" maxFractionDigits="0"/>%</span><br>
                                	 好评率
                                </div>
                                <div class="score_c">
                                	<dl class="zh_1">
                                    	<dt>综合评分:</dt>
                                    	<c:set var="starCount" value="${count != 0? (goodCount*5+mediumCount*3+badCount)/count:0}" scope="page"/>
                                    	<c:choose>
                                    		<c:when test="${starCount <=0 }">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></dd>                                  		
                                    		</c:when>
                                    		<c:when test="${starCount >0 && starCount <=1 }">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></dd>                                  		
                                    		</c:when>
                                    		<c:when test="${starCount>1 && starCount<=2}">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></dd>                                  		
                                    		</c:when>
                                    		<c:when test="${starCount>2 && starCount<=3}">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></dd>                                  		
                                    		</c:when>
                                    		<c:when test="${starCount>3 && starCount<=4}">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"></dd>                                  		
                                    		</c:when>
                                    		<c:when test="${starCount>4 && starCount<=5}">
                                          	<dd><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"></dd>                                  		
                                    		</c:when>
                                    	</c:choose> 
                                    </dl>
                                    <dl class="zh_2">
                                    	<dt>好评率:</dt>
                                        <dd><p style="width:<fmt:formatNumber type='number' value="${count !=0 ?100*goodCount/count:0}" maxFractionDigits="0"/>%;"></p></dd>
                                        <dd><fmt:formatNumber type='number' value="${count !=0 ?100*goodCount/count:0}" maxFractionDigits="0"/>%</dd>
                                    </dl>
                                    <dl class="zh_2">
                                    	<dt>中评率:</dt>
                                        <dd><p style="width:<fmt:formatNumber type='number' value="${count !=0 ?100*mediumCount/count:0}" maxFractionDigits="0"/>%;"></p></dd>
                                        <dd><fmt:formatNumber type='number' value="${count !=0 ?100*mediumCount/count:0}" maxFractionDigits="0"/>%</dd>
                                    </dl>
                                    <dl class="zh_2">
                                    	<dt>差评率:</dt>
                                        <dd><p style="width:<fmt:formatNumber type='number' value="${count !=0 ?100*badCount/count:0}" maxFractionDigits="0"/>%;"></p></dd>
                                        <dd><fmt:formatNumber type='number' value="${count !=0 ?100*badCount/count:0}" maxFractionDigits="0"/>%</dd>
                                    </dl>
                                </div>
                                <div class="score_r" style="display: none;">
 									<span>您对已购商品进行评价</span>
                                    <a href="javascript:void(0)">发送评价送积分</a>
                                </div>
                            </div>
                            <div class="impression">
                            	<p>大家印象</p>
                                <ul>
                                	<c:forEach items="${praiseLabel}" var="label">
                                    <li data-value="${label.value}">${label.label}(<span></span>)</li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="assess">
                            	<ul class="asse_tit">
                                	<li class="asse_cur_tit" data-value="">全部评价(${count !=0? count:0})</li>
                                    <li data-value="5">好评(${count !=0?goodCount:0})</li>
                                    <li data-value="3">中评（${count !=0?mediumCount:0}）</li>
                                    <li data-value="1">差评（${count !=0?badCount:0}）</li>
                                </ul>
                                <hr style="border:none; border-bottom:1px solid #ccc; margin-top:-2px; width:740px; margin-left:-20px;">
                                <div id="allPraise" class="asse_con" style="display: block;">
                                 <c:forEach items="${praiseList}" var="praise">
                                	<div class="asse_row">
                                    	<div class="person_row">
                                        	<img src="${ctxStatic}/img/llhb/default.png">
                                        	<%-- <input type="text" value="${praise.isNiming}"/> --%>
                                            <a><c:choose><c:when test="${praise.is_niming eq true}">匿名</c:when><c:otherwise>${praise.login_name}</c:otherwise></c:choose></a>
                                        </div>
                                        <dl>
                                        	<dt>${praise.pra_desc}</dt>
											<dd>${praise.imgs}
											<%-- <c:forEach items="${praise.picList}" var="praPic">
												<c:if test="${not empty praPic}">
												<img src="praPic.pic" sytle="width:44px; height:44px;">
												</c:if>
											</c:forEach> --%>
											<span><fmt:formatDate value="${praise.create_date}" type="both" /></span>
											</dd>
                                        </dl>
                                    </div>
                                    </c:forEach> 
                            	</div>
                            <div class="fanye font_1 color_1">
			                <c:set var="currentPage" value="${recordPage.pageNumber}" />
							<c:set var="totalPage" value="${recordPage.totalPage}" />
							<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
							<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" /> 
							<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
							
			                </div>
			              </div>  
                        </div>
                        <div id="evaluate_pro" class="de_3">
                        	<div class="evaluate_me">
                            	<div class="check_eva">
                                	<ul>
                                    	<li class="check_1" data-selected="0" data-value="5">&nbsp;</li>
                                        <li style="margin-top:2px;">好评</li>
                                        <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"></li>
                                    </ul>
                                    <ul>
                                    	<li class="check_1" data-selected="0" data-value="3">&nbsp;</li>
                                        <li style="margin-top:2px;">中评</li>
                                        <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></li>
                                    </ul>
                                    <ul>
                                    	<li class="check_1" data-selected="0" data-value="1">&nbsp;</li>
                                        <li style="margin-top:2px;">差评</li>
                                        <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></li>
                                    </ul>
                                </div>
                                <div id="praise_label" class="biaoqian">
                                	<span>标签:</span>
                                    <ul>
                                    <c:forEach items="${praiseLabel}" var="label">
                                    	<li data-value="${label.value}" data-selected="0">${label.label}</li>
                                    </c:forEach>
<!--                                 		<li>价格蛮便宜的(35)</li><li>大品牌(35)</li><li>服务态度好</li><li>很好</li><li>价格蛮便宜的</li><li>大品牌</li>
 -->                                </ul>
                                </div>
                            </div>
                            <div class="evaluate_con">
                            	<textarea></textarea>
                            </div>
                             <div class="evaluate_pics">
                               
                            </div>
                            <div class="evaluate_bottom">
                            	<input type="button" value="我来说两句" onclick="evaluatePro()" style="width:120px; line-height:30px; background-color:#5cb531; color:white; border:none; cursor:pointer;">
                                <a>晒图片<span>限5张</span></a>
                                <ul>
                                	<li class="niming">&nbsp;</li>
                                	<li style="margin-top:2px;">匿名发表（内容限5至500字）</li>
                                 </ul>
                            </div>
                        </div>
	                   	
                    </div>
                    <!--商品详情end-->                  
                </div>
                <!--供应商其他商品-->
                <c:if test="${fn:length(otherPro) >0 }">
                <div class="main_2">
                	<div class="main_2_tit">
                    	<a style="line-height:30px;">供应商其他商品</a>
                        <hr style=" margin-top:0px; border:none; border-bottom:1px solid #5cb531;">
                        <ul class="flip">
                        <c:choose>
                        	<c:when test="${fn:length(otherPro) >4 &&  fn:length(otherPro) <=8}"><li class="cur_flip"></li><li></li></c:when>
                        	<c:when test="${fn:length(otherPro) >8 &&  fn:length(otherPro) <=12}"><li class="cur_flip"></li><li></li><li></li></c:when>
                        	<c:otherwise></c:otherwise>
						</c:choose>
                        </ul>
                    </div>
                   
                    <div class="main_2_de">
	                    <div id="other_pro_self" class="scroll-div-2">
	                    	<c:forEach items="${otherPro}" var="otherPro">
		                    	<div class="product_1"  id="${otherPro.id }" onclick="go('${ctx}/mall/detail/${otherPro.id}')">
		                        	<c:choose>
			                        	<c:when test="${!empty otherPro.pic1  && otherPro.pic1 != 'null' }"><img src="${otherPro.pic1 }" style="width:167px;height:127px;"></c:when>
			                        	<c:when test="${!empty otherPro.pic2  && otherPro.pic2 != 'null' }"><img src="${otherPro.pic2 }" style="width:167px;height:127px;"></c:when>
			                        	<c:when test="${!empty otherPro.pic3  && otherPro.pic3 != 'null' }"><img src="${otherPro.pic3 }" style="width:167px;height:127px;"></c:when>
			                        	<c:otherwise><img src="${ctxStatic}/img/llhb/default.png" style="width:167px;height:127px;"></c:otherwise>
			                        </c:choose>
		                            <dl>
		                            	<dt class="tmui-ellipsis">${otherPro.pro_name }</dt>
		                                <dd></dd>
		                            </dl>
		                        </div>
		                    </c:forEach>
	                    </div>
                    </div>
                </div>
                </c:if>  
                     
                <!--其他供应商其他商品-->
                <c:if test="${fn:length(otherProBus) >0 }">        
                <div class="main_3">
                	<div class="main_3_tit">
                    	<a style="line-height:30px; width:178px;">其他供应商相关商品</a>
                        <hr style=" margin-top:0px; border:none; border-bottom:1px solid #5cb531;">
                        <ul class="flip">
	                        <c:choose>
	                        	<c:when test="${fn:length(otherProBus) >4 &&  fn:length(otherProBus) <=8}"><li class="cur_flip"></li><li></li></c:when>
	                        	<c:when test="${fn:length(otherProBus) >8 &&  fn:length(otherProBus) <=12}"><li class="cur_flip"></li><li></li><li></li></c:when>
	                        	<c:otherwise></c:otherwise>
							</c:choose>
                        </ul>
                    </div>
                    <div class="main_3_de">
                        <div class="scroll-div-3">
                        	<c:forEach items="${otherProBus }" var="otherProBus">
		                    	<div class="product_1"  id="${otherProBus.id }" onclick="go('${ctx}/mall/detail/${otherProBus.id}')">
		                        	<c:choose>
			                        	<c:when test="${!empty otherProBus.pic1  && otherProBus.pic1 != 'null' }"><img src="${otherProBus.pic1 }" style="width:167px;height:127px;"></c:when>
			                        	<c:when test="${!empty otherProBus.pic2  && otherProBus.pic2 != 'null' }"><img src="${otherProBus.pic2 }" style="width:167px;height:127px;"></c:when>
			                        	<c:when test="${!empty otherProBus.pic3  && otherProBus.pic3 != 'null' }"><img src="${otherProBus.pic3 }" style="width:167px;height:127px;"></c:when>
			                        	<c:otherwise><img src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
			                        </c:choose>
		                            <dl>
		                            	<dt class="tmui-ellipsis">${otherProBus.pro_name }</dt>
		                                <dd class="tmui-ellipsis">${otherProBus.address }</dd>
		                                <dd style="margin-top:16px;">
		                                <c:if test="${otherProBus.auth_flag lt '1' }"><img style="margin-top:-5px; margin-right:6px;height:17px;width:17px;float:left;" src="${ctxStatic}/img/llhb/mall_renzheng.png"><span style="float:left;">企业认证</span></c:if>
		                                </dd>
		                            </dl>
		                        </div>
		                    </c:forEach>
                        </div>
                    </div>
                </div>
                 </c:if>  
              
                
            </div>  
			
            <div class="c1_main" style="float:left; width:257px; margin-top:30px;margin-left:20px; height:1000px; overflow:hidden">
            	<dl class="c1_m_left">
                    <dt style="margin-top:0px;">
                        <span class="c1_m_left_hot font_3">热门商品</span>
                        <a href="javascript:go('${ctx}/solidsupply/supplyList');"class="font_1">更多&nbsp;+</a>
                    </dt>
                    <c:forEach items="${hs}" var="hs">
	                    <dd class="font_1" onclick="goOther(${hs.id})">
	                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">${hs.pro_name }</a>
	                        <span class="c1_m_l_time">${fn:substring(hs.create_date,5,10) }</span>
	                    </dd>
                    </c:forEach>
    			</dl>              
                <dl class="c1_m_left">
                    <dt style="margin-top:0px;">
                        <span class="c1_m_left_hot font_3">热门成交</span>
                        <a href="javascript:void(0);"class="font_1">更多&nbsp;+</a>
                    </dt>
                    <!-- <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd> -->
    			</dl>                
                <div class="c1_m_left">
                    <div style="margin-top:0px;height:25px;border-bottom: 1px solid #ccc;">
                        <span class="font_3" style="float:left;margin-top: -1px;height:25px;line-height: 25px;border-bottom: 3px solid #5EC520;position: relative;">推荐企业</span>
                        <a href="javascript:go('${ctx}/EntLib');"class="font_1" style="float:right;color: #EF7801;margin-top:3px;">更多&nbsp;+</a>
                    </div>
                
                    <div class="tj_box">
                    	<c:forEach items="${companyAdList}" var="company">
                    	<div class="tj_1">
                        	<div class="qy_1" <c:if test='${not empty company.redirctHref}'>onclick="window.open('${company.redirctHref}','_blank')"</c:if>>
                            	<img src="${company.picAddr}" style="width:117px;height:70px">
                                <p>&nbsp;</p>
                                <a>${company.showName}</a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                   
    			</div>
                
            </div>
        </div> 
        
    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
			<%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
			<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<!--底部 end-->
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<!-- 弹出层 -->
<div class="populayer pl_normal" >
    <div class="layer_top">
    	<span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>
    </div>
</div>
<!-- 弹出层上传图片 -->
<div class="populayer pl_commit_pic">
    <div class="layer_top">
        <span>上传图片</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <div class="select-commit">
            <label for=""><input type="radio" autocomplete="off" checked="checked" id="check1">本地图片</label>
            <label for="d"><input type="radio" autocomplete="off" id="check2">网络图片</label>
        </div>
        <div class="select-commit-content">
            <div class="home-pic tmui-ellipsis">
                <input type="file" name="files" id="files" value="">
            </div>
            <div class="net-pic">
                <input type="text" name="netid" id="netid"value="http://">
            </div>
        </div>
        <input type="hidden" id="hiddenId" value=""/>
        <input type="hidden" id="picId" value=""/>
        <div class="btns">
            <a href="javascript:void(0)" >上传</a>
            <a href="javascript:void(0)" >取消</a>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script>

//banner 样式切换
$(".header_nav ul li").eq(4).addClass("header_nav_sel");
//图片上传
//$(".evaluate_pic").hide();
var imgIndex = 0;
$(".evaluate_bottom a").click(function(){
	var imgLength = 5;//设置图片上传只有五张
	if(imgIndex < imgLength){
		 comPic(imgIndex);
	}
});
function comPic(str){
	$("#files").val("");
    $("#hiddenId").val(str);
    $(".pl_commit_pic").show();
    $(".popumask").show();
    $(".btns a:eq(0)").on("click",uplodePic);
}
function uplodePic(){
	
	$(".btns a:eq(0)").off("click",uplodePic);//只上传一次
	$(".pl_commit_pic").hide();
		var n =  $("#hiddenId").val();
		$(".pl_yesorno").hide();
		$(".popumask").hide();
   	if($("#check1").is(":checked")){
   		var url = $("#files").val();
   		var u = url.substring(url.length-4,url.length);
   		if( url== ""){ //验证
			showMess("请选择图片！");
		}else if(u != ".gif" && u != ".jpg" &&u != ".png" ){
			showMess("图片格式不正确！<br />只能上传gif、jpg、png格式的图片！");
		}else{
			debugger;
			$.ajaxFileUpload({
   				url : '${ctx}/fileUploadServer',
   				secureuri : false,
   				fileElementId : 'files',
   				dataType : 'text',
   				success : function(data, status) {
   					debugger;
   					if(status == 'success'){
      	               	var str = '<div class="evaluate_pic" data-delete="0">'
                       				+'<img src="'+data.replace(/<[^>]+>/g,"")+'" alt="" style="width:120px; height:120px">'
                      			 	+'<div class="delete_evaluate_pic">删除</div>'
                       			+'</div>';
      	           		$(".evaluate_pics").append(str);
      	             	imgIndex++; 
   					}
   				},
   				error : function(data, status, e) {
   					alert(e);
   				}
   			});
		}
   	}else{
   		var str = $("#netid").val();
   		if(str == "http://" || str == ""){ //验证
   			showMess("请选择图片！")
		}else{
			rightIframe.window.addPic(str,n);
		}
   	}
}
//图片删除
$(".evaluate_pics").on("click",".delete_evaluate_pic",function(){
	$(this).parent().remove();
	imgIndex--;
});
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
//自动载入标签数据
function praiseLabelLoad(){
	var j = 0;
	var proId = $("#proId").val();
	$.ajax({
		type:"post",
		url:"${ctx}/hbshop/praiseLabelCount",
		data:"proId="+proId,
		success:function(data){
			$.each(data,function(index,item){
				$(".impression ul li[data-value="+item.value+"]").find("span").html(item.count);
			});
			var labelLength = $(".impression ul li").length;
			for(var i=0; i<labelLength; i++){
				var num = $(".impression ul li").eq(i).find("span").html();
				if(num==null || num==""){
					$(".impression ul li").eq(i).find("span").html(0);
				}
			}
		}
	})
}
$(function(){
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
})
</script>

<!--我要评价-->
<script>
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
		isNiming = !isNiming;//是否匿名标志位
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
		var thisImg = $(this).find("img").attr("src");
		if(thisImg != null && thisImg != ""){
			$(".main_pic dt img").attr("src",$(this).find("img").attr("src"));
		}
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
//切换其他商品
	var product_1_2_h=$(".main_2_de .product_1").outerHeight(true);
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
		//asse_num1=$(".asse_tit li").index(this);
		$(".asse_tit li").removeClass("asse_cur_tit");
		$(this).addClass("asse_cur_tit");
		//$(".asse_con").hide();
	//	$(".asse_con:eq("+asse_num1+")").show();
	
		
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
	/****************获取登录名**********************/
	var loginName = $("#login_name").val();
	//收藏商品
	function collect(){
		if(loginName != null && loginName != ""){
			var collectId = $("#proId").val();
			$.ajax({
				type:"post",
				url:"${ctx}/hbshop/businessCollect",
				data:"type=4"+"&collectId="+collectId,
				success:function(data){
					if(data == true){
						showMess("收藏成功");
						setTimeout(function(){close();},3000);
					}else if(data == false){
						showMess("已收藏");
						setTimeout(function(){close();},3000);
					}else{
						showMess("收藏失败");
					}
				}
			})
		}else{
			showMess("请先登录");
		}
		
	}
	//回话
	function dialogue(){
		if(loginName != null && loginName != ""){
			go("${ctx}/home?str=/memSerevice/communication/goChat?id=${pro.user_id}")
		}else{
			showMess("请先登录");
		}
	}
	//发送邮件
	function sendEmail(){
		if(loginName != null && loginName != ""){
			go("${ctx}/home?str=/memSerevice/message?uid=${pro.user_id}")
		}else{
			showMess("请先登录");
		}
	}
	//好评，中评，差评
	var selectedValue = 0;
	$("#evaluate_pro .check_eva ul li").click(function(){
		selectedValue = $(this).parent().find(".check_1").attr("data-value");
	});
	//评价标签
	$("#praise_label").on("click","li",function(){
		var thisSelected = $(this).attr("data-selected");
		if(thisSelected == 0){
			$(this).css({"border-color":"#5cb531","color":"#5cb531"});
			$(this).attr("data-selected",1);
		}else{
			$(this).css({"border-color":"#ee7800","color":"#ee7800"});
			$(this).attr("data-selected",0);
		}
		
	});
	//匿名
	var isNiming = true;
	//评价商品
	function evaluatePro(){
		var proId = $("#proId").val();
		var niming = 1;//0:不匿名   1：匿名
		var text = $("#evaluate_pro textarea").val();
		var createBy = $("#createBy").val();//获取发布商id
		var allLi = $("#praise_label ul li").length;
		var labelValue = "";//已经选择的标签
		for(var i = 0; i<allLi; i++){
			var s = $('#praise_label ul li').eq(i).attr("data-selected");
			if(s==1){
                var v = $('#praise_label ul li').eq(i).attr("data-value");
                labelValue += v+",";
			}
		}
		var imgs = $(".evaluate_pics .evaluate_pic").length;
		var imgSrcs = "";//所有图片src
		for(var i=0; i<imgs; i++){
			var src = $(".evaluate_pics .evaluate_pic").eq(i).find("img").attr("src");
			if(src!=null && src!=""){
				imgSrcs += src+",";
			}
		}
		if(isNiming){
			niming = 1;
		}else{
			niming = 0;
		}
		if(loginName != null && loginName != "" && selectedValue!=0 && text.length >= 5 && text.length <= 500 ){
			$.ajax({
				type:"post",
				url:"${ctx}/hbshop/willPraise",
				data:"proId="+proId+"&createBy="+createBy+"&praNum="+selectedValue+"&labelText="+labelValue+"&praDesc="+text+"&isNiMing="+niming+"&imgSrcs="+imgSrcs,
				datatype:"text",
				success:function(data){
					if(data==false){
						showMess("您不能评价自己的商品！");
					}else if(data=="0"){
						showMess("请先登录");
					}else{
						$.each(data,function(index,item){
							var goodCount = item.goodCount;
							if(goodCount!=null&&goodCount!=""&&goodCount!="undefined"){
								goodCount=item.goodCount;
							}else{
								goodCount=0;
							}
							var mediumCount = item.mediumCount;
							if(mediumCount!=null&&mediumCount!=""&&mediumCount!="undefined"){
								mediumCount=item.mediumCount;
							}else{
								mediumCount=0;
							}
							var badCount = item.badCount;
							if(badCount!=null&&badCount!=""&&badCount!="undefined"){
								badCount=item.badCount;
							}else{
								badCount=0;
							}
							
							var count = goodCount + mediumCount + badCount;//评论总数
							$(".score_l span").html(Math.ceil(100*goodCount/count)+"%");//好评率
							var startCount = (goodCount*5 + mediumCount*3 + badCount)/count;
							if(startCount <= 1){
								$(".de_2 .zh_1 dd").html("<img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'>");
							}else if(startCount > 1 && startCount <=2){
								$(".de_2 .zh_1 dd").html("<img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'>");
							}else if(startCount > 2 && startCount <=3){
								$(".de_2 .zh_1 dd").html("<img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_2.png'><img src='${ctxStatic}/img/llhb/star_2.png'>");
							}else if(startCount > 3 && startCount <=4){
								$(".de_2 .zh_1 dd").html("<img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_2.png'>");
							}else if(startCount > 4 && startCount <=5){
								$(".de_2 .zh_1 dd").html("<img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'><img src='${ctxStatic}/img/llhb/star_1.png'>");
							}
							//好评率
							$(".de_2 .zh_2").eq(0).find("dd p").css({"width":Math.ceil(count!=0?100*goodCount/count:0)+"%"});
							$(".de_2 .zh_2").eq(0).find("dd").eq(1).html(Math.ceil(count!=0?100*goodCount/count:0)+"%");
							//中评率
							$(".de_2 .zh_2").eq(1).find("dd p").css({"width":Math.ceil(count!=0?100*mediumCount/count:0)+"%"});
							$(".de_2 .zh_2").eq(1).find("dd").eq(1).html(Math.ceil(count!=0?100*mediumCount/count:0)+"%");
							//差评率
							$(".de_2 .zh_2").eq(2).find("dd p").css({"width":Math.ceil(count!=0?100*badCount/count:0)+"%"});
							$(".de_2 .zh_2").eq(2).find("dd").eq(1).html(Math.ceil(count!=0?100*badCount/count:0)+"%");
							//好评数加载
							$(".de_2 .asse_tit li").eq(1).html("好评("+goodCount+")");
							//中评数加载
							$(".de_2 .asse_tit li").eq(2).html("中评("+mediumCount+")");
							//差评数加载
							$(".de_2 .asse_tit li").eq(3).html("差评("+badCount+")");
						});
						$(".de_2").show();
						$(".de_3").hide();
						$(".main_1 .main_1_tit li").removeClass("cur_tit");
						$(".main_1 .main_1_tit li").eq(1).addClass("cur_tit");
						praiseLabelLoad();//加载标签个数
						changePage(1);//加载累计评价列表 
					}
				}
			})
		}else if(loginName == null && loginName == ""){
			showMess("请先登录");
		}else if(selectedValue == 0){ 	
			showMess("请填选择评价：好评 或 中评 或 差评");
		}else if(text.length<5 || text.length>500){
			showMess("评论内容在5~500个字符之间");
		}
	}
	//上一页
	$(".prev_page").unbind().click(function(){
		var curPage = $(".filp a span").eq(1).html();//获取当前页码
		if(curPage!=1){
			curPage--;
			changePage(curPage);
			$(".filp a span").eq(1).html(curPage);
		}
	});
	//下一页
	$(".next_page").unbind().click(function(){
		var curPage = $(".filp a span").eq(1).html();//获取当前页码
		var totalPage =  $(".filp a span").eq(2).html();//获取总页数
		if(curPage!=totalPage){
			curPage++;
			changePage(curPage);
			$(".filp a span").eq(1).html(curPage);
		}
	}); 
	//跳转
	 $(".filp input:last").unbind().click(function(){
		var text = $(".filp :text:last").val();
		changePage(text);
		$(".filp a span").eq(1).html(text);
		
	});
	//翻页
	var praNum = "";//评价的类别，默认为全部评价
	function changePage(curPage){
		var proId = $("#proId").val();
		var str = "";
		var login_name = "";
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/allPraise",
			data:"proId="+proId+"&curPage="+curPage+"&praNum="+praNum,
			success:function(data){
				
				$.each(data,function(index,item){
					if(index < data.length-1){
						if(item.is_niming ==true){
							login_name = "匿名";
						}else{
							login_name = item.login_name;
						}
						str += "<div class='asse_row'>"
	                			+"<div class='person_row'>"
	                				+"<img src='${ctxStatic}/img/llhb/default.png'>"
	                				+"<a>"+login_name+"</a>"
	                			+"</div>"
	                			+"<dl>"
	                				+"<dt>"+item.pra_desc+"</dt>"
	                				+"<dd>"
	                				+item.imgs
									+"<span>"+item.create_date+"</span>"
									+"</dd>"
								+"</dl>"
						+"</div>"
					}else{
						$(".filp a span").eq(0).html(item.totalRow);
						$(".filp a span").eq(1).html(item.pageNumber);
						$(".filp a span").eq(2).html(item.totalPage);
					}
				});
				$("#allPraise").html(str);
			}
		})
	}
	//全部评价 好评：5   中评：3    差评：1   切换
	$(".de_2 .asse_tit li").click(function(){
		praNum = $(this).attr("data-value");
		changePage(1);
	});
	//清空我要评价样式
	function clearPraClass(){
		selectedValue=0;//置0 评价选择标识。
		var length = $(".de_3 .check_eva ul").length;
		for(var i=0; i<length; i++){
			$(".de_3 .check_eva ul").eq(i).find("li").eq(0).css({"background-image":"url(${ctxStatic}/img/llhb/check_2.png)"});
		}
		$(".de_3 .biaoqian ul li").css({"color":"#ee7800","border-color":"#ee7800"}); 
		$(".de_3 .evaluate_con textarea").val("");
		$(".de_3 .evaluate_pic").hide();
		var imgLength = $(".de_3 .evaluate_pic").length;
		for(var i=0; i<imgLength; i++){
			$(".de_3 .evaluate_pic img").attr("src","");//清空src
		}
		imgIndex=0;//清空上传图片数量记录
	}
	//热门供应跳转
	function goOther(id){
		window.open("${ctx}/mall/detail/"+id, "_blank");
	}
	//搜索
	function search(){
		var typeFirst = $(".header_search select option:selected").val();
		var proName = $(".header_search input").val();
		go("${ctx}/mall?typeFirst="+typeFirst+"&proName="+proName);
	}
	//回车键搜索
	$(".header_search .h_s_middle input").focus(function(){
		$(document).on("keydown",function(e){
			var typeFirst = $(".header_search select option:selected").val();
			var proName = $(".header_search input").val();
			go("${ctx}/mall?typeFirst="+typeFirst+"&proName="+proName);
		});
	});
	
	$(".header_search .h_s_middle input").blur(function(){
		$(document).unbind("keydown");
	}); 
	//弹出层 关闭
	$(".populayer .layer_top a").click(function(){
	   close(); 
	});
	function close(){
		$(".populayer").fadeOut();
	}
	
</script>
</body>
</html>