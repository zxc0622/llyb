<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>优蚁环保</title>
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
.header_right{margin-top:30px;}
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}
/*发布固废供求的弹窗*/
.tanchu_1{position:absolute; width:335px; height:380px; border:1px solid #5cb531;background-color:white; right:0; top:30px; z-index:10;}
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
.main_product .main_p{width:998px; border:1px solid #ccc; height:340px}
.main_p_left{width:690px; height:340px; overflow:hidden; float:left;}
.main_pic{float:left; width:270px; border-right:1px solid #ccc; height:340px;}
.main_pic dt{border-bottom:1px solid #ccc; width:270px; height:270px;}
.main_pic dt img{width:270px; height:270px;}
.main_pic dd{width:56px; height:56px; float:left; margin:6px 17px;}
.main_pic dd img{width:56px; height:56px;}
.main_des{float:left; margin-left:40px; margin-top:20px;} 
.main_des input{cursor:pointer; background-color:white;}
.main_des dl{width:220px;}
.main_des dl dt{font-size:18px; color:#333; font-weight:bolder;line-height:30px;margin-bottom:40px;}
.main_des dl dd{font-size:14px; color:#666; line-height:30px;}
.main_des dl dd span{margin-left:20px;}
.main_des input{width:102px; height:30px; line-height:30px; border:1px solid #ccc; text-align:center; margin-right:10px; margin-top:30px;}
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
.pro_info_icon .info_detail{position:relative;}
.pro_info_icon .info_1{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:0 0; padding:0 8px; cursor:pointer;}
.pro_info_icon .info_2{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:-22px 0; padding:0 8px;cursor:pointer;}
.pro_info_icon .info_3{background-image:url(${ctxStatic}/img/llhb/mall_02.png); background-repeat:no-repeat; background-position:-45px 0; padding:0 10px;cursor:pointer;}
.pro_info_icon .info_11{width: 50px;position:absolute; left:-13px;bottom:-22px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}
.pro_info_icon .info_12{width: 50px;position:absolute; left:-13px;bottom:-22px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}
.pro_info_icon .info_13{width: 50px;position:absolute; left:-13px;bottom:-22px; z-index:2;color:#5cb531; border:1px solid #5cb531; padding:1px 3px; line-height:14px; background-color:white;}

.browse{margin-top:4px;}
/*main_bottom*/
.main_bottom{overflow:hidden; width:1000px; margin-bottom:30px;}
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

.c1_main .c1_m_left{float:left;width:235px; border:1px solid #ccc; padding:10px; margin-bottom:20px;}

.tj_box{margin-top:20px;}
.tj_1{width:235px; margin-bottom:10px; overflow:hidden;}
.qy_1{width:115px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
.qy_1 img{width:100%;height:100%;}
.qy_1:hover p,.qy_1:hover a{display:block;}
.qy_1 p{width:115px; height:68px; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;filter:Alpha(Opacity=80);}
.qy_1 a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}
.product_1 img{display:block;width:167px;height:127px;}
</style>
</head>
<body>
<!--头部 start-->
 <header>
	<div class="line_top"></div>
	<div class="headerBox">
		<%@ include file="/WEB-INF/views/include/headertop.jsp"%>
		<!--头部中部 start-->
	    <div class="header_middle" style="height: 145px;">
	        <h1 class="header_logo">
	            <a href="${ctx }/index">
	                <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
	            </a>
	        </h1>
	        <div class="header_search">
	            <select >
	                <option value='1'>固废供应</option>
	                <option>固废供求</option>
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
	</div>
    <!--头部中部部 end-->
    <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
</header>

<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
    	<div class="main_row_1">
        	<div class="cur_position">
        		当前位置>优蚁网>固废供求>供应详情
        	</div>
            <div class="btn_1 font_1">
            	<a>发布求购信息&nbsp;&nbsp;<img src="${ctxStatic}/img/llhb/mall_icon1.png"></a>
                <div class="tanchu_1" style="display: block;">
                	<div class="fabu_top">
                    	<p>发布你的求购商品，坐等供应商响应</p>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>求购发布后</li>
                                <li>1小时内收到供应商的响应</li>
                            </ul>
                        </div>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>每个求购</li>
                                <li>平均有10个供应商参与</li>
                            </ul>
                        </div>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>所有求购</li>
                                <li>不向雇主和供应商收取任何佣金</li>
                            </ul>
                        </div>
                        <input type="button"  onclick="goPage('/home?str=/qiugou')"  value="立刻发布求购" style="background-color:#5cb531; color:white; width:140px; line-height:30px; border:none; margin-left:70px; margin-top:30px;cursor:pointer" >
                    </div>
                </div>
            </div>
            <div class="btn_1 font_1">
            	<a>发布供应信息&nbsp;&nbsp;<img src="${ctxStatic}/img/llhb/mall_icon1.png"></a>
                <div class="tanchu_1">
                	<div class="fabu_top">
                    	<p>发布你的供应商品，坐等求购商响应</p>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>供应发布后</li>
                                <li>1小时内收到求购商的响应</li>
                            </ul>
                        </div>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>每个供应</li>
                                <li>平均有10个求购商参与</li>
                            </ul>
                        </div>
                        <div class="fabu_1">
                        	<div class="fabu_1_p">
                            	&nbsp;
                            </div>
                            <ul class="fabu_1_c">
                            	<li>所有供应</li>
                                <li>不向雇主和采购商收取任何佣金</li>
                            </ul>
                        </div>
                        <input type="button" onclick="goPage('/home?str=/solidsupply/solidAdd')"  value="立刻发布供应" style="background-color:#5cb531; color:white; width:140px; line-height:30px; border:none; margin-left:70px; margin-top:30px;cursor:pointer" >
                    </div>
                </div>
            </div>
        </div>   
        <!--商品图+商品规格+供应商信息start-->
       <div class="main_product">
        	 <div class="main_p">
            	<div class="main_p_left">
                	<dl class="main_pic">
                    	<dt>
                        	<c:choose>
	                        	<c:when test="${!empty d.pic1  && d.pic1 != 'null' }"><img src="${d.pic1 }"></c:when>
	                        	<c:when test="${!empty d.pic2  && d.pic2 != 'null' }"><img src="${d.pic2 }"></c:when>
	                        	<c:when test="${!empty d.pic3  && d.pic3 != 'null' }"><img src="${d.pic3 }"></c:when>
	                        	<c:otherwise><img src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
	                        </c:choose>
                        </dt>
                        <c:choose>
                        	<c:when test="${!empty d.pic1  && d.pic1 != 'null' }"><dd><img src="${d.pic1 }"></dd></c:when>
	                        <c:otherwise><dd><img src="${ctxStatic}/img/llhb/default.png"></dd></c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${!empty d.pic2  && d.pic2 != 'null' }"><dd><img src="${d.pic2 }"></dd></c:when>
	                        <c:otherwise><dd><img src="${ctxStatic}/img/llhb/default.png"></dd></c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${!empty d.pic3  && d.pic3 != 'null' }"><dd><img src="${d.pic3 }"></dd></c:when>
	                        <c:otherwise><dd><img src="${ctxStatic}/img/llhb/default.png"></dd></c:otherwise>
                        </c:choose>
                    </dl>
                   
                    <div class="main_des">
                    	<dl>
                        	<dt>${d.title }</dt>
                            <c:choose>
	                            <c:when test="${!empty d.lprice&&!empty d.hprice}">
	                            	<dd>价&nbsp;&nbsp;&nbsp;格<span>${d.lprice }~${d.hprice }元/${d.label }</span></dd>
	                            </c:when>
	                            <c:when test="${!empty d.lprice&&empty d.hprice }">
	                            	<dd>价&nbsp;&nbsp;&nbsp;格<span>${d.lprice }元/${d.label }</span></dd>
	                            </c:when>
	                            <c:when test="${!empty d.hprice&&empty d.lprice }">
	                            	<dd>价&nbsp;&nbsp;&nbsp;格<span>${d.hprice }元/${d.label }</span></dd>
	                            </c:when>
	                            <c:otherwise>
	                             	<dd>价&nbsp;&nbsp;&nbsp;格<span>面议</span></dd> 
	                             </c:otherwise>
                            </c:choose>
                            <dd>供应量<span>${d.amount }${d.label }</span></dd>
                            <dd>所在地<span>${d.pname }&nbsp;${d.cname }</span></dd>
                            <c:choose>
                            	<c:when test="${fn:substring(d.past,0,10) eq '9999-12-31' }">
                            		<dd>有效期<span>长期有效</span></dd>
                            	</c:when>
           		                <c:otherwise><dd>有效期<span>${fn:substring(d.past,0,10)}</span></dd></c:otherwise>
                            </c:choose>
                        </dl>
                        <input class="font_1" type="button" value="我要询价" onclick="goChat(${d.userId})">
                        <input class="font_1" type="button" value="收藏该商品" onclick="collect(${d.id})">
                    </div>
                </div>
                <!--供应商信息-->
                <div class="pro_info">
                	<div class="pro_info_tit" style="position:relative;">
                    	<a>供应商信息</a>
						<c:if test="${d.telAuth == '1' }"><a class="h6_1 h6_detail" href="javascript:void(0)">&nbsp;<h6 class="font_1">手机号认证</h6></a></c:if>
                    	<c:if test="${!empty d.cx}"><a class="h6_2 h6_detail" href="javascript:void(0)">&nbsp;<h6 class="font_1">诚信档案</h6></a></c:if>
                    </div>
                    <ul class="font_1">
                    	<li>公司名<span>${d.yname }</span></li>
                        <li class="h6_3" style="position:relative;">联系人<span>${d.realName }
                        	<c:choose>
				             	<c:when test="${d.sex == 'F' }">（女士）</c:when>
				             	<c:when test="${d.sex == 'M' }">（先生）</c:when>
				             	<c:otherwise></c:otherwise>
			             	</c:choose>
                        </span><a onclick="goChat(${d.userId})">&nbsp;</a>
                        	<h6>点击交谈/留言</h6>
                        </li>
                        <li class="pro_info_icon" style="position:relative;">会&nbsp;&nbsp;&nbsp;员<c:if test="${status == 1 }"><span class="info_1 info_detail" >&nbsp;<h6 class="info_11">当前在线</h6></span></c:if><span class="info_3 info_detail" onclick="goMess('${d.userId}')">&nbsp;<h6 class="info_13">发送邮件</h6></span>
                        </li>
                        <li>电&nbsp;&nbsp;&nbsp;话<span>${d.phone1}</span></li>
                        <li>手&nbsp;&nbsp;&nbsp;机<span>${d.phone2 }</span></li>
                        <li>地&nbsp;&nbsp;&nbsp;区<span>${d.pname }-${d.cname }</span></li>
                        <li>地&nbsp;&nbsp;&nbsp;址<span>${d.address }</span></li>
                    </ul>
                </div>   
            </div> 
            <!--浏览次数-->
            <div class="browse font_1" style="color:#999;">
            	<img src="${ctxStatic}/img/llhb/mall_04.png">
                浏览次数(<span>${d.pview }</span>人气)
            </div>
        </div>
        
        <div class="main_bottom">
        	<!--商品详情、累计评价、我要评价-->
        	<div class="main_b_l">
            	<div class="main_1">
                	<ul class="main_1_tit">
                    	<li class="cur_tit">商品详情</li>
                 	</ul>
                    <!--商品详情-->
                    <div class="main_1_de">
                    	<div class="de_1">
                        	${d.details }
                        </div>
                    </div>
                    <!--商品详情end-->                  
                </div>
                <!--供应商其他商品-->
                <c:if test="${fn:length(o) >0 }">
                <div class="main_2">
                	<div class="main_2_tit">
                    	<a style="line-height:30px;">供应商其他商品</a>
                        <hr style=" margin-top:0px; border:none; border-bottom:1px solid #5cb531;">
                        <ul class="flip">
                        <c:choose>
                        	<c:when test="${fn:length(o) >4 &&  fn:length(o) <=8}"><li class="cur_flip"></li><li></li></c:when>
                        	<c:when test="${fn:length(o) >8 &&  fn:length(o) <=12}"><li class="cur_flip"></li><li></li><li></li></c:when>
                        	<c:otherwise></c:otherwise>
						</c:choose>
                        </ul>
                    </div>
                    <div class="main_2_de">
	                    <div class="scroll-div-2">
	                    	<c:forEach items="${o }" var="o">
		                    	<div class="product_1"  id="${o.id }" onclick="goOther(${o.id })"> 
		                        	<c:choose>
			                        	<c:when test="${!empty o.pic1  && o.pic1 != 'null' }"><img src="${o.pic1 }"></c:when>
			                        	<c:when test="${!empty o.pic2  && o.pic2 != 'null' }"><img src="${o.pic2 }"></c:when>
			                        	<c:when test="${!empty o.pic3  && o.pic3 != 'null' }"><img src="${o.pic3 }"></c:when>
			                        	<c:otherwise><img src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
			                        </c:choose>
		                            <dl>
		                            	<dt class="tmui-ellipsis">${o.title }</dt>
		                                <dd></dd>
		                            </dl>
		                        </div>
		                    </c:forEach>
	                    </div>
                    </div>
                </div>
                </c:if>  
                     
                <!--其他供应商其他商品-->
                <c:if test="${fn:length(co) >0 }">        
                <div class="main_3">
                	<div class="main_3_tit">
                    	<a style="line-height:30px; width:178px;">其他供应商相关商品</a>
                        <hr style=" margin-top:0px; border:none; border-bottom:1px solid #5cb531;">
                        <ul class="flip">
	                        <c:choose>
	                        	<c:when test="${fn:length(co) >4 &&  fn:length(co) <=8}"><li class="cur_flip"></li><li></li></c:when>
	                        	<c:when test="${fn:length(co) >8 &&  fn:length(co) <=12}"><li class="cur_flip"></li><li></li><li></li></c:when>
	                        	<c:otherwise></c:otherwise>
							</c:choose>
                        </ul>
                    </div>
                    <div class="main_3_de">
                        <div class="scroll-div-3">
                        	<c:forEach items="${co }" var="co">
		                    	<div class="product_1"  id="${co.id }" onclick="goOther(${co.id })"> 
		                        	<c:choose>
			                        	<c:when test="${!empty co.pic1  && co.pic1 != 'null' }"><img src="${co.pic1 }"></c:when>
			                        	<c:when test="${!empty co.pic2  && co.pic2 != 'null' }"><img src="${co.pic2 }"></c:when>
			                        	<c:when test="${!empty co.pic3  && co.pic3 != 'null' }"><img src="${co.pic3 }"></c:when>
			                        	<c:otherwise><img src="${ctxStatic}/img/llhb/default.png"></c:otherwise>
			                        </c:choose>
		                            <dl>
		                            	<dt class="tmui-ellipsis">${co.title }</dt>
		                                <dd class="tmui-ellipsis">${co.cname }</dd>
		                                <dd style="margin-top:16px;">
		                                <c:if test="${co.authFlag lt '1' }"><img style="margin-top:-5px; margin-right:6px;height:17px;width:17px;float:left;" src="${ctxStatic}/img/llhb/mall_renzheng.png"><span style="float:left;">企业认证</span></c:if>
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
                        <span class="c1_m_left_hot font_3">热门供应</span>
                        <a href="${ctx}/solidsupply/supplyList"class="font_1">更多&nbsp;+</a>
                    </dt>
                    <c:forEach items="${hs }" var="hs">
	                    <dd class="font_1" onclick="goOther(${hs.id})">
	                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">${hs.title }</a>
	                        <span class="c1_m_l_time">${fn:substring(hs.time,5,10) }</span>
	                    </dd>
                    </c:forEach>
            	</dl>     
                <dl class="c1_m_left" style="display:none;">
                    <dt style="margin-top:0px;">
                        <span class="c1_m_left_hot font_3">热门成交</span>
                        <a href="javascript:void(0);"class="font_1">更多&nbsp;+</a>
                    </dt>
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
                    </dd>
                    <dd class="font_1">
                        <a href="javascript:void(0)" class="c1_m_l_news tmui-ellipsis">成交成交成交成交成交成交</a>
                        <span class="c1_m_l_time">1小时前</span>
                    </dd>
    			</dl>        
                <div class="c1_m_left">
                    <div style="margin-top:0px;height:25px;border-bottom: 1px solid #ccc;">
                        <span class="font_3" style="float:left;margin-top: -1px;height:25px;line-height: 25px;border-bottom: 3px solid #5EC520;position: relative;">推荐企业</span>
                        <a href="javascript:void(0);"class="font_1" style="float:right;color: #EF7801;margin-top:3px;">更多&nbsp;+</a>
                    </div>
                    <div class="tj_box">
                   		<c:forEach items="${ads }" var="ads">
							<div class="qy_1"><img src="${ads.addr }"/></div>
						</c:forEach>
                    </div>
    			</div> 
            </div> 
        </div> 
    </div>
</div>
<!--中间部分end-->
<!--底部 start-->
<!--底部 start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
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
<!--我要评价-->
<script>
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
	});
</script>
<!--图标提示-->
<script>
	$("h6").hide();
	$(".h6_detail").mouseover(function(){
		$(this).find("h6").show();
	});
	$(".h6_3 a").mouseover(function(){
		$(".h6_3 h6").show();
	});
	$(".h6_detail,.h6_3").mouseout(function(){
		$("h6").hide();
	});
	$(".pro_info_icon span").mouseover(function(){
		var h6_num1=$(".pro_info_icon span").index(this);
		$(".pro_info_icon h6:eq("+h6_num1+")").show();
	});
	$(".pro_info_icon span").mouseout(function(){
		$("h6").hide();
	});
//<!--发布固废供求消息弹窗-->
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
	});
	//商品图片大小切换
	$(".main_pic dd").mouseover(function(){
		$(".main_pic dt img:eq(0)").attr("src",$(this).find("img").attr("src"));
	});

	//切换其他商品
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
	$(document).ready(function(){
		$(".header_nav ul li").eq(2).addClass("header_nav_sel");
		$('.header_search input').bind('keypress',function(event){
            if(event.keyCode == "13")  {
            	sou();
            }
        });
		$(".close_btn").on("click",function(){
			hideMess();
		});
	});
	function goOther(id){
		window.open("${ctx}/solidsupply/getMess/"+id, "_blank");
	}
	function goChat(id){
		window.open("${ctx}/home?str=/memSerevice/communication/goChat?id="+id, "_blank");
	}
	function goPage(str){
		location.href='${ctx}'+str;
	}
	function collect(id){
		$.ajax({
			type:"POST",
			url:"${ctx}/solidsupply/collect",
			data: "collectId="+id,
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
    }
	 function hideMess(){
   		$(".popumask").fadeOut();
		$(".pl_normal .pl_content p").html("");
       	$(".pl_normal").hide();
	 }
    function sou(){
		var s = $(".header_search select").val();
        alert(s);
		var title=$(".header_search input").val();
		if(s == '1'){
    		location.href='${ctx}/solidsupply/supplyList?title='+title;
    	}else{
    		location.href='${ctx}/qiugou/searchList?searchtext='+title;
    	}
    }
    //登录
    function gologin(){
    	location.href="${ctx}/login";
    }
    //站内信件
    function goMess(id){
    	window.open("${ctx}/home?str=/memSerevice/message?uid="+id,"_blank");
    }
    
</script>

</body>
</html>