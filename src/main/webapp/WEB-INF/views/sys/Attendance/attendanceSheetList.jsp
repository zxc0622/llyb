<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>班级管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
    	return false;
    }
	
	//变更状态
	function addsheet(classid){
		var claid = classid;
		var submit = function (v, h, f) {
			if (v == 1) {
				var attendanceDate = h.find("iframe")[0].contentWindow.document.getElementById("attendanceDate").value;
				var lesson = h.find("iframe")[0].contentWindow.document.getElementById("lesson").value;
				var state = h.find("iframe")[0].contentWindow.document.getElementById("state").value;
				var remarks = h.find("iframe")[0].contentWindow.document.getElementById("remarks").value;
				var classId = h.find("iframe")[0].contentWindow.document.getElementById("classId").value;
				if (attendanceDate == null || attendanceDate == '') {
					top.$.jBox.tip("请选择考勤时间！", 'error');
				    return false;
				}
				if (lesson == null || lesson == '') {
					top.$.jBox.tip("请选择节次！", 'error');
				    return false;
				}
				if (state == null || state == '') {
					top.$.jBox.tip("请选择考勤状态！", 'error');
				    return false;
				}
				var rem = encodeURI(remarks);
				alert(rem);
				window.location.href="${ctx}/sys/Attendance/save?classId="+classId+"&rem="+rem+"&attendanceDate="+attendanceDate+"&lesson="+lesson+"&state="+state;
			}
			return true;
		};		
			top.$.jBox("iframe:${ctx}/sys/Attendance/into?classid="+claid, { title: "添加考勤",width:550,height:400,buttons: {'确定': 1, '取消':0},submit: submit});
	}
	
	
	//变更学员单个状态
	function changestate(aa,sheetid){
		var classId = $('#classid').val();
		var sheid = sheetid;
		var submit = function (v, h, f) {
			if (v == 1) {
				var state = h.find("iframe")[0].contentWindow.document.getElementById("state").value;
				var remarks = h.find("iframe")[0].contentWindow.document.getElementById("remarks").value;
				var sheetId = h.find("iframe")[0].contentWindow.document.getElementById("sheetId").value;
				var objs = h.find("iframe")[0].contentWindow.document.getElementsByName('lesson');
				 var i=0;
				 var str="";
				    for(i = 0 ; i < objs.length ;  i ++){
				    	  if(objs[i].checked == true){
				    		 if(str == ""){
				    			 str+=objs[i].value;
				    		 }else{
				    			 str+=","+objs[i].value;
				    		 }     
				          }
				    }
				    if (str == "" || str == null) {
				    	top.$.jBox.tip("请选择节次！", 'error');
					    return false;
				    }
				if (state == null || state == '') {
					top.$.jBox.tip("请选择考勤状态！", 'error');
				    return false;
				}
				var rem = encodeURI(remarks);
				confirmx('确认要修改该学员考勤吗？', "${ctx}/sys/Attendance/oneStudent?sheetId="+sheetId+"&rem="+rem+"&lesson="+str+"&state="+state+"&classId="+classId);
			}
			return true;
		};		
			top.$.jBox("iframe:${ctx}/sys/Attendance/intochange?id="+sheid, { title: "修改考勤",width:550,height:400,buttons: {'确定': 1, '取消':0},submit: submit});
	}
	
	</script>
</head>
<body>
          <div class="me_content_right">
        <div class="me_content_start">
        	<div class="me_secondary_nav">
            	<span>基础设置</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/classinfo">班级管理</a>
                <span style="margin-left:2px;">></span>
                <span>考勤管理</span>
            </div>
            <form id="searchForm"  action="${ctx}/sys/Attendance?classId=${classId}" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
				<input id="classid" name="classid" type="hidden" value="${classId}"/>
            	<div class="me_search_eurozone mb55">
            	<div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
            	<div class="rwo">
            	<div class="col-lg-3">
			            <div class="input-group">
			                <span class="input-group-addon me_search_span">姓名：</span>
			            	<input type="text" id="name" name="name" value="${page.map.name}" maxlength="10" class="form-control br_5 width_b90" />
			            </div>
        			</div>
	                 <div class="col-lg-3">
			            <div class="input-group">
			                <span class="input-group-addon me_search_span">考勤日期：</span>
			            	<input type="text" id="attendanceDate" name="attendanceDate" value="${page.map.attendanceDate}" maxlength="30" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" class="form-control br_5 width_b90" />
			            </div>
        			</div>
	                <div class="col-lg-3">
			            <div class="input-group">
			                <span class="input-group-addon me_search_span">选择星期：</span>
			            	 <select name="lesson" id="lesson" > 
			                <option value="" <c:if test="${ ''  == page.map.lesson}">selected</c:if> >请选择星期</option>
			                <option value="星期一" <c:if test="${ '星期一' == page.map.lesson}">selected</c:if>>星期一</option>
			                <option value="星期二" <c:if test="${ '星期二'  == page.map.lesson}">selected</c:if>>星期二</option>
			                <option value="星期三" <c:if test="${ '星期三'  == page.map.lesson}">selected</c:if>>星期三</option>
			                <option value="星期四" <c:if test="${ '星期四'  == page.map.lesson}">selected</c:if>>星期四</option>
			                <option value="星期五" <c:if test="${ '星期五'  == page.map.lesson}">selected</c:if>>星期五</option>
			                <option value="星期六" <c:if test="${ '星期六'  == page.map.lesson}">selected</c:if>>星期六</option>
			                <option value="星期日" <c:if test="${ '星期日'  == page.map.lesson}">selected</c:if>>星期日</option>
			                </select>
			            </div>
        			</div>
        			 
        			<button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
	                <div class="cb"></div>
                </div>
            </div>
             <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
            	<div class="fl font_size_14 me_liebiao">班级列表：</div>
                <div class="fr">
                <shiro:hasPermission name="sys:class:edit">
               		<input type="button" onclick="addsheet(${classId})" class="me_button_two mr5" id="me_four_pop_click" value="+&nbsp;添加考勤">
                </shiro:hasPermission>
                </div>
               
                <div class="cb"></div>
            </div>
            <div class="table_one">
            <table width="100%" >
                       <tr>
                           <th>学员姓名</th>
                       	   <th>班级</th>
                       	   <th>日期</th>
                       	   <th>星期</th>
                       	   <th>一节课</th>
                       	   <th>二节课</th>
                       	   <th>三节课</th>
                       	   <th>四节课</th>
                       	   <th>五节课</th>
                       	   <th>六节课</th>
                       	   <th>七节课</th>
                       	   <th>八节课</th>
                       	   <th>九节课</th>
                       	   <th>十节课</th>
                       	   <th>操作</th>
                       </tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="15" align="center">暂无考勤信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}">   
                       <c:forEach items="${page.list}" var="attendanceSheet">
						<tr>
                            <td>${attendanceSheet.studentClass.student.name}</td>
                            <td>${attendanceSheet.studentClass.classInfo.name}</td>
                            <td>${attendanceSheet.attendanceDate}</td>
                            <td>${attendanceSheet.weekNo}</td>
                            <td>${fns:getDictLabel(attendanceSheet.oneLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.twoLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.threeLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.fourLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.fiveLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.sixLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.sevenLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.eightLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.nineLesson,'attendance_state', '暂无')}</td>
                            <td>${fns:getDictLabel(attendanceSheet.tenLesson,'attendance_state', '暂无')}</td>
							<shiro:hasPermission name="sys:class:edit">
							<td class="color_00bfb0">
			    				<a title="修改" class="mr20 cp" onclick="changestate(this,${attendanceSheet.id})">修改学员考勤</a>
								<a title="考勤详情" class=" cp" href="${ctx}/sys/Attendance/details?id=${classInfo.id}&organizationId=${classInfo.organizationId}">考勤详情</a>
							</td>
							</shiro:hasPermission>
						</tr>
					</c:forEach>
				</c:if>
          </table>
            </div>
            </form>
        </div>
        <div class="dede_pages">${page}</div>
    </div>	
</body>
</html>
