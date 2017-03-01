<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java"
	import="com.qdum.llhb.common.service.FooterService"%>
<%
FooterService.initFooterInfo(request);
%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/v2/footer.css" />
<style>
#hb_icon a{color:#000;}
</style>
<script>
	var ctx = "${ctx}";
</script>
<div id="footer">
<ul id="hb_icon">
	<li>
		<a href="${ctx }/evmAdvisor">
		<div style="float: left;">
			<img src="${ctxStatic}/img/v2/index/gu_w.png">
		</div>
		<div style="float: left; padding: 12px 0 0 10px;">
			<h3 style="font-weight: bold;">环保顾问</h3>
			<p>让您省钱、省时、省心</p>
		</div>
		</a>
	</li>
	<li>
		<a href="http://www.yyhb365.com/youyi/authority-special.html">
		<div style="float: left;">
			<img src="${ctxStatic}/img/v2/index/wu_l.png">
		</div>
		<div style="float: left; padding: 12px 0 0 10px;">
			<h3 style="font-weight: bold;">国家试点</h3>
			<p>国家支持的环保平台</p>
		</div>
		</a>
	</li>
	<li>
		<a href="http://yyhb365.com/youyi/eia_special.html">
		<div style="float: left;">
			<img src="${ctxStatic}/img/v2/index/z_ti.png">
		</div>
		<div style="float: left; padding: 12px 0 0 10px;">
			<h3 style="font-weight: bold;">环保专题</h3>
			<p>复杂的环保知识简单化</p>
		</div>
		</a>
	</li>
	<li>
		<a href="${ctx }/EntLib">
		<div style="float: left;">
			<img src="${ctxStatic}/img/v2/index/g_si.png">
		</div>
		<div style="float: left; padding: 12px 0 0 10px;">
			<h3 style="font-weight: bold;">环保公司</h3>
			<p>汇集全国优质环保公司</p>
		</div>
		</a>
	</li>
	<li>
		<a href="http://www.yyhb365.com/youyi/process-special.html">
		<div style="float: left;">
			<img src="${ctxStatic}/img/v2/index/f_wu.png">
		</div>
		<div style="float: left; padding: 12px 0 0 10px;">
			<h3 style="font-weight: bold;">环保服务</h3>
			<p>一站式解决企业环保工作</p>
		</div>
		</a>
	</li>
</ul>
<div class="footer_top">
	<ul class="footer_left">
		<li>
			<dl>
				<dt>新手指南</dt>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/platform/aboutUsInit">了解优蚁</a>
				</dd>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/platform/helpCenter">帮助中心</a>
				</dd>
				<dd class="font_1">
					<a target="_blank"
						href="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">咨询客服</a>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>生产型企业</dt>
				<dd class="font_1">
					<a target="_blank"
						href="${ctx }/evmAdvisor">环保顾问</a>
				</dd>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/EntLib">找环保公司</a>
				</dd>
				<dd class="font_1">
					<a href="javascript:void(0);" onclick="advice()">意见反馈</a>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>环保公司</dt>
				<dd class="font_1">
					<a target="_blank" href="http://www.yyhb365.com/youyi/vip-service.html">我要入驻</a>
				</dd>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/supply-demand">找环保需求</a>
				</dd>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/login">发布商品</a>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>综合服务</dt>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/home?str=/ypcd/adsManage/adsAdd">广告服务</a>
				</dd>
				<dd class="font_1">
					<a target="_blank" href="${ctx }/platform/indexIconInit">全网营销</a>
				</dd>
				<dd class="font_1">
					<a href="javascript:void(0);">信誉认证</a>
				</dd>
			</dl>
		</li>
		<div class="clear"></div>
	</ul>
	<div class="footer_right">
		<div class="f_r_service">
			<p class="f_r_tel">全国服务热线</p>
			<p class="f_r_telnum">${servicePhone }</p>
			<div class="f_r_link">
				<div class="f_r_img">
					<img src="${ctxStatic}/img/v2/index/f_r_service.png">
				</div>
				<p class="f_r_inline">在线客服</p>
				<p class="f_r_time font_1">服务时段：9:00 - 18:00</p>
				<p class="f_r_time font_1" style="margin-left: 110px;">周一至周五</p>
				<div class="clear"></div>
			</div>
		</div>
		<div class="f_r_weixin">
			<img src="${ctxStatic}/img/v2/index/erweima.jpg">
			<p class="font_1">官方微信</p>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="you_q">
	<div class="shop_tabbb">
		<div class="hd">
			<span class="last current">${wstl[0].get("label")}</span>
			<c:forEach items="${wstl}" var="w" begin="1">
				<span class="last">${w.get("label")}</span>
			</c:forEach>
		</div>
		<div class="bd">
			<ul class="cur">
				<c:forEach items="${wsif[0]}" var="w">
					<li>
						<a target="_blank" href="${w.get('site_url')}">${w.get('site_name')}</a>
					</li>
				</c:forEach>
			</ul>
			<c:forEach items="${wsif}" var="ws" begin="1">
				<ul>
					<c:forEach items="${ws}" var="w">
						<li>
							<a target="_blank" href="${w.get('site_url')}">${w.get('site_name')}</a>
						</li>
					</c:forEach>
				</ul>
			</c:forEach>
		</div>
	</div>
</div>
<div class="ban_q bottom_ad">
	<div style="width: 1200px; margin: 0 auto;">
		<div style="width: 860px; margin: 0 auto;">
			<p>广东绿联互联网科技有限公司 Copyright2015-2018 粤ICP备15102315号</p>
			<ul>
				<li>法律声明<span>|</span></li>
				<li>服务条款<span>|</span></li>
				<li>隐私声明<span>|</span></li>
				<li>关于优蚁<span>|</span>
				</li>
				<li>联系我们<span>|</span></li>
				<li>网站地图</li>
				<li>
					<div style="text-align: center;">
					    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256871219'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1256871219%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(".shop_tabbb .hd span").mouseenter(
						function() {
							$(this).addClass("current").siblings().removeClass(
									"current").parent().siblings(".bd")
									.children("ul").eq($(this).index())
									.addClass("cur").siblings().removeClass(
											"cur");
						});
			});
</script>