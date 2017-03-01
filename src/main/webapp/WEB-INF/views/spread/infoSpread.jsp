<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/> 
<title>新增推广关键词</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/manhuaDate.1.0.css">

<style>
.isgreen{color:#5ec520;}

.tab_main .tab_main_row{height:auto;}
.tab_main_result table tr{height: auto;}
.tab_main_result table tr td{padding:3px;}
.sub_banzhu{margin:0 3px;}
.tab_main input[type="text"]{height:28px;width:150px;}
.m_r15{margin-right: 15px;}
.tab_main_row{margin-top: 10px;}
select{height:30px;}
table th{border-bottom: 1px solid #ccc;}
table td{border-bottom: 1px dashed #ccc;}
.w_4txt{width:55px;}
.mh_date{padding:0;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>新增推广关键词</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">新增推广关键词</span>
        </div>
        <form action="saveSpread" method="post" id="formId">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">推广类型 :</div>
                <div class="fl m_r15">
                    <select name="leibie" id="selectId" style="width:153px;">
                        <option value="0">请选择类型</option>
                        <option value="S">供应</option>
                        <option value="D">求购</option>
                        <option value="E">企业库</option>
                    </select>
                </div>
                <div class="fl m_r15 w_4txt">投放人 :</div>
                <div class="fl m_r15">
                <c:choose>
	                 <c:when  test="${compName!=null&&compName!=''}">
	              	    <input type="text" name="compName" value="${compName}" id="compNameId" placeholder="请填写投放人">
	                 </c:when>
	                 <c:otherwise>
	                    <input type="text" name="compName" value="${spread.comp_name}" id="compNameId" placeholder="请填写投放人">
	                 </c:otherwise>
                </c:choose>
                   
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15 w_4txt">关键词 :</div>
                <div class="fl m_r15">
                	 <c:choose>
		                 <c:when  test="${spreadName!=null&&spreadName!=''}">
		                    <input type="text" name="spreadName" value="${spreadName}" id="spreadId" placeholder="请输入关键词">
		                 </c:when>
		                 <c:otherwise>
            		        <input type="text" name="spreadName" value="${spread.name}" id="spreadId" placeholder="请输入关键词">
		                 </c:otherwise>
                     </c:choose>
                
                </div>
                <div class="fl m_r15 w_4txt">出价 :</div>
                <div class="fl m_r15 spread_price">
	                    <c:choose>
			                 <c:when  test="${bid!=null&&bid!=''}">
			                       <input type="text" name="bid" value="${bid}" id="bidId" placeholder="请出价">
			                 </c:when>
			                 <c:otherwise>
                 				   <input type="text" name="bid" value="${spread.bid}" id="bidId" placeholder="请出价">
			                 </c:otherwise>
	                     </c:choose>
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15 w_4txt">开始时间 :</div>
                <div class="fl m_r15">
                    <c:choose>
			                 <c:when  test="${startTime!=null&&startTime!=''}">
                 			   <input class="mh_date" type="text" value="${startTime}" id="startId" name="startTime" placeholder="请输入开始时间">
			                 </c:when>
			                 <c:otherwise>
                    			<input class="mh_date" type="text" value="${fn:substring(spread.start_time, 0,10)}" id="startId" name="startTime" placeholder="请输入开始时间">
			                 </c:otherwise>
	               </c:choose>
                </div>
                <div class="fl m_r15 w_4txt">结束时间 :</div>
                <div class="fl m_r15">
                    <c:choose>
			                 <c:when  test="${endTime!=null&&endTime!=''}">
                 			   <input class="mh_date" type="text" value="${endTime}" id="endId" name="endTime" placeholder="请输入结束时间">
			                 </c:when>
			                 <c:otherwise>
              			       <input class="mh_date" type="text" value="${fn:substring(spread.end_time, 0,10)}" id="endId" name="endTime" placeholder="请输入结束时间">
			                 </c:otherwise>
	               </c:choose>
                </div>
            </div>
            <input name="id" type="hidden" value="${id}"/>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15 w_4txt">相应ID :</div>
                <div class="fl m_r15">
                       <c:choose>
			                 <c:when  test="${xiangYid!=null&&xiangYid!=''}">
                    <input type="text" name="xiangYid" value="${xiangYid}" id="xyId" placeholder="请输相应ID">
			                 </c:when>
			                 <c:otherwise>
                    <input type="text" name="xiangYid" value="${spread.bid_id}" id="xyId" placeholder="请输相应ID">
			                 </c:otherwise>
	               </c:choose>
                </div>
                <a href="javascript:saveSpread()" class="fl btn" style="margin-left: 101px;">新增</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15 w_4txt">查询 :</div>
                <div class="fl m_r15">
                    <select name="allLb" id="lbID">
                        <option value="0">请选择类型</option>
                        <option value="S">供应</option>
                        <option value="D">求购</option>
                        <option value="E">企业库</option>
                    </select>
                    <input type="text" style='width: 155px;' id="searchId" value="${lbName}" name="lbName">
                    <a href="javascript:searchSpread()"  class="btn">查询</a>
                </div>
            </div>
            <!--筛选结果-->
             <div class="tab_main_row clearfix">
                 <table style="width:715px;">
                     <tr>
                         <th>ID</th>
                         <th>图片</th>
                         <th>名称</th>
                         <th>发布时间</th>
                     </tr>
                      <c:if test="${allLb=='S'}">
                     	<c:forEach  items="${gongyingList}" var="gongyingList" varStatus="status">
                     	  <tr>
	                         <td > ${gongyingList.id}</td>
	                         <td> 
	                         <c:choose>
	                         	<c:when test="${gongyingList.pic1!=''&&gongyingList.pic1!=null}">
	                         		<img src="${gongyingList.pic1}" style="width:107px;height:87px;" alt="">
	                         	</c:when>
	                        	<c:when test="${gongyingList.pic2!=''&&gongyingList.pic2!=null}">
	                         		<img src="${gongyingList.pic2}" style="width:107px;height:87px;" alt="">
	                         	</c:when>
	                         	<c:otherwise>
	                        	 	<img src="${gongyingList.pic3}" style="width:107px;height:87px;" alt="">
	                         	</c:otherwise>
	                         </c:choose>
	                         </td>
	                         <td >
	                            ${gongyingList.info_title}
	                         </td>
	                         <td> ${gongyingList.create_date}</td>
                   		  </tr>
                     	</c:forEach>
                     </c:if>
                     
                     <c:if test="${allLb=='D'}">
                     	<c:forEach  items="${qiugouList}" var="qiugouList" varStatus="status">
                     	  <tr>
	                         <td > ${qiugouList.id}</td>
	                         <td> 
	                         <c:choose>
	                         	<c:when test="${qiugouList.pic1!=''&&qiugouList.pic1!=null}">
	                         		<img src="${qiugouList.pic1}" style="width:107px;height:87px;" alt="">
	                         	</c:when>
	                        	<c:when test="${qiugouList.pic2!=''&&qiugouList.pic2!=null}">
	                         		<img src="${qiugouList.pic2}" style="width:107px;height:87px;" alt="">
	                         	</c:when>
	                         	<c:otherwise>
	                        	 	<img src="${qiugouList.pic3}" style="width:107px;height:87px;" alt="">
	                         	</c:otherwise>
	                         </c:choose>
	                         </td>
	                         <td >
	                            ${qiugouList.info_title}
	                         </td>
	                         <td> ${qiugouList.create_date}</td>
                   		  </tr>
                     	</c:forEach>
                     </c:if>
                     <c:if test="${allLb=='E'}">
                     	<c:forEach  items="${companyList}" var="companyList" varStatus="status">
                     	  <tr>
	                         <td > ${companyList.id}</td>
	                         <td> <img src="${companyList.logo_img}" style="width:107px;height:87px;" alt=""></td>
	                         <td >
	                            ${companyList.company_name}
	                         </td>
	                         <td> ${companyList.create_date}</td>
                   		  </tr>
                     	</c:forEach>
                     </c:if>
                   
                 </table>
             </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

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
		var str='${spread.rank_type}';
		var stt='${allLb}';
		var arr ='${leibie}';
		if(arr!=null&&arr!='0'){
			$("#selectId").find("option[value="+arr+"]").attr("selected","selected");
		}
		$("#selectId").find("option[value="+str+"]").attr("selected","selected");
		$("#lbID").find("option[value="+stt+"]").attr("selected","selected");
		
	});
	//查询
	function searchSpread(){
		var str = $("#searchId").val();
		if(str!=''&&str!=null){
			$("#formId").attr("action","infoSpread").submit();
		}else{
			parent.showMess("请填写查询条件");
		}
	}
	
	//保存
	function saveSpread(){
		var spreadId =$("#spreadId").val();
		var bidId =$("#bidId").val();
		var startId =$("#startId").val();
		var endId =$("#endId").val();
		var xyId =$("#xyId").val();
		var selectId=$("#selectId").val();
		var compNameId =$("#compNameId").val();
		var re = /^[0-9]+.?[0-9]*$/;
		var intRe = /^[0-9]+$/;
		if(!re.test(bidId)){
			parent.showMess("请正确填写价格");
			return;
		}
		if(bidId.length>10){
			parent.showMess("请填写9位以内的价格");
			return;
		}
		debugger;
		if(!intRe.test(xyId) || xyId.length>20){
			parent.showMess("请正确填写相应ID");
			return;
		}
		if(selectId=='0'||selectId==null){
			 parent.showMess("请选择类型");
		}else if(compNameId==""||compNameId==null){
		   	 parent.showMess("请填写投放人");
		}else if(spreadId==""||spreadId==null){
			 parent.showMess("请填写关键词");
		}else if(bidId==""||bidId==null){
			 parent.showMess("请出价");
		}else if(startId==""||startId==null){
			 parent.showMess("请填写开始时间");
		}else if(endId==""||endId==null){
			 parent.showMess("请填结束时间");
		}else if(xyId==""||xyId==null){
			 parent.showMess("请填相应ID");
		}else{
			$("#formId").submit();
		}
		
	}
</script>
</body>
</html>
