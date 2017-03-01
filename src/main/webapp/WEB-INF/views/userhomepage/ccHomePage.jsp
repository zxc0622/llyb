<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <title>产处用户首页</title>
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

            /*竞价流程*/
            .main_right .biddingprocess{clear:both;width:752px;height:200px;border:1px solid #cccccc;overflow: hidden;}
            .biddingp_main .tri_text{padding:3px 5px;color:#fff;background:#5ec520;}
            .biddingprocess .biddingp_main{padding:20px;}
            .ie8 .biddingprocess .biddingp_main{padding:20px;padding-right:13px;}
            .biddingp_main ul li{margin:17px 0;}
            .tri-r{height:0;width:0;border:transparent solid 14px;border-left-color: #5ec520;}
            .tri-l{height:0;width:0;border:transparent solid 14px;border-right-color: #5ec520;}
            
            /* .biddingprocess .biddingp_main{padding:20px;}
            .biddingprocess .biddingp_main ul{overflow: hidden;}
            .biddingp_main ul li{float:left;width:110px;height:40px;margin-right:13px;padding-right: 20px;line-height: 40px;text-align: right;background:url(${ctxStatic}/img/llhb/bidding.png) no-repeat;cursor:pointer;}
            .biddingp_main ul li:last-child{margin-right: 0;}
			.ie8 .biddingp_main ul li{margin-right:10px;}
            .biddingp_main ul .b_m_jingjia{background-position: -168px -15px;}
            .biddingp_main ul .b_m_chenggong{background-position: -168px -82px;}
            .biddingp_main ul .b_m_hetong{background-position: -168px -149px;}
            .biddingp_main ul .b_m_fuwu{background-position: -168px -212px;}
            .biddingp_main ul .b_m_huping{background-position: -168px -282px;}
            .biddingp_main ul .b_m_jingjia.b_m_sel{background-position: -14px -15px;}
            .biddingp_main ul .b_m_chenggong.b_m_sel{background-position: -14px -82px;}
            .biddingp_main ul .b_m_hetong.b_m_sel{background-position: -14px -149px;}
            .biddingp_main ul .b_m_fuwu.b_m_sel{background-position: -14px -212px;}
            .biddingp_main ul .b_m_huping.b_m_sel{background-position: -14px -282px;}
            .biddingp_main ul .b_m_sel{color:#fff;}
            .biddingprocess .biddingp_main p{display: none;margin-top: 30px;color:#666666;} */
            


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
                        <!-- <p class="sysm_fabu">您发布的竞品正在审核中！平台会在3日内审核完成。<a href="javascript:void(0)" onclick="javascript:goUrl('05_会员服务/02_站内信件_收件箱.html')">[去查看]</a></span></p>
                        <p class="sysm_fabu">您发布的竞品已经通过审核！将于明天在开始竞价。<a href="javascript:void(0)" onclick="javascript:goUrl('05_会员服务/02_站内信件_收件箱.html')">[去查看]</a></span></p>
                        <p class="sysm_fabu">您发布的竞品已经竞拍结束，被xx拍走！请在2日内完成线上签约。<a href="javascript:void(0)" onclick="javascript:goUrl('05_会员服务/02_站内信件_收件箱.html');">[去查看]</a></span></p>
                        <p class="sysm_fabu">您发布的竞品已完成双方签约流程，请支付平台手续费，支付完成后平台会退回您的保证金。<a href="javascript:void(0)" onclick="javascript:goUrl('交易管理/交易管理_我要付款.html');">[去支付]</a></span></p>
                    	 -->
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
                <div class="biddingprocess">
                    <!-- <div class="m_r_title"><span class="m_r_tname">竞价流程</span></div> -->
                    <div class="m_r_title"><span class="m_r_tname">危废服务流程</span></div>
                    <div class="biddingp_main">
                        <ul class="clearfix">
                            <li class="fl clearfix">
                                <div class="fl tri_text">基本列表</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fl clearfix">
                                <div class="fl tri_text">审核资料并报价</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fl clearfix">
                                <div class="fl tri_text">上传合同及资料</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fl clearfix">
                                <div class="fl tri_text">查阅合同</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fl clearfix">
                                <div class="fl tri_text">管理计划表</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fl clearfix">
                                <div class="fl tri_text">确认管理计划表</div><div class="tri-r fr"></div>
                            </li>
                            <li class="fr clearfix"style="margin-right: 15px;">
                                <div class="tri-l fl"></div><div class="fl tri_text">邮寄资料</div>
                            </li>
                            <li class="fr clearfix">
                                <div class="tri-l fl"></div><div class="fl tri_text">支付并备案</div>
                            </li>
                            <li class="fr clearfix">
                                <div class="tri-l fl"></div><div class="fl tri_text">审批材料</div>
                            </li>
                            <li class="fr clearfix">
                                <div class="tri-l fl"></div><div class="fl tri_text">通知收运</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="purchase_supply font_1">
                    <div class="m_r_title"><span class="m_r_tname">求购</span><span>供应</span><a class="font_1" href="${ctx}/qiugou/searchList"  target="_black">更多 ></a></div>
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
                     <div class="m_r_title"><span class="m_r_tname">历史记录</span><!-- <a class="font_1" href="javascript:void(0)">更多 ></a> -->
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
                <!-- <div class="forum font_1">
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
                <div class="exc_points font_1">
                    <div class="m_r_title"><span class="m_r_tname">积分兑换奖品</span><a class="font_1" href="javascript:void(0)">更多 ></a></div>
                    <div class="excp_mian">
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
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function () {
                //求购 供应切换
                $(".purchase_supply .m_r_title span").on("click", function () {
                    $(this).siblings().removeClass().end().addClass("m_r_tname");
                    var index = $(this).index();
                    if (index == 0) {
                        $(".purc_main").show().next().hide();
                    } else {
                        $(".supp_main").show().prev().hide();
                    }
                });

                //竞价流程  点击
               /*  $(".biddingp_main ul li").click(function () {
                    if ($(this).hasClass("b_m_sel")) {
                        return;
                    } else {
                        $(this).siblings().removeClass("b_m_sel").end().addClass("b_m_sel");
                        $(".biddingp_main>p").eq($(this).index()).show().siblings("p").hide();
                    }
                }); */

                //历史记录
               // $(".his_records .m_r_title>a").on("mouseover", function () {
                //    $(".his_records .m_r_title .change").show();
               // })
               // $(".his_records .m_r_title .change").on("mouseleave", function () {
                //    $(this).hide();
                //});
                $(".his_records .m_r_title .change").show();
                $(".his_records .m_r_title .change a").click(function () {
                    if ($(this).index() == 1) {
                        $(".hisr_qiugou_main").show().next().hide();
                    } else {
                        $(".hisr_gongying_main").show().prev().hide();
                    }
                });
            });


            $(document).ready(function(){
            	notRead();
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