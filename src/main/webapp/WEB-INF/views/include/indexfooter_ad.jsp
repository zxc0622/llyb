<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<style>
    .ad_r_service li a{width:100%}
</style>
<!--左侧悬窗 start-->
<div class="ad_left">
    <a href="http://www.yyhb365.com/youyi/authority-special.html" target="_blank">
        <img src="${ctxStatic}/img/llhb/ad_left.png" alt="环保行业一站式服务平台" /></a>
</div>
<!--左侧悬窗 end-->

<!--右侧悬窗 start-->
<div class="ad_right">
    <div class="ad_r_img">
        <img src="${ctxStatic}/img/llhb/ad_right_03.png" alt=""style="width:161px; height: 142px; left: 9px; top: -14px;">
        <img class="ant_voice_2" src="${ctxStatic}/img/llhb/ant_voice_3_03.png" alt=""style="width: 80%; height: 45px; left: 16px; top: 31px;-webkit-animation: ant_voice 2s 0.2s infinite;-moz-animation: ant_voice 2s 0.2s infinite;-o-animation: ant_voice 2s 0.2s infinite;animation: ant_voice 2s 0.2s infinite;">
        <img class="ant_voice_1" src="${ctxStatic}/img/llhb/ant_voice_3_03.png" alt=""style="width: 65%; height: 25px; top: 42px; left: 30px;-webkit-animation: ant_voice 2s infinite;-moz-animation: ant_voice 2s infinite;-o-animation: ant_voice 2s infinite;animation: ant_voice 2s infinite;">
        <img class="ant_voice_3" src="${ctxStatic}/img/llhb/ant_voice_3_03.png" alt=""style="width: 100%; height: 67px; top: 20px;left: 0px;-webkit-animation: ant_voice 2s 0.5s infinite;-moz-animation: ant_voice 2s 0.5s infinite;-o-animation: ant_voice 2s 0.5s infinite;animation: ant_voice 2s 0.5s infinite;">
    </div>
    <div class="ad_r_content">
        <ul class="ad_r_nav">
            <li class="ad_r_nav_sel"><a href="javascript:void(0);">综合信息</a></li>
            <li><a href="javascript:void(0);">1F行业资讯</a></li>
            <li><a href="javascript:void(0);">2F环保供求</a></li>
            <li><a href="javascript:void(0);">3F环保商城</a></li>
        </ul>
        <ul class="ad_r_service">
			<li onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"><a href="javascript:void(0);">平台使用咨询</a></li>
			<li onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"><a href="javascript:void(0);">平台入驻咨询</a></li>
			<li onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=9759310&userId=21364156', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"><a href="javascript:void(0);">环保业务咨询</a></li>
        </ul>
        <div class="ad_r_tel">
            <p class="font_2">全国服务热线</p>
            <p class="font_1">${servicePhone }</p>
        </div>
    </div>
</div>
<!--右侧悬窗 end-->

<!--回到顶部悬窗 start-->
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
<!--回到顶部悬窗 end-->