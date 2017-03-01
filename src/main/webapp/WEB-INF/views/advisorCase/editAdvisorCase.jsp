<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
		<title>新增服务顾问明星案例</title>
		 <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
		<style>
			.tab_main{border:1px solid #ccc;padding:15px 10px 30px;position: relative;}
			.btn{width:120px;line-height:30px;height:30px;text-align: center;color:#fff;background-color: #5cb531;display: inline-block;margin-right: 5px;padding-top: 1px;}
			.tab_main input[type=text],.tab_main input[type=password]{border:1px solid #ccc; height:32px;text-indent: 5px;}
            .tab_main input[type=text]:focus,.tab_main input[type=password]:focus{border:1px solid #ee7800;}
		</style>
		<link rel="stylesheet" href="${ctxStatic}/kindeditor/themes/default/default.css" />
		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
		<script charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor-all.js"></script>
		<script charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh-CN.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
		<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					filterMode : true,
					uploadJson : '${ctx}/Library/libraryCommon/uploadImageForEditor',
					allowFileManager : true
				});
			});
		</script>
	</head>
	<body>
		<div class="main_right">
			<div class="m_r_position font_1">当前位置>信息管理>明星案例>编辑</div>
			<div class="tab_main">
				<input type="hidden" class="id" value="${caseInfo.get('id')}"/>
				标题：<input class="title" type="text" value="${caseInfo.get('title')}"/></br></br>
				概述：<input class="summary" type="text" value="${caseInfo.get('summary')}"/></br></br>
				来源：<input class="source" type="text" value="${caseInfo.get('source')}"/></br></br>
				排序：<input class="seq" type="text" value="${caseInfo.get('seq')}"/>(大于0的数，降序排列)</br></br>
				缩略图：
				<input	type="button" style="margin: 0px 10px; width: 70px;" value="上传" /> 
				<input type="file"	style="margin: 0px 10px; width: 70px; position: absolute; left: 70px;opacity: 0.0; filter: alpha(opacity =0); "
					id="minImg" class="uploadImg" name="files" /> 
				<input type="button" class="showImg" id="${caseInfo.get('img')}" style="margin: 0px 10px; width: 70px;"
					value="预览" /></br></br>
				<textarea name="content" style="width:700px;height:400px;visibility:hidden;">${caseInfo.get('content')}</textarea></br></br>
				<p style="text-align:center;">
					<a href="javascript:void(0)" class="btn submit">发布</a>
					<a href="/llhb/advisorCase" class="btn cancel">取消</a>
				</p>
			</div>
		</div>
		
		<script>
			$(function(){
				$(".submit").click(function(){
					var id =$(".id").val();
					var title=$(".title").val();
					var summary=$(".summary").val();
					var source=$(".source").val();
					var seq=$(".seq").val();
					var img=$(".showImg").attr("id");
					var content=editor.html();
					var isPass=title!=""&&summary!=""&&source!=""&&seq!=""&&img!=""&&content!="";
					if(!isPass){
						parent.layer.msg("请填写完整信息！",function(){});
						return;
					}
					
					$.post("/llhb/advisorCase/saveEditCase",{
						id:id,
						title:title,
						summary:summary,
						source:source,
						seq:seq,
						img:img,
						content:content
					},function(data,status){
					    if(data){
					    	parent.layer.msg("操作成功！");
						    window.location.href="/llhb/advisorCase";
					    }else{
					    	parent.layer.msg("操作失败！",function(){});
					    }
					});
				});
				
				$(".uploadImg").change(function(){
					ImgUtils.uploadImgReturnUrl($(this),function(url,el){
						$(".showImg").attr("id",url);
					});
				});
				
				$(".showImg").click(function(){
					ImgUtils.showImg($(this).attr("id"));
				});
				
				//图片上传预览
				ImgUtils = {
					uploadImgReturnUrl : function(el, callback) {
						var elObj = $(el);
						var cloneEl = elObj.clone(true);
						var elId = elObj.attr("id");
						var imgUrl = "";
						$.ajaxFileUpload({
							url : "/llhb/Library/enterpriseCustom/verifyUploadImage/${companyId}",
							secureuri : false,
							fileElementId : elId,
							dataType : 'text',
							success : function(data, status) {
								var startIndex = data.indexOf("{") + 1;
								var endIndex = data.indexOf("}");
								imgUrl = data.substring(startIndex, endIndex);
								if (typeof callback == "function") {
									callback(imgUrl, $("#" + elId));
									parent.layer.msg("图片上传成功！");
								}
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								parent.layer.msg('上传失败！');
							},
							complete : function(xmlHttpRequest) {
								$("#" + elId).replaceWith(cloneEl);
							}
						});
					},

					// layer图片预览
					showImg : function(imgUrl) {
						var div = '<div id="showImgDiv" class="hide layui-layer-wrap" style="display: none;"><img style="height:auto;width:100%" class="showImgEl" src="'
								+ imgUrl + '"></div>';
						$('body', window.parent.document).append(div);
						parent.layer.open({
							type : 1,
							title : false,
							closeBtn : 1,
							area : '800px',
							skin : 'layui-layer-nobg', // 没有背景色
							shadeClose : true,
							content : $('#showImgDiv', window.parent.document),
							end : function(index) {
								$('#showImgDiv', window.parent.document).remove();
							}
						});
					}
				};
			});
			
		</script>
	</body>
</html>
