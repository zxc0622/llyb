<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>信息管理-固废供应-添加固废供应</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
<style type="text/css">
/*行业分类*/
.tab_main .tab_main_row .row_right_se{width:600px;float:left;margin-left:24px; margin-top:5px;}
.tab_main .tab_main_row .row_right_se .select_class[type=text]{width:120px;border:1px solid #cccccc;text-indent:10px; height:30px;}
.tab_main .tab_main_row .row_right_se .select_class[type=text]:focus{border:1px solid #ee7800;}
.tab_main .tab_main_row .row_right_se span{margin-left:10px; border:1px solid #ccc;padding:6px 20px; color:#999;}
.tab_main .tab_main_row .row_right_se span:hover{border:none;color:#FFF; background-color:#5EC520; cursor:pointer}
/*详细描述*/
.tab_main .tab_main_row .solidChilds {display:none;}
.tab_main .tab_main_row .childshow{display:block;}
.tab_main .tab_main_row .row_right .tip_span_area{font-size:12px;color:#999; margin-left:15px; display:block; float:left;line-height:18px}
.tab_main .tab_main_row .row_right .pic_wait{ width:510px; margin-left:15px; float:left; margin-top:15px;overflow:hidden;}
.tab_main .tab_main_row .row_right .pic_wait_1{float:left; margin-right:10px; overflow:hidden; width:150px;}
.tab_main .tab_main_row .row_right .pic_wait_1 img{width:100%;height:100%;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_1{border:1px solid #ccc;height: 110px;width: 140px;line-height: 110px;text-align: center; color:#666; float:left; margin-bottom:10px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
.tab_main .tab_main_row .row_right .tip_span_pic{font-size:12px;color:#999;display:block; float:left;line-height:18px; width:400px; margin-left:25px; margin-top:-10px;}/*提示上传尺寸*/
.tab_main .tab_main_row .row_right .tip_span_pic a{color:#ee7800;}/*提示上传出现问题*/
#txt{text-indent:10px;width:520px; height:110px; padding:1px; margin-left:15px; color:#666;}

</style>   
</head>
<body>
<div class="main">
<div class="main_right">
    <div class="m_r_position font_1">当前位置>信息管理>固废供应</div>
    <div class="tab_main">
        <div class="m_r_title">
            <span  class="m_r_tname">添加固废供应</span>
            <span onclick="goPage(0)">已发布</span>
            <span onclick="goPage(1)">审核中</span>
            <span onclick="goPage(2)">未通过</span>
            <span onclick="goPage(3)">已过期</span>
        </div>
        <form action="">
        	<c:set var="firstId" value="${solids[0].id }"/>
            <div class="tab_main_row" style="height:170px;">
                <label for="" style="height:170px"><span>*</span>行业分类</label>
               	<!-- 一级分类 -->
               	<c:set var="solids" value="${solids }"/>
				<c:set var="firstList" value="true"/>
                <div class="row_right font1 solids">
                	<select name="" id="" onChange="" size="2" style="height:120px">
                     	<c:forEach items="${solids}" var="solid" >
							<c:if test="${solid.parentId eq firstId}">
				             	<option value="${solid.id }">${solid.name}</option>
							</c:if>
						</c:forEach>
                     </select>
                 </div>
                 <!-- 二级分类 -->
                 <c:forEach items="${solids}" var="solid" >
					 <c:if test="${solid.parentId eq firstId}">
		            	<div class="row_right font2 solidChilds"  id="${solid.id }">
	                       <select name="" id="" onChange="" size="2" style="height:120px">
							<c:forEach items="${solids}" var="solidChilds">
			                    <c:if test="${solidChilds.parentId eq solid.id}">
			                    	<option value="${solidChilds.id }" >${solidChilds.name}</option>
						  	    	<c:set var="firstMenu" value="false"/>
						  	    </c:if>
					  	    </c:forEach>
	                       </select>
	                   </div>  
					</c:if>
				</c:forEach>
                 <div class="row_right_se">
                     <input class="select_class" type="text" style="width:150px" value="" /><span>搜索分类</span>
                 </div>
            </div>
            <div class="tab_main_row ">
                <label for=""><span>*</span>信息标题</label>
                <div class="row_right font1">
                    <input type="text" value="" />
                    <span class="tip_span">2-30个字</span>
                </div>     
            </div>
            <div class="tab_main_row ">
                <label for="">产品关键词</label>
                <div class="row_right font1">
                    <input type="text" value="" />
                    <span class="tip_span">添加后可精确搜索，添加多个产品关键词请用一个空格隔开</span>
                </div>     
            </div>
            <div class="tab_main_row" style="height:150px;line-height:30px;margin-top:15px;">
                <label for="" style="height:150px">详细描述</label>
                <div class="row_right font1" style="width:550px; float:left">
                    <textarea id="txt"></textarea>
                </div>     
            </div>
            
            <div class="tab_main_row pics" style="height:155px;">
                <label for="" style="height:60px;">产品图片</label>
                <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(0);"><img alt="等待上传" src="" ></a>
                        <a class="a_2" href="javascript:parent.comPic(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(1);"><img alt="等待上传" src="" ></a>
                        <a class="a_2" href="javascript:parent.comPic(1);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(1);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(2);"><img alt="等待上传" src="" ></a>
                        <a class="a_2" href="javascript:parent.comPic(2);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(2);">&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳大小为3M,最佳尺寸为270px * 270px<a href="javascript:void(0);"></a></span>
                </div>     
            </div>
            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                    <input id="pastTame" type="text" class="mh_date" readonly style="width:100px;" value=""/>&nbsp;
                    <select>
                        <option value="">快捷选择</option>
                        <c:forEach items="${period}" var="period">
			            	<option value="${period.value }">${period.label}</option>
					  	</c:forEach>
                    </select>
                    <span class="tip_span">不选表示长期有效</span>
                </div>     
            </div>
            
            <div class="tab_main_row_nature" >
                <label for="" style="margin-top: 6px;">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        产品单价<input type="text" value="" /><span>~</span><input type="text" value="" /><span>元/</span>
                        <select>
                            <c:forEach items="${unit}" var="unit">
			            	<option value="${unit.value }">${unit.label}</option>
					  	</c:forEach>
                        </select>
                        <input type="checkbox"  id="priceNull"> 面议
                    </div>
                    <div class="total">
                        供货总量<input type="text" value=""  /> <label>吨</label>
                    </div>
                </div>     
            </div>
            <div class="save_or_return">
                <a href="javascript:void(0)" class="save_btn">提交</a>
                <a href="javascript:void(0)" class="return_btn" onclick="back();">返回</a>
            </div>
        </form>
    </div>
</div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<!-- <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script> -->

<!--弹出日历选择-->
<script type="text/javascript">
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
	$(document).ready(function(){
		var index='#'+$(".solids option:first").val();
		$(index).addClass("childshow");
		$(".solids option").on("click",function(){
			$(".childshow").removeClass("childshow");
			var dex='"#'+$(this).val()+'"';
			$(".tab_main_row").find(dex).addClass("childshow");
		});
		$(".row_right_se span").on("click",findSolid);
		$(".tab_main_row_date select").on("change",selectTime);
		//点击提交
		$(".save_btn").on("click",function(){
			var infoTitle = $(".tip_span").eq(0).prev().val();
			var typeFirst = $(".solids select").val();
			var typeSecond = $(".childshow select").val();
			var pic1 = $(".pics .pic_wait_1").eq(0).find(".a_1 img").attr("src");
			var pic2 = $(".pics .pic_wait_1").eq(1).find(".a_1 img").attr("src");
			var pic3 = $(".pics .pic_wait_1").eq(2).find(".a_1 img").attr("src");
			var words = $(".tab_main_row").eq(2).find("input").val();
			var details = $("#txt").val();
			/* if(details == "竞品名称为_____,属于_____类型,具体规格型号为_______,其产生于_______,已有品质鉴定报告，竞买时请注意_________"){
				details="";
			} */
			var lowPrice = $(".price input").eq(0).val();
			var highPrice = $(".price input").eq(1).val();
			var unit = $(".price select").val();
			var amount = $(".total").find("input").val();
			if(infoTitle==""|| infoTitle==null || typeFirst==""|| typeFirst==null || typeSecond==""|| typeSecond==null){
				parent.showMess("请先完善信息！");
				return false;
			}else if(infoTitle.length < 2 || infoTitle.length > 30 ){
				parent.showMess("信息标题在2~30个字之间！");
			}else if(timeCheck() == false){
				parent.showMess("日期不能小于今天！");
				return false;
			}else if(lowPrice.split(".").length >2 ||  highPrice.split(".").length >2){
				parent.showMess("价格格式不对！");
				return false;
			}else if(parseFloat(lowPrice) > parseFloat(highPrice)){
				parent.showMess("最高价格不能低于最低价格！");
				return false;
			}else if((lowPrice !="" && highPrice == "") || (lowPrice =="" && highPrice != "")){
				parent.showMess("请将价格填写完整！");
				return false;
			}else{
				parent.showMessYes("确定提交？");
				$(".yes-btn", window.parent.document).unbind().on("click",yesToSub);
			}
		});
	});
	
	function yesToSub(){
		$(".pl_yesorno", window.parent.document).hide();
		$(".yes-btn", window.parent.document).off("click",yesToSub);
		sub();
	}
	//提交
	function sub(){
		var infoTitle = $(".tip_span").eq(0).prev().val();
		var typeFirst = $(".solids select").val();
		var typeSecond = $(".childshow select").val();
		var words = $(".tab_main_row").eq(2).find("input").val();
		var details = $("#txt").val();
		/* if(details == "竞品名称为_____,属于_____类型,具体规格型号为_______,其产生于_______,已有品质鉴定报告，竞买时请注意_________"){
			details="";
		} */
		var pic1 = $(".pics .pic_wait_1").eq(0).find(".a_1 img").attr("src");
		var pic2 = $(".pics .pic_wait_1").eq(1).find(".a_1 img").attr("src");
		var pic3 = $(".pics .pic_wait_1").eq(2).find(".a_1 img").attr("src");
		var pastDate =$(".mh_date").val();
		if(pastDate == null || pastDate == ""){
			pastDate='9999-12-31';
		}
		var lowPrice = $(".price input").eq(0).val();
		var highPrice = $(".price input").eq(1).val();
		var unit = $(".price select").val();
		var amount = $(".total").find("input").val();
		if($("#priceNull").attr("checked")){
			lowPrice = "";
			highPrice = "";
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/solidsupply/saveSolidSupply",
			data:"typeFirst="+typeFirst+"&typeSecond="+typeSecond+"&amount="+amount+"&infoTitle="+encodeURIComponent(infoTitle)+"&words="+encodeURIComponent(words)+"&details="+encodeURIComponent(details)+"&pic1="+pic1+"&pic2="+pic2+"&pic3="+pic3+"&unit="+unit+"&lowPrice="+lowPrice+"&highPrice="+highPrice+"&pastDate="+pastDate+"&id=" + '${record.id}',
			dataType:'json',
			success:function(data){
				if(data == true){
					parent.showMess("提交成功！");
	            	setTimeout(function(){
	            		$(".popumask", window.parent.document).hide();
	            		$(".pl_normal", window.parent.document).hide();
	            		goPage(1,2);
	            	},3000);
				}else{
					parent.showMess("提交失败！");
				}
			},
			error:function(data){
				parent.showMess("提交失败！");
			}
		}); 
	}
	//验证时间
	function timeCheck(){
		var pastDate = $(".mh_date").val();
		var t = false;
		if(pastDate == "" && $(".tab_main_row_date select").val() ==""){
			t = true;
		}else{
			var today=new Date();
			var times=pastDate.split('-');
			if(times[0]<today.getFullYear()){}
			else if(times[0]==today.getFullYear() && times[1]<(today.getMonth()+1)){}
			else if(times[0]==today.getFullYear() && times[1]==(today.getMonth()+1) && times[2]<today.getDate()){}else{
				t = true;
			}
		}
		return t ;
	}
	
	//行业搜索
	function findSolid(){
		var s = $(".row_right_se span").prev().val();
		var l = $(".solids option").length;
		var result = false;
		$(".solids option").each(function(){
			if($(this).text().indexOf(s) != -1){
				$(this).attr("selected","selected");
				$(".childshow").removeClass("childshow");
				var childId ='#'+ $(this).val();
				$(childId).addClass("childshow");
				result = true;
				return false;
			}
		 });
		if(result == false){
			$(".solidChilds").each(function(){
				$(this).find("option").each(function(){
					if($(this).text().indexOf(s) != -1){
						$(this).attr("selected","selected");
						$(".childshow").removeClass("childshow");
						var parentId = $(this).parents(".solidChilds").attr("id");
						$(".solids option").each(function(){
							if(parentId == $(this).val()){
								$(this).attr("selected","selected");
							}
						 });
						$(this).parents(".solidChilds").addClass("childshow");
						result = true;
						return false;
					}
				});
			});
		}
		if(result==false){
			parent.showMess("您搜索的分类不存在！");
		}
	}
	// 上传图片 弹出层方法
	function addPic(str , n){
		$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src",str);
	}
	//图片预览
	function picSea(n){
		var url=$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src");
		parent.picView(url);
	}
	//图片删除
	function picDel(n){
		$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src","");
	}
	//快捷选择时间
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
	//验证价格
	$(".tab_main_row_nature .price  input").keyup(function(){      
         $(this).val($(this).val().replace(/[^0-9.]/g,''));      
     }).bind("paste",function(){  //CTR+V事件处理      
         $(this).val($(this).val().replace(/[^0-9.]/g,''));       
     }).css("ime-mode", "disabled"); //CSS设置输入法不可用
   //验证总量
 	$(".tab_main_row_nature .total  input").keyup(function(){      
          $(this).val($(this).val().replace(/[^0-9]/g,''));      
      }).bind("paste",function(){  //CTR+V事件处理      
          $(this).val($(this).val().replace(/[^0-9]/g,''));       
      }).css("ime-mode", "disabled"); //CSS设置输入法不可用
   //跳转
     function goPage(str){
    	 location.href="${ctx}/solidsupply/solidSupply?order="+str;
     }
    
     $(".tab_main_row_nature .price  select").change(function(){
    	 var flag = $(this).children('option:selected').val();
    	 if(flag==1){
    //		 $(".tab_main_row_nature .total  lable").remove();
    		 $(".tab_main_row_nature .total  label").html("吨"); 
    	 }else if(flag==2){
     //		 $(".tab_main_row_nature .total  lable").remove();
    		 $(".tab_main_row_nature .total  label").html("辆"); 
    	 }else if(flag==3){
    	//	 $(".tab_main_row_nature .total  lable").remove();
    		 $(".tab_main_row_nature .total  label").html("台"); 
    	 }else{
    //		 $(".tab_main_row_nature .total  lable").remove();		
    		 $(".tab_main_row_nature .total  label").html("个"); 
    	 }
    
     }) 
</script>
</body>
</html>