<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <!--[if lt IE 9]>
    <script>
        (function(){
            document.createElement("header");
            document.createElement("footer");
            document.createElement("nav");
        })()
    </script>
    
	<![endif]-->
<link rel="shortcut icon" href=""/> 
<title>优蚁环保火热上线,好礼换不停</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>

.main{overflow:hidden;}
header{width:1000px; margin:auto; background-color:white; height:155px; overflow:hidden;}
.hea_l{float:left; margin-top:21px;}
.hea_r{float:right; margin-top:56px;}

.wrapper{background-color:#e72442;background:url(${ctxStatic}/img/llhb/icon_0001.png) no-repeat top center;}
.wrapper .main{width:1000px; margin:auto;}
.main_top{width:650px; margin:auto; margin-left:180px; margin-top:50px; display:block;}

.active_1,.active_2,.active_3,.active_4{width:1000px; height:262px; background-color:white; border-radius:8px; -moz-border-radius:8px; -webkit-border-radius:8px; position:relative; margin-top:100px;}
.ac_tit{position:absolute; top:-31px; left:319px;}
.active_1 .ac_con{width:1000px; text-align:center; position:absolute; top:70px; line-height:48px;}
.active_1 h1{font-size:27px; color:#333; font-weight:bolder;}
.active_1 h1 span{font-weight:normal;}
.active_1 h2{font-size:27px; color:#e72441; font-weight:normal;}
.active_1 h2 span{font-weight:bolder; margin:0 30px; font-size:30px;}
.active_1 .icon_finger{position:absolute; top:124px; left:560px;}

.active_2{height:644px;}
.active_2 .ac_con{position:absolute; width:1000px; top:70px;}
.active_2 .icon_i1{margin:20px 0 30px 60px;}
.active_2 .ac_con p{width:888px; line-height:30px; color:#333; margin-left:56px; text-indent:20px;}

.active_2 .ul_1{margin-top:40px; margin-left:80px;}
.active_2 .ul_1 li{height:105px; position:relative; margin:30px 0;}
.active_2 .ul_1 li a{font-size:18px; color:white; padding-left:110px; width:720px; height:75px; background-color:#f14e67; border-radius:38px; -moz-border-radius:38px; -webkit-border-radius:38px; display:block;}
.active_2 .ul_1 li img{position:absolute; top:-18px; left:-30px; z-index:4;}

.active_3{height:397px;}
.active_3 .ul_2{overflow:hidden; margin-left:45px; padding-top:90px;}
.active_3 .ul_2 li{float:left; margin:0 10px; cursor:pointer;}
.active_3 .li_div{width:166px; height:54px; background-color:#f5f0f0; text-align:center; color:#333;}
.active_3 .li_div a{font-weight:bolder; padding-top:6px; display:block;}

.active_4{height:287px;}
.active_4 .ac_con{padding-top:90px; margin-left:55px;}
.active_4 .ac_con a{color:#333; line-height:30px; display:block; width:840px;}

footer{background-color:#e72442; border:none; height:200px; padding-top:60px; }
.footer_a{width:600px; margin:auto; text-align:center; line-height:24px;}
.footer_a .copyright{color:white;}
.footer_a .youlian{overflow:hidden;}
.footer_a .youlian li{float:left; background:url(${ctxStatic}/img/llhb/icon_0018.png) no-repeat right center; color:white; padding:0 6px; text-align:center}
.footer_a .authen{margin-top:15px;}
.font_31{
    float: left;
    height: 35px;
    line-height: 35px;
    width: 80px;
    margin-top: 70px;
    margin-left:100px;
    background: #5EC520;
    color: #FFFFFF;
    text-align: center;
}
</style>

</head>
<body>
<header style="overflow: hidden;">
		<a class="hea_l" href="${ctx}/index"><img src="${ctxStatic}/img/llhb/icon_0002.png"></a>
<%--        <a class="hea_r"><img src="${ctxStatic}/img/llhb/mall_tel.png"></a>--%>
        <a class="font_31" href="javascript:void(0);" onclick="window.open('${ctx}/addNeed');" style="width:135px;background-color:#ee7800;">发布环保需求</a>
</header>
	<div class="wrapper">
		<div class="main">
			<a class="main_top"><img src="${ctxStatic}/img/llhb/icon_0003.png"></a>
            <div class="active_1">
            	<a class="ac_tit"><img src="${ctxStatic}/img/llhb/icon_0004.png"></a>
                <div class="ac_con">
                	<h1>活动时间：<span>2015年11月30日至2015年12月31日</span></h1>
                	<h1>活动对象：<span>所有优蚁网新老会员</span></h1>
                    <h2>如您还未注册<span style="cursor:pointer;" onclick="go('${ctx}/login')">请点这里</span>马上注册。</h2>
                    <img class="icon_finger" src="${ctxStatic}/img/llhb/icon_0008.png">
                </div>
            </div>
            <div class="active_2">
            	<a class="ac_tit"><img src="${ctxStatic}/img/llhb/icon_0005.png"></a>
                <div class="ac_con">
                    <img class="icon_i1" src="${ctxStatic}/img/llhb/icon_0009.png">
                    <p class="font_3">喜迎优蚁环保网上线。为了感谢大家支持，表达我们对广大用户的感恩之心，优蚁环保网推出为期一个月的特惠送礼活动，
更多惊喜，等您来拿！</p>
					<ul class="ul_1">
                    	<li style="line-height:75px;"><a>活动期间，注册优蚁会员后完善资料并发布供求信息可获得双倍任务积分。</a><img src="${ctxStatic}/img/llhb/icon_0010.png"></li>
                        <li style="line-height:28px;"><a style=" padding-top:10px; height:65px;">活动期间，推荐企业成功注册会员可获三倍任务积分，即推荐产废企业成为会员可获
600积分，推荐环保企业成为会员可获1500积分。</a><img src="${ctxStatic}/img/llhb/icon_0011.png"></li>
						<li style="line-height:75px;"><a>活动期间，可以使用积分兑换奖品。</a><img src="${ctxStatic}/img/llhb/icon_0012.png"></li>
                        
                    </ul>
                </div>
            </div>
            
            <div class="active_3">
            	<a class="ac_tit"><img src="${ctxStatic}/img/llhb/icon_0006.png"></a>
                <div class="ac_con">
                    <ul class="ul_2">
                    	<li>
                        	<img src="${ctxStatic}/img/llhb/icon_0013.png">
                        	<div class="li_div">
                            	<a>优蚁马克杯</a>
                            	<p>需<span>2500</span>积分</p>
                            </div> 
                        </li>
                        <li>
                        	<img src="${ctxStatic}/img/llhb/icon_0014.png">
                        	<div class="li_div">
                            	<a>30元充值卡</a>
                            	<p>需<span>5500</span>积分</p>
                            </div> 
                        </li>
                        <li>
                        	<img src="${ctxStatic}/img/llhb/icon_0015.png">
                        	<div class="li_div">
                            	<a>移动充电宝</a>
                            	<p>需<span>10000</span>积分</p>
                            </div> 
                        </li>
                        <li>
                        	<img src="${ctxStatic}/img/llhb/icon_0016.png">
                        	<div class="li_div">
                            	<a>100元购物卡</a>
                            	<p>需<span>20000</span>积分</p>
                            </div> 
                        </li>
                        <li>
                        	<img src="${ctxStatic}/img/llhb/icon_0017.png">
                        	<div class="li_div">
                            	<a>55度降温杯</a>
                            	<p>需<span>28000</span>积分</p>
                            </div> 
                        </li>
                    </ul>
                </div>
            </div>
            <div class="active_4">
            	<a class="ac_tit"><img src="${ctxStatic}/img/llhb/icon_0007.png"></a>
                <div class="ac_con font_3">
                	<a>1、以上活动，优蚁环保网注册会员，可任选其一或全部参与。</a>
					<a>2、礼品图片仅供宣传，具体以实物为准。</a>
                    <a>3、会员达到积分后即可参加兑换活动，兑换时请拨打客服电话<span style="color:#e72441;">${servicePhone }</span>，优蚁环保网客服人员将竭诚为您服务。</a>
                    <a style="text-indent:27px; margin-top:4px; color:#666;">此次活动最终解释权归优蚁环保网所有</a>
                </div>
            </div>
            
		</div>
	</div>
	<footer>
		<div class="footer_a font_1">
        	    <a class="copyright">广东绿联互联网科技有限公司&nbsp;&nbsp;Copyright2015-2018&nbsp;粤ICP备15102315号</a>
        		 <br/> <a target="_blank" style="color:white;" href="http://www.zhb.gov.cn/" >中华人民共和国环境保护部&nbsp;|</a>
                    <a target="_blank" style="color:white;" href="http://www.gdep.gov.cn/">广东省环境保护厅&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://dgepb.dg.gov.cn/">东莞市环境保护局&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://dgemc.dgepb.dg.gov.cn/">东莞环境保护监测中心站&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.gdepi.com.cn/">广东省环保产业网&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.dghbxh.com/">东莞市环境保护产业协会&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.cepnews.com.cn/">中国环保新闻网&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.h2o-china.com/">中国水网&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.solidwaste.com.cn/">中国固废网&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.chndaqi.com/">中国大气网&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.watergasheat.com/index.asp">中国给水排水&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.cecol.com.cn/">中国节能在线&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.relink123.com/">广东绿联互联网科技有限公司&nbsp;|</a>&nbsp;
                    <a target="_blank" style="color:white;" href="http://www.wankor.net/">东莞市网拓信息科技有限公司</a>   
                   <br/> <a class="authen"><img src="${ctxStatic}/img/llhb/footer_authen.png"></a> 
                    
        </div>
    </footer>
</body>
</html>


