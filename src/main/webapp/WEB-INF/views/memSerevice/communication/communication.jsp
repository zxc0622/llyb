<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>站内交流</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>
    <style type="text/css">
        .main {
            margin: 0px auto;
            overflow: hidden;
            border: 0px solid red;
        }

        .tab_main {
            width: 763px;
            border: 1px solid #cccccc;
            padding-bottom: 50px;
            margin-bottom: 200px;
            overflow: hidden;
        }

        .tab_main .tab_main_row {
            height: 30px;
            line-height: 30px;
            margin-top: 15px;
            border: 0px solid red;
        }

        .tab_main .tab_main_row > label {
            width: 100px;
            float: left;
            text-align: right;
        }

        .tab_main .tab_main_row > label span {
            color: red;
        }

        .tab_main .tab_main_row .row_right {
            float: left;
            margin-left: 10px;
        }

        .tab_main .tab_main_row .row_right label {
            margin-left: 5px;
        }

        .tab_main .tab_main_row .row_right input[type=text] {
            border: 1px solid #cccccc;
            text-indent: 10px;
            width: 330px;
            float: left;
        }

        .tab_main .tab_main_row2 {
            height: 30px;
            line-height: 30px;
            margin-top: 20px;
            border: 1px solid red;
        }

        .tab_main .tab_main_row2 > label {
            width: 100px;
            float: left;
            text-align: left;
            margin-left: 15px;
            border: 1px solid yellow;
        }

        .m_r_title {
            width: 100%;
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid #cccccc;
            position: relative;
        }

        .m_r_title .m_r_tname {
            font-size: 16px;
            color: #5EC520;
            margin-left: 20px;
            border-bottom: 3px solid #5EC520;
            padding-bottom: 3px;
            cursor: pointer;
        }

        .m_r_title span {
            font-size: 16px;
            margin-left: 20px;
            padding-bottom: 3px;
            cursor: pointer;
        }

        .m_r_title .change {
            position: absolute;
            top: 0;
            right: 0;
            z-index: 5;
            background-color: #fff;
            padding: 0;
            display: none;
        }

        .m_r_title .change a {
            margin-right: 10px;
            padding: 0 5px;
        }

        .m_r_title .change a:hover {
            color: #ee7800;
        }

        .m_r_title a {
            float: right;
            margin-right: 20px;
            color: #666666;
            font-size: 12px;
        }

        /*提示样式*/
        .tip_span {
            float: left;
            font-size: 12px;
            line-height: 15px;
            margin-left: 15px;
            position: relative;
        }

        .tip_warning::before {
            content: "";
            width: 15px;
            height: 15px;
            background: url(${ctxStatic}/img/llhb/gantanhao.png) 0 0 no-repeat;
            position: absolute;
            top: 2px;
            left: -15px;
        }

        .tip_wrong {
            color: red;
        }

        .tip_wrong::before {
            content: "";
            width: 15px;
            height: 15px;
            background: url(${ctxStatic}/img/llhb/wrong.png) 0 0 no-repeat;
            position: absolute;
            top: 2px;
            left: -15px;
        }

        .chat_left {
            width: 45%;
            border: 0px solid red;
            margin-top: 20px;
            margin-left: 30px;
            float: left;
        }

        .chat_left_row_head {
            height: 30px;
            line-height: 30px;
            border-bottom: 2px solid #CCCCCC;
        }

        .chat_left_row {
            height: 70px;
            border-bottom: 1px dashed #CCCCCC;
        }

        .session_pic {
            float: left;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            margin-top: 5px;
            margin-left: 10px;
        }

        .session_name {
            float: left;
            height: 50px;
            margin-top: 10px;
            border: 0px solid red;
            width: 70%;
            margin-left: 20px;
        }

        .session_name label {
            line-height: 25px;
        }

        .session_btn {
            display: block;
            float: left;
            margin-left: 15px;
            color: white;
            background-color: #5EC520;
            width: 100px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="main">
    <!-- 右侧开始 -->
    <div class="main_right">
        <div class="m_r_position font_1">当前位置>会员服务>站内交流</div>
        <div class="tab_main">
            <div class="m_r_title">
                <span class="m_r_tname">我的对话</span>
                <span onclick="goMessage()">黑名单</span></div>
            <form action="">
                <div class="tab_main_row ">
                    <label for=""><span>*</span>输入会员名</label>

                    <div class="row_right font1">
                        <input type="text" id="memname" value="">
                        <a href="javascript:chatCheck();" class="session_btn">发起对话</a><br/>
                    </div>
                </div>
                <div class="chat_left">
                    <div class="chat_left_row_head">
                        <label for="">收到的会话</label>
                    </div>
                    <c:set var="rec" value="${rec }"/>
                    <c:forEach items="${rec }" var="rec">
                        <div class="chat_left_row" onclick="goChat('${rec.fromUser}')">
                            <img src="${ctxStatic}/img/llhb/show.png" alt="" class="session_pic"/>

                            <div class="session_name font_1">
                                <label for="">${rec.loginName }(${rec.realName})</label><br/>
                                <label for="">${rec.cname }</label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="chat_left">
                    <div class="chat_left_row_head">
                        <label for="">发起的会话</label>
                        <%--<label for="" onclick="goUrl('05_会员服务/01_站内交流_2.html')">发起的会话</label>--%>
                    </div>
                    <c:set var="send" value="${send }"/>
                    <c:forEach items="${send }" var="send">
                        <div class="chat_left_row" onclick="goChat('${send.toUser}')">
                            <img src="${ctxStatic}/img/llhb/show.png" alt="" class="session_pic"/>

                            <div class="session_name font_1">
                                <label for="">${send.loginName }(${send.realName })</label><br/>
                                <label for="">${send.cname }</label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
        </div>
    </div>
    <!-- 右侧结束 -->
</div>
<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">
    $(function () {
        notRead();
    });
    function chatCheck() {
        var loginName = $("#memname").val();
        if (loginName != "") {
            $.ajax({
                type: "POST",
                url: "${ctx}/memSerevice/communication/chatCheck",
                data: {loginName: loginName},
                dataType: 'json',
                success: function (data) {
                    if (data == -1) {
                        parent.showMess("您搜索的会员不存在！");
                        setTimeout(function () {
                            parent.hideMess();
                        }, 2000);
                    } else if (data == -2) {
                        parent.showMess("对不起，不能跟自己发起站内交流!");
                        setTimeout(function () {
                            parent.hideMess();
                        }, 2000);
                    } else {
                        goChat(data);
                    }
                }
            });
        } else {
            parent.showMess("请填写会员名！");
            setTimeout(function () {
                parent.hideMess();
            }, 1000);
        }
    }
    function goChat(id) {
        window.open("${ctx}/home?str=/memSerevice/communication/goChat?id=" + id, "_blank");
    }
    //未读消息对话
    function notRead() {
        var messNotRead = '${messNotRead}';
        var chatNotRead = '${chatNotRead}';
        parent.notRead(messNotRead, chatNotRead);
        window.parent.document.getElementById("leftIframe").contentWindow.notRead();
    }
    //跳到站内信件的黑名单
    function goMessage() {
        location.href = "${ctx}/memSerevice/message/setup";
    }
</script>
</body>
</html>