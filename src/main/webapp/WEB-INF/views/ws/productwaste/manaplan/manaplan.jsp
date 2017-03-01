<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
<title>产废方-管理计划表</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xixinguanli_WeiFeiFuWu.css">
<style>
/*本页面style*/
.this_page_p{color:#666;margin-left: 25px;margin-top:20px;}
.btn{width:95px;}
.row>span{margin-left: 175px;margin-top: 5px;margin-right: 10px;}
input{width:193px;}
.row1{margin-top: 30px;text-align: center;}
.row2{margin-top: 30px;text-align: center;}
.row{position: relative;}
.check_right{right:80px;top:50%;}
#msg1{color:red;text-align: center;width: 95px;}
#msg2{color:red;width: 192pxx;}
.row .row-tips{color:red;margin-left:262px;}

</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>信息管理>危废服务
    <a class="gobackto_wffw" href="${ctx }/ws/productwaste/pwbaseinfo/serviceMainIndexPage">返回危废服务页面</a>
    </div>
    <div class="tab_main">
        <div class="weifei_title">
            <ul>
                <li >
                    <div class="txt">基本列表</div>
                    <div class="triangle"></div>
                </li>
                <li >
                    <div class="txt">查阅合同</div>
                    <div class="triangle"></div>
                </li>
                <li class="wf_t_sel">
                    <div class="txt">管理计划表</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt">邮寄资料</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt" >支付并备案</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt" >审批办理中</div>
                    <div class="triangle"></div>
                </li>
                <li>
                    <div class="txt" >通知收运</div>
                    <div class="triangle"></div>
                </li>
            </ul>
        </div>
        <p class="this_page_p">请下载《管理计划表》并按要求完成填写后上传（具体要求请看下载的附件《填写说明》）</p>
        <div class="row"style="margin-top: 40px;">
            <div class="dif_div">
                <span>提交帐号密码</span>
                <div class="dif_div_main">
                    <p class="row1">请填写[广东省固体废物管理信息平台]账号及密码，若没有请去网站注册。</p>
                    <p class="row1"style="margin-top: 5px;">网站地址  <a href="http://61.144.36.2:8080/userlogin.aspx" target="_blank">http://61.144.36.2:8080/userlogin.aspx</a></p>
                    <p class="row1"style="margin-top: 5px;color:red;">注意：填写注册信息时在“单位注册类型*”中请选择“危险废物产生源企业”。</p>
                    <div class="row row1">
                        <span class="fl">帐号 </span>
                        <input id="loginName" class="fl" type="text" value="${s.mln }">
                    </div>
                    <div class="row row2">
                        <span class="fl">密码 </span>
                        <input id="password" class="fl" type="password" value="${s.mp }">
                    </div>
                    <div class="btns" id="atta">
                    	<c:choose>
                    		<c:when test="${s.eaccount eq '1'}">
                    			<a href="javascript:void(0);"class="btn btn-connot"  data-index="0">提交</a>
                    			</div>  
			                    <div class="row row2">
			                        <span id="msg1" data-index="1" class="fl row-tips">对方已验证！</span>
			                    </div>
                    		</c:when>
                    		<c:when test="${s.eaccount eq '-1' }">
                    			<a href="javascript:checkNameAndPass();"class="btn" data-index="1">提交</a>
                    			</div>  
			                    <div class="row row2">
			                        <span id="msg1" data-index="0" class="fl row-tips" >对方验证未通过！</span>
			                    </div>
                    		</c:when>
                            <c:when test="${s.paccount eq '1' }">
                                <a href="javascript:checkNameAndPass();"class="btn" data-index="1">提交</a>
                            </div>
                            <div class="row row2">
                                <span id="msg1" data-index="0" class="fl row-tips" >已提交</span>
                            </div>
                            </c:when>
                    		<c:otherwise>
                    			<a href="javascript:checkNameAndPass();"class="btn" data-index="1">提交</a>
                    			</div>  
			                    <div class="row row2">
			                    	<c:if test="${s.paccount eq '1' }"><span id="msg1" data-index="1" class="fl row-tips" ></span></c:if>
			                    	<c:if test="${s.paccount eq '0' }"><span id="msg1" data-index="0" class="fl row-tips" ></span></c:if>
			                        
			                    </div>
                    		</c:otherwise>
                    	</c:choose>
                </div>
            </div>
            <c:choose>
           		<c:when test="${s.paccount eq '1' || s.eaccount == '1'}">
           			<div class="check_right check_right_sel"></div>
           		</c:when>
           		<c:otherwise>
           			<div class="check_right"></div>
           		</c:otherwise>
           	</c:choose>
        </div>
        <div class="row">
            <div class="dif_div">
                <span>提交管理计划表</span>
                <div class="dif_div_main">
                    <div class="btns">
                        <a href="javascript:download();"class="btn"style="width:192px;">下载附件并填写</a>
                    </div>
                    <div class="btns" >
                    	<c:choose>
			           		<c:when test="${s.eatta eq '1'}">
			           			<a href="javascript:void(0);" class="btn btn-connot" style="width:192px;" data-index="0">上传已填写的附件</a>
			           			</div>
			           			<div class="row row2">
			                        <span id="msg2" data-index="1" class="fl row-tips" >对方已验证！</span>
			                    </div>
			           		</c:when>
			           		<c:when test="${s.eatta eq '-1' }">
			           			<a href="javascript:upload();" class="btn" style="width:192px;" data-index="1">上传已填写的附件</a>
			           			</div>
			           			<div class="row row2">
			                        <span id="msg2" data-index="0" class="fl row-tips" >您的资料不完善，请重新填写！</span>
			                    </div>
			           		</c:when>
                            <c:when test="${s.patta eq '1' }">
                                <a href="javascript:upload();" class="btn" style="width:192px;" data-index="1">上传已填写的附件</a>
                            </div>
                            <div class="row row2">
                                <span id="msg2" data-index="0" class="fl row-tips" >已上传</span>
                            </div>
                            </c:when>
			           		<c:otherwise>
			           			<a href="javascript:upload();" class="btn" style="width:192px;" data-index="1">上传已填写的附件</a>
			           			</div>
			           			<div class="row row2">
			           				<c:choose>
			           					<c:when test="${s.patta eq '1' }">
			           						<span id="msg2" data-index="1" class="fl row-tips" ></span>
			           					</c:when>
			           					<c:otherwise><span id="msg2" data-index="0" class="fl row-tips" ></span></c:otherwise>
			           				</c:choose>
			                    </div>
			           		</c:otherwise>
			           	</c:choose>
                        <a id="upload"  sytle="display:none"><input type="file" id="attachment"  name="attachment" onchange="changeAttr(this)" style="display: none;"/></a>
                </div>
            </div>
            <c:choose>
           		<c:when test="${s.patta == '1' || s.eatta == '1'}">
           			<div class="check_right check_right_sel"></div>
           		</c:when>
           		<c:otherwise>
           			<div class="check_right"></div>
           		</c:otherwise>
           	</c:choose>
        </div>
        <p class="row1"style="margin-left: -111px;">以上步骤均需完成才能进入下一步</p>
        <div id="nextStep" class="btns">
           	<%--<a style="margin-left: -111px;" href="javascript:nextStep();" class="btn">确认</a>--%>
        </div>  
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script>
	var id = '${s.id}';
    $(document).ready(function(){
    	
    });
    //验证账户密码
	function checkNameAndPass(){
		var re = $("#atta a").eq(0).attr("data-index");
    	if(re == '1'){
			var loginName= $("#loginName").val();
			var password= $("#password").val();
			if($.trim(loginName).length <=0 || $.trim(password).length <=0){
				parent.showMess("请将账号密码填写完整！");
				return false;
			}
			$.ajax({
				type:"POST",
				url:"${ctx}/ws/productwaste/manaplan/checkNameAndPass",
				data:"loginName="+loginName+"&password="+password+"&id="+id,
				dataType:'json',
				success:function(data){
					if(data == true){
						$(".check_right").eq(0).addClass('check_right_sel');
						$("#atta a").eq(0).addClass("btn-connot").attr("data-index","0");
						parent.showMess("提交成功");
						$("#msg1").html("已提交");
						$("#msg1").attr("data-index","1");
						if($("#msg2").attr("data-index") == "1"){
							$("#next .btn-connot").removeClass("btn-connot");
						}
					}else{
						parent.showMess("提交失败！");
					}
				}
			});
    	}
	}
    //下载计划表
    function download(){
    	window.open("${ctx}/files/《管理计划表》参考样本.doc");
    }
    //上传附件
	function upload(){
		$("#attachment").trigger("click");
	}
	function changeAttr(obj){
    	var fileName = $(obj).val().substr($(obj).val().lastIndexOf("\\")+1);
    	$.ajaxFileUpload({
			url : '${ctx}/fileUploadServerById',
			secureuri : false,
			fileElementId : 'attachment',
			dataType : 'text',
			success : function(data, status) {
				if(status == 'success'){
					var fileUrl=data.replace(/<[^>]+>/g,"");
 	              	uploadPlan(fileName,fileUrl);
				}
			},
			error : function(data, status, e) {
				alert(e);
			}
		});
    }
    //上传计划表
    function uploadPlan(fileName,fileUrl){
   		$.ajax({
   			type:"POST",
   			url:"${ctx}/ws/productwaste/manaplan/uploadPlan",
   			data:"fileName="+encodeURIComponent(fileName)+"&fileUrl="+fileUrl+"&id="+id,
   			dataType:'json',
   			success:function(data){
   				if(data == 'true' || data == true){
   					$(".check_right").eq(1).addClass('check_right_sel');
   					parent.showMess("上传成功");
   					$("#msg2").html("已上传");
   					$("#msg2").attr("data-index","1");
   					if($("#msg1").attr("data-index") == "1"){
   						$("#next .btn-connot").removeClass("btn-connot");
   					}
   				}else{
   					parent.showMess("上传失败！");
   				}
   			}
   		});
    }
    //下一步
    function nextStep(){
  		$.ajax({
  			type:"POST",
  			url:"${ctx}/ws/productwaste/manaplan/nextStep",
  			data:"id="+id,
  			dataType:'text',
  			success:function(data){
  				if(data == 'ok'){
  					location.href="${ctx }/ws/productwaste/payAndPost/post?id="+id;
  				}else if(data == "请先完善资料！"){
  					parent.showMess(data);
  				}else{
  					$("#nextStep .btn").addClass("btn-connot");
  					parent.showMess(data);
  				}
  			}
  		});
    }
</script>
</body>
</html>
