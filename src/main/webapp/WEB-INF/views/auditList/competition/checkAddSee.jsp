<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/18
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <link rel="shortcut icon" href=""/>
    <title>信息管理-竞价-新建竞品</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">

        .row{overflow: hidden;margin-bottom: 15px;}
        .row > *{float:left;margin-right: 10px;}

        /*详细描述*/
        .tab_main .tab_main_row{height:auto;}
        .tab_main .tab_main_row .row_right .tip_span_area{font-size:12px;color:#999; margin-left:15px; display:block; float:left;line-height:18px}

        .tab_main .tab_main_row .row_right .pic_wait{ width:510px; margin-left:15px; float:left; margin-top:15px;overflow:hidden;}
        .tab_main .tab_main_row .row_right .pic_wait_1{float:left; margin-right:10px; overflow:hidden; width:150px;}
        .tab_main .tab_main_row .row_right .pic_wait_1 .a_1{border:1px solid #ccc;text-align:center;line-height: 126px;width:148px;height:126px;color:#666; float:left; margin-bottom:10px;}
        .tab_main .tab_main_row .row_right .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
        .tab_main .tab_main_row .row_right .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
        .tab_main .tab_main_row .row_right .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
        .tab_main .tab_main_row .row_right .tip_span_pic{font-size:12px;color:#999;display:block; float:left;line-height:18px; width:400px; margin-left:15px; margin-top:-10px;}/*提示上传尺寸*/
        .tab_main .tab_main_row .row_right .tip_span_pic a{color:#ee7800;}/*提示上传出现问题*/

        .imagshow img.imgshow{width:100%;height:100%;display:none;}
        /*当前步骤*/
        .tab_main{position:relative;}
        .cur_steps{position:absolute; right:20px; top:40px; width:68px;}
        .cur_steps ul{background-image:url(${ctxStatic}/img/llhb/jp_icon2.png); background-repeat:repeat-y; background-position:center;}
        .cur_steps ul li{width:68px;height:43px; padding-top:12px;text-align:center; line-height:16px; background-image:url(${ctxStatic}/img/llhb/jp_icon1.png); background-repeat:no-repeat; background-position:0 0;}

        .cur_steps ul .cur_s{ background-image:url(${ctxStatic}/img/llhb/jp_icon1.png); background-repeat:no-repeat; background-position:0 -65px; color:white;}

        #txt{text-indent:0px;width:520px; height:110px; padding:1px; margin-left:15px; color:#666;}
        .xuanzhong{background-color: #5EC520}


        .hidesele{display: none}
    </style>
</head>
<body>
<div class="main_right">
    <div class="m_r_position font_1">当前位置>信息管理>竞品</div>
    <div class="tab_main">

        <form action="${ctx}/competition/inforMan/save">

            <div class="tab_main_row clearfix">
                <label for="">竞品类别</label>
                <div class="row_right font1">
                    <select id="s1" name="type_first" disabled>
                        <option  value="0" selected>请选择类型</option>
                        <c:forEach items="${kindone}" var="k" varStatus="sta">
                            <option value="${k.id}">${k.name}</option>
                        </c:forEach>
                    </select>
                    <select id="s2" name="type_second" disabled>

                    </select>
                    <select id="s3" name="type_third" disabled>

                    </select>
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">竞品标题</label>
                <div class="row_right font1">
                    <input type="text" name="comp_title" value="${m.comp_title}" readonly>
                    <span class="tip_span">2-30个字</span>
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">竞品所在地</label>
                <div class="row_right font1">
                    <select class="addr1" name="prov_id" disabled>
                        <option value="0">省</option>
                        <c:forEach items="${adds}" var="a">
                            <c:if test="${a.id ne 1 && a.parentId eq 1}">
                                <option value="${a.id}">${a.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <select class="addr2" name="city_id" disabled>
                        <option value='0'>市</option>
                    </select>

                </div>
            </div>
            <%--
                        <div class="tab_main_row clearfix" style="height:140px;line-height:30px;margin-top:15px; overflow:hidden">
                            <label for="" style="height:140px">描述竞品</label>
                            <div class="row_right font1" style="width:520px; float:left">
                                <textarea id="txt" name="comp_desc"></textarea>
                                <span class="tip_span_area">建议您描述以下方面：竞品性能及有点、用途、售后服务、包装等</span>
                                <span class="tip_span_area"><br></span>

                            </div>
                        </div>--%>

            <div class="tab_main_row clearfix">
                <label for="">产品数量</label>
                <div class="row_right font1">
                    <input readonly type="text" style="width:126px;" name="amount" id="quality" value="${m.amount}">
                    <select name="unit" disabled>
                        <c:forEach items="${units}" var="u">
                            <c:choose>
                                <c:when test="${not empty m}">
                                    <c:if test="${m.unit eq u.value}">
                                        <option value="${u.value}" selected>${u.label}</option>
                                    </c:if>
                                    <c:if test="${m.unit ne u.value}">
                                        <option value="${u.value}">${u.label}</option>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <option value="${u.value}">${u.label}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">检测报告</label>
                <div class="row_right font_1 report">

                    <div class="pic_wait_1 imagshow">
                        <a class="a_1" href="javascript:void(0);" ><img class="imgshow" alt="等待上传" src="${m.testing_report}"  >等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);" >&nbsp;</a>
                    </div>
                    <div class="clearfix fl">
                        <input type="button" value="平台检测"style="display:block" id="jiance" >
                        <span class="tip_span"style="margin-left:0;">图片最佳尺寸为3M</span>
                        <a class="tip_span_p1" style="margin-left:2px; position:relative;">
                            <img src="${ctxStatic}/img/llhb/icon2.png">
                    	<span class="tip_span_w" style="position:absolute; right:-230px; top:-10px;width:200px; padding:10px 5px 10px 15px; line-height:16px; background-image:url(${ctxStatic}/img/llhb/jp_icon3.png); background-repeat:no-repeat; z-index:5;">选择优蚁平台检测，提交完整竞品信息，预付一半保证金，平台在5个工作日内会给您发送一份检测报告样版到您的站内信，付清尾款您会收到检测报告图片
</span>
                        </a>
                    </div>

                </div>
            </div>

            <div class="tab_main_row clearfix" style="height:155px;">
                <label for="" style="height:60px;">竞品图片<br></label>
                <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1 imagshow">
                        <a class="a_1" href="javascript:void(0);" ><img class="imgshow" alt="等待上传" src="${m.pic1}"  >等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);" >&nbsp;</a>
                    </div>
                    <div class="pic_wait_1 imagshow">
                        <a class="a_1"  href="javascript:void(0);"><img class="imgshow"  alt="等待上传" src="${m.pic2}">等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1 imagshow">
                        <a class="a_1" href="javascript:void(0);"><img class="imgshow" alt="等待上传" src="${m.pic3}">等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(3);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);" >&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳尺寸为3M &nbsp;<a href="javascript:void(0);">上传遇到问题？</a></span>
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">竞价开始</label>
                <div class="row_right font_1">
                    <select id="birthyear" style="width:62px;" disabled>
                        <option>2015</option>
                    </select>
                    年
                    <select id="birthmonth" onchange="showbirthday()" style="width:50px;" disabled>
                        <option>09</option>
                    </select>
                    月
                    <select id="birthday" style="width:50px;" disabled>
                        <option>01</option>
                    </select>
                    日
                    <select id="birthhour" style="width:50px;" disabled>
                        <option>20</option>
                    </select>
                    时


                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">竞价周期</label>
                <div class="row_right font_1">
                    <select id="zhouqi" name="comp_period" disabled>

                        <c:forEach items="${perions}" var="a">
                            <c:choose>
                                <c:when test="${not empty m}">
                                    <c:if test="${m.comp_period eq a.value}">
                                        <option value="${a.value}" selected>${a.label}</option>
                                    </c:if>
                                    <c:if test="${m.comp_period ne a.value}">
                                        <option value="${a.value}">${a.label}</option>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${a.value ne 0}">
                                        <option value="${a.value}">${a.label}</option>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>


                        </c:forEach>
                    </select>
                    <%--<span class="tip_span">不选表示长期有效</span>--%>

                </div>
            </div>


            <div class="tab_main_row clearfix">
                <label for="">保证金</label>
                <div class="row_right font_1 promise">
                    <input type="text" id="promise" disabled style="width:150px;" name="margin_money" value="${m.margin_money}">&nbsp;元
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">起拍价</label>
                <div class="row_right font_1 beginP">
                    <input readonly type="text" id="beginP" disabled style="width:150px;" name="starting_price" value="${m.starting_price}">&nbsp;元
                </div>
            </div>

            <div class="tab_main_row clearfix">
                <label for="">每次最低加价</label>
                <div class="row_right font_1">
                    <select id="zuidi" name="least_increase" disabled>
                        <c:forEach items="${incres}" var="a">
                            <option value="${a.value}">${a.label}</option>
                        </c:forEach>
                    </select>&nbsp;元
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <label for="">竞品公告</label>
                <div class="row_right font_1">
                    <textarea  readonly style="margin-left: 0px;display: none;" name="comp_announ"  id="compannoun" cols="85" rows="30"></textarea>
                    <script  id="editor" type="text/plain" style="margin-left:115px;margin-top:37px;width:600px;height:500px;"></script>
                </div>
            </div>
          <%--  <div class="tab_main_row clearfix">
                <label for="">&nbsp;</label>
                <a href="javascript:parent.comPic(4)"class="btn"style="margin-left:25px;">本地上传</a>
            </div>--%>


            <div class="tab_main_row clearfix">
                <label for="">详细描述</label>
                <div class="row_right font_1">
                    <textarea readonly style="margin-left: 0px;display: none;"   id="compdesc"  cols="85" rows="30"></textarea>
                    <script  id="editor2" type="text/plain" style="margin-left:115px;margin-top:25px;width:600px;height:500px;"></script>
                </div>
            </div>
           <%-- <div class="tab_main_row clearfix">
                <label for="">&nbsp;</label>
                <a href="javascript:parent.comPic(5)"class="btn"style="margin-left:25px;">本地上传</a>
            </div>--%>


           <%-- <div class="tab_main_row clearfix">
                <div class="save_or_return">
                    <a href="javascript:void(0)" class="save_btn" onclick="subfirst()">提交</a>
                    <a href="javascript:void(0)" class="return_btn" onclick="back();">返回</a>
                </div>
            </div>--%>

            <input type="hidden" class="tupian" value="" name="testing_report">
            <input type="hidden" class="tupian" value="" name="pic1">
            <input type="hidden" class="tupian" value="" name="pic2">
            <input type="hidden" class="tupian" value="" name="pic3">
            <input type="hidden"  value="${user.id}" name="create_by">
            <input type="hidden"  value="${today}" name="create_date">
            <%-- <input type="hidden"  id="announ" value="" name="comp_announ">--%>
            <input type="hidden"  id="desc" value="" name="comp_desc">
            <input type="hidden"  id="starttime" value="" name="comp_start_time">
            <input type="hidden"  id="jiance2" value="" name="plat_test">
            <input type="hidden"  id="id" value="${ppid}" name="paramId">
            <input type="hidden"  id="id" value="1" name="sta">



            <div class="save_or_return" style="width:450px;">
                <a href="javascript:void(0)" onclick="pass(2,'')" class="save_btn">通过</a>
                <a href="javascript:parent.showText('请填写不通过的原因');" class="save_btn">不通过</a>
                <a href="javascript:back();" class="save_btn" >返回</a>
            </div>

        </form>

        <div class="cur_steps">
            <ul class="font_1">
                <li class="cur_s" style="margin-bottom:80px;">选择<br>分类</li>
                <li style="margin-bottom:360px;">描述<br>竞品</li>
                <li style="margin-bottom:150px;">设置<br>竞价</li>
                <li>提交后<br>待审核</li>

            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    //只读
    var ue=new UE.ui.Editor({readonly:true,});
    ue.render('editor');
    var ue2=new UE.ui.Editor({readonly:true,});
    ue2.render('editor2');
    ue.ready(function () {
        ue.setContent('${m.comp_announ}');
    });
    ue2.ready(function () {
        ue2.setContent('${m.comp_desc}');
    });
    var step_num;
    $(".tab_main_row").mousedown(function(){
        step_num=$(".tab_main_row").index(this);
        if(step_num<=2){
            $(".cur_steps ul li:eq(0)").addClass("cur_s");
            $(".cur_steps ul li:eq(0)").siblings().removeClass("cur_s");
        }
        if(step_num>=3&&step_num<=6){
            $(".cur_steps ul li:eq(1)").addClass("cur_s");
            $(".cur_steps ul li:eq(1)").siblings().removeClass("cur_s");
        }
        if(step_num>=7&&step_num<=10){
            $(".cur_steps ul li:eq(2)").addClass("cur_s");
            $(".cur_steps ul li:eq(2)").siblings().removeClass("cur_s");
        }
        if(step_num==11){
            $(".cur_steps ul li:eq(3)").addClass("cur_s");
            $(".cur_steps ul li:eq(3)").siblings().removeClass("cur_s");
        }
    });
    $(".save_or_return").mousedown(function(){

    })

</script>


<!--问号提示-->
<script>
    $(".tip_span_w").hide();
    $(".tip_span_p1").mouseover(function(){
        $(".tip_span_w").show();
    });
    $(".tip_span_p1").mouseleave(function(){
        $(".tip_span_w").hide();
    })
</script>

<!--竞价开始时间选择-->
<script type="text/javascript">
    $(function(){
        $('#s1 option').each(function () {
            if('${m.type_first}' == $(this).val()){
                $(this).prop('selected','selected');
                s2();
            }
        });
        $('.addr1 option').each(function () {
            if('${m.prov_id}' == $(this).val()){
                $(this).prop('selected','selected');
                city();
            }
        });
       /* $('.addr2 option').each(function () {
            if('${m.city_id}' == $(this).val()){
                $(this).prop('selected','selected');
            }
        });*/
        if('${m.testing_report}'){
            $(".imgshow").eq(0).css("display","block");
            $(".imgshow").eq(0).attr("src",'${m.testing_report}');
        }
        if('${m.pic1}'){
            $(".imgshow").eq(1).css("display","block");
            $(".imgshow").eq(1).attr("src",'${m.pic1}');
        }
        if('${m.pic2}'){
            $(".imgshow").eq(2).css("display","block");
            $(".imgshow").eq(2).attr("src",'${m.pic2}');
        }
        if('${m.pic3}'){
            $(".imgshow").eq(3).css("display","block");
            $(".imgshow").eq(3).attr("src",'${m.pic3}');
        }
        if('${m.plat_test}' == 'true'){
            $("#jiance").css("backgroundColor","#5ec520").addClass("xuanzhong");
        }



        $(".addr1").change(city);

        showbirthyear();
        showbirthmonth();
        showbirthhour();
    });
    function city(){
        $.ajax({
            type : "POST",
            url : "${ctx}/protection/getCity",
            data : "province=" + $(".addr1").val(),
            dataType : 'json',
            success : function(data) {
                var htmls = "";
                $.each(data,function(index, item) {
                    htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $(".addr2").append(htmls);
                $('.addr2 option').each(function () {
                    if('${m.city_id}' == $(this).val()){
                        $(this).prop('selected','selected');
                    }
                });
            }
        })
    }
    function showbirthday(){
        $('#birthday').empty();
        for(var i=0;i<28;i++){
            //$('#birthday').get(0).options.add(new Option(i+1, i+1));
            if(i<10){
                $('#birthday').append("<option value="+0+''+(i+1)+">"+0+''+(i+1)+"</option>");
            }else{
                $('#birthday').append("<option value="+(i+1)+">"+(i+1)+"</option>");
            }
        }

        if($('#birthmonth').val()!="2"){
            $('#birthday').append("<option value='29'>29</option><option value='30'>30</option>");
            switch($('#birthmonth').val()){
                case "1":
                case "3":
                case "5":
                case "7":
                case "8":
                case "10":
                case "12":{
                    $('#birthday').append("<option value='31'>31</option>");
                }
            }
        } else if($('#birthyear').val()!="") {
            var nbirthyear=$('#birthyear').val();
            if(nbirthyear%400==0 || nbirthyear%4==0 && nbirthyear%100!=0) $('#birthday').append("<option value='29'>29</option>");
        }
        $("#birthday option").each(function () {
            if('${m.comp_start_time}'.substring(8,10) == $(this).val()){
                $(this).prop('selected','selected');
            }
        });
    }
    //生成年份select的option
    function showbirthyear(){
        var $birthyear=$("#birthyear");
        $birthyear.empty();
        var start=2015;
        var date=new Date();
        var end=date.getFullYear()+2;
        var count=end-start;
        for(var i=0;i<count;i++){
            var year=start+i;
            $birthyear.append("<option value="+year+">"+year+"</option>");

        }
        $("#birthyear").each(function () {
            if('${m.comp_start_time}'.substring(0,4) == $(this).val()){
                $(this).prop('selected','selected');
                showbirthmonth();
            }
        });
    }
    //生成月份select的option
    function showbirthmonth(){
        var $birthmonth=$("#birthmonth");
        $birthmonth.empty();
        for(var i=1;i<=12;i++){
            if(i<10){
                $birthmonth.append("<option value="+0+''+i+">"+0+''+i+"</option>");
            }else{
                $birthmonth.append("<option value="+i+">"+i+"</option>");
            }

        }
        $("#birthmonth option").each(function () {
            if('${m.comp_start_time}'.substring(5,7) == $(this).val()){

                $(this).prop('selected','selected');
                showbirthday();
            }
        });
    }


    //生成小时select的option
    function showbirthhour(){
        var $birthhour=$("#birthhour");
        $birthhour.empty();
        for(var i=1;i<=24;i++){
            if(i<10){
                $birthhour.append("<option value="+0+''+i+">"+0+''+i+"</option>");
            }else{
                $birthhour.append("<option value="+i+">"+i+"</option>");
            }

        }
        $("#birthhour option").each(function () {
            if('${m.comp_start_time}'.substring(11,13) == $(this).val()){
                $(this).prop('selected','selected');
            }
        });
    }

</script>

<script type="text/javascript">

    $("#s1").change(s2);
    function s2(){
        $("#s2").html('');
        $.ajax({
            type : "POST",
            url : "${ctx}/competition/inforMan/getKindTwo",

            data : "one=" + $("#s1").val(),
            dataType : 'json',
            success : function(data) {
                var htmls = "<option  value='0'>请选择类型</option>";
                $.each(data,function(index, item) {
                    htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#s2").append(htmls);
                $('#s2 option').each(function () {
                    if('${m.type_second}' == $(this).val()){
                        $(this).prop('selected','selected');
                        s3();
                    }
                });
            }
        })
    }
    $("#s2").change(s3);
    function s3() {
        $("#s3").html('');
        $.ajax({
            type : "POST",
            url : "${ctx}/competition/inforMan/getKindThree",
            data : "two=" + $("#s2").val(),
            dataType : 'json',
            success : function(data) {

                var htmls = "<option  value='0'>请选择类型</option>";
                $.each(data,function(index, item) {
                    htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#s3").append(htmls);
                $('#s3 option').each(function () {
                    if('${m.type_third}' == $(this).val()){
                        $(this).prop('selected','selected');
                    }
                });
            }
        })
    }
  /*  // 上传图片 弹出层方法
    function addPic(str , n){
        if(n==4){
            ue.execCommand('insertimage',{
                src:str,
                width:'500',
                height:'300'
            });
        }else if(n==5){
            ue2.execCommand('insertimage',{
                src:str,
                width:'500',
                height:'300'
            });
        }else{
            $(".imgshow").eq(n).css("display","block").css("width","100%").css("height","100%");
            $(".imgshow").eq(n).attr("src",str);
            $(".tupian").eq(n).attr("value",str);
        }

        //$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src","${ctx}/findImgResources?imgUrl="+str);
    }
    //图片预览
    function picSea(n){
        var url=$(".imgshow").eq(n).attr("src");
        parent.picView(url);
    }
    //图片删除
    function picDel(n){
        $(".imgshow").eq(n).attr("src","");
        $(".imgshow").eq(n).css("display","none");
    }
    //上传报告
    $(".report :button:eq(0)").click(function(){

    });
    //平台监测
    $("#jiance").click(function(){
        if($(this).hasClass("xuanzhong")){
            $(this).css("background-color","#fff").removeClass("xuanzhong");
        }else{
            $(this).css("background-color","#5ec520").addClass("xuanzhong");
        }
    });*/
    //校验数字
    function shuzi(str){
        var re = /\d+(\.\d+)*/ig;
        return re.test(str);
    }
    //提交
    function  subfirst(){
        var s1 = $("#s1").val(),s2 = $("#s2").val(),s3 = $("#s3").val();//类别
        var title = $(".tab_main_row:eq(1) :text").val();
        var arr1 = $(".tab_main_row:eq(2) select:eq(0) :selected").val();//省
        var arr2 = $(".tab_main_row:eq(2) select:eq(1) :selected").val();
        var mount = $(".tab_main_row:eq(3) :text").val();//数量

        var beginP = $(".beginP :text").val();//起拍价
        var file1 = $(".imgshow").eq(0).attr("src");
        var file2 = $(".imgshow").eq(1).attr("src");
        var file3 = $(".imgshow").eq(2).attr("src");
        var file4 = $(".imgshow").eq(3).attr("src");
        var jiance = $("#jiance").hasClass("xuanzhong");
        var zhouqi  = $("#zhouqi").val();//周期
        var zuidi = $("zuidi").val();//最低加价
        var uecon = UE.getEditor('editor').getContent();
        var uedet = UE.getEditor('editor2').getContent();
        var start = $("#birthyear").val()+"-"+$("#birthmonth").val()+"-"+$("#birthday").val()+" "+$("#birthhour").val()+":00:00";//竞价开始时间
        if(jiance){
            $("#jiance2").val(1);
        }else{
            $("#jiance2").val(0);
        }
        if(!mount||!beginP||!s1||!s2||!s3||($.trim(title).length < 2 || $.trim(title).length > 30)||(!arr1||!arr2)){
            parent.showMess("完善信息或填写符合要求的信息！");

        }else if(!shuzi(mount)||!shuzi(beginP)){
            parent.showMess("请输入正确的数字格式！");

        }else{

            $("#starttime").val(start);
            $("#compannoun").val(uecon);
            $("#desc").val(uedet);
            sub();
            //sub(s1,s2,s3,title,arr1,arr2,text,mount);
        }

    }
    function  sub(){
        $("form").submit();
        //$("form").attr("action","${ctx}/competition/inforMan/save");
    }
    function subAjax(){
        $.ajax({
            type : "POST",
            url : "${ctx}/competition/inforMan/save",
            data : "two=" + $(this).val(),
            dataType : 'json',
            success : function(data) {

                var htmls = "";
                $.each(data,function(index, item) {
                    htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#s3").append(htmls);
            }
        })
    }


    //跳转页面
    function jump(str){
        location.href = '${ctx}/competition/inforMan/check?con='+str;
    }


    //图片预览
    function picSea(n){
        var url=$(".imgshow").eq(n).attr("src");
        parent.picView(url);
    }
    function back(){
        parent.iframeGoToUrl('${ctx}/auditList/competition?con=1');
    }

    function getText(content){
        /* if(content == ""){
         parent.showMess("请先填写信息");
         return;
         }else{
         parent.hideMessYes();
         pass(0,content);
         } */
        parent.hideMessYes();
        pass(0,content);
    }
    function pass(n,str){
        var ss = "";
        if(str != ""){
            ss=str;
        }
        $.ajax({
            type : "POST",
            url : "${ctx}/auditList/competition/pass",
            dataType : "json",
            async : false,
            data:"flag="+n+"&pid=${ppid}&content="+ss,
            success : function(data) {
                parent.showMess("操作成功");
                setTimeout(function(){
                    parent.hideMess();
                    parent.iframeGoToUrl('${ctx}/auditList/competition?con='+n);
                },1500);
            }
        });
    }
</script>
</body>
</html>