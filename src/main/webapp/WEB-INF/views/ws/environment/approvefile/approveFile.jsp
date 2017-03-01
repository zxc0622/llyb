<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>环保公司-危废服务-审批材料</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>固废供应</div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li>
                    <div class="txt">审核资料并报价</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">上传合同及资料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">确认管理计划表</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">审批材料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">安排收运</div>
                    <div class="triangle"></div>
                </li>
                <c:choose>
                <c:when test="${approveFile < 4}">
                <select style="margin-top:10px;height: 30px;text-indent:0;background:#E5E5E5;" class="fl" name="back" id="back" onChange="stepBack()">
                    <option value="0">请选择退回</option>
                    <option value="1">基本列表</option>
                    <option value="2">查阅合同</option>
                    <option value="3">上传管理计划</option>
                    <option value="4">邮寄材料</option>
                </select>
                </c:when>
                <c:otherwise>
                <a style="width:90px;margin-top:10px;" class="btn fl" href="javascript:confirmDel();">作废</a>
                </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="jindu_steps">
        <input id="ep_id" type="hidden" value="${id}">
        <input id="service_id" type="hidden" value="${serviceId}">
            <div class="one-step ">
                <div class="steps_circle">
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con">
                        甲方已邮寄材料
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle">
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con">
                        甲方所有资料已确认无误,可进行办理
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle" >
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con" style="width:178px; cursor:pointer;">
                        我已收到邮寄材料
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle" >
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con" style="width:178px; cursor:pointer;">
                        确认管理计划表完整无误
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle" >
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con" style="width:178px; cursor:pointer;">
                      已上呈环保部门审批办理
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle" >
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con" style="width:178px; cursor:pointer;">
                        已完成办理并邮寄
                    </div>
                </div>
            </div>
            <!--  <div class="btns">
            	<a href="javascript:void(0)" class="btn btn-connot" style="margin-left:-100px">下一步</a>
        	</div> -->
        </div>
        
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
	var approveSta = "${approveFile}";	
    $(document).ready(function(){
    	if(approveSta>=0){
    		//$(".one-step").eq(0).click(function(){approve(1);});
    	}
    	if(approveSta>=1){
    		$(".one-step").eq(0).addClass("one-step-hasdone");
    		$(".one-step").eq(0).find(".steps_circle").html("<div class='steps_line'></div>");
    		$(".one-step").eq(0).unbind();
    		$(".one-step").eq(1).removeClass("one-step-hasnotdone");
    		$(".one-step").eq(2).click(function(){approve(2);});
    	}
		if(approveSta>=4){
			$(".one-step").eq(1).addClass("one-step-hasdone");
    		$(".one-step").eq(1).removeClass("one-step-hasnotdone");
    		$(".one-step").eq(4).click(function(){approve(5);});
    	}
		if(approveSta>=2){
    		$(".one-step").eq(2).addClass("one-step-hasdone");
    		$(".one-step").eq(2).unbind();
    		$(".one-step").eq(3).click(function(){approve(3);});
    	}
		if(approveSta>=3){
   		 	$(".one-step").eq(3).addClass("one-step-hasdone");
   		 	$(".one-step").eq(3).unbind();
   		}
		if(approveSta>=5){
    		$(".one-step").eq(4).addClass("one-step-hasdone");
    		$(".one-step").eq(4).unbind();
    		$(".one-step").eq(5).click(function(){approve(6);});
    	}
		if(approveSta>=6){
			$(".one-step").eq(4).unbind();
			$(".one-step").eq(5).addClass("one-step-hasdone");
    	}
		
    });
    /*材料已收到*/
    function approve(status){
    	$.ajax({
    		type:"post",
    		url:"${ctx}/ws/environment/approvefile/approve",
    		data:"id="+$("#ep_id").val()+"&serviceId="+$("#service_id").val()+"&approveSta="+status,
    		async:false,
    		success:function(data){
    				if(approveSta==5 || approveSta==6){//第五步ok或者是第六步ok
    					//$(".btns a").removeClass("btn-connot");
    					$(".one-step").eq(5	).addClass("one-step-hasdone");
    					if(data=="${EP_STEP}"){
		   					//$(".btns a").click(function(){next();});
		   					goUrl("${ctx}/ws/environment/confirmplan/arrangeCt?id="+$("#service_id").val());
    					}else{
    	    				parent.showMess("请等待对方通知收运");
    	    			}
    				}else{
    					if(data=="no_send_scanfile"){
    						parent.showMess("请等待对方发送扫描文件");
    					}
    					goUrl("${ctx}/ws/environment/approvefile?id="+$("#service_id").val());	
    				}
    		}
    	});
    }
    $(function(){
    	if(approveSta==5){
    		
    		//$(".btns a").click(function(){next();})
    	}
    });
   /*  function next(){
    	$.ajax({
    		type:"post",
    		url:"${ctx}/ws/environment/approvefile/next",
    		data:"serviceId="+$("#service_id").val(),
    		success:function(data){
    			if(data!=false){
    				if(data=="${EP_STEP}"){
    		    		$(".btns a").removeClass("btn-connot");
    					goUrl("${ctx}/ws/environment/confirmplan/arrangeCt?id="+$("#service_id").val());
    				}else{
    					parent.showMess("请等待对方通知收运");
    				}
    			}
    		}
    	})
    } */
  //返回指定页面
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
		case 3:
			backManPlan();//返回上传管理计划
			break;
		case 4:
			backPost();//返回邮寄材料
			break;
		default:
			break;
		}
	}
	
	function backBaseInfo(){
		$.ajax({
			type:"POST",
			url:"${ctx}/backBaseInfo",
			data:"serId="+$("#service_id").val(),
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
			data:"serId="+$("#service_id").val(),
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
	function backManPlan(){
		$.ajax({
			type:"POST",
			url:"${ctx}/backManPlan",
			data:"serId="+$("#service_id").val(),
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
	function backPost(){
		$.ajax({
			type:"POST",
			url:"${ctx}/backPost",
			data:"serId="+$("#service_id").val(),
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
	//作废
	function confirmDel(){
		parent.showMessYes("确定作废？");
		$(".yes-btn", window.parent.document).unbind().one("click",successPlay);
	}
	function successPlay(){
		parent.hideMessYes();
		$.ajax({
			type:"POST",
			url:"${ctx}/ws/environment/confirmplan/del",
			data:"id="+$("#service_id").val(),
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