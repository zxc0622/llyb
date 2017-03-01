<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>论坛管理-禁言用户</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

<style>
.isgreen{color:#5ec520;}

.tab_main .tab_main_row{height:auto;}
.tab_main_result table tr{height: auto;}
.tab_main_result table tr td{padding:3px;}
.sub_banzhu{margin:0 3px;}
.tab_main input[type="text"]{height:28px;width:200px;}
.m_r15{margin-right: 15px;}
.tab_main_row{margin-top: 10px;}
select{height:32px;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>论坛管理>禁言用户</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">禁言用户</span>
        </div>
        <form action="">
            <div id="user_name" class="tab_main_row clearfix">
                <div class="fl m_r15">禁言用户 :</div>
                <input class="fl m_r15" type="text" value="${loginName}" placeholder="输入用户名">
            </div>
            <div id="shutTime" class="tab_main_row clearfix">
                <div class="fl m_r15">禁言时长 :</div>
                <select name="" id="">
                <c:set var="dictList" value="${fns:getDictList('period_type')}"></c:set>
                <c:forEach items="${dictList}" var="dict">
                    <option value="${dict.value}">${dict.label}</option>
                </c:forEach>
                </select>
            </div>
            <div id="remarks" class="tab_main_row clearfix">
                <div class="fl m_r15">禁言理由 :</div>
                <input class="fl m_r15" type="text" placeholder="输入禁言此用户的理由">
                <a href="javascript:void(0)" class="fl btn add_tr">添加至禁言记录</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="m_r15">禁言记录 :</div>
                <table style="width:715px">
                    <tr>
                        <th>禁言用户</th>
                        <th>禁言理由</th>
                        <th>禁言时长</th>
                        <th>操作时间</th>
                        <th>操作用户</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${blacklist}" var="black">
                    <tr>
                        <td ><a href="javascript:void(0)"class="isgreen">${black.user_name}</a></td>
                        <td style="max-width: 350px;">
                            ${black.remarks}
                        </td>
                        <td><c:forEach items="${dictList}" var="dict"><c:if test="${dict.value eq black.shut_period}">${dict.label}</c:if></c:forEach></td>
                        <td>${fn:substring(black.create_date,0,19)}</td>
                        <td>${black.create_name}</td>
                        <td style="width:60px"><a href="javascript:romoveGag(${black.id})"class="isgreen">解除禁言</a></td>
                    </tr>
                    </c:forEach>
                </table>
           <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                </div> -->
            </div>
            
            <!--筛选结果-->
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    $(function(){
        //add_tr
      /*  $(".add_tr").click(function(){
        var val=$(this).prev().val();
        
        if(val&&val!=""){
            var tr=$('<tr><td >'+
                        '<a href="javascript:void(0)"class="isgreen">'+val+
                        '</a></td>'+
                        '<td style="width:40px">'+
                            '<a href="javascript:void(0)"class="isgreen del_tr">删除</a>'+
                    '</td></tr>');
            $(".tab_main_result table").append(tr);
            $(this).prev().val("");
        }
       });
       //del_tr
       $(".tab_main_result table").on("click",".del_tr",function(){
            $(this).parents('tr').remove();
       }); */
       /*====用户校验===*/
    	$("#remarks a").click(function(){
       	 $.ajax({
       		 type:"post",
       		 url:"${ctx}/forum/manage/blacklist/add",
       		 data:"shutPeriod="+$("#shutTime select option:selected").val()+"&loginName="+$("#user_name input").val()+"&remarks="+$("#remarks input").val(),
       		 async:false,
       		 success:function(data){
       			 if(data!=false){
       				 parent.showMessOnlyYes("添加成功");
					 $(".yes-btn", window.parent.document).unbind().on("click",function(){
						 parent.hideMessOnlyYes();
						 goUrl("${ctx}/forum/manage/blacklist"); 
					 }) ;
       			 }else{
       				 parent.showMess("添加失败，该用户不存在");
       			 }
       		 }
       	 });
        });
    });
	function romoveGag(id){
		$.ajax({
			type:"post",
      		url:"${ctx}/forum/manage/blacklist/removeGag",
      		data:"id="+id,
      		async:false,
      		success:function(data){
      			if(data!=false){
      				parent.showMess("解除成功");
      				goUrl("${ctx}/forum/manage/blacklist"); 
      			}
      		}
		});
	}    
               
</script>
</body>
</html>