/** 公共js */

	//初始化layer
	var layer;
	layui.use(['layer'],function(){layer = layui.layer;});

	/**
	 * 遮罩层
	 * 
	 * @param event
	 *            固定参数
	 * @param selectors
	 *            多个选择器,如：s1,s2,s3
	 */
	function shadeLayer(event, selectors) {
		if (showShadeLayer) {
			var selector;
			var type = event.type;
			var agmNum = arguments.length;
			if (type == "mouseover" || type == "mouseenter") {
				for ( var i = 1; i < agmNum; i++) {
					selector = arguments[i];
					$(selector).show();
				}
			} else if (type == "mouseout" || type == "mouseleave") {
				for ( var i = 1; i < agmNum; i++) {
					selector = arguments[i];
					$(selector).hide();
				}
			}
		}
	}

	// 设置窗口关闭事件
	$(".close").click(
			function() {
				$("#TB_overlayBG").css("display", "none");
				$(".modules").css("display", "none");
				$(".box ").css("display", "none");
				$(".box2 ").css("display", "none");
				$(".box4 ").css("display", "none");
				$(".box5 ").css("display", "none");
				$(".box6 ").css("display", "none");
				$(".box7 ").css("display", "none");
				$(".box14 ").css("display", "none");
				$(".removable").remove();
			});

	/** 图片上传相关功能 start * */

	/**
	 * 上传图片调用回调函数 el 文件上传表单 callback （匿名）回调函数
	 */
	function uploadImgReturnUrl(el, callback) {
		var elObj = $(el);
		var cloneEl = elObj.clone(true);
		var elId = elObj.attr("id");
		var imgUrl = "";
		$.ajaxFileUpload({
			url : basePath + "Library/enterpriseCustom/verifyUploadImage/"
					+ companyId,
			secureuri : false,
			fileElementId : elId,
			dataType : 'text',
			success : function(data, status) {
				var startIndex = data.indexOf("{") + 1;
				var endIndex = data.indexOf("}");
				imgUrl = data.substring(startIndex, endIndex);
				if (typeof callback == "function") {
					callback(imgUrl, $("#" + elId));
					layer.msg("图片上传成功！");
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert('上传失败！');
			},
			complete : function(xmlHttpRequest) {
				$("#" + elId).replaceWith(cloneEl);
			}
		});
	}
	
	// layer图片预览
	function showImg(imgUrl) {
		$(".showImgEl").attr("src", imgUrl);
		var div = '<div id="showImgDiv" class="hide layui-layer-wrap" style="display: none;"><img style="height:auto;width:100%" class="showImgEl" src="'
				+ imgUrl + '"></div>';
		$("body").append(div);
		layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage;
			  layer.open({
					type : 1,
					title : false,
					closeBtn : 1,
					area : '800px',
					skin : 'layui-layer-nobg', // 没有背景色
					shadeClose : true,
					content : $("#showImgDiv"),
					end : function(index) {
						$("#showImgDiv").remove();
					}
				});
		});
	}

	/** 图片上传相关功能 end * */

	// 粗略判断浏览器版本
	function browserVersion() {
		var b_version = navigator.appVersion;
		var version = parseFloat(b_version);
		return version;
	}

	// 删除模块
	function delModule(moduleID) {
		var result = "";
		$.ajax({
			url : basePath + "Library/enterpriseCustom/updateModuleShow/"
					+ companyId,
			data : {
				moduleID : moduleID,
				showFlag : "0"
			},
			type : 'post',
			async : false,
			dataType : 'text',
			success : function(data) {
				result = data;
			}
		});
		return result;
	}

	// 增加模块
	function addModule(moduleID) {
		var result = "";
		$.ajax({
			url : basePath + "Library/enterpriseCustom/updateModuleShow/"
					+ companyId,
			data : {
				moduleID : moduleID,
				showFlag : "1"
			},
			type : 'post',
			async : false,
			dataType : 'text',
			success : function(data) {
				result = data;
			}
		});
		return result;
	}

	// 重新加载需要排序的模块到div#sortable中
	var sortable = function() {
		if (showShadeLayer) {
			$("#sortable").append($(".sortableDiv"));
		}
	}();

	// 拖拽改变模块顺序事件
	$("#sortable").sortable(
			{
				cursor : "move",
				opacity : false,
				revert : true,
				update : function(event, ui) {
					var mseq = $(this).sortable("toArray").toString();
					$.ajax({
						url : basePath
								+ "Library/enterpriseCustom/updateModuleSeq/"
								+ companyId,
						data : {
							moduleSeq : mseq
						},
						type : 'post',
						async : false,
						dataType : 'text',
						success : function(data) {
							if (data == "ok") {
								alert("保存模块顺序成功");
							} else {
								alert("保存模块顺序失败");
							}
						}
					});
				}
			});

	// 显示添加模块窗口
	$(".addModule").click(
			function() {
				var url = basePath + "Library/enterpriseCustom/getHideModules/"
						+ companyId;
				var li = '<li id=""></li>';
				var ul = $(".modulesUl");
				ul.empty();

				$.ajax({
					type : "get",
					url : url,
					async : false,
					success : function(data, status) {
						var module;
						var el;
						var typeId;
						var moduleName;
						for (index in data) {
							module = data[index];
							typeId = "type" + module.id;
							moduleName = module.module_type;
							el = $(li);
							el.attr("id", typeId);
							el.text(moduleName);
							ul.append(el);
						}
						if (data.length == 0) {
							$(".notHave2Module").show();
						} else {
							$(".notHave2Module").hide();
						}
					}
				});

				if($(window).height() < $(".modules").height()){
					$(".modules").css("height",$(window).height());
				}
				
				// 窗口
				$("#TB_overlayBG").css({
					display : "block",
					height : $(document).height()
				});

				$(".modules").css(
						{
							left : ($("body").width() - $(".modules").width())
									/ 2 - 20 + "px",
							top : ($(window).height() - $(".modules").height())
									/ 2 + "px",
							display : "block"
						});

				$(".modules").show();

				// 选取显示的模块
				$(".modulesUl li").click(function() {
					$(this).toggleClass("service_type");
				});
			});

	// 确认提交模块显示设置
	$(".submitModules").click(
			function() {
				var moduleIds = "";
				var url = basePath + "Library/enterpriseCustom/setModuleShow/"
						+ companyId;
				$(".modulesUl li.service_type").each(function() {
					var typeId = $(this).attr("id");
					moduleIds += typeId + ",";
				});
				if (moduleIds == "") {
					alert("暂无可添加模块！");
				} else {
					$.post(url, {
						"moduleIds" : moduleIds
					}, function(data, status) {
						if (data) {
							location.reload(true);
						}
					});
				}
			});

	// 所有type=text的input聚焦获得边框变色效果
	$(document).on("focus", "input[type=text]", function() {
		$(this).css("border-color", "#5ec520");
	});

	$(document).on("blur", "input[type=text]", function() {
		$(this).css("border-color", "#e3e3e3");
	});

	// 企业简介textarea聚焦获得边框变色效果
	$(".yin_c.smDesc").focus(function() {
		$(this).css("border-color", "#5ec520");
	});

	$(".yin_c.smDesc").blur(function() {
		$(this).css("border-color", "#e3e3e3");
	});

	/**
	 * 创建页码条工具
	 * 
	 * @param pagecur
	 *            当前页码
	 * @param pagecount
	 *            总页数
	 * @param selector
	 *            选择器
	 */
	function careatePageNum(pagecur, pagecount, selector) {
		var pagenow = Number(pagecur);
		var pagediv = $(selector);
		pagediv.empty();
		var aspan = '<span class="pageindex_span pgn">';
		var bspan = '<span class="pageindex_span">';
		var cspan = '<span class="pageindex_span pgn pagenow">';
		if (pagecount <= 7) {
			for ( var i = 1; i <= pagecount; i++) {
				if (pagenow == i) {
					var $span = $(cspan + i + '</span>');
					pagediv.append($span);
				} else {
					var $span = $(aspan + i + '</span>');
					pagediv.append($span);
				}

			}
		} else if (pagecount > 8) {
			if (pagenow < 4) {
				for ( var i = 1; i <= 3; i++) {
					if (pagenow == i) {
						var $span = $(cspan + i + '</span>');
						pagediv.append($span);
					} else {
						var $span = $(aspan + i + '</span>');
						pagediv.append($span);
					}
				}
				if (pagenow == 3) {
					var $span = $(aspan + 4 + '</span>');
					pagediv.append($span);
				}
				var $asn = $(bspan + '...' + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + (pagecount - 1) + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + pagecount + '</span>');
				pagediv.append($asn);
			} else if (pagenow >= 4 && (pagenow + 3) < pagecount) {
				for ( var i = 1; i <= 2; i++) {
					var $span = $(aspan + i + '</span>');
					pagediv.append($span);
				}
				if (pagenow == 4) {
				} else {
					var $asn = $(bspan + '...' + '</span>');
					pagediv.append($asn);
				}
				$asn = $(aspan + (pagenow - 1) + '</span>');
				pagediv.append($asn);
				$asn = $(cspan + (pagenow) + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + (pagenow + 1) + '</span>');
				pagediv.append($asn);
				var $asn = $(bspan + '...' + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + (pagecount - 1) + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + pagecount + '</span>');
				pagediv.append($asn);
			} else if (pagenow >= 4 && (pagenow + 3) >= pagecount) {
				for ( var i = 1; i <= 2; i++) {
					if (pagenow == i) {
						var $span = $(cspan + i + '</span>');
						pagediv.append($span);
					} else {
						var $span = $(aspan + i + '</span>');
						pagediv.append($span);
					}
				}
				var $asn = $(bspan + '...' + '</span>');
				pagediv.append($asn);
				$asn = $(aspan + (pagenow - 1) + '</span>');
				pagediv.append($asn);
				$asn = $(cspan + (pagenow) + '</span>');
				pagediv.append($asn);
				if ((pagenow + 1) <= pagecount) {
					$asn = $(aspan + (pagenow + 1) + '</span>');
					pagediv.append($asn);
				}

				if ((pagecount - 1) == (pagenow + 1)
						|| (pagecount - 1) == pagenow || pagecount == pagenow) {
				} else {
					$asn = $(aspan + (pagecount - 1) + '</span>');
					pagediv.append($asn);
				}

				if (pagecount == (pagenow + 1) || pagecount == pagenow) {
				} else {
					$asn = $(aspan + pagecount + '</span>');
					pagediv.append($asn);
				}
			}
		}
	}
	
	//获取从服务器中返回的页面的head部分
	function getHtmlHeadContent(html){
		var startIndex=html.indexOf("<head>");
		var endIndex=html.indexOf("</head>");
		var headContent=html.substring(startIndex+6,endIndex);
		return headContent;
	}
	
	//获取从服务器中返回的页面的body部分
	function getHtmlBodyContent(html){
		var startIndex=html.indexOf("<body>");
		var endIndex=html.indexOf("</body>");
		var bodyContent=html.substring(startIndex+6,endIndex);
		return bodyContent;
	}
	
	//	分页控件及其回调函数
	//	callback为触发分页后的回调，函数返回三个参数：
	//	divElSelector 分页元素对象。
	//	obj是一个object类型。包括了分页的所有配置信息。
	//	first一个Boolean类，检测页面是否初始加载。非常有用，可避免无限刷新。
	function paging(divElSelector,totalPage,pageNumber,callback){
		layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage
			  ,layer = layui.layer;
			  laypage({
				    cont: divElSelector
				    ,pages: totalPage
				    ,curr:pageNumber
				    ,skip: true
				    ,jump: function(obj, first){
				    	if (typeof callback === "function"){
				            callback(divElSelector,obj, first); 
				        };
				      }
				  });
			  });
	}
