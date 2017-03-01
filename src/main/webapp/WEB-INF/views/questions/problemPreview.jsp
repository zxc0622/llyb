<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>常见问题-常见问题预览</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="${ctxStatic}/img/llhb/bitbug_favicon.ico">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
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
            .xinwen_detail p:not(.sub-title){padding-left: 100px;padding-right:100px;color:#333;text-indent:20px;}
            .xinwen_detail img{display: block;width:90%;height:350px;margin:15px auto;}
            .xinwen_detail .btns{text-align: center;}
            .xinwen_detail .btns a{width:80px;height:30px;line-height: 30px;border:1px solid #ccc;color:#333;display: inline-block;margin:0 3px;}
            .xinwen_detail .btns a:hover{background-color: #5EC520;color:#fff;border:1px solid #5EC520;}
            /*新闻详情 结束*/
        </style>
        
    </head>
    <body>
    <form action="saveProblem" method="post" id="formId">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>常见问题>常见问题预览</div>
                <div class="tab_main">
                    <div class="row">
                        <a href="javascript:void(0)"class="normal_btn" onclick="history.go(-1);return false;">返回</a>
                    </div>
                    <div class="qy_m_r_d_main">
                        <div class="xinwen_detail">
	                        	  <h5  >${quesTitle}</h5>
	                            <input type="hidden" id="ntTitileId" name="quesTitle" value="${quesTitle}"/>
                            <p class="sub-title">
                                <span id="time"></span>                 
                            </p>
	                        	     ${quesContent}
                        </div>
                    </div>
                     <textarea style="margin-left: 0px;display: none;"  name="quesContent" id="content" cols="85" rows="30">${quesContent}</textarea>
					   <input type="hidden" id="noticId" name="quesId" value="${quesId}"/>
  					   <input type="hidden" id="quesTypeId" name="quesType" value="${quesType}"/>
	                   <input type="hidden" id="showOrderId"  name="showOrder" value="${showOrder}"/>
                    <div class="t_center">
                        <a href="javascript:void(0)" id="fabu" onclick="saveNotic()" class="btn"style="margin: 15px 0 0;">发布</a>
                    </div>
                </div>
            </div>
            <!-- 右侧结束 -->
        </form>
     

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
        $(function(){
        	var d = new Date();
        	var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
        	$("#time").html("发布时间："+str);
        });
        //发布
        function saveNotic(){
     	  $("#formId").submit();
        }
        //返回
  /*       function goWeiHu(){
        	var ntTitileId =$("#ntTitileId").val();
           	var ntContentId ='${quesContent}';
           	var noticId=$("#noticId").val();
        	var quesTypeId=$("#quesTypeId").val();
        	var showOrderId=$("#showOrderId").val(); 
        	alert(ntContentId);
          		window.location.href="${ctx}/questions/CommonProblemWH?quesTitle="+ntTitileId+"&quesContent="+ntContentId+"&quesType="+quesTypeId+"&showOrder="+showOrderId+"&id="+noticId;
        } */
        </script>
    </body>
</html>


