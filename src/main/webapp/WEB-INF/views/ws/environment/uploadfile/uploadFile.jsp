<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>环保公司-危废服务-上传合同及资料</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页样式*/
.this_p{text-align: center;font-size: 20px;margin-top: 40px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务</div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li >
                    <div class="txt">审核资料并报价</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">上传合同及资料</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        
        <!-- 危废基本信息表 -->
        <div>
	        <div class="fuwubianhao">
	            <span>服务编号:${serviceMainInfo.id}</span>
	        </div>

            <form id="pwInfoForm" method="post" style="margin: 30px;">
				<!-- <h2>危废服务   ${serviceMainInfo.id}:</h2> -->
	            <input type="hidden" name="serviceMainInfo.id" id="mainID"
	                   value="${serviceMainInfo.id}"/>
<!-- 	            <table class="shenheziliao"> -->
<!-- 	                <tr> -->
<!-- 	                    <th width="110px;">企业名称</th> -->
<%-- 	                    <td>${serviceMainInfo.compName}</td> --%>
<!-- 	                    <th width="110px;">地址</th> -->
<%-- 	                    <td colspan="2">${serviceMainInfo.compAddr}</td> --%>
<!-- 	                </tr> -->
<!-- 	                <tr> -->
<!-- 	                    <th>联系人</th> -->
<%-- 	                    <td>${serviceMainInfo.contactPerson}</td> --%>
<!-- 	                    <th>电话</th> -->
<%-- 	                    <td colspan="2">${serviceMainInfo.phone}</td> --%>
<!-- 	                </tr> -->
<!-- 	                <tr> -->
<!-- 	                    <th>邮箱</th> -->
<%-- 	                    <td colspan="4">${serviceMainInfo.email}</td> --%>
<!-- 	                </tr> -->
<!-- 	                <tr> -->
<!-- 	                    <th colspan="2" align="center">废物名称</th> -->
<!-- 	                    <td align="center">年预计数量(吨)</td> -->
<!-- 	                    <td colspan="2" align="center">报价(元)</td> -->
<!-- 	                </tr> -->
<%-- 	                <c:forEach items="${serviceDetailsInfos}" var="waste"> --%>
<!-- 		               	<tr> -->
<%-- 		                    <th colspan="2" align="center">${waste.name }</th> --%>
<%-- 		                    <td align="center">${waste.weight }</td> --%>
<%-- 		                    <td colspan="2" align="center">${waste.quote }</td> --%>
<!-- 		                </tr> -->
<%-- 	                </c:forEach> --%>
<!-- 	                <tr> -->
<!-- 	                    <th colspan="2" align="center">其他费用</th> -->
<!-- 	                    <td align="center">———</td> -->
<%-- 	                    <td colspan="2" align="center">${wscList.other_cost}</td> --%>
<!-- 	                </tr> -->
<!-- 	                <tr> -->
<!-- 	                    <th colspan="2" align="center">合计</th> -->
<%-- 	                    <td align="center">${wscList.count_Weight}</td> --%>
<%-- 	                    <td colspan="2" align="center">${wscList.count_Quote}</td> --%>
<!-- 	                </tr> -->
<!-- 	            </table> -->
				<table class="shenheziliao">
	                <tr>
	                    <th style="width:110px;">企业名称</th>
	                    <td colspan="4"><table style="word-break: break-all;"><tr>
		                    <td style="border:none;width:200px;">${serviceMainInfo.compName}</td>
		                    <th style="border-bottom:0;border-top:0;width:35px;">地址</th>
		                    <td style="border:none;">${serviceMainInfo.compAddr}</td>
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
				                    <td style="width:200px;border:0;">${serviceMainInfo.phone}</td>
			                    </tr>
		                    </table>
	                    </td>
	                </tr>
	                <tr>
	                    <th>邮箱</th>
	                    <td colspan="3">${serviceMainInfo.email}</td>
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
		                    <th colspan="1" align="center">${waste.remarks }</th>
		                    <th colspan="1" align="center">${waste.name }</th>
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
	            <!-- 
	            <c:if test="${fn:length(wdList) > 0}">
	            	<a href="${wdList[0].document_url}" target="_blank"><h2>点击下载附件：${wdList[0].document_name}</h2></a>
	            </c:if> -->
	        </form>

        </div>
        
        <c:choose>
			<c:when test="${fn:length(wdList) > 0}">
			
				<p class="this_p">已上传《合同》、《审批表》、《转移计划表》、《委托书》</p>
		        <input id="ep_id" type="hidden" value="${id}">
		        <input id="service_id" type="hidden" value="${serviceId}">
		        
				<c:forEach items="${wdList}" var="w">
					<div class="doc_list" style="margin-top: 10px;padding-left: 112px;">
						<div style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;">
			               	<span>${w.document_name}</span>&nbsp;&nbsp;
			               	<a class="downloadFile" filename="${w.document_name}" href="${w.document_url}&filename=" target="_blank" style="color: green;cursor: pointer;">下载</a>
			            </div>
			        </div>
				</c:forEach>
				
				<p class="this_p">${history==1?"流程结束":"等待对方确认支付" }</p>
            </c:when>
                     
            <c:otherwise>
	            <p class="this_p">请上传《合同》、《审批表》、《转移计划表》、《委托书》</p>
		        <input id="ep_id" type="hidden" value="${id}">
		        <input id="service_id" type="hidden" value="${serviceId}">
		        
		        <div class="font_1" style="margin-top: 10px;padding-left: 112px;">
		            <a class="add_document" style="background-color: #5EC520;color: white;margin-top: 10px;width: 84px;display: block;height: 22px;text-align: center;line-height: 22px;" href="javascript:void(0);">点击上传附件</a>
			        <input type="file" name= "attachment_file"  onchange="clickattr()" id="attachment_file"  multiple  style="display: none;"/>
		        </div>
		        <div class="doc_list" style="margin-top: 10px;padding-left: 112px;">
		        	<!-- 
		        	<div class="file_info" style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;">
		               	<input class="file_url" type="hidden" />
		               	<span class="file_name">dsfsd</span>&nbsp;&nbsp;
		               	<a class="delete_document" style="color: red;cursor: pointer;">删除</a>
		            </div>
		             -->
		        </div>
		        <div style="text-align: center;margin-top: 20px;">
		        	<button class="submitDoc" style="width: 120px;height: 30px;color: #FFF;background-color: #5ec520;cursor: pointer;">提交附件</button>
		        </div>
            </c:otherwise>
            
        </c:choose>
        
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>

<script>
	$(document).ready(function(){
		var uploadSta = "${uploadContract}";
		if(uploadSta == "2"){
			$(".btns a:eq(1)").removeClass("btn-connot");
			$(".btns a:eq(1)").click(function(){uploaded();});
		}
		
		//================新加的start======================
		//点击上传附件
		$(".add_document").click(function(){
		    $("#attachment_file").trigger("click");
		});
		
		$(".doc_list").on("click",".delete_document",function(){
			$(this).parent().remove();
		});
		
		$(".submitDoc").click(function(){
			var fi = $(".file_info");
			var str = "[";//拼接json
			var len = fi.length;
			if(len < 1){
				alert("请先上传附件");
				return;
			}
			for(var i=0;i<len;i++){
				var url = fi.eq(i).find(".file_url").val();
				var name = fi.eq(i).find(".file_name").text();
				str = str+"{'url':'"+url+"',"+"'name':'"+name+"'},";
			}
			str = str.substring(0,str.length-1);
			str += "]";
			var serviceId = ${serviceMainInfo.id};
			
			$.ajax({
				type:"post",
				url:"${ctx}/ws/environment/uploadfile/saveUploadFiles",
				data:{
					serviceId:serviceId,
					docInfo:str
				},
				async:false,
				dataType:'text',
				success:function(data){
					if(data == "ok"){
						$(".submitDoc").attr("disabled",true);
						$(".submitDoc").css("background-color","#ee7800");
						$(".submitDoc").css("cursor","not-allowed");
						$(".submitDoc").text("提交成功");
	                };
	            }
			})
			
		});
		//================新加的end======================
			
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
	
	//上传方法
	function upattr($a){
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
	                 }else{
	                     $a.find(".file_url").val(attc);
	                     //$(".font_1").hide();
	                 }
				}
			}
			
		});
	}
	//上传附件，加载附件名
	var upcount = 0;//上传次数，限制为4次
	function clickattr(){
		upcount++;
		if(upcount > 4){
			alert("最多上传4个文件！");
			return;
		}
	    var fileName = $("#attachment_file").val().substr($("#attachment_file").val().lastIndexOf("\\")+1);
	    var files = document.getElementById("attachment_file").files[0].size;//判断文件大小
	    if(files>1024*1024*10){
	        parent.showMess("上传附件的大小不能超过10M");
	        return;
	    }else{
	    	var $fn = $('<div class="file_info" style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;margin-top: 10px;">'+
		                '<input class="file_url" type="hidden" />'+
	                   	'<span class="file_name">'+fileName+'</span>&nbsp;&nbsp;'+
	                   	'<a class="delete_document" style="color: red;cursor: pointer;">删除</a>'+
		              '</div>');
	        $(".doc_list").append($fn);
	    }
	    upattr($fn);
	}
	
	
	
	/**上传**/
	function upload(){
		$.ajax({
			type:"post",
			url:"${ctx}/ws/environment/uploadfile/upload",
			data:"id="+$("#ep_id").val()+"&serviceId="+$("#service_id").val(),
			async:false,
			success:function(data){
				if(data!=false){
					goUrl("${ctx}/memSerevice/message?uid=${pw_user}&serviceId="+$("#service_id").val()+"&source=contract")//跳转到站内信 站内信自动添加用户名
                };;
            }
		})
	}
	/**已上传**/
	/* function uploaded(){
		if("${curStep}"=="${EP_STEP}"){
			goUrl("${ctx}/ws/environment/confirmplan?id="+$("#service_id").val());
		}else{
			parent.showMess("请等待对方上传管理计划表");
		}
	} */
	 function uploaded(){
		$.ajax({
			type:"post",
			url:"${ctx}/ws/environment/uploadfile/uploaded",
			data:"serviceId="+$("#service_id").val(),
			async:false,
			success:function(data){
				if(data=="${EP_STEP}"){
					goUrl("${ctx}/ws/environment/confirmplan?id="+$("#service_id").val());
				}else{
					parent.showMess("请等待对方上传管理计划表");
				}
			}
		})
	} 
	//返回指定页面
	function stepBack(){
		var val=$("#back").val();
		if(val != '0'){
			parent.showMessYes("确定退回？");
			$(".yes-btn", window.parent.document).unbind().one("click",yesToSub);
		}
	}
	function yesToSub(){
		parent.hideMessYes();
		var val=$("#back").val();
		switch (parseInt(val)){
		case 1:
			backBaseInfo();//返回基本资料
			break;
		case 2:
			backContract();//返回查阅合同
			break;
		default:
			break;
		}
	}
	
	function backBaseInfo(){
		$.ajax({
			type:"POST",
			url:"${ctx}/backBaseInfo",
			data:"serId="+$("#service_id").val(),
			dataType:'text',
			success:function(data){
				if(data == 'ok'){
					parent.showMess("操作成功！");
					setTimeout(function(){
						location.href='${ctx}/ws/environment/servicelist';
					},3000);
				}else{
					parent.showMess(data);
				}
			}
		});
	}

</script>
</body>
</html>