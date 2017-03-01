<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<!-- <link rel="shortcut icon" href=""/>  -->
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

</style>   
</head>
<body>
<div class="main">
<div class="main_right">
    <div class="m_r_position font_1">当前位置>待审核>商品详情</div>
    <div class="tab_main">
        <div class="m_r_title">
            <span  class="m_r_tname">商品详情</span>
        </div>
        <form action="">
            <input id="pro_id" type="hidden" value="${pro.id}"/>
            <div class="tab_main_row ">
                <label for=""><span>*</span>商品分类</label>
                <div id="productType" class="row_right font1">
                    <select>
                    	<option >${pro.first_name}</option>
                    </select>
                   <select>
                    	<option >${pro.second_name}</option>
                    </select>
                    <select>
                    	<option >${pro.third_name}</option>
                    </select>
                </div>     
            </div>
            <div class="tab_main_row">
                <label for=""><span>*</span>商品名称</label>
                <div class="row_right font1" >
                    <input id="pro_name" value="${pro.pro_name}" type="text" readonly>
                    <span class="tip_span">2-30个字</span>
                </div>     
            </div>
            <div class="tab_main_row ">
                <label for="">SEO关键词</label>
                <div class="row_right font1">
                    <input id="seo_key_words" value="${pro.seo_key_words}" type="text" readonly>
                    <span class="tip_span">多个关键字之间使用","分隔,不要超过50字</span>
                </div>
            </div>
            <%--<div class="tab_main_row ">
                <label for="">页面描述</label>
                <div class="row_right font1">
                    <input id="page_desc" value="${pro.page_desc}" type="text" readonly>
                    <span class="tip_span">100字以内</span>
                </div>
            </div>--%>
            <div class="tab_main_row ">
                <label for="">商品所在地</label>
                <div class="row_right font1">
                    <select>
                    	<option value="">${pro.prov_name}</option>
                    </select>
                    <select>
                    	<option value="">${pro.city_name}</option>
                    </select>
                </div>     
            </div>        
            
           <%-- <div class="tab_main_row" style="height:140px;line-height:30px;margin-top:15px; overflow:hidden">
                <label for="" style="height:140px">商品说明</label>
                <div class="row_right font1" style="width:550px; float:left">
                    <textarea id="txt" readonly>${pro.pro_desc}</textarea>
                    
                </div>     
            </div>--%>


            <div class="tab_main_row pics" style="height:210px;">
                <label for="" style="height:60px;"><span>*</span>商品图片</label>
                 <div class="row_right font1" style="width:600px;">
                    <div class="pic_wait_1">
                        <a class="a_1"><img id="pic_1" alt="等待上传" src="${pro.pic1}" style="width:100%;height:100%;"></a>
                        <a href="javascript:picSea(0)" class="a_3">&nbsp;</a>
                    </div>
                     <div class="pic_wait_1">
                        <a class="a_1"><img id="pic_1" alt="等待上传" src="${pro.pic2}" style="width:100%;height:100%;"></a>
                        <a href="javascript:picSea(1)" class="a_3">&nbsp;</a>
                    </div>
                     <div class="pic_wait_1">
                        <a class="a_1"><img id="pic_1" alt="等待上传" src="${pro.pic3}" style="width:100%;height:100%;"></a>
                        <a href="javascript:picSea(2)" class="a_3">&nbsp;</a>
                    </div>
                </div>        
            </div>
            
            
            <div class="tab_main_row_date">
                <label for="">过期时间</label>
                <div class="row_right font1">
                    <input  value="${fn:substring(pro.past_date,0,10)}" type="text" readonly style="width:100px;height:30px"/>
                </div>     
            </div>
            
            
            <div class="tab_main_row_nature">
                <label for="">产品属性</label>
                <div class="row_right font1">
                    <div class="price">
                        	产品单价<input readonly value="${pro.low_price}" type="text"><span>~</span><input id="high_price" value="${pro.high_price }" type="text"><span>元/${pro.unit_name}</span>
                        <input type="checkbox" disabled <c:if test="${pro.low_price == null || pro.high_price == null}"> checked </c:if> ><span>价格面议</span>
                    </div>
                    <div class="total">
                        	供货总量<input readonly value="${pro.amount}" type="text">
                        	<input id="amount_unit" readonly value="${pro.unit_name}" style="border:0px solid #ccc"/>
                       <!--  <select class="unit_select">
                           
                        </select> -->
                    </div>
                </div>     
            </div>


            <div class="tab_main_row"style="height: 120px; line-height: 30px; margin-top: 15px;">
                <label for="" style="height: 120px">商品说明</label>
                <div class="row_right font1" style="width: 600px; float: left;overflow: auto;">
                    <!-- <textarea id="txt">${cs.case_desc }</textarea> -->
                    <%--<textarea id="txt" style="margin-left: 0px;display: none;"  name="content" id="content" cols="85" rows="30"></textarea>--%>
                    <%--<script id="editor" type="text/plain" style="margin-left:12px;width:630px;height:500px;margin-bottom: 20px;"></script>--%>
                    ${pro.pro_desc}
                </div>
            </div>

            <div class="save_or_return">
                <a href="javascript:auditSelected(2,'');" id="submite" class="save_btn" >通过</a>
                <a href="javascript:parent.showText('请输入不通过的原因')" class="return_btn">不通过</a>
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

<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"> </script>

<!--弹出日历选择-->
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    /*var ue = UE.getEditor('editor',{
        toolbars: [[
            'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',

            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|','simpleupload',
            'insertvideo'
        ]],
        imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str=",
        videoUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
    });*/
  /*  ue.ready(function () {
        // editor准备好之后才可以使用
        ue.setContent('${pro.pro_desc}');
    });*/



    $(function(){
		$("body input").unbind();
	});
	//图片预览
	function picSea(n){
		var url=$(".pic_wait_1").eq(n).find(".a_1 img").attr("src");
		parent.picView(url);
	}
	//审核
   	function auditSelected(sta,content){
   		var inputLen = $("table tr:has(td)").length;
   		var ids="${pro.id},";
   		if(ids.length>1){
   			$.ajax({
       			type:"post",
       			url:"${ctx}/auditList/productAudit/audit",
       			data:"ids="+ids+"&sta="+sta+"&content="+content,
       			async:false,
       			success:function(data){
       				if(data!=false){
       					if(sta=="2"){
       						goUrl("${ctx}/auditList/productAudit/pass");
       					}else{
       						goUrl("${ctx}/auditList/productAudit/notAgree");
       					}
       				}else{
       					parent.showMess("审核失败");
       				}
       			}
       		}) 
   		}
   	} 
	function getText(content){
		var sta = 0;
		auditSelected(sta,content);
	}
</script>

</body>
</html>


