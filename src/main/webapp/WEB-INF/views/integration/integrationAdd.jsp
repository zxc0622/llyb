<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/> 
        <title>积分兑换商品后台-积分兑换商品编辑</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        <style type="text/css">
            .row{overflow: hidden;margin-bottom: 15px;}
            .row > *{float:left;margin-right: 10px;}
            .for_zhanhui{display: none}
            .row > span{width:80px;text-align: right;height:30px;line-height: 30px;}
            .for_tip{height:30px;line-height: 32px;color:#666;font-size: 12px;}
            textarea{margin-left: 25px;border:1px solid #ccc;padding:5px;}
            input[type=text]{width:400px;}
            .for_img{width:150px;height:150px;border:1px solid #ccc;position: relative;line-height: 150px;text-align: center;color:#666;}
            .for_img img{position: absolute;top: 0;left: 0;width:100%;height:100%;}
            .ml_90{margin-left: 90px;}
            .tab_main{min-height: 1300px;padding-bottom: 10px;}
            .tab_main input[type=text]{height:30px;}
            /*附件样式*/
            .row_right{margin-left:90px;}
            .attachment_div{border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
            .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
            .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
            .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
            .add_attachment_btn>a{color:#5EC520;}
        </style>



    </head>
    <body>
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>积分兑换商品维护>积分兑换商品编辑</div>
                <div class="tab_main">
                <form action="saveIntegration" method="post" id="formId">
                    <div class="row clearfix">
         		         <span class="fl">商品名称</span>
                     	 <input class="fl" id="proNameId" name="proName"  type="text" style="width:302px;" value="${integration.proName}" >
                     	
           		    </div>
                    
                    <div class="row clearfix">
                          <span class="fl">数量</span>
                          <input class="fl" id="numId" name="num" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text" value="${integration.num}" style="width:100px;" >
                          <span class="fl">限购数量</span>
                          <input class="fl" id="limitNumId" name="limitNum" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text" value="${integration.limitNum}" style="width:100px;">
                    </div>
                      <div class="row clearfix">
                          <span class="fl">所需积分</span>
                          <input class="fl" id="pointsId" name="points" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text" value="${integration.points}" style="width:100px;" >
                    </div>
                     <div class="row clearfix">
                          <span class="fl">赞助商</span>
                          <input class="fl" id="sponsorId" name="sponsor" maxlength="14"  type="text" value="${integration.sponsor}" style="width:302px;">
                    </div>
                    <input type="hidden" name="itemId" value="${integration.id}"/>
                    <div class="row clearfix">
                    	<a href="javascript:parent.comPic(0)"class="btn ml_90 fl">本地上传</a>
                    </div>
                    <div class="row">
                        <span>预览</span>
                        <div class="for_img" >
              				<input type="hidden" id="smallImgId" name="smallImg" value="${integration.smallImg}">
                            <img src="${integration.smallImg}" alt="上传图片">
                        </div>
                    </div>
					<div class="tab_main_row " style="margin-left: 85px;height:30px;margin-top: 10px;margin-bottom: 10px;">
						<p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:260*200,最佳大小:160KB</p>
					</div>
                    <div class="row">
	                      <span>商品介绍</span>
	                	  <textarea style="margin-left: 0px;display: none;"  name="proDesc" id="content" cols="85" rows="30"></textarea>
	                      <script id="editor" type="text/plain" style="margin-left:80px;width:630px;height:500px;"></script>                        	
                    </div>
                    <div class="row">
                        <!-- <a href="javascript:preview()" class="normal_btn ml_90"">预览</a> -->
                        <a href="javascript:issude()" class="btn ml_90">发布</a>
                    </div>
                </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>
        <script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
            //实例化编辑器
            //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
            var ue = UE.getEditor('editor',{
            	   toolbars: [[
            	                'undo', 'redo', '|',
            	                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

            	                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

            	                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            	                'preview',  '|','imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            	                'simpleupload'
            	            ]],imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
                    });
            ue.ready(function () {
                // editor准备好之后才可以使用
                var str1='${integration.proDesc}';
                	ue.setContent(str1);
            });

            $(function(){
	            //兼容go(-1)时页面展示
	            if(!$(".suoshufenlei option[value='ep_show']").prop("selected")){
	            	$(".for_other").show();
                    $(".for_zhanhui").hide();
	            }else{
	            	 $(".for_other").hide();
	                 $(".for_zhanhui").show();
	            }
	            $(".for_img img").attr("src",$(".for_img input").val());
	            
	        });
	    	//预览
	    	function preview(obj){
	    		debugger;
              	var proNameId =$("#proNameId").val();
	           	var proDesc =UE.getEditor('editor').getContent();
	          	var limitNumId =$("#limitNumId").val();
	          	var numId =$("#numId").val();
	          	var sponsorId=$("#sponsorId").val();
	          	var smallImgId=$("#smallImgId").val();
	        	$("#content").val(proDesc);
	        	var pointsId=$("#pointsId").val();
	           	if(proNameId==""||proNameId==null){
	          		  parent.showMess("请填写商品名称");
	          	}else if(numId==null||numId==""){
	          		  parent.showMess("请填写数量");
	          	}else if(limitNumId==null||limitNumId==""){
	          		  parent.showMess("请填写限购数量");
	          	}else if(proDesc==null||proDesc==""){
	          		  parent.showMess("请填写商品介绍");
	          	}else if(pointsId==""||pointsId==null){
	          		  parent.showMess("请填写所需积分");
	          	}else if(limitNumId>numId){
	          		parent.showMess("限购数量不能大于总数量");
	          	}else{
	          		$("#formId").attr("action","IntegrationYL").submit();
	          	}
            }
            //发布
            function issude(){
            	debugger;
             	var proNameId =$("#proNameId").val();
	           	var proDesc =UE.getEditor('editor').getContent();
	           	$("#content").val(proDesc);
	          	var limitNumId =$("#limitNumId").val();
	          	var numId =$("#numId").val();
	          	var sponsorId=$("#sponsorId").val();
	          	var smallImgId=$("#smallImgId").val();
	          	var sponsorId=$("#sponsorId").val();
	          	var pointsId=$("#pointsId").val();
	           	if(proNameId==""||proNameId==null){
	          		  parent.showMess("请填写商品名称");
	          	}else if(numId==null||numId==""){
	          		  parent.showMess("请填写数量");
	          	}else if(limitNumId==null||limitNumId==""){
	          		  parent.showMess("请填写限购数量");
	          	}else if(proDesc==null||proDesc==""){
	          		  parent.showMess("请填写商品介绍");
	          	}else if(pointsId==""||pointsId==null){
	          		  parent.showMess("请填写所需积分");
	          	}else if(limitNumId>numId){
	          		parent.showMess("限购数量不能大于总数量");
	          	}else{
	          		$("#formId").attr("action","saveIntegration").submit();
	          	}
            }
	    	//触发是否放弃编辑框
	    	$(function(){
	    		$("input").unbind().focus(function(){
	    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
	    		});
	    		UE.getEditor('editor').on("focus",function(){
	    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
	    		});
	    	});
	    	
	    	   // 上传图片 弹出层方法
	    	function addPic(str , n){
            	if(n==0){
            		$(".for_img img").attr("src",str);
            		$(".for_img input").val(str);
            	}
            	if(n==1){
            		 //$("#big_pic").val(str); 
            		 ue.execCommand('insertimage',{
            			 src:str,
            			 width:'500',
            			 height:'300'
            		 });
            	}
	    	}
        </script>
    </body>
</html>