<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>角色管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
        function formSubmit() {
            $("#searchForm").submit();
        }
    </script>
</head>
<body>

<div class="me_content_right">
    <div class="me_content_start">
        <div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/role">角色列表</a>
        </div>

        <form id="searchForm" action="" method="post">
            <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
            <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
            <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>

            <div class="me_search_eurozone mb55">
                <div class="pl15 font_size_14" style="padding-top:12px;">查询筛选</div>
                <div class="row">
                    <div class="row mt15 mb15">
                        <div class="col-lg-3">
                            <div class="input-group">
                                <span class="input-group-addon me_search_span">角色名称：</span>
                                <input name="name" type="text" maxlength="5" value="${page.map.name}" placeholder="角色名称"
                                       class="form-control br_5"/>
                            </div>
                        </div>
                        <button onclick="formSubmit()" class="me_button_two mt3 ml105">查询</button>
                        <div class="cb"></div>
                    </div>
                </div>
            </div>

            <tags:message content="${message}"/>
            <div class="me_search_crisis_all mb10">
                <div class="fl font_size_14 me_liebiao">角色列表：</div>
                <div class="fr">
                    <shiro:hasPermission name="sys:role:edit">
                        <input type="button" onclick="location.href='${ctx}/sys/role/form'" class="me_button_two mr5"
                               id="me_four_pop_click" value="+&nbsp;新增角色">
                    </shiro:hasPermission>
                </div>
                <div class="cb"></div>
            </div>
            <div class="table_one">
                <table width="100%">
                    <tr>
                        <th>角色名称</th>
                        <th>描述</th>
                        <th>机构</th>
                        <th>部门</th>
                        <shiro:hasPermission name="sys:role:edit">
                            <th>操作</th>
                        </shiro:hasPermission>
                    </tr>

                    <c:if test="${page.count == 0}">
                        <tr>
                            <td colspan="5" align="center">暂无角色信息</td>
                        </tr>
                    </c:if>
                    <c:if test="${page.count > 0}">
                        <c:forEach items="${page.list}" var="role">
                            <tr>
                                <td>${role.name}</td>
                                <td>${role.roleType}</td>
                                <td>${role.organization.name}</td>
                                <td>${role.department.name}</td>
                                <shiro:hasPermission name="sys:role:edit">
                                    <td class="color_00bfb0">
                                        <a title="修改" class="mr20 cp" href="${ctx}/sys/role/form?id=${role.id}">修改</a>
                                        <a title="删除" class="cp" href="${ctx}/sys/role/delete?id=${role.id}"
                                           onclick="return confirmx('确认要删除该角色吗？', this.href)">删除</a>
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
