<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/5
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>广告预定后台-新增区域</title>
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
        .tab_main input[type="text"]{height:28px;width:150px;}
        .m_r15{margin-right: 15px;}
        .tab_main_row{margin-top: 10px;}
        select{height:32px;}
        table th{border-bottom: 1px solid #ccc;}
        table td{border-bottom: 1px dashed #ccc;}

        .pic_wait_1{float:left; margin-right:10px; width:150px;}
        .pic_wait_1 .a_1{border:1px solid #ccc;height:112px;width:150px; color:#666; float:left; margin-bottom:10px;text-align:center;line-height: 112px;}
        .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
        .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
        .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>广告预定>新增区域</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">新增区域</span>
        </div>
        <form action="${ctx}/adsReser/saveNew" id="form1" method="post">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">当前频道 :</div>
                <div class="fl m_r15"><span>${dp.name}</span></div>
            </div>
           <%-- <div class="tab_main_row clearfix">
                <div class="fl m_r15">上传图片 :</div>
                <div class="pic_wait_1">
                    <a class="a_1" href="javascript:void(0);">等待上传</a>
                    <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                    <a class="a_3" href="javascript:void(0);">&nbsp;</a>
                    <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                </div>
            </div>--%>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">区域名称 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入区域名称" name="area_name" value="${main.area_name}">
                </div>
                <div class="fl m_r15">广告价位 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入广告价位(元/月)" name="price" value="${main.price}">
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">广告形式 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入广告形式" name="adv_type" value="${main.adv_type}">
                </div>
                <div class="fl m_r15">广告规格 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入广告规格" name="adv_size" value="${main.adv_size}">
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">展示序号 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入展示序号" name="show_order" value="${main.show_order}">
                </div>
                <div class="fl m_r15">滚动像素 :</div>
                <div class="fl m_r15">
                    <input type="text" placeholder="请输入滚动像素" name="scroll_px" value="${main.scroll_px}">
                </div>
            </div>


            <div class="tab_main_row clearfix">
                <a href="javascript:save()" class="fl btn"style="margin-left: 70px;">保存</a>
            </div>
            <!--筛选结果-->
            <input type="hidden" name="channel_id" value="${dp.id}">
            <input type="hidden"  value="${user.id}" name="create_by">
            <input type="hidden"  value="${today}" name="create_date">
            <input type="hidden"  value="${oriid}" name="saveid">
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/validation.js"></script>

<script>
    $(function () {
        if('${error}'){
            parent.showMess("保存失败！");
        }
    });

function save(){
    var price = $("input:eq(1)").val();
    var order = $("input:eq(4)").val();
    var scorllpx = $("input:eq(5)").val();
    if(!$.validaNumer(price)||!$.validaNumer(order)||!$.validaNumer(scorllpx)){
        parent.showMess("请输入正确的数字格式");
        return;
    }
    $("#form1").submit();
}
</script>
</body>
</html>
