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
	<title>${info.position}-优蚁环保网</title>
	<meta name="keywords" content="${info.position},${info.company_name}${info.position}招聘，人才招聘，优蚁环保招聘" />
	<meta name="description" content="${info.company_name}招聘${info.position},${info.position}招聘信息包括：职位描述，工作内容，职位要求，薪资待遇以及工作地点等内容。" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/detail.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/infomaintain/recuitment/detail.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/layui/css/layui.css" />
</head>
<body>
	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="informations">
	<!--左边文字内容区域-->
		<div class="Text_details">
			<div class="treatment_project">
				<p>首页>资讯>招聘信息</p>
				<h2 style="margin-bottom: 10px;">${info.position}</h2>
				<span style="float: left;line-height: 28px;">时间：<fmt:formatDate value="${info.create_date}" type="both" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;浏览次数:${info.page_view}</span>
				<div class="bdsharebuttonbox" style="float: left;margin-left: 20px;">
					<a href="#" class="bds_qzone" data-cmd="qzone"></a>
					<a href="#" class="bds_tsina" data-cmd="tsina"></a>
					<a href="#" class="bds_tqq" data-cmd="tqq"></a>
					<a href="#" class="bds_renren" data-cmd="renren"></a>
					<a href="#" class="bds_weixin" data-cmd="weixin"></a>
					<a href="#" class="bds_more" data-cmd="more"></a>
					<a class="bds_count" data-cmd="count"></a>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="Text_descriptions">
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
						<span><strong>网址: </strong><a href="${info.company_href}" style="color:blue;" target="_blank">${info.company_href}</a></span>
					</div>
					<div class="xinwen_detail_item">
						<span><strong>有意者请将简历发送至: </strong>${info.hr_email}</span>
					</div>
				</div>
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
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
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