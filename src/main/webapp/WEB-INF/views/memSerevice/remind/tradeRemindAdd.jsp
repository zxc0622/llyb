<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>交易提醒</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>

        <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}
            select { border: 1px solid #c9caca;color: #666666;height: 34px;text-indent: 3px;width: 103px;}
            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 20px;margin-bottom: 200px;overflow: hidden;}
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row>label{width:120px;float:left;text-align: right;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 20px;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;margin-right: 5px;}
            .tab_main .tab_main_row .row_right input[type=radio]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}
            .tab_main .tab_main_row .row_right input[type=text]{border:1px solid #cccccc;text-indent:10px;width:380px;float:left;font-size: 12px;}
            .tab_main .tab_main_row .row_right img{display:block;float:left;width:20px;height:20px;margin-left: 5px;margin-right: 5px;margin-top:5px;}
            .tab_main .tab_main_row .row_right span{color: #666666;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}
            .tab_main .tab_main_row .row_right select{width:150px;margin-right: 5px;}

            .tab_main .tab_main_row .row_right textarea{border:1px solid #cccccc;text-indent:10px;width:480px;float:left;height: 200px;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{border:1px solid #cccccc;margin-right: 4px;opacity: 1;vertical-align: middle;}
            .tab_main .tab_main_row .row_right span{vertical-align: middle;}
            .tab_main .tab_main_row2{height: 30px;line-height: 30px;margin-top: 20px;border:1px solid red;}
            .tab_main .tab_main_row2>label{width:100px;float:left;text-align: left;margin-left:15px;border:1px solid yellow;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title .change{position: absolute;top:0;right:0;z-index: 5;background-color: #fff;padding:0 ;display: none;}
            .m_r_title .change a{margin-right: 10px;padding:0 5px;}
            .m_r_title .change a:hover{color:#ee7800;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            .receive_table{width:763px;border:0px;margin-bottom: 10px;overflow: hidden;}
            .receive_head{width:90%;margin-left: 5%;margin-top:20px;border-bottom: 0px solid #E5E5E5;}
            .head_span_1{line-height: 25px;}
            .receive_td_1 input[type=checkbox]{vertical-align: middle;}
            .receive_td_1 label{vertical-align: middle;}
            .receive_td_2 span{vertical-align: middle;}
            .receive_td_3 span{vertical-align: middle;}
            .receive_content{width:90%;margin-left:5%;border:1px solid #E5E5E5;padding:0 0;}
            .receive_content .content_head{width:100%;margin-top:0px;border: 0px solid #E5E5E5;line-height: 45px;color: white;background-color: #5CB531;}
            .receive_content .content_head span{margin-left:4%;}
            .receive_content .content{width:92%;margin-top:10px;line-height: 25px;color: #333333;background-color: white;margin-left:4%;}
            .receive_content .content span{}
            .content_tip{width:92%;margin-top:10px;line-height: 20px;color: #333333;background-color: #FFFDEE;margin-left:4%;border:1px solid #F7AB00;padding:10px;margin-bottom: 20px;}
            .content_tip span{display:block;margin-left: 10px;}
            .receive_operation{width:90%;margin-left: 5%;margin-top:20px;height:30px;border: 0px;line-height: 30px;color: #8A8A8A;}

            /*提示样式*/
            .tip_span{display:block;float:left;font-size:12px;line-height: 30px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(../images/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(../images/wrong.png) 0 0 no-repeat;position: absolute;top:10px;left:-15px;}

            .session_name label{line-height: 25px;}
            .session_confirm_btn{display:block;float:left;margin-left: 20px;color: white;background-color: #5EC520;width:100px;text-align: center;border:1px solid #5EC520;}
            .session_cancel_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #E5E5E5;width:100px;text-align: center;border:1px solid #E5E5E5;}


        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>交易提醒>添加贸易</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span class="m_r_tname">添加贸易</span>
                        <span onclick="goUrl('${ctx}/memSerevice/remind/pass')">已通过</span>
                        <span onclick="goUrl('${ctx}/memSerevice/remind/audit')">审核中</span>
                    </div>

                    <form action="">
                    	<input id="remindCount" type="hidden" value="${remindCount}"/>
                        <div class="tab_main_row">
                            <label for=""><span>*</span>请选择商机类型</label>
                            <div class="row_right" id="type_business">
                                <input type="radio" value="1" id="r1" name="type1"  checked="checked"  /><label for="r1">供应</label>
                                <input type="radio" value="2" id="r2" name="type1" /><label for="r2">求购</label>
                               <!--  <input type="radio" value="3" id="r3" name="type1" /><label for="r3">竞价</label> -->
                            </div>
                        </div>
                        <div class="tab_main_row">
                            <label for="">关键词</label>
                            <div class="row_right">
                                <input type="text" name="" id="keyWords" placeholder="添加后可精确搜索，添加多个关键词请用一个空格隔开"/>
                            </div>
                        </div>
                        <div class="tab_main_row" style="height:200px;">
                            <label for="">行业分类</label>
                            <div class="row_right">
                                <select name="" id="typeFirst" onChange="" size="10" style="height:200px;">
                                <c:forEach items="${typeList}" var="type">
                                	<option value="${type.id}">${type.name }</option>
                                </c:forEach>
                                </select>
                                <select name="" id="typeSecond" onChange="" size="10" style="height:200px;">
                                </select>
                            </div>
                        </div>
                        <div class="tab_main_row" >
                            <label for="">所在地区</label>
                            <div class="row_right">
                                <select id="province">
                                <option value="">请选择</option>
                                <c:forEach items="${provList}" var="prov">
                                	<option value="${prov.id}">${prov.name}</option>
                                </c:forEach>
                             </select>
                                <select id="city">
                                     <option value=''>请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="tab_main_row" >
                            <label for="">发送频率</label>
                            <div class="row_right">
                                <select id="frequency">
                                <c:forEach items="${freqList}" var="freq">
                                	<option value="${freq.value}">${freq.label}</option>
                                </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="tab_main_row" style="height: 35px;">
                            <label for="">&nbsp;</label>
                            <div class="row_right" style="border:0px solid red;">
                                <a href="javascript:submit()" class="session_confirm_btn" style="margin-left:0px;" >确认</a>
                                <a href="javascript:clearAll()" class="session_cancel_btn">重置</a>
                            </div>
                        </div>
                    </form>
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
                //按钮鼠标滑过效果
                $(".row_right a").mouseover(function(){
                    $(this).css("backgroundColor","#5EC520");
                    $(this).css("color","white");
                });
                //按钮鼠标划出之后
                $(".row_right a").mouseout(function(){
                    $(this).css("backgroundColor","#E5E5E5");
                    $(this).css("color","#666666");
                })
            });
            $(document).ready(function(){
            	getTypeSecond();
            });
            //默认类型二
            var strTypeSecond="";
            function getTypeSecond(){
            	var value = $("#typeFirst option").eq(0).val();
            	$.ajax({
            		type:"post",
            		url:"${ctx}/memSerevice/remind/selectTypeAdd",
            		data:"parentId="+value,
            		success:function(data){
            			$.each(data,function(index,item){
            				strTypeSecond += "<option value='"+item.id+"'>"+item.name+"</option>"
						});
						$("#typeSecond").html(strTypeSecond);
            		}
            	}) 
            }
            //获取的类型二
			$("#typeFirst").on("click","option",function(){
				var value = $("#typeFirst option:selected").val();
				if(value!=""){
					var str = "";
					$.ajax({
						type:"post",
						url:"${ctx}/memSerevice/remind/selectTypeAdd",
						data:"parentId="+value,
						success:function(data){
							$.each(data,function(index,item){
								str += "<option value='"+item.id+"'>"+item.name+"</option>"
							});
							$("#typeSecond").html(str);
						}
					})
				}
			});
			
			//获取市级
			$("#province").on("change",function(){
				var value = $("#province option:selected").val();
				if(value!=""){
					var str = "";
					$.ajax({
						type:"post",
						url:"${ctx}/memSerevice/remind/selectCityAdd",
						data:"provId="+value,
						success:function(data){
							$.each(data,function(index,item){
								str += "<option value='"+item.id+"'>"+item.name+"</option>"
							});
							$("#city").html(str);
						}
					})
				}else{
					$("#city").html("<option value=''>请选择</option>");
				}
			});
			function submit(){
            	var checkedValue = $("#type_business input:checked").val();
            	var typeFirst = $("#typeFirst option:selected").val();
            	if(typeFirst==undefined){
            		typeFirst=""
            	}
            	var typeSecond = $("#typeSecond option:selected").val();
            	if(typeSecond==undefined){
            		typeSecond=""
            	}
            	var provId = $("#province option:selected").val();
            	var cityId = $("#city option:selected").val();
            	var frequency = $("#frequency option:selected").val();
            	if($("#remindCount").val()<3){
            		if(checkedValue!=null && checkedValue!=""){
                		$.ajax({
                			type:"post",
                			url:"${ctx}/memSerevice/remind/addRemind",
                			data:"type="+checkedValue+"&keyWords="+$("#keyWords").val()+"&typeFirst="+typeFirst
                				+"&typeSecond="+typeSecond+"&provId="+provId+"&cityId="+cityId+"&frequency="+frequency,
                			success:function(data){
                				if(data==true){
                					goUrl('${ctx}/memSerevice/remind/audit');
                				}
                			},
                			error:function(){
                				$(".pl_yes",parent.document).show().find("p").html("添加失败！请检查网络");
        	         		   	$(".popumask",parent.document).show();
        	         		   	$(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
        	         		   		$(".pl_yes",parent.document).hide();
        	         		   		$(".popumask",parent.document).hide();
        	         		   	});
                			}
                		})
                	}
            	}else{
            		$(".pl_yes",parent.document).show().find("p").html("添加失败!<br>您添加的条数已达到最大值！");
          		   	$(".popumask",parent.document).show();
          		    $(".pl_yes",parent.document).find(".yes-btn").unbind().click(function(){
          		    	$(".pl_yes",parent.document).hide();
       			   		$(".popumask",parent.document).hide();
       		   		});
            	}
            }
            //重置
            function clearAll(){
            	$("#type_business").find("input").removeAttr("checked").eq(0).prop("checked",true);
            	$("#keyWords").val("");
            	$("#typeFirst option").prop("selected",false);
            	$("#typeSecond").html(strTypeSecond);//类型二恢复到默认值
            	$("#province option").eq(0).prop("selected",true);
            	$("#city").html("<option value=''>请选择</option>");
            	$("#frequency option").eq(0).prop("selected",true); 
            }
        </script>
    </body>
</html>