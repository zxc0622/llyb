<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- <link rel="shortcut icon" href="#"/>  -->
<title>信息管理-商品管理-添加商品</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
<style type="text/css">
/*详细描述*/

.tab_main .tab_main_row .row_right .tip_span_area{font-size:12px;color:#999; margin-left:15px; display:block; float:left;line-height:18px}

.tab_main .tab_main_row .row_right .pic_wait{ width:510px; margin-left:15px; float:left; margin-top:15px;overflow:hidden;}
.tab_main .tab_main_row .row_right .pic_wait_1{float:left; margin-right:10px; overflow:hidden; width:150px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_1{border:1px solid #ccc; width:148px; height:156px; color:#666; float:left; margin-bottom:10px;line-height: 160px;
													text-align: center;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_1 img{display:block;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
.tab_main .tab_main_row .row_right .tip_span_pic{font-size:12px;color:#999;display:block; float:left;line-height:18px; width:400px; margin-left:15px; margin-top:-10px;}/*提示上传尺寸*/
.tab_main .tab_main_row .row_right .tip_span_pic a{color:#ee7800;}/*提示上传出现问题*/

#txt{text-indent:10px;width:520px; height:110px; padding:1px; margin-left:15px; color:#666;}
/*商品说明*/
.tab_main .tab_main_row .hangyesecond {
	display: none;
}
</style>

</head>
<body>
<div class="main">
<div class="main_right">
    <div class="m_r_position font_1">当前位置>信息管理>商品管理</div>
    <div class="tab_main">
        <div class="m_r_title">
            <span  class="m_r_tname">添加商品</span>
            <span onclick="goUrl('${ctx}/proManage/issue')">已发布</span>
            <span onclick="goUrl('${ctx}/proManage/audit')">审核中</span>
            <span onclick="goUrl('${ctx}/proManage/notAgree')">未通过</span>
            <span onclick="goUrl('${ctx}/proManage/past')">已过期</span>
        </div>
        <form action="">
            <input id="pro_id" type="hidden" value="${pro.id}"/>
            <div class="tab_main_row ">
                <label for=""><span>*</span>商品分类</label>
                <div id="productType" class="row_right font1">
                    <select id="type_first" data-firstid="${pro.first_id}">
                    	<option>请选择</option>
                    </select>
                    <select id="type_second" data-secondid="${pro.second_id}">
                    	<option>请选择</option>
                    </select>
                    <select id="type_third" data-thirdid="${pro.third_id}">
                    	<option>请选择</option>
                    </select>
                </div>
            </div>
            <div class="tab_main_row ">
                <label for=""><span>*</span>商品名称</label>
                <div class="row_right font1">
                    <input id="pro_name" value="${pro.pro_name}" type="text">
                    <span class="tip_span">2-30个字</span>
                </div>
            </div>
            <div class="tab_main_row " style="height:50px;">
                <label for="">SEO关键词</label>
                <div class="row_right font1">
                    <input id="seo_key_words" value="${pro.seo_key_words}" type="text">
                    <span class="tip_span">多个关键字之间使用","分隔,不要超过50字</span> <br/>
                    <span style="color:#999;margin-top:5px;font-size:12px;">填写关键词可以在搜索引擎上得到更好的排名，让客户更容易找到您</span>
                    <input id="page_desc"  value="${pro.page_desc}" type="hidden">
                </div>
            </div>
            <%--<div class="tab_main_row ">
                <label for="">页面描述</label>
                <div class="row_right font1">
                    <input id="page_desc" value="${pro.page_desc}" type="text">
                    <span class="tip_span">100字以内</span>
                </div>
            </div>--%>
            <div class="tab_main_row ">
                <label for="">商品所在地</label>
                <div class="row_right font1">
                    <select id="province" data-provid="${pro.prov_id}">
                    	<option value="">省</option>
                    </select>
                    <select id="city" data-cityid="${pro.city_id}">
                    	<option value="">市</option>
                    </select>
                </div>
            </div>


            <div class="tab_main_row pics" style="height:210px;">
                <label for="" style="height:60px;"><span>*</span>商品图片</label>
                 <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(0);"><img id="pic_1" alt="等待上传" src="${pro.pic1}" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:parent.comPic(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(1);"><img id="pic_2" alt="等待上传" src="${pro.pic2}" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:parent.comPic(1);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(1);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(2);"><img id="pic_3" alt="等待上传" src="${pro.pic3}" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:parent.comPic(2);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(2);">&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳大小为3M,最佳尺寸为340px * 340px<a href="javascript:void(0);"></a></span>
                </div>
            </div>


            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                    <input id="date_input" autocomplete="off" value="${fn:substring(pro.past_date,0,10)}" type="text" class="mh_date" readonly style="width:100px"/>&nbsp;
                    <select id="date_select">

                    </select>
                    <span class="tip_span">不选表示长期有效</span>
                </div>
            </div>


            <div class="tab_main_row_nature">
                <label for="" style="margin-top: 6px;">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        	产品单价<input id="low_price" value="${pro.low_price}" type="text"><span>~</span><input id="high_price" value="${pro.high_price }" type="text"><span>元/</span>

                        <select id="unit" class="unit_select">

                        </select>
						<input type="text" id="myDanwei" value="${pro.unit_desc}">
                        <input type="checkbox" id="priceNull"  <c:if test="${ pro != null && pro.low_price == null && pro.high_price == null}"> checked </c:if> ><span>价格面议</span>
						<label style="color: #AAA"><input id="DIY" type="checkbox"/>自定义单位</label>
                    </div>
                    <div class="total">
                        	供货总量<input id="amount" value="${pro.amount}" type="text">
                        	<input id="amount_unit" readonly="" value="吨" style="border:0px solid #ccc"/>
                       <!--  <select class="unit_select">

                        </select> -->
                    </div>
                </div>
            </div>

            <div class="tab_main_row"style="height: 120px; line-height: 30px; margin-top: 15px;">
                <label for="" style="height: 120px">商品说明</label>
                <div class="row_right font1" style="width: 550px; float: left">
                    <!-- <textarea id="txt">${cs.case_desc }</textarea> -->
                    <textarea id="txt" style="margin-left: 0px;display: none;"  name="content" id="content" cols="85" rows="30"></textarea>
                    <script id="editor" type="text/plain" style="margin-left:12px;width:630px;height:500px;margin-bottom: 20px;"></script>
                </div>
            </div>
            <div class="save_or_return">
                <a href="javascript:void(0)" id="submite" class="save_btn" >提交</a>
                <a href="javascript:void(0)" class="return_btn" onclick="back();">返回</a>
            </div>
        </form>
    </div>
</div>
</div>
<%--<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>--%>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>
<!--弹出日历选择-->
<script type="text/javascript">
    var unit = '${pro.unit}';
    $(function () {
        if (unit>0 || unit == ''){
            $("#myDanwei").hide();
            $("#unit").show();
            $("#DIY").attr("checked",false);
        }else {
            $("#myDanwei").show();
            $("#unit").hide();
            $("#amount_unit").val(pro.unit_desc);
            $("#DIY").attr("checked",true);
        }
    });

	$("#DIY").click(function(){
        var isSelected = $("#DIY").is(":checked");
		if(isSelected){//自定义单位,隐藏掉默认的单位,显示文本框
			$("#myDanwei").show();
			$("#unit").hide();
		}else{
            $("#myDanwei").val("");
			$("#myDanwei").hide();
			$("#unit").show();
		}
	});
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor',{
        toolbars: [[
            'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|','simpleupload',
            'insertvideo'
        ]],
        imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str=",
        videoUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
    });
    ue.ready(function () {
        // editor准备好之后才可以使用
        ue.setContent('${pro.pro_desc}');
    });


    window.onload=loadTypeFirst;
	$(function (){
		$("input.mh_date").manhuaDate({
			Event : "click",//可选
			Left : 0,//弹出时间停靠的左边位置
			Top : -16,//弹出时间停靠的顶部边位置
			fuhao : "-",//日期连接符默认为-
			isTime : false,//是否开启时间值默认为false
			beginY : 1949,//年份的开始默认为1949
			endY :2100//年份的结束默认为2049
		});
	});
	//页面加载完成后加载选择项
	function loadTypeFirst(){
		var stt="";
		//加载商品分类一
		$.ajax({
			type:"post",
			url:"${ctx}/proManage/add/selectType",
			data:"parentId=${productRootID}",
			success:function(data){
				$.each(data, function(index, item) {
					stt += "<option value='"+item.id+"'>" + item.typeName + "</option>";
				});
				$("#type_first").html("<option value=''>请选择</option>"+stt);
				var firstid = $("#type_first").attr("data-firstid");
				if(firstid !=""){
					var index = $("#type_first option[value='"+firstid+"']").index();
					$("#type_first option").eq(index).prop("selected",true).trigger("change");
				}
			}
		});
		//加载省
		var provStt = "";
		$.ajax({
			type:"post",
			url:"${ctx}/proManage/add/selectProvCity",
			data:"id=${provCityRootID}",
			success:function(data){
				$.each(data, function(index, item) {
					provStt += "<option value='"+item.id+"'>" + item.typeName + "</option>";
				});
				$("#province").html("<option value=''>省</option>"+provStt);
				var provid = $("#province").attr("data-provid");
				if(provid !=""){
					var index = $("#province option[value='"+provid+"']").index();
					$("#province option").eq(index).prop("selected",true).trigger("change");
				}
			}
		});
		//加载时间快速选择
		var dataStt = "";
		$.ajax({
			type:"post",
			url:"${ctx}/proManage/add/dateSelectLoad",
			success:function(data){
				$.each(data, function(index, item) {
					dataStt += "<option value='"+item.value+"'>" + item.typeName + "</option>";
				});
				$("#date_select").html("<option value=''>快捷选择</option>"+dataStt);
			}
		});
		//加载计量单位
		 var unitStt = "";
		$.ajax({
			type:"post",
			url:"${ctx}/proManage/add/unitSelect",
			success:function(data){
				$.each(data, function(index, item) {
                    if(item.value == '${pro.unit}'){
                        unitStt += "<option value='"+item.value+"' selected>" + item.typeName + "</option>";
                        $("#amount_unit").val(item.typeName);
                    }else{
                        unitStt += "<option value='"+item.value+"'>" + item.typeName + "</option>";
                    }

				});
				$(".unit_select").html(unitStt);
			}

		})
	}

	//选择分类一，触发分类二内容
	 $("#type_first").on("change",function(){
		var stt = "";
		var obj = $("#type_second");
		if($(this).val()!=null && $(this).val()!=""){
			$.ajax({
				type:"post",
				url:"${ctx}/proManage/add/selectType",
				data:"parentId="+$(this).val(),
				success:function(data){
					$.each(data, function(index, item) {
						stt += "<option value='"+item.id+"'>" + item.typeName + "</option>";
					});
					obj.html(stt);
					var secondid =$("#type_second").attr("data-secondid");
					var firstid = $("#type_first").attr("data-firstid");
					if(secondid !="" && firstid == $("#type_first").val()){
						var index = $("#type_second option[value='"+secondid+"']").index();
						$("#type_second option").eq(index).prop("selected",true).trigger("change");
					}else{
						$("#type_second option").eq(0).trigger("change");//当分类二内容变化时，触发分类三
					}
				}
			})
		}else{
			obj.html("<option value=''>请选择</option>");
			$("#type_second").eq(0).trigger("change");
		}

	});
	//选择分类二，触发分类三
	$("#type_second").on("change",function(){
		var stt = "";
		var obj = $("#type_third");
		if($(this).val()!=null && $(this).val()!=""){
			$.ajax({
				type:"post",
				url:"${ctx}/proManage/add/selectType",
				data:"parentId="+$(this).val(),
				success:function(data){
					$.each(data, function(index, item) {
						stt += "<option value='"+item.id+"'>" + item.typeName + "</option>";
					});
					obj.html(stt);
					var thirdid =$("#type_third").attr("data-thirdid");
					var secondid = $("#type_second").attr("data-secondid");
					if(thirdid !="" && secondid == $("#type_second").val()){
						var index = $("#type_third option[value='"+thirdid+"']").index();
						$("#type_third option").eq(index).prop("selected",true);
					}else{
						$("#type_third option").eq(0);//当分类二内容变化时，触发分类三
					}
				}
			})
		}else{
			obj.html("<option value=''>请选择</option>");
		}

	});
	//选择触发市级菜单
	var url = "${ctx}/proManage/add/selectProvCity";
	$("#province").on("change",function(){
		var stt = "";
		var obj = $("#city");
		if($("#province").val()!=null && $("#province").val()!=""){
			$.ajax({
				type:"post",
				url:url,
				data:"id="+$("#province").val(),
				success:function(data){
					$.each(data, function(index, item) {
						stt += "<option value='"+item.id+"'>" + item.typeName + "</option>";
					});
					obj.html(stt);
					var cityid =$("#city").attr("data-cityid");
					var provid = $("#province").attr("data-provid");
					if(cityid !="" && provid == $("#province").val()){
						var index = $("#city option[value='"+cityid+"']").index();
						$("#city option").eq(index).prop("selected",true);
					}else{
						$("#city option").eq(0).prop("selected",true);
					}
				}
			})
		}else{
			obj.html("<option value=''>市</option>");
		}
	});
	// 上传图片 弹出层方法
	function addPic(str , n){
		$(".pic_wait_1").eq(n).find(".a_1 img").attr("src",str);
	}
	//图片预览
	function picSea(n){
		var url=$(".pic_wait_1").eq(n).find(".a_1 img").attr("src");
		parent.picView(url);
	}
	//图片删除
	function picDel(n){
		$(".pic_wait_1").eq(n).find(".a_1 img").attr("src","");
	}
	function selectTime(){
		var days = $(this).val();
		if(days == 0){
			$(".mh_date").val("");
		}else{
			var now = new Date();
			now.setDate(now.getDate() +  parseInt(days));
			var strTime = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();
			$(".mh_date").val(strTime);
		}
	}
	//回复过期时间样式
	$("#date_input").click(function(){
		$("#date_input").css({"border-color":"#ccc"});
		$("#date_input").parent().find("span").html("不选表示长期有效").css({"color":"#000"});
	});
	//快速获取时间
	$("#date_select").on("change",function(){
		var value = $(this).val();
		if(value!=""){
			$.ajax({
				type:"post",
				url:"${ctx}/proManage/add/getSysDate",
				data:"addDate="+value,
				success:function(data){
					$("#date_input").val(data);
				}
			})
		}else{
			$("#date_input").val("");
		}

	});
	//计量单位选择
	$("#unit").on("change",function(){
		var unit = $("#unit option:selected").html();
		$("#amount_unit").val(unit);
	});
	$("#myDanwei").on("change",function(){
		var unit = $("#myDanwei").val();
		$("#amount_unit").val(unit);
	});

	//类型正确
	var typeRight = false;
	//商品名字正确
	var proNameRight = false;
	//上传图片正确
	var proPicRight = false;
	//过期日期正确
	var pastDateRight = false;
	//产品单价正确
	var proPriceRight = false;
	//产品总量正确
	var proAmountRight = false;
    //关键词与页面描述文字数量是否超标
    var proKeywordsAndDescRight = false;
	$("#submite").click(function(){
		//alert($("#unit option:selected").val());
        if($("#priceNull").attr("checked")){
            $("#low_price").val();
            $("#high_price").val();
        }
        var txt = ue.getContent();//商品描述
		var pic = "";
		if($("#type_first option:selected").val()!="" ){
			typeRight = true;
		}
		if($("#pro_name").val()!=null && $("#pro_name").val()!=""){
			proNameRight=true;
		}
		if($("#pic_1").attr("src")!="" || $("#pic_2").attr("src")!="" || $("#pic_3").attr("src")!=""){
			proPicRight = true;
		}
		if($("#date_input").val()==""){
			pastDateRight = true;
		}

        var myDanwei = $("#myDanwei").val().trim();

        if(( $("#DIY").is(":checked"))){
            if(myDanwei == '' || myDanwei==null || myDanwei.length>10){
                parent.showMess("自定义单位为空或长度大于10!");
                return;
            }

        }
		//判断日期是否正确
		dateIsRight();
		//alert(pastDateRight);
		//判断价格是否正确
		priceRight();
		//判断产品总量是否正确
		amountRight();
        //判断关键词与页面描述字数是否超标
        keywordsAndDescRight();
		if(typeRight && proNameRight && proPicRight && pastDateRight && proPriceRight && proAmountRight && proKeywordsAndDescRight){
			typeRight=false;
			proNameRight=false;
			proPicRight = false;
			pastDateRight = false;
			proPriceRight = false;
			proAmountRight = false;
            proKeywordsAndDescRight = false;
			$.ajax({
				type:"post",
				url:"${ctx}/proManage/add/productAdd",
				data:"typeFirst="+$("#type_first option:selected").val()+"&typeSecond="+$("#type_second option:selected").val()
					+"&typeThird="+$("#type_third option:selected").val()+"&proName="+encodeURIComponent($("#pro_name").val())
					+"&provId="+$("#province option:selected").val()+"&cityId="+$("#city option:selected").val()
					+"&proDesc="+encodeURIComponent(txt)+"&picOne="+$("#pic_1").attr("src")+"&picTwo="+$("#pic_2").attr("src")+"&picThree="+$("#pic_3").attr("src")
					+"&pastDate="+$("#date_input").val()+"&lowPrice="+$("#low_price").val()
					+"&highPrice="+$("#high_price").val()+"&unit="+$("#unit option:selected").val()+"&myDanwei="+$("#myDanwei").val()+"&amount="+$("#amount").val()+"&id="+$("#pro_id").val()
                    +"&seoKeyWords="+encodeURIComponent($("#seo_key_words").val()) + "&pageDesc=" + encodeURIComponent($("#page_desc").val()),
				success:function(){
					if($("#pro_id").val()!=null && $("#pro_id").val()!=""){
                        parent.showMess("修改成功！");
                        setTimeout(function(){
                            $(".popumask", window.parent.document).hide();
                            $(".pl_normal", window.parent.document).hide();
                            goUrl('${ctx}/proManage/audit');
                        },3000);
					}else{
                        parent.showMess("添加成功！");
                        setTimeout(function(){
                            $(".popumask", window.parent.document).hide();
                            $(".pl_normal", window.parent.document).hide();
                            goUrl('${ctx}/proManage/audit');
                        },3000);
					}


				},
				error:function(){
					$(".pl_yes",parent.document).show().find("p").html("添加或修改失败！请检查网络问题");
         		   	$(".popumask",parent.document).show();
         		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
         		   		$(".pl_yes",parent.document).hide();
         		   		$(".popumask",parent.document).hide();
         		   		$(this).unbind();
         		   	});
				}
			})
		}else if(!typeRight){
			$(".pl_yes",parent.document).show().find("p").html("请填写商品类型！");
 		   	$(".popumask",parent.document).show();
 		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
 		   		$(".pl_yes",parent.document).hide();
 		   		$(".popumask",parent.document).hide();
 		   		$(this).unbind();
 		   	});
		}else if(!proNameRight){
			$(".pl_yes",parent.document).show().find("p").html("请填写商品名称！");
 		   	$(".popumask",parent.document).show();
 		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
 		   		$(".pl_yes",parent.document).hide();
 		   		$(".popumask",parent.document).hide();
 		   		$(this).unbind();
 		   	});
		}else if(!proPicRight){
			$(".pl_yes",parent.document).show().find("p").html("请上传图片！");
 		   	$(".popumask",parent.document).show();
 		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
 		   		$(".pl_yes",parent.document).hide();
 		   		$(".popumask",parent.document).hide();
 		   		$(this).unbind();
 		   	});
		}
	});
	//判断过期时间的正确性
	function dateIsRight(){
		if($("#date_input").val()!="" && $("#date_input").val() != null){
			var date = new Date();
			if(new Date(Date.parse($("#date_input").val())) > date){
				pastDateRight = true;
			}else{
				$(".pl_yes",parent.document).show().find("p").html("请正确填写时间！");
 		   		$(".popumask",parent.document).show();
 		   		$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
 		   			$(".pl_yes",parent.document).hide();
 		   			$(".popumask",parent.document).hide();
 		   			$(this).unbind();
 		   		});
				pastDateRight = false;
			}
		}
	}
	//判断单价格式正确
	function priceRight(){
		var lowPrice = $("#low_price").val();
		var highPrice = $("#high_price").val();
		var re = /^[0-9]+\.{0,1}[0-9]{0,2}$/;
		if(lowPrice != "" && highPrice != ""){
			if((re.test(lowPrice) && re.test(highPrice) && parseInt(lowPrice) <= parseInt(highPrice))){
				proPriceRight = true;
			}else{
				proPriceRight = false;
				$(".pl_yes",parent.document).show().find("p").html("请正确填写价格");
     		   	$(".popumask",parent.document).show();
     		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
     		   		$(".pl_yes",parent.document).hide();
     		   		$(".popumask",parent.document).hide();
     			  	$(this).unbind();
     		   	});
			}
		}else if(lowPrice!="" && highPrice==""){
			proPriceRight = false;
			$(".pl_yes",parent.document).show().find("p").html("请将价格填写完整");
   		   	$(".popumask",parent.document).show();
   		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
   		   		$(".pl_yes",parent.document).hide();
   		   		$(".popumask",parent.document).hide();
   			  	$(this).unbind();
   		   	});
		}else if(lowPrice=="" && highPrice!=""){
			proPriceRight = false;
			$(".pl_yes",parent.document).show().find("p").html("请将价格填写完整");
   		   	$(".popumask",parent.document).show();
   		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
   		   		$(".pl_yes",parent.document).hide();
   		   		$(".popumask",parent.document).hide();
   			  	$(this).unbind();
   		   	});
		}else{
			proPriceRight = true;
		}
	}
	//产品总量
	function amountRight(){
		var amount = $("#amount").val();
		var re = /^[0-9]+|[0-9]+\.[0-9]{1,2}$/;
		if(amount!=null && amount!="" ){
			if(re.test(amount)){
				proAmountRight = true;
			}else{
				proAmountRight = false;
				$(".pl_yes",parent.document).show().find("p").html("请填写产品总量为整数");
     		   	$(".popumask",parent.document).show();
     		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
     		   		$(".pl_yes",parent.document).hide();
     		   		$(".popumask",parent.document).hide();
     			  	$(this).unbind();
     		   	});
			}
		}else{
			proAmountRight = true;
		}
	}

    function keywordsAndDescRight(){
        var keyWords = $("#seo_key_words").val();
        var pageDesc = $("#page_desc").val();
        if(keyWords.length <= 50 && pageDesc.length <= 100){
            proKeywordsAndDescRight = true;
        }else{
            proKeywordsAndDescRight = false;
            if(keyWords.length > 50){
                $(".pl_yes",parent.document).show().find("p").html("关键词不要超过50字");
            }else {
                $(".pl_yes",parent.document).show().find("p").html("页面描述不要超过100字");
            }

            $(".popumask",parent.document).show();
            $(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
                $(".pl_yes",parent.document).hide();
                $(".popumask",parent.document).hide();
                $(this).unbind();
            });

        }
    }
	var isCheck = true;
	$(".tab_main_row_nature .row_right .price input:last").click(function(){
		if($(this).attr("checked")){
            $("#low_price").val("");
            $("#high_price").val("");
        }
	})
</script>

</body>
</html>


