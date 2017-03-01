<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>顾问咨询详情</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <style type="text/css">
            .tab_main{border: 1px solid #ccc;padding: 15px 10px 30px;position: relative;}
            .tm_span{width: 140px;display: inline-block;text-align: right;padding-right: 20px;}
        	.tm_p{margin-left: 159px;border: 1px #ccc solid;padding: 5px;}
        	.ft{float: left;}
        	.tm_row{margin-top:10px;}
        	.tm_a{display: block;border: #5ec520 1px solid;width: 100px;height: 25px;color: #757373;text-align: center;line-height: 25px;cursor:pointer;}
        </style>
    </head>
    <body>
		<!-- 右侧开始 -->
		<div class="main_right">
		    <div class="m_r_position font_1">当前位置>信息管理>顾问咨询详情</div>
		    <div class="tab_main">
		        <div class="tm_row"><span class="tm_span">类型：</span>${ac.type}</div>
		        <div class="tm_row">
		        	<span class="tm_span ft">主题：</span>
		        	<p class="tm_p">${ac.title}</p>
		        </div>
		        <div class="tm_row">
		        	<span class="tm_span ft">内容：</span>
		        	<p class="tm_p">${ac.content}</p>
		        </div>
		        <div class="tm_row"><span class="tm_span">联系人：</span>${ac.contact}</div>
		        <div class="tm_row"><span class="tm_span">联系电话：</span>${ac.phone}</div>
		        <div class="tm_row"><span class="tm_span">电子邮箱：</span>${ac.email}</div>
		        <div class="tm_row"><span class="tm_span">QQ：</span>${ac.QQ}</div>
		        <div class="tm_row"><span class="tm_span">发布时间：</span>${ac.create_date}</div>
		        <div class="tm_row">
		        	<a class="tm_a" onclick="history.back()">&lt;返回</a>
		        </div>
		    </div>
		</div>
		<!-- 右侧结束 -->

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        
    </body>
</html>