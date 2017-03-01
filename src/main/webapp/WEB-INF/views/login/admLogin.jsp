<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link href="${ctxStatic}/css/tool.css" rel="stylesheet" type="text/css"/>
    <script src="${ctxStatic}/js/jquery.min.js" type="text/javascript"></script>

    <style>
        /*首页*/
        html,body,form{ height:100%;}
        .background_all { background:#666; height:100%;position: fixed;width:100%;overflow-y:auto;}
        .container{ text-align:center;}
        .logo {height:137px;font-size:40px;color:#fff;line-height:137px;text-align:center;}
        .logining { display:inline-block;width:565px; height:510px; border:#EEF0EF 1px solid; background:#fff; margin:auto;}
        .login { text-align:left;font-size:30px; color:#5F5F5F; padding:45px 0 20px 0; width:440px; border-bottom:1px solid #EEEEEE; margin:auto;}
        .login_frame { text-align:left;width:280px; margin:55px auto 0 auto;}
        .div_top { font-size:14px; color:#959796;}
        .input_bottom { width:280px; border:1px solid #C4C9CD; height:40px;line-height:40px;}
        .login_button { width:280px; height:45px; background:#01a19c; color:#fff; font-size:20px; line-height:45px; text-align:center; border-radius:5px; cursor:pointer; border:none;}
        .firm { font-size:14px; color:#fff; text-align:center;}
        .back_fff { background:#fff;}
    </style>
    <script type="text/javascript">
        top.$.jBox.info("新增数量超过库存数量，该商品库存量为");
        $(document).ready(function() {
            jQuery("#inputForm").validationEngine({
                onValidationComplete:function(form, valid){
                    if(valid==true){
                        $("#inputForm").unbind();
                        form.submit();
                    }
                }
            });

        });
        if(top.location != self.location){
            top.location = self.location;
        }
    </script>
</head>

<body>
<form id="loginForm" action="${ctx}/admLogin" method="post">
    <div class="background_all">
        <div class="container">
            <div class="logo">绿联环保系统</div>
            <div class="logining">
                <div class="login">登录</div>
                <div class="login_frame">
                    <div class="div_top">用户名</div>
                    <input class="input_bottom mt5" type="text" name="username" id="username" value="${username}" placeholder="用户名"/>
                    <div class="div_top mt20">密码</div>
                    <input class="input_bottom mt5" type="password" name="password" id="password" placeholder="密码"/>
                    <div  class=" mt40"><input type="checkbox" id="rememberMe" name="rememberMe" /><span class="div_top ml15">2天内自动登陆</span></div>
                    <input class="login_button mt20" type="button" onclick="login()" value="登录" />
                </div>
            </div>
            <div class="firm mt40"></div>
            <div class="firm mt20"></div>
        </div>
    </div>
</form>
<script>
    <%String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);%>
    <%=error==null?"":"alert('用户、密码错误或账号已被停用, 请重试.');"%>
    function login(){
        if($("#username").val()==''){
            alert("请输入用户名");
            return;
        } else {
            var reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
            if (reg.test($("#username").val())) {
                alert("您输入的用户名包含中文字符，请输入非中文字符！");
                return;
            }
        }
        if($("#password").val()==''){
            alert("请输入密码");
            return;
        }
        $('#loginForm').submit();
    }
</script>
</body>
</html>