<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>供应审核详情</title>
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
/*详细描述*/
.tab_main .tab_main_row .solidChilds {display:none;}
.tab_main .tab_main_row .childshow{display:block;}
.tab_main .tab_main_row .row_right .tip_span_area{font-size:12px;color:#999; margin-left:15px; display:block; float:left;line-height:18px}
.tab_main .tab_main_row .row_right .pic_wait{ width:510px; margin-left:15px; float:left; margin-top:15px;overflow:hidden;}
.tab_main .tab_main_row .row_right .pic_wait_1{float:left; margin-right:10px; overflow:hidden; width:150px;}
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
    <div class="m_r_position font_1">当前位置>系统审核>供应列表</div>
    <div class="tab_main">
        <div class="m_r_title">
            <span>固废供应审核>详情</span>
        </div>
        <form action="">
        	<input type="hidden" value="${supply.id } "  id="id"/>
            <div class="tab_main_row" style="height:170px;">
                <label for="" style="height:170px"><span>*</span>行业分类</label>
               	<!-- 一级分类 -->
               	<c:set var="solids" value="${solids }"/>
				<c:set var="firstList" value="true"/>
                <div class="row_right font1 solids">
                	<select disabled="disabled" name="" id="" onChange="" size="2" style="height:120px">
                     	<c:forEach items="${solids}" var="solid" >
							<c:if test="${solid.parent.id eq (not empty param.parentId?param.parentId:428)}">
								<c:choose>
					             	<c:when test="${solid.id != supply.tone  }">
					             		<option value="${solid.id }">${solid.name}</option>
					             	</c:when>
					             	<c:when test="${solid.id == supply.tone  }">
					             		<option selected="selected" value="${solid.id }">${solid.name}</option>
					             	</c:when>
				             	</c:choose>
							</c:if>
						</c:forEach>
                     </select>
                 </div>
                 <!-- 二级分类 -->
                 <c:forEach items="${solids}" var="solid" >
					 <c:if test="${solid.parent.id eq (not empty param.parentId?param.parentId:428)}">
		            	<div class="row_right font2 solidChilds"  id="${solid.id }">
	                       <select disabled="disabled"  name="" id="" onChange="" size="2" style="height:120px">
							<c:forEach items="${solids}" var="solidChilds">
			                    <c:if test="${solidChilds.parent.id eq supply.tone}">
						             <c:choose>
						             	<c:when test="${solidChilds.id != supply.ttwo  }">
						             		<option value="${solidChilds.id }" >${solidChilds.name}</option>
						             	</c:when>
						             	<c:when test="${solidChilds.id == supply.ttwo  }">
						             		<option selected="selected" value="${solidChilds.id }" >${solidChilds.name}</option>
						             	</c:when>
					             	</c:choose>
						  	    	<c:set var="firstMenu" value="false"/>
						  	    </c:if>
					  	    </c:forEach>
	                       </select>
	                   </div>  
					</c:if>
				</c:forEach>
                 <div class="row_right_se">
                     <input disabled="disabled"  class="select_class" type="text" style="width:150px" value="" /><span>搜索分类</span>
                 </div>
            </div>
            <div class="tab_main_row ">
                <label for=""><span>*</span>信息标题</label>
                <div class="row_right font1">
                    <input disabled="disabled"  type="text" maxlength="60" value="${supply.title }" />
                    <span class="tip_span">2-30个字</span>
                </div>     
            </div>
            <div class="tab_main_row ">
                <label for="">产品关键词</label>
                <div class="row_right font1">
                    <input disabled="disabled"   type="text" value="${supply.words }" />
                    <span class="tip_span">添加后可精确搜索，添加多个产品关键词请用一个空格隔开</span>
                </div>     
            </div>
            
            
            <div class="tab_main_row" style="height:150px;line-height:30px;margin-top:15px;">
                <label for="" style="height:150px">详细描述</label>
                <div class="row_right font1" style="width:550px; float:left">
                	<c:choose>
		             	<c:when test="${ not empty supply.details && supply.details != 'null' }">
		             		<textarea id="txt" disabled="disabled">${supply.details }</textarea>
		             	</c:when>
		             	<c:when test="${empty supply.details || supply.details == 'null' }">
		             		<textarea id="txt" disabled="disabled"> </textarea>
		             	</c:when>
	             	</c:choose>
                    <span class="tip_span_area">1、建议您描述以下方面：产品性能及有点、用途、售后服务、包装等</span>  
                </div>     
            </div>
            
            <div class="tab_main_row pics" style="height:155px;">
                <label for="" style="height:60px;">产品图片</label>
                <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:picSea(0);"><img alt="无" src="${supply.pic1 }" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:picSea(1);"><img alt="无" src="${supply.pic2 }" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(1);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                    </div>
                    <div class="pic_wait_1">
                        <a class="a_1" href="javascript:picSea(2);"><img alt="无" src="${supply.pic3 }" style="width:100%;height:100%;"></a>
                        <a class="a_2" href="javascript:void(0);">&nbsp;</a>
                        <a class="a_3" href="javascript:picSea(2);">&nbsp;</a>
                        <a class="a_4" href="javascript:void(0);">&nbsp;</a>
                    </div>
                    <span class="tip_span_pic">图片最佳尺寸为3M，<a href="javascript:void(0);">上传遇到问题？</a></span>     
                </div>     
            </div>
            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                	<c:choose>
		             	<c:when test="${fn:substring(supply.past, 0, 10) == '9999-12-31'}">
		             		<input disabled="disabled"  type="text" class="mh_date" readonly style="width:100px;" value=""/>&nbsp;
		             	</c:when>
		             	<c:when test="${fn:substring(supply.past, 0, 10) != '9999-12-31'}">
		             		<input disabled="disabled"  type="text" class="mh_date" readonly style="width:100px;" value="${fn:substring(supply.past, 0, 10) }"/>&nbsp;
		             	</c:when>
	             	</c:choose>
                    	
                    <select disabled="disabled" >
                        <option value="">快捷选择</option>
                        <c:forEach items="${period}" var="period">
			            	<option value="${period.value }">${period.label}</option>
					  	</c:forEach>
                    </select>
                    <span class="tip_span">不选表示长期有效</span>
                </div>     
            </div>
            
            <div class="tab_main_row_nature">
                <label for="">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        产品单价<input disabled="disabled"  type="text" value="${supply.lprice }" /><span>~</span><input disabled="disabled"  type="text" value="${supply.hprice }" ><span>元/</span>
                        <select disabled="disabled" >
                            <c:forEach items="${unit}" var="unit">
                            	<c:choose>
					             	<c:when test="${supply.unit != unit.value  }">
					             		<option value="${unit.value }">${unit.label}</option>
					             	</c:when>
					             	<c:when test="${supply.unit == unit.value  }">
					             		<option selected="selected"   value="${unit.value }">${unit.label}</option>
					             	</c:when>
				             	</c:choose>
				            	<option value="${unit.value }">${unit.label}</option>
						  	</c:forEach>
                        </select>
                        <input type="checkbox" disabled  id="priceNull" <c:if test="${supply.lprice eq null && supply.hprice eq null }"> checked </c:if>  > 面议
                    </div>
                    <div class="total">
                        供货总量<input disabled="disabled"  type="text" value="${supply.amount }"  />
                    </div>
                </div>     
            </div>
            <div class="save_or_return" style="width:450px;">
                <a href="javascript:passOrNot('Y','');" class="save_btn">通过</a>
                <a href="javascript:parent.showText('请填写不通过的原因');" class="save_btn" >不通过</a>
            	<a href="javascript:b();" class="save_btn" >返回</a>
            </div>
        </form>
    </div>
</div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<!--弹出日历选择-->
<script type="text/javascript">
	$(document).ready(function(){
		var index='#'+$(".solids select").val();
		$(index).addClass("childshow");
		$(".solids option").on("click",function(){
			$(".childshow").removeClass("childshow");
			var dex='"#'+$(this).val()+'"';
			$(".tab_main_row").find(dex).addClass("childshow");
		});
		if('${remark}' == '1'){
			$(".save_or_return a:eq(0),.save_or_return a:eq(1)").hide();
		}
	});
	//图片预览
	function picSea(n){
		var url=$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src");
		parent.picView(url);
	}
	function passOrNot(res,content){
		parent.hideMessYes();
		var ids='${supply.id}';
		$.ajax({
			type:"POST",
			url:"${ctx}/auditList/supplyAudit/passSupplys",
			data: "ids="+ids+"&res="+res+"&content="+content,
			dataType:'json',
			success:function(data){
				if(data == false){
					parent.showMess("审核失败!");
				}else{
					parent.showMess("审核成功!");
					setTimeout(function(){
						parent.hideMess();
	            		parent.iframeGoToUrl('${ctx}/auditList/supplyAudit?status=1');
	            	},1500);
				}
			}
		});
	}
	function getText(content){
		var res = 'N';
		passOrNot(res,content);
	}
	function b(){
		if('${remark}' == '1'){
			parent.iframeGoToUrl('${ctx}/dataCollection/supply');
		}else{
			parent.iframeGoToUrl('${ctx}/auditList/supplyAudit?status=${status}');
		}
	}
</script>
</body>
</html>