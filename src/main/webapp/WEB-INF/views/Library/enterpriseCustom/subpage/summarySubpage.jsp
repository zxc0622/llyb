<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-企业简介</title>
	<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
	<link href="${ctxStatic}/css/v2/enterpriseCustom/enterpriseCustom.css"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/layui/css/layui.css" />
	<link rel="stylesheet" type="text/css"
		href="${ctxStatic}/flexslider/flexslider.css" />
	<style type="text/css">
		.recommend .recommend_top .recommend_message .companyMsg {color:${empty companyMsgColor?"#000":companyMsgColor}}
		.recommend .recommend_top .companyMsg {color:${empty companyMsgColor?"#000":companyMsgColor}}
	</style>
</head>
<body>
<!--头部模块 -->
<%@ include file="../module/head.jsp"%>
<!--导航栏模块 -->
<%@ include file="../module/navigation.jsp"%>
<div class="introduce">
	<p class="introduce_jjie">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">${pagename}</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">Introduce</b>
	</p>
	<div class="zhe_z16"></div>
	<div class="box-bar16" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox16">设置</a> <a
			href="javascript:void(0);" title="删除" class="remove16">删除</a>
	</div>
	<div class="box16" style="display: none;">
		<h2>
			<a class="close"></a>
		</h2>
		<div class="mainlist">
			<div style="width: 540px; margin: 0 auto; margin-top: 20px;">
				<p class="biao_ti"
					style="height:25px;line-height:28px;cursor:pointer;width:78px;float:left;background:url(${ctxStatic}/img/v2/enterpriseCustom/compile.png) right no-repeat;margin-right:5px;">
					标题设置:</p>
				<!-- <img src="${ctxStatic}/img/v2/enterpriseCustom/compile.png"> -->
				<input type="text" class="yin_c"
					style="display: block; margin: 5px 0 0 0;" />
				<div class="ensure">
					<a class="sure_1"><span>确定</span>
					</a> <a class="cancel_1"><span class="abolish">取消</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="recommend">
	<!-- 处理图片路径 -->
	<c:choose>
		<c:when test="${empty summary.img}">
			<c:set var="descImg"
				value="${ctxStatic}/img/v2/enterpriseCustom/company_bg.jpg" />
		</c:when>
		<c:otherwise>
			<c:set var="descImg" value="${summary.img}" />
		</c:otherwise>
	</c:choose>
	<div class="recommend_top">

		<img class="recommend_top_img" src="${descImg}" alt="" />

		<div class="zhe_z17"></div>
		<div class="box-bar17" style="display: none;">
			<a href="javascript:void(0);" title="设置" class="showbox17">设置</a> <a
				href="javascript:void(0);" title="删除" class="remove17">删除</a>
		</div>

		<div class="box17" style="display: none;">
			<h2>
				<a class="close"></a>
			</h2>
			<div class="mainlist">
				<div style="width: 540px; margin: 0 auto; margin-top: 20px;">
					<p class="biao_ti"
						style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
						联 系 人:</p>
					<input type="text" class="yin_c comContact"
						style="display: block; margin: 5px 0 0 0; width: 435px; margin-bottom: 20px;"
						value="${company.contact}" />

					<p class="biao_ti"
						style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
						公司电话:</p>
					<input type="text" class="yin_c comPhoneEn"
						style="display: block; margin: 5px 0 0 0; width: 435px; margin-bottom: 20px;"
						value="${company.phoneenterprise}" />

					<p class="biao_ti"
						style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
						公司邮箱:</p>
					<input type="text" class="yin_c comEmail"
						style="display: block; margin: 5px 0 0 0; width: 435px;"
						value="${company.email}" />

					<div class="ensure">
						<a class="box17_sure"><span>确定</span>
						</a> <a class="box17_cancel"><span class="abolish">取消</span>
						</a>
					</div>
					
					<p style="float:left;margin-top:20px;">
						修改<strong>文字</strong>颜色
						<a href="javascript:void(0)" class="companyMsgColor" style="width:25px;height:25px;background-color:${empty companyMsgColor?'#FFF':companyMsgColor};display:inline-block;border:1px solid #ccc;"></a>
					</p>
				</div>
			</div>
		</div>

		<h3 class="companyMsg" id="ccname">${company.companyname}</h3>
		<div class="recommend_message">
			<p class="companyMsg" id="ccontact">联系人：${company.contact}</p>
			<p class="companyMsg" id="cphone">公司电话：${company.phoneenterprise}</p>
			<p class="companyMsg" id="cemail">公司邮箱：${company.email}</p>
			<span class="companyMsg"> 
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${company.youyi_flag == 1}"> --%>
<!-- 				       		优蚁认证<b style="color: red;">[已认证]</b> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 							优蚁认证<b style="color: #ccc;">[未认证]</b> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose>  --%>
				<c:choose>
					<c:when test="${company.auth_flag == 1}">
				       		企业认证<b style="color: red;">[已认证]</b>
					</c:when>
					<c:otherwise>
							企业认证<b style="color: #ccc;">[未认证]</b>
					</c:otherwise>
				</c:choose> 
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${company.x_flag == 1}"> --%>
<!-- 				       		个人认证<b style="color: red;">[已认证]</b> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 							个人认证<b style="color: #ccc;">[未认证]</b> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose>  --%>
				</span>
		</div>

	</div>
	<div class="recommend_bottom">
<%-- 		<h2 style="color:${wordcolor};">${descName}</h2> --%>
		<h2 style="color:#000;">${descName}</h2>
		<div class="recommend_referral">
<%-- 			<p style="text-indent: 2em; word-break: break-all; min-height: 248px; overflow: hidden;color: ${wordcolor}"> --%>
			<p style="text-indent: 2em; word-break: break-all; min-height: 248px; overflow: hidden;color:#000">
				${company.shopDesc}
				<!-- <a href="" style="color:red;">[详细资料]</a> -->
			</p>
		</div>
	</div>
</div>

<div class="enroll">
	<div class="zhe_z18"></div>
	<div class="box-bar18" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox18">设置</a> <a
			href="javascript:void(0);" title="删除" class="remove18">删除</a>
	</div>

	<div class="box18" style="display: none;">
		<h2>
			注册信息设置<span style="width:auto;color:#b5a9a9;font-size:14px;font-weight:normal">（左侧图片最佳尺寸 480×420）</span><a class="close"></a>
		</h2>
		<div class="mainlist">
			<div style="width: 620px; margin: 0 auto; margin-top: 20px;">
				<div>
					<span>左侧图片：</span> <input type="text"
						class="sumLeftImg" name="sumLeftImg" style="width: 210px;"
						value="${summary.subpage_left_img}"> <input type="button"
						class="selectImg" style="margin: 0px 10px; width: 70px;"
						value="选择图片" /> <input type="file"
						style="margin: 0px 10px; width: 70px; position: absolute; left: 320px; opacity: 0.0; filter: alpha(opacity = 0);"
						id="summarySubpageImg" class="leftImg" name="files" /> <input type="button"
						id="${summary.subpage_left_img}" class="showLeftImg"
						style="margin: 0px 10px; width: 70px;" value="预览图片" /> <input
						type="button" class="deleteLeftImg"
						style="margin: 0px 10px; width: 70px;" value="删除图片" />
				</div>
				<p class="biao_ti"
					style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
					注册地址:</p>
				<input type="text" id="reg_address" class="yin_c"
					style="display: block; margin: 5px 0 0 0; width: 445px; margin-bottom: 20px;"
					value="${company.address}" />
				<p class="biao_ti"
					style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
					注册资金:</p>
				<input type="text" id="reg_fund" class="yin_c"
					style="display: block; margin: 5px 0 0 0; width: 445px; margin-bottom: 20px;"
					value="${company.registeredfund}" />
				<p class="biao_ti"
					style="height:25px;line-height:28px;cursor:pointer;width:70px;float:left;margin-right:5px;">
					主营业务:</p>
				<textarea type="text" id="reg_mainbusiness" class="yin_c" 
				style="display: block; margin: 5px 0 0 0; width: 445px; 
				margin-bottom: 20px; height: 90px; border: 1px solid #e3e3e3;">${company.major}</textarea>
					<div>
						<span>营业执照：</span>
						<input	type="text" class="licenseImg" name="licenseImg" style="width: 210px;" value="${company.licenseimg}"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg2" class="licenseimgUp" name="files"/>
						<input type="button" id="${company.licenseimg}" class="showLicenseImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteLicenseImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
					<div class="ensure">
						<a class="box18_sure"><span style="display: inline-block;">确定</span></a>
						<a class="box18_cancel"><span class="abolish">取消</span></a>
					</div>
				</div>
		</div>
	</div>
	<!-- 处理图片路径 -->
	<c:choose>
		<c:when test="${empty summary.subpage_left_img}">
			<c:set var="leftImg"
				value="${ctxStatic}/img/v2/enterpriseCustom/enroll_left.jpg" />
		</c:when>
		<c:otherwise>
			<c:set var="leftImg" value="${summary.subpage_left_img}" />
		</c:otherwise>
	</c:choose>
	<div class="enroll_left"
		style="background: url(${leftImg}) no-repeat;;"></div>
	<div class="enroll_right">
		<div class="zhu_ce">
			<p>
				<b>注册名称:</b><span>${company.companyname}</span>
			</p>
			<p>
				<b>注册地址:</b><span id="box18address">${company.address}</span>
			</p>
			<p>
				<b>注册资金:</b><span id="box18fund">${company.resfund}</span>
			</p>
			<p>
				<b style="float: left;">主营业务:</b><span class="business">${company.major}</span>
			</p>
			<p style="clear: both;">
				<b style="float: left;">营业执照:</b><img class="license"
					src="${company.licenseimg}"></span>
			</p>
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
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/summarySubpage.js"></script>
</body>
</html>