<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<link rel="shortcut icon" href="javascript:void(0);"/> 
		<title>优蚁环保-环保供求，提供环保行业最新需求和服务提供商的信息</title>
		<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
		<meta name="keywords" content="优蚁环保,需求,服务，供应商" />
		<meta name="description" content="优蚁环保供求市场，提供环保行业最新需求信息、环保业务供应商信息。优蚁环保有专业的环保公司提供服务，优蚁环保，中国领先的环保行业一站式服务平台环保服务">
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
		
		<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/gongyingqiugou_index.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>



        <style type="text/css">
            .header_middle .header_search {margin-left:80px;margin-top:50px;}
            .header_search .select_div{float:left;height:35px;line-height:35px;position:relative;}
            .header_search  select {float: left;height: 35px;line-height: 35px;width: 92px;border: 1px solid #ccc;}
            .header_middle .header_search .h_s_middlebefore{z-index:1;content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
            .header_search .select_div input{width: 280px;height: 35px;float: left;border: 1px solid #5EC520;text-indent: 28px;box-sizing: border-box;font-size: 12px;}
            .header_search .select_div a{display:block;float:left;height: 35px;line-height:35px;width: 70px;background: #5EC520;color: #FFFFFF;text-align: center;padding:}

            /*左侧悬窗 start*/
            .gf_ad_left{width:80px;position:absolute;top:298px;left:50%; margin-left:-600px;z-index:16;}
            .gf_ad_left img{width:100%;}
            /*左侧悬窗 end*/
            .main_top_nav{height:390px;width: 100%;margin-top: 10px; overflow: hidden;border: 0px solid gray;text-align:center;margin-bottom: 10px;}

            .main_top_nav_left{float: left;width: 200px;z-index:4;border: 0px solid #5CB531;position: relative; border:1px solid #5CB531;}
            .main_top_nav_left h3{display: block;width:100%;background-color: #5CB531; color: white;height: 50px;text-align: center;line-height: 50px;}

            .main_middle_market_left{float:left;width:49%;height:99%;border:1px solid #E5E5E5;}
            .main_middle_market_right{float:right;width:48.5%;height:99%;margin-right:0px;border:1px solid #E5E5E5;}
            .m_m_m_l_r_top{float:left;width:100%;height:40px;border-bottom:1px solid #cccccc;text-align: center; }
            .m_m_m_l_r_top .right2{height:40px;border:0px solid red;margin-right:10px;color:#999;line-height: 40px;font-size:20px;}

            .m_m_m_l_r_middle_l{float:left;width:74%;height:700px;border:0px solid red;margin-left:5px;overflow: hidden;}
            .m_m_m_l_r_middle_l .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;float:left;width:100%;text-align: left;margin-bottom: 26px;}

            .pic_div{float:left;width:165px;height:50px;border:0px solid #E5E5E5;position: relative;padding:5px 10px;transition: width 0.5s ease, linear 0s;list-style-type:none;}
            .pic_div_img_1{width:165px;height:50px;float:left;border:1px solid #E5E5E5;display: block;}
            .pic_div_img_2{width:165px;height:50px;float:left;margin-left:0px;}
            .pic_div_hidden{position: absolute;top: 5px;left:10px;background: #fff none repeat scroll 0 0;border: 3px solid #8fe087;display: block;width:165px;height: 50px;opacity: 0;overflow: hidden;transition: width 0.5s linear 0s;}

            .pic_div_real{width:355px;height:150px;border:0px solid red;position: relative;z-index:99;}
            .pic_div_real_em{border-bottom: 1px dotted #ddd;display: block;font-style: normal;font-weight: bold;line-height: 60px;padding-bottom: 5px;height:51px;overflow: hidden;}
            .pic_div_real_em_span{width:150px;margin-left:10px;float:left;text-align: center;}
            .pic_div_real_p{color: #999;cursor: default;line-height: 18px;padding: 5px;text-align:left;font-size: 12px;}
            .pic_div_real_p_span {color: #2a781f;display: block;font-size: 14px;line-height: 22px;width:80%;margin-left: 10%;text-align: center;}
            .pic_div_real_span {background: #8fe087 none repeat scroll 0 0;bottom: 0;color: #fff;display: block;height: 20px;line-height: 20px;position: absolute;right: 0;text-align: center;width: 70px;padding:0 10px;}

            .pic_div_bak{display: block;float:left;color:#5EC520;line-height: 35px;margin-left:5px;width:95%;height:35px;}
            .m_m_m_l_r_middle_r{float:right;width:23%;height:390px;margin-right: 2%;border:0px solid yellow;text-align: center;overflow: hidden;margin-top:30px;}
            .m_m_m_l_r_middle_r .title{display:block;font-size: 16px;font-weight: bold;line-height: 30px; border:0px solid red;}
            .m_m_m_l_r_middle_r .resou{display:block;width:98%;padding:0 0%;border:1px solid #E5E5E5;margin-bottom: 8px; height:30px;line-height: 30px;}
            .m_m_m_l_r_middle_r .resou:hover{color:#5EC520;}
            .resou_selected{color:#5EC520;}

            .scroll_list1 table{width:100%;}
            .scroll_list1 table tr{border-bottom: 1px dashed #ccc;}
            .scroll_list1 table tr{color:black;}
            .scroll_list1 table tr:hover{background-color: #efefef;cursor: pointer;color:red;}
            .scroll_list1 table tr th{font-size: 16px;padding:2px;}
            .scroll_list1 table tr td{padding:2px;min-width:80px;}

            .c3_bottom .c3_b_advantage li{float:left;padding:10px 27px;cursor: pointer;}
            .c3_bottom .c3_b_advantage li:hover p{color:#5EC520;}
            .c3_bottom .c3_b_advantage li img{width:70px;height:70px;display: block}
            .c3_bottom .c3_b_advantage li p{margin-top: 15px;text-align: center;}

            .info_a:hover{color:#5EC520}

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
			
			
			/*发布需求弹出框样式start */
			.require-box{width:298px;height:370px;background-color: #FFFFFF;border: 1px solid #CCC;font-family: "微软雅黑";position: absolute;z-index: 11;top: 35px;left: 228px;display:none;}
			.rb-item{margin-top: 6px;margin-left: 32px;position: relative;}
			.rb-inoneline{display: inline-block;}
			.rb-p1{font-size: 14px;margin-top: 10px;margin-left: 10px;color: #000000;}
			.rb-p2{font-size: 12px;color: #7A7A7A;margin-bottom: 2px;}
			.rb-p3{font-size: 14px;color: #7A7A7A;}
			.rb-a{display: block;margin-top: 5px;margin-left: 36px;width:224px;height:42px;background-color: #EF7800;color: #FFFFFF;text-align: center;line-height: 42px;font-size: 18px;cursor: pointer;}
			.rb-word{padding-top: 5px;position: relative;top: -8px;}
			.rb-imgdiv{height:46px;width:46px;}
			.rb-word p{height: 16px;}
			/*发布需求弹出框样式end */
       
        </style>
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
				<div class="header_middle" style="vertical-align: middle;height: 145px;">
					<h1 class="header_logo" style="display: block;float:left;">
						<a href="${ctx }/index">
							<img src="${ctxStatic}/img/llhb/mall_logo.png"alt="环保服务平台"/>
						</a>
					</h1>
					<div class="header_search">
						
                        <select >
                            <option value="1">环保需求</option>
                            <%--<option value="2">求购</option>--%>
                        </select>
						<div class="select_div">
							<span class="h_s_middlebefore"></span>
							<input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;">
							<a class="font_3" href="javascript:sou();" style="margin-left:-1px;">搜索</a>
							<a class="font_3 showRequireBox" href="javascript:void(0);" onclick="window.open('${ctx}/addNeed');" style="margin-left:50px;width:130px; background-color:#ee7800;">发布环保需求</a>
							<%--<a class="font_3" href="${ctx }/home?str=/qiugou" style="margin-left:10px;width:100px;background-color:#ee7800;">发布求购</a>--%>
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
					<div class="header_right">
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

		<!--中间部分 start-->
		<div class="wrapper" style="border:0px solid red;">
            <!--主框架 start-->
            <div class="main" style="border:0px solid yellow;">
                <!--2F 环保供求 start-->
                <div class="content1 contentNav" style="border:0px solid orangered;">
                    <div class="content_title">
                        <a href="${ctx }/EntLib" class="c_t_floor">&nbsp;&nbsp;环保供求</a>
                        <p class="c_t_right font_1" style="float:left;margin-left:20px;">新增需求:<span>${newHbNum }</span></p>
                    </div>
                    <!--固废供求页添加  主体上方导航栏 start-->
                    <div class="main_top_nav" style="height:auto;">
                        <div class="main_middle_market_right" style="width:998px;height: 500px;">
                            <div class="m_m_m_l_r_top"style="width:100%;">
                                <div class="right2" style="margin-left: -180px;">环保业务需求信息 </div>
	                               <div style="margin-top: -40px; margin-left: 200px;">
	                                 <select style="height:30px; width:90px;line-height: 30px;border:solid 1px #C9CACA;margin-left:90px;">
	                        				<option value="环保业务">全部</option>
	                         	 		<c:forEach items="${cts}" var="s">
	         	         					<option value="${s.remarks }">${s.remarks}</option>
  	        							</c:forEach>
	                              	</select>
                                 		<label style="margin-left: 30px;"></label>
		                           		<input id="startTime" name="startTime" type="text" class="mh_date" style="width:100px;margin-top:5px;" value="${startTime}"/>&nbsp;~&nbsp;
								        <input id="endTime" name="endTime" type="text" class="mh_date" style="width:100px;margin-top:5px;margin-right: -250px;" value="${endTime}"/>
                            			<a href="javascript:selectrequrieByDate()" style="display:block;float:right;height:30px;line-height: 30px;color:#fff;text-align: center;background-color: #5ec520;border:1px solid #5ec520;width:60px; margin-right: 0px;margin-top:5px;">
		                            		查找</a>
	                               </div>
                            </div>
                            <div class="for_scroll_table" style="position:relative; height: 43px;margin-top:40px;"></div>
                            <div class="scroll_list1" style="height:400px;width:100%;overflow:hidden;">
                                <table id="tavle">
                                    <thead class="scroll_thead">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${crs }" var="s">
                                    	<!-- 过滤掉状态为'提交'的数据 -->
                                    	<c:if test="${s.trade_status != '提交'}">
                                        <tr onclick="supplyDetail(${s.id},'${s.trade_status}')">
                                		 	<td>${s.remarks }</td>
                                            <td>
                                            <c:set var = "name" value="${s.name }"></c:set>
                                            <c:out value="${fn:substring(name,0,1) }**"></c:out>
                                           	</td>
                                           	<td>
                                           	<c:set var = "phone" value="${s.phone }"></c:set>	
                                           	<c:out value="${fn:substring(phone,0,3) }********"></c:out>								
                                            </td>
                                            <td <c:if test="${s.trade_status == '已解决'}"> style='color:red;'</c:if> >
                                                ${s.trade_status}
                                            </td>
                                            <td>
                                            <c:set var  = "createDate" value="${s.create_date }"></c:set>
                                            <c:out value="${fn:substring(createDate,0,10) }"></c:out>
                                            </td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="main_middle_market_left" style="float:left;width:998px;height:500px;margin-top: 5px;">
                            <div class="m_m_m_l_r_top"style="width:100%;">
                                <div class="right2">环保业务提供商</div>
                            </div>
                            <div class="m_m_m_l_r_middle_l">
                                <span class="title">
                                    服务推荐
                                    <a href="javascript:void(0);" class="hbgq_hyp" onclick="getRandomCompanyType();">换一批</a>
                                </span>
                                <ul id="pic_ul" style="width:950px;display: block;border:0px solid red;float:left;">
                                    <c:forEach items="${com}" var="c" varStatus="sta">
                                        <li class="pic_div">
                                            <a href="javascript:void(0);">
                                                <c:choose>
                                                    <c:when test="${!empty c.img  && c.img != 'null' }"><img class="pic_div_img_1" title="${c.name}"  src="${c.img }"></c:when>
                                                    <c:otherwise><img class="pic_div_img_1" title="${c.name}"   src="${ctxStatic}/img/llhb/qiyeku01.png"></c:otherwise>
                                                </c:choose>
                                            </a>
                                            <div class="pic_div_hidden"
                                                 <c:if test="${sta.count == 24}">style="left:-175px;top:-55px;" </c:if>
                                                 <c:if test="${sta.count % 4 == 0}">style="left:-175px;" </c:if>
                                                 <c:if test="${sta.count >  20}">style="top:-55px;" </c:if>
                                            >
                                                <div class="pic_div_real">
                                                    <em class="pic_div_real_em">
                                                        <c:choose>
                                                            <c:when test="${!empty c.img  && c.img != 'null' }"><img class="pic_div_img_2" title="${c.name}"  src="${c.img }"></c:when>
                                                            <c:otherwise><img class="pic_div_img_2" title="${c.name}"   src="${ctxStatic}/img/llhb/qiyeku01.png"></c:otherwise>
                                                        </c:choose>
                                                        <span class="tmui-ellipsis pic_div_real_em_span" style="">${c.name}</span>

                                                    </em>
                                                    <p class="pic_div_real_p">
                                                        <span  class="tmui-ellipsis pic_div_real_p_span">
                                                            ${c.name}
                                                        </span>
                                                        <c:out value="${fn:substring(c.shop_desc,0,50) }..."></c:out>
                                                    </p>
                                                    <span class="pic_div_real_span">
                                                        <a target="_blank" href="javascript:void(0);" onclick="goQiYeKu(${c.id})" style="color:white;">进入首页</a>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                        <c:if test="${sta.count % 4 == 0}">
                                            <div class="clear"></div>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="m_m_m_l_r_middle_r">
                                <span class="title">服务业务</span>
                                <c:forEach items="${hbTypes }" var="type" varStatus="sta">
                                    <a href="javascript:void(0);"  class="resou tmui-ellipsis" title="${type.name }" onclick="getCompanyByType(this,${type.code})">
                                        ${type.name }
                                        <input type="hidden" id="hb_type_${sta.index+1}" value="${type.code}">
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div style="width:100%;height: 20px;border:0px solid #333;margin-top: -10px;">
                        <span style="color: #ccc;font-size: 12px;">*所有信息来源网络</span>
                    </div>
                </div>
                <!--2F 环保供求 end-->
            </div>
            <!--主框架 end-->
		</div>
		<!--中间部分 end-->

		<!--底部 start-->
        <div class="popumask aa" style="z-index: 21;"></div>
        <div class="populayer pl_normal bb" style="z-index:22;">
            <div class="layer_top">
                <span>提示</span>
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3">
                <p></p>
            </div>
        </div>
        <input type="hidden" id="hb_page_num" value="1">
		<footer>
		    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
		    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
		</footer>
        <%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
		<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
		<!--底部 end-->
    <script type="text/javascript">



   		var scrolltimer2;
        $(function () {

            bindAnimate();
            //滚动
            clonethead();
            smooth_scroll2(".scroll_list1","tr");
            //setInterval("rollqiugou()", 1000 * 60 * 30);

            $(".mall_sort .choese_sort .sort_zh").hide();
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
            $(".content").click(function () {
                go('固废供求-副本-9-17.html');
            });
            refreshHbService();
            
        	//开始时间
			$("#startTime,#endTime").manhuaDate({	
				Event : "click",//可选				       
				Left : 0,//弹出时间停靠的左边位置
				Top : -16,//弹出时间停靠的顶部边位置
				fuhao : "-",//日期连接符默认为-
				isTime : false,//是否开启时间值默认为false
				beginY : 1949,//年份的开始默认为1949
				endY :2100//年份的结束默认为2049
			});

        });

        $(document).ready(function () {
            $(".header_nav ul li").eq(3).addClass("header_nav_sel");
            //$(".main_middle_market_nav a:last-child").css("width","0px");
            $('.select_div input').bind('keypress', function (event) {
                if (event.keyCode == "13") {
                    sou();
                }
            });
        });
        function goPage(str) {
            window.open(str, "_blank");
        }
        function sou() {
            var v = $(".header_search select").val();
            var title = $(".select_div input").val();
            if (v == 1) {
                //location.href = '${ctx}/solidsupply/hbDemandQuery?title=' + title;
                location.href = '${ctx}/supply-demand?title=' + title;
            } else {
                location.href = '${ctx}/qiugou/searchList?searchtext=' + title;
            }
        }
/*        function smooth_scroll(obj,sub){
            var $dom2 = $(obj);
            $dom2.find("thead").remove();
            $dom2.find("tbody").append($dom2.find("tbody").html()).append($dom2.find("tbody").html());
            var $scroll_h2=$dom2.get(0).scrollHeight/2;
            var $scroll_t2=0;
            var scrolltimer2 = setInterval(function(){
                if($scroll_t2>=$scroll_h2){
                    $scroll_t2=0;
                }
                $dom2.scrollTop(($scroll_t2+=0.5));
            },30);
            $dom2.find(sub?sub:"a").on("mouseover",function(){
                clearInterval(scrolltimer2);
            }).on("mouseleave",function(){
                scrolltimer2 = setInterval(function(){
                    if($scroll_t2>=$scroll_h2){
                        $scroll_t2=0;
                    }
                    $dom2.scrollTop(($scroll_t2+=0.5));
                },30);
            });
        }*/
        function rollqiugou() {
            window.location.reload();
        }

        function goQiYeKu(id){
            window.open('${ctx}/homepage/'+id);
        }

        function showMess(str){
            $(".aa").show();
            $(".bb .pl_content p").html(str);
            $(".bb").show();
            setTimeout(function(){
                $(".aa").hide();
                $(".bb .pl_content p").html("");
                $(".bb").hide();
            },3000);
        }

        function supplyDetail(id,trade_status){
            if(trade_status=='洽谈中'){
                showMess("该环保需求已在洽谈中,请查看<提交中>的信息");
            }else if(trade_status=='已解决'){
                showMess("该环保需求已解决,请查看<提交中>的信息");
            }else if(trade_status=='关闭中'){
                showMess("该环保需求已关闭,请查看<提交中>的信息");
            }else{
                window.open('${ctx}/supply-demand/details/'+id);
            }
        }

        function getCompanyByType(mThis,type){
            clearInterval(freshHbServiceTimer);
            $(mThis).addClass("resou_selected");
            $(mThis).siblings().removeClass("resou_selected");
            $(".pic_div").remove();
            $("#hb_page_num").val(1);
            //根据类型获取对应的企业
            $.ajax({
                type : "POST",
                url : "${ctx}/index/getCompanyByType",
                data : "type=" + type+"&num=24",
                dataType : 'json',
                success : function(data) {
                    generateHtml(data);
                    refreshHbService();
                }
            });
        }

        function getRandomCompanyType(){
            var idx = $(".resou_selected:eq(0)").index();
            var type = $("#hb_type_"+idx).val();
            var pageNum = parseInt($("#hb_page_num").val()) + 1;
            //根据类型获取对应的企业
            $.ajax({
                type : "POST",
                url : "${ctx}/index/getRandomCompanyByType",
                data : "type=" + type+"&num=24" + "&pageNum=" + pageNum,
                dataType : 'json',
                success : function(data) {
                    if(pageNum > data.totalPage){
                        $("#hb_page_num").val(0);
                        return;
                    }else if(pageNum == data.totalPage){
                        $("#hb_page_num").val(0);
                        $(".pic_div").remove();
                    }else{
                        $("#hb_page_num").val(pageNum);
                        $(".pic_div").remove();
                    }
                    generateHtml(data.list);
                    refreshHbService();
                }
            });
        }

        function clonethead(){
            var each_txt=["环保业务","联系人","联系方式","需求状态","需求时间"];
            var each_w=[];
            $(".scroll_thead td").each(function(){
                each_w.push(parseInt($(this).outerWidth()));
            });
            var mythead=$("<div class='clearfix' style='position:absolute;top:0;left:0;height:32px;line-height:32px;width:100%;background:#fff;'></div>");
            for(var i=0;i<each_w.length;i++){
                var mytd = $("<div class='fl'>"+each_txt[i]+"</div>");
                mythead.append(mytd);
                if(i==each_w.length-1){
                	mytd.css("width",190+"px");
                }else{
               	    mytd.css("width",each_w[i]+"px");
                }
            }
            $(".for_scroll_table").append(mythead);
        }

        var freshHbServiceTimer;
        function refreshHbService(){
            clearInterval(freshHbServiceTimer);
            freshHbServiceTimer = setInterval(function(){
                //获取当前选择的服务类型
                var idx = $(".resou_selected:eq(0)").index();
                if(idx == -1 || idx == 9){
                    idx =1;
                }else{
                    idx ++;
                }
                $(".resou:eq("+(idx -1 )+")").click();
            },60000);

        }

        function generateHtml(data){
            var html = '';
            $.each(data,function(index,item){
                html += '<li class="pic_div">';
                html += '<a href="javascript:void(0);">';
                if(item.img != null && item.img != "" ){
                    html += '<img class="pic_div_img_1" title="'+item.name+'"  src="'+ item.img +'">';
                }else{
                    html += '<img class="pic_div_img_1" title="'+item.name+'"  src="${ctxStatic}/img/llhb/qiyeku01.png">';
                }
                html += '</a>';
                var cot = index + 1;
                if(cot == 24){
                    html += ' <div class="pic_div_hidden" style="left:-175px;top:-55px;">';
                }else if(cot % 4 == 0){
                    html += ' <div class="pic_div_hidden" style="left:-175px;">';
                }else if(cot > 20 ){
                    html += ' <div class="pic_div_hidden" style="top:-55px;">';
                }else{
                    html += '<div class="pic_div_hidden">';
                }
                html += '<div class="pic_div_real">';
                html += '<em class="pic_div_real_em">';
                if(item.img != null && item.img != "" ){
                    html += '<img class="pic_div_img_2" title="'+item.name+'"  src="'+ item.img +'">';
                }else{
                    html += '<img class="pic_div_img_2" title="'+item.name+'"  src="${ctxStatic}/img/llhb/qiyeku01.png">';
                }
                html += '<span class="tmui-ellipsis pic_div_real_em_span" style="">'+item.name+'</span>';
                html += '</em>';
                html += '<p class="pic_div_real_p">';
                html += '<span  class="tmui-ellipsis pic_div_real_p_span">';
                html += item.name;
                html += '</span>';
                if(item.shop_desc != "" && item.shop_desc != null){
                    html += item.shop_desc.substring(0,50) + "..."
                }else{
                    html += "...";
                }
                html += '</p>';
                html += '<span class="pic_div_real_span">';
                html += ' <a target="_blank" href="javascript:void(0);" onclick="goQiYeKu('+item.id+')" style="color:white;">进入首页</a>';
                html += '</span>';
                html += '</div>';
                html += '</div>';
                html += '</li>';
                if(cot % 4 == 0){
                    html += ' <div class="clear"></div>';
                }

            });
            $("#pic_ul").append(html);
            bindAnimate();
        }
        function smooth_scroll2(obj,sub){
            var $dom2 = $(obj);
            $dom2.find("thead").remove();
            $dom2.find("tbody").append($dom2.find("tbody").html()).append($dom2.find("tbody").html());
            var $scroll_h2=$dom2.get(0).scrollHeight/2;
            var $scroll_t2=0;
            scrolltimer2 = setInterval(function(){
                if($scroll_t2>=$scroll_h2){
                    $scroll_t2=0;
                }
                $dom2.scrollTop(($scroll_t2+=0.5));
            },30);
            $dom2.find(sub?sub:"a").on("mouseover",function(){
                clearInterval(scrolltimer2);
            }).on("mouseleave",function(){
                scrolltimer2 = setInterval(function(){
                    if($scroll_t2>=$scroll_h2){
                        $scroll_t2=0;
                    }
                    $dom2.scrollTop(($scroll_t2+=0.5));
                },30);
            });

        }
		function selectrequrieByDate(){
			var enviroment = $(".main_middle_market_right select option:selected").val();
			var startTime = $('#startTime').val();
			var endTime = $('#endTime').val();
			$.ajax({
				type:"POST",
				url:"${ctx}/index/selectRequriebyDate",
				data:"enviroment="+enviroment+"&startTime="+startTime+"&endTime="+endTime,
				dataType:'json',
				success:function(data){
					var sttr="";
					var flag=0;
					$(".scroll_list1 #tavle tbody").empty();
			    	$.each(data, function(index, item) {
				   		sttr+='<tr onclick="supplyDetail(\''+item.id+'\',\''+item.trade_status+'\')">';
		           		sttr+= '<td>'+item.remarks+'</td>';
		           		var name = item.name.substring(0,1);
		           		sttr+='<td>'+name+'**'+'</td>';
		           		var phone = item.phone.substring(0,3);
		           		sttr+='<td>'+phone+'*******'+'</td>';
		           		if(item.trade_status=="已解决"){
		           	   		sttr+='<td style=\'color:red;\'>'+item.trade_status+'</td>';
		           		}else{
		           	   		sttr+='<td>'+item.trade_status+'</td>';
		           		}
		           		var create = item.create_date.substring(0,10);
		           		sttr+='<td>'+create+'</td></tr>';
		           		flag++;
		        	});
			   		  $(".scroll_list1 #tavle tbody").append(sttr);
			   		   clearInterval(scrolltimer2);
			   		if(flag>13){
		   				clearInterval(scrolltimer2);
        	    	    smooth_scroll2(".scroll_list1","tr");
			   		}
				}
			});
		}

        function bindAnimate(){
            $(".pic_div").mouseover(function(){
                var pic_div_ele = $(this);
                console.log($(pic_div_ele).attr("class"));
                $(pic_div_ele).css("overflow","visible");
                $(pic_div_ele).css("z-index",20);
                $(pic_div_ele).find(".pic_div_hidden").css("z-index",20);
                $(pic_div_ele).siblings().css("z-index",0);
                $(pic_div_ele).siblings().css("overflow","hidden");
                $(pic_div_ele).siblings().find(".pic_div_hidden").each(function(index){
                    $(this).css("opacity",0);
                    $(this).css("width",165);
                    $(this).parent().css("width",165);
                });
                $(pic_div_ele).find(".pic_div_hidden").css("opacity",1);
                $(pic_div_ele).find(".pic_div_hidden").css("height",150);
                $(pic_div_ele).find(".pic_div_hidden").css("width",347);
                $(pic_div_ele).css("width","351px");
                $(pic_div_ele).find(".pic_div_hidden").bind("mouseleave",function(){
                    $(this).css("opacity",0);
                    $(this).css("width",165);
                    $(this).css("z-index",-1);
                    $(this).parent().css("width",165);
                });
                $(pic_div_ele).find(".pic_div_hidden").bind("mouseout",function(){
                    $(this).css("opacity",0);
                    $(this).css("width",165);
                    $(this).css("z-index",-1);
                    $(this).parent().css("width",165);
                });
            });

            $(".pic_div_hidden").mouseout(function(){
                $(this).css("opacity",0);
                $(this).css("width",165);
                $(this).css("z-index",-1);
                $(this).parent().css("width",165);
                $(this).parent().css("overflow","hidden");
            });

            $(".pic_div").mouseout(function(){
                $(this).find(".pic_div_hidden").css("opacity",0);
                $(this).find(".pic_div_hidden").css("width",165);
                $(this).find(".pic_div_hidden").css("z-index",-1);
                $(this).css("width",165);
                $(this).css("overflow","hidden");
            });
        }
    </script>

	</body>
</html>


