<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <title>站内信件</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>

        <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}

            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 50px;margin-bottom: 200px;overflow: hidden;}
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row .main_row_head{height: 100%;margin-left: 5%;}
            .tab_main .tab_main_row .main_row_head input[type=text]{height:30px;border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 10px;vertical-align: middle;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;}
            .tab_main .tab_main_row .row_right input[type=text]{height:30px;border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}
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
            .receive_head{width:90%;margin-left: 5%;height:30px;margin-top:20px;border-bottom: 1px solid #E5E5E5;}
            .receive_td_1{float:left;width:60%;text-align: left;height: 100%    ;}
            .receive_td_1 input[type=checkbox]{vertical-align: middle;}
            .receive_td_1 label{vertical-align: middle;}
            .receive_td_1 label:hover{cursor: pointer;color:#5EC520;}
            .receive_td_2{float:left;width:15%;text-align: left;height: 100%;}
            .receive_td_3{float:left;width:25%;text-align: left;height: 100%;}
            .receive_td_2 span{vertical-align: middle;}
            .receive_td_3 span{vertical-align: middle;}
            .receive_content{width:90%;margin-left: 5%;height:45px;border-bottom: 1px dashed #E5E5E5;line-height: 45px;color: #8A8A8A;}
            .receive_operation{width:90%;margin-left: 5%;margin-top:50px;height:30px;border: 0px;line-height: 30px;color: #8A8A8A;}

            /*提示样式*/
            .tip_span{display:block;float:left;font-size:12px;line-height: 30px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(../images/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(../images/wrong.png) 0 0 no-repeat;position: absolute;top:10px;left:-15px;}

            .session_name label{line-height: 25px;}
            .session_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #fff;width:100px;text-align: center;border:1px solid #ccc;}
            .session_confirm_btn{display:block;float:left;margin-left: 20px;color: white;background-color: #5EC520;width:100px;text-align: center;border:1px solid #5EC520;}
            .session_cancel_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #E5E5E5;width:100px;text-align: center;border:1px solid #E5E5E5;}
			/*加粗样式*/
			.jiacu{ font-weight:800}

        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>站内信件</div>
                <div class="tab_main">
                    <div class="m_r_title tab_title">
                        <span onclick="parent.iframeGoToUrl('${ctx}/memSerevice/message')">发送信件</span>
                        <span onclick="jump(2)">收件箱</span>
                        <span onclick="jump(1)">已发送</span>
                        <span onclick="jump(0)">草稿箱</span>
                        <span onclick="jump(3)">回收站</span>
                        <span onclick="loca('clean');">信件清理</span>
                        <span onclick="loca('setup')">信件设置</span>
						<c:if test="${not empty jumpurl&&index == 1 }">
							<span onclick="jumpurl('${jumpurl }');">返回危废</span>
						</c:if>
						<c:if test="${not empty jumpurl&&index == 2 }">
							<span onclick="jumpurl('${jumpurl }');">返回危废</span>
						</c:if>
                    </div>

                    <form action="">
                        <div class="tab_main_row ">
                            <div class="main_row_head">
                                <input type="text" >
                                <a href="javascript:void(0);" class="session_confirm_btn"style="margin-left:5px">搜索</a>
                                <a href="javascript:void(0);" class="session_btn"style="margin-left:5px">重置</a>
                            </div>

                        </div>
                        <div class="receive_table">
                            <div class="receive_head">
                                <div class="receive_td_1">
                                    <input type="checkbox" id="c1"/>&nbsp;&nbsp;<label for="c1">标题</label>
                                </div>
                                <div class="receive_td_2">
                                    <span>发件人</span>
                                </div>
                                <div class="receive_td_3">
                                    <span>时间</span>
                                </div>
                            </div>
                            <c:forEach items="${messageList }" var="message">
                            	<div class="receive_content">
	                                <div class="receive_td_1 tmui-ellipsis ">
	                                    <input type="checkbox" id="c2" name="choose" value="${message.id }"/>
	                                    <c:choose>
	                                    	<c:when test="${index eq 2 }">
	                                    		 <c:choose>
			                                    	<c:when test="${message.rec_sta eq false}">
			                                    		<b><label class="jiacu" onclick="content(${message.id});">
					                                        &nbsp;&nbsp;${message.title }
					                            		</label></b>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<label onclick="content(${message.id});">
					                                        &nbsp;&nbsp;${message.title }
					                            		</label>
			                                    	</c:otherwise>
		                                   		 </c:choose>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<label onclick="content(${message.id});">
					                                        &nbsp;&nbsp;${message.title }
					                            </label>
	                                    	</c:otherwise>
	                                    </c:choose>
	                                    <c:if test="${index eq 2 }">
		                                   
	                                    	
	                                    </c:if>
	                                    
	                                </div>
	                                <div class="receive_td_2 font_1">
	                                <c:choose>
	                                	<c:when test="${index eq 2 }">
	                                		<c:choose>
		                                    	<c:when test="${message.rec_sta eq false}">
		                                    		<b> <span class="jiacu">${message.login_name }</span></b>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		 <span>${message.login_name }</span>
		                                    	</c:otherwise>
		                                 	</c:choose>
	                                	</c:when>
	                                	<c:otherwise>
	                                		 <span>${message.login_name }</span>
	                                	</c:otherwise>
	                                </c:choose>
		                                 
	                                   
	                                </div>
	                                <div class="receive_td_3 font_1">
	                                    <span>${fn:substring(message.create_date, 0, 16)}</span>
	                                </div>
                           		 </div>
                            </c:forEach>
                               <!--翻页-->
				            
                            <div class="receive_operation">
                            	<c:if test="${index eq 2 }">
	                                <a href="javascript:void(0);" class="session_btn" style="margin-left:0px;" id="read">标记已读</a>
                            	</c:if>	
                            	<c:choose >
                            		<c:when test="${index !=  2 && index != 3 }">
                                	 	<a href="javascript:void(0);" style="margin-left:0px;" class="session_btn" id="huishou">回收站</a>
                            		</c:when>	
                            		<c:otherwise>
                            			<c:if test="${index != 3}">
                            				<a href="javascript:void(0);" class="session_btn" id="huishou">回收站</a>
                            			</c:if>
                            		</c:otherwise>
                            	</c:choose>
                            	<c:choose>
                            		<c:when test="${index == 3 }">
                            			<a href="javascript:void(0);" style="margin-left:0px;" class="session_btn" id="shanchu">彻底删除</a>
                            		</c:when>
                            		<c:otherwise>
                            			<a href="javascript:void(0);" class="session_btn" id="shanchu">彻底删除</a>
                            		</c:otherwise>
                            	</c:choose>
                                <a href="javascript:void(0);" class="session_btn" id="qingkong">清空</a>
                                <c:if test="${index eq 3 }">
                                	<a href="javascript:void(0);" class="session_btn" id="huanyuan" onclick="huanyuan();">还原</a>
                                </c:if>

                            	
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
            	if('${conditon}'){
            		$(".main_row_head :text").val('${conditon}');
            	}
            	conditon  = "";
            	notRead();
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
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
                //复选按钮
                $(".receive_head .receive_td_1 input[type=checkbox]").change(function(){
                    if($(this).is(":checked")){
                        $(".receive_content .receive_td_1 input[type=checkbox]").prop("checked",true);
                    }else{
                        $(".receive_content .receive_td_1 input[type=checkbox]").prop("checked",false);
                    }
                });
                
                //搜索
                $(".main_row_head a:eq(0)").click(sousuo);
                $(".main_row_head a:eq(1)").click(resetdate);

            });
			function sousuo(){
				 conditon =  $(".main_row_head :text").val();
				 location.href="${ctx}/memSerevice/message/mailbox?index="+'${index}'+"&conditon="+conditon;
			}
			
			//删除
			  function deletethis(str){
			    	parent.showMessYes("确定要删除选中信件吗？此操作不可撤销");
					$(".yes-btn", window.parent.document).unbind().on("click",function(){
						$(".pl_yesorno", window.parent.document).hide();
				    	$.ajax({
				 			type : "POST",
				 			url : "${ctx}/memSerevice/message/delete",
				 			data : "number="+str+"&index=${index}",
				 			dataType : 'text',
				 			success : function(data) { 
				 				if(data == "ok"){
				 					parent.showMess("删除成功");
				 					setTimeout(function(){
					            		$(".popumask", window.parent.document).hide();
					            		$(".pl_normal", window.parent.document).hide();
					 					if('${conditon}'){
					 						location.href = '${ctx}/memSerevice/message/mailbox?index=${index}&conditon='+'${conditon}';
					 					}else{
					 						location.href = '${ctx}/memSerevice/message/mailbox?index=${index}';
					 					}
					            	},1500);
				 				}
				 			}
				 		});
					});
			    }   		
			     
			    //删除选中的多个复选框
				$("#shanchu").click(function(){
					var value =[];    
			  		$('input[name="choose"]:checked').each(function(){    
			  			value.push($(this).val());    
			  		});
			  		if(value == "" || value == null){
						parent.showMess("请选择！");
					}else{
						deletethis(value);
					}
			  		
				});
			    //回收站
			    $("#huishou").click(function(){
			    	var value =[];    
			  		$('input[name="choose"]:checked').each(function(){    
			  			value.push($(this).val());    
			  		});
			  		if(value == "" || value == null){
						parent.showMess("请选择！");
					}
			  		$.ajax({
	        			type : "POST",
	      				url : "${ctx}/memSerevice/message/recycle",
	      				data : "number="+value+"&index=${index}",
	      				dataType : 'text',
	      				success : function(data) { 
	      					parent.showMess("已成功放入回收站");
		 					setTimeout(function(){
			            		$(".popumask", window.parent.document).hide();
			            		$(".pl_normal", window.parent.document).hide();
			 					jump(3);
			            	},1500);
	      				}
				});	
			  });
			    //跳转页面
		       function jump(str){
		    	   notRead();
		        	location.href="${ctx}/memSerevice/message/mailbox?index="+str;
			    }
			   //标记已读
			    $("#read").click(function(){
			    	var value =[];    
			  		$('input[name="choose"]:checked').each(function(){    
			  			value.push($(this).val());    
			  		});
			  		if(value == "" || value == null){
						parent.showMess("请选择！");
					}
			  		$.ajax({
	        			type : "POST",
	      				url : "${ctx}/memSerevice/message/isRead",
	      				data : "number="+value,
	      				dataType : 'text',
	      				success : function(data) { 
	      					parent.showMess("已成功标为已读");
		 					setTimeout(function(){
			            		$(".popumask", window.parent.document).hide();
			            		$(".pl_normal", window.parent.document).hide();
			            		jump(2);
			            	},1500);
	      				}
	      			}); 
			    });
			   //清空
			  $("#qingkong").click(function(){
				  var aaa=0;
				  if('${index==3}'){
					  aaa=9;
				  }
				  parent.showMessYes("确定要清空信件吗？此操作不可撤销");
				  $(".yes-btn", window.parent.document).unbind().on("click",function(){
						$(".pl_yesorno", window.parent.document).hide();
					  $.ajax({
		        			type : "POST",
		      				url : "${ctx}/memSerevice/message/emptydate",
		      				data : "index=${index}&aaa="+aaa,
		      				dataType : 'text',
		      				success : function(data) { 
		      					parent.showMess("已成功清空");
			 					setTimeout(function(){
				            		$(".popumask", window.parent.document).hide();
				            		$(".pl_normal", window.parent.document).hide();
			      					location.reload();
				            	},1000);
		      				}
		      			}); 
				  });
			  });  
			  //跳转
			  function content(str){
				  notRead();
				  if('${index}' == 0){
					  //草稿箱的内容
					  location.href="${ctx}/memSerevice/message/send?id="+str;
				  }else{
					  location.href="${ctx}/memSerevice/message/content?id="+str+"&index=${index}";
				  }
			  }
			  function loca(str){
	        	   location.href="${ctx}/memSerevice/message/"+str;
	           }
			  //重置
			  function resetdate(){
				  $(".main_row_head :text").val('');
			  }
			  //还原
			  function huanyuan(){
				  var value =[];    
			  		$('input[name="choose"]:checked').each(function(){    
			  			value.push($(this).val());    
			  		});
			  		if(value == "" || value == null){
						parent.showMess("请选择！");
					}
			  		$.ajax({
	        			type : "POST",
	      				url : "${ctx}/memSerevice/message/huanyuan",
	      				data : "number="+value+"&index=${index}",
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
			//未读消息对话
			function notRead(){
				var messNotRead = '${messNotRead}';
				var chatNotRead = '${chatNotRead}';
				parent.notRead(messNotRead,chatNotRead);
			}
			//跳到危废
			function jumpurl(str){
				$.ajax({
        			type : "POST",
      				url : "${ctx}/memSerevice/message/weifei",
      				dataType : 'text',
      				success : function(data) { 
      					location.href='${preUrl}'+str;
      				}
			});	
			}
		
        </script>
    </body>
</html>
