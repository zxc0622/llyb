<%@ page import="com.qdum.llhb.trademana.enumvalue.PlatformEnum" %>
<%@ page import="com.qdum.llhb.trademana.enumvalue.RepositStatusEnum" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<% request.setAttribute("alipayPlatform", PlatformEnum.alipay.toString());%>
<% request.setAttribute("eBankPlatform", PlatformEnum.eBank.toString());%>
<% request.setAttribute("otherPlatform", PlatformEnum.other.toString());%>
<% request.setAttribute("fail", RepositStatusEnum.fail.toString());%>
<% request.setAttribute("success", RepositStatusEnum.success.toString());%>
<% request.setAttribute("ordered", RepositStatusEnum.ordered.toString());%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>管理员提现操作后台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

    <style>
        .isgreen {
            color: #5ec520;
        }

        .tab_main .tab_main_row {
            height: auto;
        }

        .tab_main_result table tr {
            height: auto;
        }

        .tab_main_result table tr td {
            padding: 3px;
        }

        .sub_banzhu {
            margin: 0 3px;
        }

        .tab_main input[type="text"] {
            height: 28px;
            width: 150px;
        }

        .m_r15 {
            margin-right: 15px;
        }

        .w_4txt {
            width: 55px;
            display: inline-block;
        }

        .tab_main_row {
            margin-top: 10px;
        }

        select {
            height: 32px;
        }

        table th {
            border-bottom: 1px solid #ccc;
        }

        table td {
            border-bottom: 1px dashed #ccc;
        }

        .btn.btn-connot {
            background-color: #e5e5e5;
            color: #333;
        }

        .btns-div a {
            margin-right: 10px;
            margin-top: 10px;
            float: right;
        }
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>提现操作</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">管理员提现操作</span>
        </div>
        <form action="${ctx}/fund/reposit/queryUserBalance" method="post" id="searchForm">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15"><span style="letter-spacing: 25px;">查</span>询 :</div>
                <input class="fl m_r15" type="text" name="loginName" placeholder="请输入要进行操作的账户" id="accontName">
                <a class="btn fl " href="javascript:void(0)" id="queryBalanceBtn">查询余额</a>
            </div>
        </form>
        <form action="${ctx}/fund/reposit/reposit" method="post" id="repositForm">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">操作账户 :</div>
                <span id="account"></span>
                <input type="hidden" name="userID" id="userID">
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15"><span style="letter-spacing: 25px;">余</span>额 :</div>
                <span id="balance">0.00</span> 元
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">操作账户支付宝账号 :&nbsp;&nbsp;&nbsp;</div>
                <input class="fl m_r15" type="text" name="alipayAccount" placeholder="请输入要进行操作的账户的支付宝账号"
                       id="alipayAccount"
                       style="width:286px;" disabled>

            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">操作账户支付宝账号名 :</div>
                <input class="fl m_r15" type="text" name="alipayAccountName" placeholder="请输入要进行操作的账户的支付宝账号名"
                       id="alipayAccountName"
                       style="width:286px;" disabled>

            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">付款说明 :</div>
                <input class="fl m_r15" type="text" name="remark" placeholder="请输入付款说明" id="remark" style="width:358px;"
                       disabled>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">提现金额 :</div>
                <input class="fl m_r15" type="text" name="amount" placeholder="0.00" id="amount" disabled>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">
                    <span style="letter-spacing: 4px;">手</span>
                    <span style="letter-spacing: 4px;">续</span>费 :
                </div>
                <input class="fl m_r15" type="text" name="fee" placeholder="0.00" id="fee" disabled>
                <a href="javascript:void(0)" class="btn btn-connot" id="repositBtn">提现</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="m_r15">提现列表 :</div>
                <table style="width:715px;">
                    <tr>
                        <th>操作时间</th>
                        <th>账户名称</th>
                        <th>支付宝账号</th>
                        <th>支付平台</th>
                        <th>提现金额</th>
                        <th>操作人</th>
                        <th>状态</th>
                    </tr>
                    <tbody id="repositRecord">
                    <c:choose>
                        <c:when test="${empty pageinfo.list}">
                            <tr>
                                <td colspan="7" align="center">暂无提现记录</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${pageinfo.list}" var="info">
                                <tr>
                                    <td><fmt:formatDate value="${info.operationTime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    <td>
                                            ${info.accountName}
                                    </td>
                                    <td>${info.alipayAccount}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${alipayPlatform eq info.platform}">
                                                支付宝
                                            </c:when>
                                            <c:when test="${eBankPlatform eq info.platform}">
                                                网银
                                            </c:when>
                                            <c:otherwise>
                                                其他
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${info.amount} 元</td>
                                    <td>${info.operator}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${info.status eq ordered}">
                                                未提现
                                            </c:when>
                                            <c:when test="${info.status eq success}">
                                                提现成功
                                            </c:when>
                                            <c:otherwise>
                                                提现失败
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                     </div> -->
            </div>

            <!--筛选结果-->
        </form>
        <div class="btns-div">
            <input type="hidden" value="${pageinfo.pageNumber}" id="pageNumber">
            <input type="hidden" value="${pageinfo.pageSize}" id="pageSize">
            <input type="hidden" value="${pageinfo.totalPage}" id="totalPage">
            <input type="hidden" value="${pageinfo.totalRow}" id="totalRow">
            <a href="javascript:void(0)" class="btn hiddenDom" style="background-color: #E5E5E5;color:#333"
               id="nextBtn">下一页</a>
            <a href="javascript:void(0)" class="btn hiddenDom" style="margin-right: 15px;"
               id="prevBtn">上一页</a>
        </div>
    </div>
</div>

<div style="display: none">
    <table id="temp">
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.form.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function () {
        //切换sheet页
        $(".tab_title span").click(function () {
            $(this).addClass('cur_tab').siblings().removeClass('cur_tab');
        });
        reposit.btnEvent.queryBalance();

        $("#nextBtn").bind("click", reposit.paging.next);
        $("#prevBtn").bind("click", reposit.paging.prev);
    });

    var reposit = {};

    reposit.validation = {
        //查询余额前验证
        beforeQueryBalance: function () {
            var accontName = $("#accontName").val();
            var isValid = false;
            if (accontName == "") {
                reposit.win.tip("请输入要进行操作的账户!");
            } else {
                isValid = true;
            }
            if (!isValid) {
                reposit.btnEvent.queryBalance();
            }
            return isValid
        },
        //提现前验证
        beforeReposit: function () {
            var alipayAccount = $("#alipayAccount").val();
            var amount = $("#amount").val();
            var fee = $("#fee").val();
            var balance = $("#balance").text();
            var alipayAccountName = $("#alipayAccountName").val();
            var isValid = false;
            if (alipayAccount == "") {
                reposit.win.tip("请输入要进行操作的账户的支付宝账号！");
            } else if (alipayAccountName = "") {
                reposit.win.tip("请输入要进行操作的账户的支付宝账号名！");
            } else if (amount == "" || amount <= 0) {
                reposit.win.tip("请输入提现金额,且提现金额必须大于0元！");
            } else if (amount > balance) {
                reposit.win.tip("提现金额不能大于账户余额");
            } else {
                isValid = true;
            }
            if (!isValid) {
                reposit.btnEvent.reposit();
            }
            return isValid;
        }
    };

    reposit.btnEvent = {
        //查询余额
        queryBalance: function () {
            $("#queryBalanceBtn").bind("click", function () {
                reposit.btnEvent.queryBalanceUnbind();
                reposit.dom.disableInput();
                reposit.ajax.queryAccount();
            });
        },
        //提现
        reposit: function () {
            $("#repositBtn").bind("click", function () {
                reposit.btnEvent.repositUnBind();
                reposit.ajax.reposit();
            });
        },
        queryBalanceUnbind: function () {
            $("#queryBalanceBtn").unbind();
        },
        repositUnBind: function () {
            $("#repositBtn").unbind();
        }
    };

    reposit.dom = {
        //将input框置为不可用状态
        disableInput: function () {
            $("#alipayAccount").attr("disabled", "disabled");
            $("#amount").attr("disabled", "disabled");
            $("#fee").attr("disabled", "disabled");
            $("#alipayAccountName").attr("disabled", "disabled");
            $("#remark").attr("disabled", "disabled");
        },
        //将input框置为可用状态
        ableInput: function () {
            $("#alipayAccount").removeAttr("disabled");
            $("#amount").removeAttr("disabled");
            $("#fee").removeAttr("disabled");
            $("#alipayAccountName").removeAttr("disabled");
            $("#remark").removeAttr("disabled");
            $("#repositBtn").removeClass("btn-connot");
            reposit.btnEvent.reposit();
        },
        //点击查询余额返回数据后渲染dom
        afterQueryBalance: function (data) {
            $("#account").text(data.accountName);
            if (data.balance == null) {
                $("#balance").text("0.00");
            } else {
                $("#balance").text(data.balance);
            }
            $("#userID").val(data.userID);
        },
        clearDom: function () {
            $("#account").text("");
            $("#userID").val("");
            $("#balance").text("0.00");
            $("#alipayAccount").val("");
            $("#alipayAccountName").val("");
            $("#remark").val("");
            $("#amount").val("");
            $("#fee").val("");
        }
    };

    reposit.ajax = {
        //查询余额
        queryAccount: function () {
            var options = {
                success: reposit.callback.accountSuccess,
                error: reposit.callback.accountError,
                beforeSubmit: reposit.validation.beforeQueryBalance
            };
            $("#searchForm").ajaxSubmit(options);
        },
        //提现
        reposit: function () {
            var options = {
                success: reposit.callback.repositSuccess,
                error: reposit.callback.repositError,
                beforeSubmit: reposit.validation.beforeReposit
            };
            $("#repositForm").ajaxSubmit(options);
        }

    };

    reposit.callback = {
        accountSuccess: function (data) {
            if (data.isSuccess) {
                if (data.obj == null) {
                    reposit.win.tip("对不起，没有查询到该账户对应的信息，可能该账户用户不存在~!");
                } else {
                    reposit.dom.clearDom();
                    reposit.dom.afterQueryBalance(data.obj);
                }
                var userID = $("#userID").val();
                if (userID != "") {
                    reposit.dom.ableInput();
                }
            } else {
                reposit.win.tip("查询失败！");
            }
            reposit.btnEvent.queryBalance();
        },
        accountError: function (data) {
            reposit.win.tip("查询出错了！原因：" + data);
            reposit.btnEvent.queryBalance();
        },
        //提现成功回调
        repositSuccess: function (data) {
            if (data.isSuccess) {
                var url = "${ctx}/alipay/batchfund/alipayapi.jsp";
                reposit.win.openWinByPost(url, data.obj)
            } else {
                reposit.win.tip(data.msg);
            }
            reposit.btnEvent.reposit();
        },
        //提现出错回调
        repositError: function (data) {
            reposit.win.tip("提现出错了！原因：" + data);
            reposit.btnEvent.reposit();
        }
    };

    reposit.win = {
        //提示框
        tip: function (str) {
            window.parent.showMess(str);
        },
        //确认框
        confirm: function (str, func) {
            window.parent.showMessYes(str);
            $(".yes-btn", window.parent.document).unbind().on("click", func);
        },
        //关闭确认框
        closeConfirm: function () {
            window.parent.hideMessYes();
        },
        //post方式跳转页面
        openWinByPost: function (url, data) {
            var tempForm = document.createElement("form");
            tempForm.id = "tempForm1";
            tempForm.method = "post";
            tempForm.action = url;
            tempForm.target = "_blank";

            for (o in data) {
                var hideInput = document.createElement("input");
                hideInput.type = "hidden";
                hideInput.name = o;
                hideInput.value = data[o];
                tempForm.appendChild(hideInput);
            }
            document.body.appendChild(tempForm);

            tempForm.submit();
            document.body.removeChild(tempForm);
        }
    };

    //分页相关
    reposit.paging = {

        next: function () {
            var pageNumber = parseInt($("#pageNumber").val());
            var totalPage = parseInt($("#totalPage").val());
            pageNumber += 1;
            if (pageNumber > totalPage) {
                reposit.win.tip("已经是最后一页了");
                return;
            }
            reposit.paging.skip(pageNumber);
        },

        prev: function () {
            var pageNumber = parseInt($("#pageNumber").val());
            pageNumber -= 1;
            if (pageNumber == 0) {
                reposit.win.tip("已经是第一页了");
                return;
            }
            reposit.paging.skip(pageNumber);
        },

        skip: function (pageNumber) {
            var url = "${ctx}/fund/reposit/repositRecordList";
            var pageSize = $("#pageSize").val();
            var data = {pageNumber: pageNumber, pageSize: pageSize};
            $.post(url, data, function (json) {
                if (json.isSuccess) {
                    reposit.paging.updatePageInfo(json.obj.pageNumber, json.obj.pageSize, json.obj.totalRow, json.obj.totalPage);
                    $("#repositRecord").empty();
                    $.each(json.obj.list, function (i, v) {
                        reposit.paging.drawPageTable(v);
                    })
                } else {
                    reposit.win.tip(json.msg);
                }
            }).erorr(function (data) {
                reposit.win.tip("出错了，原因：" + data);
            });
        },

        //更新分页信息
        updatePageInfo: function (pageNumber, pageSize, totalRow, totalPage) {
            $("#pageNumber").val(pageNumber);
            $("#pageSize").val(pageSize);
            $("#totalRow").val(totalRow);
            $("#totalPage").val(totalPage);
        },


        drawPageTable: function (data) {
            var tr = $("#temp tr").clone();
            $(tr).find("td").eq(0).text(data.operationTime);
            $(tr).find("td").eq(1).text(data.accountName);
            $(tr).find("td").eq(2).text(data.alipayAccount);
            if (data.platform == '${alipayPlatform}') {
                $(tr).find("td").eq(3).text("支付宝");
            } else if (data.platform == '${eBankPlatform}') {
                $(tr).find("td").eq(3).text("网银");
            } else {
                $(tr).find("td").eq(3).text("其他");
            }
            $(tr).find("td").eq(4).text(data.amount + " 元");
            $(tr).find("td").eq(5).text(data.operator);
            if (data.status = "${ordered}") {
                $(tr).find("td").eq(6).text("未提现");
            } else if (data.status = "${success}") {
                $(tr).find("td").eq(6).text("提现成功");
            } else {
                $(tr).find("td").eq(6).text("提现失败");
            }
            $("#repositRecord").append($(tr));
        }
    }
    ;
</script>
</body>
</html>
