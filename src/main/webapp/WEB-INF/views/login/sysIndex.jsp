<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
    <meta charset="utf-8" />
    <title>绿联环保</title>
    <meta name="decorator" content="default"/>
	<script type="text/javascript"> 
	$(document).ready(function() {
			$("#nav li").click(function(){
				$("#nav li").removeClass("me_nav_befault");
				$(this).addClass("me_nav_befault");
			});
			$("#nav li:first").addClass("me_nav_befault");
		});
//导航栏绿点鼠标悬浮出现登出
function logout_one() {//鼠标移入
	$("#logout_one").css("display","none");
	$("#logout_two").css("display","block");
	$("#logout_two button").css("color","#00bfb0");
}
function logout_two() {//鼠标移出
	$("#logout_one").css("display","block");
	$("#logout_two").css("display","none");
}

//左侧导航栏鼠标放上去内容向左逐渐变大
$(document).ready(function(){
  $(".me_ce_nav_two li").hover(function(){//鼠标移入
  	$(this).animate({
		width:'165px'
	})
  },function(){//鼠标移出
  	$(this).animate({
		width:'143px'
	})
  }) 
});

function showMenu(){
	$('#content_left').show();
	$('#content_right').show();
}

function logout(){
	location.href="${ctx}/admLogout";
}
</script>
</head>
<body style="overflow: hidden;">
 <div class="me_nav_all" ><!--导航开始-->
	<a class="me_logo fl ml20 mr10" style="background:#4c4c4c;color:#fff;font-size:20px;line-height:43px;text-align:center;">绿联环保</a>
    <ul class="fl" id="nav">
      	<c:set var="firstMenu" value="true"/>
        <c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
			<c:if test="${menu.parent.id eq 1&&menu.isShow eq 1 && menu.id != 372}">
				<li class="">
		       		<span class="fl"></span>
		       			<a class="fl" href="${ctx}/sys/menu/tree?parentId=${menu.id}" onclick="showMenu();" title="${menu.name}" target="menuFrame" class="menu">${menu.name}</a>
		           	<span class="fl"></span>
		      		 </li>
				<c:if test="${firstMenu}">
					<c:set var="firstMenuId" value="${menu.id}"/>
				</c:if>
				<c:set var="firstMenu" value="false"/>
			</c:if> 
	 	</c:forEach>
      </ul>
	    <div class="me_login_end fr mr10" style="min-width:100px;">
	    	<div class="fl me_shop_name"><shiro:principal property="name"/></div>
	        <div class="fr me_login_end_drop ml5" id="logout_one" style="display:block;" onMouseMove="logout_one();"></div>
	        <div class="me_logout fr ml5" onMouseOut="logout_two();" id="logout_two" style="display:none">
	        	<button onclick="logout()" class="me_login_end_logout">登出</button>
	        </div>
	    </div>
    	<div class="cb"></div>
	</div><!--导航结束-->
     <div id="content_left" style="width:187px;position: fixed;top:0;left:0;height:100%;">
    	<iframe id="menuFrame" name="menuFrame" src="${ctx}/sys/menu/tree?parentId=${firstMenuId}" style="overflow:visible;height:100%;"
					scrolling="yes" frameborder="no" width="100%" height="750px" onload="javascript:dyniframesize('menuFrame');">
		</iframe>
     </div>
     <div id="content_right" style="height:100%;position:relative;top:0;bottom:0;left:187px;right:0;">
        <iframe id="mainFrame" name="mainFrame" src="" style="overflow:hidden;height:100%;"
			scrolling="yes" frameborder="no" width="100%" height="718px" >
		</iframe>
     </div>
</body>
</html>