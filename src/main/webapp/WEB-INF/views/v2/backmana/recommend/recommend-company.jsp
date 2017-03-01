<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>推荐服务</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/layui/css/layui.css" />
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/layeruiPagingExt.js"></script>
	<style>
		.advisory_agent{display:block;width:760px;height:600px;margin:0 auto;overflow-x:hidden; }
		.advisory_agent .recommend{margin:0 auto;width:760px;margin-top:20px;}
		.advisory_agent .recommend ul{margin: 0 auto;width:758px;border:1px solid #cccccc;margin-top:9px;overflow:hidden;margin-bottom: 15px;}
		.advisory_agent .recommend ul li{width:500px;font-size:14px;margin:15px 0 15px 24px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;cursor:pointer;}
		.advisory_agent .recommend ul li:hover{color: #5ec520;}
		.advisory_agent .recommend .recommend_company{float: left; margin: 16px 12px 0 0; font-size: 14px;}
		.advisory_agent .recommend .hbCompany_name{width: 260px; height: 26px; height: 28px\9; line-height: 28px; margin: 10px 8px 0 0; float: left;}
		.advisory_agent .recommend .submitRecommend{width: 100px; height: 30px; background-color: orange; border: 0; color: #fff; font-size: 16px; cursor: pointer; line-height: 30px; font-family:微软雅黑;}
		.advisory_agent .recommend .search_company{width: 100px; height: 30px; float: left; background-color: #5ec520; border: 0; color: #fff; font-size: 16px; cursor: pointer; margin: 10px 8px 0 14px; line-height: 30px; *line-height: 30px; font-family:微软雅黑;}
		.advisory_agent #company_page{width: 770px;}
		.advisory_agent .submitDiv{margin: 0 auto;width: 100px;}
	</style>
</head>
<body>
	<!--推荐公司弹框内容start -->
	<div class="advisory_agent">
		<div class="recommend">
			<div>
				<span class="recommend_company">推荐公司</span>
				<input class="hbCompany_name" type="text">
				<input class="search_company" type="submit" value="搜索公司">
			</div>
			<div style="clear:both;"></div>
			<ul class="hbCompany_list">
				<c:forEach items="${cs}" var="c">
					<li>
						<label><input type="radio" name="hbCompany" data-id="${c.id}" data-uid="${c.user_id}">&nbsp;&nbsp;${c.company_name}</label>
					</li>
				</c:forEach>
			</ul>
			<div id="company_page"></div>
			<div class="submitDiv">
				<input class="submitRecommend" type="submit" value="提交">
			</div>
		</div>
	</div>
	<!--推荐公司弹框内容end -->
</body>
<script type="text/javascript">

var layer;
var loadLayer=layui.use(['layer'], function(){
	layer = layui.layer;
});

layui.use('laydate', function(){
	  var laydate = layui.laydate;
});

$(function(){
	//推送弹框
	$(".push").click(function(event) {
		/* Act on the event */
		layer.open({
			title: false,
			type: 1,
			shade: [0.5, '#000'],
			skin: 'layui-layer-rim', //加上边框
			area: ['720px', '540px'], //宽高
			content: $('.advisory_agent')
		});
	});
	
	//提交推送
	$(".submitRecommend").click(function(){
		var reqbox = $(parent.frames['rightIframe'].document).find(".pitch:checked");
		var reqid = "";
		var reqPhone = "";
		var len = reqbox.length;
		
		if(len <= 0){
			layer.msg("请选择需求");
			return;
		}
		for(var i=0;i<len;i++){
			reqid = reqid + reqbox.eq(i).attr("data-id") + "_";
			reqPhone = reqPhone+ reqbox.eq(i).attr("data-phone") + "_";
		};
		var hbCompany_id = $("input[name='hbCompany']:checked").attr("data-id");
		var hbCompanyUser_id = $("input[name='hbCompany']:checked").attr("data-uid");
		
		if(hbCompany_id == null || hbCompany_id == undefined || hbCompany_id == ""){
			layer.msg("请选择环保公司");
			return;
		}
		
		$.ajax({
			type:"post",
			url:"${ctx}/backmana/recommend/sendRecommendAjax_v2",
			async:false,//异步提交，即在ajax提交时，锁定浏览器页面
			data:{
				hbfwIds:reqid,
				cf_phone_arr:reqPhone,
				hbCompany_id:hbCompany_id,
				hbCompanyUser_id:hbCompanyUser_id
			},
			success:function(data){
				if(data == true){
					layer.msg("推送成功");
					parent.window.reloadRightIframe();
					parent.layer.close(parent.window.comIndex);
				}
			}
		});
				
	});
	
	//环保公司分页
	paging("company_page", ${comtotalPage}, 1, function(divElSelector, obj, first){
			if(!first){
				getCompanyByAjax(obj.curr);
			}
		},'#5ec520');
	
	//获取环保公司ajax方法
	function getCompanyByAjax(pageNumber){
		var hbCompany_name = $(".hbCompany_name").val();
		var totalPage = 0;
		$.ajax({
			type:"post",
			url:"${ctx}/backmana/recommend/getCompanyForAjax",
			async:false,
			data:{
				companyName:hbCompany_name,
				pageNumber:pageNumber
			},
			dataType:"json",
			success:function(data){
				$(".hbCompany_list").empty();
				totalPage = data[0].totalPage;
				$.each(data[0].list,function(index,item){
					var aa = '<li>'+
								'<label><input type="radio" name="hbCompany" data-id="'+item.columns.id+'" data-uid="'+item.columns.user_id+'">&nbsp;&nbsp;'+item.columns.company_name+'</label>'+
							'</li>';
					$(".hbCompany_list").append(aa);
				});
			}
		});
		return totalPage;
	}
	
	//搜索环保公司
	$(".search_company").click(function(){
		var totalPage = getCompanyByAjax(1);
		paging("company_page", totalPage, 1, function(divElSelector, obj, first){
			if(!first){
				getCompanyByAjax(obj.curr);
			}
		},'#5ec520');
	});
	
});

</script>
</html>