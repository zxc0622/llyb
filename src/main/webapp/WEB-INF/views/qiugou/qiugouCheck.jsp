<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>信息管理-供应-审核中</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>固废求购</div>
    <div class="tab_main">
        <div class="tab_title">
            <span onclick="goUrl('信息管理/求购-添加求购.html')">添加固废求购</span>
            <span onclick="goUrl('信息管理/求购-已发布.html')">已发布</span>
            <span class="cur_tab">审核中</span>
            <span onclick="goUrl('信息管理/求购-未通过.html')">未通过</span>
            <span onclick="goUrl('信息管理/求购-已过期.html')">已过期</span>
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="" onChange="" >
                	<option value="">行业分类</option>
                    <option value="">行业分类</option>
                    <option value="">行业分类</option>
                </select>
                
                <select name="" id="" onChange="" >
                	<option value="">信息分类</option>
                    <option value="">信息分类</option>
                    <option value="">信息分类</option>
                </select>
                
                <input type="text"/>
                <select name="" id="" onChange="">
                	<option value="">自定义分类</option>
                    <option value="">信息分类</option>
                    <option value="">信息分类</option>
                </select>
                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table>
                	<tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
                        <th style="width:120px">图片</th>
                        <th style="width:160px">标题</th>
                        <th style="width:120px">行业</th>
                        <th style="width:130px">添加时间</th>
                        <th style="width:120px">浏览</th>
                        <th style="width:60px">管理</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="choose" ></td>
                        <th><img src="${ctxStatic}/img/llhb/e1.png"></th>
                        <td>废纸</td>
                        <td>废书刊杂志</td>
                        <td>2015-09-06 18:05</td>
                        <td>13</td>
                        <td>
                            <a class="tr_manage_1" style="position:relative;">&nbsp;<h6>修改</h6></a>
                            <a class="tr_manage_2" style="position:relative;">&nbsp;<h6>删除</h6></a>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="choose" ></td>
                        <th><img src="${ctxStatic}/img/llhb/e1.png"></th>
                        <td>废纸</td>
                        <td>废书刊杂志</td>
                        <td>2015-09-06 18:05</td>
                        <td>13</td>
                        <td>
                            <a class="tr_manage">&nbsp;</a>
                            <a class="tr_manage">&nbsp;</a>
                            <h6>修改</h6>
                            <h6>删除</h6>
                        </td>
                    </tr>
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all">
                	<input type="button" value="删除选中"/>
                </div>
                <div class="filp">
                	<input type="button" value="上一页" style="width:60px;"/>
                    <input type="button" value="下一页" style="width:60px;"/>
                    <a>共<span>12</span>条/<span>4</span>页</a>
                    <input type="text" style="width:30px;">
                    <input type="button" value="跳转" style="width:60px;">
                </div>
            </div>
		</form>
	</div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
	<!--复选框-->
	function SelectAll() {
		 var checkboxs=document.getElementsByName("choose");
		 for (var i=0;i<checkboxs.length;i++) {
		  var e=checkboxs[i];
		  e.checked=!e.checked;
		 }
		 
	}
	
	<!--管理的修改删除-->
	$("h6").hide();
	$(".tr_manage").mouseover(function(){
		x=$(".tr_manage").index(this);
		$("h6:eq("+x+")").show();
	});
	$(".tr_manage").mouseout(function(){
		$("h6").hide();
	 })
               
</script>
</body>
</html>