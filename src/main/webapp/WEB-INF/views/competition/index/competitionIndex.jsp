<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/jingjialiebiao.css"/>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
header{border-bottom: none;}

/*内容start*/

/*当前位置*/
.main_row_1{overflow:hidden; }
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:120px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:12px; margin-right:56px; text-align:center;}
.main_row_1 .btn_1 a{width:100%; height:100%; display:block; color:#FFF;  }

/*主要内容*/
.acution{margin:0px auto;  width:1000px;overflow:hidden;}
.a_t_font1{color:#FFF; font-size:16px;}
	
	/*头部左侧*/
.a_top{overflow:hidden; width:1000px; height:482px; margin-top:15px;}
.a_top_left{width:195px; height:480px;border:1px solid #5cb531; float:left;}
.a_t_l_top{ width:100%; height:228px; border-bottom:1px solid #5cb531}
.a_t_l_top .a_t_l_top_up{background-color:#5cb531; width:100%;height:28px;}
.a_t_l_top .a_t_l_top_up img{display:block; margin-left:12px; margin-top:6px; display:block; float:left;}
.a_t_l_top .a_t_l_top_up span{display;block; margin-left:10px; line-height:28px; display:block; float:left;}	
.a_t_l_top .a_t_l_top_down table{width:100%; }
.a_t_l_top .a_t_l_top_down td{ font-size:12px; display:block; border:1px solid #e5e5e5;margin-top:14px; margin-left:10px; width:80px; height:22px; float:left;text-align: center;line-height: 22px;}
.a_t_l_top .a_t_l_top_down td a{width:100%; height:100%; display:block;}
.a_t_l_top .a_t_l_top_down td a:hover{color:#5cb531;}
.a_t_l_top .a_t_l_top_down td .jp-class-hot{color:#ee7800;}
.a_t_l_top .a_t_l_top_down td .jp-class-hot:hover{color:#ee7800;}

.a_t_l_bottom .a_t_l_bottom_up{background-color:#5cb531; width:100%;height:28px;}
.a_t_l_bottom .a_t_l_bottom_up img{display:block; margin-left:12px; margin-top:6px; display:block; float:left;}
.a_t_l_bottom .a_t_l_bottom_up span{display;block; margin-left:10px; line-height:28px; display:block; float:left;}
.a_t_l_bottom .a_t_l_bottom_down{margin-top:8px; margin-bottom:-2px;}
.a_t_l_bottom .a_t_l_bottom_down td{font-size:12px; line-wight:20px; display:block; text-align:center; width:47px; float:left; line-height:30px;}
.a_t_l_bottom .a_t_l_bottom_down td:hover a{background-color: #5cb531;color:#fff;}
.a_t_l_bottom .a_t_l_bottom_down .jp-suozaidi-hot{color:#ee7800;}
.a_t_l_bottom .a_t_l_bottom_down td:hover .jp-suozaidi-hot{background-color: #ee7800;color:#fff;}
	/*头部中部*/
.a_top_modle{width:530px; height:480px; float:left; margin-left:8px; margin-right:8px;position: relative;}

/*头部banner图片 start*/
.a_top_modle .fade_list {width:100%;height:100%;position:relative;}
.a_top_modle .fade_list li{position: absolute;z-index:0;left:0;top:0;width:100%;height:100%;padding-top:0px;}
.a_top_modle .fade_list li a{display: block;width: 100%;height: 100%; margin: 0 auto;}
.a_top_modle .fade_list li a img{width:100%;height:100%;}
.a_top_modle .fade_btn {position: absolute;bottom: 10px;z-index:0;width: 96%; text-align: right; border: 0px solid red;}
.a_top_modle .fade_btn a {display: inline-block;height: 13px;width: 13px;background:#CCCCCC;opacity: 0.5; border-radius: 50%;margin: 3px;z-index: 3;}
.a_top_modle .fade_btn .h_b_btn_sel{background: #FFFFFF;opacity: 0.8;}
/*头部banner图片 end*/
	
	/*头部右侧*/
.a_top_right{width:255px; float:left; }

.a_top_right .a_t_dynamic{border-bottom:1px solid #e5e5e5; border:1px solid #e5e5e5}
.a_t_dynamic .a_t_d_f{width:100%; height:28px; border-bottom:1px solid #e5e5e5}
.a_t_dynamic .a_t_d_font{background-color:#5cb531; width:100px; height:28px; text-align:center; line-height:28px; float:left; overflow:hidden;}
.a_t_dynamic .a_t_d_data{font-size:12px; color:#5cb531; float:right; margin-top:7px;}
.a_t_dynamic .a_t_d_data span{margin-right:5px;}
.a_t_dynamic .a_t_d_content{width:250px; }
.a_t_dynamic .a_t_d_content dt{font-size:12px; background-repeat:no-repeat; margin:10px 0px 4px 10px; background-position:3px 8px; }

.a_t_dynamic .a_t_d_content dd{font-size:12px; color:#bbb; padding-left:159px; border-bottom:1px dashed #ccc;}
.a_t_dynamic .a_t_d_content dd:nth-of-type(4){border-bottom:0px;}
.a_t_dynamic .a_t_d_content dd span{line-height:16px; margin-right:5px;}
.a_t_dynamic .a_t_d_content dt a:hover{color:#5cb531;}
.a_t_dynamic .a_t_d_content dt a{overflow: hidden;white-space: nowrap;text-overflow: ellipsis;display: block;}
.a_t_dynamic .a_t_d_content dt a::before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 9px;margin-right: 5px;}
.a_t_dynamic .a_t_d_content dt a:hover::before{background-color:#5cb531;}

.a_top_right .a_t_customer{width:100%; margin-top:6px; border:1px solid #e5e5e5;}
.a_top_right .a_t_customer span{width:100%; font-size:20px; color:#5cb531; font-family:黑体; margin:12px 0px 12px 10px; display:block; overflow:hidden;}

.a_top_right .a_t_question {weight:100%; margin-top:6px; border:1px solid #e5e5e5;}
.a_t_question .a_t_q_top{width:100%; height:28px; border-bottom:1px solid #e5e5e5;}
.a_t_question .a_t_q_f{background-color:#5cb531; width:100px; height:28px; text-align:center; line-height:28px; float:left; }
.a_t_question .a_t_q_more{margin:6px 10px ; float:right;}
.a_t_question .a_t_q_more a{font-size:12px; color:#ee7800;}
.a_t_question .a_t_q_main{width:100%; overflow:hidden;}
.a_t_question .a_t_q_m_left{wight:50%; float:left;}
.a_t_question .a_t_q_main ul li{font-size:12px; }

.a_t_q_main ul{display:block; margin-left:3px;}
.a_t_q_main li{display:block; margin:3px 4px 4px 10px;}
.a_t_q_main li a::before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 9px;margin-right: 5px;}
.a_t_q_main li a:hover{color:#5cb531;}
.a_t_q_main li a:hover::before{background-color:#5cb531;}
.a_t_q_main li .changjian-q-hot{color:#ee7800;}
.a_t_q_main li .changjian-q-hot:before{background-color:#ee7800;}
.a_t_q_main li .changjian-q-hot:hover{color:#fff;background-color: #ee7800;}
.a_t_q_main li .changjian-q-hot:hover:before{background-color: #ee7800;}
	/*竞拍流程*/

.a_process{width:996px; height:74px; margin-top:17px; border:1px solid #e5e5e5; overflow:hidden;}
.a_process .a_p_word{background-color:#5cb531; width:50px; padding:15px 20px 15px 35px; float:left;}
.a_p_word span{font-size:20px; color:#FFF; }
.a_process .a_p_step{width:130px; height:83px; float:left; overflow:hidden; padding-left:15px;}
.a_process dl{width:100%; height:100%; padding-top:15px;}
.a_process dl dd{float:left;}
.a_process dl dd span{display:block;}
.a_process dl dd{margin-left:5px;}
.a_process .a_p_step_font1{font-size:12px; }

.a_process .a_p_sig{width:30px; height:83px; float:left; background:url("${ctxStatic}/img/llhb/gf_tb.png") 0px 32px no-repeat;}

.a_process .a_p_first{margin-left:20px; }
.a_process .a_p_first dt{width:47px; height:47px; background:url("${ctxStatic}/img/llhb/gf_jp.png") -2px -7px no-repeat; float:left;}
.a_process .a_p_first a:hover dt{background:url("${ctxStatic}/img/llhb/gf_jp.png") -2px -67px no-repeat;}
.a_process .a_p_first a:hover dd{ color:#5cb531;}
.a_process .a_p_second dt{width:47px; height:47px; background:url("${ctxStatic}/img/llhb/gf_jp.png") -61px -7px  no-repeat; float:left;}
.a_process .a_p_second a:hover dt{background:url("${ctxStatic}/img/llhb/gf_jp.png") -61px -67px no-repeat;}
.a_process .a_p_second a:hover dd{ color:#5cb531;}
.a_process .a_p_third dt{width:47px; height:47px; background:url("${ctxStatic}/img/llhb/gf_jp.png") -120px -7px  no-repeat; float:left;}
.a_process .a_p_third a:hover dt{background:url("${ctxStatic}/img/llhb/gf_jp.png") -120px -67px no-repeat;}
.a_process .a_p_third a:hover dd{ color:#5cb531;}
.a_process .a_p_forth dt{width:47px; height:47px; background:url("${ctxStatic}/img/llhb/gf_jp.png") -180px -7px  no-repeat; float:left;}
.a_process .a_p_forth a:hover dt{background:url("${ctxStatic}/img/llhb/gf_jp.png") -180px -67px no-repeat;}
.a_process .a_p_forth a:hover dd{ color:#5cb531;}
.a_process .a_p_fifth dt{width:47px; height:47px; background:url("${ctxStatic}/img/llhb/gf_jp.png") -239px -7px  no-repeat; float:left;}
.a_process .a_p_fifth a:hover dt{background:url("${ctxStatic}/img/llhb/gf_jp.png") -239px -67px no-repeat;}
.a_process .a_p_fifth a:hover dd{ color:#5cb531;}

/*激烈竞价中*/
.a_ing{width:1000px; height:862px;}
.a_ing_left{overflow:hiddeng; margin-top:17px; float:left;}
.a_ing_left .c1_m_right{float:left;width:740px;}
.a_ing_left .c1_m_title{height:30px;width:100%;border-bottom: 1px solid #5EC520;overflow: hidden;}
.c1_m_title .c1_m_t_left{float:left;width:106px;height:30px;line-height: 30px;color:#fff;background-color: #5EC520;text-align: center;}
.c1_m_r_list {overflow: hidden;margin-top: 14px;}
.a_ing .c1_m_r_list ul li{float:left;cursor:pointer;width:230px;height:250px;margin-right: 20px;margin-bottom: 20px;position: relative;border:1px solid #A8A8A8;}
.c1_m_r_list ul li:hover{border:1px solid #5EC520;}
.a_ing ul li:nth-of-type(3n){margin-right: 0;}
.ie8 .a_ing .c1_m_r_list ul li{margin-right:14px;}
.c1_m_r_list ul li > *{width:100%;text-indent: 10px;}
.c1_m_r_list ul li .c1_m_r_img{height:125px;text-indent: 0;}
.c1_m_r_list ul li .c1_m_r_img img{display:block;height:100%;width:100%;}
.c1_m_r_list ul li .c1_m_r_top{height:20px;background-color: #E8E8E8;color:#000;}
.c1_m_r_list ul li>p{color:#A8A8A8;margin-top: 3px;}
.c1_m_r_list ul li>p:nth-of-type(1) span{font-weight: bold;color:#EF7801;}
.c1_m_r_list ul li>p:nth-of-type(3) span{color:#000;}
.c1_m_r_list ul li .c1_m_r_bottom{margin-top: 5px;border-top: 1px solid #E8E8E8;overflow: hidden;}
.c1_m_r_list ul li .c1_m_r_bottom p{float:left;width:48%;height:27px;line-height: 27px;}
.c1_m_r_list ul li .c1_m_r_bottom p span:nth-child(2){color:#A8A8A8;}
.c1_m_r_list ul li .c1_m_r_bottom p:first-child{border-right: 1px solid #E8E8E8;}
.a_ing_left .c1_m_r_list ul li .c1_m_r_now{position: absolute;width:61px;height:23px;background:url(${ctxStatic}/img/llhb/icon.png) -129px -173px no-repeat;color:#fff;top:188px;right:-6px;z-index: 5;}

.c1_m_title .c1_m_t_l_count{width:55px; height:20px; background-color:#ee7800; float:right; font-size:12px; color:#FFF; text-align:center; border-radius:10px; margin-top:7px;}
.c1_m_title p{font-size:12px; color:#ee7800; display:block; float:right; margin-top:7px; margin-left:5px;}




/*推荐企业*/
.a_ing_right{width:239px; overflow:hidden; margin-top:17px; margin-left:18px;float:left; border:1px solid #ccc;}
.a_ing_r_title{border-bottom:1px solid #ccc; height:40px;}
.a_ing_r_title span{display:inline-block; position:relative; border-bottom:3px solid #5cb531; z-index:10; line-height:28px; top:11px; left:18px;}
.tj_box{margin-top:20px;}
/*.tj_box>div:nth-of-type(9){border-bottom:0px;margin-bottom: 0;}*/
.qy_1{width:119px; height:68px;  position:relative;float:left;cursor: pointer; margin-top:10px; border-top:1px solid #ccc;border-bottom:1px solid #ccc; border-left:1px solid #ccc; margin-left:-1px;}
.qy_1 img{width:100%;height:100%;}
.qy_1 p{width:100%; height:100%; background-color:#000; position:absolute; left:0;top:0; opacity:0.8; display:none;}
.qy_1 a{width:80px;text-align:center; display:block;  font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}
.qy_1:hover p{display:block;}
.qy_1:hover a{display:block;}

/*竞拍预告*/
.a_trailer{overflow:hidden;width:100%; margin-bottom:125px;}
.a_trailer .a_t_title{height:30px;width:100%;border-bottom: 1px solid #5EC520;overflow: hidden;}
.a_t_title .a_t_t_left{float:left;width:90px;height:30px;line-height: 30px;color:#fff;background-color: #5EC520;text-align: center;}
.a_t_title .c1_m_t_l_count{width:55px; height:20px; background-color:#ee7800; float:right; font-size:12px; color:#FFF; text-align:center; border-radius:10px; margin-top:7px;}
.a_t_title p{font-size:12px; color:#ee7800; display:block; float:right; margin-top:7px; margin-left:5px;}
.a_trailer .c1_m_r_list ul li{float:left;cursor:pointer;width:230px;height:250px;margin-right: 21px;margin-bottom: 20px;position: relative;border:1px solid #A8A8A8;}
.a_trailer  ul li:nth-of-type(4n){margin-right: 0;}
.a_trailer .c1_m_r_list ul li .c1_m_r_now{position: absolute;width:61px;height:23px;background:url(${ctxStatic}/img/llhb/icon.png) -257px -174px no-repeat;color:#fff;top:188px;right:-6px;z-index: 5;} 

.ie8 .a_trailer .c1_m_r_list ul li{margin-right:18px;}

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

<body >

<!--头部 start-->
<header >
	
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
       <input id="login_name" type="hidden" value="<shiro:principal property="name"/>">
        <!--头部上部 end-->

        <!--头部中部 start-->
        <%@ include file="/WEB-INF/views/include/comp_header_middle.jsp"%>
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
        		当前位置>优蚁网>固废竞价
        	</div>
			<div class="btn_1 ">
				<a href="javascript:issue();" style="margin-right: 0;background-color: #ee7800;">发布竞品</a>
			</div>
            
        </div>
	<!-- main end-->
	</div>
<!-- end wrapper-->
</div>

<!--主要内容 acution(竞拍) start-->
<div class="acution">
	<!-- 头部开始 a_top start-->
	<div class="a_top" style="margin-top:0px;">
		<!-- 头部左侧开始 a_top_left start-->
		<div class="a_top_left" >
			<div class="a_t_l_top" >
				<div class="a_t_l_top_up">
					<img src="${ctxStatic}/img/llhb/gf_lx.png"/>
					<span class="a_t_font1">竞品类型</span>
				</div>
				<div class="a_t_l_top_down">
					<table>
                        <tr>
                        <c:forEach items="${ordComList}" var="ordCom" begin="0" end="3">
                            <td><a href="javascript:go('${ctx}/competition/index/search?typeSecond=${ordCom.type_second}');">${ordCom.dp_name}</a></td>
                        </c:forEach>
                        <c:forEach items="${danComList}" var="danCom" begin="0" end="5">
                            <td><a href="javascript:go('${ctx}/competition/index/search?typeSecond=${danCom.type_second}');">${danCom.dp_name}</a></td>
                        </c:forEach>
                        </tr>
					</table>
				</div>
			</div>
			<div class="a_t_l_bottom">
				<div class="a_t_l_bottom_up">
					<img src="${ctxStatic}/img/llhb/gf_dd.png"/>
					<span class="a_t_font1">竞品所在地</span>
				</div>
				<div class="a_t_l_bottom_down">
					<table>
                        <tr>
                            <td><a href="javascript:goSearch(4397);">东莞市</a></td><td><a href="javascript:goSearch(4398);"class="jp-suozaidi-hot">中山市</a></td>
                            <td><a href="javascript:goSearch(4391);">惠州市</a></td><td><a href="javascript:goSearch(4381);">广州市</a></td>
                            <c:forEach items="${provComList}" var="provCom">
                            <td><a href="javascript:go('${ctx}/competition/index/search?provId=${provCom.prov_id}');">${fn:substring(provCom.a_name,0,3)}</a></td>
                            </c:forEach>
                        </tr>
					</table>
				</div>
			</div>
		<!--头部左侧结束 a_top_left end -->
		</div>
		
		
		<!--头部中部开始 a_top_modle start-->
		<div class="a_top_modle">
		    <!--头部banner图片 start-->
            <ul class="fade_list">
            <c:forEach items="${midAdImgList}" var="midAdImg">
               <li >
                   <a href="${midAdImg.redirctHref}" target="_blank">
                       <img src="${midAdImg.picAddr}" style="width:530px; height:480px;"/>
                   </a>
               </li>
            </c:forEach>
            </ul>
            <!--头部banner小圆圈 start-->
            <div class="fade_btn"></div>
            <!--头部banner小圆圈 end-->
			
		<!-- 头部中部结束 a_top_modle end -->
		</div>
		
		
		<!-- 头部右侧开始 a_top_right start-->
		<div class="a_top_right">
			<div class="a_t_dynamic">
				<div class="a_t_d_f">
					<div class="a_t_d_font">
						<span class="a_t_font1">竞价动态</span>
					</div>
					<div class="a_t_d_data">
						<span>${curDate}</span><span>${week}</span>
					</div>
				</div>
				<div class="a_t_d_content">
				<c:forEach items="${curCompList}" var="curComp" begin="0" end="3">
					<dt><span><a href="javascript:void(0);" onclick="window.open('${ctx}/competition/detailInfo?id=${curComp.comp_id}')" title="${curComp.u_name}发布的${curComp.comp_title}以${curComp.remarks}被${curComp.b_name}拍走">${curComp.u_name}发布的${curComp.comp_title}以${curComp.remarks}被${curComp.b_name}拍走</a></span></dt>
					<dd><span><fmt:formatDate  value="${curComp.time}" type="both" pattern="MM.d" /></span><span title="${curComp.city_name }">${fns:abbr(curComp.city_name,10)}</span></dd>
				</c:forEach>
						
						<!-- <dt><span><a href="javascript:void(0);">华东发布的废电脑以1000元被牛顿拍走</a></span></dt>
						<dd><span>08.18</span><span>东莞市</span></dd>
						<dt><span><a href="javascript:void(0);">华东发布的废电脑以1000元被牛顿拍走</a></span></dt>
						<dd><span>08.18</span><span>东莞市</span></dd>
						<dt><span><a href="javascript:void(0);">华东发布的废电脑以1000元被牛顿拍走</a></span></dt>
						<dd><span>08.18</span><span>东莞市</span></dd> -->
				</div>
			</div>
			<div class="a_t_customer">
				<span>客户专线&nbsp;&nbsp;${servicePhone }</span>
			</div>
			<div class="a_t_question">
				<div class="a_t_q_top">
					<div class="a_t_q_f">
						<span class="a_t_font1">常见问题</span>
					</div>
					<div class="a_t_q_more">
						<span><a href="javascript:void(0);">更多+</a></span>
					</div>
				</div>
				<div class="a_t_q_main">
					<div class="a_t_q_m_left">
						<ul>
							<li><a href="javascript:void(0);">什么是保证金？</a></li>
							<li><a href="javascript:void(0);">如何缴纳大额保证金</a></li>
							<li><a href="javascript:void(0);"class="changjian-q-hot">如何支付尾款？</a></li>
							<li><a href="javascript:void(0);">不看样的后果！</a></li>
							<li><a href="javascript:void(0);">如何支付尾款？</a></li>
						</ul>
					</div>
					<div class="a_t_q_m_right">
						<ul>
							<li><a href="javascript:void(0);">什么是优先购买权</a></li>
							<li><a href="javascript:void(0);">出价成交规则</a></li>
							<li><a href="javascript:void(0);">什么是保留价？</a></li>
							<li><a href="javascript:void(0);">拍下不要的后果</a></li>
							<li><a href="javascript:void(0);">什么是保留价？</a></li>
						</ul>
					</div>
				</div>
			</div>
		<!-- 头部右侧结束 a_top_right end -->
		</div>	
	<!-- a_top end -->
	</div>
	
	
	<!---竞拍流程开始 a_process start-->
	<div class="a_process">
		<div class="a_p_word">
			<span>竞拍</span><span>流程</span>
		</div>
		<div class="a_p_first a_p_step" >
			<a href="javascript:void(0);">
				<dl>
					<dt></dt>
					<dd><span class="a_p_step_font1">第一步</span><span class="a_p_step_font2">参与竞价</span></dd>
				</dl>	
			</a>
		</div>
		<div class="a_p_sig">
			
		</div>
		<div class="a_p_second a_p_step" >
			<a href="javascript:void(0);">
				<dl>
					<dt></dt>
					<dd><span  class="a_p_step_font1">第二步</span><span class="a_p_step_font2">竞价成功</span></dd>
				</dl>	
			</a>
		</div>
		<div class="a_p_sig"></div>
		<div class="a_p_third a_p_step" >
			<a href="javascript:void(0);">
				<dl>
					<dt></dt>
					<dd><span  class="a_p_step_font1">第三步</span><span class="a_p_step_font2">签订合同</span></dd>
				</dl>	
			</a>
		</div>
		<div class="a_p_sig"></div>
		<div class="a_p_forth a_p_step">
			<a href="javascript:void(0);">
				<dl>
					<dt></dt>
					<dd><span  class="a_p_step_font1">第四步</span><span class="a_p_step_font2">推荐服务</span></dd>
				</dl>	
			</a>
		</div>
		<div class="a_p_sig"></div>
		<div class="a_p_fifth a_p_step">
			<a href="javascript:void(0);">
				<dl>
					<dt></dt>
					<dd><span  class="a_p_step_font1">第五步</span><span class="a_p_step_font2">双方互评</span></dd>
				</dl>	
			</a>
		</div>
	<!--竞拍流程结束 a_process end -->
	</div>	
	<!--竞拍中开始 a_ing start-->
	<div class="a_ing">
		<!--竞拍中左侧开始 a_ing_left start-->
		<div class="a_ing_left">
			<!--1F竞价动态 start-->
			<div class="c1_m_right">
				<div class="c1_m_title font_3">
					<span class="c1_m_t_left">激烈竞价中</span>
					<p>次围观</p><div class="c1_m_t_l_count">${compingPageView}</div>
				</div>
							
				<div class="c1_m_r_list" >
					<ul>
					<c:forEach items="${comList}" var="com" begin="0" end="8">
						<li onclick="window.open('${ctx}/competition/detailInfo?id=${com.id}')" >
							<div class="c1_m_r_img">
							<c:choose>
							<c:when test="${not empty com.pic1}">
							<img src="${com.pic1}" style="width:230px; height:125px;"/>
							</c:when>
							<c:when test="${not empty com.pic2}">
							<img src="${com.pic2}" style="width:230px; height:125px;"/>
							</c:when>
							<c:when test="${not empty com.pic3}">
							<img src="${com.pic3}" style="width:230px; height:125px;"/>
							</c:when>
							<c:otherwise>
							<img src="${ctxStatic}/img/llhb/default.png" style="width:230px; height:125px;"/>
							</c:otherwise>
							</c:choose>
							</div>
							<div class="c1_m_r_top">${com.comp_title}</div>
							<p class="font_1">当前价&nbsp;<span class="font_3">￥${not empty com.max_price? com.max_price:'0元'}</span>(${not empty com.price_count? com.price_count:'0'}次出价)</p>
							<p class="font_1">评估价&nbsp;￥${not empty com.starting_price? com.starting_price:'0元'}</p>
							<p class="font_1">距结束&nbsp;<span class="djs_span" data-time="${com.end_surplus_time}"></span></p>
							<div class="c1_m_r_bottom font_1">
								<p><span>${not empty com.page_view? com.page_view:'0'}次</span><span>围观</span></p>
								<p><span>${not empty com.pay_count? com.pay_count:'0'}人</span><span>报名</span></p>
							</div>
							<div class="c1_m_r_now font_1">正在进行</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<!--1F竞价动态 end-->
		<!--竞拍中左侧结束 a_ing_left end-->
		</div>
		<div class="a_ing_right">
			<div class="c1_m_left">
                    <div class="a_ing_r_title">
                        <span class="font_3">推荐企业</span>
                     
                    </div>
                    
                    <div class="tj_box">
                    	<div class="tj_1">
                    	<c:forEach items="${comAdImgList}" var="comAdImg">
                        	<div class="qy_1" onclick="window.open('${comAdImg.redirctHref}')">
                            	<img src="${comAdImg.picAddr}" style="width:118px; height:68px;">
                                <p>&nbsp;</p>
                                <a>${comAdImg.showName}</a>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                   
    			</div>
		</div>
	<!-- 竞拍中结束 a_ing end -->
	</div>
	<div class="a_trailer">
		<div class="a_t_title font_3">
			<span class="a_t_t_left">竞拍预告</span>
			<p>次围观</p><div class="c1_m_t_l_count">${compPrePageView}</div>
		</div>
		<div class="c1_m_r_list">
					<ul>
					<c:forEach items="${comPreList}" var="comPre" begin="0" end="15">
						<li onclick="window.open('${ctx}/competition/detailInfo?id=${comPre.id}')">
							<div class="c1_m_r_img">
							<c:choose>
							<c:when test="${not empty comPre.pic1}">
							<img src="${comPre.pic1}" style="width:230px; height:125px;"/>
							</c:when>
							<c:when test="${not empty comPre.pic2}">
							<img src="${comPre.pic2}" style="width:230px; height:125px;"/>
							</c:when>
							<c:when test="${not empty comPre.pic3}">
							<img src="${comPre.pic3}" style="width:230px; height:125px;"/>
							</c:when>
							<c:otherwise>
							<img src="${ctxStatic}/img/llhb/default.png" style="width:230px; height:125px;"/>
							</c:otherwise>
							</c:choose>
							</div>
							<div class="c1_m_r_top">${comPre.comp_title}</div>
							<p class="font_1">当前价&nbsp;<span class="font_3">￥${not empty comPre.max_price? comPre.max_price:'0元'}</span>(${not empty comPre.price_count? comPre.price_count:'0'}次出价)</p>
							<p class="font_1">评估价&nbsp;￥${not empty comPre.starting_price? comPre.starting_price:'0元'}</p>
							<p class="font_1">即将开始&nbsp;<span class="djs_span" data-time="${comPre.start_surplus_time}"></span></p>
							<div class="c1_m_r_bottom font_1">
								<p><span>${not empty comPre.page_view? comPre.page_view:'0'}次</span><span>围观</span></p>
								<p><span>${not empty comPre.pay_count? comPre.pay_count:'0'}人</span><span>报名</span></p>
							</div>
							<div class="c1_m_r_now font_1">即将开始</div>
						</li>
					</c:forEach>
					</ul>
				</div>
	<!-- a_trailer end -->
	</div>
<!-- .acution end-->
</div>

<footer>

    <!--底部上部信息 start-->
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
    <!--底部下部信息 end-->
</footer>
<!--底部 end-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>

<div class="populayer pl_normal" >
    <div class="layer_top">
    	<span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>
    </div>
</div>	
<!-- JS代码 -->
<script type="text/javascript">

	$(document).ready(function(){
		/*存储个标题距顶部距离*/
		var contentNavArr = [];
		var ad_top=$(".header_banner").each(function(){
			contentNavArr.push($(this).offset().top);
		
		});
		/*滚动条事件*/
		$(window).scroll(function(){
			/*左右悬窗定位*/
			if($(window).scrollTop() >　contentNavArr[0]){
				$(".nav_bottomlist").show();
				$(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});
			
				
			}else if($(window).scrollTop() <=　contentNavArr[0]){
				$(".nav_bottomlist").hide();
				$(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"298px"});
			}
			
		});

        /**======鼠标跟踪标题==========*/
        $(".a_t_l_top_down td").mouseover(function(e){

            var myTitle = $(this).find("a").attr("data-project");
            if(myTitle != null && myTitle != ""){
                var tooltip = "<div id='tooltip'>"+myTitle+"</div>";
                $("body").append(tooltip);
                $("#tooltip").css({
                    "position":"absolute",
                    "z-index":"18",
                    "color":"#5cb531",
                    "font-size":"12px",
                    "width":"40px",
                    "line-height":"14px",
                    "text-align":"center",
                    "border":"1px solid #5cb531",
                    "background-color":"#fff",
                    "display":"block"
                });
            }
            //鼠标坐标取值
            $(".a_t_l_top_down td").mousemove(function(e){
                var title_x = e.pageX;
                var title_y = e.pageY;
                $("#tooltip").css({
                    "top": title_y+ 15+"px",
                    "left": title_x+ 15+"px"
                });
            });
        });
        
		
	});
	$(document).ready(function(){
        /*获取图片的盒子对象*/
        var $fadeDom = $(".fade_list");
        /*控制轮播的索引*/
        var idx = 0;
        /*定时器*/
        var fadeTimer = null;
        /*轮播时间*/
        var timer = 3000;
        var length = $(".fade_list li").length;
        $(".a_top_modle .fade_btn").html("");
        $(".fade_list li").each(function(){
            $(".a_top_modle .fade_btn").append('<a href="javascript:void(0);" ></a>');
        });
        $(".a_top_modle .fade_btn").find("a:first").addClass("h_b_btn_sel");

        $(".fade_btn").on("click","a",function(){
            clearInterval(fadeTimer);
            idx = $(this).index();
            changePic(idx);
            $(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }).mouseleave(function(){
            playFader();
        }).mouseover(function(){
            clearInterval(fadeTimer);
        });

        function playFader(){
            fadeTimer = setInterval(function(){
                idx++;
                if(idx == length){
                    idx = 0;
                }
                changePic(idx);

            },timer);
        }
        /*执行轮播*/
        playFader();
    });

    function changePic(idx){
        $(".a_top_modle").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
    }
    /*倒计时*/
    function checktime(time){
        if(time<10){
            time="0"+time;
            return time;
        }else{
            return time;
        }
    }
    
    function show_l_time(lefttime,obj){
        
        if(lefttime<=0){
        	obj.text("00天00时00分00秒");

        }else{
            var d = checktime(parseInt(lefttime/(24*60*60)));
            var h = checktime(parseInt(lefttime/(60*60)%24));
            var m = checktime(parseInt(lefttime/60%60));
            var s = checktime(parseInt(lefttime%60));
            obj.text(d+"天"+h+"时"+m+"分"+s+"秒");
            
        }
    }
    function djs(lefttime,obj){
    	var lt=parseInt(lefttime);
    	setInterval(function(){
    		lt=lt-1;
    		show_l_time(lt,obj);
    	},1000);
    	
    }
    $(function(){
    	$(".djs_span").each(function(){
    		var that = $(this);
    		var djs_s = that.data("time");
    		djs(djs_s,that);
    	});
    });
    /*发布竞品*/
    function issue(){
    	var loginName = $("#lo").html();
    	if(loginName!=null && loginName!="" && loginName!=undefined){
    		go('${ctx}/home?str=/competition/inforMan/add');
    	}else{
    		showMess("请先登录");
    	}
    }
  //不带确定的提示框
    function showMess(str){
    	$(".popumask").show();
    	$(".pl_normal .pl_content p").html(str);
    	$(".pl_normal").show();
    	$(".close_btn").unbind().click(function(){
    		$(".popumask").fadeOut();
    		$(".pl_normal .pl_content p").html("");
        	$(".pl_normal").hide();
        	clearTimeout(timeout);
    	});
    	var timeout = setTimeout(function(){
    		$(".popumask").fadeOut();
    		$(".pl_normal .pl_content p").html("");
        	$(".pl_normal").hide();
    	},3000);
    }
  //去除弹出标题
    $(".a_t_l_top_down td").mouseout(function(e){
        $("#tooltip").remove();
    });
  //跳转搜索
  function goSearch(id){
	  go('${ctx}/competition/index/search?provId=26&cityId='+id);
  }
</script>
<body>
</html>