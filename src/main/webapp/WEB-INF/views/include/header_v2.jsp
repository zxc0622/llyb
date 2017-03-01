<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="net.sf.json.JSONArray"%>
<%@ page language="java" import="net.sf.json.JSONObject"%>
<%@ page language="java"
	import="com.qdum.llhb.productmana.ProdTypeUtils"%>
<%@ page language="java"
	import="com.qdum.llhb.common.service.HeaderService"%>
<%
	HeaderService.initHeaderInfo(request);
%>
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/v2/index.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/v2/header.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic }/layui/css/layui.css" />
<div id="top">
	<div id="top_main">
		<ul class="topu">
			<c:if test="${loginSta==1 }">
				<li style="width: auto;"><a href="/llhb/home">进入我的首页</a></li>
			</c:if>
			<c:if test="${loginSta!=1 }">
				<li><a href="/llhb/login">请登录<span
						style="padding: 5px; color: #000;">|</span>
				</a></li>
				<li class="xuan"><a href="/llhb/reg" class="aa">免费注册 <!-- 将二维图添加进a标签里 -->
				</a></li>
			</c:if>

		</ul>
		<div id="hello">
			<span>服务热线：${servicePhone }</span>
		</div>
		<div class="topright">
			<ul>
				<li class="kefu">
					<div class="cun">
						<div class="a1">
							<a href="http://www.yyhb365.com/youyi/vip-service.html"
								style="margin-left: 0;"><div class="kefuhide moblie">
									<span>会员入驻</span>
									<div class="downjian1"></div>
								</div> </a>
						</div>
					</div>
				</li>
				<li class="kefu">
					<div class="cun">
						<div class="a1">
							<div class="kefuhide moblie">
								<span>关注优蚁</span>
								<div class="downjian1"></div>
								<img src="${ctxStatic }/img/v2/index/erwma.jpg">
							</div>
						</div>
					</div>
				</li>
				<li class="kefu">
					<div class="cun">
						<div class="a1">
							<div class="kefuhide moblie">
								<span>手机优蚁</span>
								<div class="downjian1"></div>
								<img src="${ctxStatic }/img/v2/index/erwma.jpg">
							</div>
						</div>
					</div>
				</li>
				<li class="wangzhan">
					<div class="cun">
						<span>联系我们</span>
						<div class="downjian1"></div>
					</div>
					<div class="wangzhanhide" style="width: 114px; height: 120px;">
						<div class="tese">
							<span>自助栏目</span>
						</div>
						<div class="tesemain" style="height: 26px;">
							<a href="${ctx}/platform/helpCenter">自助服务</a>
						</div>
						<div class="tese">
							<span>客服热线</span>
						</div>
						<div class="tesemain2">
							<a href="" style="color: #008f00;">${servicePhone }</a>
						</div>
					</div>
				</li>
				<li class="wangzhan">
					<div class="cun">
						<span>网站导航</span>
						<div class="downjian1"></div>
					</div>
					<div class="wangzhanhide hide_add">
						<div class="tese tese1">
							<span>特色栏目</span>
						</div>
						<div class="tesemain"
							style="width: 152px; margin-left: 0; border-bottom: 0;">
							<ul>
								<li><a href="${ctx}/supply-demand">环保供求</a>
								</li>
								<li><a href="${ctx}/mall">环保商城</a></li>
								<li><a href="${ctx}/EntLib">企业库 </a></li>
								<!-- <li><a href="${ctx}/quote">环保报价</a></li> -->
								<li><a
									href="${ctx}/news/environmental-information">环保动态</a>
								</li>
								<li><a href="${ctx}/news/knowledge">环保知识</a>
								</li>
								<li><a
									href="${ctx}/news/exhibition-information">展会信息</a>
								</li>
								<li><a href="${ctx}/platform/indexIconInit">网站特色</a>
								</li>
								<li><a href="${ctx}/hazardous-wastes">危废服务</a>
								</li>
								<li><a href="${ctx}/platform/helpCenter">帮助中心</a>
								</li>
								<li><a href="${ctx}/platform/aboutUsInit">关于我们</a>
								</li>
								<li><a href="${ctx}/platform/platformInit">平台介绍</a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<c:if test="${isIndex==1 }">
	<ul id="LoutiNav">
		<li class="active"><i>1F</i><span>环保<br>专题
		</span></li>
		<li><i>2F</i><span>环保<br>顾问
		</span></li>
		<li><i>3F</i><span>明星<br>案列
		</span></li>
		<li><i>4F</i><span>资讯<br>信息
		</span></li>
		<li><i>5F</i><span>优质<br>企业
		</span></li>
		<li><i>6F</i><span>环保<br>商城
		</span></li>
		<li><i>7F</i><span>人才<br>招聘
		</span></li>
	</ul>
	<div class="nav_right">
		<ul>
			<li
				onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&amp;userId=21364156', 
				'_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">
				<a href="javascript:void(0)" class="consul_ting"> <span
					style="display: block; width: 48px; margin: 0 auto; padding-top: 38px;">在线咨询</span>
			</a>
			</li>
			<li><a href="http://www.yyhb365.com/youyi/vip-service.html"
				class="consul_ting2" target="_blank"> <span
					style="display: block; width: 48px; margin: 0 auto; padding-top: 38px;">会员入驻</span>
			</a></li>
			<li><a href="${ctx }/quote" class="consul_ting3" target="_blank">
					<span
					style="display: block; width: 48px; margin: 0 auto; padding-top: 38px;">环保报价</span>
			</a></li>
			<li style="border-bottom: 1px solid #ccc;">
				<p class="consul_ting4" onclick="return_top()">
					<span
						style="display: block; width: 48px; text-align: center; margin: 0 auto; padding-top: 38px;">TOP</span>
				</p>
			</li>
		</ul>
	</div>
</c:if>
<!-- 搜索区域开始 -->
<div id="header">
	<div id="serach">
		<div class="header_logo">
			<a href="${ctx}/index"><img src="${ctxStatic}/img/v2/index/logo.gif"
				alt="" /></a> <img src="${ctxStatic}/img/v2/index/eye.png"
				class="eye eye_left" alt=""> <img
				src="${ctxStatic}/img/v2/index/eye.png" class="eye eye_right" alt="">
			<img src="${ctxStatic}/img/v2/index/ant1_left.png"
				class="ant ant_left" alt=""> <img
				src="${ctxStatic}/img/v2/index/ant1_right.png" class="ant ant_right"
				alt="">
		</div>
		<!--搜索开始 -->
		<div class="jq22-search-form">
			<div id="search-bd" class="search-bd">
				<ul>
					<li class="selected" biaoji="0">企业库<span
						style="padding: 0 10px 0 15px">|</span></li>
					<li biaoji="1">环保需求<span style="padding: 0 10px 0 15px">|</span>
					</li>
					<li biaoji="2">商城<span style="padding: 0 10px 0 15px">|</span>
					</li>
					<li biaoji="3">资讯</li>
				</ul>
			</div>
			<div id="search-hd" class="search-hd">
				<div class="search-bg"></div>
				<input type="text" id="s1" class="search-input"> <input
					type="text" id="s2" class="search-input"> <input
					type="text" id="s3" class="search-input"> <input
					type="text" id="s4" class="search-input"> <span
					class="s1 pholder">请输入企业名称</span> <span class="s2 pholder">请输入环保需求信息</span>
				<span class="s3 pholder">请输入环保设备、原料、服务名称</span> <span
					class="s4 pholder">请输入资讯关键词</span>
				<button id="submit" class="btn-search" value="搜索">搜 索</button>
			</div>
		</div>
		<!--搜索end -->
		<div class="myjd">
			<div class="mytu"></div>
			<a href="${ctx}/addNeed" target="_blank"
				style="font-size: 18px; width: 145px; text-align: center; margin: 0; line-height: 40px;">发布环保需求</a>
			<div class="jiantou"></div>
			<!-- 发布需求弹出框start -->
			<div class="require-box">
				<p class="rb-p1">发布您的环保需求，坐等环保顾问为您解决！</p>
				<div class="rb-item">
					<div class="rb-inoneline rb-imgdiv"
						style="background: url(${ctxStatic}/img/v2/index/all.png);background-position:0 -85px;"></div>
					<div class="rb-inoneline rb-word">
						<p class="rb-p2">需求发布后</p>
						<p class="rb-p3">30分钟内环保顾问主动联系您</p>
					</div>
				</div>

				<div class="rb-item">
					<div class="rb-inoneline rb-imgdiv"
						style="background: url(${ctxStatic}/img/v2/index/all.png);background-position:0 -132px;"></div>
					<div class="rb-inoneline rb-word">
						<p class="rb-p2">每个需求</p>
						<p class="rb-p3">至少3家环保公司参与报价</p>
					</div>
				</div>

				<div class="rb-item">
					<div class="rb-inoneline rb-imgdiv"
						style="background: url(${ctxStatic}/img/v2/index/all.png);background-position:0 -179px;"></div>
					<div class="rb-inoneline rb-word">
						<p class="rb-p2">98%的需求</p>
						<p class="rb-p3">得到了圆满解决</p>
					</div>
				</div>

				<div class="rb-item">
					<div class="rb-inoneline rb-imgdiv"
						style="background: url(${ctxStatic}/img/v2/index/all.png);background-position:0 -226px;"></div>
					<div class="rb-inoneline rb-word">
						<p class="rb-p2">所有需求</p>
						<p class="rb-p3">不向企业收取任何服务费</p>
					</div>
				</div>

				<a style="width: 224px; height: 42px; background-color: #EF7800;"
					class="rb-a" onclick="window.open('${ctx}/addNeed');">立即发布环保需求</a>

			</div>
			<!-- 发布需求弹出框end -->
		</div>
		<div class="gouwuche">
			<a target="_blank"
				href="http://www.yyhb365.com/youyi/authority-special.html">
				<p style="text-align: center;">
					<img src="${ctxStatic}/img/v2/index/country.png">
				</p> <span style="font-size: 16px; color: #008f00;">国家试点单位</span>
			</a>
		</div>

	</div>
	<!-- 搜索区域结束 -->

	<div
		style="width: 100%; height: 40px; border-bottom: 2px solid #008f01">
		<div id="daohang">
			<div class="dhleft">
				<a href="${ctx}/mall" target="_blank">全部商品分类</a>
				<c:if test="${isIndex==1 }">
					<!--新增左侧栏 -->
					<div class="erjimenu">
						<ul>
							<%
								String prodType = ProdTypeUtils.getProdType();
									JSONArray t0 = JSONArray.fromObject(prodType);
									JSONObject t0Jso;
									JSONArray t1;
									JSONObject t1Jso;
									JSONArray t2;
									JSONObject t2Jso;
									int i = 1;
									for (Object t0Obj : t0) {
										request.setAttribute("index", i);
										t0Jso = JSONObject.fromObject(t0Obj);
										t1 = JSONArray.fromObject(t0Jso.get("childrens"));
										request.setAttribute("t1", t1);
										request.setAttribute("t0Jso", t0Jso);
							%>
							<li class="li${index }">
								<div class="mulu">
									<a href="${ctx }/mall?typeFirst=${t0Jso.get('id')}"
										target="_blank"></a> <span>${t0Jso.get('name')}</span>
								</div>
								<div class="hidemenu${(index-1)==0?'':(index-1) }">
									<div class="hideleft">
										<%
											for (Object t1Obj : t1) {
														t1Jso = JSONObject.fromObject(t1Obj);
														t2 = JSONArray.fromObject(t1Jso.get("childrens"));
														request.setAttribute("t2", t2);
														request.setAttribute("t1Jso", t1Jso);
										%>
										<dl class="dl3">
											<div style="width: 84px; float: left; margin-right: 10px;">
												<dt>
													<a href="${ctx }/mall/${t1Jso.get('id') }" target="_blank">${t1Jso.get('name')
														}</a>
												</dt>
											</div>
											<div style="width: 683px; float: left;">
												<%
													for (Object t2Ojb : t2) {
																	t2Jso = JSONObject.fromObject(t2Ojb);
																	request.setAttribute("t2Jso", t2Jso);
												%>
												<dd>
													<a
														href="${ctx }/mall/${t1Jso.get('id') },${t2Jso.get('id') }"
														target="_blank">${t2Jso.get('name') }</a>
												</dd>
												<%
													}
												%>
											</div>
										</dl>
										<%
											}
										%>
									</div>
									<div class="hideright">
										<!-- 
										<div class="phoneplan"></div>
										<dt>推荐品牌</dt>
										<ul>
											<li><a href="">苹果</a>
											</li>
											<li><a href="">尼康</a>
											</li>
											<li><a href="">努比亚</a>
											</li>
											<li><a href="">酷派</a>
											</li>
											<li><a href="">卡西欧</a>
											</li>
											<li><a href="">中国电信</a>
											</li>
											<li><a href="">佳能</a>
											</li>
										</ul>
										<div class="tu2">
											<a href=""><img width="194px" height="70px"
												src="${ctxStatic }/img/v2/index/b7.jpg" alt="" /> </a>
										</div>
										<div class="tu1">
											<a href=""><img width="194px" height="70px"
												src="${ctxStatic }/img/v2/index/b8.jpg" alt="" /> </a>
										</div>
										-->
									</div>
								</div>
							</li>
							<%
								i++;
									}
							%>
						</ul>
					</div>
					<!--新增左侧栏end -->
				</c:if>
			</div>
			<div class="dhright">
				<ul class="Nav_right">
					<li>
						<a url="${ctx}/index" href="javascript:void(0);" style="color: #008e00">首页</a>
					</li>
					<li>
						<a url="${ctx}/evmAdvisor" href="javascript:void(0);">环保顾问</a>
					</li>
					<li>
						<a url="${ctx}/hazardous-wastes" href="javascript:void(0);">危废服务</a>
					</li>
					<li>
						<a url="${ctx}/supply-demand" href="javascript:void(0);">环保需求</a>
					</li>
					<li>
						<a url="${ctx}/mall" href="javascript:void(0);">环保商城</a>
					</li>
					<li>
						<a url="${ctx}/EntLib" href="javascript:void(0);">企业库</a>
					</li>
					<!-- <li><a url="${ctx}/quote" href="javascript:void(0);">环保报价</a></li> -->
					<li>
						<a url="${ctx}/news" href="javascript:void(0);">资讯</a>
					</li>
					<li></li>
					<li></li>
				</ul>
				<c:if test="${isQuote==1 }">
					<!-- 环保报价子页 start -->
					<div class="price_shop">
						<div class="hd">
							<span id="hp" class="current" typeValue="0">环评报价</span> <span id="jc"
								typeValue="1">监测报价</span>
						</div>
						<div class="bd">
							<ul class="cur">
								<p class="title">一站式环评服务，尽在优蚁环保</p>
								<li><input class="name" name="name" type="text"
									value="您的名称" onfocus="if (value =='您的名称'){value =''}"
									onblur="if (value ==''){value='您的名称'}"
									style="width: 214px; height: 34px; color: #369100; background-color: #e5f4e5; border: 0; padding-left: 14px;" />
									<input class="tel" name="tel" type="text" value="您的电话"
									onfocus="if (value =='您的电话'){value =''}"
									onblur="if (value ==''){value='您的电话'}"
									style="width: 214px; height: 34px; color: #369100; background-color: #e5f4e5; border: 0; padding-left: 14px;" />
									<input class="comp_name" name="comp_name" type="text"
									value="公司名称" onfocus="if (value =='公司名称'){value =''}"
									onblur="if (value ==''){value='公司名称'}"
									style="width: 214px; height: 34px; color: #369100; background-color: #e5f4e5; border: 0; padding-left: 14px;" />
									<input class="remarks" name="remarks" type="text"
									value="备注信息(选填)" onfocus="if (value =='备注信息(选填)'){value =''}"
									onblur="if (value ==''){value='备注信息(选填)'}"
									style="width: 214px; height: 34px; color: #369100; background-color: #e5f4e5; border: 0; padding-left: 14px;" />
									<select class="prov" style="margin-right: 6px;">
										<option value="">省</option>
										<c:forEach var="province" items="${provinceList }">
											<c:choose>
												<c:when test="${oriProId eq province.id}">
													<option value="${province.id}" selected>${province.name}</option>
												</c:when>
												<c:otherwise>
													<option value="${province.id}">${province.name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
								</select> <select class="city">
										<option value="">市/区</option>
								</select> <a href="javascript:void(0)" class="Apply_Now">立即申请</a></li>
							</ul>
						</div>
					</div>
					<!-- 环保报价子页 end -->
				</c:if>

				<c:if test="${isIndex==1 }">
					<!--头部右边登录-->
					<div class="inside_right">
						<p class="shalom">
							<b style="margin-right: 25px;">您好!</b><span>欢迎来到优蚁环保网</span>
						</p>
						<div class="top_login">
							<c:if test="${loginSta==1 }">
								<a href="/llhb/home" style="width: 100%;" class="The_login">进入首页</a>
							</c:if>
							<c:if test="${loginSta!=1 }">
								<a href="/llhb/login" class="The_login">登录</a>
								<a href="/llhb/reg" class="register">注册</a>
							</c:if>
						</div>
						<div class="shop_tabb quan" style="height: 113px;">
							<div class="hd"
								style="padding-left: 23px; height: 23px; border-bottom: 1px solid #c8c8c8;">
								<span class="current raw">买家服务</span> <span class="protection">卖家服务</span>
								<span class="last">综合服务</span>
							</div>
							<div class="bd">
								<ul class="cur">
									<li><a href="${ctx }/addNeed" target="_blank"
										class="xu_qiu" style="margin-right: 30px;"><span>需求</span></a>
										<a href="${ctx }/mall" class="cha_zhao"
										style="margin-right: 30px;"> <span>找产品</span>
									</a> <a href="javascript:void(0);" class="fan_k" onclick="advice()">
											<span>意见反馈</span>
									</a></li>
								</ul>
								<ul>
									<li><a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit"
										class="Open_store" style="margin-right: 30px;"> <span>开商铺</span>
									</a> <a href="${ctx }/supply-demand" class="demand"
										style="margin-right: 30px;"> <span>供求</span>
									</a> <a href="${ctx }/home?str=/proManage/add" class="Release">
											<span>发布产品</span>
									</a></li>
								</ul>
								<ul>
									<li><a href="${ctx }/home?str=/ypcd/adsManage/adsAdd"
										class="advertising" style="margin-right: 30px;"> <span>广告服务</span>
									</a><a href="${ctx }/platform/indexIconInit" class="marketing"
										style="margin-right: 30px;"> <span>全网营销</span>
									</a><a href="javascript:void(0);" class="certification"> <span>信誉认证</span>
									</a></li>
								</ul>
							</div>
						</div>
						<p class="notice">
							<b style="">公告</b>
							<!--<span style="float: left; margin-left: 12px; font-weight: bold; color: #8b8a84; margin-bottom: 10px;">最新入驻企业</span> -->
						</p>
						<div class="myscroll">
							<ul>
								<c:forEach items="${noticList}" var="notic">
									<li><c:choose>
											<c:when test="${notic.remarks=='1'}">
												<a target="_blank" href="${ctx }/${notic.ntContent}">${notic.ntTitile}</a>
											</c:when>
											<c:otherwise>
												<a target="_blank"
													href="${ctx}/notice/noticDetail?id=${notic.id}">${notic.ntTitile}</a>
											</c:otherwise>
										</c:choose></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:if>
				<!--头部右边登录-->
				<c:if test="${isWS==1 }">
				<!-- 危废start --> 
				<div class="ws" >
					<div class="Rapid_application">
						<p class="celerity">
						<img src="${ctxStatic}/img/v2/ws/celerity.png" style="width:51px;height:51px;">
						<span style="display: block;font-size:14px;margin:14px 0 20px 0;">直接进入流程,办理申报</span>
						<a href="javascript:void(0)" class="quickDo" style="width:140px;height:34px;line-height:34px;color:#fff;background-color:#008f00;display:block;margin: 0 auto;font-size:16px;">快速申请</a>
						</p>
					</div>
					<div class="Rapid_application" style="border-bottom:0;">
						<p class="celerity" style="margin-top:18px;">
							<img src="${ctxStatic}/img/v2/ws/subscribe.png" style="width:51px;height:51px;">
							<span style="display: block;font-size:14px;margin:14px 0 16px 0;">
							  无需马上申报,按约定时间进行申报处理
							</span>
							<a href="javascript:void(0)" class="orderDo" style="width:140px;height:34px;line-height:34px;color:#fff;background-color:#008f00;display:block;margin: 0 auto;font-size:16px;">预约办理</a>
						</p>
					</div>  
				</div>
				<!-- 危废end --> 
				</c:if>
			</div>
		</div>
	</div>

	<c:if test="${isQuote==1 }">
		<div class="layui-form">
			<!-- 立即申请结束 环评报价-->
			<div class="hp_quote">
				<h3>恭喜您申请成功 !</h3>
				<p>30分钟内将有环保顾问与您联系,确认您的需求 !</p>
				<div class="line hp_type">
					<label class="layui-form-label">项目类别 :</label>
					<div class="layui-inline" id="offhead">
						<select class="offhead" lay-filter="offhead" lay-verify="required">
							<option value="0"></option>
							<c:forEach items="${offHeads }" var="h">
								<option value="${h.hid }">${h.hname }</option>
							</c:forEach>
						</select>
					</div>
					<div class="layui-inline" id="headline">
						<select class="headline" lay-filter="headline" lay-verify="required">
							<option value="0"></option>
						</select>
					</div>
				</div>
				<div class="check">
				</div>
				<div class="line">
					<label class="layui-form-label">建设地点 :</label>
					<div class="layui-input-block addr">
						<div class="layui-inline pop_province">
							<select class="" lay-filter="pop_province">
								<option value="0">省</option>
								<c:forEach var="province" items="${provinceList }">
									<option value="${province.id}">${province.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="layui-inline pop_city">
							<select class="" lay-filter="pop_city">
								<option value="0">市</option>
							</select>
						</div>
						<div class="layui-inline country">
							<select class="" lay-filter="country">
								<option value="0">县</option>
							</select>
						</div>
					</div>
				</div>
				<div class="line">
					<label class="layui-form-label">项目名称 :</label> <input type="text"
						class="hp_name layui-input">
				</div>
				<div class="line checkcode">
					<div class="layui-input-inline">
						<input type="text" disabled="disabled"
							class="tel layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" class="code layui-input">
					</div>
					<a href="javascript:void(0)" class="getCheckCode layui-btn layui-btn-primary">点击获取验证码</a>
				</div>
				<div class="putHp">
					<a href="javascript:void(0)"
						class="layui-btn layui-btn-primary submitHp">立即提交</a>
				</div>
				<a href="javascript:void(0)" class="help">帮我填写</a>
				<a href="javascript:void(0)" class="recommend">推荐公司</a>
			</div>
			<!-- 立即申请结束 环评报价-->
			<!-- 立即申请结束 监测报价-->
			<div class="jc_quote">
				<h3>恭喜您申请成功 !</h3>
				<p>30分钟内将有环保顾问与您联系,确认您的需求 !</p>
				<div class="line">
					<label class="layui-form-label">项目类别 :</label>
					<div class="layui-inline" id="surHead">
						<select class="surHead" lay-filter="surHead" lay-verify="required">
							<option value="0"></option>
							<c:forEach items="${surHeads }" var="h">
								<option value="${h.hid }">${h.hname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="check">
					<div class="tree"></div>
					<div class="selected">
						<ul class="jcData"></ul>
					</div>
				</div>
				<div class="line" id="addr">
					<label class="layui-form-label">建设地点 :</label>
					<div class="layui-input-block addr">
						<div class="layui-inline pop_province">
							<select class="" lay-filter="pop_province">
								<option value="0">省</option>
								<c:forEach var="province" items="${provinceList }">
									<option value="${province.id}">${province.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="layui-inline pop_city">
							<select class="" lay-filter="pop_city">
								<option value="0">市</option>
							</select>
						</div>
						<div class="layui-inline country">
							<select class="" lay-filter="country">
								<option value="0">县</option>
							</select>
						</div>
					</div>
				</div>
				<div class="line">
					<label class="layui-form-label">项目名称 :</label> <input type="text"
						class="jc_name layui-input">
				</div>
				<div class="line checkcode">
					<div class="layui-input-inline">
						<input type="text" disabled="disabled"
							class="tel layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" class="code layui-input">
					</div>
					<a href="javascript:void(0)" class="getCheckCode layui-btn layui-btn-primary">点击获取验证码</a>
				</div>
				<div class="putJc">
					<a href="javascript:void(0)"
						class="layui-btn layui-btn-primary submitJc">立即提交</a>
				</div>
				<a href="javascript:void(0)" class="help">帮我填写</a>
				<a href="javascript:void(0)" class="recommend">推荐公司</a>
			</div>
			<!-- 立即申请结束 监测报价-->
		</div>
	</c:if>
	</div>
	<script>
		var ctx = "${ctx}";
		var navIndex=${empty navIndex?0:navIndex};
		var loginSta = "${loginSta}";
	</script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/v2/index.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/v2/header.js"></script>