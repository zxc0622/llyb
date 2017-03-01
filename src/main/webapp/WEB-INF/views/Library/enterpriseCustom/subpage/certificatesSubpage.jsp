<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-资质展示</title>
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
<div class="qualification">
	<p class="qualification_zz">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">资质展示</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">Licenses</b>
	</p>
</div>
<div class="certificate">
	<div class="zhe_z28"></div>
	<div class="box-bar29" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox29">设置</a>
	</div>
	<div class="box29" style="display: none;">
		<h2>
			证书设置 <a class="close"></a>
		</h2>
		<div class="mainlist">
			<div class="ensure">
				<a href="javascript:void(0);"><span class="submitCers">确定</span>
				</a> <a href="javascript:void(0);"><span
					class="abolish close deleteCer">取消</span>
				</a>
			</div>
			<div style="width: 600px; display: none;" class="setCer">
				<span style="color: #145f00;">标题：</span> <input type="text"
					class="cerTitle" name="licenseImg" value="" style="width: 210px;" />
				<input type="button" class="selectImg" style="margin: 0px 10px; width: 70px;" value="选择图片" />
				<input type="file" style="margin: 0px 10px; width: 70px; position: absolute; left: 306px; opacity: 0.0; filter: alpha(opacity = 0);" id="cerImg" class="cerImg" name="files" /> 
				<input type="button" class="showImg" style="margin: 0px 10px; width: 70px;" value="预览图片" />
				<input type="button" class="deleteImg" style="margin: 0px 10px; width: 70px;" value="删除图片" />
			</div>
			<div style="margin-right: 15px; font-size: 15px; float: right;" class="addCerDiv">
				<a href="javascript:void(0);" class="addCer">[点击新增证书]</a>
			</div>
		</div>
	</div>
	<ul class="certificate_sy">
		<c:forEach items="${cerList}" var="cer">
			<li id="cerid${cer.id}">
				<div class="imgDiv">
					<img src="${cer.cer_pic }"
						style="vertical-align: middle; max-width: 248px; max-height: 248px;" />
				</div>
				<p>${cer.info_title }</p>
			</li>
		</c:forEach>
	</ul>
</div>

<!--页面底部-->
<%@ include file="../module/bottom.jsp"%>
<script>
	var ctxStatic='${ctxStatic}';//静态文件路径
	var basePath = '${basePath}';
	var showShadeLayer =${showShadeLayer};//是否显示遮罩层（开启编辑模式）
	var companyId='${companyId}';
	var pageNumber='${pageNumber}';
	var totalPage='${totalPage}';
	var ctx="${ctx}";
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
<script type="text/javascript"
		src="${ctxStatic}/js/v2/enterpriseCustom/certificatesSubpage.js"></script>
</body>
</html>