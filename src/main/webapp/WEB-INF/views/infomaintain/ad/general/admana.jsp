<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="" />
<title>广告-广告管理</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/zx_houtai.css" />


<style type="text/css">
.tab_main {
	overflow: hidden;
}

.tab_main_left {
	width: 580px;
	overflow: hidden;
	float: left;
	padding-right: 10px;
}

.main_menu {
	float: right;
	margin-top: 40px;
}

.main_menu .menu_tit {
	background-color: #edf2e9;
	width: 140px;
	text-align: left;
	color: #333;
	font-weight: bolder;
	height: 40px;
	line-height: 40px;
	display: block;
	border-radius: 20px 0 0 20px;
	-moz-border-radius: 20px 0 0 20px;
	-webkit-border-radius: 20px 0 0 20px;
	text-indent: 40px;
	margin: 4px 0;
	cursor: pointer;
	letter-spacing: 1px;
	-moz-user-select: none;
}

.main_menu .menu_1 ul {
	margin-left: 20px;
}

.main_menu .menu_1 ul li {
	width: 120px;
	background-color: #edf2e9;
	line-height: 30px;
	height: 30px;
	text-align: left;
	text-indent: 30px;
	border-radius: 15px 0 0 15px;
	-moz-border-radius: 15px 0 0 15px;
	-webkit-border-radius: 15px 0 0 15px;
	margin-bottom: 4px;
	font-size: 12px;
}

.main_menu .menu_1 ul .cur_menu {
	background-color: #f29433;
	color: white;
}

.main_menu .menu_1 ul li:hover {
	background-color: #ffce9b;
	cursor: pointer;
}

.main_menu .menu_1 ul .cur_menu:hover {
	background-color: #f29433;
}

/*图片间距*/
.for_pics {
	overflow: hidden;
	border: 1px solid #ccc;
	margin-top: 15px;
	min-height: 400px;
}

.for_pics .per_pic_div {
	margin: 10px;
}

.per_pic_div>img {
	cursor: pointer;
}

.pic_display_none {
	display: none;
}

.pic_display_block {
	display: block;
}

.per_pic_div {
	height: 168px;
}

.per_pic_div .check_del_div {
	height: 68px;
	overflow: hidden;
}

.check_del_div input[type=text] {
	height: 17px;
	width: 95%;
	margin: 3px auto 0;
	line-height: 17px;
	display: block;
	font-size: 12px;
}

.check_del_div a {
	font-size: 12px;
	float: right;
	color: #5EC520;
	margin-top: 3px;
	margin-right: 5px;
}
</style>

</head>
<body>
	<!-- 右侧开始 -->
	<div class="main_right">
		<div class="m_r_position font_1">当前位置>广告>广告管理</div>
		<div class="tab_main">
			<div class="tab_main_left">
				<div>
					<!-- <a href="javascript:void(0)" class="normal_btn_1">图片库上传</a> -->
					<!-- <a
						href="javascript:void(0)" class="normal_btn_1"
						onclick="admana.openUploadFileWin();">本地上传</a> -->
				</div>
				<div class="tab_main_row">
					<!-- <a href="javascript:void(0)" class="normal_btn1 check_all">全选</a> <a
						href="javascript:void(0)" class="normal_btn1 delete_tr">删除</a> <a
						href="javascript:void(0)" class="normal_btn_2">预览</a> -->
					<a href="javascript:void(0)" class="normal_btn_2"
						onclick="admana.method.submitForm();">保存更改</a>
				</div>
				<form action="${ctx}/infomaintain/ad/general/saveImg" method="post"
					id="uploadForm">
					<input type="hidden" id="lableID" name="labelID" />
					<div class="for_pics"></div>
				</form>
			</div>

			<div class="main_menu">
				<c:forEach items="${labels}" var="label">
					<div class="menu_1">
						<c:if test="${label.parId eq 0}">
							<a class="menu_tit" onselectstart="return false">${label.name}</a>
							<ul>
								<c:forEach items="${labels}" var="labelChildren"
									varStatus="idStatus">
									<c:if test="${labelChildren.parId eq label.id}">
										<li data-labelID="${labelChildren.id}"
											data-advNum="${labelChildren.advNum}"
											data-divID="leftImage${labelChildren.id}"><span>${labelChildren.name}</span><span>${labelChildren.advNum}</span></li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<div style="display: none;">
		<!-- 图片模版 -->
		<div id="temp_img">
			<div class="per_pic_div">
				<input type="hidden" /> <img src="" alt="等待上传"
					style="text-align: center;"> <input type="hidden"
					name="adImages[#index#].picAddr" />
				<div class="check_sel_pic"></div>
				<div class="check_del_div">
					<input type="text" name="adImages[#index#].showName"
						placeholder="请输入图片名" /> <input type="text"
						name="adImages[#index#].redirctHref" placeholder="请输入链接" /> <a
						href="javascript:picDel(0);">[删除]</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 右侧结束 -->
	<!-- js -->
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery.form.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".main_menu .menu_1 ul").hide();
			admana.menu.menuMainClick($(".main_menu .menu_1").eq(0).find("a"));
			/* $(".main_menu .menu_1").eq(0).find("a").css("background-color",
					"#f29433").css("color", "white"); */
			/* $(".cur_menu").parent("ul").prev("a").css("background-color",
						"#f29433").css("color", "white"); */
			$(".main_menu .menu_1 .menu_tit").click(function() {
				admana.menu.menuMainClick(this);
			});
			$("li").click(function() {
				admana.menu.menuChildrenClick(this);
			});
		});

		//图片上传	
		function addPic(str, n) {
			$("#images" + n).attr("src", str);
			$("#val" + n).val(str);
		}

		var admana = {};

		//菜单类
		admana.menu = {};

		//参数相关类
		admana.param = {};

		//js画dom相关类
		admana.drawDom = {};

		//窗口类
		admana.win = {};

		//ajax相关类
		admana.ajax = {};

		//回调函数相关类
		admana.callback = {};

		//事件相关类
		admana.method = {};

		//常量相关类
		admana.constants = {};

		//删除相关类
		admana.del = {};

		//子菜单点击事件
		admana.menu.menuChildrenClick = function(obj) {
			$("li").removeClass("cur_menu");
			$(obj).addClass("cur_menu").siblings().removeClass("cur_menu");
			$(".main_menu .menu_tit").css("background-color", "#edf2e9").css(
					"color", "#333;");
			$(obj).parent("ul").prev("a").css("background-color", "#f29433")
					.css("color", "white");
			//给隐藏域设置
			var labelID = $(obj).attr("data-labelID");
			var addNum = $(obj).attr("data-advNum");
			var divID = $(obj).attr("data-divID");
			admana.param.setLabelID(labelID);
			admana.ajax.doAjax(labelID, addNum, divID);
		};

		//主菜单点击事件
		admana.menu.menuMainClick = function(obj) {
			var menu_ul = $(obj).next("ul");
			if (!menu_ul.is(":visible")) {
				$(".main_menu .menu_1 ul").slideUp();
				menu_ul
						.slideToggle(
								"normal",
								function() {
									window.parent.document
											.getElementById('rightIframe').height = document.body.scrollHeight;
								});
				$(".main_menu .menu_tit").css("background-color", "#edf2e9")
						.css("color", "#333");
				$(obj).css("background-color", "#f29433").css("color", "white");
				//menu_ul.children("li").removeClass("cur_menu");
				$("li").removeClass("cur_menu");
				menu_ul.children("li:first").addClass("cur_menu");
				//给隐藏域设置
				var labelID = menu_ul.children("li:first").attr("data-labelID");
				var addNum = menu_ul.children("li:first").attr("data-advNum");
				var divID = menu_ul.children("li:first").attr("data-divID");
				admana.param.setLabelID(labelID);
				admana.ajax.doAjax(labelID, addNum, divID);
			}
		};

		//设置lableID的隐藏域
		admana.param.setLabelID = function(labelID) {
			$("#lableID").val(labelID);
		};

		//画左侧图片
		admana.drawDom.leftImg = function(srcUrl, imgID, showName, redirctHref,
				divID, index) {
			/* alert("srcUrl:" + srcUrl);
			alert("imgID:" + imgID);
			alert("divID:" + divID);
			alert("index:" + index); */
			var lableID = $("#lableID").val();
			var suffix = lableID + "_" + index;
			var img = $("#temp_img>div").clone();
			$(img).find("img").attr("src", srcUrl);
			$(img).find("img").attr("id", "images" + suffix);
			//$(img).find("img").attr("data-suffix", suffix);
			$(img).find("img").unbind().bind("click", function() {
				admana.win.openUploadFileWin(suffix);
			});
			$(img).find(":input").each(function(i, item) {
				var inputName = $(this).attr("name");
				if (inputName == "" || inputName == undefined) {
					return true;
				}
				inputName = inputName.replace("#index#", index);
				$(this).attr("name", inputName);
			});
			$(img).find(":input").eq(0).val(imgID);
			$(img).find(":input").eq(1).val(srcUrl);
			$(img).find(":input").eq(2).val(showName);
			$(img).find(":input").eq(3).val(redirctHref);
			$(img).find(":input").eq(1).attr("id", "val" + suffix);
			$(img).find(".check_del_div a").eq(0).bind("click", {
				imgID : imgID,
				domObj : $(img)
			}, admana.win.delImgConfirm);
			/* $(img).find(":input").eq(0).attr("id",); */
			$(".for_pics").eq(0).find("#" + divID).append(img);
		};

		//当没有图片时画的左边的图片
		admana.drawDom.emptyLeftImg = function(addNum, divID) {
			for (var i = 0; i < addNum; i++) {
				admana.drawDom.leftImg("", "", "", "", divID, i);
			}
			window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
		};

		//当数据库的数量改动时，多余出来图片
		admana.drawDom.excessEmptyLeftImg = function(excessAddNum, divID, index) {
			for (var i = 0; i < excessAddNum; i++) {
				admana.drawDom.leftImg("", "", "", "", divID, index);
				index += 1;
			}
		};

		//画左侧
		admana.drawDom.drawLeft = function(data, addNum, divID) {
			$(".selectedLabel").removeClass("pic_display_block");
			$(".selectedLabel").addClass("pic_display_none");
			//$(".selectedLabel").css("display", "none");
			$(".selectedLabel :input").attr("disabled", true);
			var len = $("#" + divID).length;
			if (len == 0) {
				var lableDiv = '<div class="selectedLabel pic_display_block" id="'+ divID +'"></div>';
				$(".for_pics").eq(0).append(lableDiv);
				if (data.obj.length == 0) {
					//alert(addNum);
					admana.drawDom.emptyLeftImg(addNum, divID);
				} else {
					//alert(JSON.stringify(data));
					$.each(data.obj, function(n, value) {
						//alert(n);
						admana.drawDom.leftImg(value.pic_addr, value.id,
								value.show_name, value.redirct_href, divID, n);
					});
					if (data.obj.length < addNum) {
						admana.drawDom.excessEmptyLeftImg(addNum
								- data.obj.length, divID, data.obj.length);
					}
					window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
				}
			} else {
				$("#" + divID).removeClass("pic_display_none");
				$("#" + divID).addClass("pic_display_block");
				//$("#" + divID).css("display", "block");
				$("#" + divID + " :input").attr("disabled", false);
				window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
			}
		};

		//打开上传图片窗口
		admana.win.openUploadFileWin = function(suffix) {
			window.parent.comPic(suffix);
		};

		//打开确认窗口
		admana.win.baseConfirmWin = function(str, data, callbackFunc) {
			window.parent.showMessYes(str);
			$(".yes-btn", window.parent.document).unbind().one("click", data,
					callbackFunc);
		};

		//关闭确认窗口
		admana.win.closeConfirmWin = function() {
			window.parent.hideMessYes();
		};

		//删除图片确认按钮
		admana.win.delImgConfirm = function(event) {
			var obj = event.data.domObj;
			var addrVal = $(obj).find(":input").eq(1).val();
			var id = $(obj).find(":input").eq(0).val();
			if (addrVal == "") {
				admana.win.tipWin("请先上传图片再删除");
				return;
			}
			admana.win.baseConfirmWin("是否确认删除此图片", {}, function() {
				if (admana.method.getCurLabelDomNum(obj) > admana.method
						.getAdvNum()) {
					admana.del.delDom(obj);
				} else {
					admana.method.clearImg(obj);
				}
				admana.win.closeConfirmWin();
			});
			/* var data = {
				imgID : event.data.imgID,
				domObj : obj
			};
			admana.win.baseConfirmWin("是否确认删除此图片", data,
					admana.callback.delFunc); */
		};

		admana.method.getCurLabelDomNum = function(obj) {
			var len = $(obj).parent().children(".per_pic_div").length;
			return len;
		};

		admana.del.delDom = function(obj) {
			$(obj).remove();
		};

		//提示窗口
		admana.win.tipWin = function(str) {
			window.parent.showMess(str);
		};

		//表单提交的ajax
		admana.ajax.doSubmitAjax = function() {
			var options = {
				success : admana.callback.common
			};
			$("#uploadForm").ajaxSubmit(options);
		};

		//点击右侧菜单执行的ajax
		admana.ajax.doAjax = function(id, addNum, divID) {
			var url = "${ctx}/infomaintain/ad/general/getAdImages";
			var data = {
				lableID : id
			};
			$.post(url, data, function(json) {
				admana.drawDom.drawLeft(json, addNum, divID);
			});
		};

		//删除图片ajax
		admana.ajax.doDelImgAjax = function(imgID, domObj) {
			var url = "${ctx}/infomaintain/ad/general/delImg";
			var data = {
				imgID : imgID
			};
			$.post(url, data, function(json) {
				if (json.isSuccess) {
					admana.method.clearImg(domObj);
				}
				admana.win.tipWin(json.msg);
			});
		};

		//通用回调函数
		admana.callback.common = function(data) {
			admana.win.tipWin(data.msg);
		};

		//删除图片的回调函数
		admana.callback.delFunc = function(event) {
			admana.method.delImg(event.data.imgID, event.data.domObj);
			admana.win.closeConfirmWin();
		};

		//删除图片
		admana.method.delImg = function(imgID, domObj) {
			admana.ajax.doDelImgAjax(imgID, domObj);
		};

		//删除图片后清除方法
		admana.method.clearImg = function(domObj) {
			$(domObj).find(":input").each(function() {
				$(this).val("");
			});
			$(domObj).find("img").attr("src", "");
		};

		//获取当前添加个数
		admana.method.getAdvNum = function() {
			var advNum = $('li[class^="cur_menu"]').eq(0).attr("data-advNum");
			return advNum;
		};

		//提交表单
		admana.method.submitForm = function() {
			var advNum = admana.method.getAdvNum();
			var name = $('li[class^="cur_menu"]').eq(0).find("span").eq(0)
					.html();
			var currentImgNum = admana.method.getcurrentImgNum();
			//alert(advNum);
			//alert(name);
			if (advNum == currentImgNum) {
				admana.win.baseConfirmWin(
						"是否保存这" + advNum + "张" + name + "图片?", {}, function() {
							admana.ajax.doSubmitAjax();
							admana.win.closeConfirmWin();
						});
			} else {
				admana.win.tipWin(name + "必须上传" + advNum + "张图片后才能保存更改~");
			}
		};

		//获取当前图片度数量
		admana.method.getcurrentImgNum = function() {
			var temp = 0;
			$(".pic_display_block").find(".per_pic_div").each(function() {
				var addr = $(this).find(":input").eq(1).val();
				if (addr != "") {
					temp += 1;
				}
			});
			return temp;
		};
	</script>
</body>
</html>


