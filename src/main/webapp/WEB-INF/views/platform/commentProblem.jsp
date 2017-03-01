<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="javascript:void(0);"/>
    <title>优蚁环保-常见问题,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<style>

/*内容start*/

/*当前位置*/
.main_row_1{height:40px; overflow:hidden;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}



/*常见问题中心页面*/

.hangqing-main-t{overflow: hidden;margin-bottom: 150px;}
/*常见问题左侧*/
.hq-m-t-l{float:left;width:235px;margin-top: 15px;border:1px solid #ccc;}
.hq-m-t-l li{height:35px;line-height: 35px;border-bottom: 1px dashed #ccc;padding-left: 65px;background-color: #F7F8F8;}
.hq-m-t-l li:last-child{border-bottom:none;}
.hq-m-t-l .ziyuan-title{height:40px;line-height: 40px;background-color: #4F9028;color:#fff;border:none;font-size: 16px;}
.hq-m-t-l li a{position: relative;margin-left:3px}
.hq-m-t-l li a:before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 15px;margin-right: 5px}
.hq-m-t-l li a:hover{color:#5EC520;}
.hq-m-t-l li a:hover::before{background-color: #5EC520;}
.m-t-l-a-act a{color:#5EC520;}
.hq- a:before{background-color:#5EC520;}
/*常见问题左侧结束*/
/*常见问题右侧*/
.changjianwenti-m-t-r{float:left;margin-top: 15px;margin-left: 20px;width:740px;border:1px solid #ccc;min-height:744px;}
.changjianwenti-neirong{width:700px;margin:20px auto;display: none;}
.cjwt-title{border:1px solid #ee7800;height:50px;line-height: 50px;font-size: 20px;text-align: center;background-color: #FFFDEE;}
.changjianwenti-neirong h5{text-align: center;font-size: 18px;margin-top: 20px;}
.little-title{font-size: 16px;color:#5EC520;font-weight: bold;}
.changjianwenti-neirong p{margin-top: 10px;color:#999;}
.changjianwenti-neirong p span{color:#5ec520;}
.changjianwenti-neirong p span a{color:#5ec520;}


</style>
</head>
<body>
<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>帮助中心>常见问题
            </div>
        </div>
        <div class="hangqing-main-t">
            <div class="hq-m-t-l">
                <ul>
                <c:choose>
                	<c:when test="${problemList!=null}">
                	 <c:forEach items="${problemList}" var="info" varStatus="status">
                    <li id="${info.id}"> <a href="javascript:void(0)">${info.quesTitle}</a></li>
                   <!--  <li class="m-t-l-a-act"><a href="javascript:void(0)">找回登录名</a></li>
                    <li><a href="javascript:void(0)">找回密码</a></li>
                    <li><a href="javascript:void(0)">帐号无法登录</a></li>
                    <li><a href="javascript:void(0)">优蚁币使用方法</a></li>
                    <li id="remark"><a href="javascript:void(0)">积分规则</a></li>
                    <li><a href="javascript:void(0)">发布信息要求</a></li>
                    <li><a href="javascript:void(0)">产品图片审核标准</a></li>
                    <li><a href="javascript:void(0)">优蚁会员服务</a></li>
                    <li><a href="javascript:void(0)">修改资料</a></li>
                    <li><a href="javascript:void(0)">申请发票</a></li> -->
                    </c:forEach>
                	</c:when>
	                <c:otherwise>
	                	 <li > <a href="javascript:void(0)">暂无数据</a></li>
	                </c:otherwise>
                
                </c:choose>
                
                </ul>
            </div>    
            <div class="changjianwenti-m-t-r">
                <c:choose>
                	<c:when test="${problemList!=null}">
		                <c:forEach items="${problemList}" var="info" varStatus="status">
			                <div class="changjianwenti-neirong" z-type="${info.id}">
			                    <div class="cjwt-title">
			                   		   ${info.quesTitle}
			                    </div>
			                     ${info.quesContent}
			                </div>
		                </c:forEach>
             	    </c:when>
	                <c:otherwise>
	                	  <div class="changjianwenti-neirong">
			                    <div class="cjwt-title">
			                   		   暂无数据！
			                    </div>
	                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!--中间部分end-->

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<script>
$(function(){
	$(".hq-m-t-l ul li:not('.ziyuan-title')").click(function(){
        $(this).addClass("m-t-l-a-act").siblings().removeClass("m-t-l-a-act");
        $(".changjianwenti-m-t-r .changjianwenti-neirong").eq($(this).index()).show().siblings().hide();
    });
	var index = '${remark}';
	if(index!=""&&index!=null){
		$(".hq-m-t-l ul #"+index).addClass("m-t-l-a-act").siblings().removeClass("m-t-l-a-act");
	    $(".changjianwenti-m-t-r .changjianwenti-neirong").each(function(){
	    	if($(this).attr("z-type")==index){
	    		$(this).show();
	    	}else{
	    		$(this).hide();
	    	}
	    });
	}else{
		$(".hq-m-t-l ul li:first").trigger("click");
	}

    
    $('#title').bind('keypress',function(event){
        if(event.keyCode == "13")  {
        	sou();
        }
    });
});
$(document).ready(function(){
	
	var str ='${type}';
	$(".a-type li a").each(function(){
		if(str==$(this).attr("a-type")){
			$(this).parent().addClass("header_nav_sel");
		}else{
			$(this).parent().removeClass("header_nav_sel");
		}
	});
	
});
function sou(){
	var v = $(".header_search select").val();
	var title = $("#title").val();
	if(v == 1){
		location.href='${ctx}/solidsupply/supplyList?title='+title;
	}else{
		location.href='${ctx}/qiugou/searchList?searchtext='+title;
	}
}
</script>
</body>
</html>