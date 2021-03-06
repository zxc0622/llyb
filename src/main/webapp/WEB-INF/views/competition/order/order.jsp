<%@ taglib prefix="t" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/18
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>参与竞价订单</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

    <style>
        .isgreen{color:#5ec520;}

        .tab_main .tab_main_row{height:auto;}
        .tab_main_result table tr{height: auto;}
        .tab_main_result table tr td{padding:3px;}
        .sub_banzhu{margin:0 3px;}
        .tab_main input[type="text"]{height:28px;width:200px;}
        .m_r15{margin-right: 15px;}
        .w_4txt{width:55px;display: inline-block;}
        .tab_main_row{margin-top: 10px;}
        select{height:32px;}
        table th{border-bottom: 1px solid #ccc;}
        table td{border-bottom: 1px dashed #ccc;}

    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>参与竞价订单</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">中标竞价</span>
            <span>参与的竞价</span>
        </div>
        <form action="">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">查询 :</div>
                <input class="fl m_r15" value="${text}" placeholder="请输入竞品名称" type="text" id="check" placeholder="">
                <a class="btn fl " href="javascript:check()">查询</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="m_r15">竞价列表 :</div>
                <table style="width:715px;">
                    <thead>
                    <tr>
                        <th>时间</th>
                        <th>名称</th>
                        <th>金额</th>
                        <th>状态</th>
                        <th>操作</th>
                        <th>详情</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${zs}" var="r">
                            <tr>
                                <td >${fn:substring(r.create_date,0 ,10 )}</td>
                                <td >
                                        ${r.comp_title}
                                </td>
                                <td>${r.amount}</td>
                                <td>
                                    <c:if test="${r.order_sta eq 0}">
                                     	   待付款
                                    </c:if>
                                    <c:if test="${r.order_sta eq 1}">
                                       	 待发货
                                    </c:if>
                                    <c:if test="${r.order_sta eq 2}">
                                      	  待收货
                                    </c:if>
                                    <c:if test="${r.order_sta eq 3}">
                                      	  交易结束
                                    </c:if>
                                </td>
                                <td style="width:115px;">
                                <c:if test="${r.order_sta eq 0}">
                                    <a href="javascript:pay(${r.id})"class="isgreen m_r15 w_4txt">付款</a>
                                </c:if>
                                <c:if test="${r.order_sta eq 2}">
                                    <a href="javascript:confirm(${r.id})"class="isgreen m_r15 w_4txt">确认收货</a>
                                </c:if>
                                </td>
                                <td><a href="javascript:seeDetails('${r.comp_id}')" class="isgreen">查看</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                     </div> -->
            </div>

            <!--筛选结果-->
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
        //切换sheet页
        $(".tab_title span").click(function(){
            //$(this).addClass('cur_tab').siblings().removeClass('cur_tab');
            location.href='${ctx}/competition/order/order';
        });
    });
    function check(){
        location.href='${ctx}/competition/order?text='+$('#check').val();
    }
    function seeDetails(str){
        location.href="${ctx}/competition/inforMan/addSee?paramId="+str;
    }
	function pay(id){
		$.ajax({
			type:'post',
			url:'${ctx}/competition/order/pay',
			data:'id='+id,
			success:function(data){
				parent.showMess(data.msg);
				goUrl('${ctx}/competition/order');
			}
		});
	}
	function confirm(id){
		$.ajax({
			type:'post',
			url:'${ctx}/competition/order/confirm',
			data:'id='+id,
			success:function(data){
				parent.showMess(data.msg);
				goUrl('${ctx}/competition/order');
			}
		});
	}
</script>
</body>
</html>

