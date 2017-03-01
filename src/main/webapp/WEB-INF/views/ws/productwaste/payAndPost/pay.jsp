<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>产废方-支付并备案</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css"> 
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_p{color:#666;text-align: center;margin:20px 0;}
.cff_zhifubingbeian .row>.btn{width:255px;}
.cff_zhifubingbeian .row{position: relative;}
.row .check_right{top:calc(50% - 8px);left:290px;}
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
                <li class="wf_t_sel">
                    <div class="txt">支付并备案</div>
                    <div class="triangle"></div>
                </li>
                <li >
                    <div class="txt">审批办理中</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">通知收运</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <p class="this_page_p">支付合同费用，并按提示完成《管理计划表》的备案及发送。</p>
        <div class="cff_zhifubingbeian">
            <div class="row">
                <a class="btn">去支付</a>
                <div class="check_right"></div>
            </div>
            <div class="row">
                <div class="cff_zfbba_div">
                    <div class="btn btn-connot">
                        <img src="${ctxStatic}/img/llhb/cff_zfbba_01.png" alt="">
                        打印
                    </div>
                    <p>
                        打印一式2份，第一页（函）签名后在名字上
                        盖章，第二页单位名称上盖章
                    </p>
                </div>
                <div class="check_right"></div>
            </div>
            <div class="row">
                <div class="cff_zfbba_div">
                    <div class="btn btn-connot">
                        <img src="${ctxStatic}/img/llhb/cff_zfbba_02.png" alt="">
                        备案
                    </div>
                    <p>送至所属辖区环保分局进行备案</p>
                </div>
                <div class="check_right"></div>
            </div>
            <div class="row">
                <div class="cff_zfbba_div">
                    <div class="btn" style="cursor: pointer" id="scan">

                        扫描发送
                    </div>
                    <p>
                        《管理计划表》备案通过后，整份扫描发送
                        给乙方
                        <a href="javascript:void(0)"style="display:block;margin-left:111px;width:26px;"><img onclick="fasong();" src="${ctxStatic}/img/llhb/cff_zfbba_03.png" alt="" ></a>
                    </p>
                </div>
                <div class="check_right" id="scanch"  disabled></div>
            </div>
            <p class="this_page_p">以上步骤均需完成才可进行确认</p>
            <div class="btns">
                <a href="javascript:void(0)"class="btn btn-connot" id="confirm_btn">确认</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
     $(function(){
         if('${scansta}'==1){
             $("#scanch").addClass("check_right_sel");
         }
        $(".check_right").not("#scanch").mousedown(function(){
        	if($(this).hasClass('check_right_sel')){
        		$(this).removeClass('check_right_sel')
        	}else{
        		$(this).addClass('check_right_sel');
        	}

            //判断是否四个全部选中
            var checkedSize = $(".check_right_sel").length;
            if(checkedSize == 4&&('${oriSta}'==3)){
                $("#confirm_btn").removeClass("btn-connot");
            }else{
                $("#confirm_btn").addClass("btn-connot");
            }
           
        });
        $(".btns a").click(function(){

            //判断是否四个全部选中
            var checkedSize = $(".check_right_sel").length;
            if(checkedSize!=4){
                return;
            }
            if('${oriSta}'!=3){
                return;
            }
        	for (var i=0;i<4;i++){
        		var a = $(".check_right").eq(i).hasClass("check_right_sel");
        		if(a==false){
        			parent.showMess("以上步骤均需完成才可进行确认");
        			return;
        		}
        	}
        	
        	parent.showMessYes("所有资料已确认无误，确认后乙方进行处理");
        	$(".yes-btn", window.parent.document).unbind().one("click",function(){
        		$(".pl_yesorno", window.parent.document).hide();
	        	$.ajax({
	   				type : "POST",
	 				url : "${ctx}/ws/productwaste/payAndPost/sure",
	 				data : "id=${id}&pay_sta="+1+"&print_sta="+1+"&file_sta="+1,
	 				dataType : 'text',
	 				success : function(data) { 
	 					if(data != "ok"){
	 						parent.showMess(data);

	 					}else{
	 						$(".btns a").html("已确认");
	 						 $("#confirm_btn").addClass("btn-connot");
	 						parent.showMess("支付备案成功");
		 	            	setTimeout(function(){
		 	            		$(".popumask", window.parent.document).hide();
		 	            		$(".pl_normal", window.parent.document).hide();
		 	            		//location.href = '${ctx}/ws/productwaste/auditing?id=${id}';
		 	            	},2000);
	 					}
	 					
	 				}
	 			}); 
         });
       });

         //扫描发送
         $("#scan").click(fasong);
     });
    function  fasong(){
        location.href = "${ctx}/memSerevice/message?serviceId=${id}&uid=${sendname}&source=scan";//跳转到站内信 站内信自动添加用户名
    }
</script>
</body>
</html>