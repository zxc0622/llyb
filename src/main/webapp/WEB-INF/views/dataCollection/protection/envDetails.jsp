<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>环保报价</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huanbaobaojia_index.css"/>
    <style>

        /*页面修改*/


        .pl_index_shenqing_table{width:100%;z-index: 1;display: block;}
        .pl_index_shenqing_table .pl_content > p{text-align: center;margin-top: 30px;margin-bottom: 10px;line-height: 25px;}
        .pl_index_shenqing_table .pl_content .per-row{padding-left: 181px;overflow: hidden;height: auto;margin-top: 10px;line-height: 30px;}
        .pl_content .per-row>*{float:left;margin-left: 15px;}
        .per-row select{height: 30px;border: 1px solid #CCC;}
        .per-row textarea{border:1px solid #ccc;text-indent: 5px;}
        .per-row input[type=radio]{margin-top: 8px;}
        .per-row .per-row-p{font-size: 12px;width:100%;}
        .xiangmu_detail{text-align: center;margin-bottom: 20px;}
        .checkone{width:100%;}
        /*展开收起*/
        .per-row-slide{position:relative;padding:3px 0;}
        .per-row-slide-tir-up{left:613px;top:0px;position: absolute;width:0;height:0;border:8px solid transparent;border-bottom-color:#666;cursor:pointer;}
        .per-row-slide-tir-up.per-row-slide-tir-down{border-bottom-color:transparent;border-top-color:#666;top:5px;}
        .color_red{color:red;}
        .color_lv{color:#5EC520;}

        .wrapper{width:auto;min-width:auto;}
        .wrapper .main{width:auto;}
    </style>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <%--<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>--%>
</head>
<body>
<!--头部 start-->

<!--头部 end-->

<!--中间部分 start-->
<div class="main_right">

    <!--中间内容 start-->
    <div class="tab_main_row">
        <div class="pl_index_shenqing_table contentNav">
            <div class="pl_content ">
                <p class="font_3 color_lv">
                    根据专家团队多年行业经验沉淀,<br/>收集您的项目详情如下:
                </p>
                <div class="xiangmu_detail">
                    公司名为<span class="color_red">${r.comp_name }</span>,项目名称为<span class="color_red">${r.pro_name }</span>,该项目位于<span class="color_red">${r.aname }</span><span>${r.aaname }</span>,类别为<span class="color_red">${r.hname }</span>
                </div>
                <div class="per-row row-xiangmuleibie">
                    <span>项目类别 :</span>
                    <select name="" id="offhead" disabled>
                        <option value="0">&nbsp;</option>
                        <c:forEach var="province" items="${offHeads }">
                            <option value="${province.hid}">${province.hname}</option>
                        </c:forEach>
                    </select>
                    <select name="" id="offline" disabled>
                        <option value="0">&nbsp;</option>
                        <c:forEach var="province" items="${offlines }">
                            <option value="${province.lid}">${province.lname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="per-row row-jianshedidian">
                    <span>建设地点 :</span>
                    <select name="" id="province" disabled>
                        <option value="0">省</option>
                        <c:forEach var="province" items="${provinceList }">
                            <option value="${province.id}">${province.name}</option>
                        </c:forEach>
                    </select>
                    <select name="" id="city" disabled>
                        <option value="0">市</option>
                        <c:forEach var="province" items="${citys }">
                            <option value="${province.id}">${province.name}</option>
                        </c:forEach>
                    </select>
                    <select name="" id="country" disabled>
                        <option value="0">县</option>
                        <c:forEach var="province" items="${countrys }">
                            <option value="${province.id}">${province.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="per-row-slide">
                    <div class="per-row-slide-tir-up "title="点击收起">
                    </div>
                    <div class="slide-mian">
                        <c:forEach items="${offds }" var="d" varStatus="sta">
                            <c:set value="${fn:substring(array, sta.index, sta.index+1)  }" var="ct"></c:set>
                            <c:if test="${d.type_id eq 1}">
                                <div class="per-row">
                                    <span class="result_span_title">${d.detail_type_name }</span>
                                    <div class="checkone checkon_person">
                                        <c:if test="${ct eq 1 }">
                                            <p><span class="l_square checkone_sel"></span><span>是</span></p>
                                            <p><span class="l_square "></span><span>否</span></p>
                                        </c:if>
                                        <c:if test="${ct ne 1 }">
                                            <p><span class="l_square"></span><span>是</span></p>
                                            <p><span class="l_square checkone_sel"></span><span>否</span></p>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${d.type_id eq 0}">
                                <div class="per-row">
                                    <span class="result_span_title">${d.detail_type_name }</span>
                                    <div class="checkone checkon_person">
                                        <c:if test="${ct eq 1 }">
                                            <p><span>选择</span><span class="l_square checkone_sel"></span></p>
                                        </c:if>
                                        <c:if test="${ct ne 1 }">
                                            <p><span>选择</span><span class="l_square"></span></p>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="per-row">
                    <span>电 &nbsp; 话 :</span>
                    <input type="text" value="${r.tel }" readonly>
                </div>
                <div class="per-row">
                    <span>姓 &nbsp; 名 :</span>
                    <input type="text" value="${r.name }" readonly>
                </div>
                <div class="per-row">
                    <span>报价信息 :</span>

                </div>
                <div class="per-row">
                    <textarea name="" id="txt" cols="60" rows="5">${r.reremark}</textarea>
                </div>
                <div class="per-row color_red">
                    <p class="per-row-p">备注：1、平台提供的报价结果为区域平均价格，具体价格以实际情况为准，</p>
                    <p class="per-row-p"style="text-indent: 55px;">仅供参考；</p>
                    <p class="per-row-p"style="text-indent: 36px;">2、平台1个工作日内推荐专业环评公司与您取得联系并提供服务。</p>
                </div>
                <div class="per-row">
                    <a href="javascript:back();" class="btn" style="margin-left: 155px;">返回</a>
                </div>
            </div>
        </div>
    </div>
    <!--中间内容 end-->
</div>
<!--中间部分 end-->

<!--底部 start-->

<script>
    $(function(){
        //展开收起


        var winWidth = $(window).width();
        var halfPosition = (winWidth - $(".main").width())/2;
        $(".banner_left").css({left:halfPosition+$(".main").width()-$(".banner_left").width()});
        $(".b_l_img").css({left:halfPosition+$(".main").width()-10});

        if('${r}'){
            $("#txt").attr("value",'${r.reremark}');
            $('#province option').each(function () {
                if('${r.prov_id }' == $(this).val()){
                    $(this).attr('selected','selected');
                }
            });
            $('#city option').each(function () {
                if('${r.city_id }' == $(this).val()){
                    $(this).attr('selected','selected');
                }
            });
            $('#country option').each(function () {
                if('${r.region_id}' == $(this).val()){
                    $(this).attr('selected','selected');
                }
            });
            $('#offhead option').each(function () {
                if('${r.pro_header }' == $(this).val()){
                    $(this).attr('selected','selected');
                }
            });
            $('#offline option').each(function () {
                if('${r.pro_line}' == $(this).val()){
                    $(this).attr('selected','selected');
                }
            });
        }
        tri_slide();
        h_s_bottom_a();
        $('#searchtext').bind('keypress',function(event){
            if(event.keyCode == "13")  {
                goPage();
            }
        });
    });
    function submit(){
        var appr = $("input[type='radio']:checked").val();
        if(appr == undefined){
            showMess("请先选择满意度");

        }else{
            $.ajax({
                type : "POST",
                url : "${ctx}/protection/envAppr",
                data : "appr="+appr+"&eid=${r.id}",
                dataType : 'text',
                success : function(data) {
                    location.href="${ctx}/index";
                }
            });
        }

    }
    //弹出层 添加对号
    $(".checkone p .l_square").trigger("click");
    //不带确定的提示框
    function showMess(str){
        $(".popumask").show();
        $(".pl_normal .pl_content p").html(str);
        $(".pl_normal").show();
        setTimeout(function(){
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        },3000);
    }
    //弹出层 关闭
    $(".populayer .layer_top a").click(function(){
        $(".populayer").fadeOut();
        $(".popumask").fadeOut();
    });
    $(".popumask").click(function(){
        $(".populayer").fadeOut();
        $(".popumask").fadeOut();
    });

    //展开收起
    function tri_slide(){
        $(".per-row-slide-tir-up").click(function() {
            $(this).toggleClass('per-row-slide-tir-down');
            $(".slide-mian").slideToggle();
            if($(this).hasClass('per-row-slide-tir-down')){
                $(this).attr("title","点击展开");
            }else{
                $(this).attr("title","点击收起")
            }
        });
    }
    function h_s_bottom_a(){
        var total_width=0;
        $(".h_s_bottom a").each(function(){
            total_width+=$(this).width();
            if(parseInt(total_width)>350){
                $(this).hide();
            }
        });
    }
    function goPage(){
        var num=$("#biaoji").val();
        var title=$("#searchtext").val();
        switch (parseInt(num)){
            case 0:
                location.href='${ctx}/EntLib?enterprise='+title;
                break;
            case 1:
                location.href='${ctx}/solidsupply/supplyList?title='+title;
                break;
            case 2:
                location.href='${ctx}/qiugou/searchList?searchtext='+title;
                break;
            case 3:
                location.href='${ctx}/mall?proName='+title;
                break;
            case 4:
                location.href='${ctx}/news?title='+title;
                break;
        }
    }
    function che(i){
        var p = "";
        switch (parseInt(i)){
            case 0:
                p = "请输入企业名称";
                break;
            case 1:
                p = "请输入供应一般固体废物信息";
                break;
            case 2:
                p = "请输入求购一般固体废物信息";
                break;
            case 3:
                p = "请输入环保设备、原料、服务名称";
                break;
            case 4:
                p = "请输入资讯关键词";
                break;
        }
        $("#searchtext").attr("placeholder",p);
        $(".h_s_top a").eq(i).addClass("li-sel").siblings().removeClass("li-sel");
        $("#biaoji").val(i);
    }
    function back(){
        location.href="${ctx}/dataCollection/protection/proteList?leibie=${leibei}&title=${title}";
    }
</script>
</body>
</html>