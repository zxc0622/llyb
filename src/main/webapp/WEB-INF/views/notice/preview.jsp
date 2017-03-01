<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>公告-公告预览</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>

    <style type="text/css">
        .row {
            overflow: hidden;
            margin-bottom: 15px;
        }

        .row > * {
            float: left;
            margin-right: 10px;
        }

        .for_zhanhui {
            display: none
        }

        .row > span:first-child {
            width: 80px;
            text-align: right;
            height: 30px;
            line-height: 30px;
        }

        .ml_90 {
            margin-left: 90px;
        }

        .t_center {
            text-align: center;
            margin-bottom: 15px;
        }

        /*新闻详情*/
        .xinwen_detail h5 {
            text-align: center;
            font-size: 16px;
            font-weight: 400;
        }

        .xinwen_detail .sub-title {
            text-align: center;
            margin-bottom: 15px;
        }

        .xinwen_detail .sub-title span {
            margin: 0 10px;
        }

        .xinwen_detail p:not(.sub-title) {
            padding-left: 100px;
            padding-right: 100px;
            color: #333;
            text-indent: 20px;
        }

        .xinwen_detail img {
            display: block;
            width: 90%;
            height: 350px;
            margin: 15px auto;
        }

        .xinwen_detail .btns {
            text-align: center;
        }

        .xinwen_detail .btns a {
            width: 80px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #ccc;
            color: #333;
            display: inline-block;
            margin: 0 3px;
        }

        .xinwen_detail .btns a:hover {
            background-color: #5EC520;
            color: #fff;
            border: 1px solid #5EC520;
        }

        /*新闻详情 结束*/
    </style>

</head>
<body>
<form action="saveNotic" method="post" id="formId">
    <input type="hidden" name="pageType" value="preview">
    <!-- 右侧开始 -->
    <div class="main_right">
        <div class="m_r_position font_1">当前位置>公告>公告预览</div>
        <div class="tab_main">
            <div class="row">
                <a href="javascript:void(0)" class="normal_btn" onclick="goWeiHu()">返回</a>
            </div>
            <div class="qy_m_r_d_main">
                <div class="xinwen_detail">
                    <h5>${ntTitile}</h5>
                    <input type="hidden" id="ntTitileId" name="ntTitile" value="${ntTitile}"/>
                    <p class="sub-title">
                        <span id="time"></span>
                    </p>
                    <textarea style="display: none;" name="ntContent" id="ntContentId" cols="85"
                              rows="30">${ntContent}</textarea>
                    <div id="ntContent">${ntContent}</div>
                </div>
            </div>


            <div class="t_center">
                <a href="javascript:void(0)" id="fabu" onclick="saveNotic()" class="btn"
                   style="margin: 15px 0 0;">发布</a>
            </div>
        </div>
    </div>
    <!-- 右侧结束 -->
    <input type="hidden" name="noticId" id="noticId" value="${noticId}"/>
</form>

<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>

<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>

<script type="text/javascript">
    $(function () {
        var d = new Date();
        var str = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
        $("#time").html("发布时间：" + str);
        var noticId = $("#noticId").val();
        if (noticId != null && noticId != "") {
            $("#fabu").remove();
        }
    });

    //修改表单的action
    function changeFormAction(url) {
        $("#formId").attr("action", url);
    }

    //发布
    function saveNotic() {
        changeFormAction("${ctx}/notice/saveNotic");
        $("#formId").submit();
    }
    //返回
    function goWeiHu() {
        changeFormAction("${ctx}/notice/preview");
        $("#formId").submit();
    }
</script>
</body>
</html>


