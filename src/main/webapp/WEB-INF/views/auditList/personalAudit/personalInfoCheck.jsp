<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>个人_会员资料</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            .row_right .phone_number{margin-right: 20px;position: relative;}
            .row_right .phone_number::after{content: "";width:10px;height:15px;background:url(${ctxStatic}/img/llhb/phone_number_03.png) 0 0 no-repeat;position: absolute;right:-20px;top:0;}
        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span class="m_r_tname">个人资料</span>
                    </div>
                    <form action="">
                        <div class="tab_main_row ">
                            <label for="">当前用户</label>
                            <div class="row_right font1">
                                <input type="radio" disabled id="gerena" class="geren" name="leibie"><label class="quality" for="">普通个人</label>
                                <input type="radio" disabled  id= "gongcha" class="gongcheng" name="leibie"><label class="quality" for="">环保工程师</label>
                            </div>
                        </div>
                        <div class="tab_main_row ">
                            <label for="">会员名</label>
                            <div class="row_right font1">
                                <span class="user_name">${user.login_name }</span>
                            </div>
                        </div>
                        <div class="tab_main_row ">
                            <label for=""><span>*</span>性别</label>
                            <div class="row_right font1">
                                <input type="radio" disabled class="" name="sex" id = "male" value="男"><label for="">男士</label>
                                <input type="radio" disabled class="" name="sex" id = "female" value="女"><label for="">女士</label>
                            </div>
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>真实姓名</label>
                                <div class="row_right font1">
                                    <input type="text" id="tname" value="${user.name }" disabled>
                                    
                                </div>
                            
                        </div>
                        <!-- 手机号 -->
                        <div class="tab_main_row ">
                            
                                <label for="">手机号</label>
                                <div class="row_right font1">
                                    <span class="phone_number">
                                       ${user.phone }
                                    </span>

                                </div>
                        </div>
                        
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>邮箱</label>
                                <div class="row_right font1">
                                    <input type="text" id="email" value="${user.email}" onblur="blurEmail();" style="float:left;"disabled>
                                    <span class="tip_span tip_wrong" style="display:none;float:left;" id="emailErr">请输入有效的邮箱地址</span>
                                </div>
                        </div>
                        <div class="tab_main_row ">
                                <label for=""><span>*</span>所在地区</label>
                                <div class="row_right font1">
                                    <select name="sheng"  id="province" onchange="selectProvince()" disabled>
                                    <option value="" selected = "selected">${user.aname }</option>
                                      
                                    </select>
                                    <select name="" id="city" disabled>
                                        <option value=""  selected = "selected">${user.sname }</option>
                                    </select>
                                </div>
                          
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">所在部门</label>
                                <div class="row_right font1">
                                    <input type="text" id="depart" value="${user.dept }" disabled>
                                </div>
               
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">职务</label>
                                <div class="row_right font1">
                                    <input type="text" id="zhiwu" value="${user.pro_title }" disabled>
                                </div>
   
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">QQ</label>
                                <div class="row_right font1">
                                    <input type="text" id="qqnum" value="${user.qq_num}" disabled>
                                </div>
           
                        </div>
                        
                     	<div class="save_or_return" style="width:450px;">
                            <a href="javascript:void(0)" onclick="pass(1,'')" class="save_btn">通过</a>
                            <a href="javascript:parent.showText('请填写不通过的原因');" class="save_btn">不通过</a>
                            <a href="javascript:back();" class="save_btn" >返回</a>
                        </div>
                       
                    </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>

        <!-- 弹出层 -->
        <div class="popumask"></div>
        <div class="populayer pl_normal" >
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3" id="contentText">
                <p>请将星标栏目填写完成后保存!</p>
                <p>否则不能完成认证!</p>
            </div>
        </div> 
  
        <!-- 弹出层结束 -->

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
            $(function(){
            	if('${user.type}'){
            		if('${user.type}'==1){
                		$("input[name=leibie]:eq(0)").attr("checked",'checked');
                	}else if('${user.type}'==2){
                		$("input[name=leibie]:eq(1)").attr("checked",'checked');
                	}
            	}
            	
            	//默认省市
            	
            	if('${user.sex}'){
            		var male = $("#male").val();
            		if('${person.sex}' == 'M'){
            			$("#male").attr("checked","checked");
            		}else{
            			$("#female").attr("checked","checked");
            		}
            	} 
            	
            });
            function back(){
        		parent.iframeGoToUrl('${ctx}/auditList/personalAudit?con=0');
        	}
        	
        	function getText(content){
        		/* if(content == ""){
        			parent.showMess("请先填写信息");
        			return;
        		}else{
        			parent.hideMessYes();
            		pass(-1,content);
        		} */
        		parent.hideMessYes();
        		pass(-1,content);
        		
        	}
            function pass(n,str){
            	var ss = "";
            	if(str != ""){
            		ss=str;
            	}
        		 $.ajax({
            		type : "POST",
            		url : "${ctx}/auditList/personalAudit/pass",
            		dataType : "json",
            		async : false,
            		data:"flag="+n+"&pid=${user.pid}&content="+ss,
            		success : function(data) {
            			parent.showMess("操作成功");
               			setTimeout(function(){
        					parent.hideMess();
                    		parent.iframeGoToUrl('${ctx}/auditList/personalAudit?con='+n);
                    	},1500);
            		}
            	}); 
        	}	
            

              
        </script>
    </body>
</html>