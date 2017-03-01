<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>行情中心</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
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
.main_row_1{height:40px; overflow:hidden;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}

/*头部banner图片 start*/
.main_banner{width:1000px; height:140px;position:relative; margin-bottom:30px;}
.main_banner .fade_list{width:100%;height:100%;position:relative;}
.main_banner .fade_list li{position: absolute;z-index:0;left:0;top:0;width:100%;height:100%;}
.main_banner .fade_list li a{display: block;width: 100%;height: 100%; margin: 0 auto;}
.main_banner .fade_list li a img{width:100%;height:100%;}
.main_banner .fade_btn {position: absolute;left:50%; margin-left:-48px;bottom:2px;z-index:0;width:100px; text-align: right;}
.main_banner .fade_btn a{display:inline-block; width:13px; height:13px;background:#CCCCCC;opacity:0.5; border-radius:13px;margin: 3px;z-index:3;-moz-border-radius:13px;-webkit-border-radius:13px;}
.main_banner .fade_btn .h_b_btn_sel{background: #FFFFFF;opacity: 0.8;}
/*头部banner图片 end*/

/*每日行情-行情评估 start*/
.main_rows{width:1000px; overflow:hidden; margin-bottom:40px;}
.main_rows .main_left{float:left; width:750px;}
.main_rows .main_left .main_tab{border-bottom:1px solid #ccc;position:relative; height:28px; width:750px; margin-bottom:7px;}
.main_rows .main_left .main_tab .main_tab_1{position:absolute; overflow:hidden;}
.main_rows .main_left .main_tab .main_tab_1 li{font-size:16px; color:#333333;margin-right:34px; float:left;padding-bottom:7px;border-bottom:3px none #5ec420; margin-top:-1px; cursor:pointer;}
.main_rows .main_left .main_tab .main_tab_1 .cur_tab{color:#5ec420; border-bottom:3px solid #5ec420; margin-top:-1px; z-index:2;}

.main_rows .main_left .main_list{overflow: hidden;}
.main_rows .main_left .main_list li{height:36px;line-height:36px;border-bottom: 1px dashed #cccccc;}
.main_rows .main_left .main_list li:last-child{border-bottom:none;}
.main_rows .main_left .main_list li a{float:left;position: relative;margin-left:5px;float:left; width:630px;}
.main_rows .main_left .main_list li a::before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 16px;margin-right: 5px}
.main_rows .main_left .main_list li a:hover{color:#5EC520;}
.main_rows .main_left .main_list li a:hover::before{background-color: #5EC520;}
.main_rows .main_left .main_list li span{float:right;color:#666666;}

/*推荐商家*/
.main_right{width:220px; float:right;}
.main_right a{width:188px; display:block; margin-bottom:10px; cursor:pointer;}
.main_right a img{width:100%;}

.tj_box{margin-top:20px;}
.tj_1{width:110px; margin-bottom:10px; overflow:hidden;float:left;}
.qy_1{width:108px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
.qy_1 img{width:110px;}
.qy_1:hover p,.qy_1:hover a{display:block;}
.qy_1 p{width:115px; height:68px; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;filter:Alpha(Opacity=80);}
.qy_1 a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}


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

/*翻页*/
.fanye{margin-top:20px; margin-bottom:20px;overflow:hidden;}
.fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]:focus{border:1px solid #ee7800;}
.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye .fanye_btn input{width:30px;}
.fanye .filp .cur_fanye_btn{background-color:#5cb531;width:30px; border:1px solid #5cb531; color:white;}

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
        <div class="header_middle">
            <h1 class="header_logo">
                 <a href="javascript:go('${ctx}/index');">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
                <form action="${ctx}/quoindex/search" method="post">
                <div class="h_s_middle font_1">
                    <input type="search" name="title" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:search();" style="margin-left:-1px;">搜索</a>
                </div>
                </form>
            </div>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
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
                当前位置>优蚁网>行情中心><span>每日行情</span>
            </div>
        </div>
        <div class="main_banner">
        	<!--头部banner图片 start-->
            <ul class="fade_list">
            <c:forEach items="${mediuAdImgList}" var="mediuAdImg">
                <li >
                    <a href="javascript:void(0);">
                        <img <c:if test='${not empty mediuAdImg.redirctHref}'>onclick="window.open('${mediuAdImg.redirctHref}')"</c:if> src="${mediuAdImg.picAddr}" alt="" style="width:1000px; height:140px;">
                    </a>
                </li>
            </c:forEach>
                <%-- <li style="display: none;">
                    <a href="javascript:void(0);">
                        <img src="${ctxStatic}/img/llhb/mark_banner_1.png"/>
                    </a>
                </li>

                <li style="display: none;">
                    <a href="javascript:void(0);">
                        <img src="${ctxStatic}/img/llhb/mark_banner_1.png"/>
                    </a>
                </li>

                <li style="display: none;">
                    <a href="javascript:void(0);">
                        <img src="${ctxStatic}/img/llhb/mark_banner_1.png"/>
                    </a>
                </li>
                <li style="display: none;">
                    <a href="javascript:void(0);">
                        <img src="${ctxStatic}/img/llhb/mark_banner_1.png"/>
                    </a>
                </li> --%>
            </ul>
            <!--头部banner小圆圈 start-->
            <div class="fade_btn"></div>
            <!--头部banner小圆圈 end-->  
        </div>
        
        <div class="main_rows">
        	<div class="main_left">
            	<div class="main_tab">
                	<ul class="main_tab_1">
            			<li class="cur_tab">每日行情</li>
                		<li>行情评估</li>
            		</ul>
                </div>
            	<ul class="main_list font_1">
            	<c:forEach items="${quoList}" var="quo">
                	<li>
                        <a href="${ctx}/quoindex/detail?id=${quo.id}&type=${quo.quo_type}" target="_blank" class="m_r_ul_a tmui-ellipsis color_1">${quo.quo_title}</a>
                        <span class="m_r_ul_span"><fmt:formatDate value='${quo.time}' type="both" pattern="yyyy-MM-dd" /></span>
                    </li>
                </c:forEach>
                </ul>
                <div class="fanye font_1 color_1">
                    <c:set var="currentPage" value="${recordPage.pageNumber}" />
					<c:set var="totalPage" value="${recordPage.totalPage}" />
					<c:set var="actionUrl" value="${ctx}/quoindex?type=${type}&pageNumber="/>
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
					<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
					<%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
            	</div>
            </div>
            <div class="main_right">
                <div class="c1_m_left">
                    <div style="margin-top:0px;height:25px;border-bottom: 1px solid #ccc;">
                        <span class="font_3" style="float:left;margin-top: -1px;height:25px;line-height: 25px;border-bottom: 3px solid #5EC520;position: relative;">推荐商家</span>                           
                    </div>                      
                    <div class="tj_box">
                       <c:forEach items="${companyAdList}" var="company">
                    	<div class="tj_1">
                        	<div class="qy_1" <c:if test='${not empty company.redirctHref}'>onclick="window.open('${company.redirctHref}','_blank')"</c:if>>
                            	<img src="${company.picAddr}" style="width:110px;height:70px">
                                <p>&nbsp;</p>
                                <a>${company.showName}</a>
                            </div>
                        </div>
                        </c:forEach>
                        <%-- <div class="tj_1">
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                        </div>
                        <div class="tj_1">
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                        </div>
                        <div class="tj_1">
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                        </div>
                        <div class="tj_1">
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                            <div class="qy_1">
                                <img src="${ctxStatic}/img/llhb/mall_tj_01.png">
                                <p>&nbsp;</p>
                                <a>河北钢铁股份有限公司</a>
                            </div>
                        </div> --%>
                        
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
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<!--底部下部信息 end-->

<script>
//banner 样式切换
$(".header_nav ul li").eq(9).addClass("header_nav_sel");
$(document).ready(function(){
	$(".main_rows .main_left .main_tab .main_tab_1 li:first").mousedown(function(){
		$(".main_rows .main_left .main_tab .main_tab_1 li").removeClass("cur_tab");
		$(this).addClass("cur_tab");
		
	});
	$(".main_rows .main_left .main_tab .main_tab_1 li:last").mousedown(function(){
		$(".main_rows .main_left .main_tab .main_tab_1 li").removeClass("cur_tab");
		$(this).addClass("cur_tab");
		
	})
})
</script>

<script>
<!--轮播广告-->
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
    $(".main_banner .fade_btn").html("");
    $(".fade_list li").each(function(){
        $(".main_banner .fade_btn").append('<a href="javascript:void(0);" ></a>');
    });
    $(".main_banner .fade_btn").find("a:first").addClass("h_b_btn_sel");

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
    $(".main_top_nav_middle").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
    $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
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
	
	//上一页
	$(".fanye_left").click(function(){
		if('${currentPage}'!=1){
			window.location.href='${actionUrl}${currentPage - 1}';
		}
	});
	//下一页
	$(".fanye_right").click(function(){
		if('${currentPage}'!='${totalPage}'){
			window.location.href='${actionUrl}${currentPage + 1}';
		}
	});
	//跳转
	 $(" .filp input:last").click(function(){
		var text = $(".filp :text:last").val();
		var re = /^[0-9]+$/;
		if(re.test(text) && parseInt(text)<='${totalPage}'){
			window.location.href='${actionUrl}'+text;
		}
		
	});
	 /*========切换资讯类别的样式========*/
		$(function(){
			var type="${type}";
			if(type=="daily_quo"){
				$(".main_left .main_tab ul li").eq(0).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(0).siblings().removeClass("cur_tab");
				$(".cur_position span").html("每日行情");
			}else if(type=="eva_quo"){
				$(".main_left .main_tab ul li").eq(1).addClass("cur_tab");
				$(".main_left .main_tab ul li").eq(1).siblings().removeClass("cur_tab");
				$(".cur_position span").html("行情评估");
			}
		});
		/*========切换资讯类别========*/
		$(".main_left .main_tab ul li").click(function(){
			var index = $(this).index();
			var type="";
			if(index==0){
				type="daily_quo";
			}else if(index==1){
				type="eva_quo";
			}
			if(type!=""){
				go("${ctx}/quoindex?type="+type);
			}
		})
		
});
//搜索
function search(){
	$(".header_search form").submit();
}
</script>

</body>
</html>