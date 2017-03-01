<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/21
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>信息管理-商品管理-竞价</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

    <style>
        .tab_main_result table tr td h6{position:absolute; z-index:2; left:0; color:#5cb531; border:1px solid #5cb531; padding:1px 3px; width:34px;}
        /*标题绿色*/
        .tab_main_result table tr td:nth-of-type(3):hover{color:#5cb531;}


    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>商品管理>竞价</div>
    <div class="tab_main" style="margin-bottom:20px;">
        <div class="tab_title">
            <span onclick="add()">新建竞价</span>
            <span data-inn="2" onclick="jump(2)">已发布</span>
            <span data-inn="1" onclick="jump(1)">审核中</span>
            <span data-inn="0"  onclick="jump(0)">未通过</span>
            <span data-inn="4"  onclick="jump(4)">已过期</span>
        </div>
        <form action="">
            <!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="fenlei" onChange="" >
                    <option value="0" selected>所有分类</option>
                   <c:forEach items="${ks}" var="k">
                       <option value="${k.id}">${k.name}</option>

                   </c:forEach>
                </select>
                <input type="text" style="width:330px" class="sitiu" value="${title}"/>
                <input type="button" value="搜索" class="sitiu" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置" class="sitiu"/>
            </div>

            <!--筛选结果-->
            <div class="tab_main_result">
                <table>
                    <tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
                        <th style="width:110px">图片</th>
                        <th style="width:120px">标题</th>
                        <th style="width:120px">商品类别</th>
                        <th style="width:130px">添加时间</th>
                        <th style="width:120px">浏览</th>
                        <c:if test="${con ne 4}">
                            <th style="width:60px">管理</th>
                        </c:if>

                    </tr>
                    <c:forEach items="${cs}" var="c">
                        <tr>
                            <td><input type="checkbox" name="choose" value="${c.id}" ></td>
                            <td>
                                <c:if test="${not empty c.pic1 }">
                                    <img src="${c.pic1 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty c.pic1 && not empty c.pic2 }">
                                    <img src="${c.pic2 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty c.pic1 && empty c.pic2 && not empty c.pic3 }">
                                    <img src="${c.pic3 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty c.pic1 && empty c.pic2 && empty c.pic3 }">
                                    <img src="${ctxStatic}/img/llhb/default.png" style="width:80px;height:60px;">
                                </c:if>
                            </td>
                            <td>${c.comp_title}</td>
                            <td>${c.pname}</td>
                            <td>${fn:substring(c.instime, 0, 10)}</td>
                            <td onclick="parent.iframeGoToUrl('${ctx}/competition/inforMan/addSee?paramId=${c.id}')">查看</td>
                            <td>
                                <c:if test="${con lt 3 }">
                                    <a class="tr_manage_1" style="position:relative;" onclick="parent.iframeGoToUrl('${ctx}/competition/inforMan/add?paramId=${c.id}')">&nbsp;<h6>修改</h6></a>
                                </c:if>
                                <c:if test="${con ne 4}">
                                    <a class="tr_manage_2" style="position:relative;" onclick="deletethis(${c.id});">&nbsp;<h6 >删除</h6></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>


                </table>
            </div>

            <!--翻页-->
            <div class="filp_box">
                <div class="del_all">
                    <input type="button" value="删除选中"/>
                </div>
                <div class="filp">
                    <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                    <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                    <c:set var="currentPage" value="${recordPage.pageNumber}" />
                    <c:set var="totalPage" value="${recordPage.totalPage}" />
                    <c:set var="actionUrl" value="${ctx}/competition/inforMan/check/"/>
                    <c:set var="urlParas" value="?leibie=${leibie }&title=${title }&con=${con}" />
                    <c:set var="pageSizeParaName" value="paginateFenye" />
                    <%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                </div>
            </div>
        </form>

    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    <!--复选框-->
    function SelectAll() {
        var checkboxs=document.getElementsByName("choose");
        for (var i=0;i<checkboxs.length;i++) {
            var e=checkboxs[i];
            e.checked=!e.checked;
        }

    }
    $(function(){
        $("#fenlei option").each(function (){
            if('${leibie}'== $(this).val()){
                $(this).attr('selected','selected');
            }
        });
        $(".cur_tab").removeClass("cur_tab");
        $(".tab_title span").each(function(){
                    if($(this).data("inn") == '${con}'){
                        $(this).addClass("cur_tab");
                    }
                })

    });

    <!--管理的修改删除-->
    <!--管理的修改删除-->
    $("h6").hide();
    $(".tr_manage_1").mouseover(function(){
        $(this).find("h6").show();
    });
    $(".tr_manage_2").mouseover(function(){
        $(this).find("h6").show();
    });
    $(".tr_manage_1").mouseout(function(){
        $("h6").hide();
    });
    $(".tr_manage_2").mouseout(function(){
        $("h6").hide();
    });

    //搜索
    $(".sitiu:eq(1)").click(search);
    //重置
    $(".sitiu:eq(2)").click(reset);


    function search(){
        var a = $("#fenlei").val();
        var t =  $(".sitiu:eq(0)").val();
        window.location.href="${ctx}/competition/inforMan/check?leibie="+a+"&con=${con}&title="+t+"&paginateFenye=${paginateFenye}";
    }
    function reset(){
        $("#fenlei").val('');
        $(".sitiu:eq(0)").val('');
        var a = $(".sitiu:eq(0)").val();
        var t =  $$(".sitiu:eq(0)").val();
        window.location.href="${ctx}/competition/inforMan/check?leibie="+a+"&title="+t;
    }


    //删除
    function deletethis(str){
        parent.showMessYes("确定删除？");
        $(".yes-btn", window.parent.document).unbind().on("click",function(){
            $(".pl_yesorno", window.parent.document).hide();
            $.ajax({
                type : "POST",
                url : "${ctx}/competition/inforMan/delete",
                data : "number="+str,
                dataType : 'text',
                success : function(data) {
                    if(data == "ok"){
                        parent.showMess("删除成功");
                        setTimeout(function(){
                            $(".popumask", window.parent.document).hide();
                            $(".pl_normal", window.parent.document).hide();
                            var aaa = "";
                            if('${leibie}'){
                                aaa +="&leibie=${leibei}";
                            }
                            if('${title}'){
                                aaa +="&title=${title}";
                            }
                            location.href = '${ctx}/competition/inforMan/check?con=${con }'+aaa;
                        },1500);
                    }
                }
            });
        });
    }
    //删除选中的多个复选框
    $(".del_all :button").click(function(){
        var value =[];
        $('input[name="choose"]:checked').each(function(){
            value.push($(this).val());
        });
        if(value == "" || value == null){
            parent.showMess("请选择！");
        }else{
            deletethis(value);
        }
    });

    //跳转页面
    function jump(str){
        location.href = '${ctx}/competition/inforMan/check?con='+str;
    }
    //新建竞价
    function  add(){
        location.href = "${ctx}/competition/inforMan/add";
    }
</script>
</body>
</html>

