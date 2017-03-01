<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-售后服务</title>
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<link href="${ctxStatic}/css/v2/enterpriseCustom/enterpriseCustom.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/flexslider/flexslider.css" />
</head>
<body>
<!--头部模块 -->
<%@ include file="../module/head.jsp"%>
<!--导航栏模块 -->
<%@ include file="../module/navigation.jsp"%>
<div class="box14" style="display: none;">
	<h2>
		<a class="subClose"></a>
	</h2>
	<div class="mainlist">
		<div>
			<span>标题：</span><input style="width: 300px;border: 1px solid rgb(227, 227, 227);height: 30px;padding-left: 5px;" id="ntTitileId" type="text" value="${provMsg.getStr('title')}">
		</div>
		<div style="margin-top: 20px;">
	    	<textarea id="editor_id" name="content" style="width:800px;height:400px;">${provMsg.getStr('content')}</textarea>
			<p>
				您当前输入了 <span class="word_count2">0</span> 个文字。<span class="word_surplus"></span>
			</p>
		</div>
		<div style="margin-top: 10px;">
			<button style="width: 120px;height: 30px;color: #848484;background: #FFF;border: 1px solid #ccc;" class="btn_box14_preview" onclick="box14Preview()">预览</button>
			<button style="width: 120px;height: 30px;color: white;background: #5cb531;" class="btn_box14_save" onclick="box14Save()">保存</button>
		</div>
	</div>
</div>

<div class="preview_shade"></div>
<div class="box14_preview">
	<h2>
		<a onclick="closePreview()"></a>
	</h2>
	<div class="prePreview">
		<h3 class="preTitle"></h3>
		<div class="preContent"></div>
	</div>
</div>

<div style="width: 100%; background-color: #ecffe7; overflow: hidden;">
	<div class="afterSale">
		<div class="letter">
			<div class="zhe_z14"></div>
			<div class="box-bar14" style="display: none;">
				<a href="javascript:void(0);" title="设置" class="showbox14">设置</a>
			</div>
			<div class="security">
				<h2 id="spTitle">${provMsg.getStr('title')}</h2>
				<div id="spContent" style="padding-bottom: 30px;">${provMsg.getStr('content')}</div>
			</div>
		</div>
	</div>
</div>
<!--页面底部-->
<%@ include file="../module/bottom.jsp"%>
<script>
	var ctxStatic='${ctxStatic}';//静态文件路径
	var basePath = '${basePath}';
	var showShadeLayer =${showShadeLayer};//是否显示遮罩层（开启编辑模式）
	var companyId='${companyId}';
</script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-ui.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.bigcolorpicker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eYf9sA6yVTFHlh9ytU4a0EYY&services=&t=20160513110936"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/library.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/serviceProvitionSubpage.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh-CN.js"></script>
<script>
	var options = {
		items : [
			'undo', 'redo', '|','formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
			'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat',
			'|', 'image', 'hr', 'emoticons', 'link', 'unlink', '|', 'about', '/',
			'|' ,'justifyleft', 'justifycenter', 'justifyright',
			'justifyfull', 'indent', 'outdent', 'subscript',
			'superscript', 'quickformat', 'selectall', '|'
		 ],
		zIndex : 9999999,
        filterMode : true,
        afterChange : function() {
            //$('.word_count1').html(this.count()); //字数统计包含HTML代码
            $('.word_count2').html(this.count('text'));  //字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字
            var limitNum = 300;  //设定限制字数
            var pattern = '还可以输入' + limitNum + '字'
            $('.word_surplus').html(pattern); //输入显示
            if(this.count('text') > limitNum) {
				pattern = ('字数超过限制，请适当删除部分内容');
				//超过字数限制自动截取
				var strValue = editor.text();
				strValue = strValue.substring(0,limitNum);
				editor.text(strValue);
            } else {
	             //计算剩余字数
	             var result = limitNum - this.count('text'); 
	             pattern = '还可以输入' +  result + '字'
            }
            $('.word_surplus').html(pattern); //输入显示
        },
        uploadJson : '${ctx}/Library/libraryCommon/uploadImageForEditor',
        //fileManagerJson : '${ctx}/hyzl/findImgResources',
        allowFileManager : true
        
	};
	KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id', options);
	});
	
	function box14Save(){
		var title = $("#ntTitileId").val();
		// 取得HTML内容
		var content = editor.html();
		
		if (title != "" && content != "") {
			$.ajax({
				//url:'${ctx}/Library/serviceProvition/saveProvition/'+companyId,
				url : basePath + 'Library/serviceProvition/saveProvition/'+companyId,
				data : {
					ntTitile : title,
					ntContent : content
				},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					if (data == "ok") {
						$("#spTitle").html(title);
						$("#spContent").html(content);
						closePreview();
						//关闭弹窗
						$("#TB_overlayBG").css("display", "none");
						$(".box14 ").css("display", "none");
						$(".removable").remove();
						alert("保存成功");
					}
				}
			});
		}
	}
	
	function box14Preview(){
		$(".box14_preview").css({
			left : ($(window).width() - $(".box14_preview").width()) / 2 + "px",
			top : ($(window).height() - $(".box14_preview").height()) / 2 + "px",
		});
	
		var ntTitileId = $("#ntTitileId").val();
		var ntContentId = editor.html();
	
		$(".preTitle").html(ntTitileId);
		$(".preContent").html(ntContentId);
		$(".preview_shade").show();
		$(".box14_preview").show();
	}
	
	function closePreview() {
		$(".preview_shade").hide();
		$(".box14_preview").hide();
	}
</script>
</body>
</html>