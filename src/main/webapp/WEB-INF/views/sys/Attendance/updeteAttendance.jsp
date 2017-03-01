<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default"/>
</head>
<body>	
	<div class="me_content_right">
    <div class="me_four_pop_right fl">
        <input type="hidden" id="sheetId"  value="${sheetId}" />
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">选择节次：</span>
            	<input type="checkbox" id="lesson" name="lesson" value="1"/>&nbsp;第一节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="2"/>&nbsp;第二节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="3"/>&nbsp;第三节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="4"/>&nbsp;第四节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="5"/>&nbsp;第五节&nbsp;&nbsp;
            	<div class="cb"></div>
            	<input type="checkbox" id="lesson" name="lesson" value="6"/>&nbsp;第六节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="7"/>&nbsp;第七节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="8"/>&nbsp;第八节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="9"/>&nbsp;第九节&nbsp;&nbsp;
            	<input type="checkbox" id="lesson" name="lesson" value="10"/>&nbsp;第十节&nbsp;&nbsp;
            	*
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