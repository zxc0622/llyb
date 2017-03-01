<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>企业库-联系我们</title>
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
<div class="Contact_us">
	<p class="Contact_us_we">
		<b style="font-size: 34px; color: #fff; margin-right: 24px;">联系我们</b>
		<b style="font-size: 26px; color: #fff; font-weight: normal;">Contactus </b>
	</p>
</div>
<div class="Contact_address">
	<div class="zhe_z49"></div>
	<div class="box-bar49" style="display: none;">
		<a href="javascript:void(0);" title="设置" class="showbox49">设置</a>
	</div>
	<div class="box49" style="display: none;">
		<h2>
			<a class="close"></a>
		</h2>
		<div class="mainlist">
			<div style="width: 540px; margin: 0 auto; margin-top: 20px;">
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					公司名称:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.company_name}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					公司地址:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.address}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					联系人:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.contact}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					公司电话:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${empty companyInfo.phone?companyInfo.tel:companyInfo.phone}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					公司传真:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.fax}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					公司网址:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.company_url}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p class="biao_ti"
					style="height: 25px; line-height: 28px; cursor: pointer; width: 78px; float: left; margin-right: 5px;">
					邮政编码:</p>
				<input type="text" maxlength="30" class="yin_c"
					value="${companyInfo.postal_code}"
					style="display: block; margin: 5px 0 15px 0; width: 435px; height: 35px;" />
				<p style="font-size: 11px; text-indent: 7em; color: #b5a9a9;">（每项最多输入30个字）</p>
				<div class="ensure">
					<a class="box49Sure"><span>确定</span>
					</a> <a class="box49Cancel"><span class="abolish">取消</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="address_left">
		<h2 id="ccn">${companyInfo.company_name}</h2>
		<p>
			<b>公司地址：</b><span id="ca">${companyInfo.address}</span>
		</p>
		<p>
			<b>&nbsp;联 系 人：</b><span id="cc">${companyInfo.contact}</span>
		</p>
		<p>
			<b>公司电话：</b><span id="ct">${empty companyInfo.phone?companyInfo.tel:companyInfo.phone}</span>
		</p>
		<p>
			<b>公司传真：</b><span id="cf">${companyInfo.fax}</span>
		</p>
		<p>
			<b>公司网址：</b><span id="ccu">${companyInfo.company_url}</span>
		</p>
		<p>
			<b>邮政编码：</b><span id="cpc">${companyInfo.postal_code}</span>
		</p>
	</div>
	<div class="address_map">
		<div
			style="width: 600px; height: 400px; border: #ccc solid 1px; font-size: 12px"
			id="map"></div>
	</div>
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
	src="${ctxStatic}/js/v2/enterpriseCustom/connectUsSubpage.js"></script>
<script type="text/javascript">
	var cuAddress = '${companyInfo.address}';
	//创建和初始化地图函数：
	function initMap() {
		createMap();// 创建地图
		setMapEvent();// 设置地图事件
		addMapControl();// 向地图添加控件
		addMapOverlay();// 向地图添加覆盖物
		theLocation();
	}
	function createMap() {
		map = new BMap.Map("map");
		map.centerAndZoom(new BMap.Point(113.759525, 23.021808), 13);
	}
	function setMapEvent() {
		map.enableScrollWheelZoom();
		map.enableKeyboard();
		map.enableDragging();
		map.enableDoubleClickZoom()
	}
	function addClickHandler(target, window) {
		target.addEventListener("click", function() {
			target.openInfoWindow(window);
		});
	}
	function addMapOverlay() {
	}
	// 向地图添加控件
	function addMapControl() {
		var scaleControl = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		map.addControl(scaleControl);
		var navControl = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_LEFT,
			type : BMAP_NAVIGATION_CONTROL_LARGE
		});
		map.addControl(navControl);
	}
	
	var map;
	initMap();
	
	var geoc = new BMap.Geocoder();
	function showInfo(e) {
		map.clearOverlays();
		var pt = e.point;
		geoc.getLocation(pt, function(rs) {
			var addComp = rs.addressComponents;
			// alert(addComp.province + ", " + addComp.city + ", " +
			// addComp.district + ", " + addComp.street + ", " +
			// addComp.streetNumber);
			var address = addComp.province + addComp.city + addComp.district
					+ addComp.street + addComp.streetNumber;
	//		$("#step2address").val(address);
	//		$("#provincename").val(addComp.province);
	//		$("#cityname").val(addComp.city);
		});
		var x = e.point.lng;
		var y = e.point.lat;
	//	$("#step2mapx").val(x);
	//	$("#step2mapy").val(y);
		var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)); // 创建点
		map.addOverlay(marker);
	}
	map.addEventListener("click", showInfo);
	
	function getAddressByKw(city) {
		if (city != "") {
			map.centerAndZoom(city, 11); // 用城市名设置地图中心点
		}
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search(city);
	}
	
	function theLocation() {
		var city = cuAddress;
		getAddressByKw(city);
	}
</script>
</body>
</html>