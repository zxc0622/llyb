<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <link rel="shortcut icon" href=""/> 
        <title>优蚁币兑换</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            .jinfen{overflow: hidden;margin-left: 20px;width:720px;margin-top: 25px;}
            .jinfen .jifen_l{width:465px;height:240px;float:left;}
            .jinfen .jifen_l a{width:100%;height:100%;background: url(${ctxStatic}/img/llhb/jifen_l_img.png) 0 0 no-repeat;display: block;background-size: cover;}
            .jinfen .jifen_r{float:left;margin-left: 10px;width:240px;height:240px;}
            .jifen_r .jifen_r_t{padding:10px;background-color: #FFFDEE;border:1px solid #FFF0D9;}
            .jifen_r .jifen_r_t .jifen_r_t_title{font-weight: bold;}
            .jifen_r_t .jifen_r_t_title a{position: relative;padding-left: 35px;margin-left: 10px;}
            .jifen_r_t .jifen_r_t_title a::before{content:"";position: absolute;width:25px;height:25px;background:url(${ctxStatic}/img/llhb/jifen_youyib.png) 0 0 no-repeat;top:2px;left:10px;}
            .jifen_r_t .jifen_r_t_title a::after{content:"";position: absolute;width:25px;height:25px;background:url(${ctxStatic}/img/llhb/icon2.png) 0 0 no-repeat;top:3px;right:-31px;}
            .jifen_r_t .jifen_r_t_con{margin-top: 10px;}
            .jifen_r_t .jifen_r_t_con a{display: block;}
            .jifen_r_t .jifen_r_t_con a:hover{color:#ee7800;}

            .jifen_r .jifen_r_b{padding:10px;background-color: #F2F2F2;}
            .jifen_r .jifen_r_b dt{overflow: hidden;}
            .jifen_r .jifen_r_b dt span{float:left;font-weight: bold;}
            .jifen_r .jifen_r_b dt a{float:right;color:#666666;}
            .jifen_r .jifen_r_b dl a:hover{color:#ee7800;}
            .jifen_r .jifen_r_b dd{padding:5px 0;border-bottom: 1px dashed #ccc;}
            .jifen_r .jifen_r_b dd:first-of-type{margin-top: 10px;}
            .jifen_r .jifen_r_b dd:last-of-type{border-bottom:none;}

            .hot_sell{overflow: hidden;}
            .hot_sell .hot_sell_box{float:left;margin-top:20px;width:164px;height:164px;overflow: hidden;position: relative;}
            .hot_sell .hot_sell_box:nth-child(odd){margin-left:20px;}
            .hot_sell .hot_sell_box:nth-child(even){margin-left: 20px;}
			.ie8 .hot_sell .hot_sell_box{margin-left:20px;}
            .hot_sell_box .hs_b_img{width:100%;height:130px;}
            .hot_sell_box .hs_b_img img{width:100%;height:100%;}
            .hot_sell_box .hs_b_mask{width:100%;height:90px;background-color:rgba(0,0,0,0.5);position: absolute;top:0;left:0;display: none;padding-top: 40px;}
            .hot_sell_box .hs_b_mask p{color:#fff;text-align: center;}
            .hot_sell .hot_sell_box:hover .hs_b_mask{display: block;}
            .hot_sell .hot_sell_box:hover>p{color:#ee7800;}
            .hot_sell .hot_sell_box>p{text-align: center;height:34px;line-height: 34px;background-color: #EFEFEF;}
        </style>
        
    </head>
    <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tab_main">
                    <div class="m_r_title"><span class="m_r_tname">积分兑换</span></div>
                    <!-- 积分_div -->
                    <div class="jinfen">
                        <div class="jifen_l">
                            <a href="javascript:void(0)"></a>
                        </div>
                        <div class="jifen_r">
                            <div class="jifen_r_t">
                                <div class="jifen_r_t_title"><span>我的积分</span><a href="javascript:void(0)">${pu.point_num}</a></div>
                                <div class="jifen_r_t_con"><a class="font_1" href="${ctx}/memPoint/memIndex/convertList" >我的积分兑换记录</a>
                                <a class="font_1" href="javascript:getPlan();">优蚁币获取攻略</a></div>
                            </div>
                            <div class="jifen_r_b">
                                <dl>
                                    <dt>
                                        <span>积分兑换动态</span><a class="font_1" href="javascript:void(0)"><%--更多>--%></a>
                                    </dt>
                                    <c:forEach items="${rs}" var="r">
                                        <dd><a class="font_1 tmui-ellipsis" href="javascript:void(0)">${r.login_name}刚刚兑换了${r.pro_name}</a></dd>
                                    </c:forEach>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <!-- 积分_div 结束-->
                    <div class="m_r_title"><span class="m_r_tname">热门商品</span></div>


                    <div class="hot_sell">
                        <c:forEach items="${ps}" var="p">
                            <div class="hot_sell_box">
                                <div class="hs_b_img">
                                    <img src="${p.small_img}" alt="">
                                </div>
                                <div class="hs_b_mask">
                                    <p>${p.pro_name}</p>
                                    <p>${p.points}积分</p>
                                </div>
                                <p class="hs_b_duihuan" onclick="goUrl('${p.id}')">立即兑换</p>
                            </div>
                        </c:forEach>
                    </div>
                
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                
            });
			function goUrl(pid){
				window.location.href="${ctx}/memPoint/memIndex/productIntro?pid="+pid;
			}
            /**
             * 积分获取攻略
             */
            function  getPlan(){
                window.open('${ctx}/platform/commenProblem?remark=5&type=1125','_blank');
                //location.href='${ctx}/platform/commenProblem?remark=5&type=1125';
            }
                


            

        </script>
    </body>
</html>


