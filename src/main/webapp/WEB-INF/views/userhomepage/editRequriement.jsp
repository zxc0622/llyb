<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>优蚁环保--环保服务预约</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/amazeui.min.css"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
	<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css"/>
	<%-- <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/ratchet.min.css"/> --%>
<!--样式-->
<style type="text/css">
     ul { list-style-type: none;}
     li { display: inline-block;}
     li { margin: 1px 0;}
     input.labelauty + label { font: 16px "Microsoft Yahei";} 
    .detail{ width:100%;height:650px;overflow:auto;overflow-x: hidden;}
	.detail .lable{width:50%; margin:0 auto; text-align:center;}
    .detail .area{width:50%; margin:0 auto; text-align:center;}
    .detail .detail-h3{height:1.0em; line-height:0.2em; font-size:1.2em; color:#898989; font-weight:normal; margin-bottom:16px;}
    .detail-l{padding-bottom:30px;}
    .detail-l .remark{border:#b28850 1px solid; padding:10px; height:130px; margin:0 auto; width:90%;margin-top: 10px;}
    .detail-l textarea{width:90%; height:110px; border:#b28850 1px dashed; padding:10px; font-size:14px; line-height:18px; }
    .detail-l .ygroup{margin:0 auto; padding:0px; width:70%;}
    .detail-l .ygroup label{background-color:#006400; color:#fff; float:left; width:30%; height:35px; line-height:35px; padding:0; margin:10px 0px; font-size:16px;}
    .detail-l .ygroup div{width:70%; float:left; height:35px; padding:0px; margin:10px 0px;}
	.div1{width:100px;height:43px;flaot:left;margin-left:20px;}
	.detail-l1 .ygroup label {
    background-color: #006400;
    color: #fff;
    float: left;
    font-size: 16px;
    height: 35px;
    line-height: 35px;
    margin: 10px 0;
    padding: 0;
    width: 50%;
    }
    .detail-l1 .ygroup font {
      color: red;
    }
    .main_right{height: 1000px;}
   </style>
		
<body>
		<div class="main_right">
   		<div class="cur_position">当前位置>用户首页>编辑环保需求</div>
   		<div class="tab_main">
		<div class="detail">
		<div class="detail-l1"> 
		  	<input type="hidden" value="${id}" id="requrieId"/>
	     <div class="g" style="margin-left: 200px;">
		   	<div class="ygroup" style="margin-left: -10px;">
		     		<label style="width: 80px;float: left;">&nbsp;环保需求</label>
		     	<div>
		       	<input type="text" id="" name="" class="js-pattern-z_phone" value="${remarks }" readonly="readonly" minlength="11" placeholder="" style="margin-top: 60px; margin-left: -80px; width: 270px;"  required>
		     	<font>*此信息不可修改</font>
		     	</div>
		 	</div>

		  <div class="ygroup" style="margin-left: -10px;">
		    <label style="width: 80px;float: left;">&nbsp;电话号码</label>
		    <div>
		      <input type="text" id="" name="" value="${phone }" readonly="readonly" class="js-pattern-z_phone" minlength="11" placeholder="" style="margin-top: 60px; margin-left: -80px; width: 270px;"  required>
              <font>*此信息不可修改</font>  		    
		    </div>
		  </div>
 		</div>
	</div>	
	<div class="area detail-l">
  		<div class="g">
   			<div class="remark" style="margin-left: 1px;">
     		 	<textarea id="requiredescrip" name="requiredescrip" placeholder="请描述您的环保需求(选填)" minlength="100"　required>${requirement_describe}</textarea>
    		</div>
  		</div>
  		<!--  <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />-->
  	<!--end-->
		<div class="g" style="margin-left: 3px;">
  			<div class="ygroup" style="margin-left: -5px;">
      			<label style="width: 80px;float: left;">姓名</label>
        		<input type="text" id="name" name="name" class="js-pattern-contacts" minlength="2" placeholder="输入您的姓名(选填)" style="width: 270px;" required value="${name}">
    		</div>

		    <div class="ygroup" style="margin-left: -5px;">
		      <label style="width: 80px;float: left;margin-top:10px;">公司名称</label>
		      <div>
	        	<input type="text" id="company_name" name="company_name" class="js-pattern-z_phone" minlength="11" placeholder="输入您的公司名称(选填)" style=" width: 270px;"  required value="${company_name}">
		      </div>
		    </div>
  		</div>
  			<div class="g">
    				<div class="ygroup" style="margin-top:10px;width:300px;border:0px solid red;float:left;">
     					<button id="submmit" class="am-btn-success am-btn-block" style="border:0px solid yellow;width: 120px;height:30px;line-height: 30px;margin-left: 75px;border-radius: 5px;">确&nbsp;认&nbsp;提&nbsp;交</button>
    				</div>
  				</div>
			</div>
		</div>
	</div>
 </div>
</div>
  <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
  <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
 
<script type="text/javascript">

$(function () {
	$('#submmit').on('click', function () {
	          var requrieId = $("#requrieId").val();
	          var requiredescrip = $("#requiredescrip").val();
	          var name =$("#name").val();
	          var companyName=$("#company_name").val();
		   	   $.ajax({
					type : "POST",
					url : "${ctx}/userhomepage/updateRequrieInfo",
					data : "requrieId="+requrieId+"&requiredescrip="+requiredescrip+"&name=" + name+"&companyName=" + companyName,
					success : function(data) { 
						if(data == "ok"){
							parent.showMess("保存成功,3秒跳转到首页.");
							setTimeout(function(){
			            		location.href="${ctx}/userhomepage/index";
			            	},3000);
						}
					}
				});
	        });
    });
//--end
</script>
</body>
</html>
