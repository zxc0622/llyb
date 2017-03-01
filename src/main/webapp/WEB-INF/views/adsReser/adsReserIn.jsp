<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/17
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <link rel="shortcut icon" href=""/>
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/weifeifuwu_style.css"/>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
    <!-- <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script> -->
    <style>
        /*头部中部start*/
        .header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
        .header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
        .header_middle .header_search .h_s_middle{float:left;}
        .header_middle .header_search .h_s_middle input{width:280px;}
        .header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
        /*头部中部end*/
        /*内容start*/

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

        /*本页样式修改*/
        .header_banner{height:45px;}
        .cur_position{margin:15px 0;}
        .tab_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
        .tab_title .cur_tab{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
        .tab_main{margin-bottom: 20px;border:1px solid #ccc;}
        .tab_main .tab_main_row{height:auto;margin-bottom: 15px;line-height: 15px;}
        .scroll-fixed{width:978px;padding-top: 15px;padding-left: 20px;background: #fff;}
        select{border: solid 1px #C9CACA;text-indent: 3px;color: #666666;width: 103px;height: 34px;}
        .page_col{width:230px;}

        .showsele{
            display: block;}
        .hidesele{
            display: none;
        }
    </style>
</head>
<body>
<!--头部 start-->
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <div class="header_middle">
            <h1 class="header_logo">
                <a href="javascript:void(0);">
                    <a href="${ctx }/index">
                        <img src="${ctxStatic}/img/llhb/mall_logo.png" class="logoimg"/>
                    </a>
                </a>
            </h1>

            <div class="header_right"style="margin-left: 165px;float:left;margin-top: 38px;">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="header_right">
                <ul>
                    <c:forEach items="${ads }" var="ads">
                        <c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
                            <li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
                        </c:if>
                    </c:forEach>
                </ul>
                <a href="javascript:void(0);" class="h_r_next">&gt;</a>
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部banner start-->
    <div class="header_banner">
        <!--头部导航 start-->
        <nav class="header_nav font_3">
            <div class="h_n_left"></div>
            <ul>
                <li >
                    <a href="javascript:jump();" >首页</a>
                </li>
                <li class="header_nav_sel"><a href="javascript:void(0);">广告预定</a></li>
            </ul>
            <div class="h_n_right"></div>
        </nav>
        <!--头部导航 end-->

    </div>
    <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="cur_position">当前位置>信息管理>广告预定</div>
        <div class="tab_main">
            <div class="tab_title">
                <span class="cur_tab">广告预定</span>
            </div>
            <form action="">
                <!--行业分类筛选-->
                <div class="scroll-fixed clearfix">
                    <div class="tab_main_row clearfix">
                        <div class="fl page_col">
                            <span>选择频道:</span>
                            <select style="width:150px;" name="" id="seleone" onChange="" >
                                <%--<option value="">请选择</option>--%>
                                <c:forEach items="${listall}" var="a" varStatus="sta">
                                    <c:if test="${a.parent_id eq 1080 }">
                                        <option value="${a.id}" data-inn="${sta.index}">${a.name}</option>
                                    </c:if>
                                </c:forEach>

                            </select>
                        </div>
                        <%--<c:forEach items="${listall}" var="s">
                            <div class="fl page_col  regionChe" id="${s.id}" >
                                <span>选择区域:</span>
                                <select style="width:150px;" name="" id="seletwo" onChange="shiyan(this)">
                                    <c:set var="as" value="0"></c:set>
                                    <option value="">请选择</option>
                                    <c:forEach items="${listall}" var="sa" varStatus="st">
                                        <c:if test="${sa.parent_id eq s.id}">

                                            <option value="${sa.id}" data-in="${st.index}">${sa.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:forEach>--%>
                        <div class="fl page_col" >
                            <span>选择区域:</span>
                            <select style="width:150px;" name="" id="seletwo" onChange="shiyan(this)">
                                <option value="">请选择</option>
                                <c:forEach items="${ori}" var="sa" varStatus="st">
                                        <option value="${sa.id}" data-in="${st.index}">${sa.area_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="tab_main_row clearfix">
                        <div class="fl page_col">
                            <span>广告位价格:</span>
                            <span></span>
                            <span>元/月</span>
                        </div>
                        <div class="fl page_col">
                            <span>广告形式:</span>
                            <span>图片</span>
                        </div>
                        <div class="fl page_col">
                            <span>广告规格:</span>
                            <span></span>
                        </div>
                    </div>
                </div>
                <!--筛选结果-->
                <img src="${c.pic}" alt=""style="width:95%;margin:0 auto;display: block;">


            </form>

        </div>

    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
<script>
    /*var chan = {
        1:[353,606,606,606,606,606,606,759,859,1110,1254,1744,2044],
        2:367,
        3:[745,404],
        4:[431,980],
        5:614,
        6:384
    }
    var img= {
        1:["indexpage_quyu_02.png","indexpage_quyu_fuwuqiye_02.png","indexpage_quyu_huanjingyouhao02.png"],
        2:["weifeifuwu_xuanqu_03.png"],3:[ "huanbaoshangcheng_quyu_03.png","huanbaoshangcheng_neirong_quyu.png"],
        4:["gufeigongqiu_quyu_03.png","gufeigongqiu_neirong_quyu_03.png"],
        5:["qiyeku_quyu_03.png"],6: ["zixun_quyu_03.png"]
     }*/
    /*$(function(){
        $("#seleone").change(function(){
            for(var m in img){
                var s = $("#seleone :selected").data("inn");
                if(s == m){
                    $("form img").attr("src","${ctxStatic}/img/llhb/"+img[m][0]);
                    select_quyu(330);
                }
            }
            $("#seletwo").text("<option value=''>请选择</option>");
            if($(this).val == 'undefined'){

            }else{
                $.ajax({
                    type:"POST",
                    url:"${ctx}/adsReser/getArea",
                    data: "one="+$(this).val(),
                    dataType:'json',
                    success:function(data){
                        var htmls = "<option value=''>请选择</option>";
                        $.each(data,function(index, item) {
                            htmls+="<option value='"+item.id+"' data-in='"+index+"'>"+item.name+"</option>";
                        });
                        $("#seletwo").append(htmls);
                    }
                });
            }
        });


    });
    function  shiyan(str){
        var one  = $("#seleone :selected").val();
        var two = $("#seletwo :selected").val();
        if(!two){
            select_quyu(330);
            return;
        }
        $.ajax({
            type:"POST",
            url:"${ctx}/adsReser/getMoney",
            data: "chanId="+one+"&areaId="+two,
            dataType:'json',
            success:function(data){
                $(".tab_main_row:eq(1) .fl:eq(0) span:eq(1)").text(data["price"]);
                $(".tab_main_row:eq(1) .fl:eq(1) span:eq(1)").text(data.adv_type);
                $(".tab_main_row:eq(1) .fl:eq(2) span:eq(1)").text(data.adv_size);
                for(var i in chan){
                    if(i == $("#seleone :selected").attr("data-inn")){
                        if(typeof  chan[i] == 'number'){
                            select_quyu(chan[i]);
                        }else{
                            for(var e in chan[i]){
                                if(e == ($("#seletwo :selected").data("in"))){
                                    if(count(img[i]) != 1&& (i != 1)){
                                        $("form img").attr("src","${ctxStatic}/img/llhb/"+img[i][e]);
                                    }
                                    if(i == 1){
                                        var str = img[i][0];
                                       if(e==3||e==4){
                                            str = img[i][1];
                                        }else if(e==5||e==6){
                                            str  = img[i][2];
                                        }
                                        $("form img").attr("src","${ctxStatic}/img/llhb/"+str);
                                    }
                                    select_quyu(chan[i][e]);
                                }

                            }
                        }


                    }
                }

            }
        });
    }*/
    $(function(){
        $("#seleone").change(function(){
            $("#seletwo").text("<option value=''>请选择</option>");
            $.ajax({
                type:"POST",
                url:"${ctx}/adsReser/seleone",
                data: "oneid="+$(this).val(),
                dataType:'json',
                success:function(data){
                    var htmls = "<option value=''>请选择</option>";
                    $.each(data,function(index, item) {
                        if(index == 0){
                            $("form img").attr("src",item.pic);
                        }
                        htmls+="<option value='"+item.id+"' data-in='"+index+"'>"+item.area_name+"</option>";
                    });
                    $("#seletwo").append(htmls);
                }
            });
        });






        ///////////////////////////////////
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
        var sf = $(".scroll-fixed");
        var sf_height = sf.height();
        var sf_offsettop = sf.offset().top;
        $(window).scroll(function(){
            if($(window).scrollTop()>sf_offsettop){
                if(!sf.next().hasClass('sf_padding')){
                    var sf_padding = $('<div class="sf_padding"></div>');
                    sf_padding.height(sf.height());
                    sf_padding.insertAfter(sf);
                    sf.css({"position":"fixed","top":0,"border-bottom":"1px solid #ccc"});
                }
            }else{
                $(".sf_padding").remove();
                sf.css({"position":"static","border":"none"});
            }
        });
    });
   function select_quyu(h){
        $("html,body").animate({scrollTop:h});
    }
    //跳回首页
    function  jump(){
        location.href='${ctx}/index';
    }
    /**
     * * 对象 的长度

     **/
    function count(o){
        var t = typeof o;
        if(t == 'string'){
            return o.length;
        }else if(t == 'object'){
                var n = 0;
                for(var i in o){
                    n++;
                }
            return n;
        }
        return false;
    }
    function  shiyan(str){
        var one  = $("#seleone :selected").val();
        var two = $("#seletwo :selected").val();
        if(!two){
            select_quyu(330);
            return;
        }
        $.ajax({
            type:"POST",
            url:"${ctx}/adsReser/getMaintain",
            data: "areaId="+two,
            dataType:'json',
            success:function(data){
                $(".tab_main_row:eq(1) .fl:eq(0) span:eq(1)").text(data["price"]);
                $(".tab_main_row:eq(1) .fl:eq(1) span:eq(1)").text(data.adv_type);
                $(".tab_main_row:eq(1) .fl:eq(2) span:eq(1)").text(data.adv_size);
                select_quyu(data.scroll_px);

            }
        });
    }

    /**


     *各区域滚动高度  图片名
     *首页
     *   a区 389  indexpage_quyu_02.png
     *   b区 642 推荐企业
     *   b区     服务企业 indexpage_quyu_fuwuqiye_02.png
     *   b区     环境友好 indexpage_quyu_huanjingyouhao02.png
     *   c区 795
     *   d区 895
     *   e区 1146
     *   f区 1290
     *   g区 1780
     *   h区 2080
     *危废服务
     *   轮播大广告位 403  weifeifuwu_xuanqu_03.png
     *环保商城
     *   a区 781  huanbaoshangcheng_quyu_03.png
     *   b区 440  images/huanbaoshangcheng_neirong_quyu.png
     *固废供求
     *   a区 467  gufeigongqiu_quyu_03.png
     *   b区 1016 gufeigongqiu_neirong_quyu_03.png
     *企业库
     *   广告位 650 qiyeku_quyu_03.png
     *资讯
     *   广告位 420 zixun_quyu_03.png
     *
     *
     */
</script>

</body>
</html>


