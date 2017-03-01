<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>环保公司-危废服务-安排运收</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页样式*/

.row>span{margin-left: 233px;margin-top: 5px;margin-right: 10px;width:80px;text-align: left;}
input{width:193px;}
.row .row-tips{color:red;margin-left:332px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务</div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li >
                    <div class="txt">审核资料并报价</div>
                    <div class="triangle"></div>
                </li>
                <li >
                    <div class="txt">上传合同及资料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">确认管理计划表</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">审批材料</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">安排收运</div>
                    <div class="triangle"></div>
                </li>
                <a style="width:90px;margin-top:10px;" class="btn fl" href="javascript:confirmDel();">作废</a>
            </ul>
        </div>
        <div class="row"style="margin-top: 40px;">
            <div class="row row1">
                <span class="fl">产废企业 </span>
                <input class="fl" type="text" value="${s.cname }">
            </div>
            <div class="row row2">
                <span class="fl">收运联系人 </span>
                <input class="fl" type="text" value="${s.person }">
            </div>
            <div class="row row2">
                <span class="fl">联系电话 </span>
                <input class="fl" type="text" value="${s.phone }">
            </div>
            <div class="row row2">
                <span class="fl">拟收运日期 </span>
                <input class="fl" type="text" value="${s.date }">
            </div>
            <c:choose>
            	<c:when test="${s.enotice eq '1' }">
            		<div class="btns">
		                <a href="javascript:void(0);"class="btn btn-connot">已确定收运日期</a>
		            </div>
		            <div class="row row2">
		            	<span id="a"  class="fl row-tips">已确定</span>
		            </div>
            	</c:when>
            	<c:otherwise>
            		<div class="btns" >
		                <a href="javascript:confirmCt()"class="btn">已确定收运日期</a>
		                <div class="row row2">
		                	<span id="a" class="fl row-tips">未确定</span>
		                </div>
		            </div>
            	</c:otherwise>
            </c:choose>
                        
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
	function confirmCt(){
		var a = $("#a").attr("data-index");
		if(a == '1'){
			parent.showMess("收运日期已确定！");
			return;
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/ws/environment/confirmplan/confirmCt",
			data:"id="+'${s.id}',
			dataType:'text',
			success:function(data){
				if(data == "操作成功！"){
					$("#a").html("已确定").attr("data-index","1");
					$(".btn").addClass("btn-connot");
				}
				parent.showMess(data);
			}
		});
	}
	function confirmDel(){
		parent.showMessYes("确定作废？");
		$(".yes-btn", window.parent.document).unbind().one("click",yesToSub);
	}
	function yesToSub(){
		parent.hideMessYes();
		$.ajax({
			type:"POST",
			url:"${ctx}/ws/environment/confirmplan/del",
			data:"id="+'${s.id}',
			dataType:'text',
			success:function(data){
				parent.showMess(data);
				if(data == '操作成功！'){
					setTimeout(function(){
						location.href='${ctx}/ws/environment/servicelist';
					},3000);
				}
			}
		}); 
	}
</script>
</body>
</html>
