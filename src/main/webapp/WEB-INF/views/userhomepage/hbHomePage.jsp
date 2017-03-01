<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <title>环保企业用户首页</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        
        <link href="${ctxStatic}/css/llhb/common.css" rel="stylesheet" type="text/css"/>
        <link href="${ctxStatic}/css/llhb/gerenshouye_v1.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css"/>
        <style type="text/css">
        	/*需求查看记录*/
			.t_tr_hbxq{width: 100%;height: 30px;margin: 10px;font-size: 15px;}
			.m_r_title .shaixuan{background-color:#EF7800; height:20px;line-height:20px;margin-top:5px;width:80px;color: white;margin-right: 10px;margin-left: 10px;}
			.a_btn{width: 80px;background-color: #EF7800;color: white;font-size: 18px;padding: 15px 30px;}
			.end_title{font-size: 14px;color: blue;float: right;margin-right: 60px;}
            /*系统消息sys_m*/
            .main_right .sys_message{width:480px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-bottom: 15px;}
            .sys_message .sysm_top,.sys_message .sysm_bottom{padding:15px;background-color: #FFFDEE;}
            .sys_message .sysm_top{border-bottom: 1px dashed #cccccc;}
            .sys_message .sysm_bottom{height:107px;}
            .sysm_bottom{overflow: hidden;}
            .sysm_bottom table tr td{font-size: 14px;padding: 5px 5px;}
            .sysm_bottom table tr:hover{background-color: #efefef;cursor: pointer;color:red;}
            .sys_message p a{color:#ee7800;margin-left: 5px;}
            .sys_message .sysm_wanshan,.sys_message .sysm_newm{color:#5EC520;}
			.sysm_tips{color:#5EC520;font-size: 12px;}
			
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
            .main_right .biddingprocess{clear:both;width:752px;height:582px;border:1px solid #cccccc;overflow: hidden;}
            .biddingprocess .biddingp_main{padding:20px;}
            .ie8 .biddingprocess .biddingp_main{padding:20px;padding-right:13px;}
            .biddingp_main ul li{margin:17px 0;}
            .biddingp_main table tr td{width:125px;height:30px;}
            .tri-r{height:0;width:0;border:transparent solid 14px;border-left-color: #5ec520;}
            .tri-l{height:0;width:0;border:transparent solid 14px;border-right-color: #5ec520;}
            

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
                        <p>尊敬的<span><shiro:principal property="loginName"/></span>您好!欢迎登录优蚁网商务中心!</p>
                        <c:if test="${dc != '100' }">
                        	<p class="sysm_wanshan">请完善您的个人信息,否则无法使用优蚁网为您提供的相关服务<a href="${ctx }/home?str=/perinfo" target="_parent">[请完善信息]</a></p>
                        </c:if>
                        <c:choose>
                        	<c:when test="${empty hbfw}">
                        		<p class="sysm_tips">你还未查看过任何环保需求，让优蚁君推荐给您吧。</p>
                        	</c:when>
                        	<c:otherwise>
                        		<p class="sysm_tips">根据您公司的经营范围，向您推荐以下环保需求信息。</p>
                        	</c:otherwise>
                        </c:choose>
                       
                    </div>
                    <div class="sysm_bottom">
                     <c:choose>
                    <c:when test="${!empty hbfw}">
                    	<!-- 滚动显示环保需求信息 开始-->
                    	
                    	<table id="hbfw" style="width: 100%;height: 100% font-size: 12px;">
                    	<tbody>
                    	<c:forEach items="${hbfw }" var="hb" varStatus="st">
                    		<%-- <c:if test="${hb.trade_status=='提交中' }"> --%>
                    		 <tr onclick="supplyDetail('${hb.id }','${hb.trade_status}')">
                    		<td style="width: 20%;height: 100%">${hb.remarks }</td>
                    		<td style="width: 20%;height: 100%">
                    			<c:choose>
                    				<c:when test="${hb.status eq -1}">${fn:substring(hb.name,0,1) }**</c:when>
                    				<c:otherwise>${hb.name }</c:otherwise>	
                    			</c:choose>
                    		</td>
                    		<td style="width: 20%;height: 100%">
                    			<c:choose>
                    				<c:when test="${hb.status eq -1}">${fn:substring(hb.phone,0,3) }********</c:when>
                    				<c:otherwise>${hb.phone }</c:otherwise>	
                    			</c:choose>
                    		</td>
                    		<td style="width: 20%;height: 100%">${hb.trade_status }</td>
                    		<td style="width: 20%;height: 100%">${fn:substring(hb.create_date,0,10) }</td>
                    	</tr>
                    <%-- 	</c:if> --%>
                    	</c:forEach>
                    	</tbody>
                    	</table>
                    	<!-- 滚动显示环保需求信息 结束-->
                    </c:when>
                    <c:otherwise>
                    	<div style="width: 100%;margin-top: 40px;text-align: center;">
                    		<a class= "a_btn" >联系客服</a>
                    	</div>
                    </c:otherwise>
                    </c:choose>
                    </div>
                </div>
                <div class="quickway font_1">
                    <div class="m_r_title"><span class="m_r_tname">快捷方式</span></div>
                    <div class="quickw_main" style="border:0px solid red;">
                        <ul style="border:0px solid yellow;margin-top: 40px;">
                            <li  style="height: 100%;border:0px solid blue;"><a href="${ctx }/home?str=/proManage/add" target="_parent">
                                    <div class="qw_m_gongying"></div>
                                    <p>发布产品</p>
                                </a></li>
                            <li><a href="${ctx }/home?str=/ypcd/menu/setOfCloudinit" target="_parent">
                                    <div class="qw_m_guanli"></div>
                                    <p>云铺管理</p>
                                </a></li>
                        </ul>
                    </div>
                </div>
                <div class="biddingprocess">
                    <!-- 需求查看记录 子标题栏begin -->
                    <div class="m_r_title">
                    	<span class="m_r_tname">需求查看记录</span>
                    	<div style="float: right;text-align: center;line-height: 30px;">
                    	<input id="pastTame" type="text" class="mh_date"  style="width:100px;height: 10px;" value=""/>&nbsp;
                    	<select id="s_remarks">
                    		<option value="hpbx">全部</option>
                    		<c:forEach items="${remarks }" var="remark" varStatus="st">
                    			<option value="hpbx">${remark.remarks }</option>
                    		</c:forEach>
                    	</select>
                    	
                    	<a href="javascript:void(0);" onclick="shaixuan()" class = "shaixuan" >筛	选</a>
                    	</div>
                    </div>
                      <!-- 需求查看记录 子标题栏end -->
                      <!-- 需求查看记录 -->
                    <div class="biddingp_main" style="overflow: auto; height: 500px;">
                     <c:choose>
                    <c:when test="${!empty payHbfw}">
                    	<!-- 显示查看过的环保需求信息 开始-->
                    	<table id="hbxq">
                    	<c:forEach items="${payHbfw }" var="hb" varStatus="st">
                    	<tr class = "t_tr_hbxq">
                    		<td >${st.index + 1}、${hb.remarks }</td>
                    		<td >${hb.name }</td>
                    		<td >${hb.phone }</td>
                    		<td >${hb.trade_status }</td>
                    		<td >${fn:substring(hb.create_date,0,10) }</td>
                    		<td style="color:orange;">-${hb.costs}</td>
                    	</tr>
                    	</c:forEach>
                    	</table>
                    	<!-- 显示查看过的环保需求信息 结束-->
                    </c:when>
                    <c:otherwise>
                    	<div style="font-size: 16px;">您还未查看任何环保需求</div>
                    	<div style="width: 100%;margin-top: 40px;text-align: center;">
                    		<a class= "a_btn" href="${ctx }/supply-demand" target="_blank">立即查看需求</a>
                    	</div>
                    </c:otherwise>
                    </c:choose>
                        
                    </div>
                   <!-- 需求查看记录结束 -->
                  
                </div>
                
                 <div class="biddingprocess" style="height:30px;border-top: none;line-height: 30px;">
                    	<span class="end_title" >已查看（${fn:length(payHbfw) }）条环保需求信息,共扣（${totalCosts }）个优蚁币,剩余（${money}）个优蚁币</span>
                  </div>
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
		 
		 //筛选按钮
		  function shaixuan(){
			 var date = $(".mh_date").attr("value");
			 if(date.length>0 && timeCheck()){
		 			parent.showMess("请选择有效日期！");
		 			return ;
		 		}
			 var remarks = $("#s_remarks  option:selected").text();
		
			 $.ajax({
					type:"POST",
					url:"${ctx}/userhomepage/getHbxqAjax",
					data:"date="+date+"&remarks="+remarks,
					dataType:'json',
					success:function(data){
						var html="";
						$.each(data,function(index,item){
							var line_num = index+1;
							html+="<tr class = \"t_tr_hbxq\">"+
                    	"	<td >"+line_num+"、"+item.remarks+"</td>"+
                    	"	<td >"+item.name+"</td>"+
                    	"	<td >"+item.phone+"</td>"+
                    	"	<td >"+item.trade_status+"</td>"+
                    	"	<td >"+item.create_date.substring(1,10)+"</td>"+
                    	"	<td style=\"color:orange;\">-"+item.costs+"</td>"+
                    	"</tr>";
						});
						$("#hbxq").html(html);
					},
					error:function(data){
						parent.showMess("获取失败！");
					}
				});
		 } 
		 
		 
		 //
		 $(document).ready(function(){
				 var len = $("#hbfw tbody").children("tr").length; //推荐信息的条数
				 if(len>3){
					 smooth_scroll2(".sysm_bottom","tr");	
				 }			 
		 });
		 
		 //滚动信息
		 function smooth_scroll2(obj,sub){
                var $dom2 = $(obj);
                //$dom2.find("thead").remove();
                $dom2.find("tbody").append($dom2.find("tbody").html()).append($dom2.find("tbody").html());
                var $scroll_h2=$dom2.get(0).scrollHeight/2;
                var $scroll_t2=0;
                scrolltimer2 = setInterval(function(){
                    if($scroll_t2>=$scroll_h2){
                        $scroll_t2=0;
                    }
                    $dom2.scrollTop(($scroll_t2+=0.5));
                },30);
                $dom2.find(sub?sub:"a").on("mouseover",function(){
                    clearInterval(scrolltimer2);
                }).on("mouseleave",function(){
                    scrolltimer2 = setInterval(function(){
                        if($scroll_t2>=$scroll_h2){
                            $scroll_t2=0;
                        }
                        $dom2.scrollTop(($scroll_t2+=0.5));
                    },30);
                });
            }
		 
		 function supplyDetail(id,trade_status){
         	if(trade_status=='洽谈中'||trade_status=='已解决'){
         		parent.showMess("该环保需求已在洽谈中,请查看<提交中>的信息");
         	}else{
            		window.open('${ctx}/supply-demand/details/'+id);
         	}
         }
        </script>
    </body>
</html>