<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<title>推广排名展示</title>
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
.header_middle .header_search .h_s_middle input{width:372px;}
.header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
.header_right{margin-top:30px;}
/*头部中部end*/
/*内容start*/

/*页面修改*/
input[type=text],.tab_main input[type=password]{border:1px solid #ccc; height:30px;text-indent: 5px;}
select {border: solid 1px #C9CACA;;text-indent: 3px;color: #666666; height:32px;}
/*当前位置*/
.main_row_1{overflow:hidden;}
.main{background: #F8F9FB}
.tgpm_img{width:660px;}
.tgpm_img img{width:100%;height:100%;}
.tgpm_mt_r{width:330px;padding:5px;}
.tgpm_mt_r>div{margin-top: 15px;}
.tgpm_mt_r>.clearfix{line-height: 30px;}

.isgreen{color:#5bc520;}
.new_price{border:1px solid #F8B002;width:100%;background: #fff;}
.new_price>span{display: block;color:#fff;height:30px;line-height: 30px;background: #F8B002;text-indent: 5px;}
.new_price ul li{margin:10px 0;text-align: center;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;}
.new_price li a{margin-right:5px;}

.tgpm_mb_div{width:282px;padding:15px;margin-left:17px;background:#fff;margin-bottom: 30px;}
.tgpm_mb_title{display: block;font-weight: bold;border-bottom: 1px dashed #ccc;}
.paihang_ul{font-size: 12px;}
/*页面修改end*/

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
                <a href="javascript:void(0);">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
           <!--  <div class="header_search">
                <select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a>
                </div>
            </div> -->
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
    <div class="main clearfix">
        <div class="main_row_1">
            <div>
                当前位置>排名推广
            </div>
        </div>
        <div class="tgpm_main_top clearfix">
            <div class="fl tgpm_img">
                <img src="${ctxStatic}/img/llhb/spread.jpg" alt="">
            </div>
            <div class="fl tgpm_mt_r">
                <div>
                    <input type="text"placeholder='请输入关键词'style="width: 95%;">
                </div>
                <div class="clearfix">
                    <a href="javascript:void(0)" class="btn fl"style="margin-right: 15px;">开始推广</a>
                    <div class="fl">
                        资讯电话:${servicePhone }
                    </div>
                </div>
                <div class="new_price">
                    <span>
                        最新出价
                    </span>
                    <ul>
                    <c:forEach items="${spreadNowList}" var="spreadNow" begin='0' end='2'>
                        <li><span class="isgreen">${spreadNow.bid}元</span><a href="javascript:go('${ctx}/spread/index/bidRecord?keyWord=${spreadNow.name}')">${spreadNow.name}</a>${spreadNow.comp_name}</li>
                     </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tgpm_main_bottom clearfix">
            <div class="fl tgpm_mb_div">
                <span class="tgpm_mb_title">
                    供应本日搜索排行
                </span>
                <div class="paihang_ul">
                    <ul>
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${hotWordList}" var="hotWord">
                    	<c:if test="${i<10 && (hotWord.type eq 'S') && (not empty hotWord.query_word)}">
                    	<c:set var="i" value="${i+1}"></c:set>
                    	<li><span>${hotWord.count}次</span><a href="javascript:go('${ctx}/spread/index/bidRecord?keyWord=${hotWord.query_word}')">${hotWord.query_word}</a></li>
                    	</c:if>
                    </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="fl tgpm_mb_div">
                <span class="tgpm_mb_title">
                    求购本日搜索排行
                </span>
                <div class="paihang_ul">
                    <ul>
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${hotWordList}" var="hotWord">
                    	<c:if test="${i<10 && (hotWord.type eq 'D')&& (not empty hotWord.query_word)}">
                    	<c:set var="i" value="${i+1}"></c:set>
                    	<li><span>${hotWord.count}次</span><a href="javascript:go('${ctx}/spread/index/bidRecord?keyWord=${hotWord.query_word}')">${hotWord.query_word}</a></li>
                    	</c:if>
                    </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="fl tgpm_mb_div">
                <span class="tgpm_mb_title">
                    公司本日搜索排行
                </span>
                <div class="paihang_ul">
                    <ul>
                    <c:set var="i" value="0"></c:set>
                    <c:forEach items="${hotWordList}" var="hotWord">
                    	<c:if test="${i<10 && (hotWord.type eq 'E') && (not empty hotWord.query_word)}">
                    	<c:set var="i" value="${i+1}"></c:set>
                    	<li><span>${hotWord.count}次</span><a href="javascript:go('${ctx}/spread/index/bidRecord?keyWord=${hotWord.query_word}')">${hotWord.query_word}</a></li>
                    	</c:if>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
         
    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>

    <!--底部上部信息 start-->
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
	<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
    <!--底部下部信息 end-->
</footer>
<!--底部 end-->
<!--左侧悬窗 start-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<!-- 弹出框 -->
<div class="populayer pl_normal" >
    <div class="layer_top">
    	<span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>
    </div>
</div>	
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
    
    $(".tgpm_mt_r .clearfix a").click(function(){
    	var kw = $(this).parents('.tgpm_mt_r').find('input').val();
    	if(kw != ''){
    		go('${ctx}/spread/index/bidRecord?keyWord='+kw);
    	}else{
    		showMess('请输入关键字');
    	}
    });
});
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
</script>

</body>
</html>