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
<title>${info.position}-优蚁环保网</title>
<meta name="keywords" content="${info.position},${info.company_name}${info.position}招聘，人才招聘，优蚁环保招聘" />
<meta name="description" content="${info.company_name}招聘${info.position},${info.position}招聘信息包括：职位描述，工作内容，职位要求，薪资待遇以及工作地点等内容。" />
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>


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

/*头部banner图片 end*/

.main_text{width:710px;}
.main_text .main_text_tit{overflow:hidden; margin-bottom:10px;}
.main_text .main_text_tit dt{color:#333; line-height:30px;}
.main_text .main_text_tit dd{float:left; font-size:12px; color:#999; line-height:16px; margin-right:20px;}
.main_text .main_text_tit dd img{width:16px; height:16px; margin-right:10px;}
.main_text h3{color:#333; font-weight:normal; line-height:24px; text-indent:20px; margin-top:6px;}
.main_text .main_pic{width:592px; margin:20px 0 20px 59px; }

.main_conncet{overflow:hidden;width:100%;}
.main_conncet li{line-height:50px;}
.main_conncet li:nth-of-type(1){float:left; color:#444;}
.main_conncet li:nth-of-type(2){float:right;color:#444;}
.main_conncet li span{color:#888;}
.main_conncet li span:hover{color:#5ec420; cursor:pointer;}

.main_rows{width:1000px; overflow:hidden; margin-bottom:40px;}
.main_rows .main_left{float:left; width:710px;}
.main_rows .main_left .main_tab{border-bottom:1px solid #ccc;position:relative; height:28px; width:710px; margin-bottom:7px;}
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

/*微信号*/
.main_right{width:267px; float:right;}
.qr_code{width:265px; height:225px; border:1px solid #ccc;}
.qr_code dt{color:#FFF; width:265px; text-align:center; line-height:30px; background-color:#5EC520;}
.qr_code dd{width:164px; text-align:center; margin:auto; margin-top:2px;}

.zixun_p{width:235px; padding:20px 15px 5px 15px; border:1px solid #ccc; margin-top:20px;}
.zixun_p_tit{margin-top:0px;height:25px;border-bottom: 1px solid #ccc;}
.zixun_p_tit span{float:left;margin-top: -1px;height:25px;line-height: 25px;border-bottom: 3px solid #5EC520;position: relative; margin-bottom:13px;}
.zixun_p ul{width:235px; overflow:hidden; }
.zixun_p ul li{float:left; width:110px; margin-bottom:15px}
.zixun_p ul li:nth-of-type(2n){margin-left:15px;}
.ie8 .zixun_p ul li{margin-left:7px;}
.zixun_p ul li img{width:110px; margin-bottom:6px;}
.zixun_p ul li a{width:110px; text-align:center; display:block; line-height:18px;}
.zixun_p:nth-of-type(2) ul li a{text-align:left;}
.zixun_p ul li a:nth-of-type(2){color:#9fa0a0;}
.zixun_p ul li a:nth-of-type(3){color:#9fa0a0;}



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

/*附件样式*/
.attachment_div{border:1px solid #5EC520;width: 135px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
.attachment_div a:hover{cursor:pointer}
.attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;}
.attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
.add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
.add_attachment_btn>a{color:#5EC520;}
.new_content_class a{color:blue;text-decoration:underline;}

/*新闻详情*/
.xinwen_detail_item{text-align: left;width: 1000px;

	height:30px;
	font-family: 宋体;
	font-size: 14px;
	}
.xinwen_detail_item_span{
	display: inline-block;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	width:200px;
}
.xinwen_detail_item_span_1{
    display: inline-block;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    width:260px;
}
.xinwen_detail_item_desc{text-align: left;width: 710px;
	font-family: 宋体;
	font-size: 14px;
	}
/*新闻详情 结束*/
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
        <div class="header_middle" style="height: 145px;">
            <h1 class="header_logo">
                <a href="javascript:go('${ctx}/index');">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:search();" style="margin-left:-1px;">搜索</a>
                </div>
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
                当前位置>优蚁网>资讯>招聘信息
            </div>
        </div>
        <div class="main_rows">
        	<!--左侧开始-->
        	<div class="main_left">
            	<div class="main_text">
                    <dl class="main_text_tit">
                        <dt class="font_3">${info.position}</dt>

                        <dd>发布时间：<span><fmt:formatDate value="${info.create_date}" type="both" pattern="yyyy-MM-dd"/></span></dd>
						<dd>
							<img src="${ctxStatic}/img/llhb/mall_04.png";>
							浏览次数(<span>${info.page_view}</span>人气)
						</dd>
                        <dd class="bdsharebuttonbox" data-tag="share_1">
                            <a href="#" class="bds_weixin" data-cmd="weixin"></a>
                            <a class="bds_qzone" data-cmd="qzone" href="#"></a>
                            <a class="bds_tsina" data-cmd="tsina"></a></dd>

                        <!-- <dd style="color:#5ec420; float:right; cursor:pointer;" onclick="submission()">我要投稿</dd> -->
                    </dl>


					<div class="qy_m_r_d_main">
						<div class="xinwen_detail">
							<div class="xinwen_detail_item">
								<span class="xinwen_detail_item_span_1"><strong>公司名称: </strong>${info.company_name}</span>
								<span class="xinwen_detail_item_span"><strong>所属部门: </strong>${info.dept_name}</span>
								<span class="xinwen_detail_item_span"><strong>工作年限: </strong>${info.work_exp}</span>
							</div>
							<div class="xinwen_detail_item">
                                <span class="xinwen_detail_item_span_1"><strong>工作地点: </strong>${info.location}</span>
								<span class="xinwen_detail_item_span"><strong>学历要求: </strong>${info.qualifications}</span>
								<span class="xinwen_detail_item_span"><strong>招聘人数: </strong>
									<c:choose>
									       <c:when test="${info.person_number == '0'}">若干</c:when>
									       <c:when test="${info.person_number == '0人'}">若干</c:when>
									       <c:otherwise>${info.person_number}</c:otherwise>
									</c:choose>
								</span>
							</div>
                            <div class="xinwen_detail_item">
                                <span class="xinwen_detail_item_span_1"><strong>薪资范围: </strong>${info.salary}</span>
                                <span class="xinwen_detail_item_span"><strong>发布时间: </strong>${fn:substring(info.create_date,0,10)}</span>

                            </div>
                            <div class="xinwen_detail_item">
                                <%--<span><strong>职位名称: </strong>${info.position}</span>--%>
                            </div>

							<div class="xinwen_detail_item">
								<span><strong>职位描述:</strong></span>
							</div>
							<div class="xinwen_detail_item_desc">
								<span>${info.hr_desc}</span>
							</div>

							<div class="xinwen_detail_item">
							</div>
							<div class="xinwen_detail_item">
								<span><strong>网址: </strong> <a href="${info.company_href}" style="color:blue;" target="_blank">${info.company_href}</a> </span>
							</div>
							<div class="xinwen_detail_item">
								<span><strong>有意者请将简历发送至: </strong>${info.hr_email}</span>
							</div>

						</div>
					</div>

                </div>


            </div>
            <!--左侧结束-->


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
<!-- 弹出层 -->

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
//分享
var text = $(".main_text dl dt").html();
var url = window.location.href;
var pic1 =  $(".main_text input").val();
window._bd_share_config = {
		common : {
			bdText : text,
			bdDesc:"",
			bdUrl : url,
			bdPic :pic1
		},
		share : [{
			"bdSize" : 16
		}]
	};
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>
<script>
//banner 样式切换
$(".header_nav ul li").eq(7).addClass("header_nav_sel");
//<!--轮播广告-->
$(function(){
	var contentNavArr = [];
	var ad_top=$(".header_banner").each(function(){
	  contentNavArr.push($(this).offset().top);

	});
	/*滚动条事件*/
	$(window).scroll(function(){
	  /*左右悬窗定位*/
	  if($(window).scrollTop()>contentNavArr[0]){
		  $(".nav_bottomlist").show();
		  $(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});


	  }else if($(window).scrollTop()<=contentNavArr[0]){
		  $(".nav_bottomlist").hide();
		  $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
	  }
	});
	$(".content").click(function(){
		go('固废供求-副本-9-17.html');
	});
});
function submission(){
	var login = $(".header_top .h_t_welcome span").eq(1).html();
	if(login!=""){
		go('${ctx}/home?str=/infomaintain/add');
	}else{
		showMess("请先登录");
	}
}
//不带确定的提示框
function showMess(str){
	$(".popumask").show();
	$(".pl_normal .pl_content p").html(str);
	$(".pl_normal").show();
	setTimeout(function(){
		$(".popumask").fadeOut();
		$(".pl_normal .pl_content p").html("");
    	$(".pl_normal").hide();
	},3000);
}
//弹出层 关闭
$(".populayer .layer_top a").click(function(){
    $(".populayer").fadeOut();
});
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
$(".header_search .h_s_middle input").blur(function(){
	$(document).unbind("keypree");
});
$(".bdsharebuttonbox a").click(function(){
	if($("#lo").html()!="" && $("#lo").html() != undefined){
		$.ajax({
			type:'post',
			url:'${ctx}/zixun/share',
			data:'href=${basePath}zixun/detail?id=${info.id}',
			async:false,
			success:function(data){

			}
		});
	}
});
</script>

</body>
</html>


