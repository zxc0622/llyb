<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>信息管理-求购-添加求购</title>
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
.tab_main .tab_main_row .hangyesecond {display:none;}
.tab_main .tab_main_row .xuanzhong{display:block;}
.tab_main .tab_main_row .row_right .tip_span_area{font-size:12px;color:#999; margin-left:15px; display:block; float:left;line-height:18px}
.tab_main .tab_main_row .row_right .pic_wait{ width:510px; margin-left:15px; float:left; margin-top:15px;overflow:hidden;}
.tab_main .tab_main_row .row_right .pic_wait_1{float:left; margin-right:10px; overflow:hidden; width:150px;}
.tab_main .tab_main_row .row_right .pic_wait_1 img{width:100%;height:100%;display:none;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_1{border:1px solid #ccc; height: 110px;width: 140px;line-height: 110px;text-align: center; color:#666; float:left; margin-bottom:10px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
.tab_main .tab_main_row .row_right .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
.tab_main .tab_main_row .row_right .tip_span_pic{font-size:12px;color:#999;display:block; float:left;line-height:18px; width:400px; margin-left:15px; margin-top:-10px;}/*提示上传尺寸*/
.tab_main .tab_main_row .row_right .tip_span_pic a{color:#ee7800;}/*提示上传出现问题*/

#txt{text-indent:10px;width:520px; height:110px; padding:1px; margin-left:15px; color:#666;}

/* 日历修改*/
#baozhiqi{height:30px;}

</style>   
</head>
<body>
<div class="main">
<div class="main_right">
    <div class="m_r_position font_1">当前位置>信息管理>固废求购</div>
    <div class="tab_main">
        <div class="m_r_title">
            <span  class="m_r_tname">添加固废求购</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/qiugou/qiugouPass?order=0')">已发布</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/qiugou/qiugouPass?order=1')">审核中</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/qiugou/qiugouPass?order=2')">未通过</span>
            <span onclick="parent.iframeGoToUrl('${ctx}/qiugou/qiugouPass?order=3')">已过期</span>
        </div>
        <form action="" id="form">
            
            <div class="tab_main_row" style="height:170px;">
                <label for="" style="height:170px"><span>*</span>行业分类</label>
                    <div class="row_right font1 hangyefirst">
                        <select name="" id="category"  size="2" style="height:120px">
                            <c:forEach items="${hangyefirst}" var="hangyef" >
							<c:if test="${hangyef.parent.id eq (not empty param.parentId?param.parentId:428)}">
	                        <c:set value="${record.info_type_first }" var="firstCa"></c:set>
					             <option value="${hangyef.id }">${hangyef.name}</option>
							</c:if>
						</c:forEach>
                        </select>
                    </div>
                    <c:forEach items="${hangyefirst}" var="hangyef" >
					 <c:if test="${hangyef.parent.id eq (not empty param.parentId?param.parentId:428)}">
		            	<div class="row_right font2 hangyesecond"  id="${hangyef.id }">
	                       <select name="" id="categorySecond" onChange="" size="2" style="height:120px">
							<c:forEach items="${hangyefirst}" var="hangyes">
			                    <c:if test="${hangyes.parent.id eq hangyef.id}">
			                    	<option value="${hangyes.id }" >${hangyes.name}</option>
						  	    </c:if>
					  	    </c:forEach>
	                       </select>
	                   </div>  
					</c:if>
				</c:forEach>    
                    <div class="row_right_se" >
                        <input class="select_class" type="text" style="width:150px" id = "sousuotext"><span>搜索分类</span>
                    </div>
            </div>
            <div class="tab_main_row ">
                <label for=""><span>*</span>信息标题</label>
                <div class="row_right font1">
                    <input type="text" id = "title" value="${record.info_title }">
                    <span class="tip_span">2-30个字</span>
                </div>     
            </div>
            <div class="tab_main_row ">
                <label for="">产品关键词</label>
                <div class="row_right font1">
                    <input type="text" id = "keyword" value="${record.key_words }">
                    <span class="tip_span">添加后可精确搜索，添加多个产品关键词请用一个空格隔开</span>
                </div>     
            </div>
            
            
            <div class="tab_main_row" style="height:150px;line-height:30px;margin-top:15px;">
                <label for="" style="height:150px">详细描述</label>
                <div class="row_right font1" style="width:550px; float:left">
                    <textarea id="txt"></textarea>
                </div>     
            </div>
            
            <div class="tab_main_row" style="height:155px;">
                <label for="" style="height:60px;">产品图片</label>
                <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(0);" ><img class="imgshow" alt="等待上传"  >等待上传</a>
                        <a class="a_2" href="javascript:parent.comPic(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(0);" >&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1"  href="javascript:parent.comPic(1);"><img class="imgshow"  alt="等待上传" >等待上传</a>
                        <a class="a_2" href="javascript:parent.comPic(1);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(1);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:parent.comPic(2);"><img class="imgshow" alt="等待上传" >等待上传</a>
                        <a class="a_2" href="javascript:parent.comPic(2);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:picDel(2);" >&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳大小为3M,最佳尺寸为270px * 270px<a href="javascript:void(0);"></a></span>
                </div>     
            </div>
            
            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                    <input type="text" class="mh_date" readonly style="width:100px;" id="baozhiqi" />&nbsp;
                    <select id="selecttime">
                       <option value="0">快捷选择</option>
                       <c:forEach var="time" items="${timeList }">
                       		<c:set value="${time.value }" var="timevalue"></c:set>
                        	<c:set value="${record.pastDate }" var="unit"></c:set>
	                        	<c:choose>
			                		<c:when test="${unit eq timevalue}">
			                			<option value="${time.value}" selected = "selected">${time.label}</option>
			                		</c:when>
		                			<c:otherwise>
						             	<option value="${time.value}">${time.label}</option>
		                			</c:otherwise>
		                		</c:choose>
                       </c:forEach>
                    </select>
                    <span class="tip_span">不选表示长期有效</span>
                </div>     
            </div>
            
            
            <div class="tab_main_row_nature">
                <label for="" style="margin-top: 6px;">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        产品单价<input type="text" value="${record.low_price }"><span>~</span><input type="text" value="${record.high_price }"><span>元/</span>
                        <select>
                        	<c:forEach var="danwei" items="${danweiList }" >
                        	<c:set value="${danwei.value }" var="danweivalue"></c:set>
                        	<c:set value="${record.unit }" var="unit"></c:set>
	                        	<c:choose>
			                		<c:when test="${unit eq danweivalue}">
			                			<option value="${danwei.value}" selected = "selected">${danwei.label}</option>
			                		</c:when>
		                			<c:otherwise>
						             	<option value="${danwei.value}">${danwei.label}</option>
		                			</c:otherwise>
		                		</c:choose>
                            </c:forEach>
                        </select>

                        <input type="checkbox"  id="priceNull"> 面议
                    </div>
                    <div class="total">
                        供货总量<input type="text" value="${record.amount }"><label>吨</label>
                    </div>
                </div>     
            </div>
            <div class="save_or_return">
                <a href="javascript:tijiao();" class="save_btn" >提交</a>
                <a href="javascript:void(0)" class="return_btn">返回</a>
            </div>
        </form>
    </div>
</div>
</div>
 
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

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
		
		var index='#'+$(".hangyefirst option:first").val();
		$(index).addClass("xuanzhong");
		$(".hangyefirst option").on("click",function(){
			$(".xuanzhong").removeClass("xuanzhong");
			var dex='#'+$(this).val();
			$(dex).addClass("xuanzhong");
		});
		//加载已经保存过的
		
		$('#category option').each(function () {
            	    if('${record.info_type_first}' == $(this).val()){
            	    	$(this).attr('selected','selected');
            	    	$.ajax({
            				type : "POST",
            				url : "${ctx}/qiugou/getSecond",
            				data : "parent="+$(this).val(),
            				dataType : 'json',
            				success : function(data) { 
            					var htmls="";
            					$.each(data,function(index, item) {
            							htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
            						});
            					$("#categorySecond").html(htmls);
            					$('#categorySecond option').each(function () {
            			    	    if('${record.info_type_second}' == $(this).val()){
            			    	    	$(this).attr('selected','selected');
            			    	    } 
            			    	});
            				}
            			});
            	    } 
            	});
		if('${record.details}'){
			$("#txt").attr("value",'${record.details}');
		}
		if('${record.pic1}'){
			$(".imgshow").eq(0).css("display","block");
			$(".imgshow").eq(0).attr("src",'${record.pic1}');
		}
		if('${record.pic2}'){
			$(".imgshow").eq(1).css("display","block");
			$(".imgshow").eq(1).attr("src",'${record.pic2}');
		}
		if('${record.pic3}'){
			$(".imgshow").eq(2).css("display","block");
			$(".imgshow").eq(2).attr("src",'${record.pic3}');
		}
		if('${record.past_date }'){
			var time = '${record.past_date }';
			var times= time.split(' ');
			$(".mh_date").val(times[0]);
		}
        if('${record.low_price }' == '' && '${record.high_price }' == ''){
            $("#priceNull").attr("checked","checked");
        }
		$(".row_right_se span").on("click",sousuo);
		//$(".yes-btn", window.parent.document).on("click",tijiao);
		$("#selecttime").change(selectTime);
		
	});
	
	function yesToSub(){
		$(".yes-btn", window.parent.document).off("click",yesToSub);
		tijiao();
	}
	//搜索行业
	function sousuo(){
		var sousuoText = $(".row_right_se span").prev().val();
		var result = false;
		$(".hangyefirst option").each(function(){
			if($(this).text().indexOf(sousuoText) != -1){
				$(this).attr("selected","selected");
				$(".xuanzhong").removeClass("xuanzhong");
				var childId ='#'+ $(this).val();
				$(childId).addClass("xuanzhong");
				result = true;
				return false;
			}
		 });
		if(result == false){
			$(".hangyesecond").each(function(){
				$(this).find("option").each(function(){
					if($(this).text().indexOf(sousuoText) != -1){
						$(this).attr("selected","selected");
						$(".xuanzhong").removeClass("xuanzhong");
						var parentId = $(this).parents(".hangyesecond").attr("id");
						$(".hangyefirst option").each(function(){
							if(parentId == $(this).val()){
								$(this).attr("selected","selected");
							}
						 });
						$(this).parents(".hangyesecond").addClass("xuanzhong");
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
   
	
	
	//提交
	function tijiao(){
		var title = $(".tip_span").eq(0).prev().val();
		var keyword = $(".tab_main_row").eq(2).find("input").val();
		var txt = $("#txt").val();
		var baozhiqi = $("#baozhiqi").val();
		var beginPrice =  $(".price input").eq(0).val();
		var endPrice =  $(".price input").eq(1).val();
    	var danwei = $(".price select").val();
		var mount = $(".total").find("input").val();
		var hangyeone = $(".hangyefirst select").val();
  	    var hangyetwo = $(".hangyesecond option:selected").val();
  	    var file1 = $(".imgshow").eq(0).attr("src");
		var file2 = $(".imgshow").eq(1).attr("src");
		var file3 = $(".imgshow").eq(2).attr("src");
		if(file1==undefined){
			file1="";
		}
		if(file2==undefined){
			file2="";
		}
		if(file3==undefined){
			file3="";
		}
		if(txt==undefined){
			txt="";
		}
		/* if(baozhiqi == null || baozhiqi == ""){
			baozhiqi=$(".tab_main_row_date select").val();
		} */
		if(mount==""){mount =0;}
		if(beginPrice==""){beginPrice=0;}
		if(endPrice==""){endPrice=0;}
		if(title == ""||hangyeone==""||hangyetwo==""){
			parent.showMess("先完善信息！");
			return;
		}/* if(file1==""&&file2==""&&file3==""){
			parent.showMess("先上传至少一张图片！");
			return;
		} */else if(title.length < 2 || title.length > 30){
			parent.showMess("信息标题在2~30个字之间！");
			return;
		}
		else if(baozhiqi == ""&&$(".tab_main_row_date select").val()==""){
			parent.showMess("请输入时间！");
			return;
		}else if(baozhiqi!=""&&!time(baozhiqi)){
  		    parent.showMess("有效日期不正确！");
			return;
		}else if(!shuzi(beginPrice)||!shuzi(endPrice)||!shuzi(mount)){
			parent.showMess("请输入正确的数字格式！");
			return;
		}else if((beginPrice !="" && endPrice == "") || (beginPrice =="" && endPrice != "")){
			parent.showMess("请将价格填写完整！");
			return false;
		}else if(parseFloat(endPrice)<parseFloat(beginPrice)){
			parent.showMess("单价格式错误！");
			return;
		}
		if(baozhiqi == null || baozhiqi == ""){
			baozhiqi='9999-12-31';
		}
		if(beginPrice==0){
			beginPrice="";
		}
		if(endPrice==0){
			endPrice="";
		}
		if($("#priceNull").attr("checked")){
			beginPrice = "";
			endPrice = "";
		}
		$.ajax({
			type : "POST",
			url : "${ctx}/qiugou/saveInfo",
			data : "title=" + title+"&fileone=" + file1+"&filetwo=" + file2+"&filethree=" + file3+"&hangyeone=" + hangyeone+"&hangyetwo=" + hangyetwo+"&keyword=" + keyword+"&txt=" +encodeURIComponent(txt)+"&baozhiqi=" + baozhiqi+"&beginPrice=" + beginPrice+"&endPrice=" + endPrice+"&mount=" + mount+"&danwei=" + danwei+"&qiugouId=" + '${record.id}',
			dataType : 'text',
			success : function(data) {
				if(data == "ok"){
					parent.showMess("提交成功");
	            	setTimeout(function(){
	            		$(".popumask", window.parent.document).hide();
	            		$(".pl_normal", window.parent.document).hide();
	            		location.href = '${ctx}/qiugou/qiugouPass?order=1';
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

    //校验数字
    function shuzi(str){
    	 var re = /\d+(\.\d+)*/ig;
    	 return re.test(str);
    }
  //校验时间
	function time(baozhiqi){
		var flag = false;
		var today=new Date();
		var times=baozhiqi.split('-');
		if(times[0]>today.getFullYear()||(times[0]==today.getFullYear()&&times[1]>(today.getMonth()+1))||(times[0]==today.getFullYear()&&times[1]==today.getMonth()+1&&times[2]>today.getDate())){
			flag=true;
		}
		/* if(times[0]>=today.getFullYear()&&times[1]>=today.getMonth()&&times[2]>today.getDate()){
			flag = true;	
		} */
		return flag ;
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
	$(".tab_main_row_nature  input").css("ime-mode", "disabled"); //CSS设置输入法不可用
	// 上传图片 弹出层方法
	function addPic(str , n){
		$(".imgshow").eq(n).css("display","block");
		$(".imgshow").eq(n).attr("src",str);
		//$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src","${ctx}/findImgResources?imgUrl="+str);
	}
	//图片预览
	function picSea(n){
		var url=$(".imgshow").eq(n).attr("src");
		parent.picView(url);
	}
	//图片删除
	function picDel(n){
		$(".imgshow").eq(n).attr("src","");
		$(".imgshow").eq(n).css("display","none");
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