<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>广告-广告管理-推荐企业广告</title>
        
        <style type="text/css">
        	div,p,input{margin: 0;padding: 0;}
        	body{font: normal 14px/1.5em "Microsoft Yahei","arial","宋体";color: #333;}
        	.tab_main {border: 1px solid #ccc;padding: 15px 10px 30px;min-height: 1140px;position: relative;}
        	.main_right {float: left;width: 765px;overflow: hidden;}
        	.m_r_position{margin-bottom: 5px;font-size: 12px;}
        	.adv_save {margin-right: 5px;width: 80px;line-height: 30px;height: 30px;text-align: center;color: #fff;display: inline-block;border: 1px solid #5ec520;background-color: #5ec520;cursor: pointer;}
	        .enterprises {width: 398px;height: 138px;float: left;border: 1px solid #ccc;}
			.tb{border:solid #add9c0; border-width:1px 0px 0px 1px;width: 100%;border-collapse: collapse;}
			.tb td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;text-align: center;}
			.mt{margin-top: 15px;}
			.items{width: 765px;}
			.adv_item{width: 200px;height: 168px;border:1px solid #f6f6f6;margin-top: 10px;margin-left: 15px;float: left;}
			.adv_po{color: #ee7800;font-weight: bold;text-align: center;}
			.adv_img_f{width: 200px;height: 70px;text-align: center;vertical-align: middle; display: table-cell;}
			.adv_img{max-width: 200px; max-height: 70px;}
			.adv_up{width: 68px;height: 20px;text-align: center;line-height: 20px;}
			.adv_file{width: 68px;height: 20px;left: 0px;position:absolute;opacity:0;filter: alpha(opacity=0);}
			.adv_del{width: 68px;height: 20px;text-align: center;line-height: 20px;}
			.adv_url{width: 124px;height: 20px;border: #ccc 1px solid;}
			.adv_name{width: 124px;height: 20px;border: #ccc 1px solid;}
			.adv_pageNum{display: inline-block;width: 62px;text-decoration: none;height: 20px;background-color: #ee7800;color: #fff;text-align: center;line-height: 20px;}
        	.adv_addPage{display: inline-block;width: 70px;height: 25px;color: #5ec520;text-align: center;line-height: 25px;background-color: #fff;cursor: pointer;border: solid 1px #5ec520;}
        	.adv_delPage{display: inline-block;width: 70px;height: 25px;color: #f00;text-align: center;line-height: 25px;background-color: #fff;cursor: pointer;border: 1px solid #f00;}
        	.adv_pageNow{background: #5ec520;}
        	.tab_main_row{margin-top: 15px;}
        	.pageNums{margin-top: 15px;}
        </style>
        
        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
        <script type="text/javascript">
        	$(function(){
        		
        		changePageNow();
        		//改变当前页面的样式
        		function changePageNow(){
	        		var pageNow = ${pageNumber};
	        		$(".adv_pageNow").removeClass("adv_pageNow");
	        		var pn = $(".adv_pageNum");
	        		for(var i=0;i<pn.length;i++){
	        			var num = pn.eq(i).attr("data-num");
	        			if(num == pageNow){
	        				pn.eq(i).addClass("adv_pageNow");
	        			}
	        		}
        		}
        		
        		//删除图片
        		$(".items").on("click",".adv_del",function(){
        			var img_f = $(this).parent().prev();
        			img_f.find(".adv_img").attr("src","");
        		});
        		
        		//上传图片
        		$(".items").on("change",".adv_file",function(){
        			$("#files").attr("id","");
        			$(this).attr("id","files");
        			upPic(function(a){
	        			var img_f = $("#files").parent().prev();
	        			img_f.find(".adv_img").attr("src",a);
	        			$("#files").attr("id","");
        			});
        		});
        		
        		//清空信息
        		$(".items").on("click",".clear",function(){
        			debugger;
        			var item = $(this).parent().parent();
        			item.find(".adv_img").attr("src","");
        			item.find(".adv_url").val("");
        			item.find(".adv_name").val("");
        			
        		});
        		
        		function upPic(callback) {
       	            var url = $("#files").val();
       	            var u = url.substring(url.length - 4, url.length);
       	            if (url == "") { //验证
       	                showMess("请选择图片！");
       	            } else if (u != ".gif" && u != ".jpg" && u != ".png"
       	            		&& u != ".GIF" && u != ".JPG" && u != ".PNG") {
       	                alert("图片格式不正确！<br />只能上传gif、jpg、png格式的图片！");
       	            } else {
       	                $.ajaxFileUpload({
       	                    url: '${ctx}/fileUploadServer',
       	                    secureuri: false,
       	                    fileElementId: 'files',
       	                    dataType: 'text',
       	                    success: function (data, status) {
       	                        if (status == 'success') {
       	                            var ss = data.replace(/<[^>]+>/g, "");
       	                            callback(ss);
       	                        }
       	                    },
       	                    error: function (data, status, e) {
       	                        alert(e);
       	                    }
       	                });
       	            }
        	    }
        		
        		//保存更改
        		$(".adv_save").click(function(){
        			var ids = $(".adv_id");
        			var imgs = $(".adv_img");
        			var urls = $(".adv_url");
        			var names = $(".adv_name");
        			var json = "[";
        			for(var i=0;i<15;i++){
        				json = json + "{'id':'"+ids.eq(i).val()+"','img':'"+imgs.eq(i).attr("src")
        					+"','url':'"+urls.eq(i).val()+"','name':'"+names.eq(i).val()+"'},"
        			}
        			json = json.substring(0,json.length-1);
        			json += "]";
        			
        			 $.ajax({
        	                type: "POST",
        	                url: "${ctx}/infomaintain/management/saveIndexAdv",
        	                data: "json=" + json,
        	                dataType: 'text',
        	                success: function (data) {
        	                   if(data == "ok"){
        	                	   alert("保存成功");
        	                	   window.open("${ctx}/infomaintain/management/newHomePageManage","_self");
        	                   }else{
        	                	   alert("出错了");
        	                   }
        	                }
        	            });
        			
        		});
        		
        		//添加一页
        		$(".adv_addPage").click(function(){
        			$(".items").empty();
        			for(var i=0;i<15;i++){
        				var item = '<div class="adv_item">'+
	                		'<input class="adv_id" type="hidden" value="" />'+
		                		'<p class="adv_po">广告位'+i+'</p>'+
		                		'<div class="adv_img_f">'+
									'<img class="adv_img" src="">'+
								'</div>'+
								'<div style="position: relative;">'+
				                	'<input class="adv_up" type="button" value="上传图片" />'+
				                	'<input class="adv_file" type="file" name="files" />'+
				                	'<input class="adv_del" type="button" value="删除图片" />'+
								'</div>'+
								'<div>'+
				                 	'<span>跳转链接：</span><input class="adv_url" value="" type="text" />'+
								'</div>'+
								'<div>'+
				                 '	<span>图片名称：</span><input class="adv_name"  value="" type="text" />'+
								'</div>'+
		                	'</div>';
        				$(".items").append(item);
        			}
        			
        			$(".adv_pageNow").removeClass("adv_pageNow");
        			var num = $(".adv_pageNum:last").attr("data-num");
        			var cnum = Number(num) + 1;
        			var pagenum = '<a class="adv_pageNum adv_pageNow" data-num="'+cnum+'" href="${ctx}/infomaintain/management/newHomePageManage?pageNum='+cnum+'">广告页'+cnum+'</a>';
        			$(".pageNums").append(pagenum);
        		});
        		
        		//删除该页
        		$(".adv_delPage").click(function(){
        			var ids = $(".adv_id");
        			var imgs = $(".adv_img");
        			var urls = $(".adv_url");
        			var names = $(".adv_name");
        			var json = "[";
        			for(var i=0;i<15;i++){
        				json = json + "{'id':'"+ids.eq(i).val()+"','img':'"+imgs.eq(i).attr("src")
        					+"','url':'"+urls.eq(i).val()+"','name':'"+names.eq(i).val()+"'},"
        			}
        			json = json.substring(0,json.length-1);
        			json += "]";
        			
        			 $.ajax({
        	                type: "POST",
        	                url: "${ctx}/infomaintain/management/delPage",
        	                data: "json=" + json,
        	                dataType: 'text',
        	                success: function (data) {
        	                   if(data == "ok"){
        	                	   alert("删除成功");
        	                	   window.open("${ctx}/infomaintain/management/newHomePageManage","_slef");
        	                   }else{
        	                	   alert("出错了");
        	                   }
        	                }
        	            });
        		});
        		
        		
        	});
        </script>
        
    </head>
    <body>
        <!-- 右侧开始 -->
        <div class="main_right">
			<div class="m_r_position">当前位置>广告>广告管理</div>
            <div class="tab_main">
                <div class="mt">
					<p>首页广告位示意图：</p>
					<table class="tb">
						<tr>
							<td colspan="2" rowspan="2">0</td>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
						</tr>
						<tr>
							<td>5</td>
							<td>6</td>
							<td>7</td>
							<td>8</td>
						</tr>
						<tr>
							<td>9</td>
							<td>10</td>
							<td>11</td>
							<td>12</td>
							<td>13</td>
							<td>14</td>
						</tr>
					</table>                  
				</div>
				
				<div class="tab_main_row">
                	<a class="adv_save">保存更改</a>    
                	<a class="adv_addPage">新增一页</a>
                	<a class="adv_delPage">删除此页</a>                    
                </div>
                
                <div class="pageNums">
                	<a class="adv_pageNum adv_pageNow" data-num="1" href="${ctx}/infomaintain/management/newHomePageManage?pageNum=1">广告页1</a>
                	<c:forEach var="i" begin="2" end="${totalPage}" step="1">   
						<a class="adv_pageNum" data-num="${i}" href="${ctx}/infomaintain/management/newHomePageManage?pageNum=${i}">广告页${i}</a> 
					</c:forEach>  
                </div>
				
                <div class="items">
                	<c:forEach items="${advList}" var="ad" varStatus="s">
	                	<div class="adv_item">
	                		<input class="adv_id" type="hidden" value="${ad.id}" />
	                		<p class="adv_po">广告位${s.index}</p>
	                		<div class="adv_img_f">
								<img class="adv_img" src="${ad.get('pic_addr')}">
							</div>
							<div style="position: relative;">
			                	<input class="adv_up" type="button" value="上传图片" />
			                	<input class="adv_file" type="file" name="files" />
			                	<input class="adv_del" type="button" value="删除图片" />
			                	<input class="clear" type="button" value="清空">
							</div>
							<div>
			                 	<span>跳转链接：</span><input class="adv_url" value="${ad.get('redirct_href')}" type="text" />
							</div>
							<div>
			                 	<span>图片名称：</span><input class="adv_name"  value="${ad.get('show_name')}" type="text" />
							</div>
	                	</div>
                	</c:forEach>
                	
                </div>
                
                
			</div>
        </div>         
        <!-- 右侧结束 -->
    </body>
</html>


