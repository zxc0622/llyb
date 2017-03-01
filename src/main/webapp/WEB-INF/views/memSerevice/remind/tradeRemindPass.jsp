<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>交易提醒</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>

         <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            .receive_table{width:763px;border:0px;margin-bottom: 10px;overflow: hidden;}

            /*提示样式*/
            .list_tab{width:96%;border:1px;margin-left:2%;}
            .list_tab tr{border-bottom: 1px dashed #cccccc;height:40px;}
            .list_tab tr td{vertical-align: middle;}
            .list_tab_tr_td_a{ background: url('${ctxStatic}/img/llhb/xinxi_icon2.png');width:21px;height:19px;display: block;float:left;background-repeat: no-repeat;}
            .list_tab_tr_td_a2{background: url('${ctxStatic}/img/llhb/xinxi_icon2.png');width:21px;height:19px;display: block;float:left;background-repeat: no-repeat;background-position: 100% 0%;}
            .span_org{color:#F08300;}
            .tab_main2{width:753px;border:1px solid #F08300;height:30px;margin-bottom: 5px;overflow: hidden;background-color: #FFFDEE;padding-left: 3px;}
            .tab_main2 span{line-height: 30px;}
            .tab_main3{width:763px;border:0px solid #F08300;height:40px;margin-bottom: 20px;overflow: hidden;}
        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>交易提醒>已通过</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span onclick="goUrl('${ctx}/memSerevice/remind/add')">添加贸易</span>
                        <span class="m_r_tname">已通过</span>
                        <span onclick="goUrl('${ctx}/memSerevice/remind/audit')">审核中</span>
                    </div>

                    <form action="">
                        <div class="receive_table" style="border:0px solid #cccccc;">
                            <table id="table" class="list_tab" cellpadding="0" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>类别</th><th>关键词</th><th>行业</th><th>地区</th>
                                        <th>添加时间</th><th>上次发送</th><th>频率</th><th>管理</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${passList}" var="list">
                                	<tr id="${list.id}">
                                        <td>
                                        <c:choose>
                                        	<c:when test='${list.type==1}'>供应</c:when>
                                        	<c:when test='${list.type==2}'>求购</c:when>
                                        	<c:otherwise>竞价</c:otherwise>
                                        </c:choose> 
                                        </td>
                                        <td>${list.key_words }</td><td>${list.first_name}-${list.second_name }</td><td>${list.prov_name}-${list.city_name}</td>
                                        <td>${fn:substring(list.create_date,0,16)}</td><td>${not empty list.last_send?fn:substring(list.last_send,0,10):'从未'}</td><td><span class="span_org">${list.freq_name}</span></td>
                                        <td>
                                           <!--  <a class="list_tab_tr_td_a" alt="">&nbsp;</a> -->
                                            <a class="list_tab_tr_td_a2 dele" alt="">&nbsp;</a>
                                        </td>
                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="tab_main2 font_1">
                	<span style="margin-left: 2%;">总共可添加</span><span class="span_org"> 3 </span><span>条,当前已添加<span id="remind_count">${remindCount}</span>条，还可以添加</span><span id="add_count" class="span_org">${3-remindCount}</span><span>条</span>
                </div>
                <div class="tab_main3 font_1">
                    <span >提示：如果无法正常收到邮件，请将</span><span class="span_org">wedfef@qq.com</span><span>加入您的邮件白名单中</span>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>


        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $("#table tbody").on("click",".dele",function(){
				var id = $(this).parent().parent().attr("id");
				var strtitle = "<tr><th>类别</th><th>关键词</th><th>行业</th><th>地区</th><th>添加时间</th><th>上次发送</th><th>频率</th><th>管理</th></tr>";
				var str = "";
				var typeName = "";
				var date = "";
				var remindCount = 0;
				 $.ajax({
					type:"post",
					url:"${ctx}/memSerevice/remind/deletePass",
					data:"id="+id,
					success:function(data){
						$.each(data,function(index,item){
							 if(item.type == 1){
								typeName = "供应";
							}else if(item.type == 2){
								typeName = "求购";
							}else{
								typeName = "竞价";
							}
							
							date = item.create_date.substring(0,16);
							var lastsend = item.last_send;
							if(lastsend!=null && lastsend != ""){
								lastsend = lastsend.substring(0,10);
							}else{
								lastsend = "从未";
							}
							var first = item.first_name;
							var second = item.second_name;
							var prov = item.prov_name;
							var city = item.city_name;
							remindCount = item.remindCount;
							str += "<tr id="+item.id+">" 
                            +"<td>"+typeName+"</td>"
                            +"<td>"+item.key_words+"</td><td>"+(first==null? "":first)+"-"+(second==null? "":second)+"</td><td>"+(prov==null? "":prov)+"-"+(city==null? "":city)+"</td>"
                            +" <td>"+date+"</td><td>"+lastsend+"</td><td><span class='span_org'>"+item.freq_name+"</span></td>"
                            +" <td>"
                            +"    <a class='list_tab_tr_td_a2 dele' alt=''>&nbsp;</a>"
                            +" </td>"
                            +"</tr>"
						});
						$("#table tbody").html(str);
						$("#remind_count").html(remindCount);
						$("#add_count").html(3-remindCount);
					}
				}) 
			})
        </script>
    </body>
</html>