<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>数据收集-用户建议列表</title>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css"/>
    <style>
        table img{width:80%;height:80%;max-height:60px;}
        .tab_main_result table tr th{padding:0 ;}
        .tab_main_result table tr td:nth-child(7) a h6{width:34px;}
    </style>
</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>数据收集>用户建议列表</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">用户建议列表</span>
        </div>
        <form id="form">
            <div class="tab_main_row">
                <input id="uname" name="queryWord" type="text" value="${queryWord }" style="width:245px;"/>
                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
            </div>
            <!--筛选结果-->
            <div class="tab_main_result">
                <table>
                    <tr>
                        <th style="width:40px">编号</th>
                        <th style="">留言内容</th>
                        <th style="">是否联系</th>
                        <th style="">联系人</th>
                        <th style="">联系电话</th>
                        <th style="">电子邮件</th>
                        <th style="">QQ</th>
                    </tr>
                    <c:forEach items="${recordPage.list }" var="s" varStatus="sta">
                        <tr>
                            <td>${sta.index + 1}</td>
                            <td>${s.sug_content}</td>
                            <td>
                                <c:if test="${s.need_relation}">
                                    需要
                                </c:if>
                                <c:if test="${!s.need_relation}">
                                    不需要
                                </c:if>
                            </td>
                            <td>${s.rela_user}</td>
                            <td>${s.rela_phone}</td>
                            <td>${s.rela_mail}</td>
                            <td>${s.rela_qq}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

            <!--翻页-->
            <div class="filp_box">
                <div class="del_all">
                </div>
                <div class="filp">
                    <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                    <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                    <c:set var="currentPage" value="${recordPage.pageNumber}" />
                    <c:set var="totalPage" value="${recordPage.totalPage}" />
                    <c:set var="actionUrl" value="${ctx}/dataCollection/userSuggestions/"/>
                    <c:set var="urlParas" value="?queryWord=${queryWord }" />
                    <c:set var="pageSizeParaName" value="pageSize" />
                    <%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
    $(function(){
        $(".tab_main_row :button:eq(0)").click(search);
        $(".tab_main_row :button:eq(1)").click(reset);


        <%--$("#fenye").next().click(function(){--%>
            <%--var t =  $(".tab_main_row :text").val();--%>
            <%--var  paginateFenye =$("#fenye").val();--%>
            <%--window.location.href="${ctx}/dataCollection/loginLog?paginateFenye="+paginateFenye+"&uname="+t;--%>
        <%--});--%>
    });
    $(document).ready(function(){
        //回车事件
        $('#uname').bind('keypress',function(event){
            if(event.keyCode == "13")  {
                search();
            }
        });
        //仅输入数字
        $(".filp :text:last").keyup(function(){
            $(this).val($(this).val().replace(/[^0-9]/g,''));
        }).bind("paste",function(){  //CTR+V事件处理
            $(this).val($(this).val().replace(/[^0-9]/g,''));
        }).css("ime-mode", "disabled"); //CSS设置输入法不可用
    });
    //搜索
    function search(){
        var t =  $(".tab_main_row :text").val();
        window.location.href="${ctx}/dataCollection/userSuggestions?queryWord="+t;
    }
    //重置
    function reset(){
        $(".tab_main_row :text").val('');
        window.location.href="${ctx}/dataCollection/userSuggestions?queryWord="+'';
    }

</script>
</body>
</html>