<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>论坛后台-版主编辑</title>
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
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>版主编辑</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">版主编辑</span>
        </div>
        <form action="">
            <div class="tab_main_row clearfix">
                <div class="fl">板块名称 :<span class="isgreen">${board.board_name}</span></div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">添加版主 :</div>
                <input class="fl m_r15" type="text" placeholder="输入用户名">
                <a href="javascript:void(0)" class="fl btn add_tr">添加</a>
            </div>
            <!--筛选结果-->
            <div class="tab_main_result">
                <table>
                    <tr>
                        <th>版主用户名</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${masterList}" var="master">
                    <tr>
                        <td ><a href="javascript:void(0)"class="isgreen">${master.login_name}</a></td>
                        <td style="width:40px"><a href="javascript:delMaster(${master.id})"class="isgreen del_tr">删除</a></td>
                    </tr>
                    </c:forEach>
                    <!-- <tr>
                        <td ><a href="javascript:void(0)"class="isgreen">yyhb001</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen del_tr">删除</a></td>
                    </tr>
                    <tr>
                        <td ><a href="javascript:void(0)"class="isgreen">yyhb001</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen del_tr">删除</a></td>
                    </tr>
                    <tr>
                        <td ><a href="javascript:void(0)"class="isgreen">yyhb001</a></td>
                        <td style="width:40px"><a href="javascript:void(0)"class="isgreen del_tr">删除</a></td>
                    </tr> -->
                </table>
            </div>
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
       /*==添加版主==*/
       $(".tab_main_row a").click(function(){
    	 var loginName = $(this).parent().find("input").val(); 
    	 $.ajax({
    		 type:"post",
    		 url:"${ctx}/forum/board/masterAdd",
    		 data:"boardId=${boardId}"+"&loginName="+loginName,
    		 async:false,
    		 success:function(data){
    			 if(data!=false){
    				 if(data!="no"){
    					 parent.showMessOnlyYes("添加成功");
    					 $(".yes-btn", window.parent.document).unbind().on("click",function(){
    						 parent.hideMessOnlyYes();
    						 goUrl("${ctx}/forum/board/editor?boardId=${boardId}"); 
    					 });
    				 }else{
    					 parent.showMess("添加失败，该用户已是本版块版主");
    				 }
    			 }else{
    				 parent.showMess("添加失败，该用户不存在");
    			 }
    		 }
    	 });
       });
    });
    function delMaster(id){
    	$.ajax({
   		 type:"post",
   		 url:"${ctx}/forum/board/delete",
   		 data:"id="+id,
   		 async:false,
   		 success:function(data){
   			 if(data!=false){
   				goUrl("${ctx}/forum/board/editor?boardId=${boardId}"); 
   			 }else{
   				 parent.showMess("删除失败");
   			 }
   		 }
   	 });
    }
             
</script>
</body>
</html>