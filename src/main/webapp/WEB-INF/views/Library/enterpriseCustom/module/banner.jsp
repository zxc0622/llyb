<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<div class="main">
	<div class="zhe_z2" style="display: none;"></div>
	<div class="box-bar3" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox4">设置</a>
		<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
	</div>
	<div class="box4" style="display: none;">
		<h2>
			Banner设置： <span style="width:auto;color:#b5a9a9;font-size:14px;font-weight:normal">建议图片最佳尺寸 1920×450 </span><a class="close"></a>
		</h2>
		<div class="mainlist" style="">
			<div class="ensure">
				<a href="javascript:void(0);"><span class="submitBanner">确定</span> </a> 
				<a href="javascript:void(0);"><span class="abolish close deleteBn">取消</span></a>
			</div>
			<form class="uploadImg" method="post" action="enterpriseCustom/verifyUploadImage" enctype="multipart/form-data">
				<div class="row_right font1 tupian"
					style="margin: 20px 0 0 15px; color: #145f00;">
					<div style="width: 600px;" class="flie_banner bn">
						<span style="color: #145f00;">链接1</span>
						<input	type="text" class="bigbanner" name="licenseImg"	value="http://" style="width: 210px;"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg1" class="bnImg" name="files"/>
						<input type="button" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
					<div style="width: 600px;" class="flie_banner bn">
						<span style="color: #145f00;">链接2</span> 
						<input	type="text" class="bigbanner" name="licenseImg"	value="http://" style="width: 210px;"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg2" class="bnImg" name="files"/>
						<input type="button" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
					<div style="width: 600px;" class="flie_banner bn">
						<span style="color: #145f00;">链接3</span> 
						<input	type="text" class="bigbanner" name="licenseImg"	value="http://" style="width: 210px;"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg3" class="bnImg" name="files"/>
						<input type="button" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
					<div style="width: 600px;" class="flie_banner bn">
						<span style="color: #145f00;">链接4</span> 
						<input	type="text" class="bigbanner" name="licenseImg"	value="http://" style="width: 210px;"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg4" class="bnImg" name="files"/>
						<input type="button" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
					<div style="width: 600px;" class="flie_banner bn">
						<span style="color: #145f00;">链接5</span> 
						<input	type="text" class="bigbanner" name="licenseImg"	value="http://" style="width: 210px;"> 
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:320px;opacity:0.0;filter:alpha(opacity=0);" id="bnImg5" class="bnImg" name="files"/>
						<input type="button" class="showImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="删除图片"/>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div class="flexslider">
	  <ul class="slides headUl">
		<c:forEach items="${banners}" var="img" varStatus="sta">
			<li>
				<div class="img">
					<a href="${img.getStr('img_link')}">
						<img src="${img.getStr('img_url')}" id="id${img.getInt('id')}" style="height:450px;width:100%" alt="">
					</a>
				</div>
			</li>
		</c:forEach>
		<c:if test="${empty banners}">
			<li>
				<div class="img">
					<a href="">
						<img src="${ctxStatic}/img/v2/enterpriseCustom/ad_yuetu.jpg" style="height:450px;width:100%" alt="">
					</a>
				</div>
			</li>
		</c:if>
	  </ul>
	</div>
</div>
