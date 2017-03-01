<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fs" uri="/WEB-INF/tlds/fs.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	头部中部部分
	适用于固废竞价首页及其子页面
 -->
<div class="header_middle">
    <h1 class="header_logo">
        <a href="javascript:void(0);">
            <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
        </a>
    </h1>
    <div class="header_search">
        <select>
        	<option value="">不限</option>
        <c:forEach items="${fs:getTypeList('waste_type',346)}" var="type">
        	<option value="${type.id}">${type.name}</option>
        </c:forEach>
        </select>
        <div class="h_s_middle font_1">
            <input type="search" value="${compTitle}" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
            <a class="font_3" href="javascript:search();" style="margin-left:-1px;">搜索</a>
        </div>
    </div>
    <div class="header_right">
        <img src="${ctxStatic}/img/llhb/gf_by.png">
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
	function search(){
		var typeFirst = $(".header_search select option:selected").val();
		var compTitle = $(".header_search .h_s_middle input").val();
		go('${ctx}/competition/index/search?typeFirst='+typeFirst+'&compTitle='+compTitle);
	}
	$(function(){
		var typeFirst = "${typeFirst}";
		if(typeFirst!=null){
			$(".header_search select option[value='"+typeFirst+"']").prop("selected",true);
		}
	});
</script>