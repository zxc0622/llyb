<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <!--[if IE 8 ]>
    <html lang="en" class="ie8"> <![endif]-->
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <style>
        /*上传图片弹出框*/
        .pl_commit_pic {
            width: 300px;
        }

        .pl_commit_pic .pl_content {
            padding: 15px 0 5px;
        }

        .select-commit label {
            margin-right: 30px;
            color: #666;
        }

        .select-commit-content {
            margin: 15px 0;
            padding: 0 40px;
        }

        .net-pic {
            display: none;
        }

        .pl_commit_pic .btns {
            overflow: hidden;
        }

        .pl_commit_pic .btns a:nth-child(1) {
            float: left;
            width: 100px;
            height: 30px;
            line-height: 30px;
            background-color: #5EC520;
            color: #fff;
            text-align: center;
            margin-left: 40px;
        }

        .pl_commit_pic .btns a:nth-child(2) {
            float: left;
            width: 100px;
            height: 30px;
            line-height: 30px;
            background-color: #ccc;
            color: #666;
            text-align: center;
            margin-left: 20px;
        }

        /*预览图片弹出框*/
        .pl_view_pic {
            width: 500px;
            max-width: 800px;
            overflow: hidden;
        }

        .pl_view_pic .pl_content {
            padding: 15px 0 5px;
            height:300px;
            max-height: 500px;
        }

        .pl_view_pic .pl_content img {
            width:100%;
            height: 100%;
        }

        .pl_view_pic2 {
            width: 800px;
            overflow: hidden;
        }

        .pl_view_pic2 .pl_content2 {
            padding: 15px 0 5px;
            height:500px;
        }

        .pl_view_pic2 .pl_content2 img {
            width:100%;
            height: 100%;
        }

        /*yesorno弹出*/
        .btns-yesorno {
            margin-top: 15px;
        }

        .btns-yesorno .yes-btn {
            width: 100px;
            height: 25px;
            line-height: 25px;
            color: #fff;
            background-color: #5ec520;
            border: 1px solid #5ec520;
            margin-right: 100px;
            display: inline-block;
        }

        .btns-yesorno .no-btn {
            width: 100px;
            height: 25px;
            line-height: 25px;
            color: #666;
            background-color: #e9e9e9;
            border: 1px solid #ccc;
            display: inline-block;
        }

        /*only-yes弹出*/
        .btns_yes {
            margin-top: 15px;
        }

        .btns_yes .yes-btn {
            width: 100px;
            height: 25px;
            line-height: 25px;
            color: #fff;
            background-color: #5ec520;
            border: 1px solid #5ec520;
            display: inline-block;
        }
        
        
        /*右侧悬框*/
        .gf_ad_right{width:108px; height:305px;  position:absolute; top:298px ; right:50%; margin-right:-622px; z-index:15;}
        .r_a_top{width:100%; position:absolute;z-index:17;}
        .r_a_down{width:100%; position:absolute; z-index:16; top:92px;}
        .r_a_down>div:nth-of-type(1){padding-top:18px;}
        .r_a_cc{width:100%;background-color:#5cb531; border-top:1px solid #efefef; padding:13px 0px; overflow:hidden;}
        .r_a_cc span{color:#FFF;display:block; float:left; width:57px; margin-left:17px;}
        .r_a_cc img{display:block; margin-left:8px; float:left; }
        .r_a_cell{ width:100%;padding:10px 0px ; background-color:#efefef;}
        .r_a_cell p{display:block; text-align:center;}
        .r_a_cell>p:nth-of-type(2){color:#5cb531; font-size:14px; }
    </style>
    <script>
        function SetCwinHeight(iframeObj) {
            if (document.getElementById) {
                if (iframeObj && !window.opera) {
                    if (iframeObj.contentDocument && iframeObj.contentDocument.body.scrollHeight) {
                        iframeObj.height = iframeObj.contentDocument.body.scrollHeight + 10;
                    } else if (iframeObj.Document && iframeObj.Document.body.scrollHeight) {
                        iframeObj.height = iframeObj.Document.body.scrollHeight + 10;
                    }
                }
            }
        }
    </script>
</head>
<body>
<!-- 头部开始 -->
<header>
    <div class="headtop font_1">
        <div>
            <span>尊敬的</span><span><shiro:principal property="loginName"/></span><span>您好</span>
            <a href="${ctx }/home?str=/memSerevice/message/mailbox?index=2" class="headtop_a">消息
                <span style="display:none;" class="headtop_a_s font_1">${messNotRead}</span></a>
            <a href="${ctx }/home?str=/memSerevice/communication" class="headtop_a">对话
                <span style="display:none;" class="headtop_a_s font_1">${chatNotRead}</span></a>
            <a href="${ctx }/index" class="headtop_a">首页</a>
            <a href="javascript:logout();" class="headtop_a">退出</a>
        </div>
    </div>
    <div class="headmain">
        <a href="${ctx }/index">
            <img src="${ctxStatic}/img/llhb/mall_logo.png"alt="环保服务平台" style="width:20%;height:120%;"/>
        </a>
    </div>
</header>
<!-- 头部结束 -->
<div class="main" style="border:0px solid red;height: auto;">
    <div style="float:left;width:220px;">
        <!-- 左侧开始 -->
        <iframe id="leftIframe" src="goLeft?parentId=372&str=${str}" width="330" height="1100px;" allowtransparency="yes"
                frameborder="0" scrolling="no" style="padding: 0;" name="leftIframe">
        </iframe>
    </div>
    <!-- 左侧结束 -->
    <!-- 右侧开始 -->
    <div style="float:right;width:780px;">
        <iframe id="rightIframe" src="${ctx }${str}" width="780" allowtransparency="yes"
                frameborder="0" scrolling="no" style="padding: 0;margin-left:-15px;" name="rightIframe"
                onload="SetCwinHeight(this)">
        </iframe>
    </div>
    <!-- 右侧结束 -->
</div>
<!-- 底部开始 -->
<footer style="float:left;">
    <!-- 引入尾部 -->
	<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</footer>
<!--右侧悬窗 start-->
<%@ include file="/WEB-INF/views/include/footer_ad_home.jsp"%>
<!--右侧悬窗 start-->
<!-- 弹出层 -->
<div class="popumask"></div>
<div class="populayer pl_normal">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>

    </div>
</div>
<!-- 只带确定按钮的弹出层 -->
<div class="populayer pl_yes">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!<br/>否则不能完成认证!</p>

        <div class="btns-yesorno">
            <a href="javascript:void(0)" class="yes-btn">确定</a>
        </div>
    </div>
</div>
<!-- 带是否按钮的弹出层 -->
<div class="populayer pl_yesorno">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!<br/>否则不能完成认证!</p>

        <div class="btns-yesorno">
            <a href="javascript:void(0)" class="yes-btn">确定</a>
            <a href="javascript:void(0)" class="no-btn">取消</a>
        </div>
    </div>
</div>
<!-- 修改手机号的弹出层 -->
<div class="populayer pl_change_phonenum" style="width:350px">
    <div class="layer_top">
        <span></span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <div class="clearfix" style="margin-bottom:5px;">
            <input type="text" class="fl" placeholder="输入手机号"
                   style="color:#333;text-indent:5px;height:30px;line-height:30px;border:1px solid #ccc;width:248px;margin-left:50px"/>
        </div>
        <div class="clearfix" style="margin-top:5px;">
            <input type="text" class="fl" placeholder="输入验证码"
                   style="color:#333;text-indent:5px;height:30px;line-height:30px;border:1px solid #ccc;width:133px;margin-left:50px"/>
            <a href="javascript:getcode();" class="btn fl" style="margin-left:15px;width:100px;">获取验证码</a>
        </div>

        <div class="btns-yesorno">
            <a href="javascript:void(0)" class="yes-btn" style="margin-right: 41px;">确定</a>
            <a href="javascript:void(0)" class="no-btn">取消</a>
        </div>
    </div>
</div>
<!-- 带是否按钮的和输入框弹出层 -->
<div class="populayer pl_text">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <textarea rows="6" cols="70" style="border:1px solid #ccc"></textarea>

        <div class="btns-yesorno">
            <a href="javascript:void(0)" class="yes-btn">确定</a>
            <a href="javascript:void(0)" class="no-btn">取消</a>
        </div>
    </div>
</div>
<!-- 只有确定按钮的弹出层 -->
<div class="populayer pl_yes">
    <div class="layer_top">
        <span>提示</span>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!<br/>否则不能完成认证!</p>

        <div class="btns_yes">
            <a href="javascript:void(0)" class="yes-btn">确定</a>
        </div>
    </div>
</div>
<!-- 弹出层上传图片 -->
<div class="populayer pl_commit_pic">
    <div class="layer_top">
        <span>上传图片</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <div class="select-commit">
            <label onclick="removePic()" ><input type="radio" autocomplete="off" checked="checked" id="check1" >本地图片</label>
            <label onclick="upPic()"><input type="radio" autocomplete="off" id="check2" >网络图片</label>
        </div>
        <div class="select-commit-content">
            <div class="home-pic tmui-ellipsis">
                <input type="file" name="files" id="files" value="选择文件" onchange="upPic(this)">
            </div>
            <div class="net-pic">
                <input type="text" name="netid" id="netid" value="http://" onchange="upPic(this)">
            </div>
        </div>
        <input type="hidden" id="hiddenId" value=""/>
        <input type="hidden" id="picId" value=""/>

        <div class="btns">
            <a href="javascript:void(0)">上传</a>
            <a href="javascript:void(0)">取消</a>
        </div>
    </div>
</div>
<!-- 弹出层 预览图片 -->
<div class="populayer pl_view_pic">
    <div class="layer_top">
        <span>图片预览</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <img class="view_pic_div" />
    </div>
</div>

<div class="populayer pl_view_pic2">
    <div class="layer_top">
        <span>图片预览</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content2 font_3">
        <img class="view_pic_div2" />
    </div>
</div>
<!-- 弹出层结束 -->
<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/getUrlParam.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script charset="utf-8" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript">

    var time_on = true;//验证码
    var timer = null;
    $(function () {
    	
    	//初始化layer插件
    	var layer;
    	layui.use(['layer'],function(){
    		layer=layui.layer;
    	});

        pl_commit_pic();
        populayer_fn();
        pl_yesorno();
    });
    $(document).ready(function () {
        var mess = '${messNotRead}';
        var chat = '${chatNotRead}';
        notRead(mess, chat);
        var name = UrlParm.parm("name");
        changeLeftMenu(name);
        if (name == '站内信件') {
            iframeGoToUrl("05_会员服务/02_站内信件_收件箱合同明细.html");
        }
    });
    /*
     * 调用父窗口方法，更改左侧菜单选中
     */
    function changeLeftMenu(mName) {
        $(".m_l_bottom .l_b_erji li").each(function () {
            if (mName == $(this).html()) {
                $(this).click();
                $(this).parent().prev().click();
            }
        });
    }
    //退出登录
    function logout() {
        $(".pl_yesorno .pl_content p").empty().text("确定退出？");
        $(".pl_yesorno").show();
        $(".popumask").show();
        $(".yes-btn").on("click", function () {
            location.href = "${ctx}/logout";
        });
    }
    //图片上传
    function comPic(str) {
        $("#hiddenId").val(str);
        $(".pl_commit_pic").show();
        $(".popumask").show();
    }
    function upPic(obj) {
        $(".btns a:eq(0)").on("click", uplodePic);
    }
    function removePic() {
        $(".btns a:eq(0)").unbind("click");
    }
    function uplodePic() {
        $(".btns a:eq(0)").off("click", uplodePic);//只上传一次
        $(".pl_commit_pic").hide();
        var n = $("#hiddenId").val();
        $(".pl_yesorno").hide();
        $(".popumask").hide();
        if ($("#check1").is(":checked")) {
            var url = $("#files").val();
            var u = url.substring(url.length - 4, url.length);
            if (url == "") { //验证
                showMess("请选择图片！");
            } else if (u != ".gif" && u != ".jpg" && u != ".png" && u != ".GIF" && u != ".JPG" && u != ".PNG") {
                showMess("图片格式不正确！<br />只能上传gif、jpg、png格式的图片！");
            } else {
                $.ajaxFileUpload({
                    url: '${ctx}/fileUploadServer',
                    secureuri: false,
                    fileElementId: 'files',
                    dataType: 'text',
                    success: function (data, status) {
                        if (status == 'success') {
                            rightIframe.window.addPic(data.replace(/<[^>]+>/g, ""), n);//子页面方法
                        }
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                });
            }
        } else {
            var str = $("#netid").val();
            if (str == "http://" || str == "") { //验证
                showMess("请选择图片！")
            } else {
                rightIframe.window.addPic(str, n);
            }
        }
    }
    //图片预览
    function picView(url) {
        if (url != "" && url != null) {
            $(".view_pic_div").attr("src", url);
            $(".pl_view_pic").show();
            $(".popumask").show();
        }
    }

    function picView2(url) {
        if (url != "" && url != null) {
            $(".view_pic_div2").attr("src", url);
            $(".pl_view_pic2").show();
            $(".popumask").show();
        }
    }
    //修改手机号$(".yes-btn", window.parent.document).unbind().on("click",func);
    function showphoneMess() {
        $(".popumask").show();

        $(".pl_change_phonenum").show();
        $(".yes-btn", window.parent.document).unbind().click(function () {
            var edittel = $(".pl_change_phonenum input:eq(0)").val();
            var editcode = $(".pl_change_phonenum input:eq(1)").val();
            rightIframe.window.telcode(edittel, editcode);
            /* $(".pl_text").hide();
             $(".popumask").hide(); */
        });
    }
    function hidephoneMess() {
        $(".pl_change_phonenum").fadeOut();
        $(".popumask").fadeOut();
    }
    //不带确定的提示框
    function showMess(str) {
        $(".popumask").show();
        $(".pl_normal .pl_content p").html(str);
        $(".pl_normal").show();
        setTimeout(function () {
            $(".popumask").fadeOut();
            $(".pl_normal .pl_content p").html("");
            $(".pl_normal").hide();
        }, 3000);
    }
    function hideMess() {
        $(".popumask").fadeOut();
        $(".pl_normal .pl_content p").html("");
        $(".pl_normal").hide();
    }
  	//只带确定的提示框 确定方法要自己在子页面写,$(".yes-btn", window.parent.document).unbind().on("click",func);
    function showMessOnlyYes(str) {
        $(".pl_yes .pl_content p").text(str);
        $(".pl_yes").show();
        $(".popumask").show();
    }
    function hideMessOnlyYes() {
        $(".pl_yes .pl_content p").text("");
        $(".pl_yes").hide();
        $(".popumask").hide();
    }
    //带确定的提示框 确定方法要自己在子页面写,$(".yes-btn", window.parent.document).unbind().on("click",func);
    function showMessYes(str) {
        $(".pl_yesorno .pl_content p").text(str);
        $(".pl_yesorno").show();
        $(".popumask").show();
    }
    function hideMessYes() {
        $(".pl_yesorno .pl_content p").text("");
        $(".pl_yesorno").fadeOut();
        $(".popumask").fadeOut();
    }

    //子页面内页面跳转跳转
    function iframeGoToUrl(url) {
        $("#rightIframe").attr("src", url);
    }
    //带文本框的提示框 确定方法要自己在子页面写,
    function showText(str) {
        $(".pl_text .layer_top span").html(str);
        $(".pl_text").show();
        $(".popumask").show();
        $(".pl_text .yes-btn").unbind().click(function () {
            var content = $(".pl_text textarea").val();
            rightIframe.window.getText(content);
            $(".pl_text").hide();
            $(".popumask").hide();
        });
    }
    //未读消息对话
    function notRead(mess, chat) {
        var messNotRead = parseInt(mess);
        var chatNotRead = parseInt(chat);
        if (messNotRead > 0) {
            $(".headtop a").eq(0).find("span").text(messNotRead).show();
            $(".m_l_mid a").eq(1).html(messNotRead).addClass("m_l_mid_sel");
        } else {
            $(".headtop a").eq(0).find("span").hide();
            $(".m_l_mid a").eq(1).html("").removeClass("m_l_mid_sel");
        }
        if (chatNotRead > 0) {
            $(".headtop a").eq(1).find("span").text(chatNotRead).show();
            $(".m_l_mid a").eq(0).html(chatNotRead).addClass("m_l_mid_sel");
        } else {
            $(".headtop a").eq(1).find("span").hide();
            $(".m_l_mid a").eq(0).html("").removeClass("m_l_mid_sel");
        }
    }
    $(".no-btn").click(function () {
        $(this).parent().parent().parent().hide();
    });
    //验证码倒计时
    function getcode(ss) {
        var tel = $(".pl_change_phonenum input:eq(0)").val();
        if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
            showMess("请输入正确的手机号码");

        } else {
            if (time_on) {
                var time = 30;
                clearInterval(timer);
                $(this).css({background: "#CCCCCC", color: "#666666"});
                $(this).html("重新获取(" + time + ")");
                timer = setInterval(function () {
                    time--;
                    $(".pl_change_phonenum .btn").html("重新获取(" + time + ")");
                    if (time > 0) {
                        time_on = false;

                    } else {
                        clearInterval(timer);
                        $(".pl_change_phonenum .btn").html("重新获取");
                        $(".pl_change_phonenum .btn").css({background: "#5EC520", color: "#FFFFFF"});
                        time_on = true;
                    }
                }, 1000);

            }

            $.ajax({
                type: "POST",
                url: "${ctx}/conn",
                data: "tel=" + tel,
                dataType: 'text',
                success: function (data) {
                    //showMess(data);

                }
            });
        }

    }
    //触发编辑未保存中断提示框  调用此方法，传递提示内容str
    function showStopEidtor(str) {
        $("#leftIframe").contents().find('.transparent_mask_layer').css({"display": "block"});
        $("#leftIframe").contents().find('.transparent_mask_layer').unbind().click(function () {
            var thisobj = this, thisindex = $(this).index();
            showMessYes(str);
            $(".pl_yesorno .btns-yesorno a:eq(0)").unbind().click(function () {
                var href = $("#leftIframe").contents().find(thisobj).next().find("a").attr("href");
                if (href != undefined) {
                    $("#leftIframe").contents().find(thisobj).next().find("a").addClass("l_b_2sel");
                    goUrl(href);
                } else {
                    $("#leftIframe").contents().find(thisobj).next().trigger("click");
                }
                $(".pl_yesorno").hide();
                $(".popumask").hide();
                $("#leftIframe").contents().find('.transparent_mask_layer').css({"display": "none"});
            });
        });
    }
    //停止触发未保存中断提示框
    function stopShowEidtor() {
        $("#leftIframe").contents().find('.transparent_mask_layer').unbind();
        $(".pl_yesorno .btns-yesorno a:eq(0)").unbind();
        $("#leftIframe").contents().find('.transparent_mask_layer').css({"display": "none"});
    }
    
    /*推荐服务js start*/
    //弹窗显示推荐服务中的推荐公司
    var comIndex;
    function recommendCompany(){
    	comIndex=layer.open({
			type: 2,
			title: false,
			area: ['800px', '600px'],
			content: '${ctx}/backmana/recommend/showCompany'
		});
    }
    //重新加载右边iframe的数据
    function reloadRightIframe(){
    	window.frames["leftIframe"].document.getElementById("reloadRightIframe").click();
    }
    /*推荐服务js end*/
    
    /*查看推荐需求start*/
    function showRecommendReq(rid){
    	layer.open({
			type: 2,
			title: false,
			area: ['800px', '565px'],
			content: '${ctx}/userhomepage/showRecommendReq?rid='+rid
		});
    }
    /*查看推荐需求end*/
    
    /*查看看过的需求start*/
    function showHaveSeenReq(rid){
    	layer.open({
			type: 2,
			title: false,
			area: ['800px', '565px'],
			content: '${ctx}/userhomepage/showHaveSeenReq?rid='+rid
		});
    }
    /*查看看过的需求end*/
    
</script>
</body>
</html>