<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>优蚁环保于12月01日正式上线啦！</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<style>
/*头部中部start*/
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0;}
.gonggao_main{width:700px;margin:0 auto;padding-bottom: 50px;}
.gonggao_title{text-align: center;padding:25px 0;}
.gonggao_title h5{font-size: 30px;font-weight: 400;}
.gonggao_title p{margin-top: 20px;}
.gonggao_title p span{padding:0 5px;}
.gonggao_main .gonggao_img{display: block;width:100%;margin-top: 15px;}
.gonggao_main .gonggao_p{margin-top: 15px;text-indent: 25px;color:#666;}
.gonggao_main .prev_and_next{margin-top: 50px;}
.prev_and_next a{color:#ccc;}
.prev_and_next > div{width:50%;}
</style>
</head>
<body>
<!--头部 start-->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>
<!--头部 end-->

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>首页>公告>公告详情
            </div>
        </div>
        <div class="gonggao_main">
            <div class="gonggao_title">
                <h5>优蚁环保于12月01日正式上线啦！</h5>
                <p><span>来源:优蚁网</span><span>发布时间：2015-12-1</span></p>
            </div>
            <img class="gonggao_img" src="${ctxStatic}/img/llhb/gonggao_1.png" alt="">
            <p class="gonggao_p">优蚁网以“打造环保产业价值链生态闭环”为目标，为企业提供专业环保报价、固废交易、环保商城等一站式服务，帮助企业开展环境影响评价、环保工程、环境检测、固废处置、环保商品供求资讯交易等全面的环保业务，满足企业深度的环保业务需求。</p>
            <img class="gonggao_img" src="${ctxStatic}/img/llhb/gonggao_2.png" alt="">
            <p class="gonggao_p">我们为您的企业提供一条龙式无忧环保服务，帮助您的企业找到价格公道、服务周到的环保公司开展环保业务。在环保业务中，帮助您的企业把可回收利用的固废资源卖得更高价，减少企业业务攻关环节，提高业务量。</p>
            <img class="gonggao_img" src="${ctxStatic}/img/llhb/gonggao_3.png" alt="">
            <p class="gonggao_p">优蚁环保首创线上危废一站式办理，极大地简化了原本繁琐的线下危废办理流程，操作简单易上手，支付轻松有保障，为企业节约时间，提高效率。</p>
            <img class="gonggao_img" src="${ctxStatic}/img/llhb/gonggao_4.png" alt="">
            <p class="gonggao_p">优蚁环保为您提供免费环保报价服务，专业、公正、精准为创业者、扩产者提供环评编写报价，检测报价等参考，并对接靠谱、高效、价廉的环保服务公司，让企业省心、省力、省钱！</p>
            <p class="gonggao_p">专注于环保产业领域，定位于互联网环保服务领导者。我们旨在为中小企业搭建产业固废和再生资源交易平台，为您的企业提供一站式无忧环保服务。欲了解更多平台相关信息，请登录优蚁环保平台，我们将竭诚为您服务！</p>

            <div class="prev_and_next clearfix">
                <div class="fl"><span>上一篇:</span><a href="${ctx}/notice/noticOne">优蚁环保于12月01日正式上线啦！</a></div>
                <div class="fl"><span>下一篇:</span><a href="${ctx}/notice/noticTwo">线上危废处置服务 这些你一定要知道！</a></div>
            </div>
        </div>
        
    </div>
</div>
<!--中间部分end-->

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
$(function(){
	$(".h_s_top a").on("click",function(){
		$(this).addClass("li-sel").siblings().removeClass("li-sel");
		$("#biaoji").val($(this).index());
	});
	h_s_bottom_a();
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
	<script type="text/javascript">
	$(".h_s_top a").on("click",function(){
		$(this).addClass("li-sel").siblings().removeClass("li-sel");
		$("#biaoji").val($(this).index());
	});
	h_s_bottom_a();
	function h_s_bottom_a(){
		var total_width=0;
		$(".h_s_bottom a").each(function(){
		total_width+=$(this).width();
		if(parseInt(total_width)>350){
			$(this).hide();
		}
		});
	}

	//搜索
	function search(){
	   	var value = $(".header_search .h_s_middle input").val();
	   	if(value!=null && value!=""){
	   		go("${ctx}/news/search?title="+value);
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
					go("${ctx}/news/search?title="+value);
				}
		    }
		})
	});
    function goPage(){
        var num=$("#biaoji").val();
        var title=$("#searchtext").val();
        var value = $("#searchtext").val();
        switch (parseInt(num)){
            case 0:
                location.href='${ctx}/EntLib?enterprise='+title;
                break;
            case 1:
                location.href='${ctx}/solidsupply/hbDemandQuery?title='+title;
                break;
            case 2:
                location.href='${ctx}/mall?proName='+title;
                break;
            case 3:
                if(value!=null && value!=""){
                    go("${ctx}/news/search?title="+value);
                }else{
                    location.href='${ctx}/news?title='+title;
                }
                break;
        }
    }
	</script>
</body>
</html>


