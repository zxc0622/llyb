<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!-- <link rel="shortcut icon" href=""/>  -->
        <title>站内信件</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>

        <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}

            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 50px;margin-bottom: 200px;overflow: hidden;}
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row .main_row_head{height: 100%;margin-left: 5%;}
            .tab_main .tab_main_row .main_row_head input[type=text]{border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 40px;vertical-align: middle;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;}
            .tab_main .tab_main_row .row_right input[type=text]{border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}
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

            .receive_table{width:763px;border:0px;margin-bottom: 10px;}
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

			/*附件样式*/
            .attachment_div{position:relative;border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
            .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
            .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
            .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
            .add_attachment_btn>a{color:#5EC520;}



            .clearfix:after{content:"";clear:width:0;height:0;}
            .showfullname{position:absolute;top:23px;left:0; background:#fff;width:200px;z-index:2; color:#5cb531; border:1px solid #5cb531; padding:1px 3px;}
        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>站内信件</div>
                <div class="tab_main">
                    <div class="m_r_title tab_title">
                      	<span onclick="parent.iframeGoToUrl('${ctx}/memSerevice/message/send')">发送信件</span>
                        <span onclick="jump(2)">收件箱</span>
                        <span onclick="jump(1)">已发送</span>
                        <span onclick="jump(0)">草稿箱</span>
                        <span onclick="jump(3)">回收站</span>
                       <span onclick="loca('clean');">信件清理</span>
                        <span onclick="loca('setup')">信件设置</span>
                    </div>

                    <form action="">
                        <div class="receive_table clearfix">
                            <div class="receive_head">
                                <span class="font_3">${mt.login_name }</span>
                                <br/>
                                <span class="head_span_1">编号：${mt.id }</span><br/>
                                <span class="head_span_1">时间：${fn:substring(mt.create_date, 0, 16)}</span>
                            </div>
                            <div class="receive_content" onclick="">
                                <div class="content_head">
                                    <span class="font_3">${mt.title }</span>
                                </div>
                                <div class="content" onclick="">
                                    <span>${mt.text }</span>
                                    
                                </div>
                              <!--   <div class="content_tip">
                                    <p>
                                        <span>
                                            请注意：此邮件系优蚁网自动发送，请勿直接回复.<br/>
                                            如有些邮件不是你请求的，请忽略并删除！
                                        </span>
                                    </p>

                                </div> -->
								
                            </div>
                             <div class="tab_main_row clearfix" style="height: auto;">
                                 <div class="row_right font1 fujian" style="border:0px solid red;width:600px;">
                                 	 <c:forEach items="${attList }" var="att" varStatus="sta">
                                 	 <c:if test="${ not empty att.attach_url}">
                                 	 	<div class="attachment_div" data-inn="${sta.index}">
		                                    <a href="javascript:void(0);" class="tmui-ellipsis">${att.attach_name }</a>
                                            <span class="showfullname" style="color:black;z-index: 10">${att.attach_name }</span>
		                                    <a href="javascript:void(0);" onclick="downloada('${att.attach_url }')">下载</a>
		                                </div>
                                 	 </c:if>
                            	  </c:forEach>
                                </div>
                                    <!-- <div class="attachment_div">
                                        <a href="javascript:void(0);" class="tmui-ellipsis">00000123123123123123001.png</a>
                                        <a href="javascript:void(0);">删除</a>
                                    </div> -->
                                </div>
                            </div>
                            
							<div class="append"></div>
                            <div class="receive_operation">
                                <a href="javascript:void(0);" class="session_cancel_btn" style="margin-left:0px;" onclick="back();">返回</a>
                                <c:if test="${index != 3 }">
	                                <a href="javascript:void(0);" class="session_btn" onclick="huishou();">回收站</a>
                                </c:if>
                                <c:if test="${index eq 3 }">
	                                <a href="javascript:void(0);" class="session_btn" onclick="huanyuan();" id="huanyuan">还原</a>
                                </c:if>
                                <a href="javascript:void(0);" class="session_btn" onclick="cancel();">彻底删除</a>
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
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                $(".showfullname").hide();
               $(".attachment_div").mouseover(function(){
                    var i = $(this).attr("data-inn");
                    $(".attachment_div").eq(i).find("span").show();
                }).mouseout(function(){
                    var i = $(this).attr("data-inn");
                    $(".attachment_div").eq(i).find("span").hide();
                });
                //显示附件
              /*   if('${attList}'){
                	for(var i=0;i<'${attList}'.size();i++){
                		var divStr = '<div class="attachment_div">' +
                        '<a href="javascript:void(0);" class="tmui-ellipsis font_1">'+'${attList}'[i]+'</a>'+
                        '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+'</div>';
           				$(".fujian").append(divStr);
                	}
                }  */
            	//标题样式
            	$(".m_r_title").removeClass("m_r_title");
            	$(".m_r_tname").removeClass("m_r_tname");
            	var proper = '${index}';
            	$(".tab_title").addClass("m_r_title");
            	if(proper == 0){
	            	$(".tab_title span").eq(3).addClass("m_r_title m_r_tname");
            	}else if(proper == 1){
            		$(".tab_title span").eq(2).addClass("m_r_title m_r_tname");
            	}else if(proper == 2){
            		$(".tab_title span").eq(1).addClass("m_r_title m_r_tname");
            	}else if(proper == 3){
            		$(".tab_title span").eq(4).addClass("m_r_title m_r_tname");
            	}
            });
			
			
			 //跳转
            function loca(str){
	        	   location.href="${ctx}/memSerevice/message/"+str;
	        }
            function jump(str){
	        	   location.href="${ctx}/memSerevice/message/mailbox?index="+str;
		    }
            //下载附件
            function downloada(str){
            	window.open(str);
			}
            //返回
            function back(){
            	var index='${index}';
            	if(index != 0){
            		jump(index);
            	}else{
            		location.href=parent.iframeGoToUrl('${ctx}/memSerevice/message/send');
            	}
            }
            //回收站
            function huishou(){
            	$.ajax({
        			type : "POST",
      				url : "${ctx}/memSerevice/message/recycle",
      				data : "number=${mt.id}&index=${index}",
      				dataType : 'text',
      				success : function(data) { 
      					parent.showMess("已成功放入回收站");
	 					setTimeout(function(){
		            		$(".popumask", window.parent.document).hide();
		            		$(".pl_normal", window.parent.document).hide();
		 					jump('${index}');
		            	},1500);
      				}
			});
            }
            //删除
            function cancel(){
            	parent.showMessYes("确定要删除选中信件吗？此操作不可撤销");
				$(".yes-btn", window.parent.document).unbind().on("click",function(){
					$(".pl_yesorno", window.parent.document).hide();
			    	$.ajax({
			 			type : "POST",
			 			url : "${ctx}/memSerevice/message/delete",
			 			data : "number=${mt.id}&index=${index}",
			 			dataType : 'text',
			 			success : function(data) { 
			 				if(data == "ok"){
			 					parent.showMess("删除成功");
			 					setTimeout(function(){
				            		$(".popumask", window.parent.document).hide();
				            		$(".pl_normal", window.parent.document).hide();
				            		jump('${index}');
				            	},1500);
			 				}
			 			}
			 		});
				});
            }
            /*
            还原
            */
            function huanyuan(){
            	$.ajax({
        			type : "POST",
      				url : "${ctx}/memSerevice/message/huanyuan",
      				data : "number=${mt.id}&index=${index}",
      				dataType : 'text',
      				success : function(data) { 
      					parent.showMess("已成功还原");
	 					setTimeout(function(){
		            		$(".popumask", window.parent.document).hide();
		            		$(".pl_normal", window.parent.document).hide();
		 					jump(3);
		            	},1500);
      				}
			});	
            }
            function go(url){
            	
            }
            
            
            
        </script>
    </body>
</html>