<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>信息管理-供应-已发布</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>

    <style>
        /* .tab_main_row .demandSecond{display:none} */
        .tab_main_row.xuanzhong{display:block;}
        .tab_main_result img{width:80px;height:60px;}
        .tab_main_result table tr td{text-indent:0px;}
        .tab_main_result table th{text-indent:0px;}
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>固废供应</div>
    <div class="tab_main">
        <div class="tab_title">
            <span onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidAdd')">添加固废供应</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidSupply?order=0')">已发布</span>
            <span class="m_r_tname" onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidSupply?order=1')">审核中</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidSupply?order=2')">未通过</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidSupply?order=3')">已过期</span>
        </div>
        <form action="">
            <!--行业分类筛选-->
            <div class="tab_main_row">
                <select name="" id="demandFirst" class="demandFirst" onChange="jiazai()" >
                    <option value='0'>行业选择</option>
                    <c:forEach items="${demands }" var="demand">
                        <c:if test="${demand.parent.id eq (not empty param.parentId?param.parentId:428)}">
                            <c:set var="id" value="${demand.id }"></c:set>
                            <c:set var="first" value="${first }"></c:set>
                            <c:choose>
                                <c:when test="${second1 eq id}">
                                    <option value="${demand.id }" selected = "selected">${demand.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${demand.id }">${demand.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </select>
                <select name="" id="demandSecond"  >
                    <option value='0'>行业选择</option>
                    <c:if test="${second1 != null }">
                        <c:forEach items="${secondList }" var="demand">
                            <c:set var="first" value="${first }"></c:set>
                            <c:set var="second" value="${second }"></c:set>
                            <c:set var="id" value="${demand.id }"></c:set>
                            <c:choose>
                                <c:when test="${second eq id}">
                                    <option value="${demand.id }" selected = "selected">${demand.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${demand.id }">${demand.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                </select>
                <%--  <c:forEach items="${demands}" var="demand" >
                      <c:if test="${demand.parent.id eq (not empty param.parentId?param.parentId:428)}">
                      <div class="demandSecond">
                            <select name="" id="demandSecond"  >
                             <c:forEach items="${demands}" var="demandSecond">
                                 <c:if test="${demandSecond.parent.id eq demand.id}">
                                     <option value="${demandSecond.id }" >${demandSecond.name}</option>
                                   </c:if>
                               </c:forEach>
                            </select>
                       </div>
                     </c:if>
                 </c:forEach>    --%>


                <input type="text" value="${title }"/>
                <input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/>
                <input type="button" value="重置"/>
            </div>

            <!--筛选结果-->
            <div class="tab_main_result">
                <table id="showtable">
                    <tr>
                        <th style="width:20px"><input type="checkbox" name="allChecked" onClick="SelectAll()"></th>
                        <th style="width:120px">图片</th>
                        <th style="width:160px">标题</th>
                        <th style="width:120px">行业</th>
                        <th style="width:130px">添加时间</th>
                        <th style="width:120px">浏览</th>
                        <th style="width:60px">管理</th>
                    </tr>
                    <c:forEach items="${records }" var="record" varStatus="status">
                        <tr>
                            <th><input type="checkbox" name="choose" value="${record.id }"></th>
                            <th>
                                <c:if test="${not empty record.pic1 }">
                                    <img src="${record.pic1 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty record.pic1 && not empty record.pic2 }">
                                    <img src="${record.pic2 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty record.pic1 && empty record.pic2 && not empty record.pic3 }">
                                    <img src="${record.pic3 }" style="width:80px;height:60px;">
                                </c:if>
                                <c:if test="${empty record.pic1 && empty record.pic2 && empty record.pic3 }">
                                    <img src="${ctxStatic}/img/llhb/default.png" style="width:80px;height:60px;">
                                </c:if>
                            </th>
                            <c:choose>
                                <c:when test="${order gt 1 }">
                                    <td onclick="parent.iframeGoToUrl('${ctx}/qiugou?see=1&paramId=${record.id}')">${record.info_title }</td>
                                </c:when>
                                <c:otherwise>
                                    <td>${record.info_title }</td>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${not empty record.sdname }">
                                <td>${record.name }-${record.sdname }</td>
                            </c:if>
                            <c:if test="${empty record.sdname }">
                                <td>${record.name }</td>
                            </c:if>
                            <td>${fn:substring(record.create_date, 0, 10)}</td>
                            <td>${record.page_view }</td>
                            <td>
                                <c:if test="${order ge 0 }">
                                    <a class="tr_manage_1" style="position:relative;" onclick="parent.iframeGoToUrl('${ctx}/solidsupply/solidEdit?paramId=${record.id}&orderS=${order }')">&nbsp;<h6>修改</h6></a>
                                </c:if>
                                
                                
                                <a class="tr_manage_2" style="position:relative;" onclick="deletethis(${record.id});">&nbsp;<h6 >删除</h6></a>
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
                <c:set var="currentPage" value="${recordPage.pageNumber}" />
                <c:set var="totalPage" value="${recordPage.totalPage}" />
                <c:set var="actionUrl" value="${ctx}/solidsupply/solidSupply/"/>
                <c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
                <c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                <c:set var="pageSizeParaName" value="paginateFenye" />
             <%--   <c:if test="${toRaw == 1  }">
                    <c:set var="totalRow" scope="page" value="1" />
                </c:if>--%>
               <%-- <c:if test="${recordPage.totalPage eq 0}">
                    <input type="button" value="上一页" style="width:60px;"/>
                    <input type="button" value="下一页" style="width:60px;"/>
                    <a>共<span>0</span>条/<span>0</span>页</a>
                    <input type="text" style="width:30px;" value="0">
                    <input type="button" value="跳转" style="width:60px;">
                </c:if>--%>

                <c:choose>
                    <c:when test="${one == null && two == null && title == null}">
                        <c:set var="urlParas" value="?order=${order }" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="urlParas" value="?order=${order }&one=${one }$two=${two }&title=${title }" />
                    </c:otherwise>
                </c:choose>

                <%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
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
    $(function(){
        //标题样式
        $(".m_r_title").removeClass("m_r_title");
        $(".m_r_tname").removeClass("m_r_tname");
        var proper  =parseInt('${order}')+1 ;
        $(".tab_title").addClass("m_r_title");
        $(".tab_title span").eq(proper).addClass("m_r_title m_r_tname");
        var conditon = "";
        var index='#'+$(".demandFirst option:first").val();
        $(index).addClass("xuanzhong");
        var a = '${second1}';
        var b = '${first}';
        if(a!=null&&b==""){
            jiazai();
        }
        //搜索
        $(".tab_main_row :button").eq(0).click(function(){
            var parent  = $("#demandFirst option:selected").val();
            var child  = $("#demandSecond option:selected").val();
            var sousuoText = $(".tab_main_row :text").val();
            location.href = '${ctx}/solidsupply/solidSupply?order=${order }&one='+parent+"&two="+child+"&title="+sousuoText;
        });
        //重置
        $(".tab_main_row :button").eq(1).click(function(){
            $(".tab_main_row :text").val('');
            $('#demandFirst option').eq(0).attr('selected','selected');
            $('#demandSecond option').eq(0).attr('selected','selected');
        });
        /* $("#demandSecond").change(function(){
         conditon = $(this).val();
         if(conditon != 0){
         location.href = '${ctx}/solidsupply/solidSupply?order=${order }&conditon='+conditon;
         }
         }); */

    });

    //触发一级行业加载二级
    function jiazai(){

        $("#demandSecond").text('');
        var parent  = $("#demandFirst option:selected").val();
        /* if(parent == 0){
         location.href = '${ctx}/solidsupply/solidSupply?order=${order }';
         }  */
        //加载二级
        $.ajax({
            type : "POST",
            url : "${ctx}/qiugou/getSecond",
            data : "parent="+parent,
            dataType : 'json',
            success : function(data) {
                var htmls="<option value='0'>行业选择</option>";
                $.each(data,function(index, item) {
                    htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#demandSecond").html(htmls);
                /* $("#demandSecond").change(function(){
                 conditon = $(this).val();
                 if(conditon != 0){
                 location.href = '${ctx}/solidsupply/solidSupply?order=${order }&conditon='+conditon;
                 }
                 }); */
            }
        });
    }
    //删除
    function deletethis(str){
        parent.showMessYes("确定删除？");
        $(".yes-btn", window.parent.document).unbind().on("click",function(){
            $(".pl_yesorno", window.parent.document).hide();
            $.ajax({
                type : "POST",
                url : "${ctx}/solidsupply/delSupplys",
                data : "ids="+str,
                dataType : 'text',
                success : function(data) {

                    if(data == 'true'){
                        parent.showMess("删除成功");
                        setTimeout(function(){
                            $(".popumask", window.parent.document).hide();
                            $(".pl_normal", window.parent.document).hide();
                            var aaa = "";
                            if('${one} != 0'){
                                aaa +="&one=${one}";
                            }
                            if('${two} != 0'){
                                aaa +="&two=${two}";
                            }
                            if('${title} != 0'){
                                aaa +="&title=${title}";
                            }
                            location.href = '${ctx}/solidsupply/solidSupply?order=${order }'+aaa;
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

</script>
</body>
</html>