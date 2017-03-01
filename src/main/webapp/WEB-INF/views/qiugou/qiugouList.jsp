<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>

<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gongyingqiugou-fuben.css"/>
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
.header_right{margin-top:12px;}
/*头部中部end*/

.main{width:1000px; margin:0px auto;]}
.header_banner{height: 442px;width: 100%;position: relative;margin-top: 10px;}

/*头部导航 start*/
.header_nav{width: 100%;min-width:1000px;height: 45px;position: absolute;top:0;left:0;z-index: 10;}
.header_nav .h_n_left, .header_nav .h_n_right{background: #5EC520;height:45px;position: absolute;top:0;}
.header_nav ul{width:1000px;margin: 0 auto;height:45px;background-color: #5EC520;}
.header_nav ul li{float: left;height: 45px;line-height: 45px;text-align: center;width: 110px;background: #5EC520;border-left: 1px solid #fff;position:relative;}
.header_nav ul li:first-child:hover .h_n_homedown{display:block;}
.header_nav .h_n_homedown{display:none;width:110px;position:absolute;top:45px;left:0;}
.header_nav .h_n_homedown a{display:block;height:40px;line-height:40px;background: #4F9028;}
.header_nav .h_n_homedown a:first-child{background: #2D5914;}
.header_nav ul .header_nav_sel{background: #4F9028;}
.header_nav ul li a{color: #FFFFFF;}
/*头部导航 end*/

/*内容start*/

/*当前位置*/
.main_row_1{overflow:hidden; }
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#5cb531;float:right; margin-top:10px; margin-left: 23px; text-align:center;}
.main_row_1 .btn_1 a{width:100%; height:100%; display:block; color:#FFF;  }

/*最新求购*/
.gq_newbuy{overflow:hidden; width:1000px; margin:15px auto;}
.gq_n_title{border-bottom:1px solid #ccc; overflow:hidden; }
.gq_n_title span{display:block; float:left; background-color:#5cb531; padding:5px 17px; font-size:16px; color:#FFF;}
.purc_main{margin-top:10px;}
.purc_main ul li{font-size:12px; color:#666;}

/*推荐企业*/
.gq_recompany{overflow:hidden; width:1000px; margin:15px auto;}
.gq_r_title{border-bottom:1px solid #ccc; overflow:hidden; }
.gq_r_title span{display:block; float:left; background-color:#5cb531; padding:5px 17px; font-size:16px; color:#FFF;}
.gq_r_title dd{width:20px; height:20px; display:block; background:url("${ctxStatic}/img/llhb/icon.png") -261px -118px no-repeat; float:right;  margin-top:5px;}
.gq_r_title p a{width:50px;display:block; float:right; margin-top:5px; color:#ee7800; font-size:12px; }
.gq_purc_left{width:490px; float:left;}
.gq_purc_right{width:490px; float:right; }
.gq_r_main{overflow:hidden; margin-top:10px; border:1px solid #ccc;}
.gq_r_main ul{overflow:hidden;}
.gq_r_main ul li{width:141px; height:100px;}
.gq_r_main .gq_r_m_up li{float:left; border-left; border-right:1px solid #ccc; border-bottom:1px solid #ccc;}
.gq_r_main .gq_r_m_down li{ float:left; border-left; border-right:1px solid #ccc; }
.gq_r_main ul li:nth-of-type(7n){border-right:0px;}
.gq_r_main ul li:nth-of-type(1){padding-left:5px;}

.gq_r_main li img{width:100%; height:100%;}
.gq_r_main li:hover{cursor:pointer;}
.gq_r_main li p{display:none;width:141px; height:100%; background-color:#000;opacity:0.8; position:relative; top:-100px; left:0px; z-index:15;  }
.gq_r_main ul li:nth-of-type(1) p{display:none;width:145px; height:100%; background-color:#000;opacity:0.8; position:relative; top:-100px; left:-4px; z-index:15;}
.gq_r_main li a{width:80px; position:relative; top:-200px; left:24px; z-index:16; display:none;font-size: 12px;} 
.gq_r_main li a span{margin-top:36px; display:block; color:#FFF; }
.gq_r_main ul li:nth-of-type(1):hover p{display:block;}
.gq_r_main li:hover p{display:block;}
.gq_r_main li:hover a{display:block;}

/*求购信息*/
.gq_massagebuy{width:1000px; margin:0px auto 125px;}
.gq_massagebuy .gq_r_title{width:100%; height:31px; overflow:visible;}
.gq_massagebuy ul{ position:relative; z-index:15px; }
.gq_massagebuy .gq_r_title{margin-bottom:3px;}
.gq_massagebuy .gq_r_title li{padding:0 10px; float:right; text-align:center;}
.gq_massagebuy .gq_r_title li p{display:inline-block; line-height:29px; position:relative; z-index:16px; font-size:14px;cursor:pointer;}
.gq_massagebuy .gq_r_title li .p_sel{ border-bottom:4px solid #5cb531; color:#5cb531;}
.gq_m_main{}
.gq_m_main table th{font-weight:bold; line-height:60px; }
.gq_m_main table th:nth-of-type(1){width:135px;}
.gq_m_main table th:nth-of-type(2){width:394px;}
.gq_m_main table th:nth-of-type(3){width:145px;}
.gq_m_main table th:nth-of-type(4){width:113px;}
.gq_m_main table th:nth-of-type(5){width:134px;}
.gq_m_main tr{border-bottom:1px dashed #ccc;}
.gq_m_main tr:nth-of-type(1){border-bottom:0px;}
.gq_m_main td{padding:5px 0px;font-size: 12px;color:#666;}
.gq_m_main td a{color:#666;}
.gq_m_main tr td:nth-of-type(6) a{width:72px; height:20px; background-color:#ee7800; border-radius:15px;display:block; text-align:center; color:#FFF;}
.gq_m_main tr td:nth-of-type(2) a:hover{color:#5cb531;}

/*左侧悬窗 start*/
.gf_ad_left{width:100px;position:absolute;top:298px;left:50%; margin-left:-615px;z-index:16;}
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

/*回到顶部悬窗 start*/
.nav_bottomlist{width:48px;position:fixed;bottom:5%;right:0;z-index:8;display:none;border:1px solid #ccc;}
.nav_bottomlist a{display:block;width:48px;height:48px;background-color:#fff;position:relative;}
.nav_bottomlist .nav_totop{border-top:1px solid #ccc;}
.nav_bottomlist a em{display:block;width:100%;height:100%;background:url(${ctxStatic}/img/llhb/totop.png) no-repeat 0 0;position:absolute;top:0;left:0;transition:all 0.4s ease;}
.nav_bottomlist .nav_totop em{background-position:0 -50px;}
.nav_bottomlist a span{display:none;padding:5px;text-align:center;line-height:19px;color:#ccc;transition:all 0.4s ease;}
.nav_bottomlist a:hover em{display:none;}
.nav_bottomlist a:hover span{display:block;}
.nav_bottomlist a img{display:block; padding-top:12px; padding-left:12px;}
.nav_bottomlist .nav_qone{ background-color:#F7F7F7; border-bottom:1px solid #ccc;}
.nav_bottomlist a img:hover{cursor:pointer;}
/*回到顶部悬窗 end*/
.tj_box li a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}
</style>
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
                <a href="${ctx }/index">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <select>
                    <option>供应</option>
                    <option>求购</option>
                  
                </select>
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
        <!--头部导航 end-->
    </div>
    <!--头部banner end-->
</header>
<!--头部 end-->

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
    	<div class="main_row_1">
        	<div class="cur_position">
        		当前位置>优蚁网>供应求购
        	</div>
			<a href="javascript:void(0)" class="btn cur_position_btn"style="margin-right: 0;background-color: #ee7800;" onclick="go('../main.html?name=固废求购')">发布求购</a>
            <a href="javascript:void(0)" class="btn cur_position_btn"style="background-color: #ee7800;" onclick="go('../main.html?name=固废供应')">发布供应</a>
            
        </div>
	<!-- main end-->
	</div>
<!-- end wrapper-->
</div>
<!-- 供求主要内容-->
<!-- 供求主要开始 gq_main start -->
<div class="gq_main">

	<!-- 最新求购开始 gf_newbuy start -->
	<div class="gq_newbuy">
		<div class="gq_n_title">
			<span>最新求购</span>
		</div>
		<%--  <div class="gq_purc_left">
			<div class="purc_main aaa gq_purc_left">
			
				<ul class="m_r_ul purc_main aaa" >
					<c:forEach items="${qiugouList }" var="list" varStatus="status">
			
					<c:if test="${status.count lt 9}">
						<li onclick="details('${list.id}');">
							<a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">求购。${list.info_title }</a>
							<span class="m_r_ul_span">${fn:substring(list.create_date, 0, 10)}</span>
						</li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="gq_purc_right">
			<div class="purc_main aaa">
				<ul class="m_r_ul " >
					<c:forEach items="${qiugouList }" var="list" varStatus="status">
					<c:set var="sta" value="${status }"></c:set>
					<c:if test="${status.count gt 8}">
						<li onclick="details('${list.id}');">
							<a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">求购。${list.info_title }</a>
							<span class="m_r_ul_span">${fn:substring(list.create_date, 0, 10)}</span>
						</li>
					</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>  --%>
	<!-- 最新求购结束 gf_newbuy end -->
	
	</div>

	<!-- 推荐企业开始 gq_recompany start-->
	<div class="gq_recompany">
		<div class="gq_r_title">
			<span>推荐商家</span><p><a href="javascript:void(0)">换一批</a></p><dd></dd>
		</div>
		<div class="gq_r_main">
			<ul class="gq_r_m_up bbb" >
				<c:forEach items="${comList }" var="bus" varStatus="status">
					<c:set var="sta" value="${status }"></c:set>
					<c:if test="${status.count lt 8}">
					<li>
						<c:if test="${empty bus.logoImg }"><img src="${ctxStatic}/img/llhb/default.png""></c:if>
		                <c:if test="${!empty bus.logoImg }"><img src="${bus.logoImg }"></c:if>
						<p></p>
						<a href="javascript:void(0)"><span>${bus.cname }</span></a>	
					</li>
					</c:if>
				</c:forEach>
			</ul>
			<ul class="gq_r_m_down bbb tj_box">
				<c:forEach items="${comList }" var="bus" varStatus="status">
					<c:set var="sta" value="${status }"></c:set>
					<c:if test="${status.count gt 7}">
					<li>
						<c:if test="${empty bus.logoImg }"><img src="${ctxStatic}/img/llhb/default.png""></c:if>
		                <c:if test="${!empty bus.logoImg }"><img src="${bus.logoImg }"></c:if>
						<p></p>
						<a href="javascript:void(0)">${bus.cname }</a>	
					</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	<!-- 推荐企业结束 gq_recompany end -->
	</div>
	
	<!-- 求购信息 gf_massagebuy-->
	<div class="gq_massagebuy">
		<div class="gq_r_title">
			<span>求购信息</span>
			<ul>
			<c:forEach items="${dps }" var="dp">
				<c:choose>
					<c:when test="${dp.id eq 429 }">
						<li value="${dp.id }"><p class="p_sel" >${dp.name }</p></li>
					</c:when>
					<c:otherwise>
						<li value="${dp.id }"><p>${dp.name }</p></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</ul>
		</div>
		<div class="gq_m_main" >
			<table id="tableid">
			
				<%-- <tr>
					<th>发布产品</th>
					<th>求购产品</th>
					<th>报价截止时间</th>
					<th>采购数量</th>
					<th>采购商所在地</th>
					<th>我要报价</th>
				</tr>
				<jsp:useBean id="now" class="java.util.Date" /> 
				<c:forEach items="${qgList }" var="list" varStatus="status">
				<fmt:parseDate var="someDate"value="${list.past_date}"pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:parseDate var="nowDate"value="${now}"pattern="yyyy-MM-dd HH:mm:ss"/>
				<c:set var="interval"value="${nowDate.time - someDate.time}"/>
					<tr onclick="details('${list.id}');">
					<td >${fn:substring(list.create_date, 0, 10)}</td>
					<td><a href="javascript:void(0)">${list.info_title }</a></td>
					<td>还剩<fmt:formatNumber value="${interval/1000/60}"/>天</td>
					<td>${list.amount }${list.label }</td>
					<td>${list.saname }</td>
					<td><a href="javascript:void(0)">我要报价</a></td>
				</tr>
				</c:forEach> --%>
				
			</table>
		</div>
	<!-- 求购信息 gf_massagebuy-->
	</div>
<!-- 供求主要结束 gq_main end -->
</div>
<!-- 底部信息开始 footer start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
 <c:set var="currentPage" value="${recordPage.pageNumber}" />
 <c:set var="totalPage" value="${recordPage.totalPage}" />
 <c:set var="actionUrl" value="${ctx}/qiugou/list/"/>
 <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
 <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />


<!-- JS代码 -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".header_nav ul li").eq(2).addClass("header_nav_sel");
		loadlist();
		 $.ajax({
				type : "POST",
				url : "${ctx}/qiugou/listall",
				dataType : 'json',
				success : function(data) {
					var htmls = "<ul class=\"m_r_ul purc_main aaa \" >";
					$.each(data,function(index,item){
						if(index%2 == 0){
							htmls+="<li onclick=\"details('"+item.id+"');\" style=\"width:490px;float:left;\"><a href=\"javascript:void(0)\" class=\"m_r_ul_a tmui-ellipsis\">求购。"+item.info_title +"</a>";
							htmls+="<span class=\"m_r_ul_span\">"+item.create_date.substring(0,10)+"</span></li>";
						}else{
							htmls+="<li onclick=\"details('"+item.id+"');\" style=\"width:490px;float:right;\"><a href=\"javascript:void(0)\" class=\"m_r_ul_a tmui-ellipsis\">求购。"+item.info_title +"</a>";
							htmls+="<span class=\"m_r_ul_span\">"+item.create_date.substring(0,10)+"</span></li>";
						}
					});
					htmls+="</ul>";
					$(".gq_n_title:eq(0)").after(htmls);
				}
			});
		/*存储个标题距顶部距离*/
		var contentNavArr = [];
		var ad_top=$(".header_banner").each(function(){
			contentNavArr.push($(this).offset().top);
			
		//换一批
		$(".gq_recompany .gq_r_title a").click(exchange);
		
		$(".gq_massagebuy .gq_r_title li").click(function(){
			$(this).siblings().find("p").removeClass();
			$(this).find("p").addClass("p_sel");
			loadlist($(this).val());
			});
		
		/* $(".gq_massagebuy .gq_r_title li").each(function (){
			$(this).hover(function (){
				$(this).siblings().find("p").removeClass();
				$(this).find("p").addClass("p_sel");
			});
			//加载列表
			alert($(this).getAttribute ( 'data-uid' ));
			if($(this).getAttribute ( 'data-uid' ))
			
		}); */
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
		/*求购信息 标题点击变色事件*/
		$(".gq_r_title li").click(function(){
			$(this).siblings().find("p").removeClass();
			$(this).find("p").addClass("p_sel");
		});
	});
	//下方加载列表
	function loadlist(str){
		var aa=$(".gq_massagebuy .gq_r_title li:last").val();
		if(str != ""){
			aa = str;
		}
		var htmls = "<tr><th style=\"width:135px;\">发布产品</th><th style=\"width:394px;\">求购产品</th><th style=\"width:145px;\">报价截止时间</th><th style=\"width:113px;\">采购数量</th><th style=\"width:134px;\">采购商所在地</th><th>我要报价</th></tr>";
		$.ajax({
			type : "POST",
				url : "${ctx}/qiugou/typeList",
				data : "typeid=" + aa,
				dataType : 'json',
				success : function(data) { 
					$(".gq_m_main #tableid").empty();
					$.each(data,function(index,item){
						var date1 = item.icd.split(" ")[0];
						var now = new Date();
						//var strtime = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate(); 
					    var oDate1= date1.split("-");
					    //var oDate2= strtime.split("-");
					    var strDateS = new Date(oDate1[0], oDate1[1]-1, oDate1[2]);
					    //var strDateE = new Date(oDate2[0], oDate2[1]-1, oDate2[2]);
					    day = parseInt(Math.abs(strDateS - now ) / 1000 / 60 / 60 /24);//把相差的毫秒数转换为天数 
						htmls+="<tr onclick=\"details('"+item.id+"');\">";
						htmls+="<td>"+item.icd.substring(0,10)+"</td>";
						htmls+="<td><a href=\"javascript:void(0)\">"+item.info_title +"</a></td>";
						htmls+="<td>还剩"+day+"天</td>";
						htmls+="<td>"+item.amount+item.label+"</td>";
						if(item.saname==null){
							htmls+="<td> </td>";
						}else{
							htmls+="<td>"+item.saname +"</td>";
						}
						htmls+="<td><a href=\"javascript:void(0)\">我要报价</a></td>";
						htmls+="</tr>"; 
					});
					$(".gq_m_main #tableid").html(htmls);
				}
			});
	}
	function exchange(){
		/* if('${currentPage}'=='${totalPage}'){
			window.location.href='${actionUrl}1${urlParas}';
		}else{
			window.location.href='${actionUrl}${currentPage + 1}${urlParas}';
		} */
		a = 0;
		var htmls = "";
		var htmls2 = "";
		var pics="";
		var pics2 = "";
		if('${pa}'){
			a  = '${pa}';
		}
		$.ajax({
			type : "POST",
				url : "${ctx}/qiugou/getList",
				data : "pageNum=" + (++a),
				dataType : 'json',
				success : function(data) { 
					if(data== ""){
						pageNum=0;
						return;
					}
					$.each(data,function(index,item){
						//$(".aaa ul").html('');
						$(".bbb").html('');
						var src="";
						if(item.pic1 != "" && item.pic1 != null){
							src=item.pic1;
						}else if(item.pic2 != "" && item.pic2 != null){
							src=item.pic2;
						}else if(item.pic3 != "" && item.pic3 != null){
							src=item.pic3;
						}else{
							src='${ctxStatic}/img/llhb/default.png';
						}
						if(index <7){
							
							htmls +="<li onclick=\"details('"+item.id+"');\"><a href=\"javascript:void(0)\" class=\"m_r_ul_a tmui-ellipsis\">求购。"+item.info_title+"</a>";
							htmls+="<span class=\"m_r_ul_span\">"+item.create_date.split(" ")[0]+"</span>";
							pics+="<li onclick=\"details('"+item.id+"');\"><img src=\""+src +"\" /><p></p><a href=\"javascript:void(0)\"><span>"+item.info_title+"</span></a></li>";
						}else{
							htmls2 +="<li onclick=\"details('"+item.id+"');\"><a href=\"javascript:void(0)\" class=\"m_r_ul_a tmui-ellipsis\">求购。"+item.info_title+"</a>";
							htmls2+="<span class=\"m_r_ul_span\">"+item.create_date.split(" ")[0]+"</span></li>";
							pics2+="<li onclick=\"details('"+item.id+"');\"><img src=\""+src +"\" /><p></p><a href=\"javascript:void(0)\"><span>"+item.info_title+"</span></a></li>";
						}
					
					});
					//$(".gq_purc_left ul").html(htmls);
					//$(".gq_purc_right ul").html(htmls2);
					$(".gq_r_m_up").html(pics);
					$(".gq_r_m_down").html(pics2);
					
				}
			}); 
	}
	function details(str){
		location.href = '${ctx}/qiugou/details?id='+str;
	}
		
</script>
</body>

</html>