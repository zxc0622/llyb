<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>优蚁环保-找回密码,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
        <style type="text/css">
          
            /*header添加  重复*/
            header{border-bottom: 1px solid #5EC520;min-width: 1000px;}
            .header_middle{margin-bottom: 15px;}
            .header_middle h1{position: relative;}
            .header_middle h1 .welcome{color:#ee7800;border-left: 1px solid #cccccc;padding-left: 10px;position: absolute;top:66px;left:351px;display: block;width:100px;font-weight: 400;height:30px;line-height: 30px;}

            /*main开始*/
            .mainwrapper{width:100%;background-color: #F7F8F8;min-width: 1000px;}
            .main{width:1000px;margin:0 auto;overflow: hidden;}
            .main input[type=text]:focus,.main input[type=password]:focus{border:1px solid #ee7800;}
            
            /*找回密码_main开始*/
            .find_pw_main{margin-top:40px;}

            /*顶部步骤开始*/
            .fpw_step_box{margin:0 auto;overflow: hidden;width:700px;}
            .fpw_step_box .s_b_lineshort{float:left;height:4px;width:60px;border-radius:4px;background-color: #cccccc;margin-top: 50px}
            .fpw_step_box .s_b_linelong{float:left;height:4px;width:200px;border-radius:4px;background-color: #cccccc;margin-top: 50px}
            .fpw_step_box .stepb_line_sel{background-color: #ee7800;}
            .fpw_step_box .s_b_step_numbox,.fpw_step_box .s_b_step_successbox{float:left;margin:0 10px;position: relative;margin-top: 32px}
            .fpw_step_box .s_b_step_numbox .s_b_step_top,.fpw_step_box .s_b_step_successbox .s_b_step_top{position: absolute;color:#666666;top:-27px;left:-65%;width:90px;text-align: center;}
            .fpw_step_box .s_b_step_numbox .s_b_step_num{width:40px;height:40px;border-radius: 20px;background-color: #cccccc;color:#fff;font-size: 22px;font-weight: bold;line-height: 40px;text-align: center;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_top{color:#ee7800;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_num{background-color: #ee7800;}
            /*顶部步骤结束*/
            
            /*设置新密码 开始*/
            .new_password{float:left;margin-left: 315px;overflow: hidden;margin-top: 30px;}
            .new_password > *{height:30px;line-height: 30px;}
            .new_password>div>*{float:left;}
            .new_password .phonev_top span{color:#ee7800;}
            .new_password label{width:100px;display: block;}
            .new_password label span{color:red; width:30px;}
            .new_password input{border:1px solid #ccc;height:30px;text-indent:10px;margin-left: 15px;}
            .new_password .set_new_pw,.new_password .confirm_new_pw,.new_password .new_pw_bottom{margin-top: 15px;}
            .new_password .set_new_pw input,.new_password .confirm_new_pw input{width:294px;}
            .new_password .vli_tip{margin-left: 10px;display: none;}
            .new_password .vli_tip_pass{margin-left: 10px;display: none;}
            .confirm_new_pw .resend,.new_pw_bottom .save_new_pw{width:140px;margin-top: 30px;margin-left:10px;text-align: center;background-color: #5EC520;color:#fff;}
            .new_pw_bottom .phonev_return{width:140px;margin-top: 30px;margin-left: 13px;text-align: center;background-color: #E5E5E5;color:#666;}
            .new_password .set_new_pw{text-align: center;}
            /*设置新密码 结束*/

            /*提示样式*/
            .tip_span{line-height: 15px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/wrong.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
        
            /*找回密码_main结束*/
            /*main结束*/
        </style>
    </head>
    <body>
        <!--头部 start-->
        <header >
            <div class="line_top"></div>
            <div class="headerBox">

                <!--头部上部 start-->
                <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
                <!--头部上部 end-->

                <!--头部中部 start-->
                <div class="header_middle">
                    <h1 class="header_logo">
                        <a href="javascript:void(0);">
                            <img src="${ctxStatic}/img/llhb/mall_logo.png" alt="环保服务平台"/>
                        </a>
                        <span class="welcome font_3">找回密码</span>
                    </h1>
                    
                    <div class="clear"></div>
                </div>
                <!--头部中部部 end-->
            </div>      
        </header>
        <!--头部 end-->

        <!-- main开始 -->
        <div class="mainwrapper">
            <div class="main">
                <div class="find_pw_main">
                    <!--顶部 步骤 -->
                   <div class="fpw_step_box">
                       <div class="s_b_lineshort stepb_line_sel"></div>
                       <div class="s_b_step_numbox stepb_numbox_sel">
                           <span class="s_b_step_top">输入邮箱名</span>
                           <div class="s_b_step_num">1</div>
                       </div>
                       <div class="s_b_linelong stepb_line_sel"></div>
                       <div class="s_b_step_numbox stepb_numbox_sel">
                           <span class="s_b_step_top">发送邮件</span>
                           <div class="s_b_step_num">2</div>
                       </div>
                       <div class="s_b_linelong"></div>
                       <div class="s_b_step_numbox ">
                           <span class="s_b_step_top">找回密码</span>
                           <div class="s_b_step_num">3</div>
                       </div>
                       <div class="s_b_lineshort"></div>
                   </div>
                    <!-- 顶部步骤结束 -->
                    <div class="new_password font_1">
                        <!--  -
                        <div class="set_new_pw">
                            <label for=""><span>*</span>新登录密码</label>
                            <input type="password" onkeyup="value=value.replace(/[\W]/g,'') "  onblur="jiaoyanNew()"  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"  id="newPw">
                      		  <div class="vli_tip_pass"><span class="tip_span tip_wrong">密码长度应不小于六位</span></div>
                        </div>
                        <div class="confirm_new_pw">
                            <label for=""><span>*</span>确认新密码</label>
                            <input type="password" id="qrPw" onblur="jiaoyan()">
                            <div class="vli_tip"><span class="tip_span tip_wrong">输入的密码不一致!</span></div>
                        </div>
                        -->
                        <div class="set_new_pw">
                            <label for="" style="size: 0px;"><span>*</span>您的注册邮箱为:</label>
                            <font color="#5EC520;" size="4">
                            <c:set var="email" value="${EmailName }"></c:set>
                            <c:out value="${fn:substring(email, 0, 2)}*****"></c:out>  
                            <c:out value="${fn:substringAfter(email, '@')}"></c:out>
                            </font>                       
                        </div>
                        <input type="hidden" value="${EmailName}" id="emailName">   
                        <div class="new_pw_bottom">
                            <a href="javascript:void(0)" class="save_new_pw" onclick="selectPassword()">找回密码</a>
                            <a href="javascript:void(0)" class="phonev_return" onclick="back();">返回</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main结束 -->
	<!-- 错误弹出层 -->
        <div class="popumask popumasks"></div>
        <div class="populayer pl_normal populayers" >
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3" id="contentText">
                <p>请先完善信息!</p>
            </div>
        </div>
        <!-- 错误弹出层结束 -->
        <!-- 底部开始 -->
        <footer>
            <!--底部下部信息 start-->
            <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
            <!--底部下部信息 end-->
        </footer>


        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
        function mess(str){
        	var ss = "<p>"+str+"</P>";
        	$(".populayers #contentText").empty().append(ss);
    		$(".populayers").show();
            $(".popumasks").show();
          }  
            $(function(){
                //mainwarpper 高度
                $(".mainwrapper").height($(window).height()-$("header").height()-$("footer").height());
				
            });
           
		function selectPassword(){
			var emailName = $("#emailName").val();
		//	alert(emailName);
		    $.ajax({
		    	type : "POST",
		    	url:"${ctx}/retrieve/sendEmail",
		    	data:"emailName="+emailName,
		    	dataType : 'text', 
		    	success:function(data){
		    		if(data=="ok"){
		    			location.href = "${ctx}/retrieve/RetrieveEmailPasswordD";
		    		}else{
		    			mess(data);
		    		}
		    	}
		    });
		}
		function jiaoyan(){
			var newPw=$("#newPw").val();
        	var qrPw=$("#qrPw").val();
        	if(qrPw!=newPw){
        		$(".vli_tip").css("display","block");
        	}else{
        		$(".vli_tip").css("display","none");
        	}
		}
		function jiaoyanNew(){
			var newPw=$("#newPw").val();
        	var qrPw=$("#qrPw").val();
        	if(newPw.length<6){
        		$(".vli_tip_pass").css("display","block");
        	}else{
        		$(".vli_tip_pass").css("display","none");
        	}
		}
        </script>
    </body>
</html>
