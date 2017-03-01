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
	<title>环保资讯</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台">
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/detail.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/layui/css/layui.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="informations">
	<!--左边文字内容区域-->
		<div class="Text_details">
			<div id="tp" class="treatment_project">
				<p>首页>资讯>展会信息</p>
			</div>
			<div class="Text_descriptions">
				<c:forEach items="${infoList}" var="i">
					<div class="Information_list">
						<div class="list_img">
							<p>
								<a href="${ctx}/news/newsitem/${i.id}" target="_blank"><img src="${i.small_img}"></a>
							</p>
						</div>
						<div class="Vtion">
							<a href="${ctx}/news/newsitem/${i.id}" target="_blank"><h2>${i.new_title}</h2></a>
							<p class="rules_text">${fn:substring(i.new_content, 0, 90)}...</p>	
	                        <span class="st1">${i.source}</span>
	                        <span class="st2"><fmt:formatDate value="${i.create_date}" pattern="yyyy-MM-dd"/></span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	<!--左边文字内容区域end-->
	<!--其他案例区域-->
		<div class="other_cases">
			<div class="Ad_Image">
				<a href="http://www.yyhb365.com/youyi/authority-special.html" target="_blank"><img src="${ctxStatic}/img/v2/zixun/Ad_Image.jpg" alt="中国环境保护部服务行业试点" /></a>
			</div>
			<ul class="hots">
				<h4>今日热门</h4>
				<c:forEach items="${today}" var="t">
					<div style="height:99px;width:300px;margin:0 auto;position:relative;margin-top:22px;">
		                <div style="float:left;width: 128px;height: 99px;">
		                	<a href="${ctx}/news/newsitem/${t.id}" target="_blank"><img style="max-width: 128px;max-height: 99px;" src="${t.simg}"></a>
		                </div>
		                <div style="float:left;">
							<h3 style="width: 150px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;padding-left:10px;font-size:16px;">${t.title}</h3>
							<p style="font-size:14px;width:154px;color:#686868;position:absolute;right:5px;top:30px;line-height:24px;">${fn:substring(t.content, 0, 16)}...<a href="${ctx}/news/newsitem/${t.id}" target="_blank"><b style="color:#ff0000;">[全文]</b></a></p>
		                </div>
	              	</div>
				</c:forEach>
              	
			</ul>
		</div>
	<!--其他案例区域end-->
	
		<!--页码-->
		<div id="result_page">
		
		</div>
	</div>
	
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript">
$(function(){
	layui.use(['laypage', 'layer'], function(){
		var laypage = layui.laypage,layer = layui.layer;
		//调用分页
		laypage({
			cont: 'result_page',
			pages: ${totalPage},
			last: ${totalPage},
			skip: true,
			skin: '#5ec520',
			jump: function(obj,first){
				if(!first){
					var type="ep_show";
					var curPage= obj.curr;
					fillPage(curPage,type)
				}
			}
		});
	});
	
	function fillPage(curPage,type){
		$.ajax({
			type:"post",
			url:"${ctx}/zixun/getInfoPage",
			data:{
				pageNumber:curPage,
				type:type
			},
			async:false,
			dataType:"json",
			success:function(data){
				debugger;
				$(".Text_descriptions").empty();
				var ctx = "${ctx}";
				$.each(data,function(index,item){
					var mydate = new Date(item.columns.create_date.time);
					itemTime = mydate.getFullYear()+"-"+ (mydate.getMonth()+1) +"-"+ mydate.getDate();
					var ddiv = '<div class="Information_list">'+
						'<div class="list_img">'+
							'<p>'+
								'<a href="'+ctx+'/news/newsitem/'+item.columns.id+'" target="_blank"><img src="'+item.columns.small_img+'"></a>'+
							'</p>'+
						'</div>'+
						'<div class="Vtion">'+
							'<a href="'+ctx+'/news/newsitem/'+item.columns.id+'" target="_blank"><h2>'+item.columns.new_title+'</h2></a>'+
							'<p class="rules_text">'+item.columns.new_content.substring(0,90)+'...</p>'+
	                        '<span class="st1">'+item.columns.source+'</span>'+
	                        '<span class="st2">'+itemTime+'</span>'+
						'</div>'+
					'</div>';
					$(".Text_descriptions").append(ddiv);
				});
				$("html,body").animate({scrollTop:$("#tp").offset().top},100);
			}
		});
	}
	
});
</script>
</html>