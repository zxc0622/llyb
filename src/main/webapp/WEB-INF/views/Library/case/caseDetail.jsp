<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="" />
<title>${cs.case_name}</title>
<meta name="keywords"
	content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description"
	content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/qiye_style.css" />
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/manhuaDate.1.0.css" />
<style>



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
.main_product{overflow:hidden; width:700px;margin-bottom:20px;}
.main_product .main_p{width:698px; border:1px solid #ccc; height:340px}
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

.de_1{width:670px; margin:auto; min-height:100px;}
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


.qy_m_r_d_main .point-list li a {
	width: 500px;
}

.qy_m_r_d_main {
	height: auto;
}

.dis_none {
	display: none;
}

#pastTame {
	
}
/*隐藏页数修改功能*/
.hbshop_disnone {
	display: none;
}

.b_l_f_province {
	color: black;
}

#pastTame,.qy_m_r_d_title span{
	color: black;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
	 <input id="login_name" type="hidden" value="<shiro:principal property="name"/>">
	<!-- qy_m_r 中间右侧 -->
	<div class="qy_m_r">
		<div class="qy_m_r_div">
			<div class="qy_m_r_d_title">
				<span>成功案例</span>
			</div>
			<div class="qy_m_r_d_main">
				<div class="main_product">
        	<div class="main_p">
        		<input id="proId" type="hidden" value="${cs.id}" />
        		<input id="createBy" type="hidden" value="${cs.create_by}"/>
            	<div class="main_p_left">
                	<dl class="main_pic">
                    	<dt>
                    	<c:choose>
                    		<c:when test="${not empty cs.pic1 }">
                        	<img src="${cs.pic1}">
                        	</c:when>
                        	<c:when test="${not empty cs.pic2 }">
                        	<img src="${cs.pic2}">
                        	</c:when>
                        	<c:otherwise>
                        	<img src="${cs.pic3}">
                        	</c:otherwise>
                        </c:choose>
                        </dt>
                        <c:choose>
                        <c:when test="${not empty cs.pic1}">
                        <dd><img src="${cs.pic1}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${not empty cs.pic2}">
                        <dd><img src="${cs.pic2}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                        <c:choose>
                        <c:when test="${not empty cs.pic3}">
                        <dd><img src="${cs.pic3}"></dd>
                        </c:when>
                        <c:otherwise>
                         <dd><img src="${ctxStatic}/img/llhb/default.png"></dd>
                        </c:otherwise>
                        </c:choose>
                    </dl>
                   
                    <div class="main_des" style="border:0px solid red;min-height: 90%;">
                    	<dl>
                        	<dt>${cs.case_name}</dt>
                            <dd>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格<span>${cs.price}</span></dd>
                            <dd>工程时长<span>${cs.time_length}</span></dd>
                            <dd>所&nbsp;&nbsp;在&nbsp;&nbsp;地<span>${area}</span></dd>
                        </dl>
                        <input class="font_1" type="button" value="咨询客服" onclick="window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&amp;aty=0&amp;a=0&amp;curl=&amp;ty=1&amp;q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">
                        <input class="font_1" type="button" value="收藏该案例" onclick="collect()">
                        
                    </div>
                </div>
            </div>
            <!--浏览次数-->
            <div class="browse font_1" style="color:#999;">
            	<img src="${ctxStatic}/img/llhb/mall_04.png"/>
                浏览次数(<span>${cs.page_view}</span>人气)
            </div>
            <div class="browse" style="overflow:auto;color:#999;">
                <span>${cs.case_desc}</span>
            </div>
        </div>       
				
			</div>
		</div>
	</div>
	<!-- qy_m_r 中间右侧结束 -->
	<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">

	


	
	</script>

	

	<!--发布固废供求消息弹窗-->
	<script>
	$(".case").parent().addClass("header_nav_sel").siblings()
	.removeClass("header_nav_sel");
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
					url:"${ctx}/Library/case/collectCase",
					data:"type=5"+"&collectId="+collectId,
					success:function(data){
						if(data == true){
							alert("收藏成功");
							setTimeout(function(){close();},3000);
						}else if(data == false){
							alert("已收藏");
							setTimeout(function(){close();},3000);
						}else{
							alert("收藏失败");
						}
					}
				})
			}else{
				showMess("请先登录");
			}
			
		}
		function close(){
			$(".populayer").fadeOut();
		}
	</script>
</body>
</html>


