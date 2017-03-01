<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<!--底部 end-->
<style>
.nav_share ul{right:48px;top:0px;background:#fff;}
.nav_share ul li a{displa:inline; width:0px; margin-left:5px; margin-top:12px;}
</style>
<div class="nav_bottomlist">
	<div class="nav_share" href="javascript:void(0);">
        <em></em>
        <ul class="bdsharebuttonbox" data-tag="share_1">
        	<li><a href="#" class="bds_weixin" data-cmd="weixin"></a>
        	<a class="bds_qzone" data-cmd="qzone" href="#"></a>
        	<a class="bds_tsina" data-cmd="tsina"></a></li>
            <%-- <li><a style="width:25px; height:24px; padding:0;margin:12px 8px 12px 10px;" href="javascript:void(0);"><img src="${ctxStatic}/img/llhb/share_1.png"></a></li>
            <li><a style="width:25px; height:24px; padding:0;margin:12px 8px 12px 8px;" href="javascript:void(0);"><img src="${ctxStatic}/img/llhb/share_2.png"></a></li>
            <li><a style="width:25px; height:24px; padding:0;margin:12px 10px 12px 8px;" href="javascript:void(0);"><img src="${ctxStatic}/img/llhb/share_3.png"></a></li> --%>
        </ul>
    </div>
    <a class="nav_totop" href="javascript:void(0);" style="border-top:0;">
        <em></em>
        <span>回到顶部</span>
    </a>
    <a class="nav_optionback" href="javascript:void(0);"onclick='advice()'>
        <em></em>
        <span>意见反馈</span>
    </a>
</div>
<script>
//分享
var text = $(".main_text dl dt").html();
var url = window.location.href;
var pic1 =  $(".main_text input").val();
window._bd_share_config = {
		common : {
			bdText : text,	
			bdDesc:"",
			bdUrl : url, 	
			bdPic :pic1
		},
		share : [{
			"bdSize" : 24
		}]
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script> 
<!--底部 end-->