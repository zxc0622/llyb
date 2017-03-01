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
<title>论坛-列表</title>
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
.cur_position{font-size:12px; color:#666; margin:10px 0;line-height: 30px;}
.cur_position input{width:290px;}
.cur_position select{width:90px;}
.cur_position .btn{width:70px;margin-left: 20px;}
.cur_position + div{font-size: 12px;color:#666;}
.luntan_resou{margin-left: 50px;}
.luntan_resou a{margin-right: 20px;color:#ccc;}

.ltliebiao_top{margin-top: 10px;height:40px;line-height: 40px;border:1px solid #ccc;padding:0 15px;}
.ltliebiao_top p:first-child{margin-right: 15px;}
.ltliebiao_top p span{color:#5ec520;}
.ltliebiao_top .up,.ltliebiao_top .down{padding:0 20px 0 5px;font-size: 12px;position:relative;}
.ltliebiao_top .up:after{position:absolute;top:12px;right:2px;content: "";width:16px;height:16px;background: url(${ctxStatic}/img/llhb/ltliebiao-up.png) center center no-repeat;}
.ltliebiao_top .down:after{position:absolute;top:12px;right:2px;content: "";width:16px;height:16px;background: url(${ctxStatic}/img/llhb/ltliebiao-down.png) center center no-repeat;}

.ltliebiao_fatie_fanye{margin-top: 15px;}
/*翻页*/
input[type=button]{border:1px solid #ccc; height:32px;background-color:#fff; padding:0 5px; text-align:center;}
input[type=button].cur_page{background:#5ec520;color:#fff;}/*翻页*/
.fanye{margin-top:0px; margin-bottom:0px;overflow:hidden;}
.fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
.fanye input[type=text]:focus{border:1px solid #ee7800;}
.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
.fanye .fanye_btn input{width:30px;}

.fanye .filp .cur_fanye_btn{background-color:#5cb531;width:30px; border:1px solid #5cb531; color:white;}
/*翻页 结束*/

.ltleibiao_class{margin-top: 15px;padding-top: 15px;border-top: 1px solid #ccc;}
.ltleibiao_class a{display: inline-block;border:1px solid #ccc; height:32px;line-height: 32px;background-color:#fff; padding:0 15px; text-align:center;margin-right: 15px;}
.ltleibiao_class a span{padding:0 5px;font-size: 12px;border-radius: 7px;color:#fff;background:#ccc;}

/*论坛列表*/
.ltleibiao_main{border:1px solid #ccc;margin-top: 15px;}
.ltleibiao_m_title{height:40px;line-height: 40px;background: #f2f2f2;padding:0 15px;}
.ltleibiao_m_title a{margin:0 1px;}
.ltleibiao_m_title .more{position:relative;}
.ltleibiao_m_title .more:after{position:absolute;top:6px;right:-16px;content: "";display: inline-block;width:0;height:0;border:7px solid transparent;border-top-color: #666;}
/*more_isup*/
.ltleibiao_m_title .more_isup:after{border-top-color:transparent;border-bottom-color: #666;top:0;}
.more_div{display: none;position:absolute;top:40px;right:-323px;width:342px;height:50px;border:1px solid #ccc;background: #fff;padding:10px;}
.more_div>div{height:25px;line-height: 25px;}
.more_div>div .more_cur{color:#5ec520;}

.ltleibiao_main_r span{display: inline-block;margin-right: 10px;text-align: left;}
.ltleibiao_main_r span span{color:#ccc;display: block;}
.ltleibiao_main_r_user{width:110px;}
.ltleibiao_main_r_look{width:75px;}
.ltleibiao_main_r_last{width:105px;}

/*li列表*/
.ltlb_m_n_zhiding,.ltlb_m_n_zhuti{padding:0 15px;}
.ltlb_m_n_zhiding li,.ltlb_m_n_zhuti li{padding:15px 0;overflow: hidden;}
.ltlb_m_n_zhiding li>div:first-child,.ltlb_m_n_zhuti li>div:first-child{padding-top: 10px;}
.ltlb_m_n_zhiding li:not(:last-child),.ltlb_m_n_zhuti li:not(:last-child){border-bottom: 1px dashed #ccc;}

.li-img{float:left;width:20px;height:20px;}
.ltlb_m_n_zhiding .li-img{background: url(${ctxStatic}/img/llhb/zhiding-img.png) center center no-repeat;}
.ltlb_m_n_zhuti .li-img{background: url(${ctxStatic}/img/llhb/zhuti-img.png) center center no-repeat;}
.li-img + a{margin:0 15px 0 10px;color:#5ec520;}

.refresh{font-size: 12px;padding:0 15px;height:30px;line-height: 30px;background: #f2f2f2;}
.refresh img{margin-left: 5px;}
/*论坛列表 结束*/
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
                <a href="javascript:go('${ctx}/index');">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
                <div class=" font_1">
                    <!-- <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a> -->
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
    <div class="main clearfix">
        <div class="main_row_1">
            <div class="cur_position clearfix">
                <input id="post_title" value="${searchContent}" type="text" placeholder="请输入你要搜索的内容"class="fl">
                <select class="fl" name="" id="">
                    <option value="">帖子</option>    
                </select>
                <a id="post_search" href="javascript:void(0)"class="btn fl">搜索</a>
                <div class="luntan_resou fl">
                    <span>热搜:</span>
                    <c:forEach items="${searchList}" var="search" begin="0" end="3">
                    <a href="javascript:go('${ctx}/forum/list/?isSubSearch=true&boardId=${boardId}&searchContent=${search.search_content}')">${search.search_content}</a>
                    </c:forEach>
                    <!-- <a href="javascript:void(0)">搜索的内容</a>
                    <a href="javascript:void(0)">搜索的内容</a> -->
                </div>
            </div>
        	<c:if test="${isSubSearch ne true}">
            <div>
                当前位置>论坛>${boardName.par_name}>${boardName.name}
            </div>
            </c:if>
        </div>
        <c:if test="${isSubSearch ne true}">
        <div class="ltliebiao_top clearfix">
            <p class="fl">${boardName.name}</p>
            <p class="fl">今日:<span><c:if test="${empty postStat.post_count}">0&nbsp;</c:if>${postStat.post_count}&nbsp;</span></p>
            <span class="fl">|</span>
            <p class="fl ">主题:<span><c:if test="${empty titleRecord.type_count}">0 &nbsp;</c:if>${titleRecord.type_count} &nbsp;</span></p>
            <span class="fl">|</span>
            <p class="fl ">排名:<span><c:if test="${empty postStat.row_num}">0 &nbsp;</c:if><fmt:parseNumber value='${postStat.row_num}' type="number" integerOnly="true"/>&nbsp;</span></p>
        </div>
        </c:if>
        <div class="ltliebiao_fatie_fanye clearfix">
        	<c:if test="${isSubSearch ne true}">
            <a href="javascript:issue()"class="fl btn">发帖</a>
            </c:if>
            <div class="fanye fr">
                <c:set var="currentPage" value="${recordPage.pageNumber}" />
				<c:set var="totalPage" value="${recordPage.totalPage}" />
				<c:set var="actionUrl" value="${ctx}/forum/list/"/> 
				<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
				<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
				<c:set var="urlParas" value="?type=${type}&order=${order}&isSubSearch=${isSubSearch}&boardId=${boardId}&searchContent=${searchContent}&preDay=${preDay}" />
				<%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
            </div>
        </div>
        <c:if test="${isSubSearch ne true}">
        <div class="ltleibiao_class">
            <a href="javascript:go('${ctx}/forum/list?boardId=${boardId}')" data-type="">全部</a>
            <c:forEach items="${typeCountList}" var="typeCount">
            <c:if test="${not empty typeCount.board_name}">
             <a href="javascript:go('${ctx}/forum/list?type=${typeCount.board_type}&boardId=${boardId}')" data-type="${typeCount.board_type}">${typeCount.board_name}<span>${typeCount.type_count}</span></a>
            </c:if>
            </c:forEach>
        </div>
		</c:if>
        <div class="ltleibiao_main">
            <div class="ltleibiao_m_title clearfix">
                <div class="fl type"style="position: relative;">
                    <a href="javascript:go('${ctx}/forum/list?boardId=${boardId}&type=${type}&order=time')" data-order="time">最新</a>
                    <a href="javascript:go('${ctx}/forum/list?boardId=${boardId}&type=${type}&order=fp.page_view' )" data-order="fp.page_view">热门</a>
                    <a href="javascript:go('${ctx}/forum/list?boardId=${boardId}&type=${type}&order=fpr.re_count')" data-order="fpr.re_count">热帖</a>
                    <a href="javascript:go('${ctx}/forum/list?boardId=${boardId}&type=${type}&order=good')" data-order="good">精华</a>
                    <a class="more " href="javascript:void(0)">更多</a>
                    <div class="more_div">
                        <!-- <div>
                            <span>排序:</span>
                            <a class="more_cur" href="javascript:void(0)">发帖时间</a>
                            <span>|</span>
                            <a href="javascript:void(0)">回复/查看</a>
                            <span>|</span>
                            <a href="javascript:void(0)">查看</a>
                        </div> -->
                        <div id='select_time'>
                            <span>时间:</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=')">全部时间</a>
                            <span>|</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=1')">一天</a>
                            <span>|</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=2')">两天</a>
                            <span>|</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=7')">一周</a>
                            <span>|</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=30')">一个月</a>
                            <span>|</span>
                            <a href="javascript:go('${ctx}/forum/list?type=${type}&isSubSearch=${isSubSearch}&boardId=${boardId}&preDay=90')">三个月</a>
                        </div>
                    </div>
                </div>
                <!-- <div class="ltleibiao_main_r fr">
                    <span class="ltleibiao_main_r_user">作者</span>
                    <span class="ltleibiao_main_r_look">回复/查看</span>
                    <span class="ltleibiao_main_r_last">最后发表</span>
                </div> -->
            </div>
            <div class="ltleibiao_m_neirong">
                <ul class="ltlb_m_n_zhiding">
                <c:forEach items="${postList}" var="post">
                <c:if test="${post.is_top eq 1}">
                    <li>
                        <div class="fl clearfix">
                            <div class="li-img fl"></div>
                            <a class="fl" href="javascript:void(0)">[<c:if test="${empty post.type_name}">无类别</c:if>${post.type_name}]</a>
                            <span class="fl" ><a href="javascript:go('${ctx}/forum/forumlistUser?fid=${post.id}')" style="${post.good eq '1'? 'color:#EE7800':''}">${fns:abbr(post.post_title,80)}</a></span>
                        </div>
                        <div class="ltleibiao_main_r fr">
                            <span class="ltleibiao_main_r_user">${post.master_name}<span>${fn:substring(post.create_date,0,10)}</span></span>
                            <span class="ltleibiao_main_r_look">${not empty post.re_count? post.re_count:0}<span>${post.page_view}</span></span>
                            <span class="ltleibiao_main_r_last">${post.is_anony ne true? post.re_name:'匿名'}
                            	<span><c:if test="${not empty post.re_name}">${post.remarks}</c:if><c:if test="${empty post.re_name}">${post.ma_days}</c:if></span>
                            </span>
                        </div>
                    </li>
                 </c:if>
                 </c:forEach>
                </ul>
                <div style="padding:5px 15px;">
                <c:if test="${isSubSearch ne true && pageNumber <= 1}">
                    <div class="refresh">
                        	板块主题<a href="javascript:window.location.reload()"><img src="${ctxStatic}/img/llhb/refresh_03.png" alt=""></a>
                    </div>
                </c:if>
                </div>
                <ul class="ltlb_m_n_zhuti">
                <c:forEach items="${postList}" var="post">
                <c:if test="${post.is_top ne 1}">
                    <li>
                        <div class="fl clearfix">
                            <div class="li-img fl"></div>
                            <a class="fl" href="javascript:void(0)">[<c:if test="${empty post.type_name}">无类别</c:if>${post.type_name}]</a>
                            <span class=fl><a href="javascript:go('${ctx}/forum/forumlistUser?fid=${post.id}')" style="${post.good eq '1'? 'color:#EE7800':''}">${fns:abbr(post.post_title,80)}</a></span>
                        </div>
                        <div class="ltleibiao_main_r fr">
                            <span class="ltleibiao_main_r_user">${post.master_name}<span>${fn:substring(post.create_date,0,10)}</span></span>
                            <span class="ltleibiao_main_r_look">${not empty post.re_count? post.re_count:0}<span>${post.page_view}</span></span>
                            <span class="ltleibiao_main_r_last"><c:if test="${not empty post.re_name}">${post.is_anony ne true? post.re_name:'匿名'}</c:if><c:if test="${empty post.re_name}">${post.master_name}</c:if>
                            	<span><c:if test="${not empty post.re_name}">${post.remarks}</c:if><c:if test="${empty post.re_name}">${post.ma_days}</c:if></span>
                            </span>
                        </div>
                    </li>
                 </c:if>
                 </c:forEach>
                </ul>

            </div>
        </div>

        <div class="ltliebiao_fatie_fanye clearfix" style="margin-bottom: 50px;">
        	<c:if test="${isSubSearch ne true}">
            <a href="javascript:issue()"class="fl btn">发帖</a>
            </c:if>
            <div class="fanye fr">
				<c:set var="currentPage" value="${recordPage.pageNumber}" />
				<c:set var="totalPage" value="${recordPage.totalPage}" />
				<c:set var="actionUrl" value="${ctx}/forum/list/"/> 
				<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
				<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
				<c:set var="urlParas" value="?type=${type}&order=${order}&isSubSearch=${isSubSearch}&boardId=${boardId}&searchContent=${searchContent}&preDay=${preDay}" />
				<%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
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
<script>
// <!--轮播广告-->
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
    $(".main_banner").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
    $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
}

$(function(){
	/*导航栏样式*/
	//banner 样式切换
	$(".header_nav ul li").eq(7).addClass("header_nav_sel");
	
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
    });
});

$(function(){
    //点击更多
    $(".ltleibiao_m_title .more").click(function(){
        $(this).toggleClass('more_isup').next().toggle();
    });
    //点击更多中的内容
     $('.more_div a').click(function(){
        $(this).parents('.more_div').find('a').removeClass('more_cur');
        $(this).addClass('more_cur').parents('.more_div').hide();
        $(".ltleibiao_m_title .more").toggleClass('more_isup');
    }); 
    //帖子搜索
    $("#post_search").click(function(){
    	go('${ctx}/forum/list?isSubSearch=true&searchContent='+$("#post_title").val());
    });
  	//点击分类样式回显
  	$(".ltleibiao_m_title .type a[data-order='${order}']").css({'color':'#5EC520'});
  	$(".ltleibiao_class a[data-type='${type}']").css({'color':'#5EC520','border-color':'#5EC520'});
  	var dayIndex = "";
  	debugger;
  	switch ("${preDay}") {
		case '': dayIndex = 0; break;
		case '1': dayIndex = 1; break;
		case '2': dayIndex = 2; break;
		case '7': dayIndex = 3; break;
		case '30': dayIndex = 4; break;
		case '90': dayIndex = 5; break;
		default: dayIndex = 0; break;
	}
  	$("#select_time a").eq(dayIndex).addClass("more_cur");
});
/*发帖*/
function issue(){
	var loginName = $("#lo").html();
	if(loginName!=null && loginName!="" && loginName!=undefined){
		go('${ctx}/forum/posting?boradId=${boardId}');
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
</script>

</body>
</html>