<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <!-- <link rel="shortcut icon" href=""/>  -->
        <title>个企用户首页</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        
        <link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
        <link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
            
            /*系统消息sys_m*/
            .main_right .sys_message{width:480px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-bottom: 15px;}
            .sys_message .sysm_top,.sys_message .sysm_bottom{padding:15px;background-color: #FFFDEE;}
            .sys_message .sysm_top{border-bottom: 1px dashed #cccccc;}
            .sys_message .sysm_bottom{height:107px;}
            .sys_message p a{color:#ee7800;margin-left: 5px;}
            .sys_message .sysm_wanshan,.sys_message .sysm_newm{color:#5EC520;}
            
            /*快捷方式 quickway*/
            .main_right .quickway{width:260px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-left: 10px;margin-bottom: 15px;}
            .quickw_main{padding:0 30px;background-color: #F7F8F8;overflow: hidden;height:200px;}
            .quickw_main ul{overflow: hidden;}
            .quickw_main ul li{float:left;width:60px;height:80px;}
            .quickw_main ul li:nth-child(1){margin-left: 20px;margin-top:15px;}
            .quickw_main ul li:nth-child(2){margin-left: 35px;margin-top:15px;}
            .quickw_main ul li:nth-child(3){margin-left: 20px;margin-top:5px;}
            .quickw_main ul li:nth-child(4){margin-left: 35px;margin-top:5px;}
			.ie8 .quickw_main ul li{margin-left:25px; margin-top:10px;}
            .quickw_main ul li a{width:100%;height:100%;display: block}
            .quickw_main ul li a div{width:100%;height:60px;}
            .quickw_main ul li a .qw_m_qiugou{background:url(${ctxStatic}/img/llhb/icons.png) -65px -4px no-repeat;}
            .quickw_main ul li a .qw_m_gongying{background:url(${ctxStatic}/img/llhb/icons.png) -132px -4px no-repeat;}
            .quickw_main ul li a .qw_m_ziliao{background:url(${ctxStatic}/img/llhb/icons.png) -65px -71px no-repeat;}
            .quickw_main ul li a .qw_m_guanli{background:url(${ctxStatic}/img/llhb/icons.png) -132px -71px no-repeat;}
            .quickw_main ul li a p{line-height: 20px;text-align: center;}

            /*我的需求*/
            .main_right .my_need{clear:both;width:752px;height:250px;border:1px solid #cccccc;overflow: hidden;}
            .my_need_main .bid_top{height:100px;line-height: 100px;text-align: center;}
             .my_need_main .bid_top span{color: #EE7800;font-size:20px;position: relative;top: 2px;margin-left: 5px;}
             .my_need_main .bid_top img{margin-bottom: 2px;}
             .my_need_main .bid_left,.my_need_main .bid_right{width: 38%;float: left;padding: 0 6%;}
             .my_need_main .bid_left p:first-child,.my_need_main .bid_right p:first-child{line-height: 2;color: #666666;}
             .my_need_main .bid_btn{height: 30px;width: 70%;background: #5EC520;color: #FFFFFF;line-height: 30px;text-align:center;margin-top: 10px;cursor: pointer;}
             /*任务*/
            .my_task{clear:both;height: 40px;border: solid 1px #CCCCCC;width: 752px;margin-top: 15px;}
            .my_task .t_right,  .my_task .t_left{float: left;}
            .my_task .t_right{background: #5EC520;padding: 0px 15px;cursor: pointer;}
            .my_task .t_right span{color: #FFFFFF;padding: 0px 5px;position: relative;top: 2px;}
            .my_task .t_left p{line-height: 40px;margin-left: 20px;}
            .my_task .t_left p span{color: #EE7800;}
            

            /*求购和供应*/
            .main .purchase_supply{width:480px;height:240px;float:left;border:1px solid #cccccc;overflow: hidden;margin-top:15px;}
            .purchase_supply .purc_main{padding:0 20px;overflow: hidden;}
            .purc_main .purs_m_t{margin-top: 15px;overflow: hidden;}
            .purc_main .purs_m_t span{float:left;font-size: 14px;color:#5EC520;}
            .purc_main .purs_m_t a{float:right;height:100%;width:60px;text-align: center;background-color: #ee7800;color:#fff;}
            .purchase_supply .supp_main{padding:0 20px;overflow: hidden;display: none;}
            .supp_main .purs_m_t{margin-top: 15px;overflow: hidden;}
            .supp_main .purs_m_t span{float:left;font-size: 14px;color:#5EC520;}
            .supp_main .purs_m_t a{float:right;height:100%;width:60px;text-align: center;background-color: #ee7800;color:#fff;}
                
            /*历史记录*/
            .main_right .his_records{width:260px;height:240px;float:left;border:1px solid #cccccc;overflow: hidden;margin-left: 10px;margin-top: 15px;}
            .his_records .hisr_qiugou_main{padding:0 20px;overflow: hidden;}
            .his_records .hisr_gongying_main{padding:0 20px;overflow: hidden;display: none;}

            /*论坛*/
            .main_right .forum{width:480px;height:250px;float:left;border:1px solid #cccccc;overflow: hidden;margin-top:15px;margin-bottom: 100px;}
            .forum .forum_main{padding:0 20px;overflow: hidden}

            /*积分兑换奖品*/
            .main_right .exc_points{width:260px;height:250px;float:left;border:1px solid #cccccc;overflow: hidden;margin-left: 10px;margin-top: 15px;}
            .exc_points .excp_mian{padding:0 20px;overflow: hidden;}
            .excp_mian .excp_m_box{float:left;margin-top:12px;width:90px;height:90px;overflow: hidden;position: relative;}
            .excp_mian .excp_m_box:nth-child(odd){margin-left:8px;}
            .excp_mian .excp_m_box:nth-child(even){margin-left: 20px;}
            .excp_m_box .e_m_b_img{width:100%;height:70px;}
            .excp_m_box .e_m_b_img img{width:100%;height:100%;}
            .excp_m_box .e_m_b_mask{width:100%;height:50px;background-color:rgba(0,0,0,0.5);position: absolute;top:0;left:0;display: none;padding-top: 20px;}
            .excp_m_box .e_m_b_mask p{color:#fff;text-align: center;}
            .excp_mian .excp_m_box:hover .e_m_b_mask{display: block;}
            .excp_mian .excp_m_box:hover>p{color:#ee7800;}
            .excp_mian .excp_m_box>p{text-align: center;height:20px;line-height: 20px;background-color: #EFEFEF;}
            
            /*main_right结束*/
            /*main结束*/
        </style>
    </head>
    <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>用户首页</div>
                <div class="sys_message font_1">
                    <div class="m_r_title"><span class="m_r_tname">系统消息</span></div>
                    <div class="sysm_top">
                        <p>尊敬的<span><shiro:principal property="loginName"/></span>您好!欢迎登录优蚁网商务中心!</p>
                        <c:if test="${dc != '100' }">
                        	<p class="sysm_wanshan">请完善您的个人信息,否则无法使用优蚁网为您提供的相关服务<a href="${ctx }/home?str=/perinfo" target="_parent">[请完善信息]</a></p>
                        </c:if>
                    </div>
                    <div class="sysm_bottom">
                    	<p class="sysm_newm" style="display:none;">您最近有<span id="mess" name="mess"></span>条新信息!<a href="${ctx }/home?str=/memSerevice/message/mailbox?index=2"  target="_parent">[去查看]</a></p>
                    	<p class="sysm_newm" style="display:none;">您最近有<span id="chat" name="chat"></span>条新对话!<a href="${ctx }/home?str=/memSerevice/communication" target="_parent">[去查看]</a></p>
                    	<c:if test="${os eq 0 }">
                    		<p class="sysm_fabu">您还未发布供应信息,客户无法找到您<a href="${ctx }/home?str=/solidsupply/solidAdd" target="_parent">[立即发布]</a></span></p>
                    	</c:if>
                        <p class="sysm_dingyue">您还未订阅信息,无法接收到我们为您提供的服务<a href="javascript:void(0)" onclick="">[立即订阅]</a></p>
                    </div>
                </div>
                <div class="quickway font_1">
                    <div class="m_r_title"><span class="m_r_tname">快捷方式</span></div>
                    <div class="quickw_main">
                        <ul>
                            <li><a href="${ctx }/home?str=/qiugou" target="_parent">
                                    <div class="qw_m_qiugou"></div>
                                    <p>发布需求</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/solidsupply/solidAdd" target="_parent">
                                    <div class="qw_m_gongying"></div>
                                    <p>发布产品</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/perinfo" target="_parent">
                                    <div class="qw_m_ziliao"></div>
                                    <p>会员资料</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit" target="_parent">
                                    <div class="qw_m_guanli"></div>
                                    <p>云铺管理</p>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <div class="my_need">
                    <div class="m_r_title"><span class="m_r_tname">我的环保需求</span></div>
                    <div class="my_need_main">
                    		<div class="bid_top">
                    			<img src="${ctxStatic}/img/llhb/icon3.png"/>
                    			<span>您还没有绑定需求哦~</span>
                    		</div>
                    		<div class="bid_left">
                    			<p class="font_1">如果您在没有登录的状态下发布环保需求，可以通过下面的按钮自助找回</p>
                    			<p class="bid_btn">找回已发布环保需求</p>
                    		</div>
                    		<div class="bid_right">
                    			<p class="font_1">如果您从未发布环保需求，也可以现在发布，免费获得3家公司提供的报价方案服务</p>
                    			<p class="bid_btn">免费发布环保需求</p>
                    		</div>
                    </div>
                </div>
                <div class="my_task">
                	<div class="t_right">
                		<img src="${ctxStatic}/img/llhb/my_task.png"/>
                		<span>任务</span>
                	</div>
                	<div class="t_left">
                		<p>您还可以做<span>38</span>个任务，可获<span>2314</span>积分，赶紧去完成吧！</p>
                	</div>
                </div>
                <div class="purchase_supply font_1">
                    <div class="m_r_title"><span class="m_r_tname">求购</span><span>供应</span>
                    <a class="font_1" href="${ctx}/qiugou/searchList"  target="_black">更多 ></a></div>
                    <div class="purc_main">
                        <div class="purs_m_t"><span>最新求购</span><a href="${ctx }/home?str=/qiugou" target="_parent">我要求购</a>
                        </div>
                        <ul class="m_r_ul">
                        	<c:forEach items="${nd }" var="nd">
                        		<li>
	                                <a href="javascript:goDDetail(${nd.id })" class="m_r_ul_a tmui-ellipsis">${nd.title }</a>
	                                <span class="m_r_ul_span">${fn:substring(nd.time,5,10) }</span>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="supp_main">
                        <div class="purs_m_t"><span>最新供应</span><a href="${ctx }/home?str=/solidsupply/solidAdd" target="_parent">我要供应</a>
                        </div>
                        <ul class="m_r_ul">
                        	<c:forEach items="${ns }" var="ns">
                        		<li>
	                                <a href="javascript:goSDetail(${ns.id })" class="m_r_ul_a tmui-ellipsis">${ns.title }</a>
	                                <span class="m_r_ul_span">${fn:substring(ns.time,5,10) }</span>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="his_records font_1">
                     <div class="m_r_title"><span class="m_r_tname">历史记录</span><!-- <a class="font_1" href="javascript:void(0);" target="_black">更多 ></a> -->
                     <span class="change font_1"><a href="javascript:void(0)">>供应</a><a href="javascript:void(0)">>求购</a></span>
                     </div>
                     <div class="hisr_qiugou_main">
                         <ul class="m_r_ul">
	                         <c:forEach items="${dvh }"  var="dvh">
	                         		<li>
	                                    <a href="javascript:goDDetail(${dvh.id })" class="m_r_ul_a tmui-ellipsis">${dvh.title }</a>
	                                </li>
	                         	</c:forEach>
                         </ul>
                     </div>
                     <div class="hisr_gongying_main">
                        <ul class="m_r_ul">
                        	<c:forEach items="${svh }"  var="svh">
                         		<li>
                                    <a href="javascript:goSDetail(${svh.id })" class="m_r_ul_a tmui-ellipsis">${svh.title }</a>
                                </li>
                         	</c:forEach> 	
                        </ul>
                     </div>
                </div>
                <!-- <div class="forum font_1" style="display:none;">
                    <div class="m_r_title"><span class="m_r_tname">论坛</span><a class="font_1" href="javascript:void(0)">更多 ></a></div>
                    <div class="forum_main">
                        <ul class="m_r_ul">
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:1000</span>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:1000</span>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:1000</span>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:10</span>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:1000</span>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="m_r_ul_a tmui-ellipsis">供应库存微型小汽车</a>
                                <span class="m_r_ul_span">08.17</span><span class="m_r_ul_rspan">回复:1000</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="exc_points font_1" style="display:none;">
                    <div class="m_r_title"><span class="m_r_tname">积分兑换奖品</span><a class="font_1" href="javascript:void(0)">更多 ></a></div>
                    <div class="excp_mian">
                        <div class="excp_m_box">
                            <div class="e_m_b_img">
                                <img src="${ctxStatic}/img/llhb/e_m_b_img.png" alt="">
                            </div>
                            <div class="e_m_b_mask">
                                <p>个性手机壳</p>
                                <p>1088积分</p>
                            </div>
                            <p class="e_m_b_duihuan">立即兑换</p>
                        </div>
                        <div class="excp_m_box">
                            <div class="e_m_b_img">
                                <img src="${ctxStatic}/img/llhb/e_m_b_img1.png" alt="">
                            </div>
                            <div class="e_m_b_mask">
                                <p>个性手机壳</p>
                                <p>1088积分</p>
                            </div>
                            <p class="e_m_b_duihuan">立即兑换</p>
                        </div>
                        <div class="excp_m_box">
                            <div class="e_m_b_img">
                                <img src="${ctxStatic}/img/llhb/e_m_b_img1.png" alt="">
                            </div>
                            <div class="e_m_b_mask">
                                <p>个性手机壳</p>
                                <p>1088积分</p>
                            </div>
                            <p class="e_m_b_duihuan">立即兑换</p>
                        </div>
                        <div class="excp_m_box">
                            <div class="e_m_b_img">
                                <img src="${ctxStatic}/img/llhb/e_m_b_img.png" alt="">
                            </div>
                            <div class="e_m_b_mask">
                                <p>个性手机壳</p>
                                <p>1088积分</p>
                            </div>
                            <p class="e_m_b_duihuan">立即兑换</p>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- 右侧结束 -->
        </div>
        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript">
            $(function(){
                //求购 供应切换
                $(".purchase_supply .m_r_title span").on("click",function(){
                    $(this).addClass("m_r_tname").siblings().removeClass("m_r_tname");
                    var index=$(this).index();
                    if(index==0){
                        $(".purc_main").show().next().hide();
                    }else{
                        $(".supp_main").show().prev().hide();
                    }
                });
            });
            $(document).ready(function(){
            	notRead();
                //历史记录
               // $(".his_records .m_r_title>a").on("mouseover",function(){
               //     $(".his_records .m_r_title .change").show();
               // })
               // $(".his_records .m_r_title .change").on("mouseleave",function(){
               //     $(this).hide();
              //  });
                $(".his_records .m_r_title .change").show();
                $(".his_records .m_r_title .change a").click(function(){
                    if($(this).index()==1){
                        $(".hisr_qiugou_main").show();
                        $(".hisr_gongying_main").hide();
                    }else{
                        $(".hisr_gongying_main").show();
                        $(".hisr_qiugou_main").hide();
                    }
                });
            });
			function goSDetail(id){
				window.open("${ctx}/solidsupply/getMess/"+id, "_blank");
			}
			function goDDetail(id){
				window.open("${ctx}/qiugou/details?id="+id, "_blank");
			}
			//未读消息对话
			function notRead(){
				var mess = parseInt($(".headtop a", window.parent.document).eq(0).find("span").html());
				var chat = parseInt($(".headtop a", window.parent.document).eq(1).find("span").html());
				if(mess > 0){
					$("#mess").html(mess).parent().show();
				}
				if(chat > 0){
					$("#chat").html(chat).parent().show();
				}
			} 
			
        </script>
    </body>
</html>