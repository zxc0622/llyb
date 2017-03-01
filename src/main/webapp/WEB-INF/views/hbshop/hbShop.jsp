<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <title>优蚁环保-环保商城，全国领先的网上环保商城</title>
<meta name="keywords" content="环保商城，环保服务，环保设备，环保原料" />
<meta name="description" content="优蚁环保商城-提供先进的设备、原料，各类优质的服务，安全、便捷、高效，让您享受互联网带来的乐趣">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
.header_middle .header_search select{float:left; height:35px; line-height:35px; width:90px; border:1px solid #ccc;}
.header_middle .header_search .h_s_middle{float:left;}
.header_middle .header_search .h_s_middle input{width:260px;}
.header_middle .header_search .h_s_middlebefore{z-index:1;content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}

/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0;}


.shouye-title{height:30px;width:100%;border-bottom: 2px solid #5EC520;overflow: hidden;}
.shouye-title .shouye-title-left{float:left;width:80px;height:30px;line-height: 30px;color:#fff;background-color: #5EC520;text-align: center;}
.shouye-title .c1_m_t_right{float: right;color:#EF7801;margin-top: 9px;}

/*搜索模块*/
.search-class{margin-top:4px;color:#666;}
.search-class div{box-sizing: border-box;}
.search-class-row{overflow: hidden;margin-bottom: 10px;}
.search-class-row .s-c-r-l{float:left;height:30px;width:120px;line-height: 30px;text-align: center;border:1px solid #ccc;}
.search-class-row .s-c-r-r{float:left;margin-left: 15px;width:860px;border:1px solid #ccc;position: relative;}
.search-class-row .s-c-r-r .row-right-square{position: absolute;top:9px;left:-6px;width:10px;height:10px;border-left: 1px solid #ccc;border-bottom: 1px solid #ccc;background-color: #fff;z-index: 2;transform: rotate(45deg);-ms-transform:rotate(45deg);-moz-transform:rotate(45deg);-webkit-transform:rotate(45deg);-o-transform:rotate(45deg);}
.ie8 .search-class-row .s-c-r-r .row-right-square{width:0; height:0;}

.search-class ul{overflow: hidden;}
.search-class ul li{float:left;height:30px;line-height: 30px;padding-right: 14px;margin-right: 10px;position: relative;cursor: pointer;}
.search-class ul li:hover::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#999;}
.search-class ul .li-sel{color:#5EC520;}
.search-class ul .li-sel::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#666;border-top-color:#5ec420;}
.search-class ul .li-sel:hover::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#666;border-top-color:#5ec420;}
.search-class ul .li-end:hover{color:#5EC520;}
.search-class ul .li-end:hover::after{display: none;}
.search-class ul .li-end.li-sel::after{display: none;}
.level-div{padding:0 15px;}
.level-erji,.level-sanji{display: none;border:1px solid #ccc;margin-bottom: 5px;}
.level-erji li,.level-sanji li{font-size: 12px;}
/*搜索模块结束*/

/*所在地区*/
.mall_area{overflow:hidden; margin-bottom:15px;}
.mall_area .area_tit{border-bottom:1px solid #5cb531; margin-bottom:4px;}
.mall_area .area_tit a{width:92px; line-height:30px; background-color:#5cb531; color:white; display:block; text-align:center;}

.mall_area .area_cont{width:998px; border:1px solid #ccc; overflow:hidden;}
.mall_area .area_cont li{float:left; padding:0 6px;line-height:28px; cursor:pointer;}
.mall_area .area_cont li:hover{color:#5ec420;}
.mall_area .area_cont .cur_area{color:#5ec420;}

/*排序方式*/
.mall_sort{border:1px solid #ccc; line-height:30px; height:30px; margin-bottom:15px;}
.mall_sort .choese_sort{float:left; border-right:1px solid #ccc; padding:0px 10px; position:relative; cursor:pointer;}
.mall_sort .choese_sort .cur_sort{background-image:url(${ctxStatic}/img/llhb/select_down.png); background-repeat:no-repeat; background-position:right center; width:80px; color:#ee7800;}
.mall_sort .choese_sort .sort_zh{position:absolute; border:1px solid #ccc;padding:0 10px; left:-1px; background-color:white; width:80px;}

.mall_sort .sort_1{float:left;}
.mall_sort .sort_1 li{float:left; padding:0 30px; border-right:1px solid #ccc; cursor:pointer;}
.mall_sort .sort_1 li a{background-image:url(${ctxStatic}/img/llhb/paixu_icon.png); background-repeat:no-repeat; background-position:right center; padding:0 20px 0 0px;}
.mall_sort .sort_1 li .up_down{background-image:url(${ctxStatic}/img/llhb/paixu_icon1.png); background-repeat:no-repeat; background-position:right center; padding:0 20px 0 0px;}

.mall_sort .sort_right{float:right;}
.mall_sort .sort_right li{float:left;padding-left:10px; border-left:1px solid #ccc; cursor:pointer;}
.mall_sort .sort_right li:nth-of-type(1) span{background-image:url(${ctxStatic}/img/llhb/icon11.png); background-repeat:no-repeat; background-position:0 0; padding:0px 8px; margin:2px 0 0 30px;}
.mall_sort .sort_right li:nth-of-type(2) span{background-image:url(${ctxStatic}/img/llhb/icon11.png); background-repeat:no-repeat; background-position:-18px 0px; padding:0px 8px; margin:2px 0 0 30px;}


.main_bottom{overflow:hidden;}
/*筛选结果*/
.result_box{float:left;}
/*列表*/
.result_list{width:798px;}
.result_list .list_row{width:776px; height:131px; border:1px solid #ccc; padding:24px 10px; overflow:hidden; margin-bottom:6px;}
.result_list .list_row:hover{border:1px solid #5cb531;}
.result_list .list_row .list_p{float:left; margin-right:10px;cursor:pointer;}
.result_list .list_row .list_right{float:left; width:628px;}
.result_list .list_row .list_right p{color:#333; border-bottom:1px dashed #ccc; padding-bottom:18px;cursor:pointer;}
.result_list .list_row .list_right p:hover{color:#5EC520;}
.result_list .list_row .list_right .list_aa{padding-top:17px;}
.result_list .list_row .list_right .list_aa dl{float:left; width:460px;}
.result_list .list_row .list_right .list_aa dl dt{margin-bottom:15px; cursor:pointer;}
.result_list .list_row .list_right .list_aa dl dd{overflow:hidden;}
.result_list .list_row .list_right .list_aa dl dd span{color:#5cb531; cursor:pointer;}
.result_list .list_row .list_right .list_aa dl dd a{color:#666; float:right;}
.result_list .list_row .list_right .list_aa .rzh{width:120px; float:right}

.result_list .list_row .list_right .list_aa .rzh li{width:30px; float:left;width:30px; height:50px; margin-left:10px; position:relative;}
/*认证图标*/
.result_list .list_row .list_right .list_aa .rzh .yyrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:0 -60px;}
.result_list .list_row .list_right .list_aa .rzh .yyrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:0 0px;}
.result_list .list_row .list_right .list_aa .rzh .qyrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:-38px -60px;}
.result_list .list_row .list_right .list_aa .rzh .qyrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:-38px 0px;}
.result_list .list_row .list_right .list_aa .rzh .xtrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:-76px -60px;}
.result_list .list_row .list_right .list_aa .rzh .xtrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_1.png); background-repeat:no-repeat; background-position:-76px 0;}
/*认证图标解释*/
.result_list .list_row .list_right .list_aa .rzh h6{position:absolute;left:-10px; bottom:-20px; z-index:2;color:#5cb531; border:1px solid #5cb531;  line-height:14px; font-size:12px; width:54px; text-align:center;}

/*大图*/
.result_bigpic{width:798px;}
.result_bigpic {width:798px; overflow:hidden; margin-bottom:20px;}
.result_bigpic  .bigpic_1{width:185px; height:234px;border:1px solid #ccc; float:left; margin-right:16px;margin-bottom:15px;}
.result_bigpic  .bigpic_1:hover{border:1px solid #5cb531;}
.result_bigpic  .bigpic_1:nth-of-type(4n){margin-right:0px;}
.result_bigpic  .bigpic_1 dl{padding:10px;}
.result_bigpic  .bigpic_1 dl dt{font-size:14px; color:#333; cursor:pointer;}
.result_bigpic  .bigpic_1 dl dt:hover{color:#5EC520;}
.result_bigpic  .bigpic_1 dl dd{cursor:pointer;}
.result_bigpic  .bigpic_1 dl dd:hover{color:#5EC520;} 

.ie8 .result_bigpic  .bigpic_1{width:185px; height:234px;border:1px solid #ccc; float:left; margin-right:11px;}

/*认证图标*/
.result_bigpic  .bigpic_1 .rzh{padding-left:10px;}
.result_bigpic  .bigpic_1 .rzh li{width:30px; float:left; height:30px;}
.result_bigpic  .bigpic_1 .rzh .yyrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:0 0;}
.result_bigpic  .bigpic_1 .rzh .qyrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:-30px 0px;}
.result_bigpic  .bigpic_1 .rzh .xtrz_1{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:-60px 0;}
.result_bigpic  .bigpic_1 .rzh .yyrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:0 -35px;}
.result_bigpic  .bigpic_1 .rzh .qyrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:-30px -35px;}
.result_bigpic  .bigpic_1 .rzh .xtrz_2{background-image:url(${ctxStatic}/img/llhb/renzheng_2.png); background-repeat:no-repeat; background-position:-60px -35px;}

/*翻页*/
.fanye{margin-top:20px; margin-bottom:20px;overflow:hidden;}
.fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]:focus{border:1px solid #ee7800;}
.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye .fanye_btn input{width:30px;}

.fanye .filp .cur_fanye_btn{background-color:#5cb531;width:30px; border:1px solid #5cb531; color:white;}

/*右侧广告*/
.mall_ad{width:188px; float:right;}
.mall_ad a{width:188px; display:block; margin-bottom:10px; cursor:pointer;}
.mall_ad a img{width:100%;}

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


/*发布需求弹出框样式start */
.require-box{width:298px;height:370px;background-color: #FFFFFF;border: 1px solid #CCC;font-family: "微软雅黑";position: absolute;z-index: 11;top: 101px;left: -119px;display:none;}
.rb-item{margin-top: 15px;margin-left: 32px;position: relative;}
.rb-inoneline{display: inline-block;}
.rb-p1{font-size: 14px;margin-top: 10px;margin-left: 10px;color: #000000;}
.rb-p2{font-size: 12px;color: #7A7A7A;margin-bottom: 2px;}
.rb-p3{font-size: 14px;color: #7A7A7A;}
.rb-a{display: block;margin-top: 17px;margin-left: 36px;width:224px;height:42px;background-color: #EF7800;color: #FFFFFF;text-align: center;line-height: 42px;font-size: 18px;cursor: pointer;}
.rb-word{padding-top: 5px;position: relative;top: -8px;}
.rb-imgdiv{height:46px;width:46px;}
.rb-word p{height: 16px;}
/*发布需求弹出框样式end */

</style>
<script type="text/javascript">
   	//发布需求弹出框js
      	$(function(){
      		$(".showRequireBox").mouseover(function(){
      			$(".require-box").show();
      		});
      		
      		$(".showRequireBox").mouseout(function(){
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
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo" style="height:145px;">
                <a href="javascript:go('${ctx}/index')">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <select id="type_first">
                <c:forEach items="${typeList}" var="list">
                	<option value="${list.id}">${list.name}</option>
                </c:forEach>
                </select>
                <div class="h_s_middle font_1">
                	<span class="h_s_middlebefore"></span>
                    <input id="pro_name" type="search"  value="${proName}" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a id="search_all" class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
            <div class="header_right" style="float: left;height:145px;    position: relative;">
            	<a class="font_3 showRequireBox" href="javascript:void(0);" onclick="window.open('${ctx}/addNeed');" style="display:block;height: 35px;line-height:35px;background: #5EC520;color: #FFFFFF;text-align: center;;width:130px;margin-top:65px;margin-left:50px; background-color:#ee7800;">发布环保需求</a>
              	<%--   <ul>
                    <c:forEach items="${ads}" var="ads">
						<c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
							<li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
						</c:if>
					</c:forEach>
                </ul>
                <a href="#" class="h_r_next">&gt;</a> --%>
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
        		当前位置>优蚁网>环保商城
        	</div>
         </div>
         <!-- 首页通用标题 -->
        <div class="shouye-title font_3">
            <span class="shouye-title-left">行业分类</span>
        </div>
        <!-- 搜索分类模块开始  -->
        <div class="search-class">
        
            <!-- 第一行原料 -->
            <div class="search-class-row">
            	<c:forEach items="${typeList}" var="list">
            	<c:if test="${list.type eq 'material_type'}">
                <div id="material_type" class="s-c-r-l" data-id="${list.id}">${list.name}</div>
                </c:if>
                </c:forEach>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div id="material" class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul id="m_type_sub" class="second_level">
                            <li data-id="142" data-pids="">不限</li>	
                            </ul>
                           <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul class="third_level">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第一行原料 结束 -->
            <!-- 第二行设备开始 -->
            <div class="search-class-row">
            	<c:forEach items="${typeList}" var="list">
            	<c:if test="${list.type eq 'equipment_type'}">
                <div id="equipment_type" class="s-c-r-l" data-id="${list.id}">${list.name}</div>
                </c:if>
                </c:forEach>
                <div  class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div id="equipment" class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul id="e_type_sub"  class="second_level">
                             <li data-id="932" data-pids="">不限</li>   
                            </ul>
                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul class="third_level">
                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第二行设备结束 -->
            <!-- 第三行服务开始 -->
            <div class="search-class-row">
                <c:forEach items="${typeList}" var="list">
            	<c:if test="${list.type eq 'service_type'}">
                <div id="service_type" class="s-c-r-l" data-id="${list.id}">${list.name}</div>
                </c:if>
                </c:forEach>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div id="service" class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul id="s_type_sub"  class="second_level">
                            <li data-id="307" data-pids="">不限</li>
                            </ul>
                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul class="third_level">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>	
                </div>
            </div>
            <!-- 第三行服务结束 -->
            
        </div>
        <!-- 搜索模块结束 -->
        <!--所在地start-->
    	<div class="mall_area">
        	<div class="area_tit">
            	<a>所在地</a>
            </div>
            <ul class="area_cont font_1 color_1">
            	<li class="cur_area" data-id="">不限</li>
            <c:forEach items="${provList}" var="prov">
            	<li data-id="${prov.id}">${prov.name}</li>
            </c:forEach>
            </ul>
        </div>
        <!--所在地end-->
        <!--排序方式start-->
        <div  class="mall_sort font_1 color_1">
        	<ul id="orderBy_way_1" class="choese_sort">
            	<li class="cur_sort" data-model="1">热门排序</li>
                <li class="sort_zh" data-model="2">综合排序</li>
            </ul>
            <ul id="orderBy_way_2" class="sort_1">
            	<li data-model="time"><a>更新时间</a></li>
                <li data-model="low_price"><a>价格</a></li>
                <li data-model="page_view"><a>人气</a></li>
                <li data-model="per_flag"><a>信誉</a></li>
                <li data-model=""><a>销量</a></li>
            </ul>
            <ul class="sort_right">
            	<li><a href="javascript:void(0)" data-show-model="bigPic">大图</a><span>&nbsp;</span></li>
                <li><a href="javascript:void(0)" data-show-model="list">列表</a><span>&nbsp;</span></li>
            </ul>
        </div>
        <div class="main_bottom" data-pagesize="${pageSize}">
            <!--筛选结果start-->
            <div class="result_box">
                <div class="result_list">
                	<!--start-->
                	<c:forEach items="${proList}" var="pro">
                    <div data-id="${pro.id}" class="list_row">
                    	<div class="list_p" onclick="window.open('${ctx}/mall/detail/${pro.id}')">
                    	<c:choose>
                    		<c:when test="${not empty pro.pic1}">
                        	<img src="${pro.pic1}" width="131px" height="131px">
                        	</c:when>
                        	<c:when test="${not empty pro.pic2}">
                        	<img src="${pro.pic2}" width="131px" height="131px">
                        	</c:when>
                        	<c:otherwise>
                        	<img src="${pro.pic3}" width="131px" height="131px">
                        	</c:otherwise>
                        </c:choose>
                        </div>
                        <div class="list_right">
                        	<p class="font_3"  onclick="window.open('${ctx}/mall/detail/${pro.id}')">${pro.pro_name}</p>
                            <div class="list_aa">
                            	<dl class="font_1 color_1">
                                	<dt>${fns:abbr(pro.pro_desc,130)}</dt>
                                	<dd>供应商<span onclick="window.open('${ctx}/homepage/${pro.c_id}')">${fn:substring((not empty pro.company_name?pro.company_name:''),0,120)}</span><a>地区：${not empty pro.prov_name?pro.prov_name:'无'}${not empty pro.city_name?pro.city_name:'无'}</a></dd>
                                </dl>
                                <ul class="rzh">
                                <c:choose>
                                	<c:when test="${pro.youyi_flag eq 1}">
                                	<li class="yyrz_1">&nbsp;<h6>优蚁认证</h6></li>
                                	</c:when>	
                                	<c:otherwise>
                                	<li class="yyrz_2">&nbsp;<h6>优蚁认证</h6></li>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${pro.auth_flag eq 1}">
                                	<li class="qyrz_1">&nbsp;<h6>企业认证</h6></li>
                                	</c:when>	
                                	<c:otherwise>
                                	<li class="qyrz_2">&nbsp;<h6>企业认证</h6></li>
                                	</c:otherwise>
                                </c:choose>
                                <c:choose>
                                	<c:when test="${pro.per_flag eq 1}">
                                	<li class="xtrz_1">&nbsp;<h6>个人认证</h6></li>
                                	</c:when>	
                                	<c:otherwise>
                                	<li class="xtrz_2">&nbsp;<h6>个人认证</h6></li>
                                	</c:otherwise>
                                </c:choose>
                                </ul>                            	
                            </div>  
                        </div> 
                    </div>
                    </c:forEach>
                    <!--end-->
                </div>
                <div class="result_bigpic">
                	<c:forEach items="${proList}" var="pro">
                    <div class="bigpic_1">
                    <c:choose>
                    	<c:when test="${not empty pro.pic1 }">
                    	<img src="${pro.pic1}" style="width:185px; height:140px">
                    	</c:when>
                    	<c:when test="${not empty pro.pic2 }">
                    	<img src="${pro.pic2}" style="width:185px; height:140px" >
                    	</c:when>
                    	<c:otherwise>
                    	<img src="${pro.pic3}" style="width:185px; height:140px">
                    	</c:otherwise>
                    </c:choose>
                        <dl>
                        	<dt onclick="window.open('${ctx}/mall/detail/${pro.id}')">${pro.pro_name }</dt>
                            <dd class="font_1 color_1">${pro.company_name }</dd>
                        </dl>
                        <ul class="rzh">
		               	<c:choose>
	                       	<c:when test="${pro.youyi_flag eq 1}">
	                       	<li class="yyrz_1">&nbsp;<h6>优蚁认证</h6></li>
	                       	</c:when>	
	                       	<c:otherwise>
	                       	<li class="yyrz_2">&nbsp;<h6>优蚁认证</h6></li>
	                       	</c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${pro.auth_flag eq 1}">
                        	<li class="qyrz_1">&nbsp;<h6>企业认证</h6></li>
                        	</c:when>	
                        	<c:otherwise>
                        	<li class="qyrz_2">&nbsp;<h6>企业认证</h6></li>
                        	</c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${pro.per_flag eq 1}">
                        	<li class="xtrz_1">&nbsp;<h6>个人认证</h6></li>
                        	</c:when>	
                        	<c:otherwise>
                        	<li class="xtrz_2">&nbsp;<h6>个人认证</h6></li>
                        	</c:otherwise>
                        </c:choose>
                        
                        </ul>
                    </div>
                    </c:forEach>
                </div>
                 <div class="fanye font_1 color_1">
	                <c:set var="currentPage" value="${curPage}" />
	                <input type="hidden" value="${curPage }">
					<c:set var="totalPage" value="${countPage}" />
 					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />  
					<c:set var="totalRow" scope="page" value="${proCount}" /> 
					<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
						<c:set var="startPage" value="${currentPage - 2}" />
						<c:if test="${startPage < 1}" >
							<c:set var="startPage" value="1" />
						</c:if>
						<c:set var="endPage" value="${currentPage + 2}" />
						<c:if test="${endPage > totalPage}" >
							<c:set var="endPage" value="totalPage" />
						</c:if>
						
						<div class="filp">
							<c:if test="${currentPage <= 4}">
								<c:set var="startPage" value="1" />
							</c:if>
							
							<c:if test="${(totalPage - currentPage) < 4}">
								<c:set var="endPage" value="${totalPage}" />
							</c:if>
							
							<c:choose>
								<c:when test="${currentPage == 1}">
					                <input type="button" value="上一页" style="width:60px;" class="fanye_left"/>
								</c:when>
								<c:otherwise>
					                <input type="button" onclick="goPage(${currentPage-1})" value="上一页" style="width:60px;" class="fanye_left"/>
								</c:otherwise>
							</c:choose>
							
							<c:if test="${currentPage > 4}">
								<a href="javascript:goPage(${1})">${1}</a>
								<a href="javascript:goPage(${2})">${2}</a>
								<span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>
							</c:if>
							
							 <c:forEach begin="${startPage}" end="${endPage}" var="i">
								<c:choose>
									<c:when test="${currentPage == i}">
					                    <input type="button" value="${i}" class="cur_fanye_btn"/>
									</c:when>
									<c:otherwise>
										<a href="javascript:goPage(${i})" >${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${(totalPage - currentPage) >= 4}">
							
								<span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>
								<a href="javascript:goPage(${totalPage - 1})">${totalPage - 1}</a>
								<a href="javascript:goPage(${totalPage})">${totalPage}</a>
							</c:if>
							
							<c:choose>
								<c:when test="${currentPage == totalPage}">
					                <input type="button" value="下一页" style="width:60px;" class="fanye_right"/>
								</c:when>
								<c:otherwise>
					                <input type="button" onclick="goPage(${currentPage+1})" value="下一页" style="width:60px;" class="fanye_right"/>
								</c:otherwise>
							</c:choose>
							<a>共<span>${totalRow }</span>条/<span>${totalPage }</span>页</a>
					        <input type="text" style="width:30px;" value="${currentPage }">
					        <input onclick="jump()" type="button" value="跳转" style="width:60px;">
						</div>
					</c:if>
	              </div> 
                </div>
            <!--筛选结果end-->
            <div class="mall_ad">
            <c:forEach items="${adImgList}" var="adImg">
            <input type="hidden" value="${adImg.redirctHref}">
            	<a href="${not empty adImg.redirctHref? adImg.redirctHref:'javascript:void(0)'}" target="_blank"><img src="${adImg.picAddr}" style="width:180px; height:200px;"></a>
            </c:forEach>
                <%-- <a><img src="${ctxStatic}/img/llhb/mall_p4.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p5.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p6.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p4.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p5.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p6.png"></a>
                <a><img src="${ctxStatic}/img/llhb/mall_p4.png"></a>    --%>             
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
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<script>
//banner 样式切换
$(".header_nav ul li").eq(4).addClass("header_nav_sel");
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
<!--选择所在地-->
<script>
	$(".mall_area .area_cont li").mousedown(function(){
		$(".mall_area .area_cont li").removeClass("mall_area area_cont cur_area");
		$(this).addClass("cur_area");
			
	})
</script>
        
<!--排序方式end-->
<script>
	//综合排序、热门排序切换
	$(".mall_sort .choese_sort .sort_zh").hide();
	$(".mall_sort .choese_sort .cur_sort").click(function(){
		$(".mall_sort .choese_sort .sort_zh").show();	
	});
	$(".mall_sort .choese_sort").mouseleave(function(){
		$(".mall_sort .choese_sort .sort_zh").hide();	
	});
	$(".mall_sort .choese_sort .sort_zh").click(function(){
		var tamp="";
		tamp=$(this).html();
		$(this).html($(".mall_sort .choese_sort .cur_sort").html());
		$(".mall_sort .choese_sort .cur_sort").html(tamp);
		tamp2=$(this).attr("data-model");
		$(this).attr("data-model",$(".mall_sort .choese_sort .cur_sort").attr("data-model"));
		$(".mall_sort .choese_sort .cur_sort").attr("data-model",tamp2);
		$(this).hide();
	});
	//前后切换
			
	$(function(){
		$(".sort_1 li").click(function(){
			$(this).find("a").toggleClass("up_down");
			$(this).siblings().find("a").removeClass("up_down");
		});
	});
	//大图、列表切换
	$(".result_box .result_bigpic").hide();	
	$(function(){
		$(".mall_sort .sort_right li:eq(0)").click(function(){
			$(".mall_sort .sort_right li:eq(0)").find("span").css("background-position","0px -26px");
			$(".mall_sort .sort_right li:eq(1)").find("span").css("background-position","-18px -26px");
			$(".result_box .result_bigpic").show();	
			$(".result_box .result_list").hide();	
		});
		$(".mall_sort .sort_right li:eq(1)").click(function(){
			$(".mall_sort .sort_right li:eq(0)").find("span").css("background-position","0px 0px");
			$(".mall_sort .sort_right li:eq(1)").find("span").css("background-position","-18px 0px");
			$(".result_box .result_bigpic").hide();	
			$(".result_box .result_list").show();
			
		});
	});
</script>
<!--h6-->
<script>
	$(document).ready(function(){
		$(".rzh li h6").hide();
		$(".result_list").on("mouseover",".rzh li",function(){
			$(this).find("h6").show();
		});
		$(".result_list").on("mouseout",".rzh li",function(){
			$(this).find("h6").hide();
		})
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
	//自动加载子类型
	$(document).ready(function(){
		loadSubType($("#material_type").attr("data-id"),"m_type_sub","material");
		loadSubType($("#equipment_type").attr("data-id"),"e_type_sub","equipment");
		loadSubType($("#service_type").attr("data-id"),"s_type_sub","service");
	});
	 function loadSubType(parentId,ulId,divId){
		var str = "";
		var pDiv = $(".s-c-r-r").width()-30-42;//42为不限li的长度
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/selectSubType",
			data:"parentId="+parentId,
			async:false,
			success:function(data){
				var count = 0;
				var i = 1;
				$.each(data,function(index,item){
					var temp = item.name;
					var tempint = parseInt(temp.length*14)+26;//每个li所占长度
					count += tempint;
					if(count < pDiv){
						$('#'+ulId).append("<li data-id="+item.id+" data-pids="+item.pIds+">"+item.name+"</li>");
						
					}else{
						count = 0;
						ulId = ulId + i;
						i++;
						var nextLine ="<div class='level-line'>"
				                      +"<ul id='"+ulId+"' class='second_level'>"
				                      +"<li data-id="+item.id+" data-pids="+item.pIds+">"+item.name+"</li>"
				                      +"</ul>" 
				                      +"<div class='level-div level-erji'><ul class='third_level'></ul></div>"
				                      +"</div>";
						$("#"+divId).append(nextLine);
					}
				})
			}
		})
	}
	$(".level-yiji").on("click",".level-line li",function(){
		var id= $(this).attr("data-id");
		var thisobj = this;
		if(id!=142 && id!=307 && id!=932){
			loadSecondType(id,"m_type_s_sub",thisobj);
		}else{
			$(this).parents(".search-class-row").siblings().find("li").removeClass("li-sel");
			$(this).parent().parent().parent().find("li").removeClass("li-sel");
			$(this).addClass("li-sel");
			$(this).parents(".search-class-row").siblings().find(".level-erji").hide();
			$(this).parents(".level-line").siblings().find(".level-div").hide();
			$(this).parents(".level-line").find(".level-div").hide();
			var li_index=$(this).index();
			$(this).parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();
		}
	});
	function loadSecondType(parentId,ulId,thisobj){
		var str = "";
		//var pDiv = $(".s-c-r-r").width()-30;
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/selectSubType",
			data:"parentId="+parentId,
			async:false,
			success:function(data){
				var count = 0;
				var i = 1;
				var name = "";
				$.each(data,function(index,item){
					name = item.name;
					str += "<li class='li-end' data-id="+item.id+" data-pids="+item.pIds+">"+item.name+"</li>"
				});
				$(thisobj).parent().parent().find(".level-erji ul").html(str);
				
				$(thisobj).parent().parent().find(".level-erji").show();
				$(thisobj).parents(".search-class-row").siblings().find("li").removeClass("li-sel");
				$(thisobj).parent().parent().parent().find("li").removeClass("li-sel");
				$(thisobj).addClass("li-sel");
				$(thisobj).parents(".search-class-row").siblings().find(".level-erji").hide();
				$(thisobj).parents(".level-line").siblings().find(".level-div").hide();
				var li_index=$(thisobj).index();
				$(thisobj).parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();
			}
		})
	}
	var typeFirst = "";
	var proName = "";
	var typeSecond = "";
	var typeThird = "";
	var provId = "" ;
	var orderBy = "";
	var sort = "";
	var sortFlag = false;
	var view = "list";
	//搜索
	$("#search_all").click(function(){
		typeFirst = $("#type_first option:selected").val();
		proName = $("#pro_name").val();
		typeSecond = "";
		typeThird = "";
		provId = "" ;
		orderBy = "";
		sort = "";
		curPage = 1;
		searchProduct();
		$(".level-yiji li").removeClass("li-sel");
		$(".level-erji").hide();
		$(".mall_area li").removeClass("cur_area");
		$(".mall_area li").eq(0).addClass("cur_area");
	});
	//详细搜索
	$(".search-class").on("click",".second_level li",function(){
		typeFirst="";
		proName = "";
		curPage = 1;
		typeSecond = $(this).attr("data-id");
		if(typeSecond==142 || typeSecond==307 || typeSecond==932){
			typeFirst=typeSecond;
			typeSecond= "";
		}
		typeThird = "";
		searchProduct();
	});
	$(".search-class").on("click",".third_level li",function(){
		typeFirst="";
		proName = "";
		typeSecond = "";
		curPage = 1;
		typeThird = $(this).attr("data-id");
		searchProduct();
		
	});
	//地域搜索
	$(".mall_area").on("click","li",function(){
		provId = $(this).attr("data-id");
		searchProduct();
	});
	//综合排序与热门排序
	$(".mall_sort .choese_sort .sort_zh").click(function(){
		var dataMod = $(".mall_sort .choese_sort .cur_sort").attr("data-model");	
		if(dataMod=="1"){
			orderBy="page_view";
			sort="DESC";
		}else{
			orderBy="comprehensive";
			sort="DESC";
		}
		searchProduct();
	});
	//排序方式
	var prevObj = "";
	$("#orderBy_way_2 li").click(function(){
		$(this).find('a').css({'color':'#5EC520'});
		$(this).siblings().find('a').css({'color':'#666'});
		orderBy =  $(this).attr("data-model");
		if(prevObj != this){
			sortFlag = false;
			prevObj = this;
		}
		if(sortFlag){
			sort = "";
			sortFlag = !sortFlag;
		}else{
			sort="DESC";
			sortFlag = !sortFlag;
		}
		curPage = 1;
		searchProduct();
	});
	//显示模式切换
	 var showModel = "list";
	$(".sort_right li").click(function(){
		showModel = $(this).find("a").attr("data-show-model");
		
		if(showModel=="list"){
			view = showModel;
			curPage = 1;
			searchProduct();
		}else{
			view = showModel;
			curPage = 1;
			searchProduct();
		}
	});
	var curPage = "";
	var totalPage ="${countPage}";
	//搜索方法
	function searchProduct(){
		var currentPage = 0;
		var totalRow = 0;
		var str ="";
		var obj = "";
		var auth_flag = 2;//企业认证默认为未认证
		var youyi_flag = 2;//优蚁认证默认为未认证
		var per_flag = 2;//个人认证默认为未认证
		var pageSize = $(".main_bottom").attr("data-pagesize");
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/searchProduct",
			async:false,//异步提交，即在ajax提交时，锁定浏览器页面
			data:"typeFirst="+typeFirst+"&proName="+proName+"&typeSecond="+typeSecond+"&typeThird="+typeThird
				+"&provId="+provId+"&orderBy="+orderBy+"&sort="+sort+"&curPage="+curPage+"&view="+view,
			success:function(data){
				$.each(data,function(index,item){
					if(item.proCount != 0){
						var pic = "";
						//保证图片加载
						if(item.pic1 !=null && item.pic1 != "" && item.pic1 != "undefined"){
							pic = item.pic1;
						}else if(item.pic2 !=null && item.pic2 != "" && item.pic2 != "undefined"){
							pic = item.pic2;
						}else if(item.pic3 !=null && item.pic3 != "" && item.pic3 != "undefined"){
							pic = item.pic3;
						}
						//判断认证结果
						if(item.youyi_flag == "1"){
							youyi_flag = 1;
						}else{
							youyi_flag = 2;
						}
						if(item.auth_flag == "1"){
							auth_flag = 1;
						}else{
							auth_flag = 2;
						}
						if(item.per_flag == "1"){
							per_flag = 1;
						}else{
							per_flag = 2;
						}
						if(showModel=="list"){
							pageSize = 8;
							obj = $(".result_list");
							str +="<div class='list_row' >"
                			+"<div class='list_p' onclick=\"window.open('${ctx}/mall/detail/"+item.id+"')\">"
                				+"<img src='"+pic+"' width='131px' height='131px'>"
                			+"</div>"
                			+"<div class='list_right'>"
                				+"<p class='font_3' onclick=\"window.open('${ctx}/mall/detail/"+item.id+"')\">"+item.pro_name+"</p>"
                				+"<div class='list_aa'>"
                					+"<dl class='font_1 color_1'>"
                						+"<dt>"+(item.pro_desc!=null? item.pro_desc:'').substring(0,70)+" ..."+"</dt>"
                						+"<dd>供应商<span onclick=\"javascript:window.open('${ctx}/homepage/"+item.c_id+"')\">"+(item.company_name==null?'':item.company_name)+"</span><a>地区："+(item.prov_name==null?'无':item.prov_name)+""+(item.city_name==null?'':item.city_name)+"</a></dd>"
                					+"</dl>"
                					+"<ul class='rzh'>"
                						+"<li class='yyrz_"+youyi_flag+"'>&nbsp;<h6>优蚁认证</h6></li>"
                						+"<li class='qyrz_"+auth_flag+"'>&nbsp;<h6>企业认证</h6></li>"
                						+"<li class='xtrz_"+per_flag+"'>&nbsp;<h6>个人认证</h6></li>"
                					+"</ul> "                           	
                				+"</div>"  
                			+"</div>" 
                			+"</div>";
						}else if(showModel=="bigPic"){ 
							pageSize = 20;
							var title="title="+item.pro_name;
							var comNameTitle = "title="+item.company_name;
							obj = $(".result_bigpic");
							str +="<div class='bigpic_1'>"
		                    			+"<img src='"+pic+"' style='width:185px; height:140px'>"
		                    			+"<dl>"
		                    				+"<dt "+((item.pro_name!=null? item.pro_name:'').length>10? title:"")+" onclick=\"window.open('${ctx}/mall/detail?id="+item.id+"')\">"+(item.pro_name!=null? item.pro_name:'').substring(0,10)+"</dt>"
		                    				+"<dd class='font_1 color_1' "+((item.company_name!=null? item.company_name:'').length>13? comNameTitle:'')+" onclick=\"javascript:window.open('${ctx}/homepage/"+item.c_id+"')\">"+(item.company_name!=null? item.company_name:'').substring(0,13)+"</dd>"
		                    			+"</dl>"
		                    			+"<ul class='rzh'>"
		                    				+"<li class='yyrz_"+youyi_flag+"'>&nbsp;</li>"
		                    				+"<li class='qyrz_"+auth_flag+"'>&nbsp;</li>"
		                    				+"<li class='xtrz_"+per_flag+"'>&nbsp;</li>"
		                    			+"</ul>"
		                    		+"</div>";
						}
					}
					 if(showModel=="list"){
						obj = $(".result_list");
					}else if(showModel=="bigPic"){
						obj = $(".result_bigpic");
					}	
					obj.html(str);
					$(".rzh li h6").hide();
					totalPage = Math.ceil(item.proCount/pageSize);
					totalRow = item.proCount;
					currentPage = ((item.curPage)<1? 1:(item.curPage));
				});
				var pageStr = "";
				if(totalPage>0 && currentPage<=totalPage){
					var startPage = currentPage-2;
					if(startPage < 1){
						startPage = 1;
					}
					var endPage=currentPage + 2;
					if (endPage > totalPage){
						endPage = totalPage;
					}
					pageStr = "<div class='filp'>";
					if (currentPage <= 4){
						startPage = 1;
					}
					if ((totalPage-currentPage) < 4){
						endPage = totalPage;
					}
					if( currentPage == 1){
				        pageStr +='<input type="button" value="上一页" style="width:60px;" class="fanye_left"/>';
					}else{
						pageStr +='<input type="button" onclick="goPage('+(currentPage-1)+')" value="上一页" style="width:60px;" class="fanye_left"/>';
					}
					if (currentPage > 4){
						pageStr +='<a href="javascript:goPage('+1+')">1</a>'
								 +'<a href="javascript:goPage('+2+')">2</a><span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>';
					}
					for(var i=startPage; i<=endPage; i++){
						if( currentPage == i){
							pageStr +='<input type="button" value="'+i+'" class="cur_fanye_btn"/>';
						}else{
							pageStr +='<a href="javascript:goPage('+i+')" >'+i+'</a>';
						}
					}
					if ((totalPage - currentPage) >= 4){
						pageStr +='<span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>'
								+'<a href="javascript:goPage('+(totalPage-1)+')">'+(totalPage-1)+'</a>'
								+'<a href="javascript:goPage('+totalPage+')">'+totalPage+'</a>';
					}
					if(currentPage == totalPage){
						pageStr +='<input type="button" value="下一页" style="width:60px;" class="fanye_right"/>';
					}else{
						pageStr +='<input type="button" onclick="goPage('+(currentPage+1)+')" value="下一页" style="width:60px;" class="fanye_right"/>';
					}
					pageStr +='<a>共<span>'+totalRow +'</span>条/<span>'+totalPage+'</span>页</a>'
				        	+'<input type="text" style="width:30px;" value="'+currentPage +'">'
				        	+'<input onclick="jump()" type="button" value="跳转" style="width:60px;">'
							+'</div>';
				}
				$(".fanye").html(pageStr);
			}
		})
	}
	//搜索填充
	$(document).ready(function(){
		if('${typeFirst}'!=null && '${typeFirst}'!=""){
			$(".header_search select option[value="+'${typeFirst}'+"]").prop("selected",true);
		}
	});
	//点击跳转页
	function goPage(pageNum){
		curPage = pageNum;
		searchProduct();
	}
	//跳转
	function jump(){
		curPage =$(".filp :text:last").val();
		if(parseInt(curPage) <= parseInt(totalPage)){
			searchProduct();
		}
	}
	//回车键搜索
	$(".header_search .h_s_middle input").focus(function(){
		$(document).on("keydown",function(e){
			var ev = document.all ? window.event : e;
			if(ev.keyCode==13) {
				var value = $(".header_search .h_s_middle input").val();
				value = value.replace(/(\s*$)/g, "");
				if(value!=""){
					typeFirst = $("#type_first option:selected").val();
					proName = $("#pro_name").val();
					typeSecond = "";
					typeThird = "";
					provId = "" ;
					orderBy = "";
					sort = "";
					curPage = 1;
					searchProduct();
					$(".level-yiji li").removeClass("li-sel");
					$(".level-erji").hide();
					$(".mall_area li").removeClass("cur_area");
					$(".mall_area li").eq(0).addClass("cur_area");
				}
		    }
		})
	});
	$(".header_search .h_s_middle input").blur(function(){
		$(document).unbind("keydown");
	});
	$(function(){
		var urlPara = '${urlPara}';
		if(urlPara != ''){
			var para =urlPara.split(",");
			var li = $(".second_level li");
			var len = li.length;
			for(var i=0;i<len;i++){
				var dataId = li.eq(i).attr("data-id");
				if(dataId == para[0]){
					li.eq(i).click();
				}
			}
			if(para.length > 1){
				var li = $(".third_level li");
				var len = li.length;
				for(var i=0;i<len;i++){
					var dataId = li.eq(i).attr("data-id");
					if(dataId == para[1]){
						li.eq(i).click();
					}
				}
			}
		}
	});
</script>
</body>
</html>