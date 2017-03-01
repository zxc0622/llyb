<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="utf-8"%> <%@ include
file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>优蚁环保-图标说明</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
.main{overflow:hidden;}
.main h1{font-size:40px; color:#666; font-weight:normal; width:1000px; text-align:center; display:block; margin:30px 0;}
.icon_explain{height:140px; overflow:hidden;background-color:white;width:100%;border-bottom:1px solid #ccc;}
.icon_explain_l,.icon_explain_r{position: absolute;height:140px;background:#fff;z-index: 5; border-bottom:1px solid #ccc}
.icon_explain li{float:left; width:68px;height:100px; position:relative; margin:20px 65px 0;cursor:pointer;}
.icon_explain li span{position:absolute; font-size:14px; color:#4c4948; left:5px; top:78px; cursor:pointer;}
.ie8 .icon_explain li{background-image:url(${ctxStatic}/img/llhb/icon_icons.png); background-repeat:no-repeat; background-position:0 0;}
.icon_explain li{background-image:url(${ctxStatic}/img/llhb/icon_icons1.png); background-repeat:no-repeat; background-position:0 0;} 
.icon_explain .icon_li_1{background-position:0 0;}
.icon_explain .icon_li_2{background-position:-76px -108px;}
.icon_explain .icon_li_3{background-position:-153px -108px;}
.icon_explain .icon_li_4{background-position:-229px -108px;}
.icon_explain .icon_li_5{background-position:-306px -108px;}
.icon_explain .icon_li_6{background-position:-382px -108px;}
.icon_explain .icon_li_7{background-position:-455px -108px;}


.icon_explain_1 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_1.png) 0 0 no-repeat;}
.icon_explain_2 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_2.png) 0 0 no-repeat;}
.icon_explain_3 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_3.png) 0 0 no-repeat;}
.icon_explain_4 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_4.png) 0 0 no-repeat;}
.icon_explain_5 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_5.png) 0 0 no-repeat;}
.icon_explain_6 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_6.png) 0 0 no-repeat;}
.icon_explain_7 .icon_banner .icon_banner_mid{background: url(${ctxStatic}/img/llhb/icon_banner_7.png) 0 0 no-repeat;}

.icon_explain_2 .icon_banner_l,.icon_explain_2 .icon_banner_r{background: #5DA1DE;}
.icon_explain_3 .icon_banner_l,.icon_explain_3 .icon_banner_r{background: #995AB4;}
.icon_explain_4 .icon_banner_l,.icon_explain_4 .icon_banner_r{background: #33B5A6;}
.icon_explain_5 .icon_banner_l,.icon_explain_5 .icon_banner_r{background: #DEB730;}
.icon_explain_6 .icon_banner_l,.icon_explain_6 .icon_banner_r{background: #0DAF61;}
.icon_explain_7 .icon_banner_l,.icon_explain_7 .icon_banner_r{background: #0daf61;}


.icon_banner_mid{height:204px;width:100%;float:left;}
.icon_banner_l{position:absolute;height:204px;background-color: #ee7800;}
.icon_banner_r{position:absolute;height:204px;background-color: #ee7800;}
.qwyx_1{overflow:hidden; margin-left:85px; position:relative}
.qwyx_1 dl{float:left;background-image:url(${ctxStatic}/img/llhb/icon_e_2.png); background-repeat:no-repeat; width:166px; height:270px; position:relative; margin-right:58px;}
.qwyx_1 dl dt{font-size:16px; color:white; position:absolute; top:7px; left:66px;}
.qwyx_1 dl:nth-of-type(1) dt{left:66px;}
.qwyx_1 dl:nth-of-type(2) dt{left:52px;}
.qwyx_1 dl:nth-of-type(3) dt{left:52px;}
.qwyx_1 dl:nth-of-type(4) dt{left:42px;}
.qwyx_1 dl dd span{width:150px; position:absolute; top:112px; left:10px; font-size:13px; color:#666;}
.qwyx_1 dl dd img{position:absolute; bottom:10px; left:10px;}
.qwyx_1 p{background-color:#f7f8f8; height:2px; width:680px; position:absolute; top:73px; left:80px;z-index:-2;}

.icon_explain_2{overflow:hidden; margin-bottom:50px;}
.icon_explain_2 .zyfw_1{margin-left:43px; margin-top:90px; overflow:hidden;}
.icon_explain_2 .zyfw_1 li{width:327px; float:left; margin:0 65px;}
.icon_explain_2 .zyfw_1 li span{text-align:center; width:327px; display:block; line-height:70px;}
.base_font{color:#666; font-size:30px;width:100%;text-align:center;}

.zyfw_2{overflow:hidden;}
.zyfw_2 ul{float:left;}
.zyfw_2 ul li{ margin:7px 24px;width:208px; line-height:23px; font-size:16px; color:#666; padding:10px 20px; border:1px solid #ccc; margin-top:40px;-moz-border-radius:10px;-webkit-border-radius:10px;border-radius: 10px; position:relative;}
.zyfw_2 ul:nth-of-type(1) li a{position: absolute;top:26px;right:-6px;width:10px;height:10px;border-left: 1px solid #ccc;border-bottom: 1px solid #ccc;background-color: #fff;z-index: 2;transform: rotate(225deg);-ms-transform:-rotate(225deg);-moz-transform:rotate(225deg);-webkit-transform:rotate(225deg);-o-transform:rotate(225deg); z-index:6;}
.zyfw_2 ul:nth-of-type(2) li a{position: absolute;top:26px;left:-6px;width:10px;height:10px;border-left: 1px solid #ccc;border-bottom: 1px solid #ccc;background-color: #fff;z-index: 2;transform: rotate(45deg);-ms-transform:-rotate(45deg);-moz-transform:rotate(45deg);-webkit-transform:rotate(45deg);-o-transform:rotate(45deg); z-index:6;}
.zyfw_2 div{float:left;}
.zyfw_3{position:relative; background-image:url(${ctxStatic}/img/llhb/icon_e_11.png); background-repeat:no-repeat; background-position:center top; width:980px; height:374px; margin:auto; overflow:hidden;}
.zyfw_3 li{float:left; margin:42px;}
.zyfw_3 li:nth-of-type(2){margin-top:-14px;}
.zyfw_3 li img{border:6px solid white; margin-top:40px;-moz-border-radius:150px;-webkit-border-radius:150px;border-radius: 150px;box-shadow:2px 2px 20px 6px #ccc;-webkit-box-shadow:2px 2px 20px 6px #ccc;-moz-box-shadow:2px 2px 20px 6px #ccc;}
.zyfw_3 li span{display:block; width:230px; text-align:center; margin-top:30px; font-size:16px; color:#666;}
.zyfw_4{margin-left:102px; overflow:hidden;}
.zyfw_4 li{float:left; margin:0px 24px;}

.icon_explain_3{overflow:hidden; margin-bottom:50px;}

.icon_explain_3 table{width:742px; margin-left:129px;}
.icon_explain_3 table tr{}
.icon_explain_3 table tr th{width:370px; line-height:60px; color:white; background-color:#995ab4; font-size:25px; text-align:center; border:1px solid #fff;}
.icon_explain_3 table tr td{font-size:16px; color:#666; line-height:60px; border:1px solid #fff; background-color:#fcfafa; padding-left:40px;}
.icon_explain_3 table tr td span{background-image:url(${ctxStatic}/img/llhb/icon_e_18.png); background-repeat:no-repeat; background-position:0 12px; padding:15px; margin-right:6px;}
.icon_explain_3 table tr td a{background-image:url(${ctxStatic}/img/llhb/icon_e_18.png); background-repeat:no-repeat; background-position:-45px 12px; padding:15px;margin-right:6px;}

.icon_explain_4{overflow:hidden; margin-bottom:50px;}
.icon_explain_4 .jzbj_1{overflow:hidden;}
.icon_explain_4 .jzbj_1 li{float:left; margin:0 10px; background-image:url(${ctxStatic}/img/llhb/icon_e_27.png);background-repeat:no-repeat; background-position:bottom center; padding-bottom:20px;}
.icon_explain_5{overflow:hidden; margin-bottom:40px;}
.icon_explain_5 .cxjy_1{width:390x; overflow:hidden; margin:0 0 30px 305px;}
.icon_explain_5 .cxjy_1 dl{background-image:url(${ctxStatic}/img/llhb/icon_e_20.png); background-repeat:no-repeat; background-position:0 0; height:80px; padding-left:100px;margin-bottom:30px;}
.icon_explain_5 dd{line-height:50px;font-size:16px; color:#666;}

.icon_explain_5 .cxjy_2{overflow:hidden;}
.icon_explain_5 .cxjy_2 dl{background-image:url(${ctxStatic}/img/llhb/icon_e_20.png); background-repeat:no-repeat; background-position:0 -85px; height:80px; padding-left:100px; width:390px; margin:0 0 30px 305px;}

.icon_explain_5 .cxjy_2 .cxjy_2_1{overflow:hidden; margin-bottom:30px}
.icon_explain_5 .cxjy_2 .cxjy_2_1 li{float:left; position:relative; margin:0px 8px; border:1px solid #ccc;}
.icon_explain_5 .cxjy_2 .cxjy_2_1 li a{position:absolute; bottom:0; width:231px; line-height:35px; background-color:#deb730; font-size:16px; color:white; text-align:center;}
.icon_explain_5 .cxjy_2 .cxjy_2_1 li:hover a{display:block;}
.icon_explain_6{overflow:hidden; margin-bottom:50px;}
.icon_explain_6 .xcpg_1{overflow:hidden; margin-left:70px;}
.icon_explain_6 .xcpg_1 li{float:left; margin:24px 40px; background-image:url(${ctxStatic}/img/llhb/icon_e_34.png);background-repeat:no-repeat; background-position:bottom center; padding-bottom:20px;}



.header_logo{width: 338px; height: 104px;}
</style>

</head>
<body>
		<!-- 引入头部 -->
		<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

		<!--中间部分 start-->
		<div class="wrapper">
      	<!--回到顶部悬窗 start-->
	    <%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
      <!--回到顶部悬窗 end-->
		<!--中间内容 start-->
		<div class="main">
			<ul class="icon_explain contentNav">
                <li class="icon_li_1"><span>全网营销</span></li>
                <li class="icon_li_2"><span>专业服务</span></li>
                <!-- <li class="icon_li_3"><span>公开竞价</span></li> -->
                <li class="icon_li_4"><span>精准报价</span></li>
                <li class="icon_li_7"><span>危废服务</span></li>
                <li class="icon_li_5"><span>诚信交易</span></li>
                <!-- <li class="icon_li_6"><span>现场评估</span></li> -->
                <div class="icon_explain_l"></div>
                <div class="icon_explain_r"></div>
          	</ul>
                
            <!--全网营销start-->
            <div class="icon_explain_1">
            	<div class="icon_banner">
                  <div class="icon_banner_mid"></div>
                  <div class="icon_banner_l"></div>
                  <div class="icon_banner_r"></div>
                  <div class="clear"></div>
              </div>
            	<h1>时代发展</h1>
                <div style="margin-left:110px;"><img src="${ctxStatic}/img/llhb/icon_e_1.png"></div>
                <h1>四网融合&nbsp;&nbsp;全网覆盖&nbsp;&nbsp;精准营销</h1>
            	<div class="qwyx_1">
                	<p></p>
                	<dl>
                    	<dt>旺铺</dt>
                        <dd><span>旺铺—为您提供高档旺铺，在优蚁环保平台全方位展示公司信息及产品</span><img src="${ctxStatic}/img/llhb/icon_e_3.png"></dd>
                    </dl>
                    <dl>
                    	<dt>独立网站</dt>
                        <dd><span>独立网站—专业团队为您搭建营销型网站架构，为企业吸引买家</span><img src="${ctxStatic}/img/llhb/icon_e_4.png"></dd>
                    </dl>
                    <dl>
                    	<dt>手机网站</dt>
                        <dd><span>手机网站—手机扫描二维码直达企业官网，提升线上订单</span><img src="${ctxStatic}/img/llhb/icon_e_5.png"></dd>
                    </dl>
                    <dl>
                    	<dt>微网站营销</dt>
                        <dd><span>微网站—通过微信账号在微信市场推广宣传企业微网站</span><img src="${ctxStatic}/img/llhb/icon_e_6.png"></dd>
                    </dl>
                </div>
                <h1>全网营销能为您的企业带来什么样的收益</h1>
                <div style="margin-left:137px;"><img src="${ctxStatic}/img/llhb/icon_e_7.png"></div>
            </div>
            <!--全网营销end-->
            <!--专业服务start-->
            <div class="icon_explain_2">
            	<div class="icon_banner">
                <div class="icon_banner_mid"></div>
                <div class="icon_banner_l"></div>
                <div class="icon_banner_r"></div>
                <div class="clear"></div>
            	</div>
              
            	<ul class="zyfw_1">
                	<li><img src="${ctxStatic}/img/llhb/icon_e_8.png"><span class="base_font">线上专业解疑</span></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_9.png"><span class="base_font">线下上门评估</span></li>
                </ul>
                <p style="font-size:50px; color:#5da1de; width:100%; text-align:center; margin-top:50px;">线上专业解疑</p>
                <p class="base_font" style="line-height:87px; margin-bottom:30px;">您是否也有这样的困扰?</p>
                <div class="zyfw_2">
                	<ul>
                    	<li><a></a>对环保事务或手续办理程序不了解，不知如何办理？</li>
                        <li><a></a>厂区环保设计达不到要求需要重新建设？  </li>
                        <li><a></a>对产生的废弃物缺少回收意识或是回收渠道狭窄？</li>
                    </ul>
                    <div><img src="${ctxStatic}/img/llhb/icon_e_10.png"></div>
                    <ul>
                    	<li><a></a>对环境相关规定不了解而受到环保处罚？</li>
                        <li><a></a>对环保行情的不熟悉，花了高价做环保工作？</li>
                    </ul>
                    </div>
                    <p class="base_font" style="margin:50px 0px; line-height:40px;">专家、业务、环保法律顾问提供专业的环保服务，<br>帮助解决企业难题</p>
                    <ul class="zyfw_3">
                        <li><img src="${ctxStatic}/img/llhb/icon_e_12.png"><span>专家解答</span></li>
                        <li><img src="${ctxStatic}/img/llhb/icon_e_13.png"><span>客服解答</span></li>
                        <li><img src="${ctxStatic}/img/llhb/icon_e_14.png"><span>法律顾问咨询</span></li>
                    </ul>
                    <p style="font-size:50px; color:#5da1de; width:100%; text-align:center; margin-top:50px;">线下上门评估</p>
                    <p class="base_font" style="line-height:87px; margin-bottom:30px;">专业危废和固体废物评估队伍开展上门评估服务和环境检测</p>
                    <ul class="zyfw_4">
                        <li><img src="${ctxStatic}/img/llhb/icon_e_15.png"></li>
                        <li><img src="${ctxStatic}/img/llhb/icon_e_16.png"></li>
                    </ul>
            </div>
            <!--专业服务end-->
			<!--公开竞价start-->
<!--             <div class="icon_explain_3">
                <div class="icon_banner">
                    <div class="icon_banner_mid"></div>
                    <div class="icon_banner_l"></div>
                    <div class="icon_banner_r"></div>
                    <div class="clear"></div>
                </div>
                <p class="base_font" style="margin:50px 0px; line-height:40px;">专家、业务、环保法律顾问提供专业的环保服务，<br>帮助解决企业难题</p>
                <div style="margin-left:205px;"><img src="${ctxStatic}/img/llhb/icon_e_17.png"></div>
                <p style="font-size:30px;color:#995ab4;width:100%; text-align:center; margin-bottom:30px;">优蚁竞价方式与其他定价方式对比</p>
                <table>
                    <tr>
                        <th>优蚁竞价方式</th>
                        <th>其他定价方式</th>
                    </tr>
                    <tr>
                        <td><span></span>公开、公平、公正</td>
                        <td><a></a>"地下作业"、"暗箱操作"</td>
                    </tr>
                    <tr>
                        <td><span></span>为企业争取到更合理的价格</td>
                        <td><a></a>直接定价，不为企业争取更合理的价格</td>
                    </tr>
                    <tr>
                        <td><span></span>单向收取交易费服务</td>
                        <td><a></a>为谋利润双向收取交易费</td>
                    </tr>
                    <tr>
                        <td><span></span>享有市场规范定价权</td>
                        <td><a></a>不正当的价格竞争</td>
                    </tr>
                </table>
            </div> -->
            <!--公开竞价end-->
            <!--精准报价start-->
            <div class="icon_explain_4">
            	<div class="icon_banner">
                    <div class="icon_banner_mid"></div>
                    <div class="icon_banner_l"></div>
                    <div class="icon_banner_r"></div>
                    <div class="clear"></div>
                </div>
                <p class="base_font" style="line-height:50px; margin:30px 0;">专业、公正、精准为创业者、扩产者提供环评编写报价，检测报价等参考，<br>并对接靠谱、高效、价廉的环保服务公司，让企业省心、省力、省钱！</p>
                <ul class="jzbj_1">
                    <li><img src="${ctxStatic}/img/llhb/icon_e_26.png"></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_28.png"></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_29.png"></li>
                </ul>
            </div>
            <!--精准报价end-->
            <!-- 危废服务 -->
            <div class="icon_explain_7">
                <div class="icon_banner">
                    <div class="icon_banner_mid"></div>
                    <div class="icon_banner_l"></div>
                    <div class="icon_banner_r"></div>
                    <div class="clear"></div>
                </div>
                <p class="base_font" style="line-height:30px; margin:30px 0;">专业、细致、高效、价廉为产废企业对接危废处理全程服务，<br><br>为企业量身定制危废处理规划，并有专人贴身服务。</p>
                <div class="icon_explain_7_div">
                    <img src="${ctxStatic}/img/llhb/icon_banner_7_1.png" alt="">
                </div>
            </div>
            <!-- 危废服务end -->
            <!--诚信交易start-->
            <div class="icon_explain_5"style="margin-bottom:50px;">
                <div class="icon_banner">
                    <div class="icon_banner_mid"></div>
                    <div class="icon_banner_l"></div>
                    <div class="icon_banner_r"></div>
                    <div class="clear"></div>
                </div>
                <p class="base_font" style="line-height:50px; margin:30px 0;">完善的线上信用体系，通过实名认证、工商认证和实地认证等<br><span style="color:#deb730;">三大认证组成信誉认证体系</span><br>确保企业的信息有效，构建诚信的网络交易环境</p>
                <div class="cxjy_1">
                    <dl>
                        <dt class="base_font" style="text-align:left; padding-top:15px;">实名认证</dt>
                        <dd>实名认证公司法人，可信度认知度有保障</dd>
                    </dl>
                    <img src="${ctxStatic}/img/llhb/icon_e_19.png">
                </div>
                <div class="cxjy_2">
                    <dl>
                        <dt class="base_font" style="text-align:left; padding-top:15px;">工商认证</dt>
                        <dd>提前审核供应商资质，让您无忧购物</dd>
                    </dl>
                    <ul class="cxjy_2_1">
                        <li>
                            <img src="${ctxStatic}/img/llhb/icon_e_21.png">
                            <a>营业执照</a>
                        </li>
                        <li>
                            <img src="${ctxStatic}/img/llhb/icon_e_24.png">
                            <a>税务登记证</a>
                        </li>
                        <li>
                            <img src="${ctxStatic}/img/llhb/icon_e_23.png">
                            <a>组织机构代码</a>
                        </li>
                        <li>
                            <img src="${ctxStatic}/img/llhb/icon_e_22.png">
                            <a>产品质检证</a>
                        </li>
                    </ul>
                </div>
                <div class="cxjy_2">
                    <dl style="background-position:0 -170px;">
                        <dt class="base_font" style="text-align:left; padding-top:15px;">实地考察</dt>
                        <dd>严格把控供应商的资质，杜绝三无公司流入</dd>
                    </dl>
                    <div style="width:1000px; padding:0px 10px"><img src="${ctxStatic}/img/llhb/icon_e_25.png"></div>
                </div>
            </div>
            <!--诚信交易end-->
            <!--现场评估start-->
            <!-- <div class="icon_explain_6">
                <div class="icon_banner">
                    <div class="icon_banner_mid"></div>
                    <div class="icon_banner_l"></div>
                    <div class="icon_banner_r"></div>
                    <div class="clear"></div>
                </div>
                <p class="base_font" style="line-height:50px; margin:30px 0;">优蚁网邀请专业危费和固体废物评估队伍，<br>上门现场评估为您现场评估，助您轻松完成环保工作</p>
                <ul class="xcpg_1">
                    <li><img src="${ctxStatic}/img/llhb/icon_e_30.png"></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_31.png"></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_32.png"></li>
                    <li><img src="${ctxStatic}/img/llhb/icon_e_33.png"></li>
                </ul>
            </div> -->
            <!--现场评估end-->
      </div>
      <!--中间内容 end-->
	</div>
	<!--中间部分 end-->
  
<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<script>
	$(document).ready(function(){
		
		$(".h_s_top a").on("click",function(){
			$(this).addClass("li-sel").siblings().removeClass("li-sel");
			$("#biaoji").val($(this).index());
		});
		h_s_bottom_a();
    	var winWidth = $(window).width();
    	var halfPosition = (winWidth - $(".main").width())/2;
    	$(".icon_banner_r").css({right:0,width:halfPosition+1});
    	$(".icon_banner_l").css({left:0,width:halfPosition+1});
    	$(".icon_explain_l").css({right:0,width:halfPosition+1});
    	$(".icon_explain_r").css({left:0,width:halfPosition+1});
		var icon_po;
        var icon_ul_height=$(".icon_explain").height();

		$(document).scroll(function(){
			icon_po = $(document).scrollTop();
            //(需根据页面展示判断)
			if(icon_po>240){
				$(".icon_explain").css("position","fixed").css("top","0").css("z-index","20");
				$(".icon_explain_l").css("position","fixed").css({"top":"0"}).css("z-index","20");
				$(".icon_explain_r").css("position","fixed").css({"top":"0"}).css("z-index","20");
                $(".icon_explain_1").css({"margin-top":icon_ul_height});
			}else{
				$(".icon_explain").css("position","static");
				$(".icon_explain_l,.icon_explain_r").css({"position":"absolute","z-index":"5"});
                $(".icon_explain_1").css({"margin-top":0});	
			}
			if(icon_po<=$(".icon_explain_2").offset().top-icon_ul_height){
				$(".icon_explain .icon_li_1").css("background-position","0 0");	
				$(".icon_explain .icon_li_2").css("background-position","-76px -108px");
				$(".icon_explain .icon_li_3").css("background-position","-153px -108px");
				$(".icon_explain .icon_li_4").css("background-position","-229px -108px");
                $(".icon_explain .icon_li_5").css("background-position","-306px -108px");
				$(".icon_explain .icon_li_6").css("background-position","-382px -108px");
                $(".icon_explain .icon_li_7").css("background-position","-455px -108px");
			}else if($(".icon_explain_2").offset().top-icon_ul_height<icon_po&icon_po<=$(".icon_explain_4").offset().top-icon_ul_height){
				$(".icon_explain .icon_li_1").css("background-position","0 -108px"); 
                $(".icon_explain .icon_li_2").css("background-position","-76px 0");
                $(".icon_explain .icon_li_3").css("background-position","-153px -108px");
                $(".icon_explain .icon_li_4").css("background-position","-229px -108px");
                $(".icon_explain .icon_li_5").css("background-position","-306px -108px");
                $(".icon_explain .icon_li_6").css("background-position","-382px -108px");
                $(".icon_explain .icon_li_7").css("background-position","-455px -108px");
			}else if($(".icon_explain_4").offset().top-icon_ul_height<icon_po&icon_po<=$(".icon_explain_7").offset().top-icon_ul_height){
				$(".icon_explain .icon_li_1").css("background-position","0 -108px"); 
                $(".icon_explain .icon_li_2").css("background-position","-76px -108px");
                $(".icon_explain .icon_li_3").css("background-position","-153px -108px");
                $(".icon_explain .icon_li_4").css("background-position","-229px 0");
                $(".icon_explain .icon_li_5").css("background-position","-306px -108px");
                $(".icon_explain .icon_li_6").css("background-position","-382px -108px");
                $(".icon_explain .icon_li_7").css("background-position","-455px -108px");		
			}else if($(".icon_explain_7").offset().top-icon_ul_height<icon_po&icon_po<=$(".icon_explain_5").offset().top-icon_ul_height){
				$(".icon_explain .icon_li_1").css("background-position","0 -108px"); 
                $(".icon_explain .icon_li_2").css("background-position","-76px -108px");
                $(".icon_explain .icon_li_3").css("background-position","-153px -108px");
                $(".icon_explain .icon_li_4").css("background-position","-229px -108px");
                $(".icon_explain .icon_li_5").css("background-position","-306px -108px");
                $(".icon_explain .icon_li_6").css("background-position","-382px -108px");
                $(".icon_explain .icon_li_7").css("background-position","-455px 0");	
			}else if(icon_po>$(".icon_explain_7").offset().top-icon_ul_height){
                $(".icon_explain .icon_li_1").css("background-position","0 -108px"); 
                $(".icon_explain .icon_li_2").css("background-position","-76px -108px");
                $(".icon_explain .icon_li_3").css("background-position","-153px -108px");
                $(".icon_explain .icon_li_4").css("background-position","-229px -108px");
                $(".icon_explain .icon_li_5").css("background-position","-306px 0");
                $(".icon_explain .icon_li_6").css("background-position","-382px -108px");
                $(".icon_explain .icon_li_7").css("background-position","-455px -108px");
            }
		});
    	$(".icon_explain .icon_li_1").mousedown(function(){
    		$("html,body").animate({scrollTop:$(".icon_explain_1").offset().top-icon_ul_height+1});
    	});
    	$(".icon_explain .icon_li_2").mousedown(function(){
    		$("html,body").animate({scrollTop:$(".icon_explain_2").offset().top-icon_ul_height+1});
    	});
        $(".icon_explain .icon_li_4").mousedown(function(){
            $("html,body").animate({scrollTop:$(".icon_explain_4").offset().top-icon_ul_height+1});
        });
        $(".icon_explain .icon_li_7").mousedown(function(){
            $("html,body").animate({scrollTop:$(".icon_explain_7").offset().top-icon_ul_height+1});
        });
        $(".icon_explain .icon_li_5").mousedown(function(){
            $("html,body").animate({scrollTop:$(".icon_explain_5").offset().top-icon_ul_height+1});
        });
        changepage_scroll('${num}');
    });

	function h_s_bottom_a(){
		var total_width=0;
		$(".h_s_bottom a").each(function(){
		total_width+=$(this).width();
		if(parseInt(total_width)>350){
			$(this).hide();
		}
		});
	}

	</script>
</body>
</html>


