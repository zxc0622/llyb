<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
    <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
    <style>
        /*头部中部start*/
        .header_banner{margin-top:15px;}
        /*头部中部end*/
        /*内容start*/

        /*当前位置*/
        .main_row_1{height:40px; overflow:hidden; margin-bottom:10px;}
        .cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
        .main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
        .main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}

        .main_con{padding:0 20px; overflow:hidden;}

        /*核心产品页面*/
        .core_pro .hexin-title{text-align: center;margin:180px 0 20px;}
        .core_pro .hexin-title h1{font-size: 45px;font-weight:100;color:#5ec520;height: 50px;line-height: 50px;}
        .core_pro .hexin-title p{font-size: 25px;color:#666;margin:30px 0;}
        .core_pro .hexin-img{margin:30px 0;}
        .core_pro .hexin-img img{display: block;margin:0 auto;}

        /*联系我们*/
        .about_us{padding:28px;}
        .about_us .about_banner{display:block; margin-bottom:28px;}
        .about_us ul{margin-bottom:24px; overflow:hidden;}
        .about_us ul li{border:1px solid #ccc; position:relative; float:left;width:296px; height:140px;}
        .about_us ul li a{line-height:70px; float:right;margin:35px 48px 35px 0px; color:#333; font-size:20px;}
        .about_us ul li span{height:70px;width:80px; display:block; float:left; background-image:url(${ctxStatic}/img/llhb/about_us_2.png); background-repeat:no-repeat; background-position:0 0; margin:35px 40px 35px 48px;}
        .about_us .about_us_1 li:nth-of-type(1) span{}
        .about_us .about_us_1 li:nth-of-type(2) span{background-position:-80px 0px;}
        .about_us .about_us_1 li:nth-of-type(3) span{background-position:-168px 0px;}
        .about_us .about_us_2 li:nth-of-type(1) span{background-position:-245px 0px;}
        .about_us .about_us_2 li:nth-of-type(2) span{background-position:-330px 0px;}

        .about_us ul li p{position:absolute; font-size:14px; line-height:24px; background-color:#5ec420; color:white; width:256px; height:90px;padding:50px 0 0 40px; display:none;}
        .about_us ul li:hover p{display:block;}

        .co_box{overflow:hidden; width:100%; margin-top:-101px;}
        .co_box .co_1{background-image:url(${ctxStatic}/img/llhb/co_back_1.png); background-repeat:no-repeat; position:relative; width:100%; height:550px;}
        .co_box .co_1 img{position:absolute; z-index:2;left:50%; margin-left:-500px;}
        .co_box .co_2{ background-color:#5ec420;position:relative; width:100%; height:550px;}
        .co_box .co_2 img{position:absolute; z-index:2;left:50%; margin-left:-500px;}
        .co_box .co_3{ background-color:#2b8f8d;position:relative; width:100%; height:550px;}
        .co_box .co_3 img{position:absolute; z-index:2;left:50%; margin-left:-500px;}
        .co_box .co_4{background-image:url(${ctxStatic}/img/llhb/co_back_2.png); background-repeat:no-repeat; position:relative; width:100%; height:613px;}
        .co_box .co_4 .co_4_1{ position:absolute;width:1000px; left:50%; margin-left:-500px; color:white;}
        .co_box .co_ba{width:380px; margin-left:310px; margin-top:80px;}
        .co_box .co_4 .co_4_1 .co_ba p{font-size:30px; color:white; margin-bottom:40px; width:380px; text-align:center;}
        .co_box .co_ba ul{}
        .co_box .co_ba ul li{overflow:hidden; width:380px; margin-bottom:34px;}
        .co_box .co_ba ul li span{font-size:14px; line-height:44px; background-color:white; display:block; float:left; width:100px; text-indent:20px;}
        .co_box .co_ba ul li input{color:#999; line-height:44px; border:0; width:284x; float:left; height:44px;}
        /*绿联公司页面*/
        .lvlian-main-top{width:958px;margin:20px auto;overflow: hidden;}
        .lvlian-main-top-l{width:450px;float:left;color:#666;font-size: 14pt;line-height: 150%;}
        .lvlian-main-top-r{width:450px;height:350px;float:right;}
        .lvlian-main-top-r img{width:100%;height:100%;}
        .lvlian-main-b{}
        /*旋转开始*/
        .lvlian-rotate-wrap{width:600px;height:600px;margin:0px auto;position: relative;}
        .circle{position: absolute;top:50%;left:50%;-ms-transform: translate(-50%,-50%);-webkit-transform: translate(-50%,-50%);-moz-transform: translate(-50%,-50%);-o-transform: translate(-50%,-50%);transform: translate(-50%,-50%);width:380px;height: 380px;border-radius: 190px;background: url(${ctxStatic}/img/llhb/lvlian-circle.png) center center no-repeat;}
        .circle-fenzhi{position:absolute;width:50px;height:94px;left:50%;-ms-transform:translate(-50%,-50%);-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-o-transform:translate(-50%,-50%);transform:translate(-50%,-50%);top:51px;background:url(${ctxStatic}/img/llhb/lvlian-circle-fenzhi.png) 0 0 no-repeat;-ms-transform-origin:-2px 138px;-webkit-transform-origin:-2px 138px;-moz-transform-origin:-2px 138px;transform-origin:-2px 138px;}
        .fenzhi-act{background:url(${ctxStatic}/img/llhb/lvlian-circle-fenzhi-act.png) 0 0 no-repeat;}
        .circle-fenzhi:nth-child(2){-ms-transform:rotate(72deg) translate(-50%,-50%);-webkit-transform:rotate(72deg) translate(-50%,-50%);-moz-transform:rotate(72deg) translate(-50%,-50%);-o-transform:rotate(72deg) translate(-50%,-50%);transform:rotate(72deg) translate(-50%,-50%);}
        .circle-fenzhi:nth-child(3){-ms-transform:rotate(144deg) translate(-50%,-50%);-webkit-transform:rotate(144deg) -ms-translate(-50%,-50%);-o-transform:rotate(144deg) translate(-50%,-50%);transform:rotate(144deg) translate(-50%,-50%);transform:rotate(144deg) translate(-50%,-50%);}
        .circle-fenzhi:nth-child(4){-ms-transform:rotate(216deg) translate(-50%,-50%);-webkit-transform:rotate(216deg) -ms-translate(-50%,-50%);-o-transform:rotate(216deg) translate(-50%,-50%);transform:rotate(216deg) translate(-50%,-50%);transform:rotate(216deg) translate(-50%,-50%);transform:rotate(216deg) translate(-50%,-50%);}
        .circle-fenzhi:nth-child(5){-ms-transform:rotate(288deg) translate(-50%,-50%);-webkit-transform:rotate(288deg) -ms-translate(-50%,-50%);-o-transform:rotate(288deg) translate(-50%,-50%);transform:rotate(288deg) translate(-50%,-50%);transform:rotate(288deg) translate(-50%,-50%);transform:rotate(288deg) translate(-50%,-50%);}
        .txt{position: absolute;width:100px;height:30px;line-height: 30px;text-align: center;top:60px;left:250px;color:#5ec520;font-size: 22px;cursor: pointer;}
        .txt span{position: absolute;top:0;display: block;color:#666;width:200px;line-height: 20px;text-align: left;display: none;font-size:14px;}

        .center-circle{width:150px;height:150px;position: absolute;top:50%;left:50%;-ms-transform: translate(-50%,-50%);-webkit-transform: translate(-50%,-50%);-moz-transform: translate(-50%,-50%);-o-transform: translate(-50%,-50%);transform: translate(-50%,-50%);border-radius: 75px;background: url(${ctxStatic}/img/llhb/lvlian-circle-center.png) center center no-repeat;background-size: cover;}
        .center-text{width:80%;height:50%;position: absolute;top:50%;left:50%;-ms-transform:translate(-50%,-50%);-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-o-transform:translate(-50%,-50%);transform:translate(-50%,-50%);}
        .center-text p{font-size: 28px;font-weight: bold;color:#4E9128;text-align: center;line-height: 100%;}
        .center-text p span{-webkit-transition:all .7s;-moz-transition:all .7s;-ms-transition:all .7s;-o-transition:all .7s;transition:all .7s;}
        .center-text p .showspan{color:#ee7800;}
        /*绿联公司页面结束*/
    </style>
</head>
<body>
<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>首页>关于我们
            </div>
        </div>
        <div class="tab_main" style="width:998px; overflow:hidden; margin-bottom:100px;">

            <div class="m_r_title">
                <span class="m_r_tname">绿联公司</span>
                <span id="remark">核心产品</span>
                <span>招商中心</span>
                <span>联系我们</span>
            </div>
            <div class="lvliangongsi">
                <div class="lvlian-main-top">
                    <div class="lvlian-main-top-l">
                        <p style="font-size: 14pt;line-height: 150%;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优蚁环保网是广东绿联互联网科技有限公司旗下品牌，于2015年12月上线，2016年被环保部确定为国家环境服务业试点项目，也是广东省第一家环境服务业试点单位。
                        </p>
                        <p style="font-size: 14pt;line-height: 150%;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优蚁环保网致力于做企业身边的环保顾问，帮助生产型企业寻找优质环保服务公司，一站式解决企业在日常生产经营每一环节所需的环保工作，为生产企业更规范更专业的做好环保工作的同时降低企业环保成本。提供环保商品在线交易、环保技术在线咨询、环保需求在线发布/查看、第三方顾问等服务。
                        </p>

                    </div>
                    <div class="lvlian-main-top-r">
                        <img src="${ctxStatic}/img/llhb/lvlian-m-t-r.png" alt="">
                    </div>
                </div>
                <div class="lvlian-main-b">
                    <div class="lvlian-rotate-wrap">
                        <div class="circle">
                            <div class="circle-fenzhi"></div>
                            <div class="circle-fenzhi"></div>
                            <div class="circle-fenzhi"></div>
                            <div class="circle-fenzhi"></div>
                            <div class="circle-fenzhi"></div>
                        </div>
                        <div class="txt txt5">
                            危废服务
                            <span class="">线上危废一站式办理,极大地简化了原本繁琐复杂的办理流程,操作简易,为企业节约时间,提高效率</span>
                        </div>
                        <div class="txt txt1">
                            环保供求
                            <span class="">展示环保需求企业的详细信息，精准对接优质环保服务公司</span>
                        </div>
                        <div class="txt txt2">
                            环保商城
                            <span class="">汇集环保专业设备、环保服务企业、专业环保工程建设与运营商家,为企业提供更多选择</span>
                        </div>
                        <div class="txt txt3">
                            企业库
                            <span class="">专属环保行业商家的形象展示区,提高曝光度</span>
                        </div>
                        <div class="txt txt4">
                            资讯
                            <span class="">为企业提供最新最热的环保动态、展会信息、环保科普资讯</span>
                        </div>
                        <div class="center-circle">
                            <div class="center-text">
                                <p><span>一</span><span>站</span><span>式</span><br/>
                                    <span>无</span><span>忧</span><span>服</span><span>务</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="core_pro">
                <div class="hexin-title">
                    <h1>固废供求</h1>
                    <p></p>
                </div>
                <div class="hexin-img">
                    <img src="${ctxStatic}/img/llhb/hexin-1.png" alt="">
                </div>
                <div class="hexin-title">
                    <h1>环保商城</h1>
                </div>
                <div class="hexin-img">
                    <img src="${ctxStatic}/img/llhb/hexin-2.png" alt="">
                </div>
                <div class="hexin-title">
                    <h1>环保报价</h1>
                    <p></p>
                </div>
                <div class="hexin-img">
                    <img src="${ctxStatic}/img/llhb/hexin-3.png" alt="">
                </div>
                <div class="hexin-title">
                    <h1>企业库</h1>
                    <p>专属环保行业商家的形象展示区</p>
                </div>
                <div class="hexin-img">
                    <img src="${ctxStatic}/img/llhb/hexin-4.png" alt="">
                </div>
                <div class="hexin-title">
                    <h1>危废处理</h1>
                    <p>专业、细致、高效、价廉为产废企业对接危废处置全程服务，</p>
                    <p>检测报价等参考,并对接靠谱、 高效、价廉的环保服务公司</p>
                </div>
                <div class="hexin-img">
                    <img src="${ctxStatic}/img/llhb/hexin-5.png" alt="">
                </div>
            </div>
            <div class="about_us">
                <img class="about_banner" src="${ctxStatic}/img/llhb/about_us_1.png">
                <ul class="about_us_1">
                    <li style="margin-right:24px;">
                        <span>&nbsp;</span><a>客服中心</a>
                        <p>电话：${servicePhone }<br>E-mail：service@yyhb365.com</p>
                    </li>
                    <li style="margin-right:24px;">
                        <span>&nbsp;</span><a>业务洽谈</a>
                        <p>电话：${servicePhone }<br>E-mail：service@yyhb365.com</p>
                    </li>
                    <li>
                        <span>&nbsp;</span><a>市场合作</a>
                        <p>电话：${servicePhone }<br>E-mail：service@yyhb365.com</p>
                    </li>
                </ul>
                <ul class="about_us_2">
                    <li style="margin-right:24px;">
                        <span>&nbsp;</span><a>投诉受理</a>
                        <p>电话：21669939转801<br>E-mail：service@yyhb365.com</p>
                    </li>
                    <li style="width:618px;">
                        <span style="margin-left:210px">&nbsp;</span><a style="margin-right:208px;">公司地址</a>
                        <p style="width:578px; height:104px;padding-top:36px;">公司地址：广东省东莞市南城区黄金路1号天安数码城B2栋702号<br>电话：${servicePhone }<br>E-mail：service@yyhb365.com</p>
                    </li>
                </ul>
            </div>

        </div>

    </div>
    <div class="co_box">
        <div class="co_1">
            <img src="${ctxStatic}/img/llhb/co_1.png">
        </div>
        <div class="co_2">
            <img src="${ctxStatic}/img/llhb/co_2.png">
        </div>
        <div class="co_3" style="height:700px;">
            <img src="${ctxStatic}/img/llhb/co_3.png">
        </div>
        <div class="co_2">
            <img src="${ctxStatic}/img/llhb/co_4.png">
        </div>
        <div class="co_3">
            <img src="${ctxStatic}/img/llhb/co_5.png">
        </div>
        <div class="co_2">
            <img src="${ctxStatic}/img/llhb/co_6.png">
        </div>
        <div class="co_4">
            <div class="co_4_1">
                <div class="co_ba">
                    <p>欢迎加入优蚁环保</p>
                    <ul>
                        <li><span class="color_1">公司名称</span><input class="font_1" type="text" value="请填写公司名称" onFocus="this.value=''" style="width:280px;"></li>
                        <li>
                            <select style="width:175px; border:0; height:44px; line-height:44px;float:left;padding-left: 12px">
                                <option>省/市</option>
                            </select>
                            <select style="width:175px; border:0; height:44px; line-height:44px; float:right;">
                                <option>市/地区</option>
                            </select>
                        </li>
                        <li><span class="color_1">联系人</span><input class="font_1" type="text" value="请填写联系人姓名" onFocus="this.value=''" style="width:280px;"></li>
                        <li><span class="color_1">联系电话</span><input class="font_1" type="text" value="请填写联系电话" onFocus="this.value=''" style="width:280px;"></li>
                        <li><input type="button" value="立即加入" style="width:380px; border:0; background-color:#5ec420; font-size:14px; color:white;"></li>
                        <li class="font_3" style="text-align:center;">或拨打&nbsp;${servicePhone }</li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<!--中间部分end-->

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>

<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
<script>

    //绿联公司旋转开始

    var txt1dushu=72;
    var txt2dushu=144;
    var txt3dushu=216;
    var txt4dushu=288;
    var txt5dushu=360;
    var txtdushu=[txt1dushu,txt2dushu,txt3dushu,txt4dushu,txt5dushu];
    var rotate_interval;
    var mid_circle_dushu=0;
    $(function(){
        //圆心横坐标
        var c1=$(".lvlian-rotate-wrap").width()/2;
        //圆心纵坐标
        var c2=$(".lvlian-rotate-wrap").height()/2;
        var deg;
        //圆轨迹半径
        var R=225;
        //一圈时间(s)
        //按照60帧
        var time=20;
        rotate_interval_fn();
        $(".txt").on("mouseover",function(){
            clearInterval(rotate_interval);
            //样式变换
            var index=$(this).index();
            $(this).css("color","#4e9128");
            $(".circle").find(".circle-fenzhi").eq(index-1).addClass("fenzhi-act");
            if(78<txtdushu[index-1]&&txtdushu[index-1]<250){
                $(this).find("span").attr("style","left:100%;display:block");
            }else{
                $(this).find("span").attr("style","right:100%;display:block");
            }
        }).on("mouseout",function(){
            rotate_interval_fn();
            var index=$(this).index();
            $(this).css("color","#5ec520");
            $(".circle").find(".circle-fenzhi").eq(index-1).removeClass("fenzhi-act");
            $(this).find("span").hide();
        });
        //字样式变换
        showspan();
        //绑定计时器
        function rotate_interval_fn(){
            rotate_interval=setInterval(function(){
                txtdushu[0]=circle_rotate("txt1",txtdushu[0]);
                txtdushu[1]=circle_rotate("txt2",txtdushu[1]);
                txtdushu[2]=circle_rotate("txt3",txtdushu[2]);
                txtdushu[3]=circle_rotate("txt4",txtdushu[3]);
                txtdushu[4]=circle_rotate("txt5",txtdushu[4]);
                mid_circle_rotate();

            },16.67);
        }
        //求度数
        function getdeg(dushu){
            return (2*Math.PI/360)*dushu;
        }
        //中心circle 寻转
        function mid_circle_rotate(){

            if(mid_circle_dushu>=360){
                mid_circle_dushu=1;
            }else{
                mid_circle_dushu+=(360/time)/60;
            }
            $(".circle").css({"transform":"translate(-50%,-50%) rotate("+mid_circle_dushu+"deg)","-ms-transform":"translate(-50%,-50%) rotate("+mid_circle_dushu+"deg)","-webkit-transform":"translate(-50%,-50%) rotate("+mid_circle_dushu+"deg)","-moz-transform":"translate(-50%,-50%) rotate("+mid_circle_dushu+"deg)","-o-transform":"translate(-50%,-50%) rotate("+mid_circle_dushu+"deg)"});
        }
        //每度 旋转
        function circle_rotate(obj,dushu){

            if(dushu>=360){
                dushu=1;
            }else{
                dushu+=(360/time)/60;

            }
            var deg = getdeg(dushu);
            var y1=R*Math.cos(deg);
            var x1=R*Math.sin(deg);
            $("."+obj).css({"top":c2-y1-$("."+obj).height()/2+"px","left":c1+x1-$("."+obj).width()/2+"px"});
            return dushu;
        }
        function showspan(){
            var nowspan=0;
            setInterval(function(){
                if(nowspan!=7){
                    $(".center-text p span").eq(nowspan).addClass("showspan").siblings('span').removeClass("showspan");
                    nowspan++;
                }else{
                    $(".center-text p span").eq(0).addClass("showspan").siblings('span').removeClass("showspan");
                    nowspan=1
                }
            },1000);

        }
    });

    //绿联公司旋转结束
    $(document).ready(function(){
        $(".core_pro").hide();
        $(".about_us").hide();
        $(".co_box").hide();
        var remark="${index}";
        if(remark == "1"){
            $(".tab_main .m_r_title span").removeClass("m_r_tname");
            $("#remark").addClass("m_r_tname");
            $(".lvliangongsi").hide();
            $(".core_pro").show();
            $(".about_us").hide();
            $(".co_box").hide();
        }
        var num_1;
        $(".tab_main .m_r_title span").mousedown(function(){
            num_1=$(".tab_main .m_r_title span").index(this);
            $(".tab_main .m_r_title span").removeClass("m_r_tname");
            $(this).addClass("m_r_tname");
            if(num_1==0){
                $(".lvliangongsi").show();
                $(".core_pro").hide();
                $(".about_us").hide();
                $(".co_box").hide();
            }else if(num_1==1){
                $(".lvliangongsi").hide();
                $(".core_pro").show();
                $(".about_us").hide();
                $(".co_box").hide();
            }else if(num_1==2){
                $(".lvliangongsi").hide();
                $(".co_box").show();
                $(".core_pro").hide();
                $(".about_us").hide();
                $(".tab_main").css("padding-bottom","0px");
                $(".tab_main .m_r_title").css("border-bottom","0px");
            }else if(num_1==3){
                $(".lvliangongsi").hide();
                $(".core_pro").hide();
                $(".about_us").show();
                $(".co_box").hide();
            }
        })
    })
</script>

<script>
    $(function(){
        $(".h_s_top a").on("click",function(){
            $(this).addClass("li-sel").siblings().removeClass("li-sel");
            $("#biaoji").val($(this).index());
        });
        h_s_bottom_a();
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
    })
</script>

</body>
</html>


