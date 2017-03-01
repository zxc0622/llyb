<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>
<header>
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp" %>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle main" style="height: 145px;">
            <h1 class="header_logo">
                <a href="${ctx}/index"> <img
                        src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>

            <c:choose>
                <%--${pagename == 'wshome'}--%>
                <c:when test="true">
                    <div class="header_right"
                         style="margin-left: 165px; float: left; margin-top: 38px;">
                        <img src="${ctxStatic}/img/llhb/mall_tel.png">
                      
                    </div>
                    <div class="header_right" style="float: left;height:145px;margin-top: 10px;">
                        <%-- <ul>
                            <c:forEach items="${rightImgs}" var="img">
                                <li>
                                    <div class="h_r_img">
                                        <img src="${img.picAddr}"/>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <a href="javascript:void(0);" class="h_r_next">&gt;</a> 
                     --%>
                     	<a class="font_3 showRequireBox" href="javascript:void(0);" onclick="window.open('http://hbxq.yyhb365.com/youyipc.html');" style="display:block;height: 35px;line-height:35px;background: #5EC520;color: #FFFFFF;text-align: center;;width:130px;margin-top:55px;margin-left:50px; background-color:#ee7800;">发布环保需求</a>
                    	<style type="text/css">
	                    	/*发布需求弹出框样式start */
							.require-box{
								width:298px;
								height:370px;
								background-color: #FFFFFF;
								border: 1px solid #CCC;
								font-family: "微软雅黑";
								position: relative;
							    z-index: 11;
							    top: 0;
							    left: -120px;
							    display:none;
							}
							.rb-item{
								margin-top: 16px;
								margin-left: 32px;
								position: relative;
							}
							
							.rb-inoneline{
								display: inline-block;
							}
							.rb-p1{
								font-size: 14px;
								margin-top: 10px;
								margin-left: 10px;
								color: #000000;
							}
							
							.rb-p2{
								font-size: 12px;
								color: #7A7A7A;
								margin-bottom: 2px;
							}
							
							.rb-p3{
								font-size: 14px;
								color: #7A7A7A;
							}
							.rb-a{
								display: block;
								margin-top: 14px;
				    			margin-left: 36px;
								width:224px;
								height:42px;
								background-color: #EF7800;
								color: #FFFFFF;
							    text-align: center;
							    line-height: 42px;
							    font-size: 18px;
							    cursor: pointer;
							}
							.rb-word{
								padding-top: 5px;
							    position: relative;
							    top: -8px;
							}
							.rb-imgdiv{
								height:46px;
								width:46px;
							}
							.rb-word p{
								height: 16px;
							}
							/*发布需求弹出框样式end */
                    	</style>
                    	<!-- 发布需求弹出框start -->
						<div class="require-box">
							<p class="rb-p1">发布您的环保需求，坐等环保顾问为您解决！</p>
							<div class="rb-item">
								<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/afterpublic.png);"></div>
								<div class="rb-inoneline rb-word">
									<p class="rb-p2">需求发布后</p>
									<p class="rb-p3">30分钟内环保顾问主动联系您</p>
								</div>
							</div>
							
							<div class="rb-item">
								<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/fivecomresp.png);"></div>
								<div class="rb-inoneline rb-word">
									<p class="rb-p2">每个需求</p>
									<p class="rb-p3">至少3家环保公司参与报价</p>
								</div>
							</div>
							
							<div class="rb-item">
								<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/goodreputation.png);"></div>
								<div class="rb-inoneline rb-word">
									<p class="rb-p2">98%的需求</p>
									<p class="rb-p3">得到了圆满解决</p>
								</div>
							</div>
							
							<div class="rb-item">
								<div class="rb-inoneline rb-imgdiv" style="background: url(${ctxStatic}/img/llhb/free.png);"></div>
								<div class="rb-inoneline rb-word">
									<p class="rb-p2">所有需求</p>
									<p class="rb-p3">不向企业收取任何服务费</p>
								</div>
							</div>
							
							<a style="width: 224px;height:42px;background-color: #EF7800;" class="rb-a" onclick="window.open('${ctx}/addNeed');">立即发布环保需求</a>
							
						</div>
	                	<!-- 发布需求弹出框end -->
	                	<script type="text/javascript">
		                	//发布需求弹出框js
		                   	$(function(){
		                   		$(".showRequireBox").mouseover(function(){
		                   			$(".require-box").show();
		                   		});
		                   		
		                   		$(".showRequireBox").mouseout(function(){
		                   			$(".require-box").hide();
		                   		});
		                   		
		                   		$(".require-box").mouseenter(function(){
		            				$(".require-box").show();
		               			});
		               			$(".require-box").mouseleave(function(){
		               				$(".require-box").hide();
		               			});
		                   		
		                   	});
	                	</script>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="header_right">
                        <%-- <img src="${ctxStatic}/img/llhb/mall_tel.png"> --%>
                         <a class="font_3" href="javascript:void(0);" onclick="window.open('http://hbxq.yyhb365.com/youyipc.html');" style="display:block;height: 35px;line-height:35px;background: #5EC520;color: #FFFFFF;text-align: center;;width:130px;margin-top:55px;margin-left:50px; background-color:#ee7800;">发布环保需求</a>
                    </div>
                </c:otherwise>
            </c:choose>
            	
            <div class="clear"> </div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <c:choose>
    <c:when test="${pagename == 'wshome'}">
    <div class="header_banner">
        </c:when>
        <c:otherwise>
        <div class="header_banner" style="height: 45px; overflow: visible;">
            </c:otherwise>
            </c:choose>
            <!--头部导航 start-->
            <nav class="header_nav font_3">
                <div class="h_n_left"></div>
                <ul>
                    <li onclick="go('${ctx}/index');"><a href="javascript:void(0);">首页</a></li>
                    <li
                            <c:if test="${pagename == 'wshome'}">class="header_nav_sel" </c:if>
                            onclick="go('${ctx}/hazardous-wastes');"><a
                            href="javascript:void(0);">危废服务首页</a></li>
                    <li
                            <c:if test="${pagename == 'wshandel'}">class="header_nav_sel" </c:if>
                            onclick="go('${ctx}/hazardous-wastes/dispose');"><a
                            href="javascript:void(0);">危废办理</a></li>
                    <li
                            <c:if test="${pagename == 'wsorderhandle'}">class="header_nav_sel" </c:if>
                            onclick="go('${ctx}/hazardous-wastes/reservation');"><a
                            href="javascript:void(0);">预约危废办理</a></li>
                    <li
                            <c:if test="${pagename == 'about'}">class="header_nav_sel" </c:if>
                            onclick="go('${ctx}/hazardous-wastes/introduction');"><a
                            href="javascript:void(0);">关于危废</a></li>

                    <div class="wf-right-div">
                        <div class="wf-r-d-div" style="border-bottom: 1px solid #ccc">
                            <img src="${ctxStatic}/img/llhb/weifeifuwu_01.png" alt=""> <a
                                href="javascript:void(0)" class="wffu_kssq"
                                <shiro:guest> onclick="footer.application(false);"</shiro:guest>
                                <shiro:user> onclick="footer.application(true,${hasServices});"</shiro:user>>快速申请</a>

                            <p>直接进入流程,办理申报</p>
                        </div>
                        <div class="wf-r-d-div">
                            <img src="${ctxStatic}/img/llhb/weifeifuwu_02.png" alt=""> <a
                                href="javascript:void(0)"
                                <shiro:guest> onclick="footer.application(false);"</shiro:guest>
                                <shiro:user> onclick="window.open('${ctx}/home?str=/ws/productwaste/pwbaseinfo/orderPage');"</shiro:user>>预约办理</a>

                            <p>无需马上申报,按约定时间进行申报处理</p>
                        </div>
                    </div>
                </ul>
                <div class="h_n_right"></div>
            </nav>
            <!--头部导航 end-->

            <c:if test="${pagename == 'wshome'}">
                <!--头部banner图片 start-->
                <ul class="h_b_list">
                    <c:choose>
                        <c:when test="${fn:length(adImages) == 0}">
                            <li data-color="#3DAFCC"><a href="javascript:void(0);"> <img
                                    src="${ctxStatic}/img/llhb/weifei_shouye_01.png"/>
                            </a></li>
                            <li data-color="#50AE72"><a href="javascript:void(0);"> <img
                                    src="${ctxStatic}/img/llhb/weifei_shouye_02.png"/>
                            </a></li>
                            <li data-color="#3D80C4"><a href="javascript:void(0);"> <img
                                    src="${ctxStatic}/img/llhb/weifei_shouye_03.png"/>
                            </a></li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${adImages}" var="adImage" varStatus="idStatus">
                                <li
                                        <c:if test="${idStatus.index == 0}">data-color="#3DAFCC"</c:if>
                                        <c:if test="${idStatus.index == 1}">data-color="#50AE72"</c:if>
                                        <c:if test="${idStatus.index == 2}">data-color="#3D80C4"</c:if>><a
                                        href="javascript:void(0);"> <c:choose>
                                    <c:when
                                            test="${adImage.picAddr == null || adImage.picAddr == ''}">
                                        <img src="${ctxStatic}/img/llhb/weifei_shouye_01.png"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${adImage.picAddr}"/>
                                    </c:otherwise>
                                </c:choose>
                                </a></li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                        <%-- <li data-color="#3DAFCC"><a href="javascript:void(0);"> <img
                                src="${ctxStatic}/img/llhb/weifei_shouye_01.png" />
                        </a></li>
                        <li data-color="#50AE72"><a href="javascript:void(0);"> <img
                                src="${ctxStatic}/img/llhb/weifei_shouye_02.png" />
                        </a></li>
                        <li data-color="#3D80C4"><a href="javascript:void(0);"> <img
                                src="${ctxStatic}/img/llhb/weifei_shouye_03.png" />
                        </a></li>  --%>
                </ul>
                <!--头部banner图片 end-->
                <!--头部banner小圆圈 start-->
                <div class="h_b_btn"></div>
                <!--头部banner小圆圈 end-->
            </c:if>

        </div>
        <!--头部banner end-->
</header>