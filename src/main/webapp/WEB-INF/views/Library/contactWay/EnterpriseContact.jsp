<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href=""/> 
<title>企业_联系方式</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/qiye_style.css"/>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
            <!-- qy_m_r 中间右侧 -->
            <div class="qy_m_r">
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>联系方式</span>
                        
                    </div>
                    
                    <div class="qy_m_r_d_main">
                        <div class="qiye_lianxifangshi">
                            <p><span>公司名称：</span>${companyList.companyname}</p>
                            <p><span>公司地址：</span>${companyList.address}</p>
                            <p><span>邮政编码：</span>${companyList.postalcode}</p>
                            <p><span>公司电话：</span>${companyList.phoneenterprise}</p>
                            <p><span>公司传真：</span>${companyList.companyfax}</p>
                            <p><span>公司网址：</span>${companyList.companyurl}</p>
                            <p><span style="letter-spacing: 1px;">联  系  人：</span>
                                <c:choose>
                                <c:when test="${companyList.contact == '' || companyList.contact == null}" >
                                    ${companyList.realName}
                                </c:when>
                                <c:otherwise>
                                    ${companyList.contact}
                                </c:otherwise>
                                </c:choose>
                            </p>
                            <p><span>即时通信 :</span><a class="communication" href="javascript:liaotian(${companyList.userId})"></a></p>
                            <p><span>在线状态：</span>
                            <c:choose>
                            	<c:when test="${status==1}">
                            		<span class="online-type-r">当前在线</span>
                            	</c:when>
                            	<c:otherwise>
                            		<span class="online-type">当前离线</span>
                            	</c:otherwise>
                            </c:choose>
                            
                            
                            </p>
                            
                        </div>
                    </div>
                </div>
            </div>
            <form action="addLeaveWord" method="post" id="formId">
            <div class="qy_m_r">
                <div class="qy_m_r_div">
                    <div class="qy_m_r_d_title">
                        <span>在线留言</span>
                    </div>
                    <div class="qy_m_r_d_main">
                        <div class="qiye_zaixianliuyan">
                            <div class="row">
                                <span class="row-title">
                            		        留言主题
                                </span>
                                <input type="text" name="mesTitle" id="mesTitleId">
                                <label for="">*</label>
                            </div>
                            <div class="row">
                                <span class="row-title">
                            		        姓名
                                </span>
                                <input type="text" name="userName" id="userNameID">
                                <label for="">*</label>
                            </div>
                            <div class="row">
                                <span class="row-title">
                                    QQ
                                </span>
                                <input type="text" name="userQQ">
                            </div>
                            <div class="row">
                                <span class="row-title">
                                    E-mail
                                </span>
                                <input type="text" name="userMail">
                            </div>
                            <div class="row">
                                <span class="row-title">
                           			         手机号码
                                </span>
                                <input type="text" name="userPhone" id="userPhoneId">
                                <label for="">*</label>
                            </div>
                            <div class="row">
                                <span class="row-title">
                           			         留言内容
                                </span>
                                <textarea cols="40"rows="4" name="mesContent"></textarea>
                            </div>
                            <input type="hidden" name="enterpriseId" value="${enterpriseId}"/>
                            <div class="row">
                                <span class="row-title">&nbsp;</span>
                                <a href="javascript:saveContact()">提交</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            
         <div class="popumask popumasks"></div>
        <div class="populayer pl_normal populayers" >
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3" id="contentText">
                <p>请先完善信息!</p>
            </div>
        </div>
            <!-- qy_m_r 中间右侧结束 -->
<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>
<script>
$(function(){
	var str='${sta}';
	if(str=='1'){
		
		<%
		session.setAttribute("sta","");   //把b放到session里，命名为a，
		%>
		mess("留言成功");
	}
	
	$(".lianxifangshi").parent().addClass("header_nav_sel").siblings().removeClass("header_nav_sel");
	//弹出层 关闭
    $(".populayer .layer_top a").click(function(){
        $(".populayer").fadeOut();
        $(".popumask").fadeOut();
    });
	
});
   function mess(str){
        	var ss = "<p>"+str+"</P>";
        	$(".populayers #contentText").empty().append(ss);
    		$(".populayers").show();
            $(".popumasks").show();
          }  
function liaotian(obj){
	window.open("${ctx}/home?str=/memSerevice/communication/goChat?id="+obj, "_blank");
}
function saveContact(){
	var mesTitleId=$("#mesTitleId").val();
	var userNameID=$("#userNameID").val();
	var userPhone=$("#userPhoneId").val();
	if(mesTitleId==null||mesTitleId==""){
		mess("请填写留言主题");
	}else if(userNameID==null||userNameID==""){
		mess("请填写姓名");
	}else if(userPhone==null||userPhone==""){
		mess("请填写手机");
	}else{
		$("#formId").submit();
	}

}
</script>
</body>
</html>