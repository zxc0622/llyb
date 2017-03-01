<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="utf-8"%> 
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>优蚁环保-帮助中心,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>

/*内容start*/

/*当前位置*/
.main_row_1{height:40px; overflow:hidden; margin-bottom:10px;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}

.main_con{overflow:hidden;}
.help_1{background-color:#eaf6fc; height:400px; overflow:hidden;}
.help_1 p{font-size:14px; color:#eaf6fc; line-height:30px; width:80px; text-align:center; background-color:#5cb531; margin-top:15px; margin-left:900px;}
.help_1 p:hover{cursor:pointer}
.help_1 .help_ul_1{margin:20px 0; overflow:hidden; padding-bottom:40px;}
.help_1 .help_ul_1 li{ background-color:#c789d3; width:100px; height:100px;border-radius:100px;-moz-border-radius:100px;-webkit-border-radius:100px; float:left;background-image:url(${ctxStatic}/img/llhb/help_icon.png); background-repeat:no-repeat; margin:0 49px;}
.help_1 .help_ul_1 li:nth-of-type(1){background-position:0 0; background-color:#c789d3;}
.help_1 .help_ul_1 li:nth-of-type(2){background-position:-100px 0; background-color:#fd959f;}
.help_1 .help_ul_1 li:nth-of-type(3){background-position:-200px 0; background-color:#ffbf8d;}
.help_1 .help_ul_1 li:nth-of-type(4){background-position:-300px 0; background-color:#f9d1bb;}
.help_1 .help_ul_1 li:nth-of-type(5){background-position:-400px 0; background-color:#bde3ed;}
.help_1 .help_ul_1 li:hover{background-color:#5ec420;}
.help_1 .help_ul_1 li a{font-size:14px; color:#333; line-height:34px; width:100px; text-align:center; display:block; margin-top:100px;}
.help_1 .help_ul_2{overflow:hidden; padding-bottom:40px;}
.help_1 .help_ul_2 li{ background-color:#c789d3; width:100px; height:100px;border-radius:100px;-moz-border-radius:100px;-webkit-border-radius:100px; float:left;background-image:url(${ctxStatic}/img/llhb/help_icon.png); background-repeat:no-repeat; margin:0 49px;}
.help_1 .help_ul_2 li:nth-of-type(1){background-position:0 -110px; background-color:#b7b1e5;}
.help_1 .help_ul_2 li:nth-of-type(2){background-position:-100px -110px; background-color:#cde18f;}
.help_1 .help_ul_2 li:nth-of-type(3){background-position:-200px -110px; background-color:#9bd787;}
.help_1 .help_ul_2 li:nth-of-type(4){background-position:-300px -110px; background-color:#7fcbd9;}
.help_1 .help_ul_2 li:nth-of-type(5){background-position:-400px -110px; background-color:#c8dbbd;}
.help_1 .help_ul_2 li:hover{background-color:#5ec420;}
.help_1 .help_ul_2 li a{font-size:14px; color:#333; line-height:34px; width:100px; text-align:center; display:block; margin-top:100px;}

.help_2{width:1000px;}
.help_2>div{background-image:url(${ctxStatic}/img/llhb/help_back_1.png); background-repeat:no-repeat; background-position:center; height:312px; padding:135px 0 0 100px; color:white;}
.help_2 p{font-size:20px; line-height:38px; color:white; background-color:#0c858d; width:302px; text-align:center; margin-bottom:15px;}
.help_2 a{color:white; display:block; line-height:30px;}
.help_2 a span{font-weight:bolder;}
.help_2 input{line-height:36px; text-align:center; font-size:20px; color:white; border:0; height:36px; margin:30px 0 0 80px;}

.help_3{width:1000px;}
.help_3>div{background-image:url(${ctxStatic}/img/llhb/help_back_2.png); background-repeat:no-repeat; background-position:center; height:312px; padding:135px 0 0 100px; color:white;}
.help_3 p{font-size:20px; line-height:38px; color:white; background-color:#7386a2; width:245px; text-align:center;}
.help_3 a{color:white; display:block; line-height:40px; }
.help_3 span{font-weight:bolder; font-size:35px;line-height:60px;}


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
                当前位置>优蚁网>帮助中心
            </div>
        </div>
        <div class="tab_main" style="width:998px; overflow:hidden;padding-bottom:0; margin-bottom:100px;">
            <div class="m_r_title">
                <span  class="m_r_tname">自助服务</span>
                <span>在线咨询</span>
                <span>客服服务</span>
            </div>
            <div class="main_con">
            	<form class="help_1" action=""> 
                	<p onclick="go('${ctx}/platform/commenProblem')">更多</p>
                    <ul class="help_ul_1">
                    	<li onclick="go('${ctx}/platform/commenProblem?remark=1&type=1125')">
                        	<a>找回登陆名</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=6&type=1125')">
                            <a>找回密码</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=2&type=1125')">
                            <a>账号无法登陆</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=9&type=1125')">
                            <a>优蚁币使用方法</a>
                        </li >
                        <li onclick="go('${ctx}/platform/commenProblem?remark=5&type=1125')">
                            <a>积分规则</a>
                        </li>
                    </ul>
                    <ul class="help_ul_2">
                    	<li onclick="go('${ctx}/platform/commenProblem?remark=3&type=1125')">
                        	<a>发布信息需求</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=7&type=1125')">
                            <a>产品图审核标准</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=8&type=1125')">
                            <a>优蚁会员服务</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=4&type=1125')">
                            <a>修改资料</a>
                        </li>
                        <li onclick="go('${ctx}/platform/commenProblem?remark=10&type=1125')">
                            <a>申请发票</a>
                        </li>
                    </ul>
                </form>
                <form class="help_2" action="">
                	<div>
                    	<p>专业咨询，在线客服，无需等待</p>
                        <a class="font_3">采用智能机器人和人工方式的结合方式</a>
                        <a class="font_3"><span>人工服务时间</span>：周一至周五09:00-18:00</a>
                        <input type="button" onclick="window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" value="开始咨询" style="background-color:#fdd000; width:150px; border:0;">
                    </div>
                </form>
                <form class="help_3" action="">
                	<div>
                    	<p>客服电话，欢迎垂询</p>
                        <a class="font_3">工作时间：周一至周五09:00-18:00</a>
                        <span>热线：${servicePhone }</span>
                        <a class="font_3">投诉电话：0769-2166&nbsp;9939 转 801</a>
                    </div>
                </form>
            </div> 
        </div>      
    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
<!--底部 end-->

<script>
$(document).ready(function(){
	$(".help_2").hide();
	$(".help_3").hide();
	var num_2;
	$(".tab_main .m_r_title span").mousedown(function(){
		num_2=$(".tab_main .m_r_title span").index(this);
		$(".tab_main .m_r_title span").removeClass("m_r_tname");
		$(this).addClass("m_r_tname");
		if(num_2==0){
			$(".help_1").show();
			$(".help_2").hide();
			$(".help_3").hide();		
		}else if(num_2==1){
			$(".help_2").show();
			$(".help_1").hide();
			$(".help_3").hide();
		}else if(num_2==2){
			$(".help_3").show();
			$(".help_2").hide();
			$(".help_1").hide();		
		}
	});
	/*=========根据flag跳转=========*/
	var i="${flag}";
	if(i=="1"){
		$(".tab_main .m_r_title span").removeClass("m_r_tname");
		$(".tab_main .m_r_title span").eq(i-1).addClass("m_r_tname");
		$(".help_1").show();
		$(".help_2").hide();
		$(".help_3").hide();
	}else if(i=="2"){
		$(".tab_main .m_r_title span").removeClass("m_r_tname");
		$(".tab_main .m_r_title span").eq(i-1).addClass("m_r_tname");
		$(".help_2").show();
		$(".help_1").hide();
		$(".help_3").hide();
	}else{
		$(".tab_main .m_r_title span").removeClass("m_r_tname");
		$(".tab_main .m_r_title span").eq(i-1).addClass("m_r_tname");
		$(".help_3").show();
		$(".help_2").hide();
		$(".help_1").hide();		
	}
})
</script>

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
    $('#title').bind('keypress',function(event){
        if(event.keyCode == "13")  {
        	sou();
        }
    });
    
    $(".Nav_right .active").css("color","black");//取消导航栏激活状态
});
function sou(){
	var v = $(".header_search select").val();
	var title = $("#title").val();
	if(v == 1){
		location.href='${ctx}/solidsupply/supplyList?title='+title;
	}else{
		location.href='${ctx}/qiugou/searchList?searchtext='+title;
	}
}

</script>

</body>
</html>