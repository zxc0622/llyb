<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>环保公司-危废服务-审核资料并报价</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
    <link type="text/css" rel="stylesheet"
          href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
    <style>
        /*本页样式*/
        .row1 {
            margin-top: 30px;
        }

        .row1 .show-info {
            width: 569px;
            margin: 0 auto;
        }

        .row2 .show-info:first-of-type {
            margin-left: 30px;
            min-width: 156px;
        }

        .row2 .show-info:nth-of-type(2) {
            margin-left: 20px;
            cursor: pointer;
        }

        .round_point {
            height: 18px;
            width: 18px;
            float: left;
            background: url(${ctxStatic}/img/llhb/step_circle_03.png) 0 0 no-repeat;
            margin: 6px 20px;
        }

        .round_p_sel {
            background: url(${ctxStatic}/img/llhb/step_circle_act_03.png) 0 0 no-repeat;
        }

        .round_p_sel2 {
            background: url(${ctxStatic}/img/llhb/step_circle_03.png) 0 0 no-repeat;
        }
        input[type=number] {  
		    -moz-appearance:textfield;  
		}  
		input[type=number]::-webkit-inner-spin-button,  
		input[type=number]::-webkit-outer-spin-button {  
		    -webkit-appearance: none;  
		    margin: 0;  
		}
    </style>

</head>
<body>
<input type="hidden" value="${serviceMainInfo.createBy}" id="userID"/>

<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务<a class="gobackto_wffw"
                                               href="${ctx}/ws/environment/servicelist"
                                               target="_self">返回危废服务页面</a></div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li class="wf_t_sel">
                    <div class="txt">审核资料并报价</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">上传合同及资料</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <div class="center_change_tab">
            <div style="height: 31px;position: relative;width: 240px;margin: 0 auto;">
                <span style="width:200px;height: 28px;z-index: 2;border-bottom: 4px solid rgb(99, 182, 47);text-align: center;">查看危废详情并发送报价</span>
            </div>
            <div class="c_c_tab_main">
                <!-- tabdiv1 -->
                <div <c:if test="${serviceMainInfo.nodeSta eq 2}">style="display: none;"</c:if>>
                    <div class="fuwubianhao">
                        <span>服务编号:</span><span>${serviceMainInfo.id}</span>
                        <!-- <select onchange="auditAndoffer.selectServiceByID(this);">
	                        <c:forEach items="${auditingIds}" var="auditingId" varStatus="idxStatus">
	                            <option value="${auditingId}"
	                            	<c:if test="${auditingId eq serviceMainInfo.id}">selected</c:if>>${auditingId}
	                            </option>
	                        </c:forEach>
                    	</select> -->
                    </div>
                    <div class="beizhu">
                    </div>
                    <input type="hidden" id="serviceID" value="${serviceMainInfo.id}">
                    <input type="hidden" id="auditStatus"
                           value="${serviceMainInfo.nodeSta}">
                </div>
                
                <div>
                    <div class="row row2">
						<c:choose>
							<c:when test="${upFlag == 1 and serviceMainInfo.offerAgree != 0}">
								<div style="margin-left: 20px;margin-top: 20px;padding-bottom: 20px;">
									<p>已填写报价信息：</p>
									<div style="margin-left: 15px;margin-top: 10px;">
				                        <div id="pwInfoForm" style="margin-left: 0px; margin-top: 0px;">
								            <input type="hidden" name="serviceMainInfo.id" id="mainID"
								                   value="${serviceMainInfo.id}"/>
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
									                    <th align="center">${waste.remarks }</th>
									                    <th align="center">${waste.name }</th>
									                    <td align="center" >${waste.weight }</td>
									                    <td align="center">${waste.get("quote") }</td>
									                </tr>
								                </c:forEach>
								                <tr><td colspan="4" style="height:5px;"></td></tr>
								                <tr>
								                    <th colspan="2" align="center">年承包费用</th>
								                    <td align="center">———</td>
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
								            <c:if test="${fn:length(wdList) > 0}">
								            	<h2>点击下载附件：</h2>
									            <div class="doc_list" style="margin-top: 10px;padding-left: 112px;">
													<div style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;">
										               	<span>${wdList[0].document_name}</span>&nbsp;&nbsp;
										               	<a class="downloadFile" filename="${wdList[0].document_name}" href="${wdList[0].document_url}&filename=" target="_blank" style="color: green;cursor: pointer;">下载</a>
										            </div>
										        </div>
								            </c:if>
								        </div>
									</div>
								</div>
	                        </c:when>
	                        
	                        <c:otherwise>
								<div style="margin-left: 20px;padding-bottom: 20px;">
									<p>请填写报价信息：</p>
									<div style="margin-left: 15px;margin-top: 10px;">
				                        <div id="pwInfoForm" style="margin-left: 0px; margin-top: 0px;">
								            <input type="hidden" name="serviceMainInfo.id" id="mainID"
								                   value="${serviceMainInfo.id}"/>
								            <table class="shenheziliao">
								                <tr>
								                    <th style="width:110px;">企业名称</th>
								                	<td colspan="4"><table style="word-break: break-all;"><tr>
									                    <td style="border:none;width:200px;">${serviceMainInfo.compName}</td>
									                    <th style="border-bottom:0;border-top:0;width:35px;">地址</th>
									                    <td style="width:250px;border:none;">${serviceMainInfo.compAddr}</td>
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
									                    <th align="center">${waste.remarks }</th>
									                    <th align="center">${waste.name }</th>
									                    <td align="center" class="wasteWeight">${waste.weight }</td>
									                    <td align="center"><input style="border: 0;text-align: center;" class="wasteQuote" iddata="${waste.id}" type="number" step="0.01" value="${waste.quote }" /></td>
									                </tr>
								                </c:forEach>
								                <tr><td colspan="4" style="height:5px;"></td></tr>
								                <tr>
								                    <th colspan="2" align="center">年承包费用</th>
								                    <td align="center">———</td>
								                    <td align="center"><input style="border: 0;text-align: center;" class="otherQuote" iddata="${waste.id}" type="number" step="0.01" value="${wscList.other_cost}" /></td>
								                </tr>
								                <tr>
								                    <th colspan="2" align="center">合计</th>
								                    <td align="center" id="countWeight"></td>
								                    <td align="center" id="countQuote">${wscList.count_Quote}</td>
								                </tr>
								                <tr>
								                    <th align="center">备注</th>
								                    <td colspan="3"><input style="border: 0;" type="text" class="user_remarks" iddata="${waste.id}" value="${wscList.user_remarks}" /></td>
								                </tr>
								            </table>
								        </div>
					                    
					                    <div class="add_attachment_btn font_1">
					                    	<c:choose>
				                            	<c:when test="${fn:length(wdList) > 0}">
				                            		<a class="add_document" style="background-color: #5EC520;color: white;margin-top: 10px;width: 84px;display: block;height: 22px;text-align: center;line-height: 22px;display:none;" href="javascript:void(0);">添加附件</a>
				                                    <div class="file_info" style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;margin-top: 10px;">
									            		<input class="file_url" type="hidden" value="${wdList[0].document_url}" />
									                	<span class="file_name">${wdList[0].document_name}</span>&nbsp;&nbsp;
									                	<a class="delete_document" style="color: red;cursor: pointer;">删除</a>
									                </div>
				                            	</c:when>
				                            	<c:otherwise>
				                                    <a class="add_document" style="background-color: #5EC520;color: white;margin-top: 10px;width: 84px;display: block;height: 22px;text-align: center;line-height: 22px;;" href="javascript:void(0);">添加附件</a>
				                            	</c:otherwise>
				                            </c:choose>
		                                </div>
		                                <input type="file" name= "attachment_file"  onchange="clickattr()" id="attachment_file"  multiple  style="display: none;"/>
									</div>
									
									<div style="text-align: center;margin: 15px 0;">
				                        <c:choose>
				                            <c:when test="${upFlag == 0 or serviceMainInfo.offerAgree != 1}">
				                                <button class="send_offer" style="width: 120px;height: 30px;color: #FFF;background-color: #5ec520;cursor: pointer;">发送报价</button>
				                                 <a href="javascript:void(0)" class="btn btn-connot incompletion" onclick="auditAndoffer.unApproveConfirm();">资料未完善</a>
				                            </c:when>
				                            <c:otherwise>
				                                <button class="offer_sended" style="width: 120px;height: 30px;background-color: #e5e5e5;color: #333;cursor: pointer;">已发送报价</button>
				                            </c:otherwise>
				                        </c:choose>
		                    		</div>
									
		                        </div>
                            </c:otherwise>
                        </c:choose>
						
						<c:choose>
							<c:when test="${upFlag == 0}">
							
							</c:when>
							<c:otherwise>
		                        <c:choose>
		                            <c:when test="${serviceMainInfo.offerAgree == 1}">
		                                <div class="round_point round_p_sel"></div>
		                                <a href="javascript:void(0)" class="fl btn">对方已同意报价</a>
		                            </c:when>
		                            <c:when test="${serviceMainInfo.offerAgree == 0}">
		                                <div class="round_point round_p_sel2"></div>
		                                <a href="javascript:void(0)" class="fl btn btn-connot"
		                                   style="background-color: #ff4351; width: 254px;">对方不同意报价,请修改报价重新发送</a>
		                            </c:when>
		                            <c:otherwise>
		                                <div class="round_point .round_p_sel2"></div>
		                                <a href="javascript:void(0)" class="fl btn btn-connot">对方还未查看报价</a>
		                            </c:otherwise>
		                        </c:choose>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
                <!-- tabdiv2 end-->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script>
	
	//上传方法
	function upattr(){
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
	                     $(".file_info .file_url").val(attc);;
	                     
	                 }
				}
			}
			
		});
	}
	//上传附件，加载附件名
	function clickattr(){
	    var fileName = $("#attachment_file").val().substr($("#attachment_file").val().lastIndexOf("\\")+1);
	    var files = document.getElementById("attachment_file").files[0].size;//判断文件大小
	    if(files>1024*1024*10){
	        parent.showMess("上传附件的大小不能超过10M");
	        return;
	    }else{
	    	var fn = '<div class="file_info" style="border: 1px solid #5ec520;border-color: #5ec5207d;width: 480px;margin-top: 10px;">'+
	            		'<input class="file_url" type="hidden" value="" />'+
	                	'<span class="file_name">'+fileName+'</span>&nbsp;&nbsp;'+
	                	'<a class="delete_document" style="color: red;cursor: pointer;">删除</a>'+
	                '</div>';
	        $(".add_document").hide();
	        $(".add_attachment_btn").append(fn);
	    }
	    upattr();
	}
	
    $(function () {
    	var init = function initDowloadUrl(){
        	var filename;
        	var href;
        	$("a.downloadFile").each(function(index,el){
        		filename=$(el).attr("filename");
        		href=$(el).attr("href");
        		$(el).attr("href",href+encodeURI(encodeURI(filename)));
        	});
        }();
    	
        //tab切换
        //window.parent.document.getElementById('rightIframe').height = 0 + 'px';
        $(".center_change_tab .chang_btns span").click(function () {
            auditAndoffer.tab.selectTab(this);
        });
        
        //=========================新加的start========================
        //添加附件
		$(".add_attachment_btn > a:eq(0)").click(function(){
		    $("#attachment_file").trigger("click");
		});
        //删除附件
		$(".c_c_tab_main").on("click",".delete_document",function(){
			$(this).parent().remove();
			$(".add_document").show();
		});
        //发送报价
        $(".send_offer").click(function(){
        	var serviceId = ${serviceMainInfo.id};
        	var url = $(".file_info .file_url").val();
        	var name = $(".file_info .file_name").text();
        	var otherQuote = $(".otherQuote").val();
        	var userRemarks = $(".user_remarks").val();//处置方备注
        	
        	var qinput = $(".wasteQuote");
        	var len = qinput.length;
        	var quoteInfo = "[";
        	for(var i=0;i<len;i++){
        		var id = qinput.eq(i).attr("iddata");
        		var quote = qinput.eq(i).val();
        		if(quote == undefined || quote == ""){
        			alert("请填写报价");
        			return;
        		}
        		quoteInfo = quoteInfo+"{'id':'"+id+"',"+"'quote':'"+quote+"'},";
        	}
        	quoteInfo = quoteInfo.substring(0,quoteInfo.length-1);
        	quoteInfo += "]";
        	
        	$(".send_offer").attr("disabled",true);
			$(".send_offer").css("cursor","not-allowed");
			$(".incompletion").hide();
			
        	$.ajax({
    			url : '${ctx}/ws/environment/audit/sendOffer',
    			type: 'post',
             	data: {
             		serviceId:serviceId,
             		url:url,
             		name:name,
             		quoteInfo:quoteInfo,
             		otherQuote:otherQuote,
             		userRemarks:userRemarks
             	},
    			dataType : 'text',
    			success : function(data) {
   					if(data == "ok"){
   						$(".send_offer").text("发送成功");
   						$(".send_offer").css("background-color","#ee7800");
   						$("#auditBtns").hide();
   						
   					}else{
   						$(".send_offer").removeAttr("disabled");
   						$(".send_offer").css("cursor","pointer");
   						$(".incompletion").show();
   						alert("发送失败，请稍后再试！");
   					}
    			}
    			
    		});
        });
        
        //输入报价就计算总价
        $(".wasteQuote,.otherQuote").change(function(){
        	var input = $(".wasteQuote");
        	var len = input.length;
        	var count = 0;//总价格
        	for(var i=0;i<len;i++){
        		var num = input.eq(i).val();
        		count += Number(num);
        	}
        	var other = $(".otherQuote").val();
        	count += Number(other);
        	count = Math.round(count*100)/100;//四舍五入保留两位小数
        	$("#countQuote").text(count);
        	
        });
        
        //计算总重量
        var wInput = $(".wasteWeight");
        var countWeight = 0;
        for(var i=0;i<wInput.length;i++){
        	countWeight += Number(wInput.eq(i).text());
        }
        countWeight = Math.round(countWeight*100)/100;//四舍五入保留两位小数
        $("#countWeight").text(countWeight);
      //=========================新加的start========================
        
        
    });

    var auditAndoffer = {};

    //tab标签相关类
    auditAndoffer.tab = {};

    //按钮相关类
    auditAndoffer.btn = {};

    //清除“审核通过”和“资料未完善”按钮
    auditAndoffer.btn.clearBtn = function () {
        $("#auditBtns").empty();
    };

    //将审核已通过按钮添加到btns中
    auditAndoffer.btn.addPassedBtn = function () {
        var passedBtn = '<a href="javascript:void(0)" class="btn btn-connot">审核已通过</a>';
        $("#auditBtns").append($(passedBtn));
    };

    //标签选择
    auditAndoffer.tab.selectTab = function (obj) {
        var index = $(obj).index();
        if (index == 1) {
            if ($("#auditStatus").val() !== '2') {
                auditAndoffer.openTip("该危废服务还未审核通过，不能进行报价操作！");
                return;
            }
        }
        $(obj).addClass('tab_sel').siblings('span').removeClass('tab_sel');
        $(obj).parents(".center_change_tab").find(".c_c_tab_main>div").eq(
                index).show().siblings().hide();
    };

    //通过服务id选择危废服务
    auditAndoffer.selectServiceByID = function (obj) {
        var id = $(obj).val();
        window.open("${ctx}/ws/environment/audit?id=" + id, "_self");
    };

    //上传报价方案
    auditAndoffer.uploadOffer = function () {
        /* var url = "
        ${ctx}/ws/environment/audit/uploadOffer";
         auditAndoffer.doAjax(url, auditAndoffer.offerCallback); */
        auditAndoffer.openMemSerevice();
    };

    //上传报价方案回调函数
    auditAndoffer.offerCallback = function (data) {
        var msg = "";
        if (data.isSuccess) {
            auditAndoffer.openMemSerevice();
        } else {
            msg = "操作失败！";
            auditAndoffer.openTip(msg);
        }
    };

    //打开发件箱
    auditAndoffer.openMemSerevice = function () {
        var userID = $("#userID").val();
        window.open("${ctx}/ws/environment/audit/spikToOfferPage?id="
                + $("#serviceID").val() + "&userID=" + userID, "_self");
        /* window.open("
        ${ctx}/memSerevice/message", "_self"); */
    };

    //确认窗口
    auditAndoffer.confirmWin = function (msg, callback) {
        window.parent.showMessYes(msg);
        $(".yes-btn", window.parent.document).unbind().one("click",
                callback);
    };

    //关闭确认窗口
    auditAndoffer.closeConfirmWin = function () {
        window.parent.hideMessYes();
    };

    //提示窗口
    auditAndoffer.openTip = function (msg) {
        $(".pl_normal", parent.document).show().find("p").html(msg);
    };

    //审核通过确认框
    auditAndoffer.approveConfirm = function () {
        auditAndoffer.confirmWin("是否确认审核通过该危废服务!", auditAndoffer.approve);
    };

    //审核通过
    auditAndoffer.approve = function () {
        var url = "${ctx}/ws/environment/audit/approve";
        auditAndoffer.doAjax(url, auditAndoffer.callbackFunc);
        return false;
    };

    //资料未完善确认框
    auditAndoffer.unApproveConfirm = function () {
        auditAndoffer.confirmWin("是否确认将该危废服务设置为资料未完善!",
                auditAndoffer.unApprove);
    };

    //资料未完善
    auditAndoffer.unApprove = function () {
    	$(".send_offer").hide();
		$(".incompletion").hide();
		$(".add_document").hide();
        var url = "${ctx}/ws/environment/audit/unApprove";
        auditAndoffer.doAjax(url, auditAndoffer.callbackFunc2);
        return false;
    };

    //执行ajax
    auditAndoffer.doAjax = function (url, callback) {
        var data = {};
        data.id = $("#serviceID").val();
        $.post(url, data, callback);
    };

    //ajax回调函数(审核通过)
    auditAndoffer.callbackFunc = function (data) {
        var msg = "";
        if (data.isSuccess) {
            $("#auditStatus").val("2");
            auditAndoffer.btn.clearBtn();
            auditAndoffer.btn.addPassedBtn();
            auditAndoffer.tab.selectTab($(
                    ".center_change_tab .chang_btns span").eq(1));
            //msg = "操作成功,现在您可以上传报价了~";
        } else {
            msg = "操作失败！";
            auditAndoffer.openTip(msg);
        }
        auditAndoffer.closeConfirmWin();
    };

    //ajax回调函数(资料未完善)
    auditAndoffer.callbackFunc2 = function (data) {
        var msg = "";
        if (data.isSuccess) {
            msg = "操作成功！";
            $("#auditStatus").val("0")
        } else {
            msg = "操作失败！";
        }
        auditAndoffer.closeConfirmWin();
        auditAndoffer.openTip(msg);
    };

    //同意报价
    auditAndoffer.agreeOffer = function () {
        var url = "${ctx}/ws/environment/audit/agreeOffer";
        auditAndoffer.doAjax(url, auditAndoffer.callbackFunc3);
    };

    //ajax回调函数(同意报价)
    auditAndoffer.callbackFunc3 = function (data) {
        var msg = "";
        if (data.isSuccess) {
            var id = $("#serviceID").val();
            var url = "${ctx}/ws/environment/uploadfile?id=" + id;
            window.open(url, "_self");
        } else {
            msg = "操作失败！";
            auditAndoffer.openTip(msg);
        }
    };

    //清空元素
    auditAndoffer.clearObj = function () {
        $("#serviceID").val("");
    };
</script>
</body>
</html>
