<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="chrome=1">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"/>
		<link rel="shortcut icon" href="javascript:void(0);"/> 
		<title>优蚁环保</title>
		<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
		<meta name="Keywords" content="优蚁环保,环保需求,发布需求">
		<meta name="description" content="">		
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
		
		<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/addNeed.css">
		
		<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/gongyingqiugou_index.js"></script>
       
		<!--引用百度地图API-->
    	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eYf9sA6yVTFHlh9ytU4a0EYY&services=&t=20160513110936"></script>
       	
		<style type="text/css">
			.step-first .step-val{
			    z-index: 2;
			    top: 5px;
			    left: 82px;
			    width: 33px;
			    height: 33px;
			    line-height: 33px;
			    background: url(${ctxStatic}/img/llhb/xqjdt.png) no-repeat;
			    background-position: 0px;
			    font-size: 16px;
			    color: #fff;
			    font-weight: normal;
			    display: block;
			    position: absolute;
			    text-align: center;
			}
			
			.step-next1 .step-val{
			    z-index: 2;
			    top: 5px;
			    left: 82px;
			    width: 33px;
			    height: 33px;
			    line-height: 33px;
			    background: url(${ctxStatic}/img/llhb/xqjdt.png) no-repeat;
			    background-position: -66px;
			    font-size: 16px;
			    color: #c1c1c1;
			    font-weight: normal;
			    display: block;
			    position: absolute;
			    text-align: center;
			}
			
			.step-next2 .step-val{
			    z-index: 2;
			    top: 5px;
			    left: 82px;
			    width: 33px;
			    height: 33px;
			    line-height: 33px;
			    background: url(${ctxStatic}/img/llhb/xqjdt.png) no-repeat;
			    background-position: -66px;
			    font-size: 16px;
			    color: #c1c1c1;
			    font-weight: normal;
			    display: block;
			    position: absolute;
			    text-align: center;
			}
			
			.step-last .step-val{
			    z-index: 2;
			    top: 5px;
			    left: 82px;
			    width: 33px;
			    height: 33px;
			    line-height: 33px;
			    background: url(${ctxStatic}/img/llhb/xqjdt.png) no-repeat;
			    background-position: -66px;
			    font-size: 16px;
			    color: #c1c1c1;
			    font-weight: normal;
			    display: block;
			    position: absolute;
			    text-align: center;
			}
			
			.zixunzhuanjia{
				display:block;
				float:left;
				width:21px;
				height:21px;
				margin-left:43px;
				margin-right:23px;
				margin-top:9px;
				background: url(${ctxStatic}/img/llhb/zhuanjia_1.png) no-repeat;
			}
			
			.lianxikefu{
				display:block;
				float:left;
				width:21px;
				height:21px;
				margin-left:43px;
				margin-right:23px;
				margin-top:9px;
				background: url(${ctxStatic}/img/llhb/kefu_1.png) no-repeat;
			}
			
			.searchcom span{
				display: block;
				width:18px;
				height:18px;
				background: url(${ctxStatic}/img/llhb/search.png) no-repeat;
				margin-top: 6px;
				margin-left: 21px;
			}
			
			.mh_date {
			    width: 249px;
			    height: 20px;
			    line-height: 20px;
			    padding: 5px;
			    border: 1px #ccc solid;
			    cursor: pointer;
			    background: url(${ctxStatic}/img/llhb/dateIco.png) no-repeat right center;
			}
			
			.nd_logo{
				width: 471px;
			    height: 90px;
			    text-indent: -10000px;
			    display: block;
			    position: relative;
			    background-image: url(${ctxStatic}/img/llhb/nd_logo.png);
			    background-repeat: no-repeat;
			}
			
			.timeinput {
				width: 100px;
				margin-top: 5px;
				border: 1px solid #ccc;
			}
			
			.wrapper{
				position: relative;
			}
			
			.userMsg input{color:#b7b7b7;*line-height:28px;}
			
			/* 大遮罩 */
	    	.bigShade{background-color: #000;position: fixed;left: 0;top: 0;display: none;width: 100%;height: 100%;opacity: 0.3;z-index: 4;}
	    	/* 弹框  */
			.box{position: fixed;z-index: 5;background-color: white;box-shadow: 1px 1px 50px rgba(0,0,0,.3);border-radius: 2px;font-family: '\5FAE\8F6F\96C5\9ED1';display: none;width: 240px;height: 142px;}
	    	.box_title{background: #5cb531;color: #fff;border: none;height: 38px;font-size: 14px;overflow: hidden;line-height: 38px;padding-left: 20px;}
	    	.box_content{padding: 20px;}
	    	.item_name{display: inline-block;width: 76px;text-align: right;padding-right: 3px;}
	    	.item_line{margin-top: 10px;}
	    	.box_bottom{text-align: right;padding: 0 10px 12px;}
	    	.box_bottom_a{height: 28px;line-height: 28px;margin: 0 6px;padding: 0 15px;border: 1px solid #dedede;background-color: #5cb531;color: #FFF;border-radius: 2px;font-weight: 400;cursor: pointer;text-decoration: none;display: inline-block;}
	    	.box_sure{color: white;background-color: #5cb531;}
	    	.step3Type{margin-top:20px;}
	    	.step3Type span{font-size:18px;}
	    	.step3Type input{height: 18px;width: 18px;margin-right: 10px;}
	    	.processBg{width:1000px;height:110px;margin:0 auto;background:url("${ctxStatic}/img/v2/publishRequirement/process.png");margin-top:30px;margin-bottom:40px;}
	    	
	    	/*右侧悬框*/
	        .gf_ad_right{width:108px; height:305px;  position:absolute; top:298px ; right:50%; margin-right:-622px; z-index:15;}
	        .r_a_top{width:100%; position:absolute;z-index:17;}
	        .r_a_down{width:100%; position:absolute; z-index:16; top:92px;}
	        .r_a_down>div:nth-of-type(1){padding-top:18px;}
	        .r_a_cc{width:100%;background-color:#5cb531; border-top:1px solid #efefef; padding:13px 0px; overflow:hidden;}
	        .r_a_cc span{color:#FFF;display:block; float:left; width:57px; margin-left:17px;}
	        .r_a_cc img{display:block; margin-left:8px; float:left; }
	        .r_a_cell{ width:100%;padding:10px 0px ; background-color:#efefef;}
	        .r_a_cell p{display:block; text-align:center;}
	        .r_a_cell>p:nth-of-type(2){color:#5cb531; font-size:14px; }
	        /*右侧悬框*/
	        
	        /*第三步样式 start*/
	        .efficient{width:1000px;margin:0 auto;overflow:hidden;font-size:12px; margin-bottom: 20px;}
			.efficient h2{margin:30px 0;font-weight: normal;font-size:18px;margin-left: 40px;}
			.efficient .chooses{width:800px;height:500px;margin:0 auto;}
			.efficient .chooses .effective{position: relative;}
			.efficient .chooses .effective .The_first{position: absolute;left:15px;top:15px;
				width:18px;height:18px;
				background:url(${ctxStatic}/img/v2/publishRequirement/pitch_on.png);
				background-position: 0px -18px;
			}
			.efficient .chooses .effective .grade{width:590px;height:127px;background:url(${ctxStatic}/img/v2/publishRequirement/efficient.png) no-repeat;}
			.efficient .chooses .effective .recommended{position: absolute;left:40px;top:13px;font-size:16px;color:#008f00;}
			.efficient .chooses .effective .look_over{display:block;width:336px;position: absolute;top:50px;left:21px;font-size:14px;}
			/*比价的代码*/
			.price_parity{position: relative;margin-top: 30px;}
			.price_parity .The_second{position: absolute;left:15px;top:15px;width:18px;height:18px;
				background:url(${ctxStatic}/img/v2/publishRequirement/pitch_on.png);
				background-position: 0px -18px;
			}
			.price_parity .Efficient_figure{width:590px;height:168px;background:url(${ctxStatic}/img/v2/publishRequirement/efficient.png) no-repeat;background-position:0 -145px;}
			.price_parity .Demand_hall{position: absolute;left:40px;top:13px;font-size:16px;color:#008f00;}
			.price_parity .Demand_hall .foyer{color:#008f00;}
			.price_parity .pushing{display:block;width:388px;position: absolute;top:50px;left:21px;font-size:14px;}
			.step3Input{width: 60px;text-align: center;}
	        /*第三步样式 end*/
        </style>
	</head>
	<body>
		<div class="nd_header">
			<div class="nd_header_main">
				<a class="nd_logo" title="优蚁网-企业身边的环保顾问" href="http://www.yyhb365.com/index" target="_blank">优蚁网</a>
			</div>
		</div>

		<!--中间部分 start-->
		<div class="wrapper">
            <!--主框架 start-->
            <div class="main">
            
               	<!-- 第一步：选择公司类型 -->
               	<div id="step1">
	               	<!-- 进度提醒 -->
	               	<div class="process1 processBg">
	               	</div>
	               	
	               	<!-- 步骤内容 -->
	              <div class="biggest">
	              	<h3>请选择您需要的服务类别</h3>
	              	<a href="http://www.yyhb365.com/youyi/process-special.html" class="whole_process" target="_blank"></a>
	               	<div class="step-content step-content-one" style="height:431px;border-bottom:none;border-top:none;">
						<ul class="category">
							<li class="nth1">
								<span class="whole_city"></span>
								<span>排污许可证</span>
								<p style="width:157px;height:113px;margin:0 auto;display:block;background:url(${ctxStatic}/img/v2/publishRequirement/sewage.png) no-repeat;"></p>
								<div class="sewage">
									<h4>排污许可证</h4>
									<p>国家对在生产经营过程中排放废气、废水、产生环境噪声污染和固体废物的行为实行许可证管理。在项目验收后，即可申请办理排污许可证。</p>
								</div>
							</li>
							<li class="nth2" style="width:178px;position: relative;border-left:none;border-right:none;border-bottom:none;">
								<span class="heat"></span>
								<span style="">环评</span>
								<p style="margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/eia.png) no-repeat;"></p>
								<div class="sewage">
									<h4>环评</h4>
									<p>环评，即环境影响评价，指对企业经营、生产过程对周边环境的影响而作出的评价，评判项目选址是否符合环保要求。</p>
								</div>
							</li>
							<li class="nth3" style="width:114px;border-bottom:none;">
								<h4>项目验收</h4>
								<p style="width:81px;height:92px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/acceptance.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;border-left:none;border-right:none;border-bottom:none;">
								<h4>应急预案</h4>
								<p style="width:82px;height:100px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/pre_arranged.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;border-right:none;border-bottom:none;">
								<h4>清洁生产</h4>
								<p style="width:81px;height:93px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/manufacture.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;border-right:none;border-bottom:none;">
								<h4>ISO14000认证</h4>
								<p style="width:64px;height:107px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/certification.png) center no-repeat;"></p>
						
							</li>
							<li class="nth4" style="width:182px;position: relative;border-left:none;border-right:none;">
								<span style="width:182px;display: block;color:#5ec520;text-align:center;font-size:18px;padding:33px 0 39px 0;">环境检测</span>
								<p style="width:68px;height:80px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/detection.png) no-repeat;"></p>
								<div class="sewage">
									<h4>环境检测</h4>
									<p>依据环评报告与批复的要求，委托有资质的检测公司对各项污染物的污染因子进行检测，检测达标后出具检测报告。</p>
								</div>
							</li>
							<li class="nth5" style="width:178px;position: relative;">
								<span style="width:178px;display: block;color:#5ec520;text-align:center;font-size:18px;padding:33px 0 39px 0;">危险废物</span>
								<p style="width:101px;height:90px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/dangerous.png) center no-repeat;"></p>
								<div class="sewage">
									<h4>危险废物</h4>
									<p>依据环评报告与批复的要求，对生产过程中产生的危险废物交由有资质的危废处置单位处置。</p>
								</div>
							</li>
							<li class="nth5" style="width:178px;position: relative;border-left:none;border-right:none;">
								<span style="width:178px;display: block;color:#5ec520;text-align:center;font-size:18px;padding:33px 0 39px 0;">环保工程</span>
								<p style="width:89px;height:78px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/Green_Mark.png) no-repeat;"></p>
								<div class="sewage">
									<h4>环保工程</h4>
								<p>依据环评报告与批复的要求，委托有资质的环保工程公司进行污染治理设施的建设</p>
								</div>
							</li>
							<li class="nth3" style="width:114px;position: relative;">
								<h4>环保设备</h4>
								<p style="width:84px;height:102px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/equipment.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;position: relative;border-left:none;border-right:none;">
								<h4>环保配件</h4>
								<p style="width:72px;height:106px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/accessories.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;position: relative;border-right:none;">
								<h4>材料药剂</h4>
								<p style="width:91px;height:110px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/agentia.png) center no-repeat;"></p>
								
							</li>
							<li class="nth3" style="width:114px;position: relative;border-right:none;">
								<h4>其它</h4>
								<p style="width:68px;height:112px;margin:0 auto;background:url(${ctxStatic}/img/v2/publishRequirement/others.png) center no-repeat;"></p>
								
							</li>
						</ul>
						
						
						      	
	               	</div>
               	</div>
               	</div>
               	
               	
               	<!-- 第二步：描述你的需求 -->
               	<div id="step2">
	               	<!-- 进度提醒 -->
	               	<div class="process2">
	               	</div>
               	
               		<!-- 步骤内容 -->
               		<div class="step-content">
               			<!-- 左边表单 -->
						<div class="userMsg" style="float:left;margin-top: 25px;margin-left: 25px;font-size: 12px;width:402px;">
							<div>
								<p><strong>您选择了：</strong><span id="companychoosed"></span><span>--</span><span id="typechoosed"></span>&emsp;&emsp;&emsp;&emsp;<a class="bluecol">修改</a></p>
							</div>
							
							<div style="margin-top: 30px;">
								<p><strong>优蚁将全程为您服务</strong></p>
								<input id="step2company" class="incomname" type="text" value="请输入企业名称" onfocus="if(value =='请输入企业名称'){value ='';}" onblur="if(value ==''){value='请输入企业名称'}" />
								<div class="addr" style="margin-top: 15px;height:26px;width:326px;">
									<p style="width:264px;float:left;"><input id="step2address" class="incomadd_sh" type="text" value="请输入或在地图上单击选择地址" onfocus="if (value =='请输入或在地图上单击选择地址'){value ='';}" onblur="if (value ==''){value='请输入或在地图上单击选择地址';}"/></p>
									<p style="width:60px;height:28px;float:left;"><a href="javascript:void(0)" class="searchcom" onclick="theLocation()"><span></span></a></p>
								</div>
								<input id="step2name" class="incomname" type="text" value="请输入联系人" onfocus="if (value =='请输入联系人'){value ='';}" onblur="if (value ==''){value='请输入联系人';}"/>
								<div style="margin-top: 15px;height:26px;">
									<p style="float:left;"><input id="step2phone" class="incomadd" type="text" value="请输入手机号" onfocus="if (value =='请输入手机号'){value ='';}" onblur="if (value ==''){value='请输入手机号';}" /></p>
									<p style="float:left;"><a class="phonecode" href="javascript:void(0)" onclick="getcode()">获取手机验证码</a></p>
								</div>
								<div style="margin-top: 15px;height:26px;">
									<input id="step2phonecode" class="incomadd" type="text" value="请输入验证码" onfocus="if (value =='请输入验证码'){value ='';}" onblur="if (value ==''){value='请输入验证码';}" />
								</div>
							</div>
							
							<div style="position: relative;">
								<div style="margin-top: 30px;">
									<p><strong>详细说明</strong></p>
									<textarea id="step2desc" class="textdesc" rows="" cols="" maxlength="600"></textarea>
								</div>
								
								<!-- 弹框提示 -->
								<div class="text_tips" style="display: none;">
									<i class="itl">◆<i>◆</i></i>
									<div class="text_tips_content">
										<p class="tt_bold">好的描述，让服务商更容易理解您的需求。</p>
										<dl class="tt_dl">
											<dt>我们为您提供以下建议：</dt>
											<div id="dl_content">
												<dd class="tt_dd" data-replacetpl="">
													<i>•</i> 工程具体情况：工程性质（新/改/扩/迁建）、占地面积、投入金额<br>
													<i>•</i> 具体要求：用途、效果等（排放达到**标准）<br>
													<i>•</i> <span style="color:red;">例：**公司在生产过程中有甲醛和VOCs废气产生，新建一套废气治理设施，预计投入金额3万元，占地20m2，要求处理后的废气能达到大气污染物综合排放二级标准。</span><br>
												</dd>
											</div>
										</dl>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 右边地图 -->
						<div class="map" style="float:right;width:470px;">
							<input id="step2mapx" type="hidden" />
							<input id="step2mapy" type="hidden" />
							<input id="provincename" type="hidden" />
							<input id="cityname" type="hidden" />
							<p style="display: block;margin-top: 80px;font-size: 12px;"><strong>请单击鼠标左键标注您的公司位置：</strong></p>
							<div style="width:410px;height:256px;margin-top:10px;margin-right:60px;background-color:rgba(128, 128, 64, 0.25);">
	                            <div style="width:410px;height:256px;border:#ccc solid 1px;font-size:12px" id="map"></div>
							</div>
						</div>
						
<!-- 						<div style="clear:both;"></div> -->
						
						<div style="position:absolute;left:360px;top:292px;">
								<p id="step2pnoerr" style="color:red;"></p>
						</div>
						
						<!-- 下边按钮 -->
						<div class="step2_pre_next" style="position: absolute;bottom: 30px;right:60px;display:none;">
							<p id="smalltips" style="color:red;margin-bottom: 10px;margin-left: 23px;"></p>
							<a id="step2pre" class="apre">&lt;上一步</a>
							<a id="step2next" class="anext">下一步&gt;</a>
						</div>
	               	</div>
               	</div>
               	
               	
               	<!-- 第三步：设置推荐服务 -->
               	<div id="step3" style="display:none">
	               	<!-- 进度提醒 -->
	               	<div class="process3">
	               	</div>
               		
               		<!-- 步骤内容 -->
               		<div class="step-content efficient">
<!-- 						<div style="margin-top: 25px;margin-left: 25px;font-size: 12px;"> -->
<!-- 							<p><strong>请选择推荐环保公司的数量和时间段：</strong></p> -->
<!-- 							<div style="margin-top: 35px;"> -->
<!-- 								<p><strong>请输入数量（5家之内）：（家/天）</strong></p> -->
<!-- 								<input id="step3num" type="number" style="text-indent: 5px;border: 1px solid #ccc" /><p style="color:red;"></p> -->
<!-- 							</div> -->
<!-- 							<div style="margin-top: 35px;"> -->
<!-- 								<p><strong>接收时间：</strong></p> -->
<!-- 								<input id="startTime" name="startTime" type="text" class="mh_date timeinput"> -->
<!-- 								&nbsp;~&nbsp; -->
<!-- 								<input id="endTime" name="endTime" type="text" class="mh_date timeinput"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div style="margin-top: 25px;margin-left: 25px;font-size: 12px;"> -->
<!-- 							<p><strong>请选择发布类型：</strong></p> -->
<!-- 							<div class="step3Type"> -->
<!-- 								<input type="checkbox" class="push"/><span>精准推送</span></br></br> -->
<!-- 								<input type="checkbox" class="showIndex"/><span>发往需求大厅</span> -->
<!-- 							</div> -->
<!-- 						</div> -->

						<h2>请选择您需要的服务:</h2>
						<div class="chooses">
							<div class="effective">
								<span class="The_first"></span>
								<p class="grade"></p>
								<p class="recommended">优蚁优质推荐</p>
								<span class="look_over">优蚁承诺24小时内，推荐优质环保公司响应您的需求优蚁承诺您的需求仅限提供给推荐的优质环保公司查看
								</span>
							</div>
							<div class="price_parity">
								<span class="The_second"></span>
								<p class="Efficient_figure"></p>
								<p class="Demand_hall">
									<a href="" class="foyer">需求大厅!</a>发布
								</p>
								<span class="pushing" style="">您的需求将推送至需求大厅，将有更多环保公司响应您的需求</span>
								<p style="width:380px;position: absolute;top:90px;left:38px;">
									<span style="width:175px;display:block;float:left;">请选择响应需求的环保公司家数</span>
									<input class="step3Input comSum" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
									<span class="promptt" style="display:none;position: absolute;right:43px;top:0;">(请完善选项信息)</span>
								</p>
								<p style="width:380px;clear:both;margin-top:12px;position: absolute;top:110px;left:38px;">
									<span style="width:175px;display:block;float:left;">请选择需求发布的有效天数</span>
									<input class="step3Input daySum" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
									<span class="prompt" style="display:none;position: absolute;right:43px;top:0;">(请完善选项信息)</span>
								</p>
							</div>
						</div>
						
						<!-- 下边按钮 -->
						<div style="position: absolute;bottom: 30px;right:60px;">
							<p id="step3tips" style="color:red;margin-bottom: 10px;"></p>
							<a id="step3pre" class="apre">&lt;上一步</a>
							<a id="step3next" class="anext">下一步&gt;</a>
						</div>
						    	
	               	</div>
               		
               	</div>
               	
               	
               	<!-- 第四步：确认需求并发布 -->
               	<div id="step4" style="display:none">
	               	<!-- 进度提醒 -->
	               	<div class="process4">
	               	</div>
	               	
	               	<!-- 步骤内容 -->
	               	<div class="step-content">
						<div style="margin-top: 25px;margin-left: 25px;font-size: 12px;">
							<p>
								<span id="step4needtype" style="font-size: 25px;font-weight: bold;color: #5EC520;"></span>
								<span>&nbsp;&nbsp;&nbsp;</span>
								<a class="bluecol">修改</a>
							</p>
							
							<p style="margin-top: 20px;">
								<span>联系手机：</span>
								<span id="step4phone"></span>
							</p>
							
							<div style="margin-top: 25px;">
								<HR style="border:1px dashed #a8a8a8;width:90%;">
							</div>
							
							<p style="margin-top: 30px;">
								<span class="fontw_bold">企业所属类型：</span>
								<span id="step4comtype"></span>
							</p>
							
							<p>
								<span class="fontw_bold">企业名称：</span>
								<span id="step4company"></span>
							</p>
							
							<p>
								<span class="fontw_bold">联系人：</span>
								<span id="step4name"></span>
							</p>
							
							<p>
								<span class="fontw_bold">位置：</span>
								<span id="step4address"></span>
							</p>
							
							<p>
								<span class="fontw_bold">需求详细信息：</span>
								<span id="step4desc"></span>
							</p>
							
						</div>
						
						<!-- 发布成功 -->
						<div id="fabusuccess" style="display:none;margin-top: 76px;margin-left: 25px;">
							<span style="color: #EE7800;font-size: 45px;">发布成功</span>
						</div>
						
						<!-- 下边按钮 -->
						<div id="step4bb" style="position: absolute;bottom: 30px;right:60px;">
							<p id="step4tips" style="color:red;margin-bottom: 10px;margin-left: 23px;"></p>
							<a id="step4pre" class="alastpre">&lt;上一步</a>
							<a id="step4ok" class="aok">确&nbsp;认&nbsp;发&nbsp;布</a>
						</div>
						          	
	               	</div>
               	
               	</div>
            
            </div>
            <!--主框架 end-->
            
            <!-- 弹框 -->
            <!-- 大遮罩 -->
			<div class="bigShade"></div>
			<div class="box ">
				<div class="box_title">提示</div>
				<div class="box_content">
					<p>需求发布成功</p>
				</div>
				<div class="box_bottom">
					<a class="box_bottom_a box_cancel">确定</a>
				</div>
			</div>
		</div>
		<!--中间部分 end-->

		
		<!-- 引入尾部 -->
		<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
		<!--右侧悬窗 start-->
		<%@ include file="/WEB-INF/views/include/footer_ad_home.jsp"%>
		<!--右侧悬窗 end-->
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
		
		<script type="text/javascript">
        	$(document).ready(function(){
        		//页面一加载执行
    			$("#companychoosed").html("生产型企业");
    			$("#step4comtype").html("生产型企业");
        		$("#step2").hide();
        		var tody = getNowFormatDate();
        		$("#startTime").val(tody);
        		
        		//公司类型选择
        		$(".typelist li a").mouseover(function(){
        			$(".typelist li a").attr("class","company-type");
        			$(this).attr("class","company-selected");
        			$("#lia004 span").eq(0).css("background","url(${ctxStatic}/img/llhb/zhuanjia_1.png) no-repeat");
        			$("#lia005 span").eq(0).css("background","url(${ctxStatic}/img/llhb/kefu_1.png) no-repeat");
        			
        			if($(this).attr("id") == "lia001"){
        				hideAllRightContent();
        				$("#rightcontent01").show();
        			}
        			
					if($(this).attr("id") == "lia002"){
						hideAllRightContent();
        				$("#rightcontent02").show();
        			}
        			
					if($(this).attr("id") == "lia003"){
						hideAllRightContent();
        				$("#rightcontent03").show();
					}
        			
        			if($(this).attr("id") == "lia004"){
        				$("#lia004 span").eq(0).css("background","url(${ctxStatic}/img/llhb/zhuanjia_2.png) no-repeat");
        				hideAllRightContent();
        				$("#rightcontent04").show();
        			}
        			
        			if($(this).attr("id") == "lia005"){
        				$("#lia005 span").eq(0).css("background","url(${ctxStatic}/img/llhb/kefu_2.png) no-repeat");
        				hideAllRightContent();
        				$("#rightcontent05").show();
        			}
        			
        			var cc = $(this).text();
        			var dd = cc.substring(2,cc.length);
        			$("#companychoosed").html(dd);
        			$("#step4comtype").html(dd);
        		
        		});
        		
        		//隐藏第一步右边所有内容
        		function hideAllRightContent(){
        			$("#rightcontent01").hide();
    				$("#rightcontent02").hide();
    				$("#rightcontent03").hide();
    				$("#rightcontent04").hide();
    				$("#rightcontent05").hide();
        		}
        		
        		//隐藏所有步骤
        		function hideAllStep(){
        			$("#step1").hide();
        			$("#step2").hide();
        			$("#step3").hide();
        			$("#step4").hide();
        		}
        		
        		//第一步跳到第二步
        		$(".category li").click(function(){
        			var tc = $(this).text();
        			$("#typechoosed").html(tc);
        			$("#step4needtype").html(tc);
        			
        			hideAllStep();
        			$("#step2").show();
        			backtop();
        			setProcessBg($(".process2"),"-100px");
        			$(".step2_pre_next").css("display","block")
        		});
        		
        		//第二步返回第一步(修改)
        		$("#step2pre,.bluecol").click(function(){
        			hideAllStep();
        			$("#step1").show();
        			backtop();
        			setProcessBg($(".process1"),"0");
        		});
        		
        		//第二步跳到第三步
        		$("#step2next").click(function(){
        			var step2desc = $("#step2desc").val();
        			var step2address = $("#step2address").val();
        			var step2name = $("#step2name").val();
        			var step2company = $("#step2company").val();
        			var step2phone = $("#step2phone").val();
        			
        			var step2phonecode = $("#step2phonecode").val();
        			var step2mapx = $("#step2mapx").val();
        			var step2mapy = $("#step2mapy").val();
        			
        			if(step2mapx == "" || step2mapy == ""){
        				$("#smalltips").html("请在地图单击左键确认公司地址");
        				return;
        			}
        			
        			if(step2desc == "" || step2address=="" || step2name == ""
        					|| step2company =="" || step2phone == "" || step2phonecode ==""){
        				$("#smalltips").html("请完善信息");
        				return;
        			}
        			
        			//校验验证码
        			//telcode(step2phone,step2phonecode);
        			telcode(step2phone,step2phonecode,step2desc,step2address,step2name,step2company,step2phone);
        			setProcessBg($(".process3"),"-200px");
        		});
        		
        		
        		//第三步返回第二步
        		$("#step3pre").click(function(){
        			$(".calender").hide();//隐藏日历框
        			hideAllStep();
        			$("#step2").show();
        			backtop();
        			setProcessBg($(".process2"),"-100px");
        		});
        		
        		//第三部跳到第四步(跳过)，不验证数据
        		$("#step3skip").click(function(){
        			$(".calender").hide();//隐藏日历框
        			hideAllStep();
        			$("#step4").show();
        			backtop();
        			setProcessBg($(".process4"),"-295px");
        		});
        		
        		//第三部跳到第四步(下一步)
        		$("#step3next").click(function(){
        			var step3ShowIndex=$(".showIndex").is(':checked');
					var step3Push=$(".push").is(':checked');
					if(step3ShowIndex||step3Push){
						$("#step3tips").html("");
	        			hideAllStep();
	        			$("#step4").show();
	        			backtop();
					}else{
						$(".step3tips").html("请选择发布类型！");
					}
					setProcessBg($(".process4"),"-295px");
        		});
        		
        		//第四步返回第三步
        		$("#step4pre").click(function(){
        			hideAllStep();
        			$("#step3").show();
        			backtop();
        			setProcessBg($(".process3"),"-200px");
        		});
        		
        		//第四部确认发布
        		function okclick(){
        			$("#step4ok").off("click",okclick);
        			$("#step4ok").css("cursor","not-allowed");
        			var companychoosed = $("#companychoosed").html();
        			var typechoosed = $("#typechoosed").html();
        			var step2desc = $("#step2desc").val();
        			var step2address = $("#step2address").val();
        			var step2name = $("#step2name").val();
        			var step2company = $("#step2company").val();
        			var step2phone = $("#step2phone").val();
        			var step2mapx = $("#step2mapx").val();
        			var step2mapy = $("#step2mapy").val();
        			var step2province = $("#provincename").val();
        			var step2city = $("#cityname").val();
        			var step3DaySum=$(".daySum").val();
        			var step3ComSum=$(".comSum").val();
        			
					var step3Type=0;
					if(first_state&&second_state){
						step3Type=2;
					}else if(second_state){
						step3Type=0;
					}else if(first_state){
						step3Type=1;
					}
        			
        			$.ajax({
        				type:"POST",
        				url:"${ctx}/addNeed/saveNeed",
        				data:{
        					companytype:companychoosed,
        					enprotype:typechoosed,
        					desc:step2desc,
        					address:step2address,
        					name:step2name,
        					company:step2company,
        					phone:step2phone,
        					mapx:step2mapx,
        					mapy:step2mapy,
        					provincename:step2province,
        					cityname:step2city,
        					step3Type:step3Type,
        					step3ComSum:step3ComSum,
        					step3DaySum:step3DaySum
        				},
        				dataType:"text",
        				success: function(data){
        					if(data == "ok"){
        						$("#fabusuccess").show();
        						$("#step4needtype").next().next().html("");
        						$("#step4bb").hide();
        						
        						boxShow(".box");
        						setTimeout("window.open('${ctx}/supply-demand','_self')", 5000);
        						
        					}else{
        						$("#step4ok").on("click",okclick);
        						$("#step4ok").css("cursor","pointer");
        						$("#step4tips").html(data);
        					}
        				}
        				
        			});
        		}
        		
        		$("#step4ok").on("click",okclick);
        		
        		//打开弹出框公用方法
        		function boxShow(selector){
        			var wh = $(window).height();
        			var ww = $(window).width();
        			var top = (wh - $(selector).height())/2;
        			var left = (ww - $(selector).width())/2;
        			$(selector).css("top",top);
        			$(selector).css("left",left);
        			$(selector).show();
        			$(".bigShade").show();
        		}
        		
        		$(".box_cancel").click(function(){
        			window.open("${ctx}/supply-demand","_self");
        		});
        		
        		//回到顶部
        		function backtop(){
        			//document.documentElement.scrollTop = document.body.scrollTop =0;
        			$("html,body").animate({scrollTop:$(".nd_header").offset().top},100);
        		}
        		
	            function telcode(tel,code,step2desc,step2address,step2name,step2company,step2phone){
	           	  if($.trim(tel)==""||$.trim(code)==""){
	           		  $("#smalltips").html("请填写手机号和验证码");
	           	  }else{
	           		  $.ajax({
	       	 				type : "POST",
	       	 				url : "${ctx}/checkCode",
	       	 				data : "tel=" + tel+"&checkCode="+code,
	       	 				dataType : 'text',
	       	 				success : function(data) { 
	       	 					if(data == "ok"){
	       	 						//debugger;
	       	 						$("#smalltips").html("");

		       	 					$("#step4desc").html(step2desc);
		       	        			$("#step4address").html(step2address);
		       	        			$("#step4name").html(step2name);
		       	        			$("#step4company").html(step2company);
		       	        			$("#step4phone").html(step2phone);
		       	        			
		       	        			hideAllStep();
		       	        			$("#step3").show();
		       	        			backtop();
	       	 						
	       	 					}else{
	       	 						$("#smalltips").html(data);
	       	 					}
	       	 				}
	                	});
	           	  	}
	           	}
	            
	            //获取当前日期，格式：yyyy-MM-dd
	            function getNowFormatDate() {
	    		    var date = new Date();
	    		    var seperator1 = "-";
	    		    var year = date.getFullYear();
	    		    var month = date.getMonth() + 1;
	    		    var strDate = date.getDate();
	    		    if (month >= 1 && month <= 9) {
	    		        month = "0" + month;
	    		    }
	    		    if (strDate >= 0 && strDate <= 9) {
	    		        strDate = "0" + strDate;
	    		    }
	    		    var currentdate = year + seperator1 + month + seperator1 + strDate;
	    		    return currentdate;
	    		}
	            
	            $("#step3num,.incomname,.incomadd_sh,.incomadd,.timeinput").focus(function(){
	            	$(this).css("border-color","#5EC520");
	            });
	            
	            $(".textdesc").focus(function(){
	            	$(this).css("border-color","#5EC520");
	            	$("#dl_content").empty();
	            	
	            	var typestr = $("#typechoosed").text();
	            	if(typestr == "环评编写"){
	            		var $dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            			'<i>•</i> 明确项目的具体情况：如建设性质（新/改/扩/迁建）、占地面积、投资金额、生产工艺或产品情况<br>'+
	            			'<i>•</i> <span style="color:red;">例：**鞋厂想扩建增加一条生产线，占地1000m2，投资50万元，主要利用烤漆工序，生产鞋子。</span><br>'+
	            			'</dd>');
	            		$("#dl_content").append($dl_con);
	            		var $dl_con="";
	            	}else if(typestr == "环保工程"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 工程具体情况：工程性质（新/改/扩/迁建）、占地面积、投入金额<br>'+
	            				'<i>•</i> 具体要求：用途、效果等（排放达到**标准）<br>'+
	            				'<i>•</i> <span style="color:red;">例：**公司在生产过程中有甲醛和VOCs废气产生，新建一套废气治理设施，预计投入金额3万元，占地20m2，要求处理后的废气能达到大气污染物综合排放二级标准。</span><br>'+
	            			'</dd>');
	            	}else if(typestr == "环境监测"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 工程具体情况：检测类别（废水/废气/噪声或其他）、检测点数、污染物种类。<br>'+
	            				'<i>•</i> 具体要求：用途、效果等（用于验厂、排污年审等等）<br>'+
	            				'<i>•</i> <span style="color:red;">例：**公司，废气检测，2个排放口，主要检测污染物有苯、甲苯、二甲苯、VOCs，监测报告用于验厂使用。</span><br>'+
	            			'</dd>');
	            	}else if(typestr == "项目验收"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 明确项目的具体情况：如建设性质（新/改/扩/迁建）、占地面积、投资金额、生产工艺或产品情况、环评审批情况。<br>'+
	            				'</dd>');
	            	}else if(typestr == "清洁生产"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 明确项目的具体情况：如行业类别、占地面积、投资金额、生产工艺或产品情况、环评审批和验收情况。<br>'+
	            				'<i>•</i> 具体要求：用途、效果等（政策要求、申请补贴）<br>'+
	            				'</dd>');
	            	}else if(typestr == "节能改造"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 需要改造的内容，改造原因，达到效果<br>'+
	            				'</dd>');
	            	}else if(typestr == "危废服务"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 危废产生的情况：危废种类及其代码、各危废产生数量<br>'+
	            				'<i>•</i> 具体要求：用途、效果等<br>'+
	            				'</dd>');
	            	}else if(typestr == "应急预案"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 目的，其他要求<br>'+
	            				'</dd>');
	            	}else if(typestr == "招标"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i> 项目具体情况：招标项目名称、地址、招标内容<br>'+
	            				'</dd>');
	            	}else if(typestr == "其他需求"){
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i>请尽量仔细描述您的需求<br>'+
	            				'</dd>');
	            	}else{
	            		$dl_con = $('<dd class="tt_dd" data-replacetpl="">'+
	            				'<i>•</i>请尽量仔细描述您的需求<br>'+
	            				'</dd>');
	            	}
	            	
	            	$("#dl_content").append($dl_con);
	            	$(".text_tips").show();
	            	
	            });
	            
	            $(".textdesc").blur(function(){
	            	$(this).css("border-color","#ccc");
	            	$(".text_tips").hide();
	            });
	            
	            $("#step3num").blur(function(){
	            	$(this).css("border-color","#ccc");
	            	var num = $(this).val();
	            	if(num > 30 || num < 0){
	            		$(this).next().html("请输入大于0小于30的数字");
	            	}else{
	            		$(this).next().html("");
	            	}
	            });
	            
	            $("#step2name,.incomadd_sh,.incomadd,.timeinput").blur(function(){
	            	$(this).css("border-color","#ccc");
	            });
	            
	            $("#step2phone").blur(function(){
	            	$(this).css("border-color","#ccc");
	            });
	            
	            $("#step2company").blur(function(){
	            	$(this).css("border-color","#ccc");
	            	var city = $(this).val();
	            	getAddressByKw(city);
	            });
	            
	            $(".mh_date").on("keydown", function(){
	            	return false;
	            });
	            
	            //日期比较（yyyy-MM-dd）
	            function dateCompare(stime, etime) {
	                var arr = stime.split("-");
	                var starttime = new Date(arr[0], arr[1], arr[2]);
	                var starttimes = starttime.getTime();

	                var arrs = etime.split("-");
	                var endtime = new Date(arrs[0], arrs[1], arrs[2]);
	                var endtimes = endtime.getTime();

	                if (starttimes > endtimes) {
	                    return false;
	                }else{
	                    return true;
	                }
	            }
	            
        	});
        	
        	var time_on = true;//验证码
            var timer = null;
        	//验证码倒计时
            function getcode() {
                var tel = $("#step2phone").val();
                if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
                    $("#step2pnoerr").html("请输入正确的手机号码");
                    return;
                } else {
                	$("#step2pnoerr").html("");
                    if (time_on) {
                        var time = 60;
                        clearInterval(timer);
                        $(".phonecode").css({background: "#CCCCCC", color: "#666666"});
                        $(".phonecode").html("重新获取(" + time + ")");
                        timer = setInterval(function () {
                            time--;
                            $(".phonecode").html("重新获取(" + time + ")");
                            if (time > 0) {
                                time_on = false;
                                return;
                            } else {
                                clearInterval(timer);
                                $(".phonecode").html("重新获取");
                                $(".phonecode").css({background: "#5EC520", color: "#FFFFFF"});
                                time_on = true;
                            }
                        }, 1000);

                    }

                    $.ajax({
                        type: "POST",
                        url: "${ctx}/conn",
                        data: "tel=" + tel,
                        dataType: 'text',
                        success: function (data) {
                            //showMess(data);
                            return;
                        }
                    });
                }

            }
    	</script>
		
		<script type="text/javascript">
		    //创建和初始化地图函数：
		    function initMap(){
		      createMap();//创建地图
		      setMapEvent();//设置地图事件
		      addMapControl();//向地图添加控件
		      addMapOverlay();//向地图添加覆盖物
		    }
		    function createMap(){ 
		      map = new BMap.Map("map"); 
		      map.centerAndZoom(new BMap.Point(113.759525,23.021808),13);
		    }
		    function setMapEvent(){
		      map.enableScrollWheelZoom();
		      map.enableKeyboard();
		      map.enableDragging();
		      map.enableDoubleClickZoom();
		    }
		    function addClickHandler(target,window){
		      target.addEventListener("click",function(){
		        target.openInfoWindow(window);
		      });
		    }
		    function addMapOverlay(){
		    }
		    //向地图添加控件
		    function addMapControl(){
		      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		      map.addControl(scaleControl);
		      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		      map.addControl(navControl);
		    }
		    
		    var map;
		    initMap();
		    
		    var geoc = new BMap.Geocoder();  
		    function showInfo(e){
		    	map.clearOverlays();
		    	var pt = e.point;
				geoc.getLocation(pt, function(rs){
					var addComp = rs.addressComponents;
					//alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
					var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
					$("#step2address").val(address);
					$("#provincename").val(addComp.province);
					$("#cityname").val(addComp.city);
				}); 
		    	var x = e.point.lng;
		    	var y = e.point.lat;
		    	$("#step2mapx").val(x);
		    	$("#step2mapy").val(y);
				var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)); // 创建点
				map.addOverlay(marker);
				
			}
			map.addEventListener("click", showInfo);
			
			function getAddressByKw(city){
				if(city != ""){
                    map.centerAndZoom(city,11);      // 用城市名设置地图中心点
                }
                var local = new BMap.LocalSearch(map, {
                    renderOptions:{map: map}
                });
                local.search(city);
			}
			
		    function theLocation(){
                var city = $("#step2address").val();
                getAddressByKw(city);
            }
		    
		    function setProcessBg(stepEl,topValue){
		    	$(".process").removeClass(".processBg");
		    	stepEl.addClass("processBg");
		    	stepEl.css("background-position","0 "+topValue);
		    }
		    
		    //第三步选中事件
			var first_state = false;
			var second_state = false;
			$('.The_first').click(function(){
				if(first_state == false){
					$(this).css("background-position","0 0");
					$(this).siblings('.grade').css("background-position","0 -356px");
					$(this).siblings().css("color","#fff");
					$(this).siblings('.recommended').css("color","#fff");
					first_state = true;
				}else{
					$(this).css("background-position","0 -18px");
					$(this).siblings('.grade').css("background-position","0 0");
					$(this).siblings().css("color","#000");
					$(this).siblings('.recommended').css("color","#008f00");
					first_state = false;
				}
			});
			$('.The_second').click(function(){
				if(second_state == false){
					$(this).css("background-position","0 0");
					$(this).siblings('.Efficient_figure').css("background-position","0 -500px");
					$(this).siblings().css("color","#fff");
					$(this).siblings('.recommended').css("color","#fff");
					$(this).siblings('.Demand_hall').children().css("color","#fff");
					second_state = true;
				}else{
					$(this).css("background-position","0 -18px");
					$(this).siblings('.Efficient_figure').css("background-position","0 -144px");
					$(this).siblings().css("color","#000");
					$(this).siblings('.Demand_hall').children().css("color","#008f00");
					$(this).siblings('.Demand_hall').css("color","#008f00");
					$(this).siblings('.recommended').css("color","#008f00");
					second_state = false;
				}
			});
		    
		    window.onload=function(){
		    	//解决ie7兼容性问题
		    	if($(".step-content .map").length==0){
				    $(".userMsg").after($(".map"));
		    	}
		    	if($(".step-content .step2_pre_next").length==0){
		    		$(".step-content").append($(".step2_pre_next"));
		    	}
		    };
  	</script>
<!-- JOEDER新增加的发布需求第三步流程即"下一步按钮"的验证 -->
	<script type="text/javascript">
	$('#step3next').click(function(){
		if($(".pull_down1 option:selected").val() == ""){
			$(".promptt").css("color","red");
			$(".promptt").css("display","block");
			alert('请完善您的选项信息');
			selected = true;
		}else{
			$(".promptt").css("display","none");
			selected = false;
		}
	});
	$('#step3next').click(function(){
		if($(".step3Input").val() == ""){
			$(".prompt").css("color","red");
			$(".prompt").css("display","block");
			alert('请完善您的选项信息');
			selected = true;
		}else{
			$(".prompt").css("display","none");
			selected = false;
		}
	});
	$(".category li").hover(function(){
    $(this).children(".sewage").show();
    $(this).siblings().children(".sewage").hide();
    
},function(){
	$(this).children(".sewage").hide();
});
	</script>	
	</body>
</html>