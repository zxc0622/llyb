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
.tab_main .tab_main_row .secolor{color:#808080;}
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
       
        <form action="" id="form">
            
            <div class="tab_main_row" style="height:170px;">
                <label for="" style="height:170px"><span>*</span>行业分类</label>
                    <div class="row_right font1 hangyefirst" >
                        <select name="" id="category"  size="2" style="height:120px" disabled>
                            <c:forEach items="${hangyefirst}" var="hangyef" >
							<c:if test="${hangyef.parent.id eq (not empty param.parentId?param.parentId:428)}">
	                        <c:if test="${r.info_type_first eq  hangyef.id}">
					             <option value="${hangyef.id }" selected="selected" class="secolor">${hangyef.name}</option>
	                        </c:if>
	                          <c:if test="${r.info_type_first !=  hangyef.id}">
					             <option value="${hangyef.id }">${hangyef.name}</option>
	                        </c:if>
							</c:if>
						</c:forEach>
                        </select>
                    </div>
                    <c:forEach items="${hangyefirst}" var="hangyef" >
					 <c:if test="${hangyef.parent.id eq (not empty param.parentId?param.parentId:428)}">
		            	<div class="row_right font2 hangyesecond"  id="${hangyef.id }">
	                       <select name="" id="categorySecond" onChange="" size="2" style="height:120px" disabled>
							<c:forEach items="${hangyefirst}" var="hangyes">
			                    <c:if test="${hangyes.parent.id eq hangyef.id}">
				                     <c:if test="${r.info_type_second eq  hangyef.id}">
						             	<option value="${hangyef.id }" selected="selected" class="secolor">${hangyef.name}</option>
		                       		 </c:if>
		                          	<c:if test="${r.info_type_second !=  hangyef.id}">
						             <option value="${hangyef.id }">${hangyef.name}</option>
		                        	</c:if>
						  	    </c:if>
					  	    </c:forEach>
	                       </select>
	                   </div>  
					</c:if>
				</c:forEach>    
                    <div class="row_right_se" >
                        <input disabled class="select_class" type="text" style="width:150px" id = "sousuotext"><span>搜索分类</span>
                    </div>
            </div>
            <div class="tab_main_row ">
                <label for=""><span>*</span>信息标题</label>
                <div class="row_right font1">
                    <input type="text" id = "title" value="${r.info_title }" disabled>
                    <span class="tip_span">2-30个字</span>
                </div>     
            </div>
            <div class="tab_main_row ">
                <label for="">产品关键词</label>
                <div class="row_right font1">
              
                    <input type="text" id = "keyword" value="${r.key_words }" disabled>
                    <span class="tip_span">添加后可精确搜索，添加多个产品关键词请用一个空格隔开</span>
                </div>     
            </div>
            
            
            <div class="tab_main_row" style="height:150px;line-height:30px;margin-top:15px;">
                <label for="" style="height:150px">详细描述</label>
                <div class="row_right font1" style="width:550px; float:left">
                    <textarea disabled id="txt"><c:if test="${r.details != null}">${r.details}</c:if></textarea>
                    <span class="tip_span_area">1、建议您描述以下方面：产品性能及有点、用途、售后服务、包装等</span>
                     
                </div>     
            </div>
            
            <div class="tab_main_row" style="height:155px;">
                <label for="" style="height:60px;">产品图片</label>
                <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:void(0);" ><img class="imgshow" alt="等待上传" disabled>等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);" >&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1"  href="javascript:void(0);"><img class="imgshow"  alt="等待上传" disabled>等待上传</a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:void(0);"><img class="imgshow" alt="等待上传" disabled>等待上传</a>
                        <a class="a_2" href="jjavascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);" >&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳尺寸为3M，<a href="javascript:void(0);">上传遇到问题？</a></span>     
                </div>     
            </div>
            
            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                	<c:choose>
		             	<c:when test="${fn:substring(r.past_date, 0, 10) == '9999-12-31'}">
		             		<input disabled type="text" class="mh_date" readonly style="width:100px;" id="baozhiqi"  value=""/>&nbsp;
		             	</c:when>
		             	<c:when test="${fn:substring(r.past_date, 0, 10) != '9999-12-31'}">
		             		<input disabled type="text" class="mh_date" readonly style="width:100px;" id="baozhiqi"  value="${fn:substring(r.past_date, 0, 10) }"/>&nbsp;
		             	</c:when>
	             	</c:choose>
                    <select id="selecttime" disabled>
                      <option value="0">快捷选择</option>
                    </select>
                    <span class="tip_span">不选表示长期有效</span>
                </div>     
            </div>
            
            
            <div class="tab_main_row_nature">
                <label for="">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        产品单价<input disabled type="text" value="${r.low_price }"><span>~</span><input disabled type="text" value="${r.high_price }"><span>元/</span>
                        <select disabled>
                        		<option  value="${r.value}">${r.dname}</option>
                        </select>
                        <input type="checkbox" disabled  id="priceNull"> 面议
                    </div>
                    <div class="total">
                        供货总量<input type="text" value="${r.amount }" disabled>
                    </div>
                </div>     
            </div>
			<c:if test="${not empty listnum}">
				<div class="save_or_return">
					<a href="${ctx}/dataCollection/demands" class="save_btn" >返回</a>
				</div>
			</c:if>
			<c:if test="${empty listnum}">
				<div class="save_or_return" style="width:450px;">
					<a href="javascript:void(0)" onclick="pass(2,'')" class="save_btn">通过</a>
					<a href="javascript:parent.showText('请填写不通过的原因');" class="save_btn">不通过</a>
					<a href="javascript:back();" class="save_btn" >返回</a>
				</div>
			</c:if>

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
	});
	$(document).ready(function(){
		
		var index='#'+$(".hangyefirst option:first").val();
		$(index).addClass("xuanzhong");
	/* 	$(".hangyefirst option").on("click",function(){
			$(".xuanzhong").removeClass("xuanzhong");
			var dex='#'+$(this).val();
			$(dex).addClass("xuanzhong");
		}); */
		//加载已经保存过的
		
		$('#category option').each(function () {
            	    if('${r.info_type_first}' == $(this).val()){
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
            			    	    if('${r.info_type_second}' == $(this).val()){
            			    	    	$(this).addClass("secolor");
            			    	    	$(this).attr('selected','selected');
            			    	    } 
            			    	});
            				}
            			});
            	    } 
            	});
	
		if('${r.pic1}'){
			$(".imgshow").eq(0).css("display","block");
			$(".imgshow").eq(0).attr("src",'${r.pic1}');
		}
		if('${r.pic2}'){
			$(".imgshow").eq(1).css("display","block");
			$(".imgshow").eq(1).attr("src",'${r.pic2}');
		}
		if('${r.pic3}'){
			$(".imgshow").eq(2).css("display","block");
			$(".imgshow").eq(2).attr("src",'${r.pic3}');
		}
		if('${r.past_date }'){
			var time = '${r.past_date }';
			var times= time.split(' ');
			$(".mh_date").val(times[0]);
		}
        if('${record.low_price }' == '' && '${record.high_price }' == ''){
            $("#priceNull").attr("checked","checked");
        }
		$(".row_right_se span").one("click",sousuo);
		//$(".yes-btn", window.parent.document).on("click",tijiao);
		$("#selecttime").change(selectTime);
		
	});

	//图片预览
	function picSea(n){
		var url=$(".imgshow").eq(n).attr("src");
		parent.picView(url);
	}
	function back(){
		parent.iframeGoToUrl('${ctx}/auditList/qiugouAudit?con=1');
	}
	
	function getText(content){
		/* if(content == ""){
			parent.showMess("请先填写信息");
			return;
		}else{
			parent.hideMessYes();
			pass(0,content);
		} */
		parent.hideMessYes();
		pass(0,content);
	}
	   function pass(n,str){
		var ss = "";
		if(str != ""){
			ss=str;
		}
   		$.ajax({
       		type : "POST",
       		url : "${ctx}/auditList/qiugouAudit/pass",
       		dataType : "json",
       		async : false,
       		data:"flag="+n+"&pid=${r.id}&content="+ss,
       		success : function(data) {
       			parent.showMess("操作成功");
       			setTimeout(function(){
					parent.hideMess();
            		parent.iframeGoToUrl('${ctx}/auditList/qiugouAudit?con='+n);
            	},1500);
       		}
       	});
   	}	
</script>
</body>
</html>