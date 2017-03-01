<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>环保业务需求</title>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/hbxuqiu_index.css"/>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
    .mg-t60{margin-top: 60px;}
    .mg-l15{margin-left: 15px;}
    .mg-t15{margin-top: 15px;}
    .mg-l30{margin-left: 30px;}
    .mg-l40{margin-left: 40px;}
    
    /*底部开始*/
    .gyqg-main-b{margin-top: 15px;overflow: hidden;margin-bottom: 100px;}
    .main-l740{width:740px;float:left;overflow: hidden;}
    .main-r240{width:240px;float:left;margin-left: 20px;overflow: hidden;}
    
    /*排序方式*/
    .mall_sort{border:1px solid #ccc; line-height:30px; height:30px; margin-bottom:15px;width:100%;}
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


    .main_bottom{overflow:hidden;clear:both;}
    /*筛选结果*/
    .result_box{float:left;}
    /*列表*/
    .result_list{width:764px;}
    .result_list .list_row{width:742px; height:131px; border:1px solid #ccc; padding:24px 10px; margin-bottom:6px;}
    .result_list .list_row:hover{border:1px solid #5cb531;}
    .result_list .list_row .list_p{float:left; margin-right:10px;cursor:pointer;}
    .result_list .list_row .list_right{float:right; width:600px;}
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
    .result_list .list_row .list_right .list_aa .rzh h6{position:absolute;left:-10px; bottom:-20px; z-index:2;color:#5cb531; border:1px solid #5cb531;  line-height:14px; font-size:12px; width:54px; text-align:center;background-color:#fff;}

    /*大图*/
    .result_bigpic{width:764px;margin-bottom: 20px;overflow: hidden;}
    /*图片信息块*/
    .pic-info-div{float:left;width:181px;height:238px;border:1px solid #ccc;overflow: hidden;margin-top: 15px;margin-right: 10px;cursor: pointer;}
    .pic-info-div:nth-child(4n){margin-right: 0;}
	.ie8 .pic-info-div{margin-right:6px;}

    /*翻页*/
    .fanye{margin-top:20px; margin-bottom:20px;overflow:hidden;}
    .fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
    .fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
    .fanye input[type=text]:focus{border:1px solid #ee7800;}
    .fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
    .fanye .fanye_btn input{width:30px;}
    .fanye .filp .cur_fanye_btn {
        background-color: #5cb531;
        width: 30px;
        border: 1px solid #5cb531;
        color: white;
    }

    /*右侧广告*/
    .mall_ad{width:220px; float:right;}
    .mall_ad a{width:188px; display:block; margin-bottom:10px; cursor:pointer;}
    .mall_ad a img{width:100%;}

    /*推荐商家-两列样式*/
    .tuijianshangjia-col{height:377px;border:1px solid #ccc;margin-top: 10px;}
    .per-tjsj{float:left;width:118px;height:75px;position: relative;cursor: pointer;}
    .per-tjsj:hover .per-mask{display: block;}
    .per-tjsj:nth-child(even){border-bottom: 1px solid #ccc;border-left: 1px solid #ccc;}
    .per-tjsj:nth-child(odd){border-bottom: 1px solid #ccc;width:119px;}
    .per-tjsj img{width:100%;height:100%;}
    .per-tjsj .per-mask{position: absolute;top:0;left: 0;width:120px;height:75px;background-color: rgba(0,0,0,0.8);display: none;}
    .per-tjsj .per-mask p{color:#fff;text-align: center;margin-top:25%;font-size: 12px;}

    .c1_m_left{float:left;width:235px; margin-bottom:20px;}

    .tj_box{margin-top:20px;}
    .tj_1{width:235px; margin-bottom:10px; overflow:hidden;}
    .qy_1{margin-bottom:15px;width:108px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
    .qy_1 img{height:100%;width:100%;}
    .qy_1:hover p,.qy_1:hover a{display:block;}
    .qy_1 p{width:100%; height:100%; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;}
    .qy_1 a{width:108px;text-align:center; font-size:12px;position:absolute; left:0; top:0; color:white; display:none;line-height:68px;}

     /*图片信息块页面内*/
    .pic-info-div:nth-child(-n+4){margin-top:0;}
	.list_p img{width:130px;height:130px;}
	.hide{display:none;}
	.show{display:block;}
	.secondType{color:#5EC520;}
	.sel2 a{color:#5EC520;}

    .result_box table {border: 0px solid #CCC;table-layout:fixed;empty-cells:show;border-collapse: collapse;margin:0 auto;padding: 0;}
    .result_box table thead tr{height:80px;text-align: center;font-weight:bold;}
    .result_box table thead tr th {height:80px;text-align: center;font-weight:bold;
        border-right: 0px solid #CCC;
        border-bottom: 0px solid #CCC;
        border-top: 0px solid #CCC;
        letter-spacing: 2px;
        text-transform: uppercase;
        padding: 2px 2px 2px 2px;
        background: #BEEAA4  no-repeat; }
    .result_box table tbody tr{
        height:80px;

    }
    .result_box table tbody tr td {
        height:40px;
        font-size: 12px;
        border-right: 0px solid #CCC;
        border-bottom: 1px dashed #CCC;
        border-top: 0px solid #CCC;
        letter-spacing: 2px;
        text-transform: uppercase;
        padding: 2px 2px 2px 2px;
    }

    .result_box table tbody tr:hover {
        background-color: #eee;
    }



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
	                <option value="1">环保需求</option>
	            </select>
	            <div class="h_s_middle font_1">
	                <input value="${title }" type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;" id="title" />
	                <a id="header_search" class="font_3" href="javascript:sou();" style="margin-left:-1px;">搜索</a>
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
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>环保需求
            </div>
            <a href="http://hbxq.yyhb365.com/youyipc.html" target="_blank" class="btn cur_position_btn"style="margin-right: 0;background-color: #ee7800;" >发布环保需求</a>
        </div>
        
        <!-- 搜索分类模块开始  -->
        <div class="search-class">
            <!-- 第一行行业分类 -->
            <div class="search-class-row">
                <div class="s-c-r-l">环保类型</div>
                <c:set var="firstId" value="${solids[0].id }"/>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>
                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul id="firstType">
                            	<li class="" data-index="">不限</li>
                                <c:forEach items="${hbTypes}" var="hbType" >
                                    <c:if test="${hbType.name eq type}">
                                        <li class="li-sel" data-index="${hbType.name }">${hbType.name}</li>
                                    </c:if>
                                    <c:if test="${hbType.name ne type}">
                                        <li data-index="${hbType.name }">${hbType.name}</li>
                                    </c:if>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第一行 结束 -->
        </div>
        <!-- 搜索模块结束 -->
        
        
        <!--排序方式start-->
   <%--     <div class="mall_sort font_1 color_1">
        	<input id="rank" value="list" type="hidden" />
        	<input id="order" value="" type="hidden" />
            <ul class="sort_1">
                <li class="sel2" onclick="order('time desc',0)"><a>更新时间</a></li>
            </ul>
        </div>--%>
        <div class="main_bottom">
        	<div class="result_box" id="list" style="width: 742px;margin-top: 10px;">
                <table style="width:100%;">
                    <thead>
                    <tr>
                        <th style="width: 80px;">环保业务</th>
                        <th style="width: 70px;">联系人</th>
                        <th style="width: 90px;">联系方式</th>
                        <th style="width: 160px;">公司名称</th>
                        <th style="width: 170px;">需求描述</th>
                        <th style="width: 80px;">需求状态</th>
                        <th style="width: 90px;">需求时间</th>
                    </tr>
                    </thead>
                    <tbody id="tbd">
                        <c:forEach items="${page.list}" var="demand">
                            <tr onclick="goDetail('${demand.id}','${demand.trade_status}')">
                                <td>${demand.remarks}</td>
                                <td>${demand.name}</td>
                                <td>${demand.phone}</td>
                                <td style='text-align: center;'>${demand.company_name}</td>
                                <td style='text-align: center;'>${demand.requirement_describe}</td>
                                <c:choose>
                                    <c:when test="${demand.status == '已解决'}">
                                        <td style='color:red;'>${demand.trade_status}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td >${demand.trade_status}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${demand.create_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!--筛选结果end-->
            <div class="mall_ad" style="float:right;">
                <!-- 商家推荐 -->
                <div class="c1_m_left">
                    <div style="margin-top:0px;height:25px;border-bottom: 1px solid #ccc;">
                        <span class="font_3" style="float:left;margin-top: -1px;height:25px;line-height: 25px;border-bottom: 3px solid #5EC520;position: relative;">推荐商家</span>
                    </div>
                    <div class="tj_box">
                    	<c:forEach items="${ads }" var="ads">
                    		<div class="qy_1">
                    			<img src="${ads.addr }"/>
								<c:if test="${not empty ads.imgname}"><p>&nbsp;</p></c:if>
								<c:choose>
									<c:when test="${empty ads.href}"><a href="javascript:void(0);">${ads.imgname}</a></c:when>
									<c:otherwise>
										<c:if test="${not empty ads.imgname}"><a target="blank" href="${ads.href }">${ads.imgname} </a></c:if>
                                  		<c:if test="${empty ads.imgname}"><a target="blank" href="${ads.href }">&nbsp;</a></c:if>
									</c:otherwise>
								</c:choose>
                              </div>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="fanye font_1 color_1" style="border:0px solid red;">
            <c:set var="currentPage" value="${page.pageNumber}"/>
            <c:set var="totalPage" value="${page.totalPage}"/>
            <c:set var="actionUrl" value="${ctx}/solidsupply/hbDemandQuery"/>
            <c:set var="pageSize" scope="page" value="${page.pageSize}"/>
            <c:set var="totalRow" scope="page" value="${page.totalRow}"/>
            <%@ include file="/WEB-INF/views/pager/_paginateYP4demand.jsp" %>
        </div>
    </div>
</div>
<!--中间部分end-->

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
<script>
    $(function () {
        $(".mall_sort .choese_sort .sort_zh").hide();
        populayer_fn();
        var contentNavArr = [];
        var ad_top = $(".header_banner").each(function () {
            contentNavArr.push($(this).offset().top);
        });
        /*滚动条事件*/
        $(window).scroll(function () {
            /*左右悬窗定位*/
            if ($(window).scrollTop() > contentNavArr[0]) {
                $(".nav_bottomlist").show();
                $(".gf_ad_left,.gf_ad_right").css({position: "fixed", top: "95px"});
            } else if ($(window).scrollTop() <= contentNavArr[0]) {
                $(".nav_bottomlist").hide();
                $(".gf_ad_left,.gf_ad_right").css({position: "absolute", top: "311px"});
            }
        });
        $(".header_nav ul li").eq(2).addClass("header_nav_sel");    });
    $(document).ready(function () {
        if ('${type}' != "" && '${type}' != "null") {
            var li_index = $("#firstType .li-sel").attr("data-index");
            if (li_index == undefined) {
                $("#firstType li").eq(0).addClass("li-sel");
                //list(1, '');
            } else {
                $('#' + li_index).addClass("show");
                //list(1, 1);
            }
        } else {
            $("#firstType li").eq(0).addClass("li-sel");
            //list(1, '');
        }
        //底部尖角样式list切换
        $(".change-list-bottomstyle a").click(function () {
            $(this).addClass("sel-bstyle").parent().siblings().find("a").removeClass("sel-bstyle");
        });
        //综合排序、热门排序切换
        $(".mall_sort .choese_sort .cur_sort").click(function () {
            $(".mall_sort .choese_sort .sort_zh").show();
        });
        $(".mall_sort .choese_sort").mouseleave(function () {
            $(".mall_sort .choese_sort .sort_zh").hide();
        });
        $(".mall_sort .choese_sort .sort_zh").click(function () {
            var tamp = $(this).html();
            if (tamp == "热门排序") {
                $(".sort_1 li").eq(2).addClass("sel2").siblings().removeClass("sel2");
                order('s.page_view desc');
            } else if (tamp == "综合排序") {
                $(".sort_1 li").eq(0).addClass("sel2").siblings().removeClass("sel2");
                order('time desc');
            }
            $(this).html($(".mall_sort .choese_sort .cur_sort").html());
            $(".mall_sort .choese_sort .cur_sort").html(tamp);
            $(this).hide();
        });
        $(".search-block-b-btns a").click(function () {
            $(this).addClass("s-c-b-sel").siblings().removeClass("s-c-b-sel");
        });
        //点击一级分类
        $("#firstType li").on("click", function () {
            $(this).addClass("li-sel").siblings().removeClass("li-sel");
            var li_index = '#' + $(this).attr("data-index");
            $(".show").removeClass("show");
            $(li_index).addClass("show");
            $(".secondType").removeClass("secondType");
            var i = $(this).index();
            var type = $(".li-sel").attr("data-index");
            var title2 = $("#title").val();
            if (i == 0) {
                //list(1, '');
                //getSupplyNum();

                postStandUrl('${actionUrl}',{'pageNum':1,'title':title2,'type':''})
            } else {
                //list(1, 1);
                //getSupplyNum();
                postStandUrl('${actionUrl}',{'pageNum':1,'title':title2,'type':type})
            }
        });
        //翻页
        $(".fanye .fanye_left").mousedown(function () {
            var totlePage = parseInt($(".fanye a span").eq(1).html());
            var currentPage = parseInt($(".cur_fanye_btn").val()) - 1;
            if (currentPage >= 1) {
                fenyeTiao(currentPage);
            } else {
                showMess("当前已是第一页！");
            }
            //$("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
        });
        $(".fanye .fanye_right").mousedown(function () {
            var totlePage = parseInt($(".fanye a span").eq(1).html());
            var currentPage = parseInt($(".cur_fanye_btn").val()) + 1;
            if (currentPage <= totlePage) {
                fenyeTiao(currentPage);
            } else {
                showMess("当前已是最后一页！");
            }
            //$("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
        });
        //跳转
        $("#tiaozhuan").on("click", function () {
            var totlePage = parseInt($(".fanye a span").eq(1).html());
            var currentPage = parseInt($("#tiaozhuantext").val());
            if (currentPage <= totlePage && currentPage >= 1) {
                fenyeTiao(currentPage);
            } else {
                showMess("跳转页数超出范围！");
            }
            //$("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
        });
        $('.header_search input').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                sou();
            }
        });

    });

    var supplyList = {};
    supplyList.isEmpty = function (obj) {
        for (var o in obj) {
            return false;
        }
        if (obj == "") {
            return true;
        } else {
            return false;
        }
    };

    //加载列表
    function list(pageNum, remark) {
        var type = $(".li-sel").attr("data-index");
        var title = $("#title").val();
        var order = $("#order").val();
        var rank = $("#rank").val();
        $.ajax({
            type: "POST",
            url: "${ctx}/solidsupply/hbDemandPage",
            data: "pageNum=" + pageNum + "&type=" + type + "&title=" + title,
            dataType: 'json',
            success: function (data) {
                $("#tbd").empty();
                if (data.list.length == 0) {
                    return false;
                }
                var tbodyHtml = "";
                $(data.list).each(function(index,item){
                    tbodyHtml += "<tr onclick='goDetail("+item.id+",\""+item.trade_status+"\")'>";
                    tbodyHtml += "<td>"+item.remarks+"</td>";
                    tbodyHtml += "<td>"+hideName(item.name,1)+"</td>";
                    tbodyHtml += "<td>"+hideName(item.phone,3)+"</td>";
                    tbodyHtml += "<td style='text-align: center;'>"+item.company_name+"</td>";
                    tbodyHtml += "<td style='text-align: center;'>"+item.requirement_describe+"</td>";
                    if(item.trade_status == "已解决"){
                        tbodyHtml += "<td style='color:red;'>"+item.trade_status+"</td>";
                    }else{
                        tbodyHtml += "<td>"+(item.trade_status == null ? "" :item.trade_status )+"</td>";
                    }

                    tbodyHtml += "<td>"+item.create_date.substring(0,10)+"</td>";
                    tbodyHtml += "</tr>";
                });
                $("#tbd").html(tbodyHtml);
                var totalRow = data.totalRow;
                var pages = Math.ceil(totalRow / 10);
                $(".fanye a span").eq(0).html(totalRow);
                $(".fanye a span").eq(1).html(pages);
                var str = "";
                if (totalRow > 0) {
                    str = '<input id="page1" type="button" value="1" class="cur_fanye_btn"/>';
                    if (pages > 9) {
                        for (var i = 2; i < 9; i++) {
                            str += '<input id="page' + i + '" type="button" value="' + i + '"/>';
                        }
                        str += '<input id="page' + pages + '" type="button" value="' + pages + '"/>';
                    } else {
                        for (var i = 2; i <= pages; i++) {
                            str += '<input id="page' + i + '" type="button" value="' + i + '"/>';
                        }
                    }
                }
                $(".fanye_btn").html(str);
                $(".fanye .fanye_btn input").on("click", function () {
                    $(".cur_fanye_btn").removeClass("cur_fanye_btn");
                    $(this).addClass("cur_fanye_btn");
                    var pn = $(this).val();
                    $("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
                    list(pn, '');
                });

                $(".fanye input[type=text]").val(pageNum);
                $(".cur_fanye_btn").removeClass("cur_fanye_btn");
                $("#page" + pageNum).addClass("cur_fanye_btn");
                $(".rzh li h6").hide();
                $(".list_aa .rzh li").mouseover(function () {
                    $(this).find("h6").show();
                });
                $(".list_aa .rzh li").mouseout(function () {
                    $(".rzh li h6").hide();
                });
                $(".fanye .fanye_btn input").on("click", function () {
                    $(".cur_fanye_btn").removeClass("cur_fanye_btn");
                    $(this).addClass("cur_fanye_btn");
                    var pn = $(this).val();
                    $("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
                    list(pn, '');
                });
            }
        });
    }
    //获取条数
    function getDemandNum() {
        var firstType = $(".li-sel").attr("data-index");
        var secondType = $(".secondType").attr("data-index");
        var provId = $(".sel-province").attr("data-index");
        var title = $("#title").val();
        var order = $("#order").val();
        $.ajax({
            type: "POST",
            url: "${ctx}/solidsupply/getDemandNum",
            data: "order=" + order + "&provId=" + provId + "&firstType=" + firstType + "&secondType=" + secondType + "&title=" + title + "&order=" + order,
            dataType: 'json',
            success: function (data) {
                var pages = Math.ceil(data / 16);
                $(".fanye a span").eq(0).html(data);
                $(".fanye a span").eq(1).html(pages);
                var str = "";
                if (data > 0) {
                    str = '<input id="page1" type="button" value="1" class="cur_fanye_btn"/>';
                    if (pages > 9) {
                        for (var i = 2; i < 9; i++) {
                            str += '<input id="page' + i + '" type="button" value="' + i + '"/>';
                        }
                        str += '<input id="page' + pages + '" type="button" value="' + pages + '"/>';
                    } else {
                        for (var i = 2; i <= pages; i++) {
                            str += '<input id="page' + i + '" type="button" value="' + i + '"/>';
                        }
                    }
                }
                $(".fanye_btn").html(str);
                $(".fanye .fanye_btn input").on("click", function () {
                    $(".cur_fanye_btn").removeClass("cur_fanye_btn");
                    $(this).addClass("cur_fanye_btn");
                    var pn = $(this).val();
                    $("html,body").animate({"scrollTop": $(".header_nav").offset().top + "px"});
                    list(pn, '');
                });
            }
        });
    }
    //更新时间、价格、人气
    function order(str, index) {
        $("#order").val(str);
        $(".sort_1 li").eq(index).addClass("sel2").siblings().removeClass("sel2");
        list(1, '');
        getSupplyNum();
    }
    function goDetail(id,trade_status) {
        if(trade_status=='洽谈中'){
            showMess("该环保需求已在洽谈中,请查看<提交中>的信息");
        }else if(trade_status=='已解决'){
            showMess("该环保需求已解决,请查看<提交中>的信息");
        }else if(trade_status=='关闭中'){
            showMess("该环保需求已关闭,请查看<提交中>的信息");
        }else{
            window.open('${ctx}/supply-demand/details/'+id);
        }
        //window.open('${ctx}/supply-demand/details/'+id);
    }
    //不带确定的提示框
    function showMess(str) {
        $(".popumask").show();
        $(".pl_normal .pl_content p").html(str);
        $(".pl_normal").show();
        setTimeout(function () {
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        }, 3000);
    }
    function sou() {
        var s = $(".header_search select").val();
        var title = $(".header_search input").val();
        if (s == '1') {
            $("#firstType li").eq(0).addClass("li-sel").siblings().removeClass("li-sel");
            $(".secondType").removeClass("secondType");
            $(".show").removeClass("show");
            $(".search-province a").eq(0).addClass("sel-province").siblings().removeClass("sel-province");
            var type = $(".li-sel").attr("data-index");
            var title2 = $("#title").val();
            postStandUrl('${actionUrl}',{'pageNum':1,'title':title2,'type':type})
        } else {
            location.href = '${ctx}/qiugou/searchList?searchtext=' + title;
        }
    }
    function goCom(id) {
        window.open("${ctx}/homepage/" + id);
    }

    function hideName(name,leg){
        var length = name.length;
        var res = name.substring(0,leg);
        if(length > leg){
            for(var i = 0; i < length -leg; i ++){
                res += "*";
            }
        }else{
            res += "*";
        }
        return res;
    }

    function fenyeTiao(pageNum){
        var title='${title}';
        var type='${type}';
        postStandUrl('${actionUrl}',{'pageNum':pageNum,'title':title,'type':type})

    }

/*    function changeColor(){
        var color="#ffeab3"
        $("tbody tr:odd td").css("background-color",color);  //改变偶数行背景色
        $("tbody tr:odd").attr("bg",color);
        $("tbody tr:even").attr("bg","#fff");
    }*/
</script>
</body>
</html>
