<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>信息管理-会员服务-商机收藏</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<style>
/*标题绿色*/
.tab_main_result table tr td:nth-of-type(2):hover{color:#5cb531;}
</style>
</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>会员服务>商机收藏</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title"><span class="cur_tab">商机收藏</span></div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="type" id="type" onChange="changeType()" >
                	<option value="0" >所有分类</option>
                    <option value="1">供应</option>
                    <option value="2">求购</option>
                    <option value="3">竞品</option>
                    <option value="4">环保商城</option>
                </select>
                <input id="title" type="text" style="width:330px"/>
                <input onclick="search()" type="button" value="搜索" style="border:1px solid #5EC520;background-color:#5EC520;color:#fff;">
                <input onclick="res()" type="button" value="重置"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table></table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all">
                	<input type="button" value="删除选中" onclick="delAll()"/>
                </div>
                <div class="filp">
                	<input id="prev" type="button" value="上一页" style="width:60px;"/>
                    <input id="next" type="button" value="下一页" style="width:60px;"/>
                    <a>共<span>0</span>条/<span>0</span>页</a>
                    <input id="num" type="text" style="width:30px;">
                    <input id="goPage" type="button" value="跳转" style="width:60px;">
                </div>
            </div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script>
var pageSize= 10;
	$(function(){
		getNum();
		list(1);
	});
	$(document).ready(function(){
		//上一页
		$("#prev").on("click",function(){
			var totlePage = $(".filp_box .filp a span").eq(1).html();
			var currentPage = parseInt($("#num").val())-1;
			if(currentPage >=1){
				list(currentPage);
			}else{
				parent.showMess("当前已是第一页！");
			}
		});
		//下一页
		$("#next").on("click",function(){
			var totlePage = $(".filp_box .filp a span").eq(1).html();
			var currentPage = parseInt($("#num").val())+1;
			if(currentPage <= totlePage){
				list(currentPage);
			}else{
				parent.showMess("当前已是最后一页！");
			}
		});
		//跳转
		$("#goPage").on("click",function(){
			var totlePage = parseInt($(".filp_box .filp a span").eq(1).html());
			var currentPage = parseInt($("#num").val());
			if(currentPage <= totlePage && currentPage >= 1){
				list(currentPage);
			}else{
				parent.showMess("跳转页数超出范围！");
			}
		});
		//限制数字
	 	$("#num").keyup(function(){      
	          $(this).val($(this).val().replace(/[^0-9]/g,''));      
	      }).bind("paste",function(){  //CTR+V事件处理      
	          $(this).val($(this).val().replace(/[^0-9]/g,''));       
	      }).css("ime-mode", "disabled"); //CSS设置输入法不可用
	});
	//复选框
	function SelectAll() {
		 var checkboxs=document.getElementsByName("choose");
		 for (var i=0;i<checkboxs.length;i++) {
		  var e=checkboxs[i];
		  e.checked=!e.checked;
		 }
	}
	//获取列表
	function list(pageNumber){
		var type=$("#type").val();
		var title=$("#title").val();
		var str = '<tr><th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>'+
       	 	'<th style="width:140px">图片</th>'+
        	'<th style="width:240px">标题</th>'+
        	'<th style="width:200px">添加时间</th>'+
        	'<th style="width:60px">管理</th></tr>';
       	$.ajax({
   			type:"POST",
   			url:"${ctx}/memSerevice/business/getBusinessList",
   			data: "pageNumber="+pageNumber+"&type="+type+"&title="+title+"&pageSize="+pageSize,
   			dataType:'json',
   			success:function(data){
   				$(".tab_main_result table").empty();
				if(data==null||data.length<=0){
					if(pageNumber == 1){
						$(".tab_main_result table").html(str);
						$("#num").val(pageNumber);
					}else{
						list(pageNumber-1);
					}
				}else{
					$("#num").val(pageNumber);
					var src="";
					$.each(data,function(index,item){
						if(item.pic1 != "" && item.pic1 != null){
							src=item.pic1;
						}else if(item.pic2 != "" && item.pic2 != null){
							src=item.pic2;
						}else if(item.pic3 != "" && item.pic3 != null){
							src=item.pic3;
						}else{
							src='${ctxStatic}/img/llhb/default.png';
						}
						str+='<tr><td><input type="checkbox" name="choose" value='+item.bid+'></td>';
		                str+='<td><img src="'+src+'" /></td>';
	                	str+='<td onclick="goDetail('+item.id+","+item.type+')">'+item.title+'</td>';
		                str+='<td>'+item.cdate.substring(0,10)+'</td>';
		               	str+='<td><a class="tr_manage_2" onclick ="del('+item.bid+')" >&nbsp;<h6>删除</h6></a></td></tr>'; 
					});
					$(".tab_main_result table").html(str); 
					//管理的修改删除
					$("h6").hide();
					$(".tr_manage_2").mouseover(function(){
						x=$(".tr_manage_2").index(this);
						$("h6:eq("+x+")").show();
					});
					$(".tr_manage_2").mouseout(function(){
						$("h6").hide();
					 });
				}
				window.parent.document.getElementById('rightIframe').height=$(".tab_main_result").height()+300;
   			}
       	});
	}
	//获取条数
	function getNum(){
		var type=$("#type").val();
		var title=$("#title").val();
		$.ajax({
			type:"POST",
			url:"${ctx}/memSerevice/business/getBusCount",
			data: "type="+type+"&title="+title,
			dataType:'json',
			success:function(data){
				var pages = Math.ceil(data/10);
				$(".filp_box .filp a span").eq(0).html(data);
				$(".filp_box .filp a span").eq(1).html(pages);
			}
		});
	}
	//删除选中
	function delAll(){
		var obj = document.getElementsByName("choose");
		var ids = [];
		for(k in obj){
			if(obj[k].checked)
				ids.push(obj[k].value);
		}
		if(ids == "" || ids == null){
			parent.showMess("请选择！");
		}else{
			del(ids);
		}
	}
	//删除
	function del(ids){
		parent.showMessYes("确定删除？");
		$(".yes-btn", window.parent.document).unbind().on("click",function(){
			$(".pl_yesorno", window.parent.document).hide();
			var result = "";
			$.ajax({
				type:"POST",
				url:"${ctx}/memSerevice/business/del",
				data: "ids="+ids,
				dataType:'json',
				success:function(data){
					if(data == "false"){
						parent.showMess("删除失败!");
					}else{
						parent.showMess("删除成功!");
						var currentPage = parseInt($("#num").val());
						getNum();
						list(currentPage);
						setTimeout(function(){
		            		$(".popumask", window.parent.document).hide();
		            		$(".pl_normal", window.parent.document).hide();
		            	},1500);
					}
				}
			});
		});
	}
	//搜索
	function search(){
		var title=$("#title").val();
		if(title.replace(/\s+/g,"")==""){
			parent.showMess("请输入标题!");
		}else{
			getNum();
			list(1);
		}
	}
	//重置
	function res(){
		$("#title").val("");
		$("#type").val("0");
		getNum();
		list(1);
	}
	function goDetail(id,type){
		var str = "";
		switch(type)
		{
		case 1://供应
			str="/solidsupply/getMess";
		  	break;
		case 2://求购
			str="/qiugou/details";
		  	break;
		case 3://竞品
			str="";
		  	break;
		case 4://环保商城
			str="/mall/details";
		  	break;
        case 5://成功案例
            str="/Library/case/caseDetail";
            break;
		}
		window.open("${ctx}"+str+"?id="+id, "_blank");
	}
	function changeType(){
		getNum();
		list(1);
	}
</script>
</body>
</html>
