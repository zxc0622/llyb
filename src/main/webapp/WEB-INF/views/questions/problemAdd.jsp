<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>常见问题后台-常见问题编辑</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        <style type="text/css">
            .row{overflow: hidden;margin-bottom: 15px;}
            .row > *{float:left;margin-right: 10px;}
            .for_zhanhui{display: none}
            .row > span:first-child{width:80px;text-align: right;height:30px;line-height: 30px;}
            .for_tip{height:30px;line-height: 32px;color:#666;font-size: 12px;}
            textarea{margin-left: 25px;border:1px solid #ccc;padding:5px;}
            input[type=text]{width:400px;}
            .for_img{width:150px;height:150px;border:1px solid #ccc;position: relative;line-height: 150px;text-align: center;color:#666;}
            .for_img img{position: absolute;top: 0;left: 0;width:100%;height:100%;}
            .ml_90{margin-left: 90px;}
            .tab_main{min-height: 1300px;padding-bottom: 10px;}
            
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
                <div class="m_r_position font_1">当前位置>常见问题维护>常见问题编辑</div>
                <div class="tab_main">
                <form action="saveProblem" method="post" id="formId">
                    <div class="row">
                        <span>所属分类</span>
                        <select class="suoshufenlei" style="" name="quesType" id="quesTypeId">
                        <c:forEach items="${dictList}" var="dict">
                        	<c:if test="${dict.parentId!='0'}">
                        	<option value="${dict.id}">${dict.name}</option>
                        	</c:if>
                        </c:forEach>
                        </select>
                    </div>
                      <div class="row">
                  <span>排序</span>
                   <c:choose>
                        	<c:when test="${showOrder!=null&&showOrder!=''}">
                        	<input id="sort" name="showOrder" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text" style="width:100px;" value="${showOrder}" >
                        	</c:when>
                        	<c:otherwise>
                        	 <input id="sort" name="showOrder" maxlength="14" onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text" style="width:100px;" value="${ProblemList.showOrder}" >
                        	</c:otherwise>
                        </c:choose>
                 </div>
                    <div class="row">
                        <span>标题</span>
                        <c:choose>
                        	<c:when test="${quesTitle!=null&&quesTitle!=''}">
                             <input id="title" name="quesTitle" type="text" placeholder="标题100字以内" value="${quesTitle}" >
                        	</c:when>
                        	<c:otherwise>
                        	 <input id="title" name="quesTitle" type="text" placeholder="标题100字以内" value="${ProblemList.quesTitle}" >
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    <input type="hidden" value="${ProblemList.id}" id="ProblemId" name="quesId"/>
                    <div class="row">
                        <span>正文</span>
                      <%--   <c:choose> --%>
<%--                         	<c:when test="${quesContent!=null&&quesContent!=''}">
 --%>                        		<textarea style="margin-left: 0px;display: none;"  name="quesContent" id="content" cols="85" rows="30"></textarea>
                      	   		<script id="editor" type="text/plain" style="margin-left:80px;width:630px;height:500px;"></script>                        	
          <%--              	  	  <input type="hidden" value="${quesContent}" id="quesContent">
                        	</c:when>
 --%>                        <%-- 	<c:otherwise>
                        		<textarea style="margin-left: 0px;display: none;"  name="quesContent" id="content" cols="85" rows="30"></textarea>
                      		    <script id="editor" type="text/plain" style="margin-left:80px;width:630px;height:500px;"></script>
                      		    <input type="hidden" value="${ProblemList.quesContent}" id="quesContent">
						    </c:otherwise>
                        </c:choose> --%>
                    </div>
                    <div class="row">
                        <a href="javascript:preview()" class="normal_btn ml_90"">预览</a>
                        <a href="javascript:issude()" class="btn">发布</a>
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
                var str ='${quesContent}';
                var str1='${ProblemList.quesContent}';
                if(str!=null&&str!=""){
                	 ue.setContent(str);
                }else{
                	ue.setContent(str1);
                }
               
            });

            $(function(){
	            $(".suoshufenlei").on("change",function(){
	                if($(this).find("option:selected").val()!="ep_show"){
	                    $(".for_other").show();
	                    $(".for_zhanhui").hide();
	                }else{
	                    $(".for_other").hide();
	                    $(".for_zhanhui").show();
	                }
	            });
	            //选择下拉框
	            $(".suoshufenlei option[value='"+'${quesType}'+"']").prop("selected",true);
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
	    	function preview(){
              	var ntTitileId =$("#title").val();
	           	var ntContentId =UE.getEditor('editor').getContent();
	          	var quesType =$("#quesTypeId").val();
	          	var ProblemId =$("#ProblemId").val();
	          	var sort=$("#sort").val();
	          	$("#content").val(UE.getEditor('editor').getContent());
	           	if(ntTitileId==""||ntTitileId==null){
	          		  parent.showMess("请填写标题");
	          	}else if(ntContentId==null||ntContentId==""){
	          		  parent.showMess("请填写正文");
	          	}else if(sort==null||sort==""){
	          		  parent.showMess("请填写顺序");
	          	}else{
	          		$("#formId").attr("action","CommonProblemYL").submit();
	          	}
            }
            //发布
            function issude(){
                $("#content").val(UE.getEditor('editor').getContent());
            	var ntTitileId =$("#title").val();
            	var ntContentId =$("#content").val();
              	var sort=$("#sort").val();
            	if(ntTitileId==""||ntTitileId==null){
            		  parent.showMess("请填写标题");
            	}else if(ntContentId==null||ntContentId==""){
            		  parent.showMess("请填写正文");
            	}else if(sort==null||sort==""){
	          		  parent.showMess("请填写排序");
	          	}else{
            		$("#formId").submit();
            	}
            }
	    	/* //图片预览
	    	function picSea(n){
	    		var url=$(".pic_wait_1").eq(n).find(".a_1 img").attr("src");
	    		parent.picView(url);
	    	} */
	    	/* //图片删除
	    	function picDel(n){
	    		$(".pic_wait_1").eq(n).find(".a_1 img").attr("src","");
	    	} */
	    	//触发是否放弃编辑框
	    	$(function(){
	    		$("input").unbind().focus(function(){
	    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
	    		});
	    		UE.getEditor('editor').on("focus",function(){
	    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
	    		});
	    		/* $(document).on('keydown',function(){
	    			if(UE.getEditor('editor').getContent().length>0){
		    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
		    		}
	    		}) */
	    	});
        </script>
    </body>
</html>