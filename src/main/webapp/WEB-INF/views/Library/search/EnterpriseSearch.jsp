<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/>
<title>${companyList.companyname}-优蚁环保网</title>
<meta name="keywords" content="<c:if test="${companyList.seo_key_words =='' || empty companyList.seo_key_words }">${companyList.companyname}</c:if><c:if test="${companyList.seo_key_words !='' }">${companyList.seo_key_words}</c:if>"/>
<meta name="description" content="<c:if test="${companyList.shopDesc =='' || empty companyList.shopDesc }">${companyList.companyname}</c:if><c:if test="${companyList.shopDesc !='' }">${fn:substring(companyList.shopDesc,0,50)}...</c:if>" />
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>
/*右侧广告*/
.mall_ad{width:188px; float:right;}
.mall_ad a{width:188px; height:180.6px;display:block; margin-bottom:6px; cursor:pointer;}
.mall_ad a img{width:100%;height:100%;}

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
/*企业头部中部start*/
.qiye_header_middle{height:160px;width:100%;background-color: #2B8F8D;}
.qiye_h_m_main{width:1000px;margin:0 auto;height:100%;}
.qy_h_m_m_l{float:left;color:#fff;margin-top: 50px;}
.qy_h_m_m_l h5{font-size: 30px;}
.qy_h_m_m_l p{margin-top: 15px;}
.qy_h_m_m_r{float:right;margin-right: 80px;}
.freehuiyuan{width:70px;height:103px;background: url(${ctxStatic}/img/llhb/qiye_01.png) 0 0 no-repeat;}
/*企业头部中部end*/
.header_banner{margin:0;}
/*内容start*/

/*当前位置*/
.main_row_1{margin:15px 0;overflow: hidden;}
.cur_position{font-size:12px; color:#666; float:left;}
.cur_time{font-size:12px; color:#666;float:right;}
.qiye_main_top{width:100%;height:180px;}
.qiye_main_top img{width:100%;height:100%;}
/*中间开始*/
.qiye_main_mid{overflow: hidden;}
/*左侧开始*/
.qy_m_l{box-sizing: border-box;-moz-box-sizing: border-box;width:220px;float:left;}
.qy_m_l_div{width:100%;margin-top: 15px;}
.qy_m_l_div .qy_m_l_d_title{height:40px;line-height: 40px;color:#fff;padding:0 10px;background-color: #5Ec520;}
.qy_m_l_d_title span{float:left;}
.qy_m_l_d_title a{float:right;color:#fff;}
.qy_m_l_d_main{border:1px solid #ccc;padding:10px;}
.qy_m_l_d_main h5{font-size: 16px;}
.qy_m_l_d_main p{margin:5px 0;color:#666;font-size: 12px;}
.qy_m_l_div_freevip{width:100%height:40px;line-height: 40px;border:1px solid #ccc;border-top:none;padding:0 10px;}
.qy_m_l_div_freevip img{float:left;}
.qy_m_l_div_freevip .vip-type{margin-left:15px;font-size: 18px;color:#ee7800;font-weight: bold;}
.qy_m_l_div_freevip .vip-time{margin-left:10px;font-size: 12px;color:#666;}
/*point-list*/
.point-list li{overflow: hidden;font-size: 12px;}
.point-list li a{margin-left: 5px;float: left;width: 120px;position: relative;display: block;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;color:#666;}
.point-list li a:before{content: "";width: 3px;height: 3px;border-radius: 3px;background-color: #000;float: left;margin-top: 10px;margin-right: 5px;}
.point-list li a:hover{color:#5Ec520;}
.point-list li a:hover:before{background-color: #5Ec520;}
.point-list li span{float:right;color:#666;}
/*point-list 结束*/
.qy_search{position: relative;}
.qy_search input{width:140px;border:1px solid #ccc;font-size: 12px;color:#666;text-indent: 25px;height:25px;line-height: 25px;}
.qy_search:before{content: "";display: block;width: 20px;height: 24px;background: transparent url("${ctxStatic}/img/llhb/icon.png") no-repeat scroll -240px -120px;position: absolute;left: 4px;top: 3px;}
.qy_search a{width:55px;height:26px;line-height: 25px;color:#fff;background-color: #5Ec520;display: inline-block;text-align: center;}

/*左侧结束*/
/*右侧开始*/
.qy_m_r{box-sizing: border-box;-moz-box-sizing: border-box;width:760px;float:left;margin-left: 18px}
.qy_m_r_div{width:100%;margin-top: 15px;border:1px solid #ccc;}

.qy_m_r_div .qy_m_r_d_title{height:40px;line-height: 40px;color:#5Ec520;padding:0 10px;background-color: #EFEFEF;}
.qy_m_r_d_title span{float:left;}
.qy_m_r_d_title a{float:right;color:#5Ec520;}
.qy_m_r_d_main{padding:20px;overflow: hidden;}
.jieshaopic{width:200px;height:180px;float:left;}
.jieshaopic img{width:100%;height:100%;}
.jieshaotxt{float:right;width:500px;margin-left: 20px;color:#666;line-height: 30px;}
.jieshaotxt a{color:#ee7800;}

.pic-txt-div{width:132px;float:left;text-align: center;font-size: 12px;cursor: pointer;}
.pic-txt-div:not(:nth-child(5n)){margin-right: 15px;}
.pic-txt-div img{width:132px;height:132px;display: block;margin: 10px 0;}
.pic-txt-div p{height:15px;line-height: 15px;margin-top: 3px;color:#666;overflow: hidden;}
/*右侧结束*/
/*中间结束*/
/*企业底部*/
.qiye_main_bottom{width:100%;height:50px;border:1px solid #ccc;line-height: 50px;margin: 60px 0;color:#666;text-align: center;color:#666;}
.qiye_main_bottom>*{margin:0 5px;}
.qiye_main_bottom a{color:#666;}
.tab_main_result{height:512px;overflow-y: auto}
/*企业底部结束*/
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
         <div class="qy_m_r">
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>站内搜索</span>
                        <%--<a href="javascript:void(0)"onclick="go('${ctx}/homepage/introduction/${enterpriseId}')">MORE+</a>--%>
                    </div>
                    <div class="qy_m_r_d_main">

                        <!--筛选结果-->
                        <div class="tab_main_result">
                            <table id="showtable">
                                <tr>
                                    <th style="text-align: center;width:80px">图片</th>
                                    <th style="text-align: center;width:180px">名称</th>
                                    <th style="text-align: center;width:80px">类型</th>
                                    <th style="text-align: center;width:200px">供应商</th>
                                    <th style="text-align: center;width:120px">创建日期</th>
                                </tr>
                                <c:forEach items="${caseList }" var="record" varStatus="status">
                                    <tr style="cursor: pointer;;height: 60px;" onclick="caseDetail(${record.id})">
                                        <th>
                                            <c:if test="${not empty record.pic1 }">
                                                <img src="${record.pic1 }" style="width:80px;height:50px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && not empty record.pic2 }">
                                                <img src="${record.pic2 }" style="width:80px;height:60px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && empty record.pic2 && not empty record.pic3 }">
                                                <img src="${record.pic3 }" style="width:80px;height:60px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && empty record.pic2 && empty record.pic3 }">
                                                <img src="${ctxStatic}/img/llhb/default.png" style="width:80px;height:60px;">
                                            </c:if>
                                        </th>
                                        <td style="text-align: center;word-break:break-all;">${record.case_name}</td>
                                        <td style="text-align: center">案例</td>
                                        <td style="text-align: center;word-break:break-all;">${companyList.companyname}</td>
                                        <td style="text-align: center">${fn:substring(record.create_date, 0, 10)}</td>
                                    </tr>
                                </c:forEach>

                                <c:forEach items="${productList }" var="record" varStatus="status">
                                    <tr style="cursor: pointer;;height: 60px;" onclick="proDetail(${record.id})">
                                        <th>
                                            <c:if test="${not empty record.pic1 }">
                                                <img src="${record.pic1 }" style="width:80px;height:50px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && not empty record.pic2 }">
                                                <img src="${record.pic2 }" style="width:80px;height:60px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && empty record.pic2 && not empty record.pic3 }">
                                                <img src="${record.pic3 }" style="width:80px;height:60px;">
                                            </c:if>
                                            <c:if test="${empty record.pic1 && empty record.pic2 && empty record.pic3 }">
                                                <img src="${ctxStatic}/img/llhb/default.png" style="width:80px;height:60px;">
                                            </c:if>
                                        </th>
                                        <td style="text-align: center;word-break: break-all;">${record.pro_name}</td>
                                        <td style="text-align: center">商品</td>
                                        <td style="text-align: center;word-break: break-all;">${companyList.companyname}</td>
                                        <td style="text-align: center">${fn:substring(record.create_date, 0, 10)}</td>


                                    </tr>
                                </c:forEach>

                            </table>
                        </div>


            </div>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>
<script>
    function caseDetail(caseId){
        location.href="${ctx}/Library/case/caseDetail/"+caseId+"-"+${enterpriseId};
    }
    function proDetail(proId){
        location.href="${ctx}/mall/detail/"+proId;
    }
$(function(){
	$(".shouye").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
})
</script>
</body>
</html>


