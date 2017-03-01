<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <title>环保需求状态修改页面</title>
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
			.save{border:1px solid #cccccc;border-top:none;text-align:center;height:60px;border-top: none;line-height: 60px;width: 752px;}
			.save a{background-color: #5EC520;color: white;font-size: 14px; padding: 15px 60px;}
			#hbxq tr th{text-align: center;}
			.tr_title{height: 60px;line-height: 60px;font-size: 14px;}
			#hbxq tr td{text-align: center;border-bottom: 1px dashed #cccccc;}
            /*系统消息sys_m*/
            .main_right .sys_message{width:480px;height:225px;float:left;border:1px solid #cccccc;overflow: hidden;margin-bottom: 15px;}
             .main{height: 1000px;}
            .sys_message .sysm_top,.sys_message .sysm_bottom{padding:15px;background-color: #FFFDEE;}
            .sys_message .sysm_top{border-bottom: 1px dashed #cccccc;}
            .sys_message .sysm_bottom{height:107px;}
            .sysm_bottom{overflow: hidden;}
          
            .sysm_bottom table tr td{font-size: 14px;padding: 5px 5px;}
            .sysm_bottom table tr:hover{background-color: #efefef;cursor: pointer;color:red;}
            .sys_message p a{color:#ee7800;margin-left: 5px;}
            .sys_message .sysm_wanshan,.sys_message .sysm_newm{color:#5EC520;}
			.sysm_tips{color:#5EC520;font-size: 12px;}
			
           .biddingp_main{height:500px;overflow: auto;}
            /*竞价流程*/
            .main_right .biddingprocess{clear:both;width:752px;height:582px;border:1px solid #cccccc;overflow: hidden;}
            .biddingprocess .biddingp_main{padding:20px;}
            .ie8 .biddingprocess .biddingp_main{padding:20px;padding-right:13px;}
            .biddingp_main ul li{margin:17px 0;}
            .biddingp_main table tr td{width:125px;height:30px;}
			
            /*main_right结束*/
            /*main结束*/
        </style>
    </head>
     <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>修改需求状态</div>
               
                <div class="biddingprocess">
                    <!-- 需求查看记录 子标题栏begin -->
                    <div class="m_r_title">
                    	<span class="m_r_tname">环保需求信息</span>
                    	<div style="float: right;text-align: center;line-height: 30px;">
                    	<input id="pastTame" type="text" class="mh_date"  style="width:100px;height: 10px;" value=""/>&nbsp;
                    	<select id="s_remarks">
                    		<option value="hpbx">全部</option>
                    		<c:forEach items="${remarks }" var="remark" varStatus="st">
                    			<option value="hpbx">${remark.remarks }</option>
                    		</c:forEach>
                    	</select>
                    	
                    	<a href="javascript:shaixuan();" class = "shaixuan" >筛	选</a>
                    	</div>
                    </div>
                      <!-- 需求查看记录 子标题栏end -->
                      <!-- 需求查看记录 -->
                    <div class="biddingp_main">
                     <c:choose>
                     <c:when test="${!empty rs}">
                    	<!-- 显示环保需求信息 开始-->
                    	<table id="hbxq" style="width:100%;">
                    	<tr class="tr_title">
                    		<th>序号</th>
                    		<th>环保业务</th>
                            <th>需求描述</th>
                    		<th>联系人</th>
                            <th>公司名称</th>
                    		<th>联系方式</th>
                    		<th>需求状态</th>
                    		<th>需求时间</th>
                    	</tr>
                    	<c:forEach items="${rs }" var="hb" varStatus="st">
                    	<tr class = "t_tr_hbxq"  id="${hb.id }">
                    		<td style="width: 50px;">${st.index + 1}</td>
                    		<td>${hb.remarks }</td>
                            <td>${hb.requirement_describe }</td>
                    		<td>${hb.name }</td>
                            <td>${hb.company_name }</td>
                    		<td>${hb.phone }</td>
                    		<td style="text-align: center;">
                    			<select>
                    			<option value="status">${hb.trade_status }</option>
                    			<option value="status">提交中</option>
                    			<option value="status">洽谈中</option>
                    			<option value="status">已解决</option>
                    			</select>
                    		</td>
                    		<td>${fn:substring(hb.create_date,0,10) }</td>
                    	</tr>
                    	</c:forEach>
                    	</table>
                    	<!-- 显示环保需求信息 结束-->
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
                
                 <div class="save" >
                    	<span class="end_title" >
                    		<a href="javascript:save();">保存</a>
                    	</span>
                  </div>
        </div>
</div>
        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
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
					if(times[0]<today.getFullYear()){}
					else if(times[0]==today.getFullYear() && times[1]<(today.getMonth()+1)){}
					else if(times[0]==today.getFullYear() && times[1]==(today.getMonth()+1) && times[2]<=today.getDate()){}else{
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
					url:"${ctx}/userhomepage/getSomeSupplyAjax",
					data:"date="+date+"&remarks="+remarks,
					dataType:'json',
					success:function(data){
						var html='<tr class="tr_title">';
                        html += '<th>序号</th>';
                        html += '<th>环保业务</th>';
                        html += '<th>需求描述</th>';
                        html += '<th>联系人</th>';
                        html += '<th>公司名称</th>';
                        html += '<th>联系方式</th>';
                        html += '<th>需求状态</th>';
                        html += '<th>需求时间</th>';
                        html += '</tr>';
						$.each(data,function(index,item){
							var line_num = index+1;
							html+="<tr class =\"t_tr_hbxq\"  id=\""+item.id+"\">"+
                    "		<td style=\"width: 20px;\">"+line_num+"、</td>"+
                    "		<td>"+item.remarks+"</td>"+
                            "<td>"+item.requirement_describe+"</td>" +
                    "		<td>"+item.name+"</td>"+
                    "		<td>"+item.company_name+"</td>"+
                    "		<td>"+item.phone+"</td>"+
                    "		<td style=\"text-align: center;\">"+
                    		"	<select>"+
                    		"	<option value=\"status\">"+item.trade_status+"</option>"+
                    		"	<option value=\"status\">提交中</option>"+
                    		"	<option value=\"status\">洽谈中</option>"+
                    		"	<option value=\"status\">已解决</option>"+
                    		"	</select>"+
                    		"</td>"+
                    		"<td>"+item.create_date.substring(0,10)+"</td>"+
                    "	</tr>";
						});
						$("#hbxq").html(html);
					},
					error:function(data){
						parent.showMess("获取失败！");
					}
				});
		 } 
		 
		 
		 
		 function supplyDetail(id,trade_status){
         	if(trade_status=='洽谈中'||trade_status=='已解决'){
         		parent.showMess("该环保需求已在洽谈中,请查看<提交中>的信息");
         	}else{
            		window.open('${ctx}/supply-demand/details/'+id);
         	}
         }
		 //保存
		 function save(){
			 var ids = "";
			 var status = "";
			 $('#hbxq tr').each(function(){
				 var id = $(this).attr("id");
				 var st = $(this).find("select option:selected").text();
				 if('提交' != st){
					 ids = ids + id + "_";
					 status = status + st +"_";
				 }
			 });
			 if(ids=="_"||status=="_"){
				 parent.showMess("未作改动！");
				return;
			 }
			 $.ajax({
					type:"POST",
					url:"${ctx}/userhomepage/save",
					data:"ids="+ids+"&status="+status,
					dataType:'json',
					success:function(data){
						if(data){
							parent.showMess("修改成功！");
							location.reload() ;
						}else{
							parent.showMess("修改失败！");
						}
					},
					error:function(data){
						parent.showMess("修改失败！");
					}
				});
		 }
        </script>
    </body>
</html>