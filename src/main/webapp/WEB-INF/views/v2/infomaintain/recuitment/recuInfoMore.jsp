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
	<title>人才招聘—优蚁环保网</title>
	<meta name="keywords" content="优蚁环保，人才招聘，环保人才，环保招聘" />
	<meta name="description" content="优蚁环保人才招聘，汇聚海量环保行业岗位，为企业和求职者提供招聘平台，帮助企业招聘专业人才，为专业人才提供求职机会。">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/zixun/detail.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic }/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/v2/infomaintain/recuitment/recuInfoMore.css" />
</head>
<body>

	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<div class="informations">
	<!--左边文字内容区域-->
		<div class="Text_details" style="width: 1200px;">
			<div class="treatment_project" id="tp">
				<p>首页>资讯>人才招聘</p>
			</div>
			<div class="recruitment">
				<div class="write">
					<div class="caption">
		            	<table align="center" width="830"  border=0 bordercolor="#00ff99">
			            	<thead>
			            		<tr>
			                        <td><a href="javascript:void(0)" style="font-size: 16px;color: #3d3f40;font-weight: bold;">职位</a></td>
			                        <td><a href="javascript:void(0)" style="font-size: 16px;color: #3d3f40;font-weight: bold;">公司名称</a></td>
			                        <td><a href="javascript:void(0)" style="font-size: 16px;color: #3d3f40;font-weight: bold;" class="location">工作地点</a></td>
			                        <td><a href="javascript:void(0)" style="font-size: 16px;color: #3d3f40;font-weight: bold;" class="number">招聘人数(人)</a></td>
			                        <td><a href="javascript:void(0)" style="font-size: 16px;color: #3d3f40;font-weight: bold;" class="date">发布日期</a></td>
				                </tr>
							</thead>
		                	<tbody class="immediately">
		                		<c:forEach items="${infoList}" var="info" begin="0">
				                    <tr onclick="open_win(${info.id})">
				                        <td><a href="javascript:void(0)">${info.position}</a></td>
				                        <td><a href="javascript:void(0)">${info.company_name}</a></td>
				                        <td><a href="javascript:void(0)" class="location">${info.location}</a></td>
				                        <td><a href="javascript:void(0)" class="number">${info.person_number}</a></td>
				                        <td><a href="javascript:void(0)" class="date"><fmt:formatDate value="${info.create_date}" type="both" pattern="yyyy-MM-dd"/></a></td>
				                    </tr>
			                    </c:forEach>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		    </div>
			</div>
			<!--页码-->
			<div id="result_page"></div>
	</div>
	
	<!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
					var curPage= obj.curr;
					fillPage(curPage)
				}
			}
		});
	});
	
	function fillPage(curPage){
		$.ajax({
			type:"post",
			url:"${ctx}/zixun/getHiringPage",
			data:{
				pageNumber:curPage,
			},
			async:false,
			dataType:"json",
			success:function(data){
				$(".immediately").empty();
				$.each(data,function(index,item){
					var mydate = new Date(item.columns.create_date.time);
					var itemTime = mydate.getFullYear()+"-"+ (mydate.getMonth()+1) +"-"+ mydate.getDate();
					var ddiv = '<tr onclick="open_win('+item.columns.id+')">'+
                        '<td><a href="javascript:void(0)">'+item.columns.position+'</a></td>'+
                        '<td><a href="javascript:void(0)">'+item.columns.company_name+'</a></td>'+
                        '<td><a href="javascript:void(0)" class="location">'+item.columns.location+'</a></td>'+
                        '<td><a href="javascript:void(0)" class="number">'+item.columns.person_number+'</a></td>'+
                        '<td><a href="javascript:void(0)" class="date">'+itemTime+'</a></td>'+
                    '</tr>';
					$(".immediately").append(ddiv);
				});
				$("html,body").animate({scrollTop:$("#tp").offset().top},100);
			}
		});
	}
	
	//$(".immediately").on("click","li",function(){
		//var id = $(this).attr("data-id");
		//var url = "${ctx}/infomaintain/recuitment/detail/"+id;
		//window.open(url,"_blank");
	//});
	
});
</script>
<script type="text/javascript">
	var ctx = '${ctx}';
	function open_win(id) { 
	    window.open(ctx + "/infomaintain/recuitment/detail/"+id); 
	}
</script>
</html>