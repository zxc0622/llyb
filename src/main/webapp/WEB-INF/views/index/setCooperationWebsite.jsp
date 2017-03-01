<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>修改首页底部的合作网站</title>
    <style>
    	.main_right{width:765px;font-size: 12px;position: relative;}
    	select,option{font-size: 14px;}
    	.table_main{margin-top: 20px;}
		.table{border-collapse:collapse;}
    	.table td{height:20px;border:solid 1px #4FCCB5;padding:3px;text-align: center;}
    	.website_name{width: 210px;}
    	.website_url{width: 210px;}
    	.operation{width:85px;}
    	.other_items{width:60px;}
    	.op_alert{color:#ECAF00;cursor:pointer;}
    	.op_delete{color:red;cursor:pointer;}
    	.op_alert:hover{background-color:#ECAF00;color:white;}
    	.op_delete:hover{background-color:red;color:white;}
    	.op_add{color:#14B514;cursor:pointer;margin: 0;}
    	.op_add:hover{background-color:#14B514;color:white;}
    	.add_websiteType{color:#14B514;cursor:pointer;}
    	.alert_websiteType{color:#ECAF00;cursor:pointer;}
    	.delete_websiteType{color:red;cursor:pointer;}
    	.alert_websiteType:hover{background-color:#ECAF00;color:white;}
    	.delete_websiteType:hover{background-color:red;color:white;}
    	.add_websiteType:hover{background-color:#14B514;color:white;}
    	/* 大遮罩 */
    	.bigShade{background-color: #000;position: fixed;left: 0;top: 0;display: none;width: 100%;height: 100%;opacity: 0.3;z-index: 2;}
    	/* 弹框  */
    	.box{position: fixed;z-index: 3;background-color: white;box-shadow: 1px 1px 50px rgba(0,0,0,.3);border-radius: 2px;font-family: '\5FAE\8F6F\96C5\9ED1';display: none;}
    	.box_title{background: #009f95;color: #fff;border: none;height: 38px;font-size: 14px;overflow: hidden;line-height: 38px;padding-left: 20px;}
    	.box_content{padding: 20px;}
    	.item_name{display: inline-block;width: 76px;text-align: right;padding-right: 3px;}
    	.item_line{margin-top: 10px;}
    	.box_bottom{text-align: right;padding: 0 10px 12px;}
    	.box_bottom_a{height: 28px;line-height: 28px;margin: 0 6px;padding: 0 15px;border: 1px solid #dedede;background-color: #f1f1f1;color: #333;border-radius: 2px;font-weight: 400;cursor: pointer;text-decoration: none;display: inline-block;}
    	.box_sure{color: white;background-color: #009F95;}
    	
    	.box1{width:330px;height:250px;}
    	.box2{width:330px;height:138px;}
    	.box3{width:330px;height:250px;}
    	.box4{width:330px;height:138px;}
    	
    </style>
</head>
<body>
	<div class="main_right">
		<div class="m_r_position font_1">当前位置>信息管理>顾问咨询</div>
		<div style="margin-top: 15px;">
			<span>请选择网站类别：</span>
			<select id="select">
				<c:forEach items="${wtl}" var="w">
					<option value="${w.id}" sort="${w.sort}">${w.label}</option>
				</c:forEach>
			</select>
			<a class="add_websiteType">添加分类</a>
			<a class="alert_websiteType">修改分类</a>
			<a class="delete_websiteType">删除分类</a>
		</div>
	    <div class="table_main">
	    	<table class="table">
	    		<tr>
	    			<td class="other_items">序号</td>
	    			<td class="other_items">id</td>
	    			<td class="website_name">网站名称</td>
	    			<td class="website_url">网站链接</td>
	    			<td class="other_items">排序</td>
	    			<td class="other_items">操作</td>
	    		</tr>
	    		<c:forEach items="${wil}" var="w" varStatus="s">
		    		<tr>
		    			<td class="other_items">${s.count}</td>
		    			<td class="other_items">${w.id}</td>
		    			<td class="website_name">${w.site_name}</td>
		    			<td class="website_url">${w.site_url}</td>
		    			<td class="other_items">${w.sort}</td>
		    			<td class="operation">
		    				<a class="op_alert">修改</a>&nbsp;&nbsp;
		    				<a class="op_delete">删除</a>
		    			</td>
		    		</tr>
	    		</c:forEach>
	    		<tr>
	    			<td colspan="6">
		    			<p class="op_add">添加一个网站</p>
	    			</td>
	    		</tr>
	    	</table>
		</div>
		
		<!-- 弹出层 -->
		<!-- 大遮罩 -->
		<div class="bigShade"></div>
		<!-- 添加和修改分类弹出层 -->
		<div class="box box1">
			<div class="box_title">添加分类</div>
			<div class="box_content">
				<div class="item_line">
					<span class="item_name">类别名：</span>
					<input type="text" />
				</div>
				<div class="item_line">
					<span class="item_name">类型：</span>
					<input type="text" value="website_type" readonly="readonly" />
				</div>
				<div class="item_line">
					<span class="item_name">描述：</span>
					<input type="text" value="合作网站类型" readonly="readonly" />
				</div>
				<div class="item_line">
					<span class="item_name">排序：</span>
					<input type="text" />
				</div>
				<input id="aora" type="hidden"  />
			</div>
			<div class="box_bottom">
				<a class="box_bottom_a box_sure">确定</a>
				<a class="box_bottom_a box_cancel">取消</a>
			</div>
		</div>
		
		<!-- 删除分类弹出层 -->
		<div class="box box2">
			<div class="box_title">删除分类</div>
			<div class="box_content">
				<strong id="typeName"></strong>分类将被删除？
			</div>
			<div class="box_bottom">
				<a class="box_bottom_a box_sure">确定</a>
				<a class="box_bottom_a box_cancel">取消</a>
			</div>
		</div>
		
		<!-- 添加网站信息弹出层 -->
		<div class="box box3">
			<div class="box_title">添加网站信息</div>
			<div class="box_content">
				<div class="item_line">
					<span class="item_name">id：</span>
					<input type="text" readonly="readonly" />
				</div>
				<div class="item_line">
					<span class="item_name">网站名称：</span>
					<input type="text" />
				</div>
				<div class="item_line">
					<span class="item_name">网站链接：</span>
					<input type="text" />
				</div>
				<div class="item_line">
					<span class="item_name">排序：</span>
					<input type="text" />
				</div>
				<input id="box3_aora" type="hidden"  />
			</div>
			<div class="box_bottom">
				<a class="box_bottom_a box_sure">确定</a>
				<a class="box_bottom_a box_cancel">取消</a>
			</div>
		</div>
		
		<!-- 删除网站信息弹出层 -->
		<div class="box box4">
			<div class="box_title">删除网站</div>
			<div class="box_content">
				<strong id="box4_typeName"></strong>将被删除？
				<input id="box4_id" type="hidden" />
			</div>
			<div class="box_bottom">
				<a class="box_bottom_a box_sure">确定</a>
				<a class="box_bottom_a box_cancel">取消</a>
			</div>
		</div>
	
	</div>
	
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script>
		//添加网站分类弹窗
		$(".main_right").on("click",".add_websiteType",function(){
			$(".box1 input[type=text]").eq(0).val("");
			$(".box1 input[type=text]").eq(3).val("");
			//添加为1，修改为2
			$("#aora").val("1");
			boxShow(".box1");
		});
		
		//修改网站分类弹窗
		$(".main_right").on("click",".alert_websiteType",function(){
			var text = $('#select option:selected').text();
			//var value = $('#select option:selected').val();
			var sort = $('#select option:selected').attr("sort");
			$(".box1 input[type=text]").eq(0).val(text);
			$(".box1 input[type=text]").eq(3).val(sort);
			//添加为1，修改为2
			$("#aora").val("2");
			boxShow(".box1");
		});
		
		//删除网站分类弹窗
		$(".main_right").on("click",".delete_websiteType",function(){
			var text = $('#select option:selected').text();
			$("#typeName").text(text);
			boxShow(".box2");
			
		});
		
		//网站分类保存
		$(".box1 .box_sure").click(function(){
			var name = $(".box1 input[type=text]").eq(0).val();
			var type = $(".box1 input[type=text]").eq(1).val();
			var desc = $(".box1 input[type=text]").eq(2).val();
			var sort = $(".box1 input[type=text]").eq(3).val();
			var id = $('#select option:selected').val();
			var aora = $("#aora").val();
			
			if(name == "" || sort == ""){
				alert("请填写信息！");
				return;
			}
			
			$.ajax({
				url:'${ctx}/index/setCooperationWebsite/saveWebsiteType',
				type:'post',
				data:{
					name:name,
					type:type,
					desc:desc,
					sort:sort,
					aora:aora,
					id:id
				},
				dataType:'json',
				success:function(data){
					if(data.sta == "ok"){
						if(aora == "1"){
							$("#select").append('<option value="'+data.typeId+'" sort="'+sort+'">'+name+'</option>');
							boxClose(".box1");
							alert("添加成功");
						}else{
							$('#select option:selected').text(name);
							$('#select option:selected').attr("sort",sort);
							boxClose(".box1");
							alert("修改成功");
						}
					}
				}
			});
			
		});
		
		$(".box1 .box_cancel").click(function(){
			boxClose(".box1");
		});
		
		//删除分类
		$(".box2 .box_sure").click(function(){
			var id = $('#select option:selected').val();
			
			$.ajax({
				url:'${ctx}/index/setCooperationWebsite/deleteWebsiteType',
				type:'post',
				data:{
					id:id
				},
				dataType:'text',
				success:function(data){
					if(data == "ok"){
						$('#select option:selected').remove();
						$('.table').empty();
						boxClose(".box2");
						alert("删除成功");
					}
				}
			});
		});
		
		$(".box2 .box_cancel").click(function(){
			boxClose(".box2");
		});
		
		//添加一个网站
		$(".main_right").on("click",".op_add",function(){
			$(".box3 input[type=text]").eq(0).val("");
			$(".box3 input[type=text]").eq(1).val("");
			$(".box3 input[type=text]").eq(2).val("");
			$(".box3 input[type=text]").eq(3).val("");
			//添加为1，修改为2
			$("#box3_aora").val("1");
			boxShow(".box3");
		});
		
		//修改一个网站
		var clickedtr;
		$(".main_right").on("click",".op_alert",function(){
			clickedtr = $(this).parent().parent();
			var tr = $(this).parent().parent();
			var id = tr.find("td").eq(1).text();
			var name = tr.find("td").eq(2).text();
			var url = tr.find("td").eq(3).text();
			var sort = tr.find("td").eq(4).text();
			
			$(".box3 input[type=text]").eq(0).val(id);
			$(".box3 input[type=text]").eq(1).val(name);
			$(".box3 input[type=text]").eq(2).val(url);
			$(".box3 input[type=text]").eq(3).val(sort);
			//添加为1，修改为2
			$("#box3_aora").val("2");
			boxShow(".box3");
		});
		
		//删除一个网站
		$(".main_right").on("click",".op_delete",function(){
			clickedtr = $(this).parent().parent();
			var tr = $(this).parent().parent();
			var id = tr.find("td").eq(1).text();
			var name = tr.find("td").eq(2).text();
			$("#box4_typeName").text(name);
			$("#box4_id").val(id);
			boxShow(".box4");
		});
		
		$(".box3 .box_sure").click(function(){
			var id = $(".box3 input[type=text]").eq(0).val();
			var name = $(".box3 input[type=text]").eq(1).val();
			var url = $(".box3 input[type=text]").eq(2).val();
			var sort = $(".box3 input[type=text]").eq(3).val();
			var aora = $("#box3_aora").val();
			var type = $('#select option:selected').val();
			
			if(name=="" || url=="" || sort==""){
				alert("请填写信息！");
				return;
			}
			
			$.ajax({
				url:'${ctx}/index/setCooperationWebsite/saveWebsiteInfo',
				type:'post',
				data:{
					id:id,
					name:name,
					url:url,
					type:type,
					sort:sort,
					aora:aora
				},
				dataType:'json',
				success:function(data){
					if(data.sta == "ok"){
						if(aora == "1"){
							var tr = '<tr>'+
						    			'<td class="other_items"></td>'+
						    			'<td class="other_items">'+data.id+'</td>'+
						    			'<td class="website_name">'+data.name+'</td>'+
						    			'<td class="website_url">'+data.url+'</td>'+
						    			'<td class="other_items">'+data.sort+'</td>'+
						    			'<td class="operation">'+
						    				'<a class="op_alert">修改</a>&nbsp;&nbsp;'+
						    				'<a class="op_delete">删除</a>'+
						    			'</td>'+
						    		'</tr>';
						    var len = $(".table tr").length;
						    $(".table tr").eq(len-1).before(tr);
							boxClose(".box3");
							alert("添加成功");
						}else{
							clickedtr.find("td").eq(2).text(name);
							clickedtr.find("td").eq(3).text(url);
							clickedtr.find("td").eq(4).text(sort);
							boxClose(".box3");
							alert("修改成功");
						}
					}
				}
			});
			
		});
		
		$(".box3 .box_cancel").click(function(){
			boxClose(".box3");
		});
		
		$(".box4 .box_sure").click(function(){
			var id = $("#box4_id").val();
			$.ajax({
				url:'${ctx}/index/setCooperationWebsite/deleteWebsiteInfo',
				type:'post',
				data:{
					id:id
				},
				dataType:'text',
				success:function(data){
					if(data == "ok"){
						clickedtr.remove();
						boxClose(".box4");
						alert("删除成功！");
					}
				}
			});
			
		});
		
		$(".box4 .box_cancel").click(function(){
			boxClose(".box4");
		});
		
		$("#select").change(function(){
			var id = $('#select option:selected').val();
			$.ajax({
				url:'${ctx}/index/setCooperationWebsite/getWebsiteInfo',
				type:'post',
				data:{
					id:id
				},
				dataType:'json',
				success:function(data){
					debugger;
					$(".table").empty();
					
					var th = '<tr>'+
		    			'<td class="other_items">序号</td>'+
		    			'<td class="other_items">id</td>'+
		    			'<td class="website_name">网站名称</td>'+
		    			'<td class="website_url">网站链接</td>'+
		    			'<td class="other_items">排序</td>'+
		    			'<td class="other_items">操作</td>'+
		    		'</tr>'
		    		var $tb = $(
		    				'<tr>'+
				    			'<td class="other_items item_count">${s.count}</td>'+
				    			'<td class="other_items item_id">${w.id}</td>'+
				    			'<td class="website_name">${w.site_name}</td>'+
				    			'<td class="website_url">${w.site_url}</td>'+
				    			'<td class="other_items item_sort">${w.sort}</td>'+
				    			'<td class="operation">'+
				    				'<a class="op_alert">修改</a>&nbsp;&nbsp;'+
				    				'<a class="op_delete">删除</a>'+
				    			'</td>'+
				    		'</tr>'
		    					);
		    		var tf = '<tr>'+
		    					'<td colspan="6">'+
	    							'<p class="op_add">添加一个网站</p>'+
    							'</td>'+
    						  '</tr>';
    						  
					$(".table").append(th);
					var len = data.length;
					for(var i=0;i<len;i++){
						var cc = data[i].columns;
						var $tbcl = $tb.clone();
						$tbcl.find(".item_count").text(i);
						$tbcl.find(".item_id").text(cc.id);
						$tbcl.find(".website_name").text(cc.site_name);
						$tbcl.find(".website_url").text(cc.site_url);
						$tbcl.find(".item_sort").text(cc.sort);
						$(".table").append($tbcl);
					}
					$(".table").append(tf);
					
				}
			});
		});
		
		//打开弹出框公用方法
		function boxShow(selector){
			var wh = $(window).height();
			var ww = $(window).width();
			var top = (wh - $(selector).height())/2;
			var left = (ww - $(selector).width())/2;
			$(selector).css("top",top);
			$(selector).css("left",left);
			$(selector).show();
			$(".bigShade").show();
		}
		
		//关闭弹出框公用方法
		function boxClose(selector){
			$(selector).hide();
			$(".bigShade").hide();
		}
	</script>
</body>
</html>