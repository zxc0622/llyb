<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <!-- <link rel="shortcut icon" href=""/>  -->
        <title>认证服务</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">

            /*warningdiv开始*/
            .warningdiv{width:640px;border:1px solid #ee7800;background-color: #FFFDEE;padding:10px;margin: 25px 0 25px 28px;overflow: hidden;}
            .warningdiv .warningd_left{float:left;width:50px;height:50px;background:url(${ctxStatic}/img/llhb/big_wraning.png) 0 0 no-repeat;}
            .warningdiv .warningd_right{float:left;margin-left: 10px;color:#666666;margin-top: 3px;}
            .warningdiv .warningd_right span{color:#ee7800;}
            /*warningdiv结束*/
            .renzhengdiv{margin-left: 28px;}
            .renzhengdiv h4{font-size: 20px;font-weight: 400;margin-left: 255px;}
            .renzhengdiv .renzhengd_mid{margin-top: 50px;overflow: hidden;}
            .renzhengdiv .renzhengd_mid a{float:left;margin-left:85px;}
            .renzhengdiv .renzhengd_mid a .rzd_mid_img{width:110px;height:180px;}
            .renzhengdiv .renzhengd_mid a p{color:#666666;text-align: center;}
            .renzhengdiv .renzhengd_mid .rz_done p{color:#ee7800;}
            .renzhengdiv .renzhengd_mid a .rz_person{background:url(${ctxStatic}/img/llhb/renzheng.png) -248px -245px no-repeat;}
            .renzhengdiv .renzhengd_mid a .rz_youyi{background:url(${ctxStatic}/img/llhb/renzheng.png) -10px -245px no-repeat;}
            .renzhengdiv .renzhengd_mid a .rz_company{background:url(${ctxStatic}/img/llhb/renzheng.png) -130px -245px no-repeat;}
            .renzhengdiv .renzhengd_mid .rz_done .rz_person{background:url(${ctxStatic}/img/llhb/renzheng.png) -248px -417px no-repeat;}
            .renzhengdiv .renzhengd_mid .rz_done .rz_youyi{background:url(${ctxStatic}/img/llhb/renzheng.png) -10px -417px no-repeat;}
            .renzhengdiv .renzhengd_mid .rz_done .rz_company{background:url(${ctxStatic}/img/llhb/renzheng.png) -130px -417px no-repeat;}
            .renzhengdiv .renzhengd_content{margin-top: 50px;}
            .renzhengdiv .renzhengd_content p{margin-top: 10px;color:#666666;}
            .renzhengdiv .renzhengd_content .rzd_content_title{color:#ee7800;}

        </style>
        
    </head>
    <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料</div>
                <div class="tab_main">
                    <div class="m_r_title">
                       <span onclick="parent.iframeGoToUrl('${ctx}/perinfo')">个人资料</span>
                        <span onclick="parent.iframeGoToUrl('${ctx}/hyzl/EnterpriseDataZero')">公司资料</span>
                        <span onclick="goUrl('${ctx}/pwdManage/modify')">密码管理</span>
                        <span class="m_r_tname">认证服务</span>
                    </div>

                    <div class="warningdiv font_1">
                        <div class="warningd_left"></div>
                        <div class="warningd_right">
                            <p>尊敬的客户,请根据优蚁网提示完成认证,未认证用户无法享受其余相关服务</p>
                            <span>感谢您的配合,祝您使用愉快</span>
                        </div>
                    </div>
                    
                    <div class="renzhengdiv">
                        <h4>[ 我们的认证服务 ]</h4>
                        <div class="renzhengd_mid">
                            <a class="rz_done" href="javascript:void(0)"><div class="rzd_mid_img rz_person"></div><p>个人认证</p></a>
                            <a class="rz_done" href="javascript:void(0)"><div class="rzd_mid_img rz_youyi"></div><p>优蚁认证</p></a>
                            <a class="rz_done" href="javascript:void(0)"><div class="rzd_mid_img rz_company"></div><p>企业认证</p></a>
                        </div>
                        <div class="renzhengd_content">
                            <p class="rzd_content_title">优蚁网认证会员认证说明:</p>
                            <p class="font_1">1)全新的认证体系提供更安全、更严格的真实性验证,也能够更好地保护企业及用户的合法权益.</p>
                            <p class="font_1">2)优蚁网认证全过程完成后,用户将在网上看到认证会员特有的标识.</p>
                            <p class="font_1">3)会员资质审核认证通过后,认证会员将获得:发布供求信息、企业信息展示、询价议价、交易撮合以及在线交易等服务.</p>
                            <p class="font_1">4)会员认证通过后可以发布供应、求购信息,添加商友等高级功能.</p>
                        </div>
                    </div>

                    
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
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
            })
        </script>
    </body>
</html>