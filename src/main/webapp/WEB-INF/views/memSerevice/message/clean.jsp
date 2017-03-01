<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>站内信件</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>

        <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}

            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 50px;margin-bottom: 200px;overflow: hidden;}
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row>label{width:100px;float:left;text-align: right;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 20px;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;margin-right: 5px;}
            .tab_main .tab_main_row .row_right input[type=radio]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}
            .tab_main .tab_main_row .row_right input[type=text]{border:1px solid #cccccc;text-indent:10px;width:100px;float:left;}
            .tab_main .tab_main_row .row_right img{display:block;float:left;width:20px;height:20px;margin-left: 5px;margin-right: 5px;margin-top:5px;}
            .tab_main .tab_main_row .row_right span{color: #666666;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}

            .tab_main .tab_main_row .row_right textarea{border:1px solid #cccccc;text-indent:10px;width:480px;float:left;height: 200px;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{border:1px solid #cccccc;margin-right: 4px;opacity: 1;vertical-align: middle;}
            .tab_main .tab_main_row .row_right span{vertical-align: middle;}
            .tab_main .tab_main_row2{height: 30px;line-height: 30px;margin-top: 20px;border:1px solid red;}
            .tab_main .tab_main_row2>label{width:100px;float:left;text-align: left;margin-left:15px;border:1px solid yellow;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title .change{position: absolute;top:0;right:0;z-index: 5;background-color: #fff;padding:0 ;display: none;}
            .m_r_title .change a{margin-right: 10px;padding:0 5px;}
            .m_r_title .change a:hover{color:#ee7800;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            .receive_table{width:763px;border:0px;margin-bottom: 10px;overflow: hidden;}
            .receive_head{width:90%;margin-left: 5%;margin-top:20px;border-bottom: 0px solid #E5E5E5;}
            .head_span_1{line-height: 25px;}
            .receive_td_1 input[type=checkbox]{vertical-align: middle;}
            .receive_td_1 label{vertical-align: middle;}
            .receive_td_2 span{vertical-align: middle;}
            .receive_td_3 span{vertical-align: middle;}
            .receive_content{width:90%;margin-left:5%;border:1px solid #E5E5E5;padding:0 0;}
            .receive_content .content_head{width:100%;margin-top:0px;border: 0px solid #E5E5E5;line-height: 45px;color: white;background-color: #5CB531;}
            .receive_content .content_head span{margin-left:4%;}
            .receive_content .content{width:92%;margin-top:10px;line-height: 25px;color: #333333;background-color: white;margin-left:4%;}
            .receive_content .content span{}
            .content_tip{width:92%;margin-top:10px;line-height: 20px;color: #333333;background-color: #FFFDEE;margin-left:4%;border:1px solid #F7AB00;padding:10px;margin-bottom: 20px;}
            .content_tip span{display:block;margin-left: 10px;}
            .receive_operation{width:90%;margin-left: 5%;margin-top:20px;height:30px;border: 0px;line-height: 30px;color: #8A8A8A;}

            /*提示样式*/
            .tip_span{display:block;float:left;font-size:12px;line-height: 30px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(../images/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(../images/wrong.png) 0 0 no-repeat;position: absolute;top:10px;left:-15px;}

            .session_name label{line-height: 25px;}
            .session_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #fff;width:100px;text-align: center;border:1px solid #ccc;}
            .session_confirm_btn{display:block;float:left;margin-left: 20px;color: white;background-color: #5EC520;width:100px;text-align: center;border:1px solid #5EC520;}
            .session_cancel_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #E5E5E5;width:100px;text-align: center;border:1px solid #E5E5E5;}


        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>站内信件</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span onclick="parent.iframeGoToUrl('${ctx}/memSerevice/message/send')">发送信件</span>
                        <span onclick="jump(2)">收件箱</span>
                        <span onclick="jump(1)">已发送</span>
                        <span onclick="jump(0)">草稿箱</span>
                        <span onclick="jump(3)">回收站</span>
                        <span class="m_r_tname">信件清理</span>
                        <span onclick="loca('setup')">信件设置</span>
                    </div>

                    <form action="">
                        <div class="tab_main_row">
                            <label for="">信件</label>
                            <div class="row_right">
                                <input type="radio" id="r1" name="type1" value = "2" checked/><label for="r1">收件箱</label>
                                <input type="radio" id="r2" name="type1" value = "1"/><label for="r2">已发送</label>
                                <input type="radio" id="r3" name="type1" value = "0"/><label for="r3">草稿箱</label>
                                <input type="radio" id="r4" name="type1" value = "3"/><label for="r4">回收站</label>
                            </div>
                        </div>
                        <div class="tab_main_row">
                            <label for="">日期范围</label>
                            <div class="row_right">
                                <input type="text" readonly  class="mh_date"/>&nbsp;
                                <span>&nbsp;&nbsp;</span> 
                                <input type="text" readonly class="mh_date"/>
                                <%-- <img src="${ctxStatic}/img/llhb/date.png" alt=""/> --%>
                                <span class="font_1">&nbsp;请设置合理的时间段，以免遗漏部分信件</span>
                            </div>
                        </div>
                        <div class="tab_main_row">
                            <label for="">选项</label>
                            <div class="row_right">
                                <input type="checkbox" id="c1" name="c1"/>
                                <label for="c1">保留未读信件</label>
                            </div>
                        </div>
                        <div class="tab_main_row">
                            <label for="">&nbsp;</label>
                            <div class="row_right">
                                <a href="javascript:void(0)" class="session_confirm_btn" style="margin-left:0px;">清理</a>
                                <a href="javascript:void(0)" class="session_cancel_btn">重置</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>


        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
        <script type="text/javascript">
            $(function(){
            	//日历
                $("input.mh_date").manhuaDate({		
        			Event : "click",//可选				       
        			Left : 0,//弹出时间停靠的左边位置
        			Top : -16,//弹出时间停靠的顶部边位置
        			fuhao : "-",//日期连接符默认为-
        			isTime : false,//是否开启时间值默认为false
        			beginY : 1949,//年份的开始默认为1949
        			endY :2100//年份的结束默认为2049
        		});
            	
            	$(".tab_main_row:eq(3) .row_right a:eq(0)").click(tijiao);
            });
            //跳转页面
            function loca(str){
	        	   location.href="${ctx}/memSerevice/message/"+str;
	        }
            function jump(str){
	        	   location.href="${ctx}/memSerevice/message/mailbox?index="+str;
		    } 
		    //提交
		    function tijiao(){
		    	var begin =  $(".mh_date:eq(0)").val();
		    	var end =  $(".mh_date:eq(1)").val();
		    	var ss = $(".tab_main_row:eq(0) input[name='type1']:checked").val();
		    	var che = $("input[name='c1']").is(':checked');
		    	var myDate = new Date();
		    	var a = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
		    	var eDate = new Date(end.replace(/-/g,"/"));
		    	var bDate = new Date(begin.replace(/-/g,"/"));
		    	var e = eDate.getFullYear()+"-"+(eDate.getMonth()+1)+"-"+eDate.getDate();
		    	var b = bDate.getFullYear()+"-"+(bDate.getMonth()+1)+"-"+bDate.getDate();
		    	if(begin ==""||end==""){
		    		parent.showMess("请选择时间！");
					return;
		    	}
		    	if(begin!=""&&end!=""&&bDate >=eDate){
			    	  parent.showMess("开始时间不能大于结束时间！");
			    	  return false; 
			    } 
		    	if(a<e){
		    		 parent.showMess("结束时间不能大于今天！");
			    	 return false; 
		    	}
		    	$.ajax({
        			type : "POST",
      				url : "${ctx}/memSerevice/message/cleanS",
      				data : "begin=" + begin+"&end=" + end+"&ss=" + ss+"&che=" + che,
      				dataType : 'text',
      				success : function(data) { 
      					parent.showMess("清除成功！");
      					setTimeout(function(){
		            		$(".popumask", window.parent.document).hide();
		            		$(".pl_normal", window.parent.document).hide();
		            	},1500);
      				}
      			});
		    }
        </script>
    </body>
</html>
