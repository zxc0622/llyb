<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>产废方-审批办理中</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_p{color:#666;margin-left: 25px;margin-top:20px;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务
    <a class="gobackto_wffw" href="javascript:goUrl('${ctx}/ws/productwaste/pwbaseinfo/serviceMainIndexPage')">返回危废服务页面</a>
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
                <li class="wf_t_sel">
                    <div class="txt">审批办理中</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">通知收运</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <p class="this_page_p">所需资料已齐备，请耐心等待申报手续办理。</p>
        <div class="jindu_steps">
        <input id="pw_id" type="hidden" value="${id}">
        <input id="service_id" type="hidden" value="${serviceId}">
            <div class="one-step">
                <div class="steps_circle">
                
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con">
                        环保部门审批办理中
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle">
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div class="s_t_con">
                        审批已完成，审批表已寄出
                    </div>
                </div>
            </div>
            <div class="one-step one-step-hasnotdone">
                <div class="steps_circle">
                </div>
                <div class="step_text">
                    <div class="little_tri"></div>
                    <div id="receive_file" class="s_t_con"  style="width:178px; cursor:pointer;">
                        材料已收到
                    </div><span style="color:#aaa;">若收到审批表，请点击此处</span>
                </div>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
	$(document).ready(function(){
		var approveSta = '${approveFile}';
		if(approveSta>=1){
			$(".one-step").eq(0).addClass("one-step-hasdone");
			$(".one-step").eq(0).find(".steps_circle").html("<div class='steps_line'></div>");
			$(".one-step").eq(1).removeClass("one-step-hasnotdone");
		}
		if(approveSta>=2){
			$(".one-step").eq(1).addClass("one-step-hasdone");
			//$(".one-step").eq(1).find(".steps_circle").html("<div class='steps_line'></div>");
			//$(".one-step").eq(2).removeClass("one-step-hasnotdone");
			$("#receive_file").click(function(){receiveFile();});
		}
		if(approveSta==3){
			//$(".one-step").eq(1).find(".steps_circle").html("<div class='steps_line'></div>");
			$(".one-step").eq(2).addClass("one-step-hasdone");
		}
	});
	//收到材料
	function receiveFile(){
		$.ajax({
			type:"post",
			url:"${ctx}/ws/productwaste/auditing/receiveFile",
			data:"id="+$("#pw_id").val()+"&serviceId="+$("#service_id").val(),
			async:false,
			success:function(data){
				if(data==true){
					$(".one-step").eq(1).find(".steps_circle").html("<div class='steps_line'></div>");
					$(".one-step").eq(2).addClass("one-step-hasdone");
					//跳转到通知收运
					goUrl("${ctx}/ws/productwaste/manaplan/notice?id="+$("#service_id").val());
				}else{
					parent.showMess("请勿重复操作！");
				}
			}
		})
	}
</script>
</body>
</html>