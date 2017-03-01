<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/28
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <title>论坛-发帖</title>
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>

    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>

    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style>
        /*头部中部start*/
        .header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
        .header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
        .header_middle .header_search .h_s_middle{float:left;}
        .header_middle .header_search .h_s_middle input{width:372px;}
        .header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
        .header_right{margin-top:30px;}
        /*头部中部end*/
        /*内容start*/

        /*页面修改*/
        input[type=text],.tab_main input[type=password]{border:1px solid #ccc; height:30px;text-indent: 5px;}
        select {border: solid 1px #C9CACA;;text-indent: 3px;color: #666666; height:32px;}
        /*当前位置*/
        .main_row_1{overflow:hidden;}
        .cur_position{font-size:12px; color:#666; margin:10px 0;line-height: 30px;}
        .cur_position input{width:290px;}
        .cur_position select{width:90px;}
        .cur_position .btn{width:70px;margin-left: 20px;}
        .cur_position + div{font-size: 12px;color:#666;}

        /*左侧悬窗 start*/
        .gf_ad_left{width:80px;position:absolute;top:298px;left:50%; margin-left:-600px;z-index:16;}
        .gf_ad_left img{width:100%;}
        /*左侧悬窗 end*/

        /*右侧悬框*/
        .gf_ad_right{width:108px; height:305px;  position:absolute; top:298px ; right:50%; margin-right:-622px; z-index:15;}
        .r_a_top{width:100%; position:absolute;z-index:17;}
        .r_a_down{width:100%; position:absolute; z-index:16; top:92px;}
        .r_a_down>div:nth-of-type(1){padding-top:18px;}
        .r_a_cc{width:100%;background-color:#5cb531; border-top:1px solid #efefef; padding:13px 0px; overflow:hidden;}
        .r_a_cc span{color:#FFF;display:block; float:left; width:57px; margin-left:13px;}
        .r_a_cc img{display:block; margin-left:8px; float:left; }
        .r_a_cell{ width:100%;padding:10px 0px ; background-color:#efefef;}
        .r_a_cell p{display:block; text-align:center;}
        .r_a_cell>p:nth-of-type(2){color:#5cb531; font-size:14px; }

        /*页面修改*/
        .ltfatie_mian{margin-top: 10px;margin-bottom: 50px;}
        .fatie_title{padding:0 10px;border-bottom: 1px solid #ccc;height:30px;margin-bottom: 20px;}
        .fatie_title span{border:1px solid #ccc;border-top: 3px solid #468c38;border-bottom: none;color:#5ec520;display: block;height:29px;line-height: 30px;width:120px;text-align: center;background: #fff;}
        .fatie_SandI{line-height: 30px;color:#666;}
        .fatie_SandI select{min-width: 140px;margin-right: 20px;}
        .fatie_SandI input{width: 370px;margin-right: 20px;}
        .fatie_fujian{margin:15px 0;}
        /*附件样式*/
        .header_banner{height:45px;overflow:visible;}

        .attachment_div{border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
        .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
        .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
        .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
        .add_attachment_btn>a{color:#5EC520;}
        .btn_normal{display: block;margin-left: 15px;height:30px;line-height: 30px;width:120px;text-align: center;background: #f2f2f2;}
        /*页面修改 结束*/
    </style>
</head>
<body>
<!--头部 start-->
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start--
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo">
                <a href="javascript:void(0);">
                    <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台">
                </a>
            </h1>
            <div class="header_search">
                <!--<select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>-->
                <div class="h_s_middle font_1">
                    <input type="search" id="text" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" onclick="searchtext()" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <div class="header_banner"style="margin-top: 15px;">
        <!--头部导航 start-->
        <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
        <!--头部banner end-->
    <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main clearfix">
        <div class="main_row_1">
            <div class="cur_position"></div>
            <div>
                当前位置>${pos.lname}>${pos.bname}>发表帖子
            </div>
        </div>
        <form action="${ctx}/forum/save" method="post">
        <div class="ltfatie_mian">
            <div class="fatie_title">
                <span>发表帖子</span>
            </div>
            <div class="clearfix fatie_SandI">
                <select name="board_type" id="type" class="fl" onfocus="denglu()"  >
                    <option value="">请选择主题分类</option>
                    <c:if test="${not empty user.id}">
                        <c:forEach items="${themes}" var="t">
                            <c:choose>
                                <c:when test="${post.board_type eq t.id}">
                                    <option value="${t.id}" selected>${t.board_name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${t.id}">${t.board_name}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </c:if>


                </select>
                <input class="fl title" type="text" onfocus="denglu()"   name="post_title" oninput="input_text(160,this)" value="${post.post_title}">
                <div class="fl">
                    还可输入<span></span>个字符
                </div>
            </div>

            <textarea style="margin-left: 0px;display: none;"  name="post_content"  id="post_content"  cols="85" rows="30"></textarea>
            <script   id="editor" type="text/plain" style="position:relative;z-index:1;height:480px;margin-top: 20px;width:100%;"></script>




            <div class="fatie_fujian clearfix">
                <div class="add_attachment_btn font_1">
                    <a href="javascript:addAttachment();">添加附件</a>
                </div>
                <input type="file" name="attachment_file" id="attachment_file" onchange="clickattr()" style="display: none;"/>
                <c:forEach items="${as}" var="a">
                    <div class="attachment_div" >
                        <a href="javascript:void(0);" class="tmui-ellipsis font_1" title="${a.attach_name}">${a.attach_name}</a>
                        <a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>
                        <input type="hidden" name="attach_name" value="${a.attach_name}"/>
                        <input type='hidden' name='attach_href' value='${a.attach_href}'>
                    </div>
                </c:forEach>
            </div>
            <div class="clearfix">
                <a href="javascript:tijiao(1)" class="btn fl tijiao">发表帖子</a>
                <a href="javascript:tijiao(0)" class="btn_normal fl tijiao">保存草稿</a>
            </div>
        </div>

            <input type="hidden"  value="${boradId}" name="board_id">
            <%--<input type="hidden" value="" name="board_type">
            <input type="hidden" value="" name="post_title">
            <input type="hidden" value="" name="post_content">--%>
           <%-- <input type="hidden"  value="${user.id}" name="create_by">
            <input type="hidden"  value="${today}" name="create_date">--%>
            <input type="hidden" value="" name="sta" id="sta">
            <input type="hidden" value="0" name="good" >
            <input type="hidden" value="0" name="page_view" >
            <input type="hidden" value="${pid}" name="pid"  >


        </form>

    </div>



</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
<!--底部 end-->
<div class="popumask" style="z-index: 1;"></div>
<div class="populayer pl_normal" >
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p></p>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
    // <!--轮播广告-->
    $(document).ready(function(){
        $(".header_nav ul li").eq(7).addClass("header_nav_sel");


        /*获取图片的盒子对象*/
        var $fadeDom = $(".fade_list");
        /*控制轮播的索引*/
        var idx = 0;
        /*定时器*/
        var fadeTimer = null;
        /*轮播时间*/
        var timer = 3000;
        var length = $(".fade_list li").length;
        $(".main_banner .fade_btn").html("");
        $(".fade_list li").each(function(){
            $(".main_banner .fade_btn").append('<a href="javascript:void(0);" ></a>');
        });
        $(".main_banner .fade_btn").find("a:first").addClass("h_b_btn_sel");

        $(".fade_btn").on("click","a",function(){
            clearInterval(fadeTimer);
            idx = $(this).index();
            changePic(idx);
            $(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }).mouseleave(function(){
            playFader();
        }).mouseover(function(){
            clearInterval(fadeTimer);
        });

        function playFader(){
            fadeTimer = setInterval(function(){
                idx++;
                if(idx == length){
                    idx = 0;
                }
                changePic(idx);

            },timer);
        }
        /*执行轮播*/
        playFader();



    });

    function changePic(idx){
        $(".main_banner").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
    }

    $(function(){
        //实例化编辑器
        var ue = UE.getEditor("editor",{
            toolbars: [[
                'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'preview',  '|',/*'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',*/
                'simpleupload'/*,'insertimage',*/,'insertvideo'
            ]] ,
            imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str=",
            videoUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
        });
        ue.ready(function () {
            // editor准备好之后才可以使用
            ue.setContent('${post.post_content}');
        });
        ue.addListener("focus", function (type, event) {
            denglu();
        });
        var UEDITOR_HOME_URL = "/utf8-jsp/";
        var contentNavArr = [];
        var ad_top=$(".header_banner").each(function(){
            contentNavArr.push($(this).offset().top);

        });
        /*滚动条事件*/
        $(window).scroll(function(){
            /*左右悬窗定位*/
            if($(window).scrollTop() >　contentNavArr[0]){
                $(".nav_bottomlist").show();
                $(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});


            }else if($(window).scrollTop() <=　contentNavArr[0]){
                $(".nav_bottomlist").hide();
                $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
            }
        });
        $(".content").click(function(){
            go('固废供求-副本-9-17.html');
        });
    });

    $(function(){
        //输入字数
        input_text(160);


        //附件
       /* $(".add_attachment_btn > a:eq(0)").click(function(){
            $("#attachment_file").trigger("click");
        });*/
        //添加附件

        /*$("#attachment_file").change(function(){
            var fileName = $(this).val().substr($(this).val().lastIndexOf("\\")+1);
            var divStr = '<div class="attachment_div">'+
                    '<a href="javascript:void(0);" class="tmui-ellipsis font_1">'+fileName+'</a>'+
                    '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+


                    '</div>';
            $(this).parent().append(divStr);
        });;*/
    });
    function removeAttachment(att){
        $(att).parent().remove();
    }
    function input_text(max,obj){
        if(obj){
            var that =$(obj);
            var now_len = that.val().length;
            that.next().find("span").text(max-now_len);
        }else{
            $(".fatie_SandI").find("div span").text(max);
            $(".fatie_SandI").find("input").attr("maxLength",max);
        }
    }
    function addAttachment(){
        //$(".row_right input").trigger("click");
        $("#attachment_file").trigger("click");
    }
    /**
     * 提交
     */
    function  tijiao(num){
        if(!'${user.id}'){
            showMess("请先登录，否则无权操作");
            return;
        }
        if('${b}'){
            showMess("您被禁言了哦");
            return;
        }
        var type = $("#type").val();

        var title = $(".title").val();
        var uecon = UE.getEditor('editor').getContent();
        if(!type||!title||!uecon){
            showMess("完善信息");
            return;
        }
       $("#post_content").val(uecon);
        $("#sta").val(num);
        $("form").submit();

    }


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
    //上传方法
   /* function upattr(){
        $.ajaxFileUpload({
            url : '${ctx}/memSerevice/message/fileUploadServer',
            secureuri : false,
            fileElementId : 'attachment_file',
            async: false,
            dataType : 'text',
            success : function(data, status) {
                if(status == 'success'){
                    attc = data.replace(/<[^>]+>/g,"");
                    if(attc == 'false'){
                        parent.showMess("上传附件的大小不能超过10M");
                        return;
                    }else{
                        atts.push(attc);
                    }

                }
            }

        });
    }*/

    //上传文件
    function clickattr(){
        var fileName = $("#attachment_file").val().substr($("#attachment_file").val().lastIndexOf("\\")+1);
        $.ajaxFileUpload({
            url:"${ctx}/memSerevice/message/fileUploadServer",
            secureuri : false,
            fileElementId : 'attachment_file',
            async: false,
            dataType : 'text',
            success:function(data){
                if(data!=false){
                    var divStr = '<div class="attachment_div" >' +
                            '<a href="javascript:void(0);" class="tmui-ellipsis font_1" title="'+fileName+'">'+fileName+'</a>'+
                            '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+
                            '<input type="hidden" name="attach_name" value="'+fileName+'"/>'+
                            "<input type='hidden' name='attach_href' value='"+data.replace(/<[^>]+>/g,"")+"'>"+
                            '</div>';
                    $(".fatie_fujian").append(divStr);
                }
            }
        })
    }
    function comPic(str) {
        $("#hiddenId").val(str);
        $(".pl_commit_pic").show();
        $(".popumask").show();
    }
    // 上传图片 弹出层方法
    function addPic(str , n){
        ue.execCommand('insertimage',{
            src:str,
            width:'500',
            height:'300'
        });


    }
    function  searchtext(){
        location.href='${ctx}/forum/list?isSubSearch=true&searchContent='+$("#text").val();
    }
    $('#text').bind('keypress',function(event){
        if(event.keyCode == "13")  {
            searchtext();
        }
    });
function  denglu(){
    if(!'${user.id}'){
        showMess("请先登录，否则无权操作");

    }
}


</script>

</body>
</html>


