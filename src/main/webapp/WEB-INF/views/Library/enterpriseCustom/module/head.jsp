<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>

<!-- 处理图片路径 -->
<c:set var="isDefault" value="false" />
<c:choose>
	<c:when test="${empty headMsg.getStr('img')}">
		<c:set var="headImg"
			value="${ctxStatic}/img/v2/enterpriseCustom/head_banner.jpg" />
		<c:set var="isDefault" value="true" />
	</c:when>
	<c:otherwise>
		<c:set var="headImg" value="${headMsg.getStr('img')}" />
		<c:if test="${fn:contains(headImg,'head_banner')}">
			<c:set var="isDefault" value="true" />
		</c:if>
	</c:otherwise>
</c:choose>
<script>
	var bgImgUrl = 'url(${headImg})';
	var isDefault = '${isDefault}';
</script>
<div class="joedar_header">
	<div class="joedar_header_left">
		<div class="joedar_logo">
			<p>
				<a href="${ctx}"><img src="${ctxStatic}/img/v2/enterpriseCustom/logo.png" alt=""></a>
			</p>
		</div>
		<div style="float:left;width:22px;height:42px;border-left:1px solid #ccc;margin-top:13px;"></div>
		<div class="joedar_firm">
		
			<!-- logo上传弹框start -->
			<style>
				.logo_shade{
					position: absolute;
					width:164px;
					height:54px;
				    background-color: black;
				    top: 8px;
				    z-index: 999;
				    opacity: 0.7;
				    display: none;
				    cursor: move;
				}
				.logo_bar{
					display: none;
					position: absolute;
					top: 18px;
					right:40px;
					z-index: 1000;
				}
				.logo_bar a{
				    color: #000;
				    background-color: #f5f1f1;
				    width: 40px;
				    height: 25px;
				    display: inline-block;
				    border-radius: 2px;
				    text-align: center;
				    line-height: 25px;
				    cursor:pointer;
				}
				.logobox{
					display: none;
					position: fixed;
					z-index: 9999;
					background-color: #fff;
				    border: 6px rgba(122,122,122,.6) solid;
				    padding: 1px;
				    width:600px;
				    height: 180px;
				}
				.logobox h2{
					height: 35px;
				    font-size: 14px;
				    background-color: #f6f6f6;
				    position: relative;
				    padding-left: 10px;
				    line-height: 35px;
				    color: #000;
				}
				.logobox h2 a{
				    position: absolute;
				    right: 10px;
				    top: 10px;
				    font-size: 12px;
				    color: #000;
				    background: url(/llhb/static/img/v2/enterpriseCustom/flase.png)no-repeat;
				    width: 16px;
				    height: 16px;
				    cursor: pointer;
				}
				.logobox_div{
					margin-top: 40px;
					margin-left: 20px;
					
				}
				.logobox .ensure{
					position: absolute;
				    right: 25px;
				    bottom: 32px;
				}
				.logobox .ensure a{
					background-color: #145f00;
				    text-align: center;
				    height: 28px;
				    display: inline-block;
				    line-height: 28px;
				    border-radius: 4px;
				    color: #fff;
				    margin-left: 10px;
				}
				.logobox .ensure .abolish{
					background-color: #d9d9d9;
				    text-align: center;
				    height: 28px;
				    display: inline-block;
				    line-height: 28px;
				    border-radius: 4px;
				    color: #000;
				    padding: 0;
				}
				.logobox .ensure span{
					display: inline-block;
				    width: 62px;
				    padding-bottom: 15px;
				    text-align: center;
				    color: white;
				}
			</style>
			<div class="logo_shade"></div>
			<div class="logo_bar">
				<a href="javascript:void(0);" title="设置" class="showlogobox">设置</a>
			</div>
			<div class="logobox">
				<h2>
					logo设置：
					<span style="width:auto;color:#b5a9a9;font-size:14px;font-weight:normal">建议图片最佳尺寸 165×55</span>
					<a class="closeLogoBox"></a>
				</h2>
				<div class="logobox_div">
					<span style="color: #145f00;">公司logo：</span>
					<input	type="text" class="logoUrl" readonly="readonly" name="licenseImg" style="width: 210px;" value="${headMsg.get("logoImg")}"> 
					<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
					<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg1" class="logoImg" name="files"/>
					<input type="button" id="${headMsg.get("logoImg")}" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
					<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
				</div>
				<div class="ensure">
					<a href="javascript:void(0);" class="logbox_sure"><span>确定</span></a>
					<a href="javascript:void(0);" class="cancel logbox_cancel"><span class="abolish close">取消</span> </a>
				</div>
			</div>
			<!-- logo上传弹框end -->
			<p>
				<c:choose>
					<c:when test="${empty headMsg.get('logoImg')}">
						<a href="${ctx}/Library/enterpriseCustom/${headMsg.get('companyId')}"><img id="logoImgTag" style="width: 165px;height: 55px;border: 1px solid #efefef;" src="${headMsg.get('logoImg')}"  alt=""/></a>
					</c:when>
					<c:otherwise>
						<a href="${ctx}/Library/enterpriseCustom/${headMsg.get('companyId')}"><img id="logoImgTag" style="width: 165px;height: 55px;" src="${headMsg.get('logoImg')}"  alt=""/></a>
					</c:otherwise>
				</c:choose>
			</p>
		</div>
		<div class="joedar_medal" style="width: 200px; height: 70px; float: right;">
		  <p style="background: url(${ctxStatic}/img/v2/enterpriseCustom/youyi-${headMsg.get("youyiFlag")==1?'':'not'}active.png) no-repeat;width:42px;height:62px;float:left;margin-left: 12px;"></p>
		  <p style="background: url(${ctxStatic}/img/v2/enterpriseCustom/company-${headMsg.get("authFlag")==1?'':'not'}active.png) no-repeat;width:42px;height:62px;float:left;margin-left: 20px;"></p>
		  <p style="background: url(${ctxStatic}/img/v2/enterpriseCustom/personal-${headMsg.get("xFlag")==1?'':'not'}active.png) no-repeat;width:42px;height:62px;float:left;margin-left: 20px;"></p>
		</div>
	</div>
</div>
<div class="joedar_middle headBg"
	style="width: 100%; height: 168px; position: relative; background-image:url(${headImg});background-repeat:no-repeat; background-size: 100% 100%;">
	<div class="bjs" style="display: none;"></div>
	<div class="box-bar" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox">设置</a>
		<!-- <a href="javascript:void(0);" title="删除" class="remove">删除</a> -->
		<a href="javascript:void(0);" title="添加" class="addModule"
			style="width: 80px">添加模块</a>
	</div>

	<div class="box" style="display: none;height:589px">
		<h2>
			<a href="#" class="close"></a>
		</h2>
		<div class="mainlist" style="">
			<p style="margin: 15px 0;">
				<span style="display: inline-block;">招牌图片:</span>
				<span style="border-top: 1px solid gray; width: 500px; height: 3px; padding: 0; margin-left: 5px; display: inline-block;"></span>
			</p>

			<span style="float: left; width: 180px; text-align: left;">
			<input type="radio" checked="checked" name="Sex" value="male"
				class="defualtBgImg" style="margin: 0; width: 15px; height: 15px;">
			<em
				style="margin-left: 10px; font-style: normal;">默认背景图片</em>
			</span> <span style="float: left; width: 375px; text-align: left;">
			<input
				type="radio" name="Sex" value="female" class="customBgImg"
				style="margin: 0; width: 15px; height: 15px;">
			<em
				style="margin-left: 10px; font-size: 14px; font-style: normal;">自定义背景图片</em>
			</span> <span class="miniHeadBgImg"
				style="width: 576px; height: 40px; background-image:url(${headImg});background-repeat:no-repeat;"></span>
			<div class="row_right font1 tupian" style="margin: 15px 0 0 -6px;">
				<div class="uploadImgDiv" style="display: none">
					<form class="uploadImg" method="post"
						action="enterpriseCustom/verifyUploadImage"
						enctype="multipart/form-data">
						<input type="button" class="button" value="选择图片" />
						<input
							type="file"
							style="position: absolute; left: 30px; opacity: 0.0; filter: alpha(opacity = 0);"
							id="headBgImg" class="headBgImg" name="files" />
							<span style="width:auto;color:#b5a9a9;font-size:14px;">建议图片最佳尺寸 1920×168 </span>
					</form>
				</div>
			</div>
			<p style="margin: 25px 0 0 0;">
				<span style="display: inline-block;">企业简介:</span>
				<span
					style="border-top: 1px solid gray; width: 500px; height: 3px; padding: 0; margin-left: 5px; display: inline-block;"></span>
			</p>
			<span style="font-size: 14px;">公司名称</span>
			<input type="text"
				class="companyNameInput"
				style="width: 500px; height: 34px; margin: 5px 0 0px 5px;" maxlength="30" value="${headMsg.getStr('name')}" />
			<p style="font-size: 11px;margin-bottom: 20px;text-indent: 7em;color: #b5a9a9;">（公司名称请与营业执照上的保持一致，最多输入30个字）</p>
				
			<span style="font-size: 14px;">主营业务</span>
			<input type="text" class="summaryInput"
			style="width: 500px; height: 34px; margin-left: 5px;" maxlength="130" value="${headMsg.getStr('major')}"/>
			<p style="font-size: 11px;text-indent: 7em;color: #b5a9a9;">（主营业务最多输入130个字）</p>
			
			<div class="ensure">
				<a href="javascript:void(0);" class="updateHeadMsg"><span>确定</span></a>
				<a href="javascript:void(0);" class="cancel"><span
					class="abolish close">取消</span> </a>
			</div>
		</div>

	</div>
	<div class="joedar_middle_left">
		<div class="corporation">
			<h2 class="headCompanyName">${headMsg.getStr('name')}</h2>
			<span class="headSummary">${headMsg.getStr('major')}</span>
		</div>
	</div>
</div>