<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!-- <link rel="shortcut icon" href="#"/>  -->
        <title>密码管理</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">


            .warningdiv{width:640px;border:1px solid #ee7800;background-color: #FFFDEE;padding:10px;margin: 25px 0 25px 28px;overflow: hidden;}
            .warningdiv .warningd_left{float:left;width:50px;height:50px;background:url(${ctxStatic}/img/llhb/big_wraning.png) 0 0 no-repeat;}
            .warningdiv .warningd_right{float:left;margin-left: 10px;color:#666666;margin-top: 3px;}
            .warningdiv .warningd_right span{color:#ee7800;}
            
            .error_input{border:1px solid red;}
            .error_message{color:red}
        </style>
        
    </head>
    <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料>密码管理</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span onclick="goUrl('${ctx}/perinfo')">个人资料</span>
                        <span onclick="goUrl('${ctx}/hyzl/EnterpriseDataZero')">公司资料</span>
                        <span class="m_r_tname">密码管理</span>
                        <span onclick="goUrl('${ctx}/perinfo/authService')">认证服务</span>
                    </div>
                    <div class="warningdiv font_1">
                        <div class="warningd_left"></div>
                        <div class="warningd_right">
                            <p>贵公司资料尚未完善详细资料!完善商业信息有助于获得别人的信任,结交潜在的商业伙伴,</p>
                            <span>获取商业机会,请尽快完善</span>
                        </div>
                    </div>
                    <form id="inputForm" action="" method="post"  >
                    	<input id="userId" name="user.id" value="${user.id}" type="hidden" />
                        <div class="tab_main_row " id="password">
                            
                                <label for="">原始密码</label>
                                <div class="row_right font1" >
                                    <input id="Password" type="password" name="Password" maxlength="30" class=""/>
                                </div>
                                <span class="tip_span tip_normal">如要更改密码,需输入原始密码</span>
               
                        </div>
                        <div class="tab_main_row " id="newPassword">
                            
                                <label for="">新登录密码</label>
                                <div class="row_right font1">
                                    <input id="newPwd" type="password" name="newPassword" maxlength="20" />
                                </div>
                                <span class="tip_span tip_normal">如不更改密码,请留空</span>
                        </div>
                        <div class="tab_main_row " id="confirmNewPassword">
                            
                                <label for="">重复新密码</label>
                                <div class="row_right font1">
                                    <input  type="password" name="confirmNewPassword"  />
                                </div>
               					<span class="tip_span tip_normal"></span>
                        </div>
                        
                        <div class="save_or_return">
                            <a href="javascript:formsubmit()"  class="save_btn">保存</a>
                            <a href="javascript:history.go(-1)" class="return_btn">返回</a>
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
        //旧密码是否正确
        var pwdRight = false;
        //新密码格式正确
        var newPwdRight = false;
        //确认密码正确
        var confirmRight = false;
        
        $(function(){
        	
            //单选按钮
            $(".row_right input[type=radio]").click(function(){
                $(this).siblings().removeAttr("checked");
            });
        });
        
     	$(document).ready(function(){
     		//获得焦点清除报样式
     		$("#inputForm input").focus(function(){
     			$(this).css({"border-color":"#ccc"});
    			$(this).parent().parent().find("span").html("");
     		});
     		//旧密码为空判断
     		$("#password input").blur(function(){
     			var pwd = $(this).val();
     			if(null==pwd || pwd==""){
     				pwdRight = false;
     				$(this).css({"border-color":"red"});
        			$(this).parent().parent().find("span").html("密码不能为空").css({"color":"red"});
     			}else{
     				pwdRight = true;
     			}
     		});
     		
     		//新密码为空及格式判断
        	$("#newPassword input").blur(function(){
        		var pwd = $(this).val();
        		if(null==pwd || pwd==""){
        			$(this).css({"border-color":"red"});
        			$(this).parent().parent().find("span").html("密码不能为空").css({"color":"red"});
        			newPwdRight = false;
        		}else if(pwd.length<6 || pwd.length>20){
        			$(this).css({"border-color":"red"});
        			$(this).parent().parent().find("span").html("密码不能小于6位或大于20位").css({"color":"red"});
        			newPwdRight = false;
        		}else{
        			$(this).css({"border-color":"#ccc"});
        			$(this).parent().parent().find("span").html("");
        			newPwdRight = true;
        		}
        	});
        	
        	//判断重复密码与新密码是否相同
            $("#confirmNewPassword input").on("keyup focus",function(){
            	confirmNewPassword();
            });
        });
     	
     	//检查确认新密码
     	function confirmNewPassword(){
        	var pwd = $("#newPassword input").val();
        	var cPwd = $("#confirmNewPassword input").val();	
        	if(cPwd != null && pwd==cPwd){
        		$("#confirmNewPassword input").css({"border-color":"#ccc"});
      		    $("#confirmNewPassword input").parent().parent().find("span").html("");
        		confirmRight=true;
        	}else{
        	    $("#confirmNewPassword input").css({"border-color":"red"});
   			    $("#confirmNewPassword input").parent().parent().find("span").html("两次密码不一致").css({"color":"red"});
   			 	confirmRight = false;
        	}
        }
     	
     	//表单提交
        function formsubmit(){
        	//再次确认新密码，防止新密码与确认密码不同时提交
        	confirmNewPassword();
        	//确认所有提交条件具备
            if(pwdRight && newPwdRight && confirmRight){//旧密码不为空、新密码格式正确、确认密码与新密码相同
            	//置否提交条件，防止恶意提交
            	pwdRight = false;
            	newPwdRight = false;
            	confirmRight = false;
                //ajax数据提交
                $.ajax({
                    type:"POST",
                    url: "${ctx}"+"/pwdManage/checkPwd",
                    data: "user.id="+$("#userId").val()+"&Password="+$("#Password").val()+"&newPassword="+$("#newPwd").val(),
                    datatype:"text",
                    success : function(result){
                	   if(result==false){
                		    $("#password").find("span").html("您输入密码与原始密码不一致，请重新输入！").css({"color":"red"});
                      		$("#password").find("input").css({"border-color":"red"});
                	   }else if(result==true){
                		   $(".pl_yes",parent.document).show().find("p").html("密码修改成功，请重新登录");
                		   $(".popumask",parent.document).show();
                		   $(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
                			   	$(".popumask",parent.document).hide();
   	              				$(".pl_yes",parent.document).hide();
                			   	parent.window.location.href="${ctx}/logout";
                			   
                		   });
                	   }
                    },
                    error : function(){
                    	$(".pl_yes",parent.document).show().find("p").html("密码修改失败！");
              		   	$(".popumask",parent.document).show();
              		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
	              			$(".popumask",parent.document).hide();
	              			$(".pl_yes",parent.document).hide();
              		   });
                    }
             	});
             	//清空表单数据
                $("#newPassword input").val("");
     		    $("#confirmNewPassword input").val("");
     		    $("#password input").val("");
            }else{
            	var pwd = $("#password input").val();
            	var newPwd = $("#newPassword input").val();
            	var cPwd = $("#confirmNewPassword input").val();
            	if(pwd==null || pwd==""){
            		$("#password span").html("原始密码不得为空").css({"color":"red"});
              		$("#password input").css({"border-color":"red"});
            	}else if(null==newPwd || newPwd==""){
        			$("#newPassword input").css({"border-color":"red"});
        			$("#newPassword span").html("新登录密码不能为空").css({"color":"red"});
        		}else if(null==cPwd || cPwd==""){
        			$("#confirmNewPassword input").css({"border-color":"red"});
        			$("#confirmNewPassword span").html("重复新密码不能为空").css({"color":"red"});
        		}
            }
        } 
        </script> 
    </body>
</html>


