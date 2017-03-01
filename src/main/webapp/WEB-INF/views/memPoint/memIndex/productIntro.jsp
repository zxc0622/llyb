<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>积分兑换-积分产品介绍</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            .dhsp_top{padding:15px;overflow: hidden;border-bottom: 1px solid #ccc;margin-top: 30px;}
            .dhsp_top_r>p{margin-top: 10px}
            p{color:#666666;}
            .dhsp_top_l{float:left;width:220px;height:220px;}
            .dhsp_top_l img{width:100%;height:100%;}
            .dhsp_top_r {float:left;margin-left: 20px;width:480px;}
            .dhsp_top>p{padding-top: 20px;}
                
            .dhsp_main{margin-top: 30px;padding:0 20px;}
            .dhsp_canshu{width:650px;margin:30px auto;overflow:hidden;}

            .green_tip p{color:#5cb531;line-height: 30px;}
            .dhsp_main dl{margin-top:50px;color:#666666;}
            .dhsp_main dt{margin-bottom:30px;}
            .dhsp_main dd{margin-bottom:10px;}
        </style>
        
    </head>
    <body>

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tab_main">
                    <div class="m_r_title"><span class="m_r_tname">${p.pro_name}</span></div>
                    
                    <!-- 兑换商品介绍 top -->
                    <div class="dhsp_top">
                        <div class="dhsp_top_l">
                            <img src="${p.small_img}" alt="">
                        </div>
                        <div class="dhsp_top_r">
                            <h3>${p.pro_name}</h3>
                            <p>所需积分 : <span>${p.points}</span></p>
                            <p>剩余数量 : <span>${p.num}</span></p>
                            <p>限购数量 : <span>${p.limit_num}</span></p>
                            <a href="javascript:void(0)" class="btn"style="margin-top:10px;" onclick="goUrl()">立即兑换</a>
                            <p class="font_1">
                                特别提醒:一个平台账号只能申请兑换一次该商品。本服务是面向全国城市的用户，用户必须发布过供求信息或者提交过环评竞价，提交兑换申请后，优蚁网会在三个工作日内联系您，确认相关信息，并包邮寄出。
                            </p>
                        </div>
                        <p class="font_1 clear">赞助提供:优蚁</p>
                    </div>
                    <div class="dhsp_main">
                        <h3>商品介绍</h3>
                        <p>产品参数</p>
                         <div class="dhsp_canshu">
                             ${p.pro_desc}
                             <img src="" alt="">
                         </div>
                         <%--<div class="green_tip font_1">
                             <p>注意:兑换的LED灯光颜色是不能够指定的,都是随机发送的哦~</p>
                             <p>优蚁兑换商城不包括对此产品的安装服务</p>
                         </div>--%>
                         <dl class="font_1">
                             <dt>特别提醒:</dt>
                             <dd>1、本兑换服务面向面向全国城市的用户，用户必须发布过供求信息或者提交过环评竞价</dd>
                             <dd>2、一个平台账号只能申请兑换一次商品</dd>
                             <dd>3、提交兑换申请后,优蚁网会在三个工作日之内联系您,确认相关信息,并包邮寄出.</dd>
                             <dd>4、本活动最终解释权归优蚁网所有</dd>
                             <dd>5、数量有限,先兑先得,兑完为止.</dd>
                         </dl>
                    </div>
                </div>
            </div>
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            
        function goUrl(){
			window.location.href="${ctx}/memPoint/memIndex/addAdd?pid=${pid}";
		}
                


            

        </script>
    </body>
</html>


