<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>产废方-邮寄资料</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_p{color:#666;margin-left: 25px;margin-top:20px;}
.this_page_div{margin-left: 25px;margin-top:20px;}
.this_page_div p{font-size: 12px;}

.round_point{height:18px;width:18px;float:left;background:url(${ctxStatic}/img/llhb/step_circle_03.png) 0 0 no-repeat;margin:6px 20px;}
.round_p_sel{background: url(${ctxStatic}/img/llhb/step_circle_act_03.png) 0 0 no-repeat;}
.row1{padding-left: 58px;margin-top: 20px;}
.row2 .show-info{width:120px;float:left;padding:4px 0;}

.tab_main{height: 778px;}
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
                <li class="wf_t_sel">
                    <div class="txt">邮寄资料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">支付并备案</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">审批办理中</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">通知收运</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <p class="this_page_p">按以下要求打印申报资料，盖章后邮寄给乙方。</p>
        <div class="this_page_div">
            <span>需要提供的申报资料及份数：</span>
            <p>1、《合同》(协议)一式4份，第4、5、6页贵司名称上盖章</p>
            <p>2、《审批表》、《转移计划表》各一式4份，左上角贵司名称上盖章。</p>
            <p>3、委托书1份，单位名称上盖章。</p>
            <p style="color: #f00;">邮寄地址：东莞市南城区天安数码城B2栋702，收件人：黄先生，电话13798923263</p>
        </div>
        <div class="row row1">
            <a href="javascript:void(0)"class="fl btn">资料已邮寄</a><span  style="line-height:30px;color:red;margin-left:11px">若资料已寄出，请点击</span>
        </div>
         <div class="row row2">
            <div class="round_point "></div>
            <div class="show-info">对方未收到资料</div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
     var a = '${pw.post_materials}';
     if(a == 2){
    	
     } else{
    	 $(".round_point").addClass("round_p_sel");
     }
    $(".btn").click(function (){
    	 $.ajax({
 			type : "POST",
 			url : "${ctx}/ws/productwaste/payAndPost/posted",
 			data:"id="+'${id}',
 			dataType : 'text',
 			success : function(data) { 
 				if(data != "ok"){
 					parent.showMess(data);

				}else{
					parent.showMess("邮寄成功");
	            	setTimeout(function(){
	            		$(".popumask", window.parent.document).hide();
	            		$(".pl_normal", window.parent.document).hide();
	            		//location.href = '${ctx}/ws/productwaste/payAndPost/pay?id=${id}';
	            	},2000);
				}
 				
 			}
 		});
     }); 
    
</script>
</body>
</html>