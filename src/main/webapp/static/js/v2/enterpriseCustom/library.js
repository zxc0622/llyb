/** 待整理 js start* */
$(".flip2").click(function() {
	if (!$(".nav2").is(":animated")) { // ********问题点在这里，这里有判断是否处于动画
		$(".nav2").slideToggle("slow");
		$(".nav1").slideUp();
		$(".nav4").slideUp();
	}
});
$(".flip4").click(function() {
	if (!$(".nav4").is(":animated")) { // ********问题点在这里，这里有判断是否处于动画
		$(".nav4").slideToggle("slow");
		$(".nav1").slideUp();
		$(".nav2").slideUp();
	}
});

$(".nav1 div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 500);
	$(".nav1 div").removeClass("on");
	$(".nav1 div").eq(index).addClass("on");
	$(".content div:eq(0)").stop().animate({
		"margin-top" : l
	}, 500);
	$(".content .materials:eq(0)").stop().animate({
		"margin-top" : l
	}, 500);
	$('.Joedar_evaluate .content').show();

});

$(".nav2 div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 500);
	$(".nav2 div").removeClass("on");
	$(".nav2 div").eq(index).addClass("on");
	$(".content div:eq(0)").stop().animate({
		"margin-top" : l
	}, 500);
	$(".content .materials:eq(0)").stop().animate({
		"margin-top" : l
	}, 500);
	$('.Joedar_evaluate .content').show();

});

$(".joedar_middle").hover(function(event) {
	shadeLayer(event, $(".box-bar"), $(".bjs"));
});
$(".main").hover(function(event) {
	shadeLayer(event, $(".zhe_z2"), $(".box-bar3"));
});
$(".Joedar_abstract").hover(function(event) {
	shadeLayer(event, $(".the_right"), $(".box-bar5"));
});
$(".Joedar_news").hover(function(event) {
	shadeLayer(event, $(".zhe_z5"), $(".box-bar6"));
});

$(".Joedar_evaluate").hover(function(event) {
	shadeLayer(event, $(".zhe_z7"), $(".box-bar7"));
});
$(".Joedar_product").hover(function(event) {
	shadeLayer(event, $(".zhe_z8"), $(".box-bar9"));
});

$(".Joedar_case").hover(function(event) {
	shadeLayer(event, $(".zhe_z10"), $(".box-bar10"));
});

$(".nav4 div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 500);
	$(".nav4 div").removeClass("on");
	$(".nav4 div").eq(index).addClass("on");
	$(".content div:eq(0)").stop().animate({
		"margin-top" : l
	}, 500);
	$('.Joedar_evaluate .content').show();

});

$(".main-pagee .nav div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 1092);
	$(".main-pagee .nav div").removeClass("on");
	$(".main-pagee .nav div").eq(index).addClass("on");
	$(".main-pagee .content div:eq(0)").stop().animate({
		"margin-left" : l
	}, 500);
});

$("#sortable").sortable();
$("#sortable").disableSelection();

$(".main-pageeeee .nav div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 1092);
	$(".main-pageeeee .nav div").removeClass("on");
	$(".main-pageeeee .nav div").eq(index).addClass("on");
	$(".main-pageeeee .content div:eq(0)").stop().animate({
		"margin-left" : l
	}, 500);
});

var time_on = true;// 验证码
var timer = null;

function changeLeftMenu(mName) {
	$(".m_l_bottom .l_b_erji li").each(function() {
		if (mName == $(this).html()) {
			$(this).click();
			$(this).parent().prev().click();
		}
	});
}
// 退出登录
function logout() {
	$(".pl_yesorno .pl_content p").empty().text("确定退出？");
	$(".pl_yesorno").show();
	$(".popumask").show();
	$(".yes-btn").on("click", function() {
		location.href = "/logout";
	});
}

// 修改手机号$(".yes-btn",
// window.parent.document).unbind().on("click",func);
function showphoneMess() {
	$(".popumask").show();

	$(".pl_change_phonenum").show();
	$(".yes-btn", window.parent.document).unbind().click(function() {
		var edittel = $(".pl_change_phonenum input:eq(0)").val();
		var editcode = $(".pl_change_phonenum input:eq(1)").val();
		rightIframe.window.telcode(edittel, editcode);
		/*
		 * $(".pl_text").hide(); $(".popumask").hide();
		 */
	});
}
function hidephoneMess() {
	$(".pl_change_phonenum").fadeOut();
	$(".popumask").fadeOut();
}
// 不带确定的提示框
function showMess(str) {
	$(".popumask").show();
	$(".pl_normal .pl_content p").html(str);
	$(".pl_normal").show();
	setTimeout(function() {
		$(".popumask").fadeOut();
		$(".pl_normal .pl_content p").html("");
		$(".pl_normal").hide();
	}, 3000);
}
function hideMess() {
	$(".popumask").fadeOut();
	$(".pl_normal .pl_content p").html("");
	$(".pl_normal").hide();
}
// 只带确定的提示框 确定方法要自己在子页面写,$(".yes-btn",
// window.parent.document).unbind().on("click",func);
function showMessOnlyYes(str) {
	$(".pl_yes .pl_content p").text(str);
	$(".pl_yes").show();
	$(".popumask").show();
}
function hideMessOnlyYes() {
	$(".pl_yes .pl_content p").text("");
	$(".pl_yes").hide();
	$(".popumask").hide();
}
// 带确定的提示框 确定方法要自己在子页面写,$(".yes-btn",
// window.parent.document).unbind().on("click",func);
function showMessYes(str) {
	$(".pl_yesorno .pl_content p").text(str);
	$(".pl_yesorno").show();
	$(".popumask").show();
}
function hideMessYes() {
	$(".pl_yesorno .pl_content p").text("");
	$(".pl_yesorno").fadeOut();
	$(".popumask").fadeOut();
}

// 子页面内页面跳转跳转
function iframeGoToUrl(url) {
	$("#rightIframe").attr("src", url);
}
// 带文本框的提示框 确定方法要自己在子页面写,
function showText(str) {
	$(".pl_text .layer_top span").html(str);
	$(".pl_text").show();
	$(".popumask").show();
	$(".pl_text .yes-btn").unbind().click(function() {
		var content = $(".pl_text textarea").val();
		rightIframe.window.getText(content);
		$(".pl_text").hide();
		$(".popumask").hide();
	});
}
// 未读消息对话
function notRead(mess, chat) {
	var messNotRead = parseInt(mess);
	var chatNotRead = parseInt(chat);
	if (messNotRead > 0) {
		$(".headtop a").eq(0).find("span").text(messNotRead).show();
		$(".m_l_mid a").eq(1).html(messNotRead).addClass("m_l_mid_sel");
	} else {
		$(".headtop a").eq(0).find("span").hide();
		$(".m_l_mid a").eq(1).html("").removeClass("m_l_mid_sel");
	}
	if (chatNotRead > 0) {
		$(".headtop a").eq(1).find("span").text(chatNotRead).show();
		$(".m_l_mid a").eq(0).html(chatNotRead).addClass("m_l_mid_sel");
	} else {
		$(".headtop a").eq(1).find("span").hide();
		$(".m_l_mid a").eq(0).html("").removeClass("m_l_mid_sel");
	}
}
$(".no-btn").click(function() {
	$(this).parent().parent().parent().hide();
});
// 验证码倒计时
function getcode(ss) {
	var tel = $(".pl_change_phonenum input:eq(0)").val();
	if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
		showMess("请输入正确的手机号码");

	} else {
		if (time_on) {
			var time = 30;
			clearInterval(timer);
			$(this).css({
				background : "#CCCCCC",
				color : "#666666"
			});
			$(this).html("重新获取(" + time + ")");
			timer = setInterval(function() {
				time--;
				$(".pl_change_phonenum .btn").html("重新获取(" + time + ")");
				if (time > 0) {
					time_on = false;

				} else {
					clearInterval(timer);
					$(".pl_change_phonenum .btn").html("重新获取");
					$(".pl_change_phonenum .btn").css({
						background : "#5EC520",
						color : "#FFFFFF"
					});
					time_on = true;
				}
			}, 1000);

		}

		$.ajax({
			type : "POST",
			url : "/conn",
			data : "tel=" + tel,
			dataType : 'text',
			success : function(data) {
				// showMess(data);

			}
		});
	}

}
// 触发编辑未保存中断提示框 调用此方法，传递提示内容str
function showStopEidtor(str) {
	$("#leftIframe").contents().find('.transparent_mask_layer').css({
		"display" : "block"
	});
	$("#leftIframe").contents().find('.transparent_mask_layer').unbind().click(
			function() {
				var thisobj = this, thisindex = $(this).index();
				showMessYes(str);
				$(".pl_yesorno .btns-yesorno a:eq(0)").unbind().click(
						function() {
							var href = $("#leftIframe").contents()
									.find(thisobj).next().find("a")
									.attr("href");
							if (href != undefined) {
								$("#leftIframe").contents().find(thisobj)
										.next().find("a").addClass("l_b_2sel");
								goUrl(href);
							} else {
								$("#leftIframe").contents().find(thisobj)
										.next().trigger("click");
							}
							$(".pl_yesorno").hide();
							$(".popumask").hide();
							$("#leftIframe").contents().find(
									'.transparent_mask_layer').css({
								"display" : "none"
							});
						});
			});
}
// 停止触发未保存中断提示框
function stopShowEidtor() {
	$("#leftIframe").contents().find('.transparent_mask_layer').unbind();
	$(".pl_yesorno .btns-yesorno a:eq(0)").unbind();
	$("#leftIframe").contents().find('.transparent_mask_layer').css({
		"display" : "none"
	});
}

$(".box7 li").click(function() {
	$(this).toggleClass("service_type");
});

$(".main-pageee .nav div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 1092);
	$(".main-pageee .nav div").removeClass("on");
	$(".main-pageee .nav div").eq(index).addClass("on");
	$(".main-pageee .content div:eq(0)").stop().animate({
		"margin-left" : l
	}, 500);
});
$(".main-pageeee .nav div").mouseenter(function() {
	var $this = $(this);
	var index = $this.index();
}).mouseleave(function() {
	var $this = $(this);
	var index = $this.index();
}).click(function() {
	var $this = $(this);
	var index = $this.index();
	var l = -(index * 1092);
	$(".main-pageeee .nav div").removeClass("on");
	$(".main-pageeee .nav div").eq(index).addClass("on");
	$(".main-pageeee .content div:eq(0)").stop().animate({
		"margin-left" : l
	}, 500);
});

$(".showbox6").click(
		function() {

			if($(window).height() < $(".box6").height()){
				$(".box6").css("height",$(window).height());
			}
			$("#TB_overlayBG").css({
				display : "block",
				height : $(document).height()
			});

			$(".box6").css(
					{
						left : ($("body").width() - $(".box6").width()) / 2
								- 20 + "px",
						top : ($(window).height() - $(".box6").height()) / 2
								+ "px",
						display : "block"
					});

			for ( var i = 1; i < 6; i++) {
				var cc = $("#course" + i).html();
				$(".history").eq(i - 1).val(cc);
			}
		});

$(".showbox7").click(
		function() {
			
			if($(window).height() < $(".box7").height()){
				$(".box7").css("height",$(window).height());
			}
			$("#TB_overlayBG").css({
				display : "block",
				height : $(document).height()
			});

			$(".box7").css(
					{
						left : ($("body").width() - $(".box7").width()) / 2
								- 20 + "px",
						top : ($(window).height() - $(".box7").height()) / 2
								+ "px",
						display : "block"
					});

			var lileft = $(".flip");
			var libox = $(".serviceType li");
			libox.removeClass("service_type");
			for ( var i = 0; i < libox.length; i++) {
				var typeId = libox.eq(i).attr("typeId");
				for ( var j = 0; j < lileft.length; j++) {
					var typeIdL = lileft.eq(j).attr("typeId");
					if (typeId == typeIdL) {
						libox.eq(i).addClass("service_type");
						break;
					}
				}
			}

		});

$(".remove").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(1);
	if (rt == "ok") {
		$(".joedar_middle").remove();
	} else {
		// 删除模块失败
	}

});

// 导航栏
$(".remove2").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(2);
	if (rt == "ok") {
		$(".joedar_nav").remove();
	} else {
		// 删除模块失败
	}

});

// 企业简介
$(".remove5").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(4);
	if (rt == "ok") {
		$(".Joedar_abstract").remove();
	} else {
		// 删除模块失败
	}

});

// 企业发展历程
$(".remove6").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(5);
	if (rt == "ok") {
		$(".Joedar_course").remove();
	} else {
		// 删除模块失败
	}

});

// 服务类型
$(".remove7").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(6);
	if (rt == "ok") {
		$(".Joedar_evaluate").remove();
	} else {
		// 删除模块失败
	}

});

// 服务案例
$(".remove9").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(7);
	if (rt == "ok") {
		$(".Joedar_product").remove();
	} else {
		// 删除模块失败
	}
});

// 产品展示
$(".remove10").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(8);
	if (rt == "ok") {
		$(".Joedar_case").remove();
	} else {
		// 删除模块失败
	}
});

// 企业资质
$(".remove11").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(9);
	if (rt == "ok") {
		$(".Joedar_aptitude").remove();
	} else {
		// 删除模块失败
	}
});

// 企业相册
$(".remove12").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(10);
	if (rt == "ok") {
		$(".Joedar_photo").remove();
	} else {
		// 删除模块失败
	}
});
/** 待整理 js end* */

/** banner图js start */
// banner轮播
var sliderObj;
$('.flexslider').flexslider({
	animation : "slide",
	controlNav : false,
	directionNav: true,
	start : function(slider) {
		$('body').removeClass('loading');
		sliderObj = slider;
	}
});
// 显示banner图设置窗口
$(".showbox4").click(
		function() {
			var bannerMsg = getBannerMsg();
			initSetMsg(bannerMsg);

			if($(window).height() < $(".box4").height()){
				$(".box4").css("height",$(window).height());
			}
			
			$("#TB_overlayBG").css({
				display : "block",
				height : $(document).height()
			});

			$(".box4").css(
					{
						left : ($("body").width() - $(".box4").width()) / 2
								- 20 + "px",
						top : ($(window).height() - $(".box4").height()) / 2
								+ "px",
						display : "block"
					});
		});

// 获取banner图信息
function getBannerMsg() {
	var bannerMsg = new Array();
	var img;
	var a;
	$("ul.slides li:not(.clone) img").each(function() {
		img = $(this);
		a = img.parent();
		bannerMsg.push({
			"url" : img.attr("src"),
			"link" : a.attr("href"),
			"id" : img.attr("id")
		});
	});
	return bannerMsg;
}

// 初始化设置面板信息
function initSetMsg(bannerMsg) {
	var els = $(".tupian div.bn");
	;
	var banner;
	var bn;
	var cdrs;
	for (index in bannerMsg) {
		banner = bannerMsg[index];
		bn = $(els[index]);
		bn.attr("id", banner.id);
		cdrs = bn.children();
		$(cdrs[1]).val(banner.link);
		$(cdrs[4]).attr("id", banner.url);
	}
}

// 上传图片
$(".bnImg").on("change", function() {
	uploadImgReturnUrl(this, function(imgUrl, thisObj) {
		var nextEl = thisObj.next();
		nextEl.attr("id", imgUrl);
	});
});

// 确认提交修改
$(".submitBanner").click(function() {
	var bannerMsg = getBannerSetMsg();
	var url = basePath + "Library/banner/updateBannerMsg/" + companyId;
	$.post(url, {
		"bannerMsg" : bannerMsg
	}, function(data, status) {
		if (data) {
			updateBannerMsgOnPage(bannerMsg);
		}
		$(".close").click();
	});
});

// 图片预览
$(".showImg").click(function() {
	var imgUrl = $(this).attr("id");
	showImg(imgUrl);
});

// 获取设置面板的banner信息
function getBannerSetMsg() {
	var els;
	var bannerMsg = "";
	var updateStatus;
	var url;
	var id;
	$(".tupian div.bn").each(
			function() {
				id = $(this).attr("id");
				els = $(this).children();
				url = $(els[4]).attr("id");
				updateStatus = url == "" || url == "undefined"
						|| url == undefined ? false : true;
				if (updateStatus) {
					bannerMsg += '{"id":"' + id + '","link":"'
							+ $(els[1]).val() + '","url":"' + url + '"};';
				}
			});
	bannerMsg = bannerMsg.substring(0, bannerMsg.length - 1);
	return bannerMsg;
}

// 删除banner
$(".deleteImg").click(function() {
	$(this).prev().attr("id", "delete");
	$($(this).prevAll()[3]).val("");
});

// 更新页面banner信息
function updateBannerMsgOnPage(bannerMsg) {
	var ul = $(".headUl");
	$(".slides li:not(.clone)").each(function() {
		sliderObj.removeSlide($(this));
	});
	var bannerMsgArray = bannerMsg.split(";");
	var bannerMsg;
	var banner;
	var li = '<li>' + '<div class="img">' + '<a href="">'
			+ '<img src="" style="height:450px;width:100%" alt="">' + '</a>'
			+ '</div>' + '</li>';
	var liEl;
	var num = 1;
	var liElId;
	for (index in bannerMsgArray) {
		liEl = $(li);
		bannerMsg = bannerMsgArray[index];
		banner = $.parseJSON(bannerMsg);
		if (banner.url != "delete") {
			liEl.find("a").attr("href", banner.link);
			liEl.find("img").attr("src", banner.url);
			liElId = "li" + num;
			liEl.attr("id", liElId);
			ul.append(liEl);
			sliderObj.currentSlide = 1;
			sliderObj.animatedSlides = 1;
			sliderObj.animatingTo = 1;
			sliderObj.addSlide($("#" + liElId), num);
			num += 1;
		}
	}

	sliderObj.ensureAnimationEnd = num - 1;
	sliderObj.pagingCount = num - 1;
	sliderObj.vars.startAt = 0;
	sliderObj.play();
}
/** banner图js start */

/** 企业资质js start */
// 显示遮罩层
$(".Joedar_aptitude").hover(function(event) {
	shadeLayer(event, $(".zhe_z11"), $(".box-bar11"));
});
/** 企业资质js end */

/** 企业发展历程js start */
// 切换步骤提示
$(".history").click(
		function() {
			var index = $(this).data("index") - 1;
			$(".arrow_bg li:eq(" + index + ")").addClass('on_bg')
					.siblings('li').removeClass('on_bg');
		});

// 确定提交
$("#box6_sure").click(function() {

	var cinput = $(".history");
	var co1 = cinput.eq(0).val();
	var co2 = cinput.eq(1).val();
	var co3 = cinput.eq(2).val();
	var co4 = cinput.eq(3).val();
	var co5 = cinput.eq(4).val();

	$.ajax({
		url : basePath + "Library/course/saveCourse/" + companyId,
		data : {
			co1 : co1,
			co2 : co2,
			co3 : co3,
			co4 : co4,
			co5 : co5
		},
		type : 'post',
		dataType : 'text',
		success : function(data) {
			if (data == "ok") {
				for ( var i = 1; i < 6; i++) {
					var cc = cinput.eq(i - 1).val();
					$("#course" + i).html(cc);
				}

				// 关闭弹窗
				$("#TB_overlayBG").css("display", "none");
				$(".box6 ").css("display", "none");
				$(".removable").remove();
			}
		}
	});
});

/** 企业发展历程js end */

/** 头部js start */
// 显示设置按钮
$(".showbox").click(function() {
	
	if($(window).height() < $(".box").height()){
		$(".box").css("height",$(window).height());
	}
	$("#TB_overlayBG").css({
		display : "block",
		height : $(document).height()
	});

	$(".box").css({
		left : ($("body").width() - $(".box").width()) / 2 - 20 + "px",
		top : ($(window).height() - $(".box").height()) / 2 + "px",
		display : "block"
	});

	if (isDefault == "true") {
		$(".defualtBgImg").click();
	} else {
		$(".customBgImg").click();
	}
	var companyName = $(".headCompanyName").text();
	var summary = $(".headSummary").text();
	$(".companyNameInput").val(companyName);
	$(".summaryInput").val(summary);
});

// 选择自定义背景图，显示上传图片按钮
$(".customBgImg").click(function() {
	$(".uploadImgDiv").show();
	isDefault = "false";
	// $(".joedar_middle").css("background-image",bgImgUrl);
	$(".miniHeadBgImg").css("background-image", bgImgUrl);
});

// 选择使用默认背景图，隐藏上传图片按钮
$(".defualtBgImg").click(
		function() {
			$(".uploadImgDiv").hide();
			isDefault = "true";
			var imgUrl = "url(" + ctxStatic
					+ "/img/v2/enterpriseCustom/head_banner.jpg)";
			// $(".joedar_middle").css("background-image",imgUrl);
			$(".miniHeadBgImg").css("background-image", imgUrl);
		});

// 上传图片
$(".headBgImg").on("change", function(){
	uploadImgReturnUrl(this, function(imgUrl, thisObj) {
		$(".miniHeadBgImg").css("background-image", "url(" + imgUrl + ")");
	});
});

// 确认提交更新头部模块信息
$(".updateHeadMsg").click(function() {
	var imgUrl = $(".miniHeadBgImg").css("background-image");
	imgUrl = imgUrl.replace(/(url|\"|\(|\))/g,"");
	var companyName = $(".companyNameInput").val();
	var summary = $(".summaryInput").val();
	var url = basePath + "Library/head/updateHeadMsg/" + companyId;
	$.post(url, {
		"imgUrl" : imgUrl,
		"companyName" : companyName,
		"summary" : summary
	}, function(data, status) {
		if (data) {
			updataHeadMsg(imgUrl, companyName, summary);
		}
		$(".close").click();
	});
});

// 更新页面头部信息
function updataHeadMsg(imgUrl, companyName, summary) {
	$(".headBg").css("background-image", "url(" + imgUrl + ")");
	$(".headCompanyName").text(companyName);
	$(".headSummary").text(summary);
}

/** logo js start */
$(".joedar_firm").hover(function(event) {
	shadeLayer(event, $(".logo_shade"), $(".logo_bar"));
});

$(".showlogobox").click(function() {
	
	if($(window).height() < $(".logobox").height()){
		$(".logobox").css("height",$(window).height());
	}
	$("#TB_overlayBG").css({
		display : "block",
		height : $(document).height()
	});
	$(".logobox").css({
		left : ($(window).width() - $(".logobox").width()) / 2 + "px",
		top : ($(window).height() - $(".logobox").height()) / 2 + "px",
		display : "block"
	});
});

$(".closeLogoBox").click(function() {
	$("#TB_overlayBG").css("display", "none");
	$(".modules").css("display", "none");
	$(".logobox ").css("display", "none");
	$(".removable").remove();
});

$(".logoImg").on("change", function() {
	uploadImgReturnUrl(this, function(imgUrl, thisObj) {
		var nextEl = thisObj.next();
		nextEl.attr("id", imgUrl);
		$(".logoUrl").val(imgUrl);
	});
});

$(".logbox_sure").click(
		function() {
			var logo = $(".logoUrl").val();
			$.ajax({
				url : basePath + 'Library/enterpriseCustom/saveLogo/'
						+ companyId,
				data : {
					logoUrl : logo
				},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					if (data == "ok") {
						$("#logoImgTag").attr("src", logo);

						// 关闭弹窗
						$("#TB_overlayBG").css("display", "none");
						$(".modules").css("display", "none");
						$(".logobox ").css("display", "none");
						$(".removable").remove();
					}
				}
			});
		});

$(".logbox_cancel").click(function() {
	$("#TB_overlayBG").css("display", "none");
	$(".modules").css("display", "none");
	$(".logobox ").css("display", "none");
	$(".removable").remove();
});
/** logo js end */
/** 头部js end */

/** 导航栏js start */

// 鼠标悬停显示设置按钮
$(".joedar_nav").hover(function(event) {
	shadeLayer(event, $(".zhe_z"), $(".box-bar2"));
});

// 设在置面板中，设置导航条颜色时的触发事件
$("#img").bigColorpicker(function(el, color) {
	$(el).css("background-color", color);
	$(".joedar_nav").css("background-color", color);
	$(".course").css("background-color", color);
	
});
// 设在置面板中，设置选中菜单项的颜色
$("#selectedcolor").bigColorpicker(function(el, color) {
	$(el).css("background-color", color);
	$(".activeItem").css("background-color", color);
	activeItemColor = color;
});

//导航栏未被选中文字颜色
$("#wordColor").bigColorpicker(function(el, color) {
	$(el).css("background-color", color);
	$(".navdown").not($(".activeItem")).css("color", color);
	negativeWordColor = color;
});

// 菜单项点击事件
$(".navdown")
		.click(
				function() {
					var a = $(this);
					a.addClass("activeItem");
					var style = 'width: 120px; height: 44px; display: block; position: absolute; font-size: 16px; color: #fff; line-height: 44px; background-color:'
							+ activeItemColor;
					$(".navdown").attr("style",
							"color: " + negativeWordColor + ";");
					a.attr("style", style);
				});

// 显示导航栏设置面板
$("body").on("click",".showbox2",function() {
	var items = getNavigationMsg();
	addNavigationEl(items);
	
	if($(window).height() < $(".box2").height()){
		$(".box2").css("height",$(window).height());
	}
	$("#TB_overlayBG").css({
		display : "block",
		height : $(document).height()
	});

	$(".box2").css({
		left : ($("body").width() - $(".box2").width()) / 2 - 20 + "px",
		top : ($(window).height() - $(".box2").height()) / 2 + "px",
		display : "block"
	});
});

// 获取导航栏信息
function getNavigationMsg() {
	var a;
	var text;
	var itemId;
	var show;
	var href;
	var items = new Array();
	var i = 0;
	var liEl;
	$(".navigationUl li").each(function() {
		liEl = $(this);
		a = liEl.find("a");
		text = a.text();
		itemId = a.attr("id");
		show = a.hasClass("show") ? 'checked="checked"' : '';
		href = liEl.attr("id");
		items[i] = ({
			"itemId" : itemId,
			"text" : text,
			"show" : show,
			"href" : href
		});
		i++;
	});
	return items;
}

// 添加导航栏设置面板数据
function addNavigationEl(items) {
	var html = "";
	var item;
	var length = items.length;
	for ( var i = 0; i < length; i++) {
		item = items[i];
		html += '<div class="index1 removable">' + '<dt class="up_dt" id="item'
				+ item.itemId + '" style="background: none;">';
		html += '<input maxlength="5" type="text" class="item" value="'
				+ item.text + (i == 0 ? '" " disabled="disabled"' : '"')
				+ ' style="margin:0;margin-top:7px;">';
		html += '<img src="' + ctxStatic
				+ '/img/v2/enterpriseCustom/compile.png"></dt>'
				+ '<dd class="setSubpage">'
				+ '<a href="javascript:void(0);" id="' + item.href
				+ '" class="decorate">装修页面</a>' + '</dd>' + '<dd>';
		if (i == 0) {
		} else if (i == 1) {
			html += '<a style="width:22px;height:22px;display:inline-block;"></a>'
					+ '<a class="down" style="width:22px;height:22px;background:url('
					+ ctxStatic
					+ '/img/v2/enterpriseCustom/up_down.png) no-repeat;display:inline-block;background-position:-22px 0;"></a>';
		} else if (i == length - 1) {
			html += '<a class="up" style="width:22px;height:22px;background:url('
					+ ctxStatic
					+ '/img/v2/enterpriseCustom/up_down.png) no-repeat;display:inline-block;"></a>'
					+ '<a class="" style="width:22px;height:22px;display:inline-block;background-position:-22px 0;"></a>';
		} else {
			html += '<a class="up" style="width:22px;height:22px;background:url('
					+ ctxStatic
					+ '/img/v2/enterpriseCustom/up_down.png) no-repeat;display:inline-block;"></a>'
					+ '<a class="down" style="width:22px;height:22px;background:url('
					+ ctxStatic
					+ '/img/v2/enterpriseCustom/up_down.png) no-repeat;display:inline-block;background-position:-22px 0;"></a>';
		}
		html += '</dd>' 
				+ '<dd class="check">' 
				+ '<input type="checkbox" '
				+ item.show 
				+ (i == 0 ? '" " disabled="disabled"' : '"')
				+ ' class="pagenav-status">' + '</dd>' + '</div>';
	}
	$(".box2 .removable").remove();
	var headEl = $(".box2 .mainlist .head");
	headEl.after(html);
}

// 点击互换相邻两元素的信息
function changeElLocation(el, isDown) {
	var temp;
	var bottomDiv = $(el).parent().parent();
	if (isDown) {
		bottomDiv = $(el).parent().parent().next();
	}
	var topDiv = bottomDiv.prev();

	var downDt = bottomDiv.children("dt");
	var upDt = topDiv.children("dt");
	var downInput = downDt.children("input");
	var upInput = upDt.children("input");
	var downDd = bottomDiv.find(".check");
	var upDd = topDiv.find(".check");
	var downCheck = downDd.children("input");
	var upCheck = upDd.children("input");

	temp = downInput.val();
	downInput.val(upInput.val());
	upInput.val(temp);
	temp = downDt.attr("id");
	downDt.attr("id", upDt.attr("id"));
	upDt.attr("id", temp);
	downDd.empty();
	upDd.empty();
	downDd.append(upCheck);
	upDd.append(downCheck);
}

// 获取设置面板的导航栏选项数据
function getItemsMsg() {
	var mainlist = $(".mainlist");
	var divs = mainlist.find("div.index1");
	var length = divs.length;
	var dt;
	var itemName;
	var itemId;
	var show;
	var items = "";
	var divEl;
	for ( var i = 1; i < length; i++) {
		divEl = $(divs[i]);
		dt = divEl.find("dt");
		itemName = dt.find("input").val();
		itemId = dt.attr("id");
		show = divEl.find(".check").find("input").is(":checked");
		items += '{"itemName":"' + itemName + '","itemId":"' + itemId
				+ '","show":' + show + ',"href":"'
				+ divEl.find("a.decorate").attr("id") + '"};';
	}
	return items.substring(0, items.length - 1);
}

// 获取导航栏、菜单项的颜色
function getNavigationColor() {
	var navigationColor = $("#img").css("background-color");
	var activeItemColor = $("#selectedcolor").css("background-color");
	var negativeWordColor = $("#wordColor").css("background-color");
	var color = {};
	color.navigationColor = navigationColor;
	color.activeItemColor = activeItemColor;
	color.negativeWordColor = negativeWordColor;
	return color;
}

// 导航栏设置点击更换顺序事件
$(".mainlist").on("click", ".removable .up", function() {
	changeElLocation(this, false);
});
$(".mainlist").on("click", ".removable .down", function() {
	changeElLocation(this, true);
});

// 设置导航栏窗口中的装修页面事件
$(".box2 .mainlist")
		.on(
				"click",
				".removable .setSubpage",
				function() {
					var ddEl = $(this);
					var href = ddEl.find("a").attr("id");
					$("#cententFrame").attr("src", href);
					var itemId = ddEl.prev().attr("id").replace("item", "");

					// 改变导航栏点击状态
					var aEl = $("li #" + itemId);
					aEl.addClass("activeItem");
					var style = 'width: 120px; height: 44px; display: block; position: absolute; font-size: 16px; color: #fff; line-height: 44px; background-color:'
							+ activeItemColor;
					$(".navdown").attr("style", "");
					aEl.attr("style", style);

					$(".close").click();
				});

// 用户确认提交后，重新设置页面导航栏
function updateNavigation(items, color) {
	var styleStr = 'style="width: 120px; height: 44px; display: block; position: absolute; font-size: 16px; color: #fff; line-height: 44px; background-color:'
			+ activeItemColor + '"';
	var li = '<li id="link"><a class="navdown show" id="itemId" href="javascript:void(0);" style>itemName</a></li>';
	var wordColor = "style='color: " + negativeWordColor + "'";
	itemArray = items.replace(/item/g, "").split(";");
	var item;
	var itemStr;
	var navigation = $(".navigationUl");
	navigation.empty();
	var temp;
	for (index in itemArray) {
		itemStr = itemArray[index];
		item = $.parseJSON(itemStr);
		temp = li.replace("itemName", item.Name).replace("itemId", item.Id)
				.replace("link", item.href);
		if (item.show) {
			if (index == 0) {
				temp = temp.replace("style", styleStr);
			} else {
				temp = temp.replace("style", wordColor);
			}
		}else{
			temp=temp.replace("show","");
			temp=$(temp).css("display","none");
		}
		navigation.append(temp);
	}
}

// 获取导航栏的链接地址
function getNavigationHref() {
	var a;
	var itemId;
	var href;
	var hrefObj = {};
	$(".navigationUl a").each(function() {
		a = $(this);
		itemId = a.attr("id");
		href = a.attr("href");
		hrefObj[itemId] = href;
	});
	return hrefObj;
}

// 确定提交事件
$(".submitNavigation").click(function() {
	var items = getItemsMsg();
	var color = getNavigationColor();
	var url = basePath + "Library/navigation/updateNavigation/" + companyId;
	$.post(url, {
		items : items,
		color : JSON.stringify(color)
	}, function(data, status) {
		if (data) {
			updateNavigation(items, color);
		}
		$(".box2").css({
			display : "none"
		});
		$("#TB_overlayBG").css("display", "none");
	});
});

// 切换导航栏
$(".navigationUl").on("click","li",function() {
	if($(this).find("a.show").length==0){
		return;
	}
	var href = $(this).attr("id");
	window.location=href;
});

//导航栏激活状态设置
$(".navigationUl a").removeClass("activeItem");
$(".navigationUl").find(activeNav).addClass("activeItem");

//导航栏hover效果
$(".navigationUl li").hover(function(){
    $(this).css("background-color",activeItemColor);
},function(){
    $(this).css("background-color",$(".navigation_bar").css("background-color"));
});

/** 导航栏js end */

/** 企业相册js start */
$(".Joedar_photo").hover(function(event) {
	shadeLayer(event, $(".zhe_z12"), $(".box-bar12"));
});
/** 企业相册js end */

/** 服务案例 js start */
// 显示服务案例设置面板
$(".showbox9").click(function() {
	$(".box9").show();
});
/** 服务案例 js end */

/** 售后服务js start */

// 遮罩层
$(".Joedar_sale").hover(function(event) {
	var saleHeight = $(".security").outerHeight(true);
	$(".zhe_z14").css("height", saleHeight);
	shadeLayer(event, $(".zhe_z14"), $(".box-bar14"));
});

// 弹框
$(".showbox14").click(
		function() {
			
			if($(window).height() < $(".box14").height()){
				$(".box14").css("height",$(window).height());
			}
			$("#TB_overlayBG").css({
				display : "block",
				height : $(document).height()
			});
			$(".box14").css(
					{
						left : ($("body").width() - $(".box14").width()) / 2
								- 20 + "px",
						top : ($(window).height() - $(".box14").height()) / 2
								+ "px",
						display : "block"
					});

		});

// 关闭遮罩层和弹框
$(".remove14").click(function() {
	/* $(".joedar_middle").css("display","none"); */
	var rt = delModule(11);
	if (rt == "ok") {
		$(".Joedar_sale").remove();
	} else {
		// 删除模块失败
	}

});

function initUeditor(){
	// 实例化编辑器
	// 建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor("editor", {
		toolbars : [ [ 'undo', 'redo', '|', 'bold', 'italic', 'underline',
				'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor',
				'cleardoc', '|',

				'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

				'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify',
				'|', 'touppercase', 'tolowercase', '|', '|', /*
																 * 'imagenone',
																 * 'imageleft',
																 * 'imageright',
																 * 'imagecenter',
																 * '|',
																 */
				'simpleupload'/* , 'insertvideo','insertimage', */
		] ],
		imageUrlPrefix : "${basePath}hyzl/findImgResourcesURL?str=",
		videoUrlPrefix : "${basePath}hyzl/findImgResourcesURL?str=",
		maximumWords : 300,
		zIndex : 999999
	});
	ue.ready(function() {
		// editor准备好之后才可以使用
		var content = $("#ntContentId").val();
		ue.setContent(content);
	});
}

$(function() {
	$(".suoshufenlei").change(function() {
		if ($(this).find("option:selected").val() != "zhanhuixinxi") {
			$(".for_other").show();
			$(".for_zhanhui").hide();
		} else {
			$(".for_other").hide();
			$(".for_zhanhui").show();
		}
	});
});

// 检查提交和预览的条件是否满足
function checkSubmitCondition() {
	var ntTitileId = $("#ntTitileId").val();
	var ntContentId = $("#ntContentId").val();
	if (ntTitileId == "" || ntTitileId == null) {
		parent.showMess("请填写标题");
		return false;
	} else if (ntContentId == null || ntContentId == "") {
		parent.showMess("请填写正文");
		return false;
	}
	return true;
}

// 将uEditor中的内容填充到textArea中
function fillContent() {
	initUeditor();
	var uecon = UE.getEditor('editor').getContent();
	$("#ntContentId").val(uecon);
}

// 修改表单的action
function changeFormAction(url) {
	$("#formId").attr("action", url);
}

// 提交发布
function saveFB() {
	fillContent();
	// if (checkSubmitCondition()) {
	// changeFormAction("${ctx}/Library/serviceProvition/saveProvition");
	// $("#formId").submit();
	// }
	var title = $("#ntTitileId").val();
	var content = $("#ntContentId").val();
	if (checkSubmitCondition()) {
		$.ajax({
			url : basePath + 'Library/serviceProvition/saveProvition/'
					+ companyId,
			data : {
				ntTitile : title,
				ntContent : content
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				if (data == "ok") {
					$("#spTitle").html(title);
					$("#spContent").html(content);
					closePreview();
					// 关闭弹窗
					$("#TB_overlayBG").css("display", "none");
					$(".box14 ").css("display", "none");
					$(".removable").remove();
					alert("保存成功");
				}
			}
		});
	}
}

// 预览
function preView() {
	
	if($(window).height() < $(".box14_preview").height()){
		$(".box14_preview").css("height",$(window).height());
	}
	
	$(".box14_preview").css({
		left : ($(window).width() - $(".box14_preview").width()) / 2 + "px",
		top : ($(window).height() - $(".box14_preview").height()) / 2 + "px",
	});

	fillContent();
	var ntTitileId = $("#ntTitileId").val();
	var ntContentId = $("#ntContentId").val();

	$(".preTitle").html(ntTitileId);
	$(".preContent").html(ntContentId);
	$(".preview_shade").show();
	$(".box14_preview").show();
}

function closePreview(){
	$(".preview_shade").hide();
	$(".box14_preview").hide();
}
/** 售后服务js end */

/** * 服务类型 js start */

// 点击服务类型，切换右侧图片和描述
$(".flip").eq(0).css("background-color", "rgba(35, 179, 132, 0.61)");
$(".flip").on(
		"click",
		function() {
			$(".flip").css("background-color", "");
			$(this).css("background-color", "rgba(35, 179, 132, 0.61)");
			$("#serTypeImg").attr("src", "");
			$("#serTypeTitle").html("");
			$("#serTypeDesc").html("");
			var typeId = $(this).attr("typeId");
			$.ajax({
				url : basePath + 'Library/serviceType/getTypeInfoByTypeId/'
						+ companyId,
				data : {
					serviceTypeId : typeId
				},
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var cj = data[0];
					if (cj.sta == "ok") {
						var pic = cj.columns.pic1;
						var desc = cj.columns.case_desc;
						var caseName = cj.columns.case_name;
						$("#serTypeImg").attr("src", pic);
						$("#serTypeTitle").html(caseName);
						$("#serTypeDesc").html(desc);

					}
				}
			});

		});

// 提交所选服务类型
$(".mainlist").on("click", ".submitServiceType", function() {
	var lis = $(".service_type");
	var ids = "";
	for ( var i = 0; i < lis.length; i++) {
		var liid = lis.eq(i).attr("typeid");
		ids += liid + ",";
	}
	$.ajax({
		url : basePath + 'Library/serviceType/upadateServiceType/' + companyId,
		data : {
			typeids : ids
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			var cj = data[0];
			if (cj.sta == "ok") {

				// 切换左侧服务类型
				$("#box7_utypes").empty();
				for ( var i = 0; i < lis.length; i++) {
					var $aa = $('<div class="flip" typeId=""></div>');
					var tpid = lis.eq(i).attr("typeid");
					var tpname = lis.eq(i).html();
					$aa.attr("typeId", tpid);
					$aa.html(tpname);
					$("#box7_utypes").append($aa);
				}
				$(".box7").hide();

				if(cj.msgSta == "ok"){
					// 切换右侧图片
					var pic = cj.columns.pic1;
					var desc = cj.columns.case_desc;
					var caseName = cj.columns.case_name;
					$("#serTypeImg").attr("src", pic);
					$("#serTypeTitle").html(caseName);
					$("#serTypeDesc").html(desc);
				}
			}
			// 关闭弹窗
			$("#TB_overlayBG").css("display", "none");
			$(".box7").css("display", "none");
			$(".removable").remove();
		}
	});
});
/** * 服务类型 js end */

/** 公司简介js start */
//企业简介文字颜色
$("#summarywordcolor").bigColorpicker(function(el, color) {
	$(el).css("background-color", color);
	$(".summarywordcolor").css("color", color);
});

// 显示设置面板
$(".showbox5").click(
		function() {
			var bgImg = $(".smBg").css("background-image");
			$(".showSmImg").attr("id", bgImg.replace(/(url|\"|\(|\))/g,""));
			
			if($(window).height() < $(".box5").height()){
				$(".box5").css("height",$(window).height());
			}
			$("#TB_overlayBG").css({
				display : "block",
				height : $(document).height()
			});
			$(".box5").css(
					{
						left : ($("body").width() - $(".box5").width()) / 2
								- 20 + "px",
						top : ($(window).height() - $(".box5").height()) / 2
								+ "px",
						display : "block"
					});
		});

// 上传图片
$(".summaryImg").on("change", function() {
	uploadImgReturnUrl(this, function(imgUrl, thisObj) {
		var nextEl = thisObj.next();
		nextEl.attr("id", imgUrl);
	});
});

// 恢复默认图片
$(".deleteImg").click(function() {
	$(this).attr("id", "delete");
});

// 图片预览
$(".showSmImg").click(function() {
	var imgUrl = $(this).attr("id");
	showImg(imgUrl);
});

// 确认提交设置
$(".submitSummary").click(function() {
	var msg = getSummarySetingMsg();
	var url = basePath + "Library/summary/updateSummary/" + companyId;
	$.post(url, {
		"id" : msg.id,
		"title" : msg.title,
		"desc" : msg.desc,
		"img" : msg.img,
		"wordcolor" : msg.summarywordcolor
	}, function(data, status) {
		if (data) {
			resetSummaryOnPage(msg);
		}
		$(".close").click();
	});
});

// 获取公司简介设置信息
function getSummarySetingMsg() {
	var el = $(".setSummary");
	var img = $(el.find(".showSmImg")).attr("id");
	var title = $(el.find(".smTitle")).val();
	var desc = $(el.find(".smDesc")).val();
	var id = $(".setSummary").attr("id");
	var summarywordcolor = $(".summarywordcolor").css("color");
	var msg = {};
	msg.img = img;
	msg.title = title;
	msg.id = id;
	msg.desc = desc;
	msg.summarywordcolor = summarywordcolor;
	return msg;
}

// 重新设置页面信息
function resetSummaryOnPage(msg) {
	$(".smTitle").text(msg.title);
	$(".smDesc").text(msg.desc);
	$(".showSmImg").attr("id", msg.img);
	$(".smBg").css("background-image", "url(" + msg.img + ")");
	$(".smImg").attr("src", msg.img);
}
/** 公司简介js end */
