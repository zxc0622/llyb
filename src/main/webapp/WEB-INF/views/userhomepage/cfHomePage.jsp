<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <title>生产型企业(非环保企业)用户首页</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
        <link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
        <link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
        	/*筛选*/
			.m_r_title .shaixuan{background-color:#EF7800; height:20px;line-height:20px;margin-top:5px;width:80px;color: white;margin-right: 10px;margin-left: 10px;}
			.shaixuan{}
			.sysm_tips{color:#5EC520;font-size: 12px;}
			.biddingp_main table{width:700px;}
			.biddingp_main table tr td{width:125px;font-size: 14px;}
			.t_tr_cfxq{width: 700px;height: 30px;font-size: 12px;}
			#cfxq{margin-bottom: 10px;}
			#s_remarks{width: 80px;}
			 /*查看当前用户信息的公司*/
			 .a_btn{width: 80px;background-color: #EF7800;color: white;font-size: 18px;padding: 15px 30px;}
			 .bottom_company{background-color: #5EC520;font-size: 12px; height: 30px;width: 100px;float: left; line-height: 30px;text-align: center;margin-top: 10px;margin-right: 50px;}
			 .bottom_company div{height:30px;width:60px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis; margin-left: 20px;line-height: 30px;color:white;}
			 .t_tr_company{border-bottom:1px solid #cccccc; margin-bottom: 15px;width:650px;height:50px;line-height: 50px;}
			 .bottom_company a{color:white;}
			 .main_bottom{width:650px;}
			 .t_tr_td_bottom_title{font-size: 20px;}
            /*系统消息sys_m*/
            .main_right .sys_message{width:480px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-bottom: 15px;}
            .sys_message .sysm_top,.sys_message .sysm_bottom{padding:15px;background-color: #FFFDEE;}
            .sys_message .sysm_top{border-bottom: 1px dashed #cccccc;}
            .sys_message .sysm_bottom{height:107px;}
            .sys_message p a{color:#ee7800;margin-left: 5px;}
            .sys_message .sysm_wanshan,.sys_message .sysm_newm{color:#5EC520;}
            .sysm_company .c_name{background-color:#EF7800;color: white;font-size: 12px;}
            .sysm_company table tr td{width: 100px; padding: 8px 8px;}
            .re_company_name{margin-left:-8px;width: 100px;height: 30px;background-color:#EF7800;text-align: center;line-height: 30px;color:white;}
			.length_company_name{margin-left:20px;height:30px;width:60px; white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
			
            /*快捷方式 quickway*/
            .main_right .quickway{width:260px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-left: 10px;margin-bottom: 15px;}
            .quickw_main{padding:0 30px;background-color: #F7F8F8;overflow: hidden;height:200px;}
            .quickw_main ul{overflow: hidden;}
            .quickw_main ul li{float:left;width:60px;height:80px;}
            .quickw_main ul li:nth-child(1){margin-left: 20px;margin-top:15px;}
            .quickw_main ul li:nth-child(2){margin-left: 35px;margin-top:15px;}
            .quickw_main ul li:nth-child(3){margin-left: 20px;margin-top:5px;}
            .quickw_main ul li:nth-child(4){margin-left: 35px;margin-top:5px;}
			.ie8 .quickw_main ul li{margin-left:25px; margin-top:10px;}
            .quickw_main ul li a{width:100%;height:100%;display: block}
            .quickw_main ul li a div{width:100%;height:60px;}
            .quickw_main ul li a .qw_m_qiugou{background:url(${ctxStatic}/img/llhb/icons.png) -65px -4px no-repeat;}
            .quickw_main ul li a .qw_m_gongying{background:url(${ctxStatic}/img/llhb/icons.png) -132px -4px no-repeat;}
            .quickw_main ul li a .qw_m_ziliao{background:url(${ctxStatic}/img/llhb/icons.png) -65px -71px no-repeat;}
            .quickw_main ul li a .qw_m_guanli{background:url(${ctxStatic}/img/llhb/icons.png) -132px -71px no-repeat;}
            .quickw_main ul li a p{line-height: 20px;text-align: center;}

            /*竞价流程*/
            .main_right .biddingprocess{clear:both;width:752px;height:200px;border:1px solid #cccccc;overflow: hidden;}
            .biddingp_main .tri_text{padding:3px 5px;color:#fff;background:#5ec520;}
            .biddingprocess .biddingp_main{padding:20px;}
            .ie8 .biddingprocess .biddingp_main{padding:10px;padding-right:13px;}
            .biddingp_main ul li{margin:17px 0;}

            /*main_right结束*/
            /*main结束*/
        </style>
    </head>
     <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>用户首页</div>
                <div class="sys_message font_1">
                    <div class="m_r_title"><span class="m_r_tname">系统消息</span></div>
                    <div class="sysm_top">
                        <p>尊敬的<span><shiro:principal property="loginName"/></span><b>您好!欢迎登录优蚁网商务中心!</b></p>
                        <c:if test="${dc != '100' }">
                        	<p class="sysm_wanshan">请完善您的个人信息,否则无法使用优蚁网为您提供的相关服务<a href="${ctx }/home?str=/perinfo" target="_parent">[请完善信息]</a></p>
                        </c:if>
                        		
                        <c:choose>
                    			<c:when test="${empty re}">
									<p class="sysm_tips">你还未查看过任何环保需求，让优蚁君推荐给您吧。</p>
								</c:when>
                    			<c:otherwise>
                    				<p class="sysm_tips">根据您发布的环保需求，向您推荐以下有资质的环保服务公司。</p>
                    			</c:otherwise>
                    		</c:choose>
                    </div>
                    <div class="sysm_bottom">
                    <c:if test="${!empty re }">
                    	  	<p style="font-size: 14px;margin-top: -10px;"><b>适合您的环保公司</b></p>
                    </c:if>
                   		<div class="sysm_company">
                   		<table>
                   		 <tr>
                   			 <c:forEach items="${re }" var="re" varStatus="st" begin="0" end="3">
                   		 		<td><div class="re_company_name"><div class="length_company_name"><a href="${ctx }/homepage/${re.id}" class="c_name" target="_blank">${re.company_name }</a></div></div></td>
                   			</c:forEach>
                   		 </tr>
                   		 <tr>
                   		 <c:forEach items="${re }" var="re" varStatus="st" begin="4" end="8">
                   		 		<td><div class="re_company_name"><div class="length_company_name"><a href="${ctx }/homepage/${re.id}" class="c_name" target="_blank">${re.company_name }</a></div></div></td>
                   			</c:forEach>
                   		</tr>
                   		 </table>
                	   </div>
                    </div>
                </div>
                <div class="quickway font_1">
                    <div class="m_r_title"><span class="m_r_tname">快捷方式</span></div>
                    <div class="quickw_main">
                        <ul>
                             <li><a href="${ctx}/addNeed" target="_blank">
                                    <div class="qw_m_qiugou"></div>
                                    <p>发布需求</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/proManage/add" target="_parent">
                                    <div class="qw_m_gongying"></div>
                                    <p>发布产品</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/perinfo" target="_parent">
                                    <div class="qw_m_ziliao"></div>
                                    <p>会员资料</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit" target="_parent">
                                    <div class="qw_m_guanli"></div>
                                    <p>云铺管理</p>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <div class="biddingprocess">
                    <!-- 我的环保需求 子标题栏begin -->
                    <div class="m_r_title">
                    	<span class="m_r_tname">我的环保需求</span>
                    	<span style="font-size: 12px;color: blue;margin-left: 20px;">
                    		<c:forEach items="${ts}" var="ts" >
                    			<c:if test="${ts.key eq '提交中' }">提交中（${ts.value }）</c:if>
                    		</c:forEach>
                    		<c:forEach items="${ts}" var="ts" >
                    			<c:if test="${ts.key eq '洽谈中' }">洽谈中（${ts.value }）</c:if>
                    		</c:forEach>
                    		<c:forEach items="${ts}" var="ts" >
                    			<c:if test="${ts.key eq '进行中' }">进行中（${ts.value }）</c:if>
                    		</c:forEach>
                    		<c:forEach items="${ts}" var="ts" >
                    			<c:if test="${ts.key eq '已解决' }">已完结（${ts.value }）</c:if>
                    		</c:forEach>
                    	</span>
                    	<div style="float: right;line-height: 30px;text-align: center;">
                    	<input id="pastTame" type="text" class="mh_date"   style="width:100px;height: 10px;" value=""/>&nbsp;
                    	<select id="s_remarks">
                    		<option value="hpbx">全部</option>
                    		<c:forEach items="${remarks }" var="remark" varStatus="st">
                    			<option value="hpbx">${remark.remarks }</option>
                    		</c:forEach>
                    	</select>
                    	<a href="javascript:void(0);" onclick="shaixuan()" class = "shaixuan" >筛	选</a>
                    	</div>
                    </div>
                      <!-- 我的环保需求子标题栏end -->
                      <!-- 我的环保需求 开始-->
                    <div class="biddingp_main"  style="overflow: auto;height:150px;position:relative;padding-top:10px;padding-bottom: 0px;">
                    <c:choose>
                    <c:when test="${!empty cf}">
                    	<!-- 显示我发布的环保需求信息 开始-->
                    	<table id="cfxq" >
                    	<c:forEach items="${cf }" var="cf" varStatus="st">
                    		<c:if test="${cf.trade_status != '提交'}">
                    		<tr class="t_tr_cfxq">
                    		<td>${st.index + 1}、${cf.remarks }</td>
                    		<td>${cf.name }</td>
                    		<td>${cf.phone }</td>
                    		<td>${cf.trade_status }</td>
                    		<td>${fn:substring(cf.create_date,0,10) }</td>
                    		<c:if test="${cf.trade_status == '提交中'}">
                    		<td><a href="${ctx }/userhomepage/editRequriement?id=${cf.id }&remarks=${cf.remarks }&name=${cf.name }&phone=${cf.phone }&trade_status=${cf.trade_status }&create_date=${cf.create_date}" style="color:blue;">[编辑]</a></td>
                    		</c:if>
                    	</tr>
                    		</c:if>
                    	</c:forEach>
                    	</table>
                    	<!-- 显示我发布的环保需求信息 结束-->
                    </c:when>
                    <c:otherwise>
                    	<div style="font-size: 18px;">还没发布任何环保需求</div>
                    	<div style="width: 100%;margin-top: 40px;text-align: center;">
                    		<a class= "a_btn" href="${ctx}/addNeed" target="_blank">立即发布需求</a>
                    	</div>
                    	
                    </c:otherwise>
                    </c:choose>
                        
                    </div>
                   <!-- 我的环保需求结束 -->
                </div>
                
                <!-- 被查看记录begin -->
               <div class="biddingprocess" style="margin-top:20px;height: 392px;">
                    <!-- 被查看记录 子标题栏begin -->
                    <div class="m_r_title">
                    	<span class="m_r_tname">被查看记录</span>
                    	
                    	<span style="font-size: 12px;color: blue;margin-left: 60px;">目前共有（${fn:length(ss) }）家环保公司查看我发布的（${fn:length(ssMaps)}）条记录</span>
                    </div>
                    <!-- 被查看记录 子标题栏end -->
                    <!-- 显示查看记录的公司 开始-->
                    <div class="biddingp_main" style="overflow: auto; height: 340px;position:relative;padding-top:10px;padding-bottom: 0px;">
                     <c:choose>
                    <c:when test="${!empty ssMaps}">
                    <div class="main_bottom">
                    	<c:forEach items="${ssMaps }" var="item">
                    		
                    			<div class="t_tr_td_bottom_title"><b>${fn:substringAfter(item.key,"_") }</b></div>
                    		
                    		<c:if test="${!empty item.value}">
                    		<div class="t_tr_company">
                    			 <c:forEach items="${item.value}" var="it" varStatus="st">
                    					<div class="bottom_company">
                    						<div><a href="${ctx }/homepage/${it.company_id}" target="_blank">${it.company_name}</a></div>
                    					</div>
                    				</c:forEach>
                    		</div>
                    		</c:if>
                    	</c:forEach>
                    </div>	
                    
                    </c:when>
                    <c:otherwise>
                    	<div style="font-size: 18px;">还没有环保公司查看我的需求</div>
                    </c:otherwise>
                    </c:choose>
                    </div>
                    <!-- 显示查看记录的公司 结束-->
                </div>
                <!-- 被查看记录end -->
        </div>
		</div>
        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
        <script type="text/javascript">
        $(function (){
			$("input.mh_date").manhuaDate({					       
				Event : "click",//可选				       
				Left : 0,//弹出时间停靠的左边位置
				Top : -16,//弹出时间停靠的顶部边位置
				fuhao : "-",//日期连接符默认为-
				isTime : false,//是否开启时间值默认为false
				beginY : 1949,//年份的开始默认为1949
				endY :2100//年份的结束默认为2049
			});
		});
	   
	 //验证时间
		function timeCheck(){
			var pastDate = $(".mh_date").val();
			var t = false;
				var today=new Date();
				var times=pastDate.split('-');
				if(times[0]<=today.getFullYear()){}
				else if(times[0]==today.getFullYear() && times[1]<(today.getMonth()+1)){}
				else if(times[0]==today.getFullYear() && times[1]==(today.getMonth()+1) && times[2]<today.getDate()){}else{
					t = true;
				}
				return t ;
		}
	 
	 	//异步请求,筛选
	 	function shaixuan(){
	 		var date = $(".mh_date").attr("value");
	 		if(date.length>0 && timeCheck()){
	 			parent.showMess("请选择有效日期！");
	 			return ;
	 		}
	 	
			var remarks = $("#s_remarks  option:selected").text();
			 $.ajax({
				 type:"POST",
				 url:"${ctx}/userhomepage/getCfxqAjax",
				 data:"date="+date+"&remarks="+remarks,
				 dataType:'json',
				 success:function(data){
					 var html = "";
					 var editHtml = "<td><a href=\"\" style=\"color:blue;\">[编辑]</a></td>";
					
					 $.each(data,function(index, item){
						 var line_num = index+1;
						 html+="<tr class = \"t_tr_cfxq\">"+
	                    	"	<td >"+line_num+"、"+item.remarks+"</td>"+
	                    	"	<td >"+item.name+"</td>"+
	                    	"	<td >"+item.phone+"</td>"+
	                    	"	<td >"+item.trade_status+"</td>"+
	                    	"	<td >"+item.create_date.substring(0,10)+"</td>"
	                    	;
	                    	if(item.trade_status == "提交中"){
	                    		var editHtml = "<td><a href=\"${ctx }/userhomepage/editRequriement?id="+item.id+"&remarks="+item.remarks+"&name="+item.name+"&phone="+item.phone+"&trade_status="+item.trade_status+"&create_date="+item.create_date+"\" style=\"color:blue;\">[编辑]</a></td>";
	                    		html +=editHtml;
	                    	}
	                    	html +="</tr>";
					 });
					 $("#cfxq").html(html);
				 },
				 error:function(data){
					 parent.showMess("获取失败！");
				 },
				 
			 });
	 	}
        </script>
    </body>
</html>