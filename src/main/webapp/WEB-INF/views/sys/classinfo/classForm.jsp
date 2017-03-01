<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>班级管理</title>
<meta name="decorator" content="default"/>
<script type="text/javascript">

	$(document).ready(function() {
		jQuery("#inputForm").validationEngine({
			onValidationComplete : function(form, valid) {
				if (valid == true) {
				$("#inputForm").unbind();
				form.submit();
				loading('正在提交，请稍等...');
				}
			}
		});		
	});
	
	function formsubmit(formId) {
		var organizationId =  $('#organizationId').val();
		if(organizationId == null || organizationId ==''){
			top.$.jBox.tip("请选择所属机构");
			return false;
		}
		var chargitemid = document.getElementsByName('chargitemid');
		//判断收费模板中是否填写收费项目
		for(var i = 0; i < chargitemid.length; i++) {
			 var id = chargitemid[i].value;
			 if(id == null || id == '') {
				 top.$.jBox.tip("添加的收费项目金额不能为空，请检查");
				return false;
			 }
		 }
		$('#' + formId).submit();
	}
	
	
	//删除收费
	function delPayment(o,id) {
		
		var classInfoId = $("#classInfoId").val();
		if (classInfoId != null) {
			$.post("${ctx}/sys/classinfo/decide",{classInfoId:classInfoId},function(data){
				var state = eval(data);
				var classId = id;
				if(classId != null ){
					if(state == false){
						top.$.jBox.tip("班级模板已经收费，不能删除");
						return false;
					}else{
						var t = document.getElementById('payment');
						t.deleteRow(o.parentNode.parentNode.rowIndex);
					}
				}else{
					var t = document.getElementById('payment');
					t.deleteRow(o.parentNode.parentNode.rowIndex);
				}
    	  });
		}else{
		var t = document.getElementById('payment');
		t.deleteRow(o.parentNode.parentNode.rowIndex);
			}
		}
	//删除老师
	function delTeacher(o) {
		var t = document.getElementById('teacher');
		t.deleteRow(o.parentNode.parentNode.rowIndex);
	}
	
	//添加收费
	function addpaymentfrom() {
		var chargeItemId = document.getElementsByName('chargeItemId');
		var classid = document.getElementsByName('classInfo.id');
		var submit = function (v, h, f) {
			if (v == 1) {
				var message = '';
				var selecteditem = h.find("iframe")[0].contentWindow.document.getElementsByName('selecteditem');
				for(var i = 0; i < selecteditem.length; i++) {
				var flag = 0;
				if(selecteditem[i].checked){
						for(var j =0;j<chargeItemId.length;j++) {
							if(selecteditem[i].value == chargeItemId[j].value){
								flag ++;
								message = "您选择的收费项目，已在列表当中存在的不能添加";
							}
						}
						if (flag == 0 ) {
							var item = selecteditem[i].value;
							var	selectHtml = "";
							<c:forEach items="${fns:getDictList('charg_type')}" var="dict"> 
								if(${dict.value} == item ){
									selectHtml += "${dict.label}";
								}
							</c:forEach>
							$("#payment").append(
						"<tr><td><input type=\"hidden\" name=\"paymentTemplateId\" value=\"\"><input type=\"hidden\" id=\"chargeItemId\" name=\"chargeItemId\" value=\""+selecteditem[i].value+"\">"+
						selectHtml+"</td>"+
						"<td><input type=\"text\" class=\"form-control br_5 width_40\" data-validation-engine=\" validate[required,custom[number]]\" name=\"startfh\"  maxlength=\"10\"/></td>"+
						"<td><input class=\"me_button_two mr5\" type=\"button\" value=\"删除\" onclick=\"delPayment(this)\"></td></tr>"
							);
						}
					
					 }
				}
				if (message != '') {
					top.$.jBox.tip(message,"success");
				}
			}
			
			return true;
		};		
				
		top.$.jBox("iframe:${ctx}/sys/classinfo/addpaymentForm", { title: "收费模板",width:450,height:300,buttons: {'确定': 1, '取消':0},submit: submit});
	}
	
	//添加老师
	function addteacherfrom() {
		var userid = document.getElementsByName('userid');
		var submit = function (v, h, f) {
			if (v == 1) {
				var message = '';
				var selecteditem = h.find("iframe")[0].contentWindow.document.getElementsByName('selecteditem');
				
				for(var i = 0; i < selecteditem.length; i++) {
					var flag = 0;
					if(selecteditem[i].checked){
							for(var j =0;j<userid.length;j++) {
								if(selecteditem[i].value == userid[j].value){
									flag ++;
									message = "您选择的班级教师，已在列表当中存在的不能添加";
								}
							}
							if (flag == 0 ) {
								var item = selecteditem[i].value;
								var	teacherHtml = "";
									<c:forEach items="${user}" var="user">
                   				if(${user.id} == item){
                   					teacherHtml +="${user.name}";
                   				}
                   					</c:forEach>
								
								$("#teacher").append(
										"<tr><td><input type=\"hidden\" name=\"classTeacherId\" value=\"\"><input type=\"hidden\" name=\"userid\" id=\"userid\" value=\""+selecteditem[i].value+"\">"+
										teacherHtml+"</td>"+
										"<td><input type=\"text\" class=\"form-control br_5 width_40\" data-validation-engine=\" value=\"\" name=\"remark\"  maxlength=\"20\"/></td>"+
										"<td><input class=\"me_button_two mr5\" type=\"button\" value=\"删除\" onclick=\"delTeacher(this)\"></td></tr>"
								);
							}
						 }
					}
				if (message != '') {
					top.$.jBox.tip(message,"success");
				}
				
			}
			return true;
		};
					
		top.$.jBox("iframe:${ctx}/sys/classinfo/addteacherfrom", { title: "班级教师模板",width:600,height:500,buttons: {'确定': 1, '取消':0},submit: submit});
	
	}
	
	function endTime(obj,time){
		//判断未选择报到时间，就添加培训截止时间判断
		var startime = $('#starttime').val();
		if (startime == '') {
			top.$.jBox.tip("请选择报到时间");
			obj.value='';
			return false;
		} else {
			//判断培训截止时间是否小于当前时间，小于后提示
			if (time < startime) {
				top.$.jBox.tip("培训截止时间不能小于报到时间");
				obj.value='';
				return false;
			}
		}
	}
	
	function statrTime(obj,time){
		
		var endTime = $('#endtime').val();
		if(endTime < time) {
			 $('#endtime').val("");
			 return false;
		}
	}
	
</script>
</head>
<body>
	<form id="inputForm" action="${ctx}/sys/classinfo/save" method="post">
	<input id="classInfoId" type="hidden" name="classInfo.id" value="${classInfo.id}" />
		${token}
	<div class="me_content_right">
    <div class="me_content_start">
    	
    	<div class="me_secondary_nav">
            <span>基础设置</span>
            
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/classinfo">班级管理</a>
            <span style="margin-left:2px;">></span>
            <span>${not empty classInfo.id?'修改':'新增'}</span>
        </div>
        <div class="col-lg-12 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">所属机构：</span>
                <select id="organizationId" name="classInfo.organizationId">
                <option value="">请选择所属机构</option>
                  <c:forEach items="${organizationList}" var="organization">
                     <option  value="${organization.id}" <c:if test="${organization.id==classInfo.organizationId}"> selected="selected"</c:if> >${organization.name}</option>
                  </c:forEach>
                </select>
                <span class="span_xing">*&nbsp;此处机构信息只显示机构类型为青软实训的机构信息</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">年级：</span>
                <input type="text" name="classInfo.grade" onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" <c:if test="${classInfo.grade == null}">value="${date}"</c:if> value="${classInfo.grade}"  maxlength="4"  data-validation-engine="validate[required,custom[integer]]" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">班级编号：</span>
                <input type="text" id="classInfoCode" name="classInfo.code" value="${classInfo.code}" maxlength="15" data-validation-engine="validate[required,ajax[ajaxClassInfoCodeCall]]" class="form-control br_5 width_b90"/>
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">班级名称：</span>
                <input type="text" id="classInfoName" name="classInfo.name" value="${classInfo.name}" maxlength="15" data-validation-engine="validate[required,maxSize[30],ajax[ajaxClassInfoNameCall]]" class="form-control br_5 width_b90" />
                <span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">报到时间：</span>
                <input type="text" id="starttime" name="classInfo.reportTime" value="<fmt:formatDate value="${classInfo.reportTime}" pattern="yyyy-MM-dd"/>" pattern="yyyy-MM-dd" placeholder="请点击选择日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,onpicked:function(){statrTime(this,this.value)}});"
                  class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">培训截止时间：</span>
                <input type="text" id="endtime" name="classInfo.trainTime" value="<fmt:formatDate value="${classInfo.trainTime}" pattern="yyyy-MM-dd"/>" pattern="yyyy-MM-dd" placeholder="请点击选择日期" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,onpicked:function(){endTime(this,this.value)}});"
                  class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <input type="text" name="classInfo.principal" value="${classInfo.principal}" maxlength="15" class="form-control br_5 width_b90" data-validation-engine="validate[required]" />
            	<span class="span_xing">*</span>
            </div>
        </div>
        <div class="col-lg-5 mt20 mb30">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注信息：</span>
                <input type="text" name="classInfo.remarks" value="${classInfo.remarks}" maxlength="30" class="form-control br_5 width_b90" />
            </div>
        </div>
        <div class="cb"></div>
        <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">收费项目：</div>
                <div class="fr">
               		<input type="button" onclick="addpaymentfrom()" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增收费">
                </div>
                <div class="cb"></div>
            </div>
        <div class="table_one">
            <table id="payment" width="100%" >
                       <tr>
                       	<th>收费项目</th>
                       	<th>金额（元/人）</th>
                       	<th>操作</th>
                       </tr>
                       <c:forEach items="${paymentTemplateList}" var="paymentTemplateList">
                        <tr>
                       	<td>
                       	<input type="hidden" name="paymentTemplateId" id ="paymentTemplateId" value="${paymentTemplateList.id}" />
                        <input type="hidden" id="chargeItemId" name="chargeItemId" value="${paymentTemplateList.chargeItemId}">
	                      <c:forEach items="${fns:getDictList('charg_type')}" var="dict">
									
								<c:if test="${paymentTemplateList.chargeItemId == dict.value}" > 
									${dict.label}
								</c:if>
					      </c:forEach>
                       	</td>
                       	<td>
                       		<input type="text" value ="${paymentTemplateList.paidAmount}"  class="form-control br_5 width_40" data-validation-engine=" validate[required,custom[number]]" name="startfh"  maxlength="10"/>	
                       	</td>
                       	<td>
                       		<input class="me_button_two mr5" type="button" value="删除" onclick="delPayment(this,${classInfo.id})">
                       	</td>
                       	 </tr>
                       </c:forEach>
                      
          </table>
            </div>
            
        <div class="cb"></div>
        <div class="me_search_crisis_all mb10 mt30 ">
            	<div class="fl font_size_14 me_liebiao">班级教师：</div>
                <div class="fr">
               		<input type="button" onclick="addteacherfrom()" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;新增班级教师">
                </div>
             <div class="cb"></div>
           </div>
          <div class="table_one">
            <table id="teacher" width="100%" >
                       <tr>
                       	<th>班级教师</th>
                       	<th>备注</th>
                       	<th>操作</th>
                       </tr>
                      
                       <c:forEach items="${classTeacherList}" var="classTeacherList">
                       
                       <tr>
                       
                       <td>
                       <input type="hidden" name="classTeacherId" value="${classTeacherList.id }">
                       	<c:forEach items="${user}" var="user">
                       		<input type="hidden" name="userid" id="userid" value="${classTeacherList.userid }">
                       		<c:if test="${classTeacherList.userid == user.id}" > 
											${user.name}
							</c:if>
                       			
                       			</c:forEach>
                       	</td>		
                       	<td>
                       		<input type="text" class="form-control br_5 width_40" name="remark" value="${classTeacherList.remark}"  maxlength="20"/>
                       	</td>
                       	<td>
                       		<input class="me_button_two mr5" type="button" value="删除" onclick="delTeacher(this)">
                       	</td>
                       	</tr>
                       	</c:forEach>
                       							
          </table>
            </div> 
            
        <div class="cb"></div>
        <div class="cb"></div>
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20" value="确定">
	        <input type="button" onclick="location.href='${ctx}/sys/classinfo'" class="me_button_three" id="me_four_pop_colse" class="me_button_two mr20" value="取消">
        </div>
    </div>

	</div>
	</form>
</body>

</html>