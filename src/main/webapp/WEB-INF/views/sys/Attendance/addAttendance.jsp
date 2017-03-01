<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default"/>
</head>
<body>	
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
       
        <input type="hidden" id="classId"  value="${classId}" />
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">考勤日期：</span>
            	<input type="text" id="attendanceDate" name="attendanceDate" value="${date}" maxlength="30" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" class="form-control br_5 width_b90" />
            	<span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">选择节次：</span>
            	 <select name="lesson" id="lesson" > 
                <option value="">请选择节次</option>
                <option value="1">第一节</option>
                <option value="2">第二节</option>
                <option value="3">第三节</option>
                <option value="4">第四节</option>
                <option value="5">第五节</option>
                <option value="6">第六节</option>
                <option value="7">第七节</option>
                <option value="8">第八节</option>
                <option value="9">第九节</option>
                <option value="10">第十节</option>
                </select>
            	<span class="span_xing">*</span>
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">考勤状态：</span>
             	<select id="state" name="state">
                    <option value="">请选择考勤状态</option>
                    <c:forEach items="${fns:getDictList('attendance_state')}" var="dict">
						<option value="${dict.value }">${dict.label}</option>
					</c:forEach>
            	</select>
            </div>
        </div>
         <div class="col-lg-3 mt20">
	                    <div class="input-group">
	                        <span class="input-group-addon me_search_span">备注：</span>
	                        <input   type="text" id="remarks" maxlength="30" value=""   class="form-control br_5" />
	                    </div>
	                </div>
        <div class="cb"></div>
    </div>
	</div>
</body>
</html>