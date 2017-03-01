<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>行情中心-行情编辑</title>
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
                <div class="m_r_position font_1">当前位置>行情中心>行情编辑</div>
                <div class="tab_main">
                <form action="" method="post">
                	<input type="hidden" name="id" value="${quo.id}">
                    <div class="row">
                        <span>所属分类</span>
                        <select class="suoshufenlei" name="type" id="">
                        <c:forEach items="${dictList}" var="dict">
                        	<option value="${dict.value}">${dict.label}</option>
                        </c:forEach>
                        </select>
                    </div>
                    <div class="row">
                        <span>标题</span>
                        <input id="title" name="title" type="text" placeholder="标题100字以内" value="${quo.quo_title}">
                    </div>
                    <div class="row">
                        <span>来源</span>
                        <input id="source" name="source" type="text" placeholder="如：凤凰网 " value="${quo.source}">
                    </div>
                    <div class="row for_other">
                        <span>缩略图</span>
                        <span class="for_tip">选填(在[环保知识] [环保动态] [展会信息]前两条显示,及[资讯图片]栏目显示)</span>
                    </div>
                    <div class="row for_zhanhui">
                        <span>缩略图</span>
                        <span class="for_tip">选填(在[展会信息]栏目显示)</span>
                    </div>
                    <div class="row">
                        <a href="javascript:parent.comPic(0)"class="btn ml_90">本地上传</a>
                       <!--  <a href="javascript:void(0)"class="normal_btn">从图片库选择</a> -->
                        <span class="for_tip"></span>
                    </div>
                    <div class="row">
                        <span>预览</span>
                        <div class="for_img" >
              				<input type="hidden" name="smallImg" value="${quo.small_img}">
                            <img src="${quo.small_img}" alt="上传图片">
                        </div>
                    </div>
                    <div class="tab_main_row " style="margin-left: 85px;height:30px;margin-top: 10px;margin-bottom: 10px;">
                        <p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:260*200,最佳大小:160KB</p>
                    </div>
                    
                    <div class="row">
                        <span>正文</span>
                        <textarea style="margin-left: 0px;display: none;"  name="content" id="content" cols="85" rows="30"></textarea>
                        <script id="editor" type="text/plain" style="margin-left:80px;width:630px;height:500px;"></script>

                    </div>
                    <div class="row">
                        <a href="javascript:parent.comPic(1)"class="btn ml_90">本地上传</a>
                      <!--   <a href="javascript:void(0)"class="normal_btn">从图片库选择</a> -->
                        <span class="for_tip">建议尺寸900*500像素</span>
                        <input id="big_pic" name="bigImg" type="hidden" value="${quo.big_img}">
                    </div>
                    <div class="row">
                    <input id="sta" type="hidden" name="sta" value=""/>
                      <!--   <a href="javascript:save()" class="normal_btn ml_90">存入草稿箱</a> -->
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
            var ue = UE.getEditor('editor');
            ue.ready(function () {
                // editor准备好之后才可以使用
                ue.setContent('${quo.quo_content}');
            });

            $(function(){
	            /* $(".suoshufenlei").on("change",function(){
	                if($(this).find("option:selected").val()!="ep_show"){
	                    $(".for_other").show();
	                    $(".for_zhanhui").hide();
	                }else{
	                    $(".for_other").hide();
	                    $(".for_zhanhui").show();
	                }
	            }); */
	            //选择下拉框
	            $(".suoshufenlei option[value='"+'${quo.quo_type}'+"']").prop("selected",true);
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
            var titleRight = false;
            var sourceRight = false;
            var textRight = false;
            function allRight(){
            	var Len = $("form input[name='title']").val().length;
            	if(Len<100){
            		titleRight = true;
            	}else{
            		titleRight = false;
            		parent.showMess("标题小于100字");
            	}
            	Len = $("form input[name='source']").val().length;
            	if(Len<50){
            		sourceRight = true;
            	}else{
            		sourceRight = false;
            		parent.showMess("来源小于50字");
            	}
            	Len = $("form textarea").val().length;
            	if(Len<=60000){
            		textRight = true;
            	}else{
            		textRight = false;
            		parent.showMess("正文内容小于60000字");
            	}
            }
	    	//保存草稿箱
            function save(){
            	$("#sta").val("0");
            	$("form").attr("action","${ctx}/infomaintain/quotation/submit");
            	//$("form").submit();
            	allRight();
            	if(titleRight && sourceRight && textRight){
            		//保存草稿箱ok；
            	}
            }
	    	//预览
	    	function preview(){
	    		$("#content").val(UE.getEditor('editor').getContent());
            	$("form").attr("action","${ctx}/infomaintain/quotation/preview");
            	allRight();
            	if(titleRight && sourceRight && textRight){
            		$("form").submit();
            	}
            }
            //发布
            function issude(){
            	parent.stopShowEidtor();//停止触发是否放弃编辑弹出框
                $("#content").val(UE.getEditor('editor').getContent());
            	$("#sta").val("1");
            	$("form").attr("action","${ctx}/infomaintain/quotation/submit");
            	allRight();
            	if(titleRight && sourceRight && textRight){
            		$("form").submit();
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
	    	});
        </script>
    </body>
</html>