<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/>
        <title>公告添加</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        <style type="text/css">
            .row{overflow: hidden;margin-bottom: 15px;}
            .row > *{float:left;margin-right: 10px;}
            .for_zhanhui{display: none}
            .row > span:first-child{width:80px;text-align: right;height:30px;line-height: 30px;}
            .for_tip{height:30px;line-height: 32px;color:#666;font-size: 12px;}
            textarea{margin-left: 25px;border:1px solid #ccc;padding:5px;}
            input[type=text]{width:400px;}
            .for_img{width:150px;height:150px;border:1px solid #ccc;position: relative;line-height: 150px;text-align: center;color:#666;}
            .for_img img{position: absolute;top: 0;left: 0;width:100%;height:100%;}
            .ml_90{margin-left: 90px;}
            .tab_main{min-height: 700px;padding-bottom: 10px;}
        </style>

    </head>
    <body>
    <form action="${ctx}/forum/manage/save" method="post" id="formId">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>论坛公告>公告维护</div>
                <div class="tab_main">
                    <input type="hidden" name="id" value="${fa.id}"/>
                    <div class="row">
                        <span>标题</span>
                        <input type="text" name="annTitle" value="${fa.ann_title}" id="ntTitileId">
                    </div>

                    <div class="row">
                        <span>链接</span>
                        <input type="text" name="annHref" value="${fa.ann_href }" style="margin-left: 0px;"  id="ntContentId">
                    </div>
                    <div class="row">
                        <span>显示顺序</span>
                        <input type="text" name="showOrder" value="${fa.show_order}" style="margin-left: 0px; width:50px;">
                    </div>
                    <div class="row">
                        <!-- <a href="javascript:void(0)" class="normal_btn ml_90" onclick="preView()">预览</a> -->
                        <a href="javascript:void(0)" onclick="saveFB()" class="btn" style="margin-left: 90px;">发布</a>
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
                $(".suoshufenlei").change(function(){
                    if($(this).find("option:selected").val()!="zhanhuixinxi"){
                        $(".for_other").show();
                        $(".for_zhanhui").hide();
                    }else{
                        $(".for_other").hide();
                        $(".for_zhanhui").show();
                    }
                });
            });
            function saveFB(){
            	var ntTitileId =$("#ntTitileId").val();
            	var ntContentId =$("#ntContentId").val();
            	var showOrder = $("form input[name='showOrder']").val();
            	var re = /^[0-9]+$/;
            	if(ntTitileId==""||ntTitileId==null){
            		  parent.showMess("请填写标题");
            	}else if(ntContentId==null||ntContentId==""){
            		  parent.showMess("请填写链接");
            	}else if(!re.test(showOrder)){
            		  parent.showMess("请正确填写顺序号码");
            	}else{
            		  $("#formId").submit();
            	}

            }
           /*  //预览
            function preView(){
        	   	var ntTitileId =$("#ntTitileId").val();
	           	var ntContentId =$("#ntContentId").val();
	           	if(ntTitileId==""||ntTitileId==null){
	          		  parent.showMess("请填写标题");
	          	}else if(ntContentId==null||ntContentId==""){
	          		  parent.showMess("请填写正文");
	          	}else{
	          		window.location.href="${ctx}/notice/AnnouncementYL?ntTitile="+ntTitileId+"&ntContent="+ntContentId+"";
	          	}

            } */
        </script>
    </body>
</html>