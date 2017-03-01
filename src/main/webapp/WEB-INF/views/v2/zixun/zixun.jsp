<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<title>资讯首页</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/zixun.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/flexslider/flexslider.css" />
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script> 
	<script type="text/javascript" src="${ctxStatic}/js/v2/zixun/chuantongV3.js"></script>
	<script type="text/javascript">
    window.onload = function(){
      chuantongV3(400,2000);
      chuantongV4(400,2000);
    } 
  </script>

</head>
<body>
<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<div class="message">
	<div id="message_left">
		<!--轮播start -->
	    <div class="lunbo1 chuantong1">
		    <ul class="imagelist" begin="0" end="2">
		    	<c:forEach items="${adImgList}" var="ad">
					<a href="${ctx}/news/newsitem/${ad.id}" target="_blank">
						<li style="background:white url(${ad.simg}) no-repeat center center;" title="${ad.title}"></li>
					</a>
		    	</c:forEach>
		    </ul>
		    <div class="buttons">
				<span class="leftBut"></span>
				<span class="rightBut"></span>
		    </div>
		    <ul class="imgnav">
				<li class="cur">我们的服务</li>
				<li>我们的实力</li>
				<li>我们的资源</li>
		    </ul>
		</div>
		<!-- 轮播end-->
	
		<!--环保资讯start-->
		<div class="Platts">
			<h3><span>环保资讯</span></h3>
			<p class="more"><a href="${ctx}/news/environmental-information" target="_blank" style="color:#ee7800;">更多&gt;</a></p>
			<div class="demonstration_left">
				<div class="demonstration">
					<p><a href="${ctx}/news/newsitem/${news[0].id}" target="_blank"><img src="${news[0].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${news[0].id}" target="_blank"><span><b>${news[0].title}</b></span></a>
				</div>
				<div class="emissions">
					<p><a href="${ctx}/news/newsitem/${news[1].id}" target="_blank"><img src="${news[1].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${news[1].id}" target="_blank"><span><b>${news[1].title}</b></span></a>
				</div>
				<div class="emissions">
					<p><a href="${ctx}/news/newsitem/${news[2].id}" target="_blank"><img src="${news[2].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${news[2].id}" target="_blank"><span><b>${news[2].title}</b></span></a>
				</div>
			</div>
			<div class="full_text">
				<div class="manage">
					<a href="${ctx}/news/newsitem/${news[3].id}" target="_blank"><h4>${news[3].title}</h4></a>
					<p style="margin-top:15px;">
						<span class="Network_text">${news[3].content}</span>
						<a href="${ctx}/news/newsitem/${news[3].id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a>
						<b style="font-size:14px;position: absolute;right:0;line-height:28px;color:#7d7d7d;font-weight: normal;"><fmt:formatDate value="${news[3].time}" pattern="MM-dd"/></b>
					</p>
				</div>
				<ul class="problem">
					<c:forEach items="${news}" var="n" begin="3">
						<li><a href="${ctx}/news/newsitem/${n.id}" target="_blank">${n.title}<span><fmt:formatDate value="${n.time}" pattern="MM-dd"/></span></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="advertis">
				<p><a href="http://www.yyhb365.com/youyi/authority-special.html" target="_blank"><img src="${ctxStatic}/img/v2/zixun/advertis.png"></a></p>
			</div>
		</div>
		<!--环保资讯end-->
		<!--优蚁资讯start-->
		<div class="Platts">
			<h3><span>优蚁资讯</span></h3>
			<p class="more"><a href="${ctx}/news/youyi-news" target="_blank" style="color:#ee7800;">更多&gt;</a></p>
			<div class="demonstration_left">
				<div class="demonstration">
					<p><a href="${ctx}/news/newsitem/${youyiList[0].id}" target="_blank"><img src="${youyiList[0].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${youyiList[0].id}" target="_blank"><span><b>${youyiList[0].title}</b></span></a>
				</div>
				<div class="emissions">
					<p><a href="${ctx}/news/newsitem/${youyiList[1].id}" target="_blank"><img src="${youyiList[1].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${youyiList[1].id}" target="_blank"><span><b>${youyiList[1].title}</b></span></a>
				</div>
				<div class="emissions">
					<p><a href="${ctx}/news/newsitem/${youyiList[2].id}" target="_blank"><img src="${youyiList[2].simg}"></a></p>
					<a href="${ctx}/news/newsitem/${youyiList[2].id}" target="_blank"><span><b>${youyiList[2].title}</b></span></a>
				</div>
			</div>
			<div class="full_text">
				<div class="manage">
					<a href="${ctx}/news/newsitem/${youyiList[3].id}" target="_blank"><h4>${youyiList[3].title}</h4></a>
					<p style="margin-top:15px;">
						<span class="Network_text">${youyiList[3].content}</span>
						<a href="${ctx}/news/newsitem/${youyiList[3].id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a>
						<b style="font-size:14px;position: absolute;right:0;line-height:28px;color:#7d7d7d;font-weight: normal;"><fmt:formatDate value="${youyiList[3].time}" pattern="MM-dd"/></b>
					</p>
				</div>
				<ul class="problem">
					<c:forEach items="${youyiList}" var="y" begin="3">
						<li><a href="${ctx}/news/newsitem/${y.id}" target="_blank">${y.title}<span><fmt:formatDate value="${y.time}" pattern="MM-dd"/></span></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--优蚁资讯end-->
		</div>
		<div class="message_right">
			<div class="shop_tab">
            <div class="hd">
				<span>新闻排行榜</span>
				<span class="current">今日</span>
				<span>本周</span>
				<span style="border-right:0;">本月</span>
            </div>
            <div class="bds">
				<ul>
					<c:forEach items="${rank}" var="r" varStatus="a">
						<li>
							<span class="rank_list" data-count="${a.count}"></span>
							<a href="${ctx}/news/newsitem/${r.id}" target="_blank">${r.title}</a>
						</li>
					</c:forEach>
				</ul>
				<ul class="cur">
					<c:forEach items="${today}" var="r" varStatus="a">
						<li>
							<span class="today_list" data-count="${a.count}"></span>
							<a href="${ctx}/news/newsitem/${r.id}" target="_blank">${r.title}</a>
						</li>
					</c:forEach>
				</ul>
				<ul>
					<c:forEach items="${week}" var="r" varStatus="a">
						<li>
							<span class="week_list" data-count="${a.count}"></span>
							<a href="${ctx}/news/newsitem/${r.id}" target="_blank">${r.title}</a>
						</li>
					</c:forEach>
				</ul>
				<ul>
					<c:forEach items="${month}" var="r" varStatus="a">
						<li>
							<span class="month_list" data-count="${a.count}"></span>
							<a href="${ctx}/news/newsitem/${r.id}" target="_blank">${r.title}</a>
						</li>
					</c:forEach>
				</ul>
            </div>
          </div>
		<!--环保知识start-->
         <div class="knowledge">
			<h3><span>环保知识</span></h3>
			<p class="more"><a href="${ctx}/news/knowledge" target="_blank" style="color:#ee7800;">更多&gt;</a></p>
			<div style="height:114px;width:402px;margin:0 auto;position:relative;margin-top:22px;border-bottom: 1px solid #f0f0f0;">
				<div style="float:left;">
	               	<p style="width:128px;height:100px;text-align: center;vertical-align: middle; display: table-cell;">
	   					<a href="${ctx}/news/newsitem/${know[0].id}" target="_blank"><img src="${know[0].simg}" style="max-height: 100px;max-width: 128px;"></a>
					</p>
				</div>
				<div style="float:right;">
					<a href="${ctx}/news/newsitem/${know[0].id}" target="_blank"><h4 style="width: 220px;margin-bottom: 10px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;font-size:16px;">${know[0].title}</h4></a>
					<p style="font-size:14px;width:242px;padding-left: 12px;color:#686868;line-height:22px;">
					  	<span class="lectual_text" style="width:242px;font-size:14px;">${know[0].content}</span>
					  	<a href="${ctx}/news/newsitem/${know[0].id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a> 
					</p>
				</div>
			</div>
			<ul class="science">
				<c:forEach items="${know}" var="k" begin="1">
					<li><a href="${ctx}/news/newsitem/${k.id}" target="_blank">${k.title}</a></li>
				</c:forEach>
			</ul>
			
			<div class="exhibition">
			
              	<h3><span>展会信息</span></h3>
				<p class="more"><a href="${ctx}/news/exhibition-information" target="_blank" style="color:#ee7800;">更多&gt;</a></p>
				<c:forEach items="${show}" var="s">
					<div class="conduct">
		                <div style="float:left;">
		                	<p class="the_left">
		    					<a href="${ctx}/news/newsitem/${s.id}" target="_blank"><img src="${s.simg}" style="max-width:128px;max-height:100px;"></a>
							</p>
						</div>
		                <div class="Sixth">
		                  <a href="${ctx}/news/newsitem/${s.id}" target="_blank"><h4>${s.title}</h4></a>
		                  <p>开始时间:${s.htime}</p>
		      			  <p>举办地区:${s.place}</p>
		      			  <p><span>举办场馆：${s.place}</span><a href="${ctx}/news/newsitem/${s.id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a></p>
		                </div>
	              	</div>
				</c:forEach>
				
           		<!--人才招聘start-->
              	<div class="recruitment">
              		<h3><span>人才招聘</span></h3>
					<p class="more"><a href="${ctx}/news/hiring" target="_blank" style="color:#ee7800;">更多&gt;</a></p>
					<c:forEach items="${hireList}" var="h">
						<div class="job_list">
							<p class="job_title">
								<span style="color:#70ba44;font-size:16px;">
									<a href="${ctx}/infomaintain/recuitment/detail/${h.id}" style="color:#70ba44;" target="_blank"><b style="font-size: 16px;">${h.position}</b></a>[${h.cname}]
								</span>
								<span style="font-size:20px;color:#ff3f19;width:120px;float:left;margin-top:18px;">${h.salary}</span>
								<span style="font-size:14px;width:125px;float:left;margin-top:18px;line-height:28px;">经验${h.work_exp}/${h.qualifications}</span>
							</p>
							<p class="detection">
								<a href="${h.company_href}" target="_blank"><span style="font-size:14px;text-align:right;">${h.company_name}</span></a>
								<span style="font-size:14px;text-align:right;margin-top:23px;">人数:${h.person_number}</span>
							</p>
						</div>
					</c:forEach>
              	</div>
            <!--人才招聘end-->
              </div>
         </div>
   <!--环保知识end-->
		</div>
</div>
	
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	//新闻排行榜前面的序号
	var className = ["today_one","today_two","today_three","today_four","today_five",
	                 "today_six","today_seven","today_eight","today_nine","today_ten"];
	var rl = $(".rank_list");
	var len = rl.length;
	for(var i=0;i<len;i++){
		rl.eq(i).addClass(className[i]);
	}
	//获取今日排行前面的序号
	var tl = $(".today_list");
	len = tl.length;
	for(var i=0;i<len;i++){
		tl.eq(i).addClass(className[i]);
	}
	//获取今日排行前面的序号
	var wl = $(".week_list");
	len = wl.length;
	for(var i=0;i<len;i++){
		wl.eq(i).addClass(className[i]);
	}
	//获取今日排行前面的序号
	var ml = $(".month_list");
	len = ml.length;
	for(var i=0;i<len;i++){
		ml.eq(i).addClass(className[i]);
	}
	  
    //限制字符个数
    $(".Network_text").each(function(){
        var maxwidth=71;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });
    
    //限制字符个数
    $(".lectual_text").each(function(){
        var maxwidth=45;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });
    
    $(".shop_tab .hd span").mouseenter(function(){
		$(this).addClass("current").siblings().removeClass("current").parent().siblings(".bds").children("ul").eq($(this).index()).addClass("cur").siblings().removeClass("cur");
	});
    
    
});
</script>
  <!--轮播start -->
  <script type="text/javascript">
		$(document).ready(
			function() {
				var nowimg = 0;
				//复制一个开头的图片
				//clone()就表示克隆一个元素。克隆的元素，必须使用appentTo追加到一个元素中。
				$(".chuantong .imagelist li:first").clone().appendTo(".chuantong .imagelist");

				/*定时器*/
				var timer =	setInterval(rightButFunc,2000);

				$(".chuantong").mouseenter(function(){
					clearInterval(timer);
				});

				$(".chuantong").mouseleave(function(){
					clearInterval(timer);
					timer =	setInterval(rightButFunc,2000);
				});
				/*定时器*/

				//右按钮
				$(".chuantong .buttons .rightBut").click(rightButFunc);
				function rightButFunc(){
					if(!$(".chuantong .imagelist").is(":animated")){
						if(nowimg < 2){
							nowimg++;
							//当前没有到最后一张，所以就是往信号量的-560倍上拉。
							$(".chuantong .imagelist").animate({"left":-740*nowimg},1000);
						}else{
							nowimg = 0;
							//当前已经到了最后一张，所以就是要多拉一个-560，然后瞬间移动到0：
							$(".chuantong .imagelist").animate({"left":-740*3},1000,function(){
								$(".chuantong .imagelist").css("left",0);
							})
						}
						$(".chuantong .imgnav li").eq(nowimg).addClass("cur").siblings().removeClass("cur");
					}
				}
				//左按钮
				$(".chuantong .buttons .leftBut").click(
					function(){
						if(!$(".chuantong .imagelist").is(":animated")){
							$(".chuantong .imagelist").stop(true); //防止动画积累

							if(nowimg > 0){
								nowimg --;
								//当前没有到第1张，所以就是往信号量的-560倍上拉。
								$(".chuantong .imagelist").animate({"left":-740*nowimg},1000);
							}else{
								nowimg = 2;
								//瞬间替换为假的狮子，然后拉动
								$(".chuantong .imagelist").css("left",-740*3);
								$(".chuantong .imagelist").animate({"left":-740*nowimg},1000);
							}

							$(".chuantong .imgnav li").eq(nowimg).addClass("cur").siblings().removeClass("cur");
						}
					}
				);

				$(".chuantong .imgnav li").click(
					function(){
						$(".chuantong .imagelist").stop(true); //防止动画积累
						nowimg = $(this).index();
						$(".chuantong .imagelist").animate({"left":-740*nowimg},1000);
						$(".chuantong .imgnav li").eq(nowimg).addClass("cur").siblings().removeClass("cur");
					}
				);
			}
		);
	</script>
</html>