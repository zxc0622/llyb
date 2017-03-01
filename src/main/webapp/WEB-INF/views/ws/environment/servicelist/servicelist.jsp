<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>环保公司-危废服务-服务列表</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
    <style>
        .show-info {
            width: 175px;
            margin-right: 20px;
        }

        .orderbtn {
            width: 60px;
        }

        .row {
            margin-top: 30px;
            position: relative;
            height: 31px;
            overflow: visible;
        }

        .color_a {
            color: #ee7800;
        }
        
        .history{cursor:pointer;}
        .history:hover{
        	background-color: #5ec520;
        }
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>固废供应</div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li class="wf_t_sel">
                    <div class="txt">服务列表</div>
                    <div class="triangle"></div>
                </li>

            </ul>
        </div>

        <div class="center_change_tab center_change_tab_4">
            <div class="chang_btns">
					<span class="tab_sel span-of1">
                        当前办理
                        <a class="color_a">(<font>${serviceMain.currentCount}</font>)</a>
                    </span>
                    <span class="span-of2">
                        历史查询
                    </span>
                    <span class="span-of3">
                        申报申请
                        <a class="color_a">(<font>${serviceMain.appCount}</font>)</a>
                    </span>
                    <span class="span-of4">
                        收运申请
                        <a class="color_a">(<font>${serviceMain.ctCount}</font>)</a>
                    </span>
                    <span class="span-of5">
                        作废申请
                        <a class="color_a">(<font>${serviceMain.delCount}</font>)</a>
                    </span>
                    <span class="span-of6">
                        预约申请
                        <a class="color_a">(<font>${serviceMain.orderCount}</font>)</a>
                    </span>
            </div>
            <div class="c_c_tab_main">
                <div>
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info">进度</div>
                    </div>
                </div>
                <div style="display: none;">
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info">进度</div>
                    </div>
                </div>
                <div style="display: none;">
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info">进度</div>
                    </div>
                </div>
                <div style="display: none;">
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info">进度</div>
                    </div>
                </div>
                <div style="display: none;">
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info">进度</div>
                    </div>
                </div>

                <div style="display: none;">
                    <div class="row">
                        <div class="fl show-info s-show-info">危废服务列表</div>
                        <div class="fl show-info s-show-info">产废方</div>
                        <div class="fl show-info s-show-info orderbtn">预约状态</div>
                        <div class="fl show-info s-show-info orderbtn">操作</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="all_template" style="display: none;">
    <div class="row">
        <span class="fuwu_date">2015-11-11</span>

        <div class="fl show-info">危废服务001</div>
        <div class="fl show-info">A公司</div>
        <div class="fl show-info ">确认并评价</div>
    </div>
</div>

<div id="other_template" style="display: none;">
    <div class="row">
        <span class="fuwu_date">2015-11-11</span>

        <div class="fl show-info">危废服务001</div>
        <div class="fl show-info">A公司</div>
        <div class="fl show-info">确认并评价</div>
        <div class="check_right"></div>
    </div>
</div>

<div id="order_template" style="display: none;">
    <div class="row">
        <span class="fuwu_date">2015-11-11</span>

        <div class="fl show-info">危废服务001</div>
        <div class="fl show-info">A公司</div>
        <div class="fl show-info orderbtn">预约中</div>
        <div class="fl show-info orderbtn">查看</div>
    </div>
</div>

<script type="text/javascript"
        src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/dateUtil.js"></script>

<script>
    var servicelist = {};

    servicelist.allNum = 0;

    servicelist.ctNum = 0;

    servicelist.auditNum = 0;

    servicelist.historyNum = 0;

    servicelist.delNum = 0;

    servicelist.orderNum = 0;

    servicelist.currentTabIndex = 0;

    //事件相关类
    servicelist.event = {};

    //鼠标移动到元素上时变为绿色
    servicelist.event.mouseover = function (obj) {
        $(obj).mouseover(function () {
            $(obj).css("background", "#5ec520 none repeat scroll 0 0");
        });
    };

    //鼠标移动到元素上时变为原样
    servicelist.event.mouseout = function (obj) {
        $(obj).mouseout(function () {
            $(obj).css("background", "");
        });
    };

    servicelist.style = {};

    //添加手型样式
    servicelist.style.addCursor = function (obj) {
        $(obj).css("cursor", "pointer");
    };

    //初始化当前页面信息
    servicelist.initCurrentPage = function () {
        servicelist.getAllApplication();
    };

    //通过标签页的id制定ajax方法
    servicelist.getApplicationByIndex = function (index) {
        window.parent.document.getElementById('rightIframe').height = 0;
        if (index == 0) {
            servicelist.getAllApplication();
        } else if (index == 1) {
            servicelist.getHistoryApplication();
        } else if (index == 2) {
            servicelist.getAuditingApplication();
        } else if (index == 3) {
            servicelist.getCTApplication();
        } else if (index == 4) {
            servicelist.getDelApplication();
        } else if (index == 5) {
            servicelist.getOrderApplication();
        }
        servicelist.currentTabIndex = index;
    };

    //获取所有的危废服务申请
    servicelist.getAllApplication = function () {
        if (servicelist.allNum == 0) {
            url = "${ctx}/ws/environment/servicelist/allApplication";
            servicelist.doAjax(url, servicelist.callbackFunc);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    //获取申报的危废服务申请
    servicelist.getAuditingApplication = function () {
        if (servicelist.auditNum == 0) {
            url = "${ctx}/ws/environment/servicelist/auditingApplication";
            servicelist.doAjax(url, servicelist.callbackFunc2);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    //获取安排收运的危废服务申请
    servicelist.getCTApplication = function () {
        if (servicelist.ctNum == 0) {
            url = "${ctx}/ws/environment/servicelist/tpAppliccation";
            servicelist.doAjax(url, servicelist.callbackFunc3);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    //获取历史的危废服务申请
    servicelist.getHistoryApplication = function () {
        if (servicelist.historyNum == 0) {
            url = "${ctx}/ws/environment/servicelist/historyApplication";
            servicelist.doAjax(url, servicelist.callbackFunc4);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    //获取终止的危废服务申请
    servicelist.getDelApplication = function () {
        if (servicelist.delNum == 0) {
            url = "${ctx}/ws/environment/servicelist/delAppliccation";
            servicelist.doAjax(url, servicelist.callbackFunc5);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    //获取终止的危废服务申请
    servicelist.getOrderApplication = function () {
        if (servicelist.orderNum == 0) {
            url = "${ctx}/ws/environment/servicelist/orderAppliccation";
            servicelist.doAjax(url, servicelist.callbackFunc6);
        } else {
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
        }
    };

    servicelist.doAjax = function (url, callback) {
        var data = {};
        $.post(url, data, callback);
    };

    //执行ajax方法
    /* servicelist.doAjax = function(index, callback) {
     var data = {};
     var url = "";
     if (index == 0) {
     url = "/ws/environment/servicelist/allApplication";
     $.post(url, data, servicelist.callbackFunc);
     } else if (index == 2) {
     url = "/ws/environment/servicelist/auditingApplication";
     $.post(url, data, servicelist.callbackFunc2);
     } else if (index == 3) {
     url = "/ws/environment/servicelist/tpAppliccation";
     $.post(url, data, servicelist.callbackFunc3);
     }
     }; */

    //ajax回调函数(所有申请)
    servicelist.callbackFunc = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawAllService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.allNum = 1;
        }
    };

    //ajax回调函数(申报申请)
    servicelist.callbackFunc2 = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawAuditingService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.auditNum = 1;
        }
    };

    //ajax回调函数(收运申请)
    servicelist.callbackFunc3 = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawCTService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.ctNum = 1;
        }
    };

    ////ajax回调函数(历史申请)
    servicelist.callbackFunc4 = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawHistoryService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.historyNum = 1;
        }
    };

    servicelist.callbackFunc5 = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawDelService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.delNum = 1;
        }
    };

    servicelist.callbackFunc6 = function (json) {
        if (json.isSuccess) {
            servicelist.clearObj();
            $.each(json.obj, function (n, value) {
                servicelist.drawOrderService(value);
            });
            servicelist.fillCount(json.obj.length);
            window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
            servicelist.orderNum = 1;
        }
    };

    //将时间字符串格式化成yyyy-MM-dd格式
    servicelist.formatDate = function (strDate) {
        var date = dateUtil.getDate(strDate);
        return date.format("yyyy-MM-dd");
    };

    var dateGroup = "";

    //清空变量或元素
    servicelist.clearObj = function () {
        dateGroup = "";
    };

    //将格式化后的时间装填到class为fuwu_date的span标签中
    servicelist.fillFuwuDate = function (strDate, template) {
        var date = servicelist.formatDate(strDate);
        if (dateGroup != date) {
            $(template).find(".fuwu_date").text(date);
            dateGroup = date;
        } else {
            $(template).find(".fuwu_date").text("");
        }
    };

    servicelist.fillCount = function (count) {
        var index = servicelist.currentTabIndex;
        $(".center_change_tab .chang_btns span").eq(index).find("font")
                .text(count);
    };

    //获取标记所对应的状态
    servicelist.getStatus = function (epStep) {
        var status = "";
        if (epStep == '00') {
            status = "审核资料并报价";
        } else if (epStep == '10') {
            status = "上传合同及资料";
        } else if (epStep == '20') {
            status = "确认管理计划表";
        } else if (epStep == '50') {
            status = "审批材料";
        } else if (epStep == '60') {
            status = "安排收运";
        } else if (epStep == '70') {
            status = "流程结束";
        } else {
            status = "未知";
        }
        return status;
    };

    //画获取所有危废申请信息的页面
    servicelist.drawAllService = function (json) {
        var template = $("#all_template .row").clone();
        servicelist.fillFuwuDate(json.create_date, template);
        $(template).find(".show-info").eq(0).text("危废服务" + json.id);
        $(template).find(".show-info").eq(1).text(json.comp_name);
        var status = servicelist.getStatus(json.ep_step);
        $(template).find(".show-info").eq(2).text(status);
        servicelist.style.addCursor($(template).find(".show-info").eq(2));
        servicelist.event.mouseover($(template).find(".show-info").eq(2));
        servicelist.event.mouseout($(template).find(".show-info").eq(2));
        servicelist.spikToPage($(template).find(".show-info").eq(2),
                json.id);
        $(".c_c_tab_main > div").eq(0).append(template);
    };

    //跳转页面
    servicelist.spikToPage = function (obj, id) {
        $(obj).bind(
                "click",
                function () {
                    window.parent.document.getElementById('rightIframe').height = 0;
                    servicelist.win.openNewWin("${ctx}/ws/environment/servicelist/spikToPage?id="
                            + id, "_self");
                });
    };

    //画获取历史危废服务申请信息
    servicelist.drawHistoryService = function (json) {
        var template = $("#all_template .row").clone();
        servicelist.fillFuwuDate(json.create_date, template);
        $(template).find(".show-info").eq(0).text("危废服务" + json.id);
        $(template).find(".show-info").eq(1).text(json.comp_name);
        var status = servicelist.getStatus(json.ep_step);
        //$(template).find(".show-info").eq(2).text(status);
        $(template).find(".show-info").eq(2).text("支付完成，流程结束");
        $(template).find(".show-info").eq(2).attr("id",json.id);
        $(template).find(".show-info").eq(2).addClass("history");
        $(".c_c_tab_main > div").eq(1).append(template);
    };

    //画获取危废申报申请信息的页面
    servicelist.drawAuditingService = function (json) {
        var template = $("#other_template .row").clone();
        servicelist.drawATAndCTService(template, json, "at");
        $(".c_c_tab_main > div").eq(2).append(template);
    };

    //画获取危废收运申请信息的页面
    servicelist.drawCTService = function (json) {
        var template = $("#other_template .row").clone();
        servicelist.drawATAndCTService(template, json, "ct");
        $(".c_c_tab_main > div").eq(3).append(template);
    };

    //画获取历史危废服务申请信息
    servicelist.drawDelService = function (json) {
        var template = $("#all_template .row").clone();
        servicelist.fillFuwuDate(json.create_date, template);
        $(template).find(".show-info").eq(0).text("危废服务" + json.id);
        $(template).find(".show-info").eq(1).text(json.comp_name);
        var status = servicelist.getStatus(json.ep_step);
        $(template).find(".show-info").eq(2).text(status);
        $(".c_c_tab_main > div").eq(4).append(template);
    };

    //画预约申请
    servicelist.drawOrderService = function (json) {
        var template = $("#order_template .row").clone();
        servicelist.fillFuwuDate(json.create_date, template);
        $(template).find(".show-info").eq(0).text("危废服务" + json.id);
        $(template).find(".show-info").eq(1).text(json.comp_name);
        servicelist.style.addCursor($(template).find(".show-info").eq(3));
        servicelist.event.mouseover($(template).find(".show-info").eq(3));
        servicelist.event.mouseout($(template).find(".show-info").eq(3));
        $(template).find(".show-info").eq(3).bind("click", function () {
            var url = "${ctx}/ws/productwaste/pwbaseinfo/veiwServiceMainDetail?id=" + json.id;
            servicelist.win.openNewWin(url, "_self");
        });
        $(".c_c_tab_main > div").eq(5).append(template);
    };

    //画申报和收运申请的危废服务页面
    servicelist.drawATAndCTService = function (template, json, type) {
        servicelist.fillFuwuDate(json.create_date, template);
        $(template).find(".show-info").eq(0).text("危废服务" + json.id);
        $(template).find(".show-info").eq(1).text(json.comp_name);
        var status = "";
        var status = servicelist.getStatus(json.ep_step);
        $(template).find(".show-info").eq(2).text(status);
        servicelist.style.addCursor($(template).find(".show-info").eq(2));
        servicelist.event.mouseover($(template).find(".show-info").eq(2));
        servicelist.event.mouseout($(template).find(".show-info").eq(2));
        servicelist.spikToPage($(template).find(".show-info").eq(2),
                json.id);
        //点击勾选只点一下
        if (type == "ct") {
            servicelist.drawCheckbox(json.id, json.tp_notice, template);
        } else {
            servicelist.drawCheckbox(json.id, json.offer_upload, template);
        }
    };

    //处理申报和收运申请前面的复选框
    servicelist.drawCheckbox = function (id, data, template) {
        if (data == 1) {
            $(template).find(".check_right").addClass('check_right_sel');
        }
        $(template).find(".check_right").bind("click", function () {
            servicelist.spikToAudit(id);
        });
    };

    //跳转到审核并报价页面
    servicelist.spikToAudit = function (id) {
        window.parent.document.getElementById('rightIframe').height = 0;
        servicelist.win.openNewWin("${ctx}/ws/environment/audit?id=" + id, "_self");
    };

    servicelist.win = {
        openNewWin: function (url, type) {
            var timestamp = new Date().getTime();
            if (url.indexOf("?") > 0) {
                url = url + "&timestamp=" + timestamp;
            } else {
                url = url + "?timestamp=" + timestamp;
            }
            window.open(url, type);
        }
    };

    $(function () {
        //tab切换
        $(".center_change_tab .chang_btns span").click(
                function () {
                    var index = $(this).index();
                    $(this).addClass('tab_sel').siblings('span')
                            .removeClass('tab_sel');
                    $(this).parents(".center_change_tab").find(
                            ".c_c_tab_main>div").eq(index).show()
                            .siblings().hide();
                    servicelist.getApplicationByIndex(index);
                });

        servicelist.initCurrentPage();
        
        //查看订单详情
        $("body").on("click",".history",function(){
        	self.location.href="${ctx}/ws/environment/uploadfile?history=1&id="+$(this).attr("id");
        });
    });
</script>
</body>
</html>
