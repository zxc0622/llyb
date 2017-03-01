<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%
// 如下参数需要在 include 该页面的地方被赋值才能使用，以下是示例
/*  
	<c:set var="currentPage" value="${blogPage.pageNumber}" />
	<c:set var="totalPage" value="${blogPage.totalPage}" />
	<c:set var="actionUrl" value="/blog/" />
	<c:set var="urlParas" value="" />
*/
%>
<style>
/*.filp .gap{display:block; width:12px; line-height:27px; float:left; margin-left:10px;}
.filp a{float:left;}
.filp input{float:left;}*/
</style>
<c:if test="${urlParas == null}">
	<c:set var="urlParas" value="" />
</c:if>
<c:if test="${totalPage < 1}">
<div class="filp">
	<input type="button" value="上一页" style="width:60px;" class="prev_page"/>
	<input type="button" value="下一页" style="width:60px;" class="next_page"/>
	<a>共<span>0</span>条/<span>0</span>页</a>
	<input type="text" style="width:30px;" value="0">
	<input type="button" value="跳转" style="width:60px;">
	<%--每页显示<input type="text" id="fenye" style="width:30px;" value="${pageSize}">条
	<input type="button" value="确定" style="width:60px;">--%>
</div>
</c:if>
<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
	<c:set var="startPage" value="${currentPage - 1}" />
	<c:if test="${startPage < 1}" >
		<c:set var="startPage" value="1" />
	</c:if>
	<c:set var="endPage" value="${currentPage + 1}" />
	<c:if test="${endPage > totalPage}" >
		<c:set var="endPage" value="${totalPage}" />
	</c:if>
	
	<div class="filp">
		<c:if test="${currentPage <= 4}">
			<c:set var="startPage" value="1" />
		</c:if>
		
		<c:if test="${(totalPage - currentPage) < 4}">
			<c:set var="endPage" value="${totalPage}" />
		</c:if>
		
		<c:choose>
			<c:when test="${currentPage == 1}">
                <input type="button" value="上一页" style="width:60px;" class="fanye_left prev_page"/>
			</c:when>
			<c:otherwise>
                <input type="button" value="上一页" style="width:60px;" class="fanye_left prev_page"/>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${currentPage > 4}">
			<a href="javascript:void(0);" onclick="fenyeTiao(1)">${1}</a>
            <a href="javascript:void(0);" onclick="fenyeTiao(2)">${2}</a>
			<span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>
		</c:if>
		
		 <c:forEach begin="${startPage}" end="${endPage}" var="i">
			<c:choose>
				<c:when test="${currentPage == i}">
                    <input type="button" value="${i}" class="cur_fanye_btn"/>
				</c:when>
				<c:otherwise>
                    <a href="javascript:void(0);" onclick="fenyeTiao(${i})">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${(totalPage - currentPage) >= 4}">
			<span class="gap" style="display:block; width:12px; line-height: 27px; float:left; margin-left:10px">…</span>
            <a href="javascript:void(0);" onclick="fenyeTiao(${totalPage - 1})">${totalPage - 1}</a>
            <a href="javascript:void(0);" onclick="fenyeTiao(${totalPage})">${totalPage}</a>

        </c:if>
		
		<c:choose>
			<c:when test="${currentPage == totalPage}">
                <input type="button" value="下一页" style="width:60px;" class="fanye_right next_page"/>
			</c:when>
			<c:otherwise>
                <input type="button" value="下一页" style="width:60px;" class="fanye_right next_page"/>
			</c:otherwise>
		</c:choose>
		<a>共<span>${totalRow }</span>条/<span>${totalPage }</span>页</a>
        <input type="text" style="width:30px;" id="tiaozhuantext" value="${currentPage }">
        <input type="button" value="跳转" id="tiaozhuan" style="width:60px;">
	</div>
</c:if>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script>
	var showMess = parent.showMess ? parent.showMess : showMess;
	var re = /\d+(\.\d+)*/ig;

	/*function getUrl(pageNum, isConfirmBtn) {
		var paginateFenye = parseInt($("#fenye").val());
		if (paginateFenye == "") {
			paginateFenye = 10;
		}
		var oldPageSzie = ${pageSize};
		var url = "";
		if (isConfirmBtn) {
			if (paginateFenye != oldPageSzie) {
				var url = '${actionUrl}' + 1 + '${urlParas}&${pageSizeParaName}=' + paginateFenye;
			} else {
				var url = '${actionUrl}' + pageNum + '${urlParas}&${pageSizeParaName}=' + paginateFenye;
			}
		} else {
			var url = '${actionUrl}' + pageNum + '${urlParas}&${pageSizeParaName}=${pageSize}';
		}
		return url;
	}

	//上一页
	$(".prev_page").click(function () {

		if ('${currentPage}' != 1) {
			window.location.href = getUrl(${currentPage - 1}, false);
		} else {
			showMess("当前已经是第一页");
			return;
		}
	});

	//下一页
	$(".next_page").click(function () {

		if (('${currentPage}' != '${totalPage}')&&('${totalPage}'!=0)) {
			window.location.href = getUrl(${currentPage + 1}, false);
		} else {
			showMess("已经是最后一页");
			return;
		}
	});

	//跳转
	$("#tiaozhuan").click(function () {

		var text = parseInt($("#tiaozhuantext").val());
		if (re.test(text) && (text <= '${totalPage}')) {
			window.location.href = getUrl(text, false);
		} else {
			showMess("请输入正确格式的页码或正确范围的页码");
			return;
		}
	});

	//每页显示多少条
	$("#fenye").next().click(function () {

		var paginateFenye = parseInt($("#fenye").val());
		if (re.test(paginateFenye) && (paginateFenye <= '${totalRow}')) {
			window.location.href = getUrl(${currentPage}, true);
		} else {
			showMess("请输入正确的数字格式或正确范围的条数");
			return;
		}
	});*/

	/*//提示框
在自己的页面添加这两段
	 <div class="popumask" style="z-index: 1;"></div>
	 <div class="populayer pl_normal" >
	 <div class="layer_top">
	 <span>提示</span>
	 <a href="javascript:void(0)" class="close_btn">X</a>
	 </div>
	 <div class="pl_content font_3">
	 <p></p>
	 </div>
	 </div>


	function showMess(str) {
		debugger;
		$(".popumask").show();
		$(".pl_normal .pl_content p").html(str);
		$(".pl_normal").show();
		setTimeout(function () {
			$(".popumask").fadeOut();
			$(".pl_normal .pl_content p").html("");
			$(".pl_normal").hide();
		}, 3000);
	}*/
</script>
