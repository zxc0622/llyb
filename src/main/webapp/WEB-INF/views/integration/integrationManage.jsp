<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>积分兑换商品后台-积分兑换商品管理</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        
        
        <style type="text/css">
			.btn{width:120px;line-height:30px;height:30px;text-align: center;color:#fff;background-color: #5cb531;display: inline-block;margin-right: 5px;padding-top: 1px;}
            .btn1{width:50px;line-height:30px;height:30px;text-align: center;color:#fff;background-color: #5cb531;display: inline-block;margin-right: 5px;padding-top: 1px;}
            .normal_btn{margin-right:5px;width:120px;line-height:30px;height:30px;text-align: center;color:#666666;display: inline-block;border:1px solid #cccccc;}
            .normal_btn1{margin-right:5px;width:50px;line-height:30px;height:30px;text-align: center;color:#666666;display: inline-block;border:1px solid #cccccc;}
            .normal_btn_1{margin-left:5px;width:90px;line-height:30px;height:30px;text-align: center;color:#fff;display: inline-block;border:1px solid #5ec520; background-color:#5ec520; float:right;}
            .normal_btn_2{margin-right:5px;width:80px;line-height:30px;height:30px;text-align: center;color:#fff;display: inline-block;border:1px solid #5ec520; background-color:#5ec520;}
            .tab_main{border:1px solid #ccc;padding:15px 10px 30px;position: relative;}
            .zxgl_table{margin-top: 15px;width:100%;}
            .zxgl_table tr{border-bottom: 1px dashed #ccc;}
            .zxgl_table th,.zxgl_table td{padding:5px 0;text-align: center;}
            .zxgl_table th{background-color: #efefef;}
            .zxgl_table td a{color:#5EC520;}

            /*input样式*/
            input[type=text]{height:30px;border:1px solid #cccccc;text-indent:10px;width:100px;vertical-align:middle;}
            input[type=text]:focus{height:30px;border:1px solid #ee7800;}
            .tab_main input[type=text],.tab_main input[type=password]{border:1px solid #ccc; height:32px;text-indent: 5px;}
            .tab_main input[type=text]:focus,.tab_main input[type=password]:focus{border:1px solid #ee7800;}
            .tab_main input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center;cursor: pointer;}
            select{height: 30px;border: 1px solid rgb(204, 204, 204);width: 100px;}
            /*表格内容字号*/
            table tr td{font-size:12px;}

            /*展示图片*/
            .per_pic_div{position:relative;width:120px;height:125px;border:1px solid #ccc;float:left;}
            .per_pic_div>img{width:100%;display: block;height:100px;text-algin:center;line-height:100px;}
            .check_sel_pic{display: none;position: absolute;top:0;left:0;width:100%;height:100px;background: rgba(0,0,0,.7) url(../../img/llhb/check_sel_pic.png) center center no-repeat;background-size: 100% 100%;}
            .per_pic_div .check_del_div{height:25px;background-color: #efefef;}

            .per_pic_div .check_del_div a{font-size: 12px;float:right;color:#5EC520;margin-top: 3px;margin-right: 5px;}
            .per_pic_div > p{height:25px;padding:0 5px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
            .for_sel_del{overflow: hidden;background-color: #efefef;height:25px;}

            .for_sel_del a{font-size: 12px;float:right;color:#5EC520;margin-top: 3px;margin-right: 5px;}

            /*删除选中、翻页*/
            .filp_box{overflow:hidden; margin-top:30px;}
            .filp_box .del_all{float:left; margin-right:260px;}
            .filp_box .filp{float:left;}
        </style>
        
    </head>
    <body>
    <form action="delIntegration"  method="post" id="formId">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>积分兑换商品维护>积分兑换商品管理</div>
                <div class="tab_main">
                    <div>
                        <a href="${ctx}/integration/IntegrationWH"class="btn new_tr">新增</a>
                        <a href="javascript:void(0)"class="normal_btn check_all">全选</a>
                        <a href="javascript:deleteMore()"class="normal_btn delete_tr">删除</a>
	                  <%--    <select name="selectName" id="offhead" onchange="seachLb()" style="height:32px;width:122px;">
	                        <option value="0">请选择</option>
	                        <c:forEach var="dictList" items="${dictList }">
	                       	 <c:if test="${dictList.parentId!=0 }">
	                       	   <option value="${dictList.id}">${dictList.name}</option>
	                       	 </c:if>
	                        </c:forEach> 
	                    </select> --%>
                    </div>
                    <div >
                        <table class="zxgl_table">
                            <tr>
                                <th>选择</th>
                                <th>编号</th>
                                <th>商品名称</th>
                                <th>所需积分</th>
                                <th>数量</th>
                                <th>限购数量</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${integrationList}" var="info" varStatus="status">
                            <tr id="index${info.id}">
                                <td style="width:45px">
                                    <input type="checkbox" name="choose" value="${info.id}">
                                </td>
                                <td style="width:45px">${status.index+1}</td>
                                <td style="width:250px;"class="tmui-ellipsis">${info.proName}</td>
                                <td style="width:120px;">${info.points}</td>
                                <td style="width:172px">${info.num}</td>
                                <td style="width:172px">${info.limitNum}</td>
                                <td style="width:100px;">${info.createDate}</td>
                                <td style="width:92px;">
                                    <a href="#" onclick="update(${info.id})">修改</a>
                                    <a href="#" onclick="deleteOne(${info.id})">删除</a>
                                </td>
                            </tr>
                            </c:forEach>  
                        </table>
                    </div>
                     
                        
                        
                    <!--翻页-->
                    
                    <div class="filp_box">
                        <div class="filp">
                        
						     <c:set var="currentPage" value="${recordPage.pageNumber}" />
							<c:set var="totalPage" value="${recordPage.totalPage}" />
							<c:set var="actionUrl" value="${ctx}/integration/IntegrationList/"/>
							<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
							<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
                            <c:set var="pageSizeParaName" value="pageSize" />
                            <c:set var="urlParas" value="?" />
							<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>
                        </div>
                    </div> 
                </div>
            </div>
            <!-- 右侧结束 -->
        </form>
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                //点击全选
                $(".check_all").click(function(){
                    var on=true;
                    $(".zxgl_table input[type=checkbox]").each(function(){
                        if(!$(this).prop("checked")){
                            return on=false;
                         }
                    });
                    if(on){
                        $(".zxgl_table input[type=checkbox]").prop("checked",false);
                    }else{
                        $(".zxgl_table input[type=checkbox]").prop("checked",true);
                    }
                });
                
                var str ='${selectName}';
            	$("select").find("option[value='"+str+"']").attr("selected",true);
            });
        	//删除多项
        	function deleteMore(){
        		$("#formId").submit();
        	}
        	//删除单项
        	function deleteOne(obj){
        		$.ajax({
            		type : "POST",
            		url : "${ctx}/integration/delInte",
            		dataType : "json",
            		async : false,
            		data : "id=" + obj + "",
            		success : function(data) {
            			if(data==0){
            				$("#index"+obj).remove();
            			}
            			
            		}
            	}); 
        	}
        	//修改
        	function update(obj){
        		location.href="${ctx}/integration/IntegrationWH?id="+obj;
        	}
        </script>
    </body>
</html>