<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set var="imgUrl"
	value="${empty teamMsg.getStr('img_url')?'':teamMsg.getStr('img_url')}"></c:set>
<c:if test="${empty imgUrl}">
	<c:set var="imgUrl"
		value="${ctxStatic}/img/v2/enterpriseCustom/team_figure.jpg"></c:set>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-团队实力</title>
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
<div class="team_strength">
	<p class="team_sl">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">团队实力</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">company
			ablility </b>
	</p>
</div>
<div class="team_figure"
	style='background-repeat:no-repeat;background-image: url(${imgUrl});'>
	<div class="zhe_z41" style="display: none;"></div>
	<div class="box-bar41" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox41">设置</a>
	</div>
	<div class="box41" style="display: none;">
		<h2>
			背景图片设置 <span
				style="width: auto; color: #b5a9a9; font-size: 14px; font-weight: normal">建议图片最佳尺寸
				1200×340 </span><a class="close"></a>
		</h2>
		<div class="mainlist">
			<div style="width: 540px; margin: 0 auto; margin-top: 20px;">
				<p class="bgbt"
					style="height:25px;line-height:28px;cursor:pointer;width:78px;float:left;background:url(${ctxStatic}/img/v2/enterpriseCustom/compile.png) right no-repeat;margin-right:5px;">
					图片设置:</p>
				<input type="text" readonly class="yin_c teamImgUrl" value="${imgUrl}"
					style="margin: 5px 0 0 0; width: 265px;" maxlength="30"><input
					type="button" class="selectTeamImg"
					style="margin: 0px 10px; width: 70px;" value="选择图片" /> <input
					type="file"
					style="margin: 0px 10px; width: 70px; position: absolute; left: 380px; opacity: 0.0; filter: alpha(opacity =0);"
					id="teamImg" class="teamImg" name="files" /> <input type="button"
					class="showTeamImg" id="${imgUrl}" style="margin: 0px 10px; width: 70px;"
					value="预览图片" />
				<div class="ensure">
					<a href="javascript:void(0);"><span class="submintTeamImg">确定</span>
					</a> <a href="javascript:void(0);"><span class="abolish close">取消</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="team_text">
	<p class="team_left">${empty
		teamMsg.getStr('summary')?'成功源自于完美的团队！':teamMsg.getStr('summary') }</p>
	<div class="team_right">
		<div class="team_person">
			<p style="margin-left: 60px; font-size: 14px;">公司员工</p>
			<p style="margin-left: 60px;">
				<b style="font-size: 26px;" class="employee">${empty
					teamMsg.getStr('employee')?"0":teamMsg.getStr('employee') }</b>人
			</p>
		</div>
		<div class="team_experts">
			<p style="margin-left: 60px; font-size: 14px;">专家团队</p>
			<p style="margin-left: 60px;">
				<b style="font-size: 26px;" class="experts">${empty
					teamMsg.getStr('experts')?"0":teamMsg.getStr('experts') }</b>人
			</p>
		</div>
		<div class="team_patent">
			<p style="margin-left: 60px; font-size: 14px;">专利技术</p>
			<p style="margin-left: 60px;">
				<b style="font-size: 26px;" class="patent">${empty
					teamMsg.getStr('patent')?"0":teamMsg.getStr('patent') }</b>件
			</p>
		</div>
	</div>
	<div class="zhe_z39"></div>
	<div class="box-bar39" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox39">设置</a>
	</div>
	<div class="box39" style="display: none;">
		<h2>
			团队概况<a class="close"></a>
		</h2>
		<div class="mainlist">
			<div style="width: 540px; margin: 0 auto; margin-top: 20px;">
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 83px; float: left; background: url(images/compile.png) right no-repeat; margin-right: 5px;">
					公司员工：</p>
				<input type="text" class="yin_c employee"
					style="display: block; margin: 5px 0 0 0;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 83px; float: left; background: url(images/compile.png) right no-repeat; margin-right: 5px;">
					专家团队：</p>
				<input type="text" class="yin_c experts"
					style="display: block; margin: 5px 0 0 0;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 83px; float: left; background: url(images/compile.png) right no-repeat; margin-right: 5px;">
					专利技术：</p>
				<input type="text" class="yin_c patent"
					style="display: block; margin: 5px 0 0 0;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 83px; float: left; background: url(images/compile.png) right no-repeat; margin-right: 5px;">
					团队简介：</p>
				<textarea rows="10" cols="30" class="summary" autofocus
					style="border: 1px solid #eee;" maxlength="350"></textarea>
				<p style="font-size: 11px; text-indent: 1em; color: #b5a9a9;">（团队简介最多输入350个字）</p>
				<div class="ensure">
					<a href="javascript:void(0);"><span class="submitTeamSummary">确定</span>
					</a> <a href="javascript:void(0);"><span class="abolish close">取消</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="technical">
	<div class="zhe_z40"></div>
	<div class="box-bar40" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox40">设置</a>

	</div>
	<div class="box40" style="display: none;">
		<h2>
			相册设置 <span
				style="width: auto; color: #b5a9a9; font-size: 14px; font-weight: normal">建议图片最佳尺寸
				200×240,最多5张图片</span> <a class="close"></a>
		</h2>
		<div class="mainlist">
			<div class="teamPic shade"
				style="width: 540px; margin: 0 auto; margin-top: 20px; display: none">
				<p class="biao_ti"
					style="height:25px;line-height:28px;cursor:pointer;width:78px;float:left;margin-right:5px;">
					图片标题:</p>
				<input type="text" class="yin_c picTitle"
					style="margin: 5px 0 0 0; width: 167px;" /> <input type="button"
					class="yin_c selectTeamImg" style="margin: 0px 10px; width: 70px;"
					value="已上传" /> <input type="file"
					style="margin: 0px 10px; width: 70px; position: absolute; left: 286px; opacity: 0.0; filter: alpha(opacity =   0);"
					id="uploadTeamPic" class="yin_c uploadTeamPic" name="files" /> <input
					type="button" class="yin_c showTeamPic"
					style="margin: 0px 10px; width: 70px;" value="预览" /> <input
					type="button" id="add" class="yin_c delTeamPic"
					style="margin: 0px 10px; width: 70px;" value="删除" />
			</div>
			<input type="button" class="yin_c addPic"
				style="margin: 20px 30px;width: 100px;float: right;" value="点击新增相册" />
			<div class="ensure">
				<a href="javascript:void(0);" class="submitPic"><span>确定</span>
				</a> <a href="javascript:void(0);"><span class="abolish close">取消</span>
				</a>
			</div>
		</div>
	</div>
	<h3>技术人员</h3>
	<ul class="engineer artisanPic">
		<c:forEach items="${artisanPicList}" var="artisanPic">
			<li>
				<div>
					<img src="${artisanPic.pic }" id="${artisanPic.key }"
						style="vertical-align: middle;">
					<p>${artisanPic.title }</p>
				</div></li>
		</c:forEach>
		<c:if test="${empty artisanPicList}">
			暂无相册！
		</c:if>
	</ul>
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
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/teamPowerSubpage.js"></script>
</body>
</html>