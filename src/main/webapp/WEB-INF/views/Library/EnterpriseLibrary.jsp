<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>优蚁环保-企业库，优蚁环保企业库汇集优秀环保公司</title>
<meta name="keywords" content="优蚁环保,企业库,环保公司" />
<meta name="description" content="优蚁环保汇集专业的环保公司供您挑选，了解服务价格、查看服务案例、寻找环保公司，就来优蚁环保！优蚁环保是企业和用户的最佳选择">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>
/*头部中部start*/
.header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
.header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
.header_middle .header_search .h_s_middle{float:left;}
.header_middle .header_search .h_s_middle input{width:280px;}
.header_middle .header_search .h_s_middlebefore{z-index:1;content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
.header_right{margin-top: 30px;}
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
.mall_area .area_cont li:hover a{color:#5ec420;}
.mall_area .area_cont .cur_area{color:#5ec420;}

/*排序方式*/
.mall_sort{border:1px solid #ccc; line-height:30px; height:30px; margin-bottom:15px;}
.mall_sort .choese_sort{float:left; border-right:1px solid #ccc; padding:0px 10px; position:relative; cursor:pointer;}
.mall_sort .choese_sort .cur_sort{/*background-image:url(${ctxStatic}/img/llhb/select_down.png);*/ background-repeat:no-repeat; background-position:right center; width:80px; color:#ee7800;}
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
.mall_ad a{width:188px; height:180.6px;display:block; margin-bottom:6px; cursor:pointer;}
.mall_ad a img{width:100%;height:100%;}

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

/*列表*/
.result_list{width:798px;}
.result_list .list_row{width:776px; min-height:140px; border:1px solid #ccc; padding:10px 0 10px 10px; overflow:hidden; margin-bottom:6px;}
.result_list .list_row:hover{border:1px solid #5cb531;}
.qiyeku_l_r_l{float:left;}
.q-list-l-l{float:left;font-size: 12px;margin-top:20px;}
.q-list-l-l img{display: block;height:52px;width:167px;}
.q-list-l-l p{text-align: center;color:#666;margin-top: 30px;}
.q-list-l-l p span{color:#ee7800;}

.q-list-l-r{float:left;margin-left: 5px;width: 460px;}

.q-l-l-r-top p{float:left;font-size: 18px;margin-top: 2px;font-family: "黑体"}
.renzhengpicdiv{float:right;margin-right: 6px;}
.renzhengpicdiv>div{position:relative;float:left;margin-left: 15px;width:25px;height:25px;background:url(${ctxStatic}/img/llhb/renzheng_2.png) 0 0 no-repeat;}
.renzhengpicdiv .rzpd-you{background-position: 0 -35px;}
.renzhengpicdiv .rzpd-qi{background-position: -30px -35px;}
.renzhengpicdiv .rzpd-tong{background-position: -59px -35px;}
.renzhengpicdiv .rzpd-you.rz-active{background-position: 0 0;}
.renzhengpicdiv .rzpd-qi.rz-active{background-position: -30px 0;}
.renzhengpicdiv .rzpd-tong.rz-active{background-position: -59px 0;}
.renzhengpicdiv>div h6{display:none;position:absolute;left:-10px; bottom:-20px; z-index:2;color:#5cb531; border:1px solid #5cb531;  line-height:14px; font-size:12px; width:54px; text-align:center;}
.q-l-l-r-mid{margin-top: 15px;overflow: hidden;}
.q-l-l-r-mid p{float:left;width:200px;margin-right: 10px;color:#666;}
.q-l-l-r-mid .q-l-l-r-mid-span{color:#333;font-family: "黑体"}

.q-l-l-r-btns{margin-top: 15px;}
.q-l-l-r-btns a{display: inline-block;width: 80px;text-align: center;height: 30px;line-height: 30px;color: rgb(255, 255, 255);background-color: #ee7800;margin-right: 10px;}
.q-l-l-r-btns>img{margin-left:42px;}
.q-l-l-r-btns>span{margin-left:5px;width:200px;float:right;border:0px solid red;margin-top:6px;}
.q-l-l-r-bottom{margin-top: 15px;font-family: "黑体"}
.q-l-l-r-bottom>*{float:left;}
.q-l-l-r-bottom span{margin:2px 10px;}

.qiyeku_l_r_r{float:right;width:125px;text-align: center;color:#666;margin-top:30px;border-left: 1px solid #ccc;}
.qiyeku_l_r_r .koubei{font-size: 40px;color:#ee7800;margin: 15px 0px;}

.q-l-l-r-mid-span-span {float:right;width:140px;margin-right:10px;}

/*发布需求弹出框样式start */
.require-box{width:298px;height:370px;background-color: #FFFFFF;border: 1px solid #CCC;font-family: "微软雅黑";position: absolute;z-index: 11;top: 35px;left: 233px;display:none;}
.rb-item{margin-top: 6px;margin-left: 32px;position: relative;}
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
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>

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
        <div class="header_middle" style="height: 145px;">
            <h1 class="header_logo">
                <a href="${ctx }/index">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <div class="h_s_middle font_1" style="width: 540px;">
                	<span class="h_s_middlebefore"></span>
                    <input type="search" placeholder="请输入你要搜索的企业名称" id="enterpriseValue" value="${enterprise}" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" onclick="searchEnterprise()" style="margin-left:-1px;">搜索</a>
                    <a class="font_3 showRequireBox" href="javascript:void(0);" onclick="window.open('${ctx}/addNeed');" style="width:135px; margin-left:50px;background-color:#ee7800;" >发布环保需求</a>
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
            </div>
           <%--<div class="header_right">
               &lt;%&ndash; <img src="${ctxStatic}/img/llhb/mall_tel.png">&ndash;%&gt;
            </div>--%>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
    <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>企业库
            </div>
        </div>
        <!-- 首页通用标题 -->
        <div class="shouye-title font_3">
            <span class="shouye-title-left">企业分类</span>
        </div>
        <!-- 搜索分类模块开始  -->
        <div class="search-class">
            <!-- 第一行分类 -->
            <div class="search-class-row" style="margin-top: 10px;">
                <div class="s-c-r-l">分类</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul>
                                <li class="li-end" onclick="fenlei(this)" data-value="不限">不限</li>
                                <li class="li-end" onclick="fenlei(this)" data-value="产生废物">产生废物</li>
                                <li class="li-end" onclick="fenlei(this)" data-value="处置废物">处置废物</li>
                                <li class="li-end" onclick="fenlei(this)" data-value="环保服务">环保服务</li>
                                <li class="li-end" onclick="fenlei(this)" data-value="其他">其他</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第一行分类 结束 -->
        </div>
        <!-- 搜索模块结束 -->
        <!--所在地start-->
        <div class="mall_area">
            <div class="area_tit">
                <a>所在地</a>
            </div>
            <ul class="area_cont font_1 color_1">
                <li><a href="javascript:void(0)" onclick="proName(this)" data-index="0" class="cur_area">不限</a></li>
                <c:forEach items="${pro}" var="pro">
                    <li>
                        <a href="javascript:void(0)" onclick="proName(this)" data-index="${pro.id}">${pro.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <!--所在地end-->
        <!--排序方式start-->
        <div class="mall_sort font_1 color_1">
            <ul class="choese_sort">
                <li class="cur_sort">热门排序</li>
                <%--<li class="sort_zh">综合排序</li>--%>
            </ul>
            <ul class="sort_1">
                <li><a id="descSj">更新时间</a></li>
                <%--<li><a id="descJg">价格</a></li>--%>
                <li><a id="descRq">人气</a></li>
                <%--<li><a id="descXy">信誉</a></li>
                <li><a id="descXl">销量</a></li>--%>
            </ul>

        </div>
        <div class="main_bottom">
            <!--筛选结果start-->
            <div class="result_box">
                <div class="result_list">
                    <c:forEach items="${Library}" var="Library">

                        <!--qiyeku_list start-->
                        <div class="list_row">
                            <div class="qiyeku_l_r_l clearfix">
                                <div class="q-list-l-l">
                                    <c:choose>
                                        <c:when test="${Library.logoImg!=null}">
                                            <a href="javascript:void(0)" onclick="hrefEnterprise(${Library.id})"> <img
                                                    src="${Library.logoImg}" alt=""></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:void(0)" onclick="hrefEnterprise(${Library.id})"> <img
                                                    src="${ctxStatic}/img/llhb/qiyeku01.png" alt=""></a>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${Library.zixunNum!=null}">
                                            <img src="${Library.zixunNum}" alt="">
                                        </c:when>
                                        <c:otherwise>
                                            <p>已有<span>0</span>人咨询</p>
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                                <div class="q-list-l-r clearfix">
                                    <div class="q-l-l-r-top clearfix">
                                        <p><a href="javascript:void(0)"
                                              onclick="hrefEnterprise(${Library.id})">${Library.companyName}</a></p>
                                        <div class="renzhengpicdiv clearfix">
                                            <c:choose>
                                                <c:when test="${Library.youyiFlag!=1}">
                                                    <div class="rzpd-you"><h6>优蚁认证</h6></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rzpd-you rz-active"><h6>优蚁认证</h6></div>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${Library.authFlag!=1}">
                                                    <div class="rzpd-qi"><h6>企业认证</h6></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rzpd-qi rz-active"><h6>企业认证</h6></div>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${Library.xFlag!=1}">
                                                    <div class="rzpd-tong"><h6>个人认证</h6></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rzpd-tong rz-active"><h6>个人认证</h6></div>
                                                </c:otherwise>
                                            </c:choose>


                                        </div>
                                    </div>
                                    <div class="q-l-l-r-mid">
                                        <p style="width:220px;">
                                            <span class="q-l-l-r-mid-span" style="color:#5ec420">主营行业:</span>
                                            <span class="q-l-l-r-mid-span-span tmui-ellipsis" >${Library.major }</span>
                                        </p>
                                        <p >
                                            <span class="q-l-l-r-mid-span" style="color:#5ec420">标签:</span>
                                            <span class="q-l-l-r-mid-span-span tmui-ellipsis" style="width:148px;">${Library.comLabel }</span>
                                        </p>
                                        <p style="width:220px;">
                                            <span class="q-l-l-r-mid-span" style="color:#5ec420">城市:</span>
                                            <span>${Library.prov}/${Library.city}</span>
                                        </p>
                                        <p style="width:220px;">
                                            <span class="q-l-l-r-mid-span" style="color:#5ec420">详细地址:</span>
                                            <span class="q-l-l-r-mid-span-span tmui-ellipsis">${Library.address }</span>
                                        </p>
                                    </div>
                                    <div class="q-l-l-r-btns">
                                        <a href="javascript:void(0);" onclick="chanpin(${Library.id})">查看产品</a>
                                        <a href="javascript:void(0);" onclick="liuyan(${Library.id})">在线留言</a>
                                        <img src="${ctxStatic}/img/llhb/qiyeku03.png" alt="">
                                        <span>${Library.phone}</span>
                                    </div>

                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="qiyeku_l_r_r">
                                <p>口碑值</p>
                                <p class="koubei">180</p>
                                <p>好评率: <span>100%</span></p>
                            </div>
                        </div>

                    </c:forEach>
                    <!--qiyeku_list end-->
                </div>
                <div class="fanye font_1 color_1">
                    <c:set var="currentPage" value="${recordPage.pageNumber}"/>
                    <c:set var="totalPage" value="${recordPage.totalPage}"/>
                    <c:set var="actionUrl" value="${ctx}/EntLib/"/>
                    <c:set var="pageSize" scope="page" value="${recordPage.pageSize}"/>
                    <c:set var="totalRow" scope="page" value="${recordPage.totalRow}"/>
                    <c:if test="${descSj!=null && descSj !=null && descRq!=null && fenlei!=null && provs!=null && enterprise!=null}">
                        <c:set var="urlParas"
                               value="?descSj=${descSj}&descRq=${descRq}&fenlei=${fenlei}&prov=${provs}&enterprise=${enterprise}"/>
                    </c:if>
                    <%@ include file="/WEB-INF/views/pager/_paginateYP4mall.jsp" %>
                </div>
            </div>
            <div class="mall_ad">
                <c:forEach items="${imagesList}" var="imagesList">
                    <c:choose>
                        <c:when test="${imagesList.redirctHref!=null&&imagesList.redirctHref!=''}">
                            <a href="" onclick="window.open('${imagesList.redirctHref}')"><img src="${imagesList.pic}"></a>
                        </c:when>
                        <c:otherwise>
                            <a><img src="${imagesList.pic}"></a>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </div>
        </div>
        <!--筛选结果end-->

    </div>

</div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
	<%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
    <!--底部下部信息 end-->
</footer>
<!--底部 end-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
$(function(){
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
          $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
      }
    });
    $(".content").click(function(){
        go('固废供求-副本-9-17.html');
    });
})
</script>
<!--图标提示-->
<script>
$(function(){
	$(".rzpd-you,.rzpd-qi,.rzpd-tong").mouseover(function(){
		$(this).find("h6").show();
	}).mouseout(function(){
		$(this).find("h6").hide();
	});
});
$(function(){
    search_class();
    $(".mall_ad a").height($(".list_row").outerHeight());
});
function search_class(){
    $(".search-class ul li").click(function(){
        $(this).parents(".search-class-row").siblings().find("li").removeClass("li-sel");
        $(this).parent().parent().parent().find("li").removeClass("li-sel");
        $(this).addClass("li-sel");
        var li_index=$(this).index();
        //其他row上隐藏
        $(this).parents(".search-class-row").siblings().find(".level-erji,.level-sanji").hide();
        //本行 其他line隐藏
        $(this).parents(".level-line").siblings().find(".level-div").hide();
        //本line 其他同级leveldiv隐藏
        $(this).parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();

        $(this).parent().parent().children(".level-div").eq(li_index).show();
    });
}
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
        var tamp;
        tamp=$(this).html();
        $(this).html($(".mall_sort .choese_sort .cur_sort").html());
        $(".mall_sort .choese_sort .cur_sort").html(tamp);
        $(this).hide();
    });
    //前后切换

    $(function(){
    	var descSj='${descSj}';
		var descRq='${descRq}';
        $(".sort_1 li").click(function(){
            $(this).find("a").toggleClass("up_down");
            descS(this);
        });
    });

</script>

<!--翻页-->
<script>
  	//上一页
	$(".fanye_left").click(function(){
		var descSj='${descSj}';
		var descRq='${descRq}';
        var fenlei = '${fenlei}';
        var prov = '${provs}';
        var enterprise = '${enterprise}';
		if('${currentPage}'!=1){
			//window.location.href="${actionUrl}${currentPage - 1}${urlParas}";
            postStandUrl('${actionUrl}',{'pageNum':'${currentPage - 1}','descSj':descSj,'descRq':descRq,'fenlei':fenlei,'prov':prov,'enterprise':enterprise})
		}
	});
	//下一页
	$(".fanye_right").click(function(){
        var descSj='${descSj}';
        var descRq='${descRq}';
        var fenlei = '${fenlei}';
        var prov = '${provs}';
        var enterprise = '${enterprise}';
		if('${currentPage}'!='${totalPage}'){
			//window.location.href="${actionUrl}${currentPage + 1}${urlParas}";
            postStandUrl('${actionUrl}',{'pageNum':'${currentPage + 1}','descSj':descSj,'descRq':descRq,'fenlei':fenlei,'prov':prov,'enterprise':enterprise})

        }
	});
	//跳转
	 $(" .filp input:last").click(function(){
		var text = $(".filp :text:last").val();
		var re = /^[0-9]+$/;
		if(re.test(text) && parseInt(text)<='${totalPage}'){
			//window.location.href='${actionUrl}'+text+'${urlParas}';
            postStandUrl('${actionUrl}',{'pageNum':text,'descSj':descSj,'descRq':descRq,'fenlei':fenlei,'prov':prov,'enterprise':enterprise})

        }

	});

    function fenyeTiao(pageNum){
        var descSj='${descSj}';
        var descRq='${descRq}';
        var fenlei = '${fenlei}';
        var prov = '${provs}';
        var enterprise = '${enterprise}';
        postStandUrl('${actionUrl}',{'pageNum':pageNum,'descSj':descSj,'descRq':descRq,'fenlei':fenlei,'prov':prov,'enterprise':enterprise})

    }
	/* $(".area_cont li a").mouseover(function(){
		 $(this).addClass("cur_area").parent().siblings().find("a").removeClass("cur_area");
	}); */
	//所在地查询
	function proName(obj){
	    var descSj='${descSj}';
	    var descRq='${descRq}';
	    //location.href="${ctx}/EntLib?prov="+$(obj).attr("data-index")+"&fenlei="+$(".search-class ul .li-sel").text()+"&enterprise="+ $("#enterpriseValue").val()+"&fenlei="+$(".search-class ul .li-sel").text()+"&descSj="+descSj+"&descRq="+descRq+"";
        postStandUrl("${ctx}/EntLib",{"enterprise":$("#enterpriseValue").val(),"fenlei":$(".search-class ul .li-sel").text(),"prov":$(obj).attr("data-index"),"descSj":descSj,"descRq":descRq});
        $(obj).addClass("cur_area").parent().siblings().find("a").removeClass("cur_area");
	}
	$(function(){
		var str='${provs}';
		$(".area_cont li a[data-index='"+str+"']").addClass("cur_area").parent().siblings().find("a").removeClass("cur_area");
		var descSj='${descSj}';
		var descRq='${descRq}';
		var fenlei='${fenlei}';
		$(".search-class ul li[data-value='"+fenlei+"']").addClass("li-sel");
		if(descSj=='1'){
			 $("#descSj").addClass("up_down");
			 $("#descSj").css("color","green");
		}else if(descSj=='2'){
			$("#descSj").removeClass();
			$("#descSj").css("color","green");
		}
		if(descRq=='1'){
			$("#descRq").addClass("up_down");
		    $("#descRq").css("color","green");
		}else if(descRq=='2'){
			$("#descRq").removeClass();
		    $("#descRq").css("color","green");
		}
	});

	//企业查询
	function searchEnterprise(){
        var descSj='${descSj}';
        var descRq='${descRq}';
        var enterprise = $("#enterpriseValue").val();
        var fenlei = $(".search-class ul .li-sel").text();
        var prov = $(".area_cont li .cur_area").attr("data-index");
        var flag = 1;
        postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov,"descSj":descSj,"descRq":descRq,"flag":flag});
	}
	//企业分类
	function fenlei(obj){
		var descSj='${descSj}';
		var descRq='${descRq}';
        postStandUrl("${ctx}/EntLib",{"enterprise":$("#enterpriseValue").val(),"fenlei":$(obj).text(),"prov":$(".area_cont li .cur_area").attr("data-index"),
            "descSj":descSj,"descRq":descRq});
	}
	//排序
	function descS(obj){
        var enterprise = $("#enterpriseValue").val();
        var fenlei = $(".search-class ul .li-sel").text();
        var prov = $(".area_cont li .cur_area").attr("data-index");

		if($(obj).find("a").text()=="更新时间"){
			if($(obj).find("a").hasClass("up_down")){
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descSj":1});
			}else{
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descSj":2});

            }
		}else if($(obj).find("a").text()=="价格"){
			if($(obj).find("a").hasClass("up_down")){
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descJg":1});

            }else{
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descJg":2});

            }
		}else if($(obj).find("a").text()=="人气"){
			if($(obj).find("a").hasClass("up_down")){
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descRq":1});
			}else{
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descRq":2});

            }
		}else if($(obj).find("a").text()=="信誉"){
			if($(obj).find("a").hasClass("up_down")){
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descXy":1});

            }else{
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descXy":2});
            }
		}else if($(obj).find("a").text()=="销量"){
			if($(obj).find("a").hasClass("up_down")){
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descXl":1});
            }else{
                postStandUrl("${ctx}/EntLib",{"enterprise":enterprise,"fenlei":fenlei,"prov":prov, "descXl":2});
            }
		}
	}
	  $(document).ready(function(){
		  $(".header_nav ul li").eq(5).addClass("header_nav_sel");
	  });
	  function hrefEnterprise(obj){
		  window.open("${ctx}/homepage/"+obj+"");
	  }
	  function chanpin(obj){
		  window.open("${ctx}/homepage/products/"+obj+"");
	  }
	  function liuyan(obj){
		  window.open("${ctx}/homepage/contact/"+obj+"");
	  }
	  $(document).keypress(function(e) {
		    // 回车键事件
		       if(e.which == 13) {
		    	   searchEnterprise();
		       }
      });
    function tiaoZhuan(){

    }
</script>
</body>
</html>


