<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>公告维护</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
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

        .for_tip {
            height: 30px;
            line-height: 32px;
            color: #666;
            font-size: 12px;
        }

        textarea {
            margin-left: 25px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        input[type=text] {
            width: 400px;
        }

        .for_img {
            width: 150px;
            height: 150px;
            border: 1px solid #ccc;
            position: relative;
            line-height: 150px;
            text-align: center;
            color: #666;
        }

        .for_img img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .ml_90 {
            margin-left: 90px;
        }

        .tab_main {
            min-height: 700px;
            padding-bottom: 10px;
        }
    </style>

</head>
<body>
<form action="saveNotic" method="post" id="formId">
    <input type="hidden" name="pageType" value="publish">
    <!-- 右侧开始 -->
    <div class="main_right">
        <div class="m_r_position font_1">当前位置>公告>公告维护</div>
        <div class="tab_main">

            <div class="row">
                <span>标题</span>
                <c:choose>
                    <c:when test="${noticList!=null&&noticList!=''}">
                        <input type="text" name="ntTitile" value="${noticList.ntTitile}" id="ntTitileId">
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="ntTitile" value="${ntTitile}" id="ntTitileId">
                    </c:otherwise>
                </c:choose>

            </div>

            <div class="row">
                <span>正文</span>
                <c:choose>
                    <c:when test="${noticList!=null&&noticList!=''}">
                        <textarea style="display: none;" name="ntContent" id="ntContentId" cols="85"
                                  rows="30">${noticList.ntContent}</textarea>
                        <script id="editor" type="text/plain" cols="85" rows="30"
                                style="margin-left:80px;width:630px;height:500px;"></script>
                    </c:when>
                    <c:otherwise>
                        <textarea style="display: none;" name="ntContent" id="ntContentId" cols="85"
                                  rows="30">${ntContent}</textarea>
                        <script id="editor" type="text/plain" cols="85" rows="30"
                                style="margin-left:80px;width:630px;height:500px;"></script>
                    </c:otherwise>
                </c:choose>

            </div>
            <input type="hidden" name="noticId" value="${noticId}"/>
            <div class="row">
                <a href="javascript:void(0)" class="normal_btn ml_90" onclick="preView()">预览</a>
                <a href="javascript:void(0)" onclick="saveFB()" class="btn">发布</a>
            </div>
        </div>
    </div>
    <!-- 右侧结束 -->
</form>


<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor("editor", {
        toolbars: [[
            'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'preview', '|', /*'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',*/
            'simpleupload', 'insertvideo'/*,'insertimage',*/
        ]],
        imageUrlPrefix: "${basePath}hyzl/findImgResourcesURL?str=",
        videoUrlPrefix: "${basePath}hyzl/findImgResourcesURL?str="
    });
    ue.ready(function () {
        // editor准备好之后才可以使用
        var content = $("#ntContentId").val();
        ue.setContent(content);
    });


    $(function () {
        $(".suoshufenlei").change(function () {
            if ($(this).find("option:selected").val() != "zhanhuixinxi") {
                $(".for_other").show();
                $(".for_zhanhui").hide();
            } else {
                $(".for_other").hide();
                $(".for_zhanhui").show();
            }
        });
    });

    //检查提交和预览的条件是否满足
    function checkSubmitCondition() {
        var ntTitileId = $("#ntTitileId").val();
        var ntContentId = $("#ntContentId").val();
        if (ntTitileId == "" || ntTitileId == null) {
            parent.showMess("请填写标题");
            return false;
        } else if (ntContentId == null || ntContentId == "") {
            parent.showMess("请填写正文");
            return false;
        }
        return true;
    }

    //将uEditor中的内容填充到textArea中
    function fillContent() {
        var uecon = UE.getEditor('editor').getContent();
        $("#ntContentId").val(uecon);
    }

    //修改表单的action
    function changeFormAction(url) {
        $("#formId").attr("action", url);
    }

    //提交发布
    function saveFB() {
        fillContent();
        if (checkSubmitCondition()) {
            changeFormAction("${ctx}/notice/saveNotic");
            $("#formId").submit();
        }
    }

    //预览
    function preView() {
        fillContent();
        if (checkSubmitCondition()) {
            changeFormAction("${ctx}/notice/preview");
            $("#formId").submit();
        }
    }
</script>
</body>
</html>


