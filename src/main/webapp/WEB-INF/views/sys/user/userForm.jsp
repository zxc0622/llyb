<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>账号管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery("#inputForm").validationEngine({
                onValidationComplete: function (form, valid) {
                    if (valid == true) {
                        $("#inputForm").unbind();
                        form.submit();
                        loading('正在提交，请稍等...');
                    }
                }
            });
        });

        function formsubmit(formId) {
            var list = $('input:radio[name="user.onState"]:checked').val();
            if (list == null) {
                top.$.jBox.tip("请选择使用状态");
                return false;
            }

            var typeOne = $("#typeOne").val();
            if (typeOne != 3) {
                var type = $("#type").val();
                if (type == null || type == "") {
                    top.$.jBox.tip("请选择用户类型");
                    return false;
                }
                var schoolId = $("#schoolId").val();
                /*if(schoolId == null || schoolId == "" ) {
                 top.$.jBox.tip("请选择机构");
                 return false;
                 }*/
            }
            $('#' + formId).submit();
        }
    </script>
</head>
<body>
<form id="inputForm" action="${ctx}/sys/user/save" method="post">
    <input id="userId" type="hidden" name="user.id" value="${user.id}"/>
    <input id="typeOne" type="hidden" value="${user.type}"/>
    ${token}
    <div class="me_content_right">
        <div class="me_four_pop_right fl">

            <div class="me_secondary_nav">
                <span>系统管理</span>
                <span style="margin-left:2px;">></span>
                <a href="${ctx}/sys/user">账号列表</a>
                <span style="margin-left:2px;">></span>
                <span>${not empty user.id?'修改':'新增'}</span>
            </div>


            <div class="col-lg-5 mt20">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">姓名：</span>
                    <input type="text" name="user.name" value="${user.name}" maxlength="10"
                           data-validation-engine="validate[required,maxSize[10]] text-input"
                           class="form-control br_5 width_b90"/>
                    <span class="span_xing">*</span>
                </div>
            </div>
            <div class="col-lg-5 mt20">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">账号：</span>
                    <input id="loginName" type="text" name="user.loginName" maxlength="30" onblur="funcChina();"
                           value="${user.loginName}"
                           data-validation-engine="validate[required,minSize[4],maxSize[20],ajax[ajaxLoginNameCall]] text-input"
                           class="form-control br_5 width_b90"/>
                    <span class="span_xing">*</span>
                </div>
            </div>
            <div class="col-lg-5 mt20">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">密码：</span>
                    <input id="newPassword" name="newPassword" type="password" value="${newPassword}" maxlength="20"
                           data-validation-engine="validate[${empty user.id?'required,':''}minSize[6],maxSize[20]] text-input"
                           class="form-control br_5 width_b90"/>
                    ${empty user.id?'<span class="span_xing">*</span>':''}
                </div>
            </div>
            <div class="col-lg-5 mt20">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">确认密码：</span>
                    <input id="confirmNewPassword" name="confirmNewPassword" maxlength="30" type="password"
                           value="${newPassword}" data-validation-engine="validate[equals[newPassword]]"
                           class="form-control br_5 width_b90"/>
                    ${empty user.id?'<span class="span_xing">*</span>':''}
                </div>
            </div>
         <%--   <c:if test="${user.type != 3}">--%>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">用户类型：</span>
                        <select id="type" name="user.type" onchange="tex();">
                            <option value="">请选择用户类型</option>
                            <c:forEach items="${fns:getDictList('user_type')}" var="dict">
                               <%-- <c:if test="${dict.value != 3 }">--%>
                                    <option value="${dict.value }"
                                            <c:if test="${dict.value == user.type}">selected</c:if>>${dict.label}</option>
                               <%-- </c:if>--%>
                            </c:forEach>
                        </select>
                        <span class="span_xing">*</span>
                    </div>
                </div>
           <%-- </c:if>--%>
            <div class="col-lg-5 mt20 me_a_checkbox">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">使用状态：</span>
                    <c:forEach items="${fns:getDictList('user_state')}" var="user_state">
                        <input class="fl me_a_radio" data-validation-engine="validate[required]" type="radio"
                               name="user.onState" value="${user_state.value}"
                               <c:if test="${user_state.value == user.onState}">checked="checked"</c:if>/>
                        <span class="fl pl5 pr5">&nbsp;${user_state.label}&nbsp;&nbsp;</span>
                    </c:forEach>
                    <span class="span_xing">*</span>
                </div>
            </div>
            <div class="col-lg-12 mt20 me_a_checkbox">
                <div class="input-group">
                    <span class="input-group-addon me_search_span">角色管理：</span>
                    <c:forEach items="${userRoles}" var="roleItem">
                        <input class="fl me_a_radio" data-validation-engine="validate[minCheckbox[1],maxCheckbox[]]"
                               type="checkbox" name="roleIdList" value="${roleItem.id }"
                               <c:forEach items="${roleList}" var="roleList">
                               <c:if test="${roleList.id==roleItem.id}">checked</c:if>
                        </c:forEach>>
                        <span class="fl pl5 pr5">&nbsp;${roleItem.name}&nbsp;&nbsp;</span>
                    </c:forEach>
                    <span class="span_xing">*</span>
                </div>
            </div>
           <%-- <c:if test="${user.type != 3}">--%>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">机构：</span>
                        <input type="hidden" id="organizationId" name="organizationId"
                               value="${user.person.organizationId}">
                        <select name="person.organizationId" id="schoolId" onchange="show();">
                            <option value="">请选择机构</option>
                            <c:forEach items="${organizationList}" var="organization">
                                <option
                                        <c:if test="${organization.id == user.person.organizationId}">selected="selected"</c:if>
                                        value="${organization.id}">${organization.name}</option>
                            </c:forEach>
                        </select>
                        <span class="span_xing"></span>
                    </div>
                </div>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">部门：</span>
                        <tags:treeselect id="department" extIdValue="organizationId" name="person.departmentId"
                                         value="${user.person.departmentId}" labelName="parent.name"
                                         labelValue="${user.person.department.name}"
                                         title="部门" url="/sys/user/treeData" allowClear="false"
                                         cssClass="form-control br_5 width_b90" extId="${department.id}"/>
                        <span class="span_xing"></span>
                    </div>
                </div>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">手机号：</span>
                        <input type="text" name="person.phone" id="phone" value="${user.person.phone}" maxlength="11"
                               data-validation-engine="validate[required,maxSize[11],minSize[11],custom[number]]"
                               class="form-control br_5 width_b90"/>
                        <span class="span_xing">*</span>
                    </div>
                </div>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">邮箱：</span>
                        <input type="text" name="person.email" id="email" value="${user.person.email}" maxlength="30"
                               data-validation-engine="validate[maxSize[25],custom[email]]"
                               class="form-control br_5 width_b90"/>
                    </div>
                </div>
                <div class="col-lg-5 mt20">
                    <div class="input-group">
                        <span class="input-group-addon me_search_span">备注：</span>
                        <input type="text" name="person.remarks" value="${user.person.remarks}" maxlength="50"
                               class="form-control br_5 width_b90"/>
                    </div>
                </div>
            <%--</c:if>--%>
            <div class="cb"></div>
            <div class="me_qd_qx mt70">
                <input type="button" onclick="javascript:formsubmit('inputForm');" class="me_button_two mr20"
                       value="确定">
             <%--   <c:if test="${user.type == 3 }">
                    <input type="button" onclick="location.href='${ctx}/sys/user/student'" class="me_button_three"
                           id="me_four_pop_colse" class="me_button_two mr20" value="取消">
                </c:if>--%>
             <%--   <c:if test="${user.type != 3 }">--%>
                    <input type="button" onclick="location.href='${ctx}/sys/user'" class="me_button_three"
                           id="me_four_pop_colse" class="me_button_two mr20" value="取消">
             <%--   </c:if>--%>
            </div>
        </div>

    </div>

</form>

<script type="text/javascript">


    function tex() {
        var type = $('#type').val();
        $('#schoolId').select2("val", "");
        $('#department').val("");
        $('#departmentName').val("");
        $("#schoolId").empty();
        $("<option value=''>请选择机构</option>").appendTo("#schoolId");
        $.post("${ctx}/sys/user/getOrganizationtype", {type: type}, function (data) {
            var organization = eval(data);
            for (var i = 0; i < organization.length; i++) {
                $("<option value='" + organization[i].id + "'>" + organization[i].name + "</option>").appendTo("#schoolId");
            }
        });
    }

    function show() {
        var schoolId = $('#schoolId').val();
        $('#department').val("");
        $('#departmentName').val("");
        if (schoolId != null && schoolId != "") {
            $('#organizationId').val(schoolId);
        }
    }

</script>


</body>

</html>