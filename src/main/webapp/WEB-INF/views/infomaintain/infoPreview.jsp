<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>资讯后台-资讯预览</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        <link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>

        <style type="text/css">
            .row{overflow: hidden;margin-bottom: 15px;}
            .row > *{float:left;margin-right: 10px;}
            .for_zhanhui{display: none}
            .row > span:first-child{width:80px;text-align: right;height:30px;line-height: 30px;}
            
            .ml_90{margin-left: 90px;}
            .t_center{text-align: center;margin-bottom: 15px;}
            /*新闻详情*/
            .xinwen_detail h5{text-align: center;font-size: 16px;font-weight: 400;}
            .xinwen_detail .sub-title{text-align: center;margin-bottom: 15px;}
            .xinwen_detail .sub-title span{margin:0 10px;}
            .xinwen_detail p:not(.sub-title){text-indent: 20px;color:#333;}
            .xinwen_detail img{display: block;width:90%;height:350px;margin:15px auto;}
            .xinwen_detail .btns{text-align: center;}
            .xinwen_detail .btns a{width:80px;height:30px;line-height: 30px;border:1px solid #ccc;color:#333;display: inline-block;margin:0 3px;}
            .xinwen_detail .btns a:hover{background-color: #5EC520;color:#fff;border:1px solid #5EC520;}
            /*新闻详情 结束*/
            
            /*附件样式*/
            .row_right{margin-left:90px;}
            .attachment_div{border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
            .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
            .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
            .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
            .add_attachment_btn>a{color:#5EC520;}
        </style>
        
    </head>
    <body>
    	<form action="${ctx}/infomaintain/submit" method="post">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>资讯维护>资讯预览</div>
                <div class="tab_main">
                    <div class="row">
                        <a href="#" onclick="history.go(-1);return false;" class="normal_btn">返回</a>
                    </div>
                    <div class="qy_m_r_d_main">
                        <div class="xinwen_detail">
                            <h5>${title}</h5>
                            <p class="sub-title">
                                <span>来源:${source}</span><span>发布时间：${date}</span>                 
                            </p>
                             <p>${content}</p>
                             <c:if test="${not empty bigImg}">
                             <img src="${bigImg}" alt="">  
                             </c:if>
                        </div>
                    </div>
                    
                    <div class="t_center">
                        <a href="javascript:issude()"class="btn"style="margin: 15px 0 0;">发布</a>
                    </div>
                    <div class="for_other t_center">
                      
                            <input type="checkbox" disabled="disabled">
                            <span>同步上传到资讯首页头条栏目上</span>
                       
                        
                            <input type="checkbox" disabled="disabled">
                            <span>同步上传到资讯图片栏目上</span>

                            <%--<input type="checkbox" disabled="disabled">
                            <span>同步到首页优蚁资讯</span>--%>
                      
                    </div>
                    <div class="for_zhanhui t_center">
                        <div>
                            <input type="checkbox" disabled="disabled">
                            <span>同步最新展会栏目上</span>
                        </div>
                    </div>
                    <div class="row_right font1" style="border:0px solid red;width:600px;">
                    <p>附件：</p>
					<c:forEach items="${attachList}" var="attach">
						<div class="attachment_div" >
                            <a href="javascript:void(0);" class="tmui-ellipsis font_1" title="${attach.atta_name}">${attach.atta_name}<span class="showfullname"></span></a>
                            <a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>
                            <input type="hidden" name="fileName" value="${attach.atta_name}"/>
                            <input type='hidden' name='filePath' value='${attach.atta_addr}'>
                        </div>
					</c:forEach>
					</div>
                </div>
            </div>
            <!-- 右侧结束 -->
            	<input type="hidden" name="id" value="${id}">
        		<input type="hidden" name="type" value="${type}">
        		<input type="hidden" name="title" value="${title}">
        		<input type="hidden" name="source" value="${source}">
                <input type="hidden" name="seoKeyWords" value="${seoKeyWords}">
                <input type="hidden" name="pageDesc" value="${pageDesc}">
        		<input type="hidden" name="smallImg" value="${smallImg}">
        		<input type="hidden" name="bigImg" value="${bigImg}">
        		<input type="hidden" name="isTop" value="${isTop}">
        		<input type="hidden" name="isPic" value="${isPic}">
                <input type="hidden" name="isYouyi" value="${isYouyi}">
        		<input type="hidden" name="holdPlace" value="${holdPlace}">
        		<input type="hidden" name="holdTime" value="${holdTime}">
        		<input type="hidden" name="isNewShow" value="${isNewShow}">
        		<textarea name="content" style="display:none">${content}</textarea>
        		<input id="sta" type="hidden" name="sta">
        		<input type="hidden" name="showOrder" value="${showOrder}">
        	</form>
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>

        <script type="text/javascript">
	    	$(function(){
	    		if("${isTop}"=="1"){
	    			$(".for_other input:eq(0)").prop("checked",true);
	    		}
	    		if("${isPic}"=="1"){
	    			$(".for_other input:eq(1)").prop("checked",true);
	    		}
	    		if("${isNewShow}"=="1"){
	    			$(".for_zhanhui input:nth-child(1)").prop("checked",true);
	    		}
	    		if("${type}"=="ep_show"){
	    			$(".for_other").css({"display":"none"});
	    			$(".for_zhanhui").css({"display":"block"});
	    		}else{
	    			$(".for_other").css({"display":"block"});
	    			$(".for_zhanhui").css({"display":"none"});
	    		}
	    	});
	    	function issude(){
	    		parent.stopShowEidtor();//停止触发是否放弃编辑弹出框
	    		$("#sta").val("1");
	    		$("form").submit();
	    	}
	    	function goBack(){
	    		history.go(-1);
	    		return false;
	    	}
	    	//删除附件
	    	function removeAttachment(thisobj){
	    		$(thisobj).parent().remove();
	    	}
        </script>
    </body>
</html>