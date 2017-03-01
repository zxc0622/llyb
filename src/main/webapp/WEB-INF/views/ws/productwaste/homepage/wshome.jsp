<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="" />
<title>优蚁环保—危废服务，优质，快捷，高效的危废服务</title>
<meta name="keywords"
	content="优蚁环保,危废，危废处理，危废服务" />
<meta name="description"
	content="优蚁环保提供优质和专业的危废服务，线上危废一站式办理，操作简易，高效快捷，资深专家量身打造危废处置方案">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/weifeifuwu_style.css" />
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huanbaobaojia_index.css"/>

<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>

<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
/*头部中部start*/
.header_middle .header_search {
	width: 440px;
	margin-top: 50px;
	margin-left: 80px;
}

.header_middle .header_search select {
	float: left;
	height: 35px;
	line-height: 35px;
	width: 92px;
	border: 1px solid #ccc;
}

.header_middle .header_search .h_s_middle {
	float: left;
}

.header_middle .header_search .h_s_middle input {
	width: 280px;
}

.header_middle .header_search .h_s_middle:before {
	content: "";
	display: block;
	width: 20px;
	height: 24px;
	background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;
	position: absolute;
	left: 5px;
	top: 7px;
}
/*头部中部end*/
/*内容start*/

/*右侧悬框*/
.gf_ad_right {
	width: 108px;
	height: 305px;
	position: absolute;
	top: 298px;
	right: 50%;
	margin-right: -622px;
	z-index: 15;
}

.r_a_top {
	width: 100%;
	position: absolute;
	z-index: 17;
}

.r_a_down {
	width: 100%;
	position: absolute;
	z-index: 16;
	top: 92px;
}

.r_a_down>div:nth-of-type(1) {
	padding-top: 18px;
}

.r_a_cc {
	width: 100%;
	background-color: #5cb531;
	border-top: 1px solid #efefef;
	padding: 13px 0px;
	overflow: hidden;
}

.r_a_cc span {
	color: #FFF;
	display: block;
	float: left;
	width: 57px;
	margin-left: 13px;
}

.r_a_cc img {
	display: block;
	margin-left: 8px;
	float: left;
}

.r_a_cell {
	width: 100%;
	padding: 10px 0px;
	background-color: #efefef;
}

.r_a_cell p {
	display: block;
	text-align: center;
}

.r_a_cell>p:nth-of-type(2) {
	color: #5cb531;
	font-size: 14px;
}

.header_banner .h_b_list {
	height: 442px;
}
</style>
</head>
<body>
	<!--头部 start-->
	<c:set var="pagename" value="wshome" />
	<%@ include file="/WEB-INF/views/include/header_ws.jsp"%>
	<!--头部 end-->
	<!--中间部分start-->
    <div class="main" style="display: none;border:1px solid red;">
    </div>
	<%--<div class="wrapper">
		<div class="main" style="margin-bottom: 50px;">
			<div class="weifei_shouye_main " >
                <div class="hbbj_main_mid">
                    <h5>最新申请危废服务</h5>
                    <div class="for_scroll_table" style="position:relative; height: 43px;"></div>
                    <div class="scroll_list"style="position:relative;height:320px;width:1000px;overflow:hidden;display:block;">
                        <table>
                            <thead class="scroll_thead">
                            <tr>
                                <td>企业</td>
                                <td>地址</td>
                                <td>联系人</td>
                                <td>申请时间</td>
                                <td>项目情况</td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sss }" var="s">
                                <tr>
                                    <td>${s.compName }</td>
                                    <td>${s.compAddr}</td>
                                    <td>${s.contactPerson }</td>
                                    <td>${fn:substring(s.createDate, 0, 10)}</td>
                                    <td>${s.remarks }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

		</div>
	</div>--%>
	<!--中间部分end-->

	<!--底部 start-->
	<%@ include file="/WEB-INF/views/include/footer_ws.jsp"%>
    <script>
        $(function(){
            clonethead();
            smooth_scroll(".scroll_list","tr");
        });

        function clonethead(){
            var each_txt=["企业","地址","联系人","申请时间","项目情况"];
            var each_w=[];
            $(".scroll_thead td").each(function(){
                each_w.push(parseInt($(this).outerWidth()));
            });
            var mythead=$("<div class='clearfix' style='position:absolute;top:0;left:0;height:32px;line-height:32px;width:100%;background:#fff;'></div>");
            for(var i=0;i<each_w.length;i++){
                var mytd = $("<div class='fl'>"+each_txt[i]+"</div>");
                mythead.append(mytd);
                mytd.css("width",each_w[i]+"px");
            }
            $(".for_scroll_table").append(mythead);
        }

        function smooth_scroll(obj,sub){
            var $dom = $(obj);
            $dom.find("thead").remove();
            $dom.find("tbody").append($dom.find("tbody").html());
            var $scroll_h=$dom.get(0).scrollHeight/2;
            var $scroll_t=0;
            var scrolltimer = setInterval(function(){
                if($scroll_t>=$scroll_h){
                    $scroll_t=0;
                }
                $dom.scrollTop(($scroll_t+=0.5));
            },17);
            $dom.find(sub?sub:"a").on("mouseover",function(){
                clearInterval(scrolltimer);
            }).on("mouseleave",function(){
                scrolltimer = setInterval(function(){
                    if($scroll_t>=$scroll_h){
                        $scroll_t=0;
                    }
                    $dom.scrollTop(($scroll_t+=0.5));
                },17);
            });

        }
    </script>
</body>
</html>


