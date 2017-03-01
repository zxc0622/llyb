<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

    .filp_box{overflow:hidden; margin-top:30px;}
    .filp_box .del_all{float:left; margin-right:120px;}
    .filp_box .filp{float:left;}
    .hbshop_disnone{display:none;}

</style>
<%
    // 如下参数需要在 include 该页面的地方被赋值才能使用，以下是示例
/*
    显示条数
    <c:set var="pageSize" scope="page" value="${blogPage.pageSize}"/>
    数据总共的条数
    <c:set var="totalRow" scope="page" value="${blogPage.totalRow}"/>
    当前页码
	<c:set var="currentPage" value="${blogPage.pageNumber}" />
	总共页数
	<c:set var="totalPage" value="${blogPage.totalPage}" />
	访问url
	<c:set var="actionUrl" value="/blog/" />
	将所有参数拼接成参数字符串(其中页码参数需要在controller中通过getParaToInt(0, 1)取出)
	<c:set var="urlParas" value="?step=${step}&condition=${condition}" />
    后台controller中接收每页显示条数的参数名
	<c:set var="pageSizeParaName" value="pageSize" />
	================================================================================
*/
%>
<div class="filp">
    <c:if test="${urlParas == null}">
        <c:set var="urlParas" value=""/>
    </c:if>
    <c:if test="${totalPage < 1}">
        <input type="button" value="上一页" style="width:60px;"/>
        <input type="button" value="下一页" style="width:60px;"/>
        <a>共<span>0</span>条/<span>0</span>页</a>
        <input type="text" style="width:30px;" value="0">
        <input type="button" value="跳转" style="width:60px;">
        每页显示<input type="text" id="fenye" style="width:30px;" value="${pageSize}">条
        <input type="button" value="确定" style="width:60px;">
    </c:if>
    <c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
        <%--<c:set var="startPage" value="${currentPage - 4}"/>
        <c:if test="${startPage < 1}">
            <c:set var="startPage" value="1"/>
        </c:if>
        <c:set var="endPage" value="${currentPage + 4}"/>
        <c:if test="${endPage > totalPage}">
            <c:set var="endPage" value="totalPage"/>
        </c:if>


        <c:if test="${currentPage <= 8}">
            <c:set var="startPage" value="1"/>
        </c:if>

        <c:if test="${(totalPage - currentPage) < 8}">
            <c:set var="endPage" value="${totalPage}"/>
        </c:if>--%>

        <c:choose>
            <c:when test="${currentPage == 1}">
                <input type="button" value="上一页" style="width:60px;" class="disabled prev_page"/>
            </c:when>
            <c:otherwise>
                <input type="button" value="上一页" style="width:60px;" class=" prev_page"/>
            </c:otherwise>
        </c:choose>

        <%-- <c:if test="${currentPage > 8}">
            <a href="${actionUrl}${1}${urlParas}">${1}</a>
            <a href="${actionUrl}${2}${urlParas}">${2}</a>
            <span class="gap">…</span>
        </c:if>

        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <c:choose>
                <c:when test="${currentPage == i}">
                    <span class="current">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="${actionUrl}${i}${urlParas}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>


        <c:if test="${(totalPage - currentPage) >= 8}">
            <span class="gap">…</span>
            <a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
            <a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
        </c:if> --%>

        <c:choose>
            <c:when test="${currentPage == totalPage}">
                <input type="button" value="下一页" style="width:60px;" class="disabled next_page"/>
            </c:when>
            <c:otherwise>
                <input type="button" value="下一页" style="width:60px;" class=" next_page" rel="next"/>
            </c:otherwise>
        </c:choose>
        <a>共<span>${totalRow }</span>条<span>${currentPage}</span>/<span>${totalPage}</span>页</a>
        <input type="text" style="width:30px;" id="tiaozhuantext" value="${currentPage }">
        <input type="button" value="跳转" id="tiaozhuan" style="width:60px;">
       <span class="hbshop_disnone">每页显示</span> 
       <input type="text" class="hbshop_disnone" id="fenye" style="width:30px;" value="${pageSize}"><span class="hbshop_disnone">条</span>
        <input type="button" class="hbshop_disnone"  value="确定" style="width:60px;">
    </c:if>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script>
    var showMess = parent.showMess ? parent.showMess : showMess;
    var re = /\d+(\.\d+)*/ig;

    function getUrl(pageNum, isConfirmBtn) {
        var paginateFenye = parseInt($("#fenye").val());
        if (paginateFenye == "") {
            paginateFenye = 10;
        }
        var oldPageSzie = '${pageSize}';
        var url = "";
        if (isConfirmBtn) {
            if (paginateFenye != Number(oldPageSzie)) {
                postStandUrl('${actionUrl}',{'pageNum':1});
            } else {
                postStandUrl('${actionUrl}',{'pageNum':pageNum});
            }
        } else {
            postStandUrl('${actionUrl}',{'pageNum':pageNum});
        }
    }

    //上一页
    $(".prev_page").click(function () {
        debugger;
        if ('${currentPage}' != 1) {
            getUrl(${currentPage - 1}, false);
        } else {
            showMess("当前已经是第一页");

        }
    });

    //下一页
    $(".next_page").click(function () {
        debugger;
        if ('${currentPage}' != '${totalPage}') {
            getUrl(${currentPage + 1}, false);
        } else {
            showMess("已经是最后一页");

        }
    });

    //跳转
    $("#tiaozhuan").click(function () {
        debugger;
        var text = parseInt($("#tiaozhuantext").val());
        if (re.test(text) && (text <= '${totalPage}')) {
            getUrl(text, false);
        } else {
            showMess("请输入正确格式的页码或正确范围的页码");

        }
    });

    //每页显示多少条
    $("#fenye").next().next().click(function () {
        //debugger;
        var paginateFenye = parseInt($("#fenye").val());
        if (re.test(paginateFenye) && (paginateFenye <= '${totalRow}')) {
           getUrl(${currentPage}, true);
        } else {
            showMess("请输入正确的数字格式或正确范围的条数");

        }
    });

     //提示框
    function showMess(str) {
        //debugger;
        $(".popumask").show();
        $(".pl_normal .pl_content p").html(str);
        $(".pl_normal").show();
        setTimeout(function () {
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        }, 3000);
    }
</script>