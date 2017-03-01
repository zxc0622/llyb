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
<title>优蚁币及积分使用兑换规则公告</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
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
.gonggao_title .sp_h5{font-size: 20px;font-weight: 400;color:#666;}
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
                <h5>优蚁币及积分使用兑换规则公告</h5>
                <p><span>来源:优蚁网</span><span>发布时间：2015-12-1</span></p>
            </div>
            <img class="gonggao_img" src="${ctxStatic}/img/llhb/gonggao_5.png" alt="">
            <p class="gonggao_p"style="text-indent: 0;">尊敬的优蚁环保网用户：</p>
            <p class="gonggao_p">您好！欢迎注册使用优蚁环保网。只要在优蚁环保网注册成功，通过完成任务或现金充值即可兑换积分与优蚁币。完整填写资料，多发帖，多互动，多分享，能帮助您快速获得积分并升级！详情请阅读以下规则。</p>
            <p class="gonggao_p">1、兑换原则</p>
            <p class="gonggao_p">一、通过充值方式兑换优蚁币。充值1元人民币=1个优蚁币，二者之间可以相互兑换，您充值的优蚁币可以随时兑换回现金。</p>
            <p class="gonggao_p">二、通过积分方式兑换优蚁币。用户可以在网站完成任务获取积分，积分满10000分后才能申请用积分兑换优蚁币，100积分=1个优蚁币，兑换需要经过审核方可实现，且积分兑换的优蚁币不能转为现金。</p>
            <p class="gonggao_p">2、用途</p>
            <p class="gonggao_p">优蚁币可以用来兑换现金、积分、礼品，购买平台商品、服务。</p>
            <p class="gonggao_p">积分可以用来兑换优蚁币与礼品。</p>
            <p class="gonggao_p">3、优蚁币的获得及扣减</p>
            <p class="gonggao_p">优蚁币可通过充值及积分兑换获得，使用优蚁币兑换现金、积分、礼品，购买平台商品、服务将扣减相应数量币数。经过现金充值兑换的优蚁币可换回现金，提取现金数不能超过充值数，提取现金需通过审核方可实现。用完成任务获得的积分兑换所得的优蚁币不能兑换现金，只能兑换礼品。</p>
            <p class="gonggao_p">用户积分满10000分后才能申请用积分兑换优蚁币，兑换需要经过审核方可实现，预防黑客挖积分兑现金。</p>
           <p class="gonggao_p"> <a  href="${ctx}/platform/commenProblem?remark=4" style="color:red;">欲了解更多详情，请登录优蚁环保平台查看积分任务列表细则。</a></p>
            
            <div class="prev_and_next clearfix">
                <div class="fl"><span>上一篇:</span><a href="${ctx}/notice/noticTwo">线上危废处置服务 这些你一定要知道！</a></div>
                <div class="fl"><span>下一篇:</span><a href="${ctx}/notice/noticFour">喜迎优蚁环保网上线。为了感谢大家支...</a></div>
            </div>
        </div>
        
    </div>
</div>
<!--中间部分end-->

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

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


