<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld"%>
	<style>
		#myHomePage{color:#8a8a8a;}
		#myHomePage:hover{color:#5EC520;cursor: pointer;}
	</style>
	<!-- 百度统计代码start -->
	<script>
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "//hm.baidu.com/hm.js?2520978a8aed691b683775cec6230709";
		  var s = document.getElementsByTagName("script")[0];
		  s.parentNode.insertBefore(hm, s);
		})();
	</script>
	<!-- 百度统计代码end -->
        <!--头部上部 start-->
        <div class="header_top font_1">
           	<p class="h_t_welcome" >您好<span id="lo"><shiro:principal property="loginName"/></span>!&nbsp; &nbsp;<span onclick="home()" id="myHomePage"style="margin: 0 198px 0 0;">进入我的首页</span></p>
            <div class="h_t_loginbtn" sytle="display:none;">
                <c:if test="${empty salesmanCode}">
                    <a href="${ctx }/login" >请登录</a>&nbsp;<span>|</span>&nbsp;
                </c:if>
                <c:if test="${!empty salesmanCode}">
                    <a href="${ctx }/login?salesmanCode=${salesmanCode}" >请登录</a>&nbsp;<span>|</span>&nbsp;
                </c:if>
               	<a href="${ctx }/reg" >注册</a>&nbsp;<span>|</span>&nbsp;
               	<a href="${ctx }/home" >我的优蚁</a>
            </div>
            <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
            <script>
	                $(document).ready(function(){
	                	var login = $("#lo").html();
	                	if(login == ""){
	    					$(".h_t_loginbtn").show();
	    					$(".h_t_welcome").hide();
	    				}else{
	    					$(".h_t_welcome").show();
	    					$(".h_t_loginbtn").hide();
	    				}
	                });
	                function home(){
	                	location.href="${ctx}/home"
	                }
                </script>
            <div class="h_t_weather" style="margin-left:15px;position:relative;">
            	<div class="h_t_weather_click" style="position: absolute;top:0;left:0;width:200px;height:40px;z-index: 1;cursor: pointer;"></div>
                <!-- <iframe allowtransparency="true" frameborder="0" width="200" height="36" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=1&bd=0&k=&f=&q=1&e=1&a=1&c=54511&w=200&h=36&align=left"></iframe> -->
  				<iframe allowtransparency="true" frameborder="0" width="200" height="36" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=2&bd=0&k=&f=&q=1&e=1&a=1&c=59289&w=200&h=36&align=center"></iframe>          
            </div>
            <ul class="h_t_tool">
                <li>
                    <a href="javascript:void(0);" class="sel">关注优蚁&or;</a>
                    <div class="h_t_twocode"><img src="${ctxStatic}/img/llhb/erweima.jpg"/></div>
                </li>
                <li>
                    <a href="javascript:void(0);">手机优蚁&or;</a>
                     <div class="h_t_twocode"><img src="${ctxStatic}/img/llhb/erweima.jpg"/></div>
                </li>
                <li>
                    <a href="${ctx }/platform/helpCenter">帮助中心&or;</a>
                    <div class="h_t_tkefu ">
                        <span class="tr_line"></span>
                        <div>
                            <a href="${ctx }/platform/helpCenter">自助服务</a>
                        </div>
                        <div>
                            <span>在线咨询</span>
                            <a href="#" onclick="window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" class="qqkefu_online qqkefu"></a>
                        	<a href="#" onclick="window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');" class="qqkefu_online qqkefu"></a>                       	
                        </div>
                        <div>
                            <span>客服热线</span>
                            <span class="color_lv">${servicePhone }</span>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0);">网站栏目&or;</a>
                    <div class="h_t_t_webs" style="width:150px;">
                        <a href="#" onclick="window.open('${ctx}/supply-demand','_blank')">环保供求</a>
                        <a href="#" onclick="window.open('${ctx}/mall')">环保商城</a>
                        <a href="#" onclick="window.open('${ctx}/EntLib','_blank')">企业库</a>
                        <a href="#" onclick="window.open('${ctx}/quote','_blank')">环保报价</a>
                        <a href="#" onclick="window.open('${ctx}/news/environmental-information','_blank')">环保动态</a>
                        <a href="#" onclick="window.open('${ctx}/news/knowledge','_blank')">环保知识</a>
                        <a href="#" onclick="window.open('${ctx}/news/exhibition-information','_blank')">展会信息</a>
                        <a href="#" onclick="window.open('${ctx}/platform/indexIconInit','_blank')">网站特色</a>
                        <%--<a href="#" onclick="window.open('${ctx}/login','_blank')">会员入口</a>--%>
                        <a href="#" onclick="window.open('${ctx}/hazardous-wastes','_blank')">危废服务</a>
                        <a href="${ctx }/platform/helpCenter"  target="_blank">帮助中心</a>
                        <a href="#" onclick="window.open('${ctx}/platform/aboutUsInit','_blank')">关于我们</a>
                        <a href="#" onclick="window.open('${ctx}/platform/platformInit','_blank')">平台介绍</a>
                        <%--<a href="#" onclick="window.open('${ctx}/adsReser/adsReserIn','_blank')">广告预定</a>--%>
                    </div>
                </li>
            </ul>
            <div class="clear"></div>
        </div>
        <!--头部上部 end-->
        <script>
        	$(function(){
        		$(".h_t_weather .h_t_weather_click").click(function(e){
        			e.stopPropagation();
        			window.open("http://www.pm25.in/dongguan");
        		});
        	});
        </script>
