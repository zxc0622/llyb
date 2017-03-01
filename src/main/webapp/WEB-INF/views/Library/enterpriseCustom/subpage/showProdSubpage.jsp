<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-产品展示</title>
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
<div class="Product_show">
	<p class="Product_cp">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">产品展示</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">Products</b>
	</p>
</div>
<div class="Joedar_facility">
	<!--这里下面是那个隐藏的盒子 -->

	<div class="box20" style="display: none;">
		<h2>
			操作产品<a class="close"></a>
		</h2>
		<div class="mainlist" id="add">
			<div class="mt prodTypeSelector">
				<p class="biao_ti">商品分类:</p>
				<select class="firstType"
					style="margin-left: 10px; width: 155px; height: 34px; border: 1px solid #e3e3e3; float: left;">
					<option value="-1">其他</option>
				</select> <select class="secondType"
					style="margin-left: 10px; width: 155px; height: 34px; border: 1px solid #e3e3e3; float: left;">
					<option value="-1">其他</option>
				</select> <select class="thirdType"
					style="margin-left: 10px; width: 155px; height: 34px; border: 1px solid #e3e3e3; float: left;">
					<option value="-1">其他</option>
				</select>
			</div>
			<div class="mt">
				<p class="biao_ti" style="clear: both; margin-top: 20px;">商品名称:</p>
				<input class="prodName" type="text"
					style="margin-top: 20px; border: 1px solid #e3e3e3; height: 34px; margin-left: 10px; width: 318px;"
					maxlength="15"> <span style="color:#a09d99; width:120px;">最多输入15个字</span>
			</div>
			<div class="mt">
				<p class="biao_ti">商品来源:</p>
				<select class="firstArea"
					style="margin-left: 10px; width: 235px; height: 34px; border: 1px solid #e3e3e3; float: left;">
					<option value="other">其他</option>
				</select> <select class="secondArea"
					style="margin: 0 0 20px 16px; width: 235px; height: 34px; border: 1px solid #e3e3e3; float: left;">
					<option value="other">其他</option>
				</select>
			</div>
			<div class="mt" style="clear: both;">
				<p class="biao_ti">商品说明:</p>
				<textarea class="prodDesc" rows="10" cols="68"
					style="border: 1px solid #e3e3e3; margin-left: 10px;"></textarea>
				<p
					style="display: block; padding-top: 10px; margin-left: 108px; color: #a09d99;">建议您描述以下方面:产品性能及优点、用途、售后服务、包装等</p>
			</div>
			<div class="prodPicDiv" style="margin-top: 15px;">
				<p class="biao_ti">产品图一:</p>
				<input type="text" readonly="readonly" class="prodPicUrl"
					name="licenseImg" value="" style="width: 210px;"> <input
					type="button" class="selectImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="选择图片" />
					<input type="file"
					style="height: 25px; margin: 0px 10px; width: 70px; position: absolute; left: 390px; opacity: 0.0; filter: alpha(opacity =   0);"
					id="prodPic1" class="prodPic" name="files" /> <input type="button"
					class="showImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="预览图片" />
					<input type="button" class="deleteImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="删除图片" />
			</div>
			<div class="prodPicDiv" style="margin-top: 15px;">
				<p class="biao_ti">产品图二:</p>
				<input type="text" readonly="readonly" class="prodPicUrl"
					name="licenseImg" value="" style="width: 210px;"> <input
					type="button" class="selectImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="选择图片" />
					<input type="file"
					style="margin: 0px 10px; height: 25px; width: 70px; position: absolute; left: 390px; opacity: 0.0; filter: alpha(opacity =   0);"
					id="prodPic2" class="prodPic" name="files" /> <input type="button"
					class="showImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="预览图片" />
					<input type="button" class="deleteImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="删除图片" />
			</div>
			<div class="prodPicDiv" style="margin-top: 15px;">
				<p class="biao_ti">产品图三:</p>
				<input type="text" readonly="readonly" class="prodPicUrl"
					name="licenseImg" value="" style="width: 210px;"> <input
					type="button" class="selectImg"
					style="height: 25px; margin: 0px 10px; width: 70px;" value="选择图片" />
					<input type="file"
					style="margin: 0px 10px; height: 25px; width: 70px; position: absolute; left: 390px; opacity: 0.0; filter: alpha(opacity =   0);"
					id="prodPic3" class="prodPic" name="files" /> <input type="button"
					class="showImg"
					style="margin: 0px 10px; width: 70px; height: 25px;" value="预览图片" />
					<input type="button" class="deleteImg"
					style="margin: 0px 10px; width: 70px; height: 25px;" value="删除图片" />
			</div>
			<div class="mt">
				<p class="biao_ti">过期时间:</p>
				<input class="layui-input pastTime" style="margin:0 0 20px 10px;float:left;width:210px;" placeholder="" onclick="layui.laydate({elem:this,festival:true})"/>
			</div>
			<div class="mt" style="clear: both;">
				<p class="biao_ti">产品属性:</p>
				<p class="" style="width: 598px;">
					产品单价:<input class="lowPrice" type="text" class=""
						style="width: 100px;">~ <input type="text"
						class="highPrice" style="width: 100px; margin-left: 0;">元/
							<select class="prodUnit"
							style="width: 100px; height: 34px; border: 1px solid #e3e3e3;">
						</select> <b style="position: relative;"><input type="checkbox"
								class="priceCheck" name="vehicle" value="Bike"
								style="width: 15px; height: 15px; padding-top: 10px; margin: 0; position: absolute; top: 0; left: 5px;" />
						</b> <span style="padding-left: 18px; color: #a09d99;">价格面议</span>
							<p style="margin: 6px 0 0 97px;">
								供应总量:<input class="amount" type="text" style="width: 100px;">
							</p>
				</p>
			</div>
			<div class="ensure">
				<a class="box20_cancel submintProd">保存</a> <a
					class="box20_cancel close">取消</a>
			</div>
		</div>
	</div>
	<div class="main-page">
		<div class="left" style="overflow: auto;overflow-x:hidden;">
			<h4
				style="height: 35px; text-align: center; width: 248px; border-bottom: 1px solid #094400; line-height: 35px; font-weight: normal; color: #fff;">产品展示</h4>
			<div class="nav-back"></div>
			<div class="nav">
				<c:forEach items="${prodFirstType}" var="firstType"
					varStatus="status">
					<c:if test="${status.index==0 }">
						<div id="${firstType.id }" class="on">${firstType.name }</div>
					</c:if>
					<c:if test="${status.index>0 }">
						<div id="${firstType.id }">${firstType.name }</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="right">
			<div class="content-back"></div>
			<div class="content">
				<div class="contentsub">
					<ul>
						<c:forEach items="${prodList}" var="prod">
							<li id="${prod.id}" class="prod">
								<div style="width: 219px;height:260px;">
									<img src="${prod.pic1 }" />
								</div>
								<p>${prod.pro_name }</p>
							</li>
						</c:forEach>
						<li class="addProd"	style="display:${showShadeLayer?'block':'none'}">
							<img src="${ctxStatic}/img/v2/enterpriseCustom/addProd.png" class="showbox20">
							<p>点击添加产品</p>
						</li>
					</ul>
					<div id="p0" style="height: 34px; width: 480px;" class="pagination"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<!--页面底部-->
<%@ include file="../module/bottom.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script>
	var ctxStatic='${ctxStatic}';//静态文件路径
	var basePath = '${basePath}';
	var showShadeLayer =${showShadeLayer};//是否显示遮罩层（开启编辑模式）
	var companyId='${companyId}';
	var typeSum = ${prodFirstType.size()};
	var totalPage = ${totalPage};
	layui.use('laydate');
</script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-ui.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.bigcolorpicker.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctxStatic}/flexslider/jquery.flexslider.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eYf9sA6yVTFHlh9ytU4a0EYY&services=&t=20160513110936"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/library.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/v2/enterpriseCustom/showProdSubpage.js"></script>
</body>
</html>