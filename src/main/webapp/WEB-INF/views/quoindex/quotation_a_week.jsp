<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>行情中心</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search{width:440px; margin-top:50px; margin-left:80px;}
.header_middle .header_search select{float:left; height:35px; line-height:35px; width:92px; border:1px solid #ccc;}
.header_middle .header_search .h_s_middle{float:left;}
.header_middle .header_search .h_s_middle input{width:280px;}
.header_middle .header_search .h_s_middle:before{content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
.header_right{margin-top:30px;}
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px; overflow:hidden;}
.cur_position{font-size:12px; color:#666; margin:15px 0; float:left;}
.main_row_1 .btn_1{width:110px; height:30px; line-height:30px; background-color:#ee7800;float:right; margin-top:10px; margin-left:10px; position:relative; cursor:pointer;}
.main_row_1 .btn_1 a{color:#FFF; margin-left:10px;}



/*行情中心页面*/
.hangqing-title{border-bottom: 1px solid #ccc;overflow: hidden;position: relative;}
.hangqing-title>span{display:block; float:left; background-color:#5cb531; padding:5px 17px; font-size:16px; color:#FFF;}
.hangqing-title>a{float:right;margin-top: 3px;color:#ee7800;}
.hangqing-main-t{overflow: hidden;}
/*行情左侧*/
.hq-m-t-l{float:left;width:235px;margin-top: 15px;border:1px solid #ccc;}
.hq-m-t-l li{height:35px;line-height: 35px;border-bottom: 1px dashed #ccc;padding-left: 65px;background-color: #F7F8F8;}
.hq-m-t-l .ziyuan-title{height:40px;line-height: 40px;background-color: #4F9028;color:#fff;border:none;font-size: 16px;}
.hq-m-t-l li a{position: relative;margin-left:3px}
.hq-m-t-l li a:before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 15px;margin-right: 5px}
.hq-m-t-l li a:hover{color:#5EC520;}
.hq-m-t-l li a:hover::before{background-color: #5EC520;}
.m-t-l-a-act{color:#5EC520;}
.hq-m-t-l li .m-t-l-a-act:before{background-color:#5EC520;}
/*行情左侧结束*/
/*行情右侧*/
.hq-m-t-r{float:left;margin-top: 15px;margin-left: 20px;width:743px;}
.tri-class{overflow: hidden;}
.tri-class-btn:nth-of-type(5n){margin-right: 0;}
.tri-class-btn{display: block;float:left;width:134px;height:30px;border:1px solid #ccc;line-height: 30px;color:#666;text-align: center;margin-top: 15px;margin-right: 15px;background: #fff;}
.tri-class-btn-act{border:1px solid #5EC520;color:#fff;background: #5EC520;}

/*行情中心页面主要内容*/
.hq-main-content{margin-top: 15px;}
.hangqing-title .main-content-title-r{display: absolute;right:0;top:0;overflow: hidden;position: absolute;}
.main-content-title-r>*{float:left;margin-right: 3px;}
.main-content-title-r>span{margin-top: 3px;}
.main-content-title-r input,.main-content-title-r select{border:1px solid #ccc;height:25px;line-height: 25px;color:#666;text-indent: 5px;width:100px;}
.main-content-title-r select{height:27px;}
.date_img{display: inline-block;width:20px;height:20px;background:url(${ctxStatic}/img/llhb/dateIco.png) 0 5px no-repeat;}

.hq-main-div{border:1px solid #ccc;margin-top: 15px;}
.hq-tab-title{height:40px;line-height: 40px;border-bottom:1px solid #ccc;width:100%;}
.hq-tab-title .span-act{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 8px;cursor: pointer;}
.hq-tab-title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
.hq-tab-title a{display: block;float:right;margin-right:20px;width:120px;height:27px;line-height: 27px;text-align: center;color:#fff;background-color: #ee7800;margin-top: 7px;}
.hq-table-div{padding:20px;}
.hq-line-div{padding:20px;display: none;}
.hq-table-div table{width:100%;}
.table tr th{height:25px;color:#666;background:#F7F8F8;font-size:16px;text-align:center;padding:4px 4px;border:1px solid #ccc;}
.table tr td{height:25px;color:#666;background:#fff;padding:4px 4px;border:1px solid #e2e2e2;font-size:14px;}
.table > tbody > tr:nth-child(2n+1){background:#f9f9f9;}
.table tr:hover td{background:#FFFDEE;}
/*行情右侧结束*/
/*行情底部*/
.hangqing-main-b{overflow: hidden;margin-top: 15px;margin-bottom: 30px;}
.hangqing-main-b .hq-m-b-l{float:left;width:485px;}
.hangqing-main-b .hq-m-b-r{float:right;width:485px;}
.hangqing-main-b ul li{height:30px;line-height: 30px;border-bottom: 1px dashed #cccccc;}

.hangqing-main-b ul>li:last-child{border-bottom: none;}
.hangqing-main-b ul li a{float:left;position: relative;margin-left:5px;}
.hangqing-main-b ul li a::before{content: "";width:4px;height:4px;border-radius:3px;background-color: #333;float:left;margin-top: 14px;margin-right: 5px}
.hangqing-main-b ul li a:hover{color:#5EC520;}
.hangqing-main-b ul li a:hover::before{background-color: #5EC520;}
.hangqing-main-b ul li span{float:right;color:#666666;}

/*行情底部结束*/

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
</style>
</head>
<body>
<!--头部 start-->
<header>
    <div class="line_top"></div>
    <div class="headerBox">
        
        <!--头部上部 start-->
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
                <select >
                    <option>固废供应</option>
                    <option>固废供求</option>
                </select>
                <div class="h_s_middle font_1">
                    <input type="search" placeholder="请输入你要搜索的内容" style="border:1px solid #ccc; margin-left:-1px;"/>
                    <a class="font_3" href="javascript:void(0);" style="margin-left:-1px;">搜索</a>
                </div>
            </div>
            <div class="header_right">
                <img src="${ctxStatic}/img/llhb/mall_tel.png">
            </div>
            <div class="clear"></div>
        </div>
        <!--头部中部部 end-->
    </div>

    <!--头部导航 start-->
	<%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
	<!--头部导航 end-->
</header>
<!--头部 end-->

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>行情中心>再生资源指数
            </div>
        </div>
        <div class="hangqing-main-t">
            <div class="hangqing-title">
                <span>再生资源指数</span>
            </div>
            <div class="hq-m-t-l">
                <ul>
                    <li class="ziyuan-title">危险废物</li>
                    <li style="border-bottom: none"><a href="javascript:void(0)">废物代码</a></li>
                    <li class="ziyuan-title">大宗废物</li>
                    <li><a href="javascript:void(0)">尾矿</a></li>
                    <li><a href="javascript:void(0)">煤矸石</a></li>
                    <li><a href="javascript:void(0)">煤灰粉</a></li>
                    <li><a href="javascript:void(0)">冶炼渣</a></li>
                    <li><a href="javascript:void(0)">工业副产石膏</a></li>
                    <li style="border-bottom: none"><a href="javascript:void(0)">赤泥</a></li>
                    <li class="ziyuan-title">一般固废</li>
                    <li><a href="javascript:void(0)">废金属</a></li>
                    <li><a href="javascript:void(0)">废塑料</a></li>
                    <li><a href="javascript:void(0)">废橡胶</a></li>
                    <li><a href="javascript:void(0)" class="m-t-l-a-act">废玻璃</a></li>
                    <li><a href="javascript:void(0)">废纸</a></li>
                    <li><a href="javascript:void(0)">旧衣服</a></li>
                    <li><a href="javascript:void(0)">旧家电</a></li>
                    <li style="border-bottom: none"><a href="javascript:void(0)">旧家具</a></li>
                </ul>
            </div>    
            <div class="hq-m-t-r">
                <div class="tri-class">
                    <div class="hangqing-title">
                        <span>废玻璃</span>
                    </div>
                    <a href="javascript:void(0)"class="tri-class-btn">工业玻璃</a>
                    <a href="javascript:void(0)"class="tri-class-btn">显像管玻璃</a>
                    <a href="javascript:void(0)"class="tri-class-btn">平板玻璃</a>
                    <a href="javascript:void(0)"class="tri-class-btn">钢化玻璃</a>
                    <a href="javascript:void(0)"class="tri-class-btn">玻璃瓶</a>
                    <a href="javascript:void(0)"class="tri-class-btn tri-class-btn-act">碎玻璃</a>

                </div>
                <div class="hq-main-content">
                    <div class="hangqing-title">
                        <span>废玻璃</span>
                        <div class="main-content-title-r">
                            <span>所在地区 :</span>
                            <select name="" id="">
                                <option value="">上海地区</option>
                            </select>
                            <span>日期</span>
                            <input type="text" class="date_first">
                            <a href="javascript:void(0)" class="date_img date_i_f"></a>
                            <span>至</span>
                            <input type="text" class="date_second">
                            <a href="javascript:void(0)" class="date_img date_i_s"></a>
                            <a href="javascript:void(0)" class="btn"style="height:27px;line-height: 27px;">查询</a>
                        </div>
                    </div>

                    <!-- 行情走势&行情参考 -->
                    <div class="hq-main-div">
                        <div class="hq-tab-title">
                            <span>一周行情走势图</span>
                            <span class="span-act">一周行情参考</span>
                            <a href="javascript:void(0)">交易预告</a>
                            <a href="javascript:void(0)">交易结果公示</a>
                        </div>
                        <div class="hq-table-div">
                            <table class="table">
                                <tr>
                                    <th>类别</th>
                                    <th>09-28</th>
                                    <th>09-29</th>
                                </tr>
                                <tr>
                                    <td>工业玻璃</td>
                                    <td>300元/吨</td>
                                    <td>300元/吨</td>
                                </tr>
                                <tr>
                                    <td>工业玻璃</td>
                                    <td>300元/吨</td>
                                    <td>300元/吨</td>
                                </tr>
                                <tr>
                                    <td>工业玻璃</td>
                                    <td>300元/吨</td>
                                    <td>300元/吨</td>
                                </tr>
                                <tr>
                                    <td>工业玻璃</td>
                                    <td>300元/吨</td>
                                    <td>300元/吨</td>
                                </tr>
                                <tr>
                                    <td>工业玻璃</td>
                                    <td>300元/吨</td>
                                    <td>300元/吨</td>
                                </tr>
                            </table>
                            <img src="${ctxStatic}/img/llhb/nodate_1.png">
                        </div>
                        <div class="hq-line-div">
                            
                        </div>    
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="hangqing-main-b">
            <div class="hq-m-b-l">
                <div class="hangqing-title">
                    <span>每日行情</span>
                    <a href="javascript:void(0)">更多+</a>
                </div>
                <ul class="font_1">
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                </ul>
            </div>
            <div class="hq-m-b-r">
                <div class="hangqing-title">
                    <span>行情预测</span>
                    <a href="javascript:void(0)">更多+</a>
                </div>
                <ul class="font_1">
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                    <li><a href="javascript:void(0)">不惧寒冬 再生资源回收行业寻求新出路</a><span>2015-09-15</span></li>
                </ul>
            </div>
        </div>
        
    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
<%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<!--底部 end-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<!--底部下部信息 end-->

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
 <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script>
$(function (){
    //弹出日历选择
    $(".date_first,.date_second").manhuaDate({                        
        Event : "click",//可选                       
        Left : 0,//弹出时间停靠的左边位置
        Top : -16,//弹出时间停靠的顶部边位置
        fuhao : "-",//日期连接符默认为-
        isTime : false,//是否开启时间值默认为false
        beginY : 1949,//年份的开始默认为1949
        endY :2100//年份的结束默认为2049
    });
    $(".date_i_f").click(function(){
        $(".date_first").trigger("click");
    });
    $(".date_i_s").click(function(){
        $(".date_second").trigger("click");
    });


    //走势图&参考表切换
    $(".hq-tab-title span").click(function(){
        $(this).siblings("span").removeClass('span-act').end().addClass("span-act");
        $(".hq-table-div,.hq-line-div").toggle();
        
    });
});
    
</script>
</body>
</html>