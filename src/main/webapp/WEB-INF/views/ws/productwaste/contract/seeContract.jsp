<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
   response.setHeader("Cache-Control", "no-store"); //HTTP   1.1   
   response.setHeader("Pragma", "no-cache"); //HTTP   1.0   
   response.setDateHeader("Expires", 0); //prevents   caching   at   the   proxy   server   
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>产废方-查阅合同</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_p{color:#666;margin-left: 25px;margin-top:20px;}
.this_p{text-align: center;font-size: 20px;margin-top: 40px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务
    <a class="gobackto_wffw" href="javascript:goUrl('${ctx}/ws/productwaste/pwbaseinfo/serviceMainIndexPage')">返回危废服务页面</a>
    </div>
    <div class="tab_main">
        <div class="weifei_title">
        
            <ul>
                <li >
                    <div class="txt">基本列表</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">查阅合同</div>
                    <div class="triangle"></div>
                </li>
<!--                 <li> -->
<!--                     <div class="txt">管理计划表</div> -->
<!--                     <div class="triangle"></div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <div class="txt">邮寄资料</div> -->
<!--                     <div class="triangle"></div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <div class="txt">支付并备案</div> -->
<!--                     <div class="triangle"></div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <div class="txt">审批办理中</div> -->
<!--                     <div class="triangle"></div> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <div class="txt">通知收运</div> -->
<!--                     <div class="triangle"></div> -->
<!--                 </li> -->
            </ul>
        </div>
<!--         <p class="this_page_p">请检查合同内容，确认无误的，请点击“下一步”</p> -->
<!--         <div class="btns"> -->
<%--         <input type="hidden" id="pw_id" value="${id}"> --%>
        <input type="hidden" id="service_id" value="${serviceId}">
<!--             <a href="javascript:view()" class="btn">去检查</a> -->
<!--             <a href="javascript:next()" class="btn btn-connot">下一步</a> -->
<!--         </div> -->
        <p class="this_page_p">请下载附件并检查合同内容。确认无误后，请点击"确认并支付"。</p>
		<form id="pwInfoForm" method="post">
			<h2>危废服务   ${serviceMainInfo.id}:</h2>
            <input type="hidden" name="serviceMainInfo.id" id="mainID"
                   value="${serviceMainInfo.id}"/>
            <table class="shenheziliao">
                <tr>
                    <th style="width:110px;">企业名称</th>
                    <td colspan="4"><table style="word-break: break-all;"><tr>
	                    <td style="border:none;width:200px;">${serviceMainInfo.compName}</td>
	                    <th style="border-bottom:0;border-top:0;width:35px;">地址</th>
	                    <td style="width:310px;border:none;">${serviceMainInfo.compAddr}</td>
	                    </tr>
	                    </table>
	                </td>
                </tr>
                <tr>
                    <th>联系人</th>
                    <td colspan="4">
	                    <table>
		                    <tr>
			                    <td style="border:none;width:200px;">${serviceMainInfo.contactPerson}</td>
			                    <th style="border-bottom:0;border-top:0;width:35px;">电话</th>
			                    <td style="width:310px;border:0;">${serviceMainInfo.phone}</td>
		                    </tr>
	                    </table>
                    </td>
                </tr>
                <tr>
                    <th>邮箱</th>
                    <td colspan="4">${serviceMainInfo.email}</td>
                </tr>
                <tr><td colspan="4" style="height:5px;"></td></tr>
                <tr>
                    <th>废物名称</th>
                    <th>废物类别</th>
                    <td style="text-align:center;">年预计数量(吨)</td>
                    <td style="text-align:center;">报价(元)</td>
                </tr>
                <c:forEach items="${serviceDetailsInfos}" var="waste">
	               	<tr>
	                    <th align="center">${waste.remarks }</th>
	                    <th align="center">${waste.name }</th>
	                    <td align="center" >${waste.weight }</td>
	                    <td align="center">${waste.get("quote") }</td>
	                </tr>
                </c:forEach>
                <tr><td colspan="4" style="height:5px;"></td></tr>
                <tr>
                    <th colspan="2" align="center">年承包费用</th>
                    <th align="center">———</th>
                    <td align="center">${wscList.other_cost}</td>
                </tr>
                <tr>
                    <th colspan="2" align="center">合计</th>
                    <td align="center">${wscList.count_Weight}</td>
                    <td align="center">${wscList.count_Quote}</td>
                </tr>
                <tr>
                   <th align="center">备注</th>
                   <td colspan="3" style="word-break: break-all;">${wscList.user_remarks}</td>
               </tr>
            </table>
        </form>
        <c:if test="${fn:length(wdList) > 0}">
           <p class="this_p">请下载《合同》、《审批表》、《转移计划表》、《委托书》</p>
           <div class="doc_list" style="margin-top: 10px;padding-left: 112px;">
            	<c:forEach items="${wdList}" var="wd">
		        	<div class="file_info" style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;margin:10px;">
		               	<input class="file_url" type="hidden" />
		               	<a class="downloadFile" filename="${wd.document_name}" href="${wd.document_url}&filename=" target="_blank" style="color: red;cursor: pointer;">${wd.document_name}</a>
		            </div>
            	</c:forEach>
        	</div>
        </c:if>
        <div class="btns">
        	<c:choose>
        		<c:when test="${history!=1}">
			        <a href="javascript:finish();" class="btn">确认并支付</a>
        		</c:when>
        		<c:otherwise>
			        <a href="javascript:void(0)" class="btn btn-connot">流程结束</a>
        		</c:otherwise>
        	</c:choose>
        </div>
<%--         	</c:otherwise> --%>
<%--         </c:choose> --%>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>


<script>
     $(function(){
        //初始化
        $(".cff_jibenziliao_yitonguo").css({"margin-left":($(".this_page_div").width()-$(".cff_jibenziliao_yitonguo").width())/2+"px"});
        //下一步样式
        if(viewRight == "1"){
        	$(".btns a:eq(1)").removeClass("btn-connot");
        }
        
        var init = function initDowloadUrl(){
        	var filename;
        	var href;
        	$("a.downloadFile").each(function(index,el){
        		filename=$(el).attr("filename");
        		href=$(el).attr("href");
        		$(el).attr("href",href+encodeURI(encodeURI(filename)));
        	});
        }();
     });
     //查看
     function view(){
   		 $.ajax({
       		 type:"post",
       		 url:"${ctx}/ws/productwaste/contract/view",
       		 data:"id="+$("#pw_id").val()+"&serviceId="+$("#service_id").val(),
       		 async:false,
       		 success:function(data){
       			 if(data=="2"){
       				 //$(".btns a:eq(1)").removeClass("btn-connot");
       				 goUrl("${ctx}/memSerevice/message/mailbox?index=2&serviceId="+$("#service_id").val()+"&source=seeContract");
       			 }else{
       	    		 parent.showMess("请等待对方上传合同");
       	    	 }
       		 }
       	 })
     }
     //下一步
     var viewRight = '${viewContract}';
     function next(){
   		 $.ajax({
   			 type:"post",
   			 url:"${ctx}/ws/productwaste/contract/next",
   			 data:"serviceId="+$("#service_id").val(),
   			 async:false,
   			 success:function(data){
   				if(data=="1"){
    				goUrl("${ctx}/ws/productwaste/manaplan?id="+$("#service_id").val());
   				}else if(data=="error"){
   					parent.showMess("请勿重复操作");
   				}else{
   	    		 	parent.showMess("请先查看合同");
   	    	 	}
   			 }
       	})  
     }
     
     function finish(){
    	 $(".btns a").attr("disabled",true);
		 $(".btns a").css("cursor","not-allowed");
    	 url = "${ctx}/ws/productwaste/payAndPost/finish?id="+$("#service_id").val();
    	 $.ajax({
   			 type:"post",
   			 url:url,
   			 dataType:"text",
   			 success:function(data){
   				if(data=="ok"){
   					$(".btns a").text("已支付");
					$(".btns a").css("background-color","#ee7800");
   				}else{
   					$(".btns a").removeAttr("disabled");
					$(".btns a").css("cursor","pointer");
   				}
   			 }
       	})  
     }
</script>
</body>
</html>