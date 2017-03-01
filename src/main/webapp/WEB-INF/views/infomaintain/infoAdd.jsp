<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>资讯后台-资讯编辑</title>
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
            .tab_main{min-height: 1400px;padding-bottom: 10px;}
            
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
                <div class="m_r_position font_1">当前位置>资讯维护>资讯编辑</div>
                <div class="tab_main">
                <form action="" method="post">
                	<input type="hidden" name="id" value="${info.id}">
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
                        <input id="title" name="title" type="text" placeholder="标题100字以内" value="${info.new_title}">
                    </div>
                    <div class="row">
                        <span>来源</span>
                        <input id="source" name="source" type="text" placeholder="如：凤凰网 " value="${info.source}">
                    </div>
                    <div class="row">
                        <span>SEO关键词</span>
                        <input id="seo_key_words" name="seoKeyWords" type="text" placeholder="多个关键字之间使用&quot;,&quot;分隔,不要超过50字" value="${info.seo_key_words}">
                        <span style="color:#999;margin-left:90px;margin-top:5px;font-size:12px;">填写关键词可以在搜索引擎上得到更好的排名，让客户更容易找到您</span>
                        <input id="page_desc" name="pageDesc" type="hidden" placeholder="100字以内" value="${info.page_desc}">
                    </div>
                    <%--<div class="row">
                        <span>页面描述</span>

                    </div>--%>
                    <div class="row for_zhanhui">
                        <span>时间</span>
                        <input id="hold_time" name="holdTime" type="text" placeholder="如：2015-12-01 " value="${info.hold_time}">
                    </div>
                    <div class="row for_zhanhui">
                        <span>举办地</span>
                        <input id="hold_place" name="holdPlace" type="text" placeholder="举办地100字以内" value="${info.hold_place}">
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
              				<input type="hidden" name="smallImg" value="${info.small_img}">
                            <img src="${info.small_img}" alt="上传图片">
                        </div>
                    </div>
                    <div class="tab_main_row " style="margin-left: 85px;height:30px;margin-top: 10px;margin-bottom: 10px;">
                        <p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:740*300,最佳大小:160KB</p>
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
                        <input id="big_pic" name="bigImg" type="hidden" value="${info.big_img}">
                       	<span style="line-height:30px; padding-left:10px;">排序</span><input name="showOrder" type="text" value="${info.show_order}" style="width:40px;"/><span class="for_tip">(序号越小，排序越靠前)</span>
                        <div class="row_right font1" style="border:0px solid red;width:600px;">
                                <div class="add_attachment_btn font_1">
                                    <a href="javascript:addAttachment();">添加附件</a>
                                </div>
                                <input type="file" name= "attachment_file"  onchange="clickattr()" id="attachment_file"  multiple  style="display: none;"/>
                                <c:forEach items="${infoAttachList}" var="infoAttach">
                               	<div class="attachment_div" >
		                            <a href="javascript:void(0);" class="tmui-ellipsis font_1" title="${infoAttach.atta_name}">${infoAttach.atta_name}</a>
		                            <a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>
		                            <input type="hidden" name="fileName" value="${infoAttach.atta_name}"/>
		                            <input type='hidden' name='filePath' value='${infoAttach.atta_addr}'>
		                        </div>
                                </c:forEach>
                        </div>
                    </div>
                    <div id="other" class="row for_other">
                        <div class="ml_90">
                            <input type="checkbox" name="isTop" value="1" <c:if test="${info.isTop eq true}">checked</c:if>>
                            <span>同步上传到资讯首页头条栏目上</span>
                        </div>
                        <div >
                            <input type="checkbox" name="isPic" value="1" <c:if test="${info.isPic eq true}">checked</c:if>>
                            <span>同步上传到资讯图片栏目上</span>
                        </div>
                        <%--<div >
                            <input type="checkbox" name="isYouyi" value="1" <c:if test="${info.isYouyi eq true}">checked</c:if>>
                            <span>同步到首页优蚁资讯</span>
                        </div>--%>
                    </div>
                    <div id="zhanhui" class="row for_zhanhui">
                        <div class="ml_90" >
                            <input type="checkbox" name="isNewShow" value="1" <c:if test="${info.isNewShow eq true}">checked</c:if> >
                            <span>同步最新展会栏目上</span>
                        </div>
                    </div>
                    <div class="row">
                    <input id="sta" type="hidden" name="sta" value=""/>
                      <!--   <a href="javascript:save()" class="normal_btn ml_90">存入草稿箱</a> -->
                        <a href="javascript:preview()" class="normal_btn ml_90">预览</a>
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

                    'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|','link','unlink','|',

                    'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|','simpleupload',
                    'insertvideo'
                ]],
                imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str=",
                videoUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
            });
            ue.ready(function () {
                // editor准备好之后才可以使用
                ue.setContent('${info.new_content}');
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
	            $(".suoshufenlei option[value='"+'${info.new_type}'+"']").prop("selected",true);
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
            var timeRight = false;
            var placeRight = false;
            var textRight = false;
            var seoKeyWordsRight = false;
            var pageDescRight = false;
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

                Len = $("form input[name='seoKeyWords']").val().length;
                if(Len<50){
                    seoKeyWordsRight = true;
                }else{
                    seoKeyWordsRight = false;
                    parent.showMess("SEO关键词小于50字");
                }
                Len = $("form input[name='pageDesc']").val().length;
                if(Len<100){
                    pageDescRight = true;
                }else{
                    pageDescRight = false;
                    parent.showMess("页面描述小于100字");
                }


            	Len = $("form input[name='holdTime']").val().length;
            	if(Len<100){
            		timeRight = true;
            	}else{
            		timeRight = false;
            		parent.showMess("举办时间小于100字");
            	}
            	Len = $("form input[name='holdPlace']").val().length;
            	if(Len<100){
            		placeRight = true;
            	}else{
            		placeRight = false;
            		parent.showMess("举办地点小于100字");
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
            	$("form").attr("action","${ctx}/infomaintain/submit");
            	//$("form").submit();
            	allRight();
            	if(titleRight && sourceRight && timeRight && placeRight && textRight && seoKeyWordsRight && pageDescRight){
            		//保存草稿箱ok；
            	}
            }
	    	//预览
	    	function preview(){
	    		$("#content").val(UE.getEditor('editor').getContent());
            	$("form").attr("action","${ctx}/infomaintain/preview");
            	allRight();
            	if(titleRight && sourceRight && timeRight && placeRight && textRight && seoKeyWordsRight && pageDescRight){
            		$("form").submit();
            	}
            }
            //发布
            function issude(){
            	parent.stopShowEidtor();//停止触发是否放弃编辑弹出框
                $("#content").val(UE.getEditor('editor').getContent());
            	$("#sta").val("1");
            	$("form").attr("action","${ctx}/infomaintain/submit");
            	allRight();
            	if(titleRight && sourceRight && timeRight && placeRight && textRight && seoKeyWordsRight && pageDescRight){
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
	    		/* $(document).on('keydown',function(){
	    			if(UE.getEditor('editor').getContent().length>0){
		    			parent.showStopEidtor("是否确定离开页面，放弃编辑？");
		    		}
	    		}) */
	    	});
	    	//添加附件
	    	function addAttachment(){
	    		$(".row_right input").trigger("click");
	    	}
	    	//上传文件
	    	function clickattr(){
	    		var fileName = $("#attachment_file").val().substr($("#attachment_file").val().lastIndexOf("\\")+1);
	    		$.ajaxFileUpload({
	    			url:"${ctx}/infomaintain/addAttachment",
	    			secureuri : false,
      				fileElementId : 'attachment_file',
                    async: false,
      				dataType : 'text',
	    			success:function(data){
	    				if(data!=false){
	    					var divStr = '<div class="attachment_div" >' +
				                            '<a href="javascript:void(0);" class="tmui-ellipsis font_1" title="'+fileName+'">'+fileName+'</a>'+
				                            '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+
				                            '<input type="hidden" name="fileName" value="'+fileName+'"/>'+
				                            "<input type='hidden' name='filePath' value='"+data.replace(/<[^>]+>/g,"")+"'>"+
			                            '</div>';
	    					$(".row_right").append(divStr);
	    				}
	    			}
    			})  
	    	}
	    	//删除附件
	    	function removeAttachment(thisobj){
	    		$(thisobj).parent().remove();
	    	}
        </script>
    </body>
</html>