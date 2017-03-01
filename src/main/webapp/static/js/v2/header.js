$(function() {
	var layer;
	var form;
	layui.use([ 'layer', 'form', 'tree' ], function() {
		layer = layui.layer;
		form = layui.form();
		initFormEvent();// 防止layer form未加载报错
	});
	var details = ",";// 项目详情 id
	var pid;
	var province;
	var city;
	var country = 0;
	var offhead;
	var offline;
	var projectname;
	var headtext;
	var linetext;
	var node;
	var nodes=[];
	var mount={};

	$(".price_shop .hd span").click(function() {
		var title;
		if ($(this).attr("id") == "hp") {
			title = "一站式环评服务，尽在优蚁环保";
		} else if ($(this).attr("id") == "jc") {
			title = "专业精准、快速响应！";
		}
		$(".cur .title").text(title);
		$(".price_shop .hd span").removeClass("current");
		$(this).addClass("current");
	});

	$(".Apply_Now").click(submit);

	function notEmpty(para) {
		return para == null || para == undefined || para == "" ? false : true;
	}

	// 提交报价
	function submit() {
		var index = $(".hd .current").attr("typeValue");
		var name = $(".name").val();
		var tel = $(".tel").val();
		var comp_name = $(".comp_name").val();
		var remarks = $(".remarks").val();
		var prov_id = $(".prov").val();
		var city_id = $(".city").val();
		var isFull = notEmpty(name) && notEmpty(tel) && notEmpty(comp_name)
				&& notEmpty(prov_id) && notEmpty(city_id);
		if (!isFull) {
			layer.msg("请先完善信息", function() {
			});
		} else if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
			layer.msg("请输入正确的手机号码", function() {
			});
		} else {
			$.ajax({
				type : "POST",
				url : ctx + "/protection/saveBase",
				data : "name=" + encodeURIComponent(name) + "&tel=" + tel
						+ "&comp_name=" + encodeURIComponent(comp_name)
						+ "&remarks=" + encodeURIComponent(remarks)
						+ "&prov_id=" + prov_id + "&city_id=" + city_id
						+ "&index=" + index,
				dataType : 'text',
				success : function(data) {
					pid = data;
					var htmlEl;
					if (index == 0) {
						htmlEl = $(".hp_quote");
					} else if (index == 1) {
						htmlEl = $(".jc_quote");
					}
					var id=layer.open({
						type : 1,
						skin : 'layui-layer-rim',
						area : ['610px','600px'],
						content : htmlEl
					});
					$(".tel").val(tel);
				}
			});
		}
	}

	$(".prov").change(
			function() {
				$.ajax({
					type : "POST",
					url : ctx + "/protection/getCity",
					data : "province=" + $(this).val(),
					dataType : 'json',
					success : function(data) {
						var temp;
						$(".city").empty();
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							temp = data[i];
							$(".city").append(
									"<option value ='" + temp.id + "'>"
											+ temp.name + "</option>");
						}
					}
				});
			});

	// 解决layui select ie7 兼容性问题
	$(".line").click(function() {
		$(".line").css("z-index", 999);
		$(this).css("z-index", 9999999999);
		$(this).css("position", "relative");
	});

	function initFormEvent() {
		// 选择城市加载县级
		form.on('select(pop_city)', function(data) {
			city = data.value;
			$.ajax({
				type : "POST",
				url : ctx + "/protection/getCounty",
				data : "city=" + city,
				dataType : 'json',
				success : function(data) {
					var selectEl = $(".country select");
					selectEl.empty();
					var htmls = "";
					if (data.length != 0) {
						htmls += "<option value='0'></option>";
						$.each(data, function(index, item) {
							htmls += "<option value='" + item.id + "'>"
									+ item.name + "</option>";
						});
						selectEl.removeAttr("disabled");
					} else {
						htmls += "<option value='0'></option>";
						selectEl.attr("disabled", "disabled");
					}
					selectEl.append(htmls);
					form.render();
				}
			});
		});
		// 选择省加载市区
		form.on('select(pop_province)', function(data) {
			province = data.value;
			$.ajax({
				type : "POST",
				url : ctx + "/protection/getCity",
				data : "province=" + province,
				dataType : 'json',
				success : function(data) {
					$(".pop_city select").empty();
					var htmls = "<option value='0'></option>";
					$.each(data, function(index, item) {
						htmls += "<option value='" + item.id + "'>" + item.name
								+ "</option>";
					});
					$(".pop_city select").append(htmls);
					form.render();
				}
			});
		});
		// 选择县区 事件
		form.on('select(country)', function(data) {
			country = data.value == undefined ? 0 : data.value;
		});
		// 选择项目类别加载二级类别
		form.on('select(offhead)', function(data) {
			offhead = data.value;
			$.ajax({
				type : "POST",
				url : ctx + "/protection/getOffLine",
				data : "offhead=" + offhead,
				dataType : 'json',
				success : function(data) {
					$(".headline").empty();
					var htmls = "<option value='0'></option>";
					$.each(data, function(index, item) {
						htmls += "<option value='" + item.lid + "'>"
								+ item.lname + "</option>";
					});
					$(".headline").append(htmls);
					form.render();
				}
			});
		});
		// 选择二级项目类别加载项目详情选项
		form.on('select(headline)', function(data) {
			offline = data.value;
			loadDetailsOff();
		});

		// checkbox 事件 增删项目详情 id
		form.on('checkbox', function(data) {
			if (data.elem.checked) {
				details += data.value + ",";
			} else {
				details = details.replace("," + [ data.value ] + ",", ",");
			}
		});

		//选择监测项目类别加载树图
		form.on('select(surHead)', function(data) {
			offhead = data.value;
			$(".jc_quote .check .tree").empty();
			nodes=[];
			$.ajax({
     			type : "POST",
   				url : ctx+"/protection/getJcType",
   				data : "surhead=" +offhead ,
   				dataType : 'json',
   				success : function(data) {
   					nodes=data;
   				},
   				complete:function(){
   					setTree(nodes);
   				}
   			});
		});
	}
	
	//加载树图
	function setTree(nodes){
		$(".jc_quote .check .tree").empty();
		$(".jc_quote .check .selected ul").empty();
		layui.tree({
			elem : '.jc_quote .check .tree',
			nodes : nodes,
			click :function(data){
				node=data;
			}
		});
	}
	
	//树图子节点双击选取
	$(".jc_quote .check .tree").on("dblclick","li ul li a",function(){
		setNode($(this));
	});
	
	function setNode(el){
		el.attr("id",node.id);//为了双击删除已经选取的类型时祛除树图对应节点的状态
		//选取数据
		if(node.isParent!="0"){
			var liEl=$(".jcData").find("#"+node.id);
			if(liEl.length==0){
				$(".jcData").append("<li id='"+node.id+"' leftEl='"+el+"'>"+node.name+"</li>");
				mount[node.parentId]=node.parentId;
			}else{
				liEl.remove();
				delete mount[node.parentId];
			}
		}
		
		//设置选取状态
		el.toggleClass("select");
		if(el.hasClass("select")){
			el.find("i").hide();
			el.find("cite").prepend("<span>√ </span>");
		}else{
			el.find("cite span").remove();
			el.find("i").show();
		}
	}
	
	//双击子节点删除选取
	$(".jcData").on("dblclick","li",function(){
		$(this).remove();
		$(".tree a#"+$(this).attr("id")).toggleClass("select");
		$(".tree a#"+$(this).attr("id")+" cite span").remove();
		$(".tree a#"+$(this).attr("id")+" i").show();
	});
	
	function loadDetailsOff() {
		var offhead = $(".offhead option:selected").val();
		var offline = $(".headline option:selected").val();
		$.ajax({
			type : "POST",
			url : ctx + "/protection/getOffDetail",
			data : "offhead=" + offhead + "&offline=" + offline,
			dataType : 'json',
			success : function(data) {
				$(".check").empty();
				var htmls = "";
				$.each(data, function(index, item) {
					htmls += "<input type='checkbox' value='" + item.detail_id
							+ "'/><span>" + item.dname + "</span>";
				});
				$(".hp_quote .check").append(htmls);
				form.render();
				$(".layui-form-checkbox span").remove();
			}
		});
	}

	// 获取验证码
	$(".getCheckCode").click(function() {
		var tel = $(this).parent().find(".tel").val();
		if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
			layer.msg("手机格式有误！", function() {
			});
			return;
		}
		$.ajax({
			type : "POST",
			url : ctx + "/conn",
			data : "tel=" + tel,
			dataType : 'text',
			success : function(data) {
				if (data == "ok") {
					layer.msg("验证码已发送至您收机，请查收。");
				} else {
					layer.msg("验证码发送失败，请重试。", function() {
					});
				}
			}
		});
	});

	$(".submitHp").click(function() {
		saveDetail();
	});

	function saveDetail() {
		projectname = $(".hp_name").val();
		headtext = $("#offhead .layui-select-title input").val();
		linetext = $("#headline .layui-select-title input").val();
		var tel = $(".checkcode .tel").val();
		var code = $(".checkcode .code").val();
		var value="";
		$(".hp_quote .check .layui-form-checkbox").each(function(index,element){
			value+=$(element).hasClass("layui-form-checked")?"1":"0";
		});
		console.log("this");
		$.ajax({
			type : "POST",
			url : ctx + "/checkCode",
			data : "tel=" + tel + "&checkCode=" + code,
			dataType : 'text',
			success : function(data) {
				if (data != "ok") {
					layer.msg(data, function() {
					});
				} else {
					if (details.length > 3) {
						details = details.substring(1, details.length - 1);
					}
					$.ajax({
						type : "POST",
						url : ctx + "/protection/envSave",
						data : "details=" + details + "&pid=" + pid
								+ "&province=" + province + "&city=" + city
								+ "&country=" + country + "&offhead=" + offhead
								+ "&offline=" + offline + "&projectname="
								+ encodeURIComponent(projectname)
								+ "&headtext=" + headtext + "&value="+value+"&linetext="
								+ linetext,
						dataType : 'text',
						success : function(data) {
							location.href = ctx+'/protection/hbQuoteDetail?pid='
							+ pid;
						}
					});
				}
			}
		});
	}

	$(".help").click(function helpme() {
		window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1&q=7','_blank',
			'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');
	});

	$(".recommend").click(function addnew() {
		layer.msg("我们将推荐公司的相关信息尽快发送到你手机");
	});

	
	//危废快速申请、预约办理
	$(".quickDo").click(function(){
		if(loginSta == "1"){
			window.open(ctx+"/home?str=/ws/productwaste/pwbaseinfo","_blank");
		}else{
			layer.msg("请先登录");
		}
	});
	//危废预约办理
	$(".orderDo").click(function(){
		if(loginSta == "1"){
			window.open(ctx+"/home?str=/ws/productwaste/pwbaseinfo/orderPage","_blank");
		}else{
			layer.msg("请先登录");
		}
	});
	
	//提交监测报价
	$(".submitJc").click(function(){
		projectname = $(".jc_name").val();
		var types="";
		var mountStr="";
		$(".jcData li").each(function(){
			types+=$(this).attr("id")+",";
		});
		types=types.substring(0, types.length-1);
		for(index in mount){
			mountStr+=mount[index]+",";
		}
		mountStr=mountStr.substring(0, mountStr.length-1);
		var data="pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+mountStr+"&projectname="+encodeURIComponent(projectname)+"&value="+types;
		$.ajax({
  			type : "POST",
			url : ctx+"/protection/monSave",
			data : data,
			dataType : 'text',
			success : function(data) {
				location.href = ctx+'/protection/jcQuoteDetail?pid='+pid;
			}
		});	
	});
	
});

// 百度统计代码start
var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?2520978a8aed691b683775cec6230709";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();
// 百度统计代码end
