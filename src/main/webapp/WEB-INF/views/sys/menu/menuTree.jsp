<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单导航</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript"> 
		$(document).ready(function() {
			$(".me_ce_nav_two li").click(function(){
				$(".me_ce_nav_two li").removeClass("me_ce_nav_befault");
				$(this).addClass("me_ce_nav_befault");
			});
			$(".me_ce_nav_two a:first i").click();
		});
		
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
	</script>
</head>
<body>
	<div class="me_content_left" id="content_left">
      <div class="fl me_nav_mune">
   <c:set var="menuList" value="${fns:getMenuList()}"/>
		<c:set var="firstMenu" value="true"/>
		<c:forEach items="${menuList}" var="menu" varStatus="idxStatus">
		<c:if test="${menu.parent.id eq (not empty param.parentId?param.parentId:1)&&menu.isShow eq 1}">
		          <ul>
		              <li class="font_size_14 me_ce_nav_one"><img class="mr15" src="${ctxStatic}/img/catalog.png" />${menu.name}</li>
		              <li>
		                  <ul class="me_ce_nav_two">
		                   <c:forEach items="${menuList}" var="menuChild"><c:if test="${menuChild.parent.id eq menu.id&&menuChild.isShow eq 1}">
		                 	<li class="mt3 fr"><a href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" target="${not empty menuChild.target?menuChild.target:'mainFrame'}"><i class="icon-${not empty menuChild.icon?menuChild.icon:'circle-arrow-right'}"></i>&nbsp;${menuChild.name}</a></li>
					  	<c:set var="firstMenu" value="false"/></c:if></c:forEach>
		                   <div class="cb"></div>
		                  </ul>
		              </li>
		          </ul>
		</c:if>
		   </c:forEach> 
  	</div>
  	</div>
</body>
</html>