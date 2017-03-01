<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
	<title>推荐服务</title>
	<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
	<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
	<link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
	.recommend_service{border:1px solid #cccccc;height:826px;}
	.re_top{margin:20px 0px;margin-left: 20px;}
	.re_bottom{margin-left: 20px;}
	.r_b_title{font-size: 18px;width: 720px;height:30px;text-align: center;line-height:30px;border:1px solid #cccccc;}
	.r_b_content{width: 720px;height:260px;border:1px solid #cccccc;border-top: none;overflow: auto;}
	.r_b_content table tr td{width: 144px;height: 38px;text-align:center;}
	#remarks{width:260px;height: 30px;border:1px solid #cccccc;}
	#search_top{background: #5EC520;color:#FFFFFF;text-align: center;padding: 5px 30px;margin-left: 58px;}
	#td_reamrks{text-align: left;margin-left: 20px;padding-left: 20px;}
	/*下半部分*/
	.m_r_b_top{margin-left: 20px;}
	.m_r_b_bottom{width:720px;height:300px;margin-left: 20px;}
	#search{width:530px;height: 30px;border:1px solid #cccccc;}
	.b_l_title{height: 30px;border-bottom: 1px solid #cccccc;line-height: 30px;font-size: 18px;text-align: center;}
	.b_r_title{height: 30px;background-color: #5EC520;line-height: 30px;font-size: 18px;text-align: center;color: white;}
	.bottom_centent{margin-top:20px;width:340px;height:260px;float: left;border: 1px solid #cccccc;}
	#bottom_center{float: left;height: 260px;width: 30px;text-align: center;margin-top: 20px;}
	.dayu{margin-top: 100px;font-size: 18px;}
	.xiaoyu{margin-top: 20px;font-size: 18px;}
	.select{width:100%;height: 235px;}
	.select option{font-size: 14px;padding:4px 10px;margin: 2px 0px;}
	#search_bottom{background: #5EC520;color:#FFFFFF;text-align: center;padding: 5px 30px;margin-left: 30px;}
	.tuisong{width:720px;text-align: center;}
	.tuisong a{background-color:#EE7700;color:#FFFFFF;text-align: center;padding: 10px 50px;margin-left: 40px;height: 50px;line-height: 50px;}
	.fixpalceholder{display:inline-block;}
	</style>
</head>
<body>
	<div class="main">
		<div class="main_right">
			<div class="m_r_position font_1">当前位置>信息管理>推荐服务</div>
			<div class="recommend_service font_1">
				<div class="m_r_title">
					<span class="m_r_tname">推荐服务</span>
				</div>
				<div class="m_r_top">
					<div class="re_top">
						<span style="margin-right: 30px;">环保服务</span> <input type="search"
							id="remarks" placeholder="环评编写" /> <span
							style="margin: 0px 30px;">提交时间</span><input id="pastTame"
							type="text" class="mh_date" style="width: 100px; height: 20px;"
							value="" />&nbsp; <a class="font_3" id="search_top"
							href="javascript:searchTop();">搜索</a>
					</div>
					<div class="re_bottom">
						<div class="r_b_title">搜索结果</div>
						<div class="r_b_content">
							<table id="hbxq">
								<c:forEach items="${ss}" var="ss" varStatus="st">
									<tr>
										<td id="td_reamrks"><input class="checkBox"
											name="checkboxBtn" type="checkbox" id="${ss.id }" />${st.index+1 }、${ss.remarks}</td>
										<td>${ss.requirement_describe }</td>
										<td>${ss.name }</td>
										<td>${ss.company_name }</td>
										<td class="cf_phone">${ss.phone }</td>
										<td>${ss.trade_status}</td>
										<td>${fn:substring(ss.create_date,0,10) }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div style="margin: 20px 0px; height: 10px; background: #cccccc;"></div>
				<div class="m_r_bottom">
					<div class="m_r_b_top">
						<span>查询内容</span>&nbsp;&nbsp;<input type="search" id="search"
							placeholder="环保公司" /> <a class="font_3" id="search_bottom"
							href="javascript:searchBottom();">搜索</a>
					</div>
					<div class="m_r_b_bottom">
						<div id="bottom_left" class="bottom_centent">
							<div class="b_l_title">搜索结果</div>
							<div class="b_l_content" id="b_l_hb_cname">
								<label> <select class="select" multiple="multiple"
									size="${fn:length(cs) }" name="select" id="select">
										<c:forEach items="${cs}" var="cs" varStatus="st">
											<option id="${cs.id }" title="${cs.user_id }">${cs.company_name }</option>
										</c:forEach>
								</select>
								</label>
							</div>
						</div>
						<div id="bottom_center">
							<div class="dayu">
								<a id="right" style="color: #5EC520">&gt&gt</a>
							</div>
							<div class="xiaoyu">
								<a id="left" style="color: #5EC520">&lt&lt</a>
							</div>
						</div>
						<div id="bottom_right" class="bottom_centent">
							<div class="b_r_title">接收推送的企业</div>
							<div class="b_r_content">
								<select class="select" multiple="multiple" size="6"
									name="select2" id="select2">

								</select>
							</div>
						</div>
					</div>

				</div>
				<div class="tuisong">
					<a class="font_3" href="javascript:tuiSong();">一&nbsp;&nbsp;键&nbsp;&nbsp;推&nbsp;&nbsp;送</a>
				</div>
			</div>
		</div>
	</div>

	<!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
        
        <script type="text/javascript">
        $(function (){
			$("input.mh_date").manhuaDate({					       
				Event : "click",//可选				       
				Left : 0,//弹出时间停靠的左边位置
				Top : -16,//弹出时间停靠的顶部边位置
				fuhao : "-",//日期连接符默认为-
				isTime : false,//是否开启时间值默认为false
				beginY : 1949,//年份的开始默认为1949
				endY :2100//年份的结束默认为2049
			});
		});
	   
	 //验证时间
		function timeCheck(){
			var pastDate = $(".mh_date").val();
			var t = false;
			
				var today=new Date();
				var times=pastDate.split('-');
				if(times[0]<today.getFullYear()){}
				else if(times[0]==today.getFullYear() && times[1]<(today.getMonth()+1)){}
				else if(times[0]==today.getFullYear() && times[1]==(today.getMonth()+1) && times[2]<=today.getDate()){}else{
					t = true;
				
				}
				//alert(times[0]+":"+times[1]+":"+times[2]+"______"+today.getFullYear()+(today.getMonth()+1)+today.getDate());
			return t ;
		}
	 	
	 	//异步请求,上面的查询按钮
	 	function searchTop(){
	 		var date = $(".mh_date").attr("value");
	 		if(timeCheck()){
	 			 parent.showMess("请选择有效日期!");
	 			 return;
	 		}
			var remarks = $("#remarks").attr("value");
			 $.ajax({
				 type:"POST",
				 url:"${ctx}/backmana/recommend/getSupplysAjax",
				 data:"date="+date+"&remarks="+remarks,
				 dataType:'json',
				 success:function(data){
					 var html = "";
					 $.each(data,function(index, item){
						 var line_num = index+1;
						 html+="<tr>"+
           				"<td id=\"td_reamrks\"><input name=\"hbxq\" type=\"checkbox\" value=\"\" />"+line_num+"、"+item.remarks+"</td>"+
                        "<td>" + item.requirement_describe + "</td>" +
          				"<td>"+item.name+"</td>"+
          				"<td>"+item.company_name+"</td>"+
          				"<td class = \"cf_phone\">"+item.phone+"</td>"+
          				"<td>"+item.trade_status+"</td>"+
          				"<td>"+item.create_date.substring(0,10)+"</td>"+
          			"</tr>";
					 });
					 $("#hbxq").html(html);
				 },
				 error:function(data){
					 parent.showMess("获取失败！");
				 },
				 
			});
			
	 	}
	 	//异步请求,下面的查询按钮
	 	function searchBottom(){
			 var company_name = $("#search").attr("value");
			// parent.showMess(company_name);
			 $.ajax({
				 type:"POST",
				 url:"${ctx}/backmana/recommend/getCompanyAjax",
				 data:"data="+company_name,
				 dataType:'json',
				 success:function(data){
					 var html = "";
					
					 $.each(data,function(index, item){
						 if(!checkCompanyName(item.id)){//判断是否已存在在推送的企业中
							 html += "<option id=\""+item.id+"\" title=\""+item.user_id+"\">"+item.company_name+"</option>";
						 }
					 });
					 $("#select").html(html);
				 },
				 error:function(data){
					 parent.showMess("获取失败！");
				 },
				 
			});
	 	}
	 	//
	 	function checkCompanyName(itemId){
	 		var exsit = false;
	 		$("#select2 option").each(function (){
				var id = $(this).attr("id");
				if(itemId == id){//判断异步查询的公司是否存在右边
					exsit = true; 											
				}
			 }); 
	 		return exsit;
	 	}
		
		//left right 公司名
		$(function(){
		$("#right").click(function(){	<%--判断用户是否单击的向右按钮--%>
			var $options = $("#select option:selected");	<%--获取用户选择的列表项--%>
			var $remove = $options.remove();	<%--将列表项删除--%>
			$remove.appendTo('#select2');	<%--将删除的列表项追加到select2中--%>
		});
		
		$('#rightAll').click(function(){	<%--判断用户是否单击了全部向右移动按钮--%>
			var $options = $('#select option');	<%--获取全部的列表项--%>
			$options.appendTo('#select2');	<%--将全部的列表项追加到select2中--%>
		});
		
		$("#left").click(function(){
			var $options = $('#select2 option:selected');	<%--判断用户是否单击的向左按钮--%>
			var $remove = $options.remove();	<%--将列表项删除--%>
			$remove.appendTo('#select');	<%--将删除的列表项追加到select中--%>
		});
		
		$('#leftAll').click(function(){
			var $options = $('#select2 option');
			var $remove = $options.remove();
			$remove.appendTo('#select');
		});
		
		});
	
		
	 	//一键推送
	 	function tuiSong(){
	 		/*
			1. 获取所有的被勾选的条目复选框！循环遍历之
			*/
			var tr_ids = "";//需求id字符串:如1_2_3
			var cf_phone_arr = "";
			var company_ids = "";//环保公司id
			var hb_user_ids = "";//环保用户id
			$(":checkbox").each(function(i){

			    if($(this).attr("checked")) {
			      var id = $(this).attr("id");
			      var $parent = $(this).parent();
			      var phone = $parent.parent().children("td.cf_phone").text();
			     
			      tr_ids = tr_ids + id +"_";
			      cf_phone_arr = cf_phone_arr + phone +"_";
			   }

			});
			/*
			2.获取所有的公司,循环遍历
			*/
			$("#select2 option").each(function (){
				var id = $(this).attr("id");
				var user_id = $(this).attr("title");				
				company_ids = company_ids + id + "_";
				hb_user_ids = hb_user_ids + user_id + "_";
			});
			/*
			3.校验一下
			*/
			
			if(tr_ids == ""){
				parent.showMess("请选择服务!");

			}else if(company_ids == ""){
				parent.showMess("请选择公司!");

			}else{
				 $.ajax({
					 type:"POST",
					 url:"${ctx}/backmana/recommend/sendRecommendAjax",
					 data:"hbfwIds=" + tr_ids+"&cf_phone_arr="+cf_phone_arr +"&company_ids=" + company_ids+"&hb_user_ids="+ hb_user_ids,
					 dataType:'json',
					 success:function(data){
						if(data){
							parent.showMess("推送成功！");
							$("#select2").empty();
							fanxuan();//反选
							searchBottom();
						}else{
							parent.showMess("推送失败！");
						}
					 },
					 error:function(data){
						 parent.showMess("推送失败！");
					 },
					 
				});
				
				
			}
			
	 	}
	 
	 	function fanxuan(){
	 		$(":checkbox").each(function(i){
				$(this).attr("checked",false);
			});
	 	}
        </script>
    </body>
</html>