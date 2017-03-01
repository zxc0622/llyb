<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<c:choose>
<c:when test="${empty summaryMsg.getString('img')}">
<c:set var="summaryImg" value="${ctxStatic}/img/v2/enterpriseCustom/team.jpg" ></c:set>
</c:when>
<c:otherwise>
<c:set var="summaryImg" value="${summaryMsg.getString('img')}" ></c:set>
</c:otherwise>
</c:choose>
	<div class="Joedar_abstract" style="display: block;">
			<div class="the_right" style="display: none;"></div>
			<div class="left_img smBg" style="background:url(${summaryImg}) center no-repeat;background-size: 100%;">
			</div>
			<div class="abstract_right smBg" style="width:776px; height:380px; float: left; position: relative;">
				<img src="${summaryImg}" class="blur smImg" style="width:100%;height:100%">
				<div class="synopsis">
					<h2 class="smTitle summarywordcolor" style="color:${summaryMsg.getString('wordcolor')}">${summaryMsg.getString("title")}</h2>
					<p class="smDesc summarywordcolor" style="color:${summaryMsg.getString('wordcolor')}">${fn:substring(summaryMsg.getString("desc"),0,360)}...</p>
				</div>
			</div>
			<div class="box-bar5" style="display: none;">
				<a href="javascript:void(0);" title="设置" class="showbox5">设置</a> 
				<a href="javascript:void(0);" title="删除" class="remove5">删除</a>
				<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
			</div>
			<div class="box5" style="display: none;">
				<h2>
					<span class="smTitle">${summaryMsg.getString("title")}</span>设置:<span style="width:auto;color:#b5a9a9;font-size:14px;font-weight:normal">建议图片最佳尺寸 424×380 </span><a class="close"></a>
				</h2>
				<div class="mainlist">
					<div style="width: 535px; margin: 0 auto; margin-top: 20px;" id="sm${summaryMsg.getInt('id')}" class="setSummary">
						<p class="biao_ti" style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
							标题设置:</p>
						<input type="text" class="yin_c smTitle" value="${summaryMsg.getString('title')}" style="margin: 5px 0 0 0;width: 166px;" maxlength="30">
						<input type="button" class="selectImg" style="margin:0px 10px;width:70px;" value="选择图片"/>
						<input type="file" style="margin:0px 10px;width:70px;position:absolute;left:290px;opacity:0.0;filter:alpha(opacity=0);" id="summaryImg" class="summaryImg" name="files"/>
						<input type="button" class="showSmImg" style="margin:0px 10px;width:70px;" value="预览图片"/>
						<input type="button" class="deleteImg" style="margin:0px 10px;width:70px;" value="恢复默认"/>
						<p style="font-size: 11px;text-indent: 7em;color: #b5a9a9;">（标题最多输入30个字）</p>
						
						<p class="biao_ti" style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin: 20px 5px 0 0;">
							详细信息:</p>
						<textarea rows="10" cols="30" class="yin_c smDesc" 
							style="border:1px solid #e3e3e3;display: block; margin: 5px 0 0 0;
							 width: 438px; height: 100px; margin-top: 15px; 
							 margin-right: 5px;"maxlength="360">${summaryMsg.getString("desc")}</textarea>
						<p style="font-size: 11px;text-indent: 7em;color: #b5a9a9;">（详细信息最多输入360个字）</p>
					</div>
					
					<p style="float:left;margin-top:20px;text-indent: 4em;">
						修改<strong>文字</strong>颜色
						<a href="javascript:void(0)" id="summarywordcolor" style="width:25px;height:25px;background-color:${summaryMsg.getString('wordcolor')};display:block;margin-top:10px;margin-left: 100px;border:1px solid #ccc;"></a>
					</p>
					
					<div style="width: 530px; padding: 20px 0 0 20px;">
						<div class="ensure">
							<a href="javascript:void(0);"><span class="submitSummary">确定</span></a>
							<a href="javascript:void(0);"><span class="abolish close">取消</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>