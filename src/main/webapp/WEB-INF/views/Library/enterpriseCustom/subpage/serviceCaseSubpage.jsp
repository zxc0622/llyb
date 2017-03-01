<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-服务案例</title>
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
<div class="service_work">
	<p class="introduce_jjiee">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">服务案列</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">ServiceCases</b>
	</p>
</div>

<div class="service_time">
	<!-- 删除弹框 -->
	<div class="delBox" style="display: none;">
		<h2>
			删除案例<a class="closeDelBox"></a>
		</h2>
		<div class="mainlist">
			<p class="pcon">
				<strong><span id="caseName">
				</strong></span>将被<span style="color: red">删除</span>
			</p>
		</div>
		<input type="hidden" id="dcaseid" />
		<div class="delensure">
			<a class="del_sure">确定</a> <a class="del_cancel">取消</a>
		</div>
	</div>

	<!-- 增加或者修改的弹框 -->
	<div class="box20" style="display: none;">
		<h2>
			<span id="box20Name">修改案例</span><a class="closeBox20"></a>
		</h2>
		<div class="mainlist">

			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>案例名称:
				</p>
				<input type="text" maxlength="30" class="caseName" />
				<p style="font-size: 11px; text-indent: 9em; color: #b5a9a9;">（案例名称最多输入30个字）</p>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>案例类型:
				</p>
				<select class="cases1">
					<c:forEach items="${caseTypeList}" var="ctl">
						<option value="${ctl.id}">${ctl.name}</option>
					</c:forEach>
				</select>
				<select class="cases2">
					<c:forEach items="${caseTypeList2}" var="ct2">
						<option value="${ct2.id}">${ct2.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">&nbsp;&nbsp;</span>所属行业:
				</p>
				<select class="industrys1">
					<c:forEach items="${industryList}" var="il">
						<option value="${il.id}">${il.name}</option>
					</c:forEach>
				</select> <select class="industrys2">
					<c:forEach items="${industryList2}" var="il2">
						<option value="${il2.id}">${il2.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="mt" style="clear: both;">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>案例图片:
				</p>
				<div>
					<input type="text" class="casePic1" readonly
						style="width: 210px; height: 26px;" value=""> <input
						type="button" class="selectImg"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="选择图片" />
					<input type="file"
						style="margin: 0px 10px; width: 70px; position: absolute; left: 392px; opacity: 0.0; filter: alpha(opacity =   0);"
						id="casePic1" name="files" /> <input type="button" id=""
						class="showCasePic1"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="预览图片" />
					<input type="button" class="deleteCasePic1"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="删除图片" />
				</div>
				<div style="margin-left: 97px; margin-top: 5px;">
					<input type="text" class="casePic2" readonly
						style="width: 210px; height: 26px;" value=""> <input
						type="button" class="selectCasePic2"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="选择图片" />
					<input type="file"
						style="margin: 0px 10px; width: 70px; position: absolute; left: 392px; opacity: 0.0; filter: alpha(opacity =   0);"
						id="casePic2" name="files" /> <input type="button" id=""
						class="showCasePic2"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="预览图片" />
					<input type="button" class="deleteCasePic2"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="删除图片" />
				</div>
				<div style="margin-left: 97px; margin-top: 5px;">
					<input type="text" class="casePic3" readonly
						style="width: 210px; height: 26px;" value=""> <input
						type="button" class="selectCasePic3"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="选择图片" />
					<input type="file"
						style="margin: 0px 10px; width: 70px; position: absolute; left: 392px; opacity: 0.0; filter: alpha(opacity =   0);"
						id="casePic3" name="files" /> <input type="button" id=""
						class="showCasePic3"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="预览图片" />
					<input type="button" class="deleteCasePic3"
						style="margin: 0px 10px; width: 70px; height: 22px;" value="删除图片" />
				</div>
				<p style="font-size: 11px; text-indent: 9em; color: #b5a9a9;">（图片建议尺寸：1000*1000）</p>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">&nbsp;&nbsp;</span>工程价格:
				</p>
				<input type="number" style="width: 138px;" class="price" /> <span
					style="font-size: 11px; width: 90px; color: #b5a9a9;">（单位：元）</span>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width:0; color:red; display: inline;">*&nbsp;</span>项目耗时:
				</p>
				<input class="layui-input startTime" id="startTime" name="startTime" placeholder="开始时间" style="display:inline-block;width:138px;">
				~<input class="layui-input endTime" id="endTime" name="endTime" placeholder="结束时间" style="display:inline-block;width:138px;">
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>地址:
				</p>
				<select class="addresss1">
					<c:forEach items="${provinceList}" var="pl">
						<option value="${pl.id}">${pl.name}</option>
					</c:forEach>
				</select> <select class="addresss2">
					<c:forEach items="${cityList}" var="cl">
						<option value="${cl.id}">${cl.name}</option>
					</c:forEach>
				</select> <select class="addresss3">
				</select>
			</div>
			<div class="mt" style="clear: both;">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">&nbsp;&nbsp;</span>详细地址:
				</p>
				<input type="text" maxlength="50" class="detailAddress" />
				<p style="font-size: 11px; text-indent: 9em; color: #b5a9a9;">（详细地址最多输入50个字）</p>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>验收标准:
				</p>
				<input type="text" maxlength="100" class="checkStandard" />
				<p style="font-size: 11px; text-indent: 9em; color: #b5a9a9;">（验收标准最多输入100个字）</p>
			</div>
			<div class="mt">
				<p class="biao_ti">
					<span style="width: 0; color: red; display: inline;">*&nbsp;</span>案例详情:
				</p>
				<textarea type="text" class="caseDesc  ta" maxlength="300"
					style="height: 130px;"></textarea>
				<p style="font-size: 11px; text-indent: 9em; color: #b5a9a9;">（案例详情最多输入300个字）</p>
			</div>
			<input type="hidden" class="caseId" /> <input type="hidden"
				class="sora" />
			<div class="ensure">
				<a class="box20_sure">保存</a> <a class="box20_cancel">取消</a>
			</div>

		</div>
	</div>

	<ul class="serviceCaseUl">
		<li class="serviceCaseDesc fixed"
			style="background-color: #FFF; box-shadow: 1px 1px 1px 1px #888888; overflow: hidden;">
			<p
				style="padding: 20px 36px; font-size: 15px; color: #b3a7a7; width: 222px; height: 300px; overflow: hidden; word-break: break-all;">${pageContent[0].case_desc}</p>
		</li>

		<c:forEach items="${pageContent}" var="pc">
			<!--案例li-->
			<li class="serviceCaseItem">
				<img style="width: 295px; height: 320px;" src="${pc.pic1}">
				<p class="caseNameForClick"
					style="width: 275px; height: 67px;background-color: rgba(0, 0, 0, 0.72);; opacity: 0.9; font-size: 18px; padding: 0 10px; color: #fff; position: absolute; bottom: 70px; padding-top: 10px;">${pc.case_name}</p>
				<p style="text-align: left; font-size: 16px; color: #fff; line-height: 36px; text-indent: 4em;">
					发布时间：<fmt:formatDate value="${pc.create_date}" pattern="yyyy-MM-dd" />
				</p>
				<p style="text-align: left; font-size: 16px; color: #fff; text-indent: 4em;">
					施工时间：<fmt:formatDate value="${pc.start_time}" pattern="yyyy-MM-dd" />
				</p>
				<div class="zhe_z21"></div>
				<div class="box-bar21" style="display: none;">
					<a title="查看案例" class="lookCase" target="_blank" style="width: 60px"
						href="${ctx}/Library/serviceCase/detail/${companyId}${edit}-${pc.id}">查看案例</a>
					<a href="javascript:void(0);" title="修改案例" class="updateCase"
						style="width: 60px" id="${pc.id}">修改案例</a> <a
						href="javascript:void(0);" title="删除" class="remove20">删除</a>
				</div>
				<input class="caseDescForLeft" type="hidden" value='${pc.case_desc}'>
				<input class="caseUserId" type="hidden" value='${pc.user_id}'>
			</li>
		</c:forEach>
		<c:if test="${showShadeLayer}">
			<li class="fixed addCase" style="background-image: url(/llhb/static/img/v2/enterpriseCustom/addServiceCase.png);box-shadow: 1px 1px 1px 1px #888888;background-repeat: no-repeat;background-size: 100% 100%;cursor:pointer;">
				<!--  <div class="zhe_z21"></div>
				<div class="box-bar21" style="display: none;">
					<a href="javascript:void(0);" title="设置" class="addCase" style="width: 60px">新增案例</a>
				</div>-->
			</li>
		</c:if>
	</ul>
</div>
<div style="clear: both;"></div>

<div style="width: 1200px;margin: 0 auto;">
	<!-- 分页插件 -->
	<div id="serviceCasePagingDiv" style="height:34px;" class="pagination"></div>
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
	var pageNumber='${pageNumber}';
	var totalPage='${totalPage}';
	var ctx="${ctx}";
	var laydate;
	layui.use('laydate', function(){
		laydate = layui.laydate;
	});
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
<script type="text/javascript"
	src="${ctxStatic}/js/v2/enterpriseCustom/manhuaDate.1.0.js"></script>
<script type="text/javascript"
	src="${ctxStatic}/js/v2/enterpriseCustom/serviceCaseSubpage.js"></script>
</body>
</html>