<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>环保公司-危废服务-确认管理计划表</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
<style>
/*本页样式*/
.btn{width:95px;}
.row>span{margin-left: 175px;margin-top: 5px;margin-right: 10px;}
input{width:193px;}
.row1{margin-top: 30px;text-align: center;}
.row2{margin-top: 30px;text-align: center;}
#msg1{color:red}
#msg2{color:red}
.row .row-tips{color:red;margin-left:275px;}
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
                <li class="wf_t_sel">
                    <div class="txt">确认管理计划表</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">审批材料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">安排收运</div>
                    <div class="triangle"></div>
                </li>
                <select style="margin-top:10px;height: 30px;text-indent:0;background:#E5E5E5;" class="fl" name="back" id="back" onChange="stepBack()">
                    <option value="0">请选择退回</option>
                    <option value="1">基本列表</option>
                    <option value="2">查阅合同</option>
                </select>
            </ul>
        </div>
        <div class="row"style="margin-top: 40px;">
            <div class="dif_div">
                <span>确认帐号密码</span>
                <div class="dif_div_main">
                    <div class="row row1">
                        <span class="fl">帐号 </span>
                        <input id="loginName" class="fl" type="text" value="${s.mln }">
                    </div>
                    <div class="row row2">
                        <span class="fl">密码 </span>
                        <input id="password" class="fl" type="text" value="${s.mp }">
                    </div>
                    <c:choose>
                		 	<c:when test="${s.eaccount == '1' }">
                		 		<div id="np" class="btns" data-index="1">
                 		 		<a href="javascript:void(0);"class="btn btn-connot">确认</a>
                     			<a href="javascript:void(0);"class="btn btn-connot" >帐号未通过</a>
                		 	</c:when>
                		 	<c:otherwise>
                		 		<div id="np" class="btns" data-index="0">
                 		 		<a href="javascript:confirmNameAndPass('1');"class="btn">确认</a>
                     			<a href="javascript:confirmNameAndPass('-1');"class="btn" >帐号未通过</a>
                		 	</c:otherwise>
                		 </c:choose>
                    </div>  
                    <div class="row row2">
                        <c:if test="${s.eaccount == '1' }"><span id="msg1" data-index="1" class="fl row-tips">账号已确定</span></c:if>
                        <c:if test="${s.eaccount == '-1' }"><span id="msg1" data-index="0" class="fl row-tips">账号未通过</span></c:if>
                        <c:if test="${s.eaccount == '0' }"><span id="msg1" data-index="0" class="fl row-tips"></span></c:if>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="row">
            <div class="dif_div">
                <span>确认管理计划表</span>
                <div class="dif_div_main">
                   		<div class="btns">
                   			<a href="javascript:downPlan();"class="btn" style="width:192px;">下载管理计划表</a>
                   		 </div>
                   		 <c:choose>
                   		 	<c:when test="${s.eatta == '1' }">
                   		 		<div id="zl" class="btns" data-index="1">
	                   		 		<a href="javascript:void(0);"  class="btn btn-connot">确认</a>
	                       			<a href="javascript:void(0);"class="btn btn-connot" >资料未完善</a>
                   		 	</c:when>
                   		 	<c:otherwise>
                   		 		<div id="zl" class="btns" data-index="0">
	                   		 		<a href="javascript:confirmPlan('1');"  class="btn">确认</a>
	                       			<a href="javascript:confirmPlan('-1');"class="btn" >资料未完善</a>
                   		 	</c:otherwise>
                   		 </c:choose>
	                    </div>  
	                    <div class="row row2">
	                        <c:if test="${s.eatta == '1' }"><span id="msg2" data-index="1" class="fl row-tips">资料已确定</span></c:if>
	                        <c:if test="${s.eatta == '-1' }"><span id="msg2" data-index="0" class="fl row-tips">资料未完善</span></c:if>
	                        <c:if test="${s.eatta == '0' }"><span id="msg2" data-index="0" class="fl row-tips"></span></c:if>
                        </div>
                </div>
            </div>
        </div>
        <div id="next"  class="btns" >
        	<c:choose>
          		<c:when test="${s.eaccount eq '1' && s.eatta eq '1'}">
          			<a style="margin-left: -111px;" href="javascript:nextStep();" class="btn" >下一步</a>
          		</c:when>
          		<c:otherwise>
          			<a style="margin-left: -111px;" href="javascript:nextStep();"class="btn btn-connot" >下一步</a>
          		</c:otherwise>
          	</c:choose>
        </div>  
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
var id='${s.id}';
//验证账户密码
function confirmNameAndPass(result){
	$.ajax({
		type:"POST",
		url:"${ctx}/ws/environment/confirmplan/confirmNameAndPass",
		data:"id="+id+"&result="+result,
		dataType:'text',
		success:function(data){
			if(data=="操作成功！"){
				if(result == '1'){
					$("#msg1").attr("data-index","1");
					$("#msg1").html("账号密码已确定");
					$("#np").attr("data-index","1");
					$("#np .btn").addClass("btn-connot");
					if($("#msg2").attr("data-index") == "1"){
						$("#next .btn-connot").removeClass("btn-connot");
					}
				}else{
					$("#msg1").html("账号密码未通过");
				}
			}
			parent.showMess(data);
		}
	});
}
//下载附件
function downPlan(){
	$.ajax({
		type:"POST",
		url:"${ctx}/ws/environment/confirmplan/downAtta",
		data:"id="+id,
		dataType:'json',
		success:function(data){
			if(data.maa==""){
				parent.showMess("请等待对方上传！");
			}else{
				window.open(data.maa);
			}
		}
	});
}
//确认管理计划
function confirmPlan(result){
	$.ajax({
		type:"POST",
		url:"${ctx}/ws/environment/confirmplan/confirmPlan",
		data:"id="+id+"&result="+result,
		dataType:'text',
		success:function(data){
			if(data=="操作成功！"){
				if(result == '1'){
					$("#msg2").attr("data-index","1");
					$("#msg2").html("资料已确定");
					$("#zl").attr("data-index","1");
					$("#zl .btn").addClass("btn-connot");
					if($("#msg1").attr("data-index") == "1"){
						$("#next .btn-connot").removeClass("btn-connot");
					}
				}else{
					$("#msg2").html("资料未通过");
				}
			}
			parent.showMess(data);
		}
	});
}
//下一步
function nextStep(){
	$.ajax({
		type:"POST",
		url:"${ctx}/ws/environment/confirmplan/nextStep",
		data:"id="+id,
		dataType:'text',
		success:function(data){
			if(data == 'ok'){
				location.href="${ctx }/ws/environment/approvefile?id="+id;
			}else{
				parent.showMess(data);
			}
		}
	});
}
function stepBack(){
	debugger;
	var val=$("#back").val();
	if(val != '0'){
		parent.showMessYes("确定退回？");
		$(".yes-btn", window.parent.document).unbind().one("click",yesToSub);
	}
}
function yesToSub(){
	parent.hideMessYes();
	var val=$("#back").val();
	switch (parseInt(val)){
	case 1:
		backBaseInfo();//返回基本资料
		break;
	case 2:
		backContract();//返回查阅合同
		break;
	default:
		break;
	}
}

function backBaseInfo(){
	$.ajax({
		type:"POST",
		url:"${ctx}/backBaseInfo",
		data:"serId="+id,
		dataType:'text',
		success:function(data){
			if(data == 'ok'){
				parent.showMess("操作成功！");
				setTimeout(function(){
					location.href='${ctx}/ws/environment/servicelist';
				},3000);
			}else{
				parent.showMess(data);
			}
		}
	});
}
function backContract(){
	$.ajax({
		type:"POST",
		url:"${ctx}/backContract",
		data:"serId="+id,
		dataType:'text',
		success:function(data){
			if(data == 'ok'){
				parent.showMess("操作成功！");
				setTimeout(function(){
					location.href='${ctx}/ws/environment/servicelist';
				},3000);
			}else{
				parent.showMess(data);
			}
		}
	});
}
</script>
</body>
</html>
