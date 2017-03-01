<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>论坛后台-版主管理</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
.isgreen{color:#5ec520;}

.tab_main .tab_main_row{height:auto;}
.tab_main_result table tr{height: auto;}
.tab_main_result table tr td{padding:3px;}
.sub_banzhu{margin:0 3px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>论坛管理>版主管理</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">版主管理</span>
        </div>
        <form action="">
            <!--筛选结果-->
            <div class="tab_main_result">
                <table>
                    <tr>
                        <th style="width:200px;">板块名称</th>
                        <th>版主</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td><input readonly="readonly" type="text" value="${board.name}"></td>
                        <td style="max-width: 450px"><a href="javascript:void(0)"class="isgreen">${board.mstNames}</a></td>
                        <td style="width:40px"><a href="javascript:goUrl('${ctx}/forum/board/editor?boardId=${board.id}')"class="isgreen">编辑</a></td>
                    </tr>
                    <c:forEach items="${board.subBoardList}" var="subBoard">
                    <tr>
                        <td>|---- <input readonly="readonly" type="text" value="${subBoard.name}"></td>
                        <td><a href="javascript:void(0)"class="isgreen sub_banzhu">${subBoard.mstNames}</a></td>
                        <td style="width:40px"><a href="javascript:goUrl('${ctx}/forum/board/editor?boardId=${subBoard.id}')"class="isgreen">编辑</a></td>
                    </tr>
                    </c:forEach>
                    </c:forEach>
                    <!-- <tr>
                        <td>|---- <input readonly="readonly" type="text" value="子版块"></td>
                        <td><a href="javascript:void(0)"class="isgreen sub_banzhu">yyhb001</a><a href="javascript:void(0)"class="isgreen sub_banzhu">yyhb001</a><a href="javascript:void(0)"class="isgreen sub_banzhu">yyhb001</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen">编辑</a></td>
                    </tr>
                    <tr>
                        <td><input readonly="readonly" type="text" value="主版块"></td>
                        <td><a href="javascript:void(0)"class="isgreen">yyhb001</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen">编辑</a></td>
                    </tr>
                    <tr>
                        <td>|---- <input readonly="readonly" type="text" value="子版块"></td>
                        <td><a href="javascript:void(0)"class="isgreen sub_banzhu">无</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen">编辑</a></td>
                    </tr> -->
                </table>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
        $(".tab_title span").click(function(){
            var index=$(this).index();
            $(this).addClass('cur_tab').siblings().removeClass('cur_tab');
            $("form > div").eq(index).show().siblings().hide();
        }); 
    })
               
</script>
</body>
</html>