<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/>
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
            .fpw_step_box .C .s_b_step_num{width:40px;height:40px;border-radius: 20px;background-color: #cccccc;color:#fff;font-size: 22px;font-weight: bold;line-height: 40px;text-align: center;}
            .fpw_step_box .s_b_step_numbox .s_b_step_num{width:40px;height:40px;border-radius: 20px;background-color: #cccccc;color:#fff;font-size: 22px;font-weight: bold;line-height: 40px;text-align: center;}
            .fpw_step_box .s_b_step_successbox .s_b_step_done{width:40px;height:40px;border-radius: 20px;background:url(../images/) 0 0 no-repeat;background-color: #cccccc;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_top{color:#ee7800;}
            .fpw_step_box .stepb_numbox_sel .s_b_step_num{background-color: #ee7800;}
            
            
            
            /*顶部步骤结束*/
            
            /*手机验证 开始*/
            .phonevlidate{float:left;margin-left: 315px;overflow: hidden;margin-top: 30px;}
            .phonevlidate > *{height:30px;line-height: 30px;}
            .phonevlidate>div>*{float:left;}
            .phonevlidate .phonev_top span{color:#ee7800;}
            .phonevlidate label{width:50px;display: block;}
            .phonevlidate input{border:1px solid #ccc;height:30px;text-indent:10px;margin-left: 15px;}
            .phonevlidate .phonenum,.phonevlidate .vlidatenum,.phonevlidate .phonev_bottom{margin-top: 15px;}
            .phonevlidate .phonenum input{width:294px;}
            .phonevlidate .vlidatenum input{width:138px;}
            .phonevlidate .vli_tip{margin-left: 10px;display: none;}
            .vlidatenum .resend,.phonev_bottom .phonev_next{width:140px;margin-left: 15px;text-align: center;background-color: #5EC520;color:#fff;}
            .phonev_bottom .phonev_return{width:140px;margin-left: 15px;text-align: center;background-color: #E5E5E5;color:#666};
            /*手机验证 结束*/

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
                           <span class="s_b_step_top">发送验证码</span>
                           <div class="s_b_step_num">1</div>
                       </div>
                       <div class="s_b_linelong"></div>
                       <div class="s_b_step_numbox ">
                           <span class="s_b_step_top">重置登录密码</span>
                           <div class="s_b_step_num">2</div>
                       </div>
                       <div class="s_b_linelong"></div>
                       <div class="s_b_step_numbox">
                           <span class="s_b_step_top">找回成功</span>
                           <div class="s_b_step_num">3</div>
                       </div>
                       <div class="s_b_lineshort"></div>
                   </div>
                    <!-- 顶部步骤结束 -->
                    <div class="phonevlidate font_1">
                        <p class="phonev_top ">您正在使用<span>手机验证码</span>验证身份,请完成以下操作</p>
                        <div class="phonenum">
                            <label for="">手机号</label>
                            <input type="text" placeholder="请输入手机号" id="telPhone">
                            <div class="vli_tip"><span class="tip_span tip_wrong">请输入正确的手机号码!</span></div>
                        </div>
                        <div class="vlidatenum">
                            <label for="">验证码</label>
                            <input type="text" placeholder="验证码" id="checkCode">
                            <a href="javascript:void(0)" class="resend">获取验证码</a>
                            <div class="vli_tip"><span class="tip_span tip_wrong">您输入的验证码有误!</span></div>
                        </div>
                        <div class="phonev_bottom">
                            <label for="">&nbsp;&nbsp;&nbsp;</label>
                            <a href="javascript:void(0)" class="phonev_next" onclick="jiaoyan()">下一步</a>
                            <a href="javascript:void(0)"class="phonev_return" onclick="back();">返回</a>
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
		<form action="retrievePasswordC" method="post" id="formId">
			<input name="tel" id="telId"/>
		</form>

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/common.js"></script>
        
        <script type="text/javascript">
            $(function(){
                //弹出层 关闭
                $(".populayer .layer_top a").click(function(){
                    $(".populayer").fadeOut();
                    $(".popumask").fadeOut();
                });
                //mainwarpper 高度
                $(".mainwrapper").height($(window).height()-$("header").height()-$("footer").height());

                //获取验证码
                var timer = null;
                var time_on=true;
                $(".vlidatenum .resend").on("click",get_vlidatenum);
                //获取验证码方法
                function get_vlidatenum(){
                	 var tele = $("#telPhone").val();
                     if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tele))){
              			 mess("请输入正确的手机号码");

                     }else {
	                    if(time_on){
	                            console.log(time_on);
	                            var time = 30;
	                            clearInterval(timer);
	                            $(this).css({background:"#CCCCCC", color:"#333"});
	                            $(this).html("重新发送(" + time + ")");
	                            timer = setInterval(function(){
	                                time --;
	                                $(".vlidatenum .resend").html("重新发送(" + time + ")");
	                                if(time > 0){
	                                    time_on=false;

	                                }else{
	                                    clearInterval(timer);
	                                    $(".vlidatenum .resend").html("重新获取");
	                                    $(".vlidatenum .resend").css({background:"#5EC520", color:"#FFFFFF"});
	                                    time_on=true;
	                                }
	                            },1000);
	                            
	                        }
	                    $.ajax({
	         				type : "POST",
	         				url : "${ctx}/conn",
	         				data : "tel=" + tele ,
	         				dataType : 'text',
	         				success : function(data) { 
	         				}
	         			});	
                     }
              }
            });
            function jiaoyan(){
            	$.ajax({
	     				type : "POST",
	     				url : "${ctx}/retrieve/telphoneJy",
	     				data : "tel=" + $("#telPhone").val(),
	     				dataType : 'text',
	     				success : function(data) { 
							if(data=="1"){
								mess("请输入正确的手机号");
							}else{
								$("#telId").val(data);
								  $.ajax({
					     				type : "POST",
					     				url : "${ctx}/checkCode",
					     				data : "tel=" + $("#telPhone").val()+"&checkCode="+$("#checkCode").val(),
					     				dataType : 'text',
					     				success : function(data) { 
					     					if(data!='ok'){
					     						mess("请输入正确的验证码");
					     					}else{
					     						$("#formId").submit();
					     					}
					     				}
					     			}); 
							}
	     				}
	     			});
         	  
            }
            function mess(str){
            	var ss = "<p>"+str+"</P>";
            	$(".populayers #contentText").empty().append(ss);
        		$(".populayers").show();
                $(".popumasks").show();
              }  
        </script>
    </body>
</html>
