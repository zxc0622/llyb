<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
<title>后台管理-企业Logo</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v1.css"/>

<style>
.imgshow{width:80px;height:60px;}
    /*上传图片弹出框*/
            .pl_commit_pic{width:300px;}
            .pl_commit_pic .pl_content{padding:15px 0 5px;}
            .select-commit label{margin-right: 30px;color:#666;}
            .select-commit-content{margin:15px 0;padding:0 40px;}
            .net-pic{display: none;}
            .pl_commit_pic .btns{overflow: hidden;}
            .pl_commit_pic .btns a:nth-child(1){float:left;width:100px;height:30px;line-height: 30px;background-color: #5EC520;color:#fff;text-align: center;margin-left: 40px;}
            .pl_commit_pic .btns a:nth-child(2){float:left;width:100px;height:30px;line-height: 30px;background-color: #ccc;color:#666;text-align: center;margin-left: 20px;}

            /*预览图片弹出框*/
            .pl_view_pic{width:500px;}
            .pl_view_pic .pl_content{padding:15px 0 5px;}
            .view_pic_div{width:60%;height:50%;}
/* .tab_main_row .demandSecond{display:none} */
.tab_main_row.xuanzhong{display:block;}
tab_main_result img{width:80px;height:60px;}
.tab_main_result table tr td{text-indent:0px;}
.tab_main_result table th{text-indent:0px;}
.tab_main_row span{content: "";display: block;width: 25px;height: 24px;background: url(../../img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left: 50px;top:95px;}
#searchtext{width:460px;height:35px;float: left;border: 1px solid #5EC520;text-indent: 8px;box-sizing:border-box;}
</style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>后台管理>企业Logo</div>
    <div class="tab_main">
        <div class="tab_title">
            <span onclick="parent.iframeGoToUrl('${ctx}/backmana/enterpriseLogo/allLogo')">企业信息</span>
            
        </div>
        <form action="">
        	<!--行业分类筛选-->
            <div class="tab_main_row">
            	<span class="h_s_middlebefore"></span>
             	<input type="search" id="searchtext" placeholder="请输入关键字"<c:if test="${!empty company_name }"> value="${company_name }"</c:if>/>
              	<a href="javascript:search();"><input type="button" value="搜索" style="background-color:#5cb531; border:1px solid #5cb531; color:white;"/></a>	
            </div>
            
            <!--筛选结果-->
            <div class="tab_main_result">
            	<table id="showtable">
                	<tr>
                        <th style="width:120px">企业Logo</th>
                        <th style="width:160px">公司名称</th>
                        <th style="width:120px">主营业务</th>
                        <th style="width:130px">添加时间</th>
                        <th style="width:60px">管理</th>
                    </tr>
                    <c:forEach items="${companys }" var="record" varStatus="status">
                    		<tr>
                        	<th class="showtable_content">
                        	<input type="hidden" class="company_id" value="${record.id }"/>
                        	
                        	<c:if test="${not empty record.logo_img }">
                        	 <a class="a_1" href="javascript:parent.comPic(${status.index});"><img class="imgshow" alt="等待上传" src=${record.logo_img } ></a>
                        	</c:if>
                        	
                        	<c:if test="${empty record.logo_img }">
                        		 <a class="a_1" href="javascript:parent.comPic(${status.index});"><img class="imgshow" alt="等待上传" src="${ctxStatic}/img/llhb/default.png"  ></a>
                        	</c:if>
                        	</th>
                        		
                        	<td>${record.company_name }</td>
                        		
                        	
	                        <td>${record.major }</td>
                        	
                       		<td>${fn:substring(record.create_date, 0, 10)}</td>
                            <td>
	                         <a class="tr_manage_1" style="position:relative;" onclick="parent.comPic(${status.index})">&nbsp;<h6>修改</h6></a>
                           <%--  <a class="tr_manage_2" style="position:relative;" onclick="deletethis(${record.id});">&nbsp;<h6 >删除</h6></a> --%>
                            </td>
                   	   </tr>
                    </c:forEach> 
                   
                </table>
            </div>
            
            <!--翻页-->
            <div class="filp_box">
            	<div class="del_all">
                </div>
            <c:set var="currentPage" value="${recordPage.pageNumber}" />
			<c:set var="totalPage" value="${recordPage.totalPage}" />
			<c:set var="actionUrl" value="${ctx}/backmana/enterpriseLogo/allLogo/"/>
			<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
			<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
			 <c:set var="urlParas" value="?"/>
			<c:set var="pageSizeParaName" value="pageSizeParaName" />
			
			
	 		<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
            </div>
		</form>
	</div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
	function changeLogo(status){
		var pic1 = $("#showtable .showtable_content").eq(status).find(".a_1 img").attr("src");
		alert(pic1);
	}

	<!--复选框-->
	function SelectAll() {
		 var checkboxs=document.getElementsByName("choose");
		 for (var i=0;i<checkboxs.length;i++) {
		  var e=checkboxs[i];
		  e.checked=!e.checked;
		 }
		 
	}
	function search(){
		var comName = $("#searchtext").val();
		location.href='${ctx}/backmana/enterpriseLogo/allLogo/?company_name='+comName;
	}
	
	<!--管理的修改删除-->
	$("h6").hide();
	$(".tr_manage_1").mouseover(function(){
		$(this).find("h6").show();
	});
	$(".tr_manage_2").mouseover(function(){
		$(this).find("h6").show();
	});
	$(".tr_manage_1").mouseout(function(){
		$("h6").hide();
	 });
	 $(".tr_manage_2").mouseout(function(){
		$("h6").hide();
	 });
    $(function(){
    	//标题样式
    	//$(".m_r_title").removeClass("m_r_title");
    	//$(".m_r_tname").removeClass("m_r_tname");
    	var proper  =parseInt('${order}')+1 ;
    	$(".tab_title").addClass("m_r_title");
    	$(".tab_title span").addClass("m_r_title m_r_tname");
    	var conditon = "";
		var index='#'+$(".demandFirst option:first").val();
		$(index).addClass("xuanzhong");
		var a = '${second1}';
		var b = '${first}';

	}); 

	
    // 上传图片 弹出层方法
    function pl_commit_pic(str){
        $("#hiddenId").val(str);
        $(".pl_commit_pic").show();
        $(".popumask").show();
        $(".select-commit input[type=radio]").unbind('click').on("click",function(){
            $(this).parent().siblings().find("input[type=radio]").removeAttr('checked');
            if($(this).parent().index()==0){
                $(".home-pic").show();
                $(".net-pic").hide();
            }else{
                $(".home-pic").hide();
                $(".net-pic").show();
            }
        });
        $(".btns a:nth-child(2)").unbind().on("click",function(){
            $(".pl_commit_pic").hide();
            $(".popumask").hide();
        });
    }
    function pl_view_pic(){
  	  
  	  $(".pl_view_pic").show();
        $(".popumask").show();
    }


	// 上传图片 弹出层方法
	function addPic(str , n){
		saveLogo(str , n);
		$(".imgshow").eq(n).css("display","block");
		$(".imgshow").eq(n).attr("src",str);
	
		
	}
	//图片预览
	function picSea(n){
		var url=$(".imgshow").eq(n).attr("src");
		parent.picView(url);
	}
	//图片删除
	function picDel(n){
		$(".imgshow").eq(n).attr("src","");
		$(".imgshow").eq(n).css("display","none");
	}
 	
	function saveLogo(str , n){
		var company_id = $("#showtable .showtable_content").eq(n).find(".company_id").val();
		
		$.ajax({
			type : "POST",
			url : "${ctx}/backmana/enterpriseLogo/changeLogo",
			data : "logoUrl="+str+"&company_id=" + company_id,
			dataType : 'text',
			success : function(data) {
				if(data=="success"){
					parent.showMess("修改成功");
	            	
				}else{
					parent.showMess("修改失败!");

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