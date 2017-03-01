<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>产废方-通知收运</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
<style>
/*本页面style*/
.tab_main{padding-bottom: 10px;}
.this_page_p{color:#666;margin-left: 25px;margin-top:20px;}
#phone{width: 110px;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务
    <a class="gobackto_wffw" href="${ctx }/ws/productwaste/pwbaseinfo/serviceMainIndexPage">返回危废服务页面</a>
    </div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li >
                    <div class="txt">基本列表</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">查阅合同</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">管理计划表</div>
                    <div class="triangle"></div>
                </li>
                <li >
                    <div class="txt">邮寄资料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">支付并备案</div>
                    <div class="triangle"></div>
                </li>
                <li >
                    <div class="txt">审批办理中</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">通知收运</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <p class="this_page_p">请填写以下资料，乙方将在24小时内安排客服与你联系</p>
        <div class="cff_tongzhishouyun">
            <ul class="">
                <li>拟收运日期</li>
                <li>联系人</li>
                <li>联系电话</li>
            </ul>
            <div class="row">
            	<input id="time" type="text" readonly style="width:100px;" value="${s.date }"/>
                <input id="person" type="text" value="${s.person }"/>
                <input id="phone" type="text" value="${s.phone }"/>
            </div>
            <c:choose>
          		<c:when test="${s.enotice eq '1' }">
          			<a id="noti" data-index="1" href="javascript:void(0);" class=" btn btn-connot" style="width:320px;">通知收运危废</a>
          		</c:when>
          		<c:otherwise>
          			<a href="javascript:upNotice();" class=" btn" style="width:320px;">通知收运危废</a>
          		</c:otherwise>
          	</c:choose>
            <span class="fr tiqian">请至少提前三天</span>
        </div>
        <div class="cff_tongzhishouyun_pinjia">
            <div class="check_eva">
                <ul>
                	<c:choose>
                		<c:when test="${s.appraise eq '5' }">
                			<div class="check_right check_right_sel"></div>
                		</c:when>
                		<c:otherwise>
                			<div class="check_right"></div>
                		</c:otherwise>
                	</c:choose>
                    <li style="margin-top:2px;" value="5">好评</li>
                    <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"></li>
                </ul>
                <ul>
                <c:choose>
                		<c:when test="${s.appraise eq '3' }">
                			<div class="check_right check_right_sel"></div>
                		</c:when>
                		<c:otherwise>
                			<div class="check_right"></div>
                		</c:otherwise>
                	</c:choose>
                    <li style="margin-top:2px;" value="3">中评</li>
                    <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></li>
                </ul>
                <ul>
                    <c:choose>
                		<c:when test="${s.appraise eq '1' }">
                			<div class="check_right check_right_sel"></div>
                		</c:when>
                		<c:otherwise>
                			<div class="check_right"></div>
                		</c:otherwise>
                	</c:choose>
                    <li style="margin-top:2px;" value="1">差评</li>
                    <li><img src="${ctxStatic}/img/llhb/star_1.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"><img src="${ctxStatic}/img/llhb/star_2.png"></li>
                </ul>
            </div>
            <div class="btns">
            	<c:choose>
               		<c:when test="${empty s.appraise || s.appraise eq ''}">
               			<a href="javascript:appraise();" class="btn btn-connot">提交评价</a>
               		</c:when>
               		<c:otherwise>
               			<a href="javascript:appraise();" class="btn">提交评价</a>
               		</c:otherwise>
               	</c:choose>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script>
	var id = '${s.id}';
	$(function (){
		$("#time").manhuaDate({					       
			Event : "click",//可选				       
			Left : 0,//弹出时间停靠的左边位置
			Top : -16,//弹出时间停靠的顶部边位置
			fuhao : "-",//日期连接符默认为-
			isTime : false,//是否开启时间值默认为false
			beginY : 1949,//年份的开始默认为1949
			endY :2100//年份的结束默认为2049
		});
	});
	$(document).ready(function(){
		$("#phone").keyup(function(){      
	        $(this).val($(this).val().replace(/[^0-9][^\d-]/g,''));      
	    }).bind("paste",function(){    
	        $(this).val($(this).val().replace(/[^0-9][^\d-]/g,''));       
	    }).css("ime-mode", "disabled"); 
        $(".check_right").on("click",function() {
        	$(".check_right_sel").removeClass('check_right_sel');
            $(this).addClass('check_right_sel');
        	$(".btns a").removeClass("btn-connot");
        });  
	});

	function upNotice(){
		var time = $("#time").val();
		var person = $("#person").val();
		var phone = $("#phone").val();
		if(time.length <=0){
			parent.showMess("请填写日期");
			return ;
		}else if(timeCheck() == false){
			parent.showMess("日期请至少提前三天！");
			return ;
		}		
		if($.trim(person).length<=0 || $.trim(person).length>20){
			parent.showMess("请填写联系人");
			return ;
		}
		if(checkPhone(phone) == false){
			return ;
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/ws/productwaste/manaplan/upNotice",
			data:"time="+time+"&person="+person+"&phone="+phone+"&id="+id,
			dataType:'text',
			success:function(data){
				parent.showMess(data);
			}
		}); 
	}
	//验证时间
	function timeCheck(){
		var time = $("#time").val();
		var t = false;
		if(time != "" ){
			var today=new Date();
			today.setDate(today.getDate()+3);
			var times=time.split('-');
			if(times[0]<today.getFullYear()){}
			else if(times[0]==today.getFullYear() && times[1]<(today.getMonth()+1)){}
			else if(times[0]==today.getFullYear() && times[1]==(today.getMonth()+1) && times[2]<today.getDate()){}else{
				t = true;
			}
		}
		return t ;
	}
	//验证手机号
	function checkPhone(p){
		if(p == ""){
			parent.showMess("请填写联系方式！");
			return false;
		}
		var tel=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/; 
		var phone=/^1[3|5|4|8][0-9]\d{8}$/;
		if(phone.test(p)){
			return true;
		}
		if(tel.test(p)){
			return true;
		}else{
			parent.showMess("请填写正确的联系方式！");
			return false;
		}
	}
	//评价
	function appraise(){
		var appraise = $(".check_right_sel").next().val();
		if( appraise != "" && appraise != undefined){
			$.ajax({
				type:"POST",
				url:"${ctx}/ws/productwaste/manaplan/appraise",
				data:"appraise="+appraise+"&id="+id,
				dataType:'text',
				success:function(data){
					parent.showMess(data);
				}
			});
		}else{
			parent.showMess("请选择评价！");
		}
	}
</script>
</body>
</html>
