<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>班级管理</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="me_content_right">
       <div class="me_four_pop_right fl">
    	  <div class="me_secondary_nav">
            <span>基础设置</span>
            <span style="margin-left:2px;">></span>
            <a href="${ctx}/sys/classinfo">班级管理</a>
            <span style="margin-left:2px;">></span>
            <span>班级详细信息</span>
         </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">所属机构：</span>
                <span class="me_search_span">	${classInfo.organization.name}	</span>		
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">年级：</span>
                <span class="me_search_span">	${classInfo.grade}级	</span>	
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">报到时间：</span>
                <span class="me_search_span"> <fmt:formatDate value="${classInfo.reportTime}" pattern="yyyy-MM-dd"/></span>	
            </div>
        </div>
         <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">培训截止时间：</span>
                <span class="me_search_span"> <fmt:formatDate value="${classInfo.trainTime}" pattern="yyyy-MM-dd"/></span>	
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">班级编号：</span>
                <span class="me_search_span">	${classInfo.code}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">班级名称：</span>
                <span class="me_search_span">	${classInfo.name}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">负责人：</span>
                <span class="me_search_span">	${classInfo.principal}	</span>
            </div>
        </div>
        <div class="col-lg-5 mt20">
            <div class="input-group">
                <span class="input-group-addon me_search_span">备注：</span>
                <span class="me_search_span">	${classInfo.remarks}	</span>
            </div>
        </div>
         <div class="cb"></div>
        <div class="me_search_crisis_all mb10 mt30">
            <div class="fl font_size_14 me_liebiao">应收总金额：<fmt:formatNumber value="${accountsAll+allAccountsTotal}" type="currency" pattern="#,##0.00"/>元 &nbsp;&nbsp;&nbsp; 实收总金额：<fmt:formatNumber value="${paymentAll+receivedAll}" type="currency" pattern="#,##0.00"/>元 &nbsp;&nbsp;&nbsp; 欠缴总金额：<fmt:formatNumber value="${(accountsAll+allAccountsTotal)-(paymentAll+receivedAll)}" type="currency" pattern="#,##0.00"/>元</div>
            <div class="cb"></div>
        </div>
        <div class="cb"></div>
        <div class="me_search_crisis_all mb10 mt30">
            <div class="fl font_size_14 me_liebiao">已完成收费学员列表：</div>
            <div class="cb"></div>
        </div>
        <div class="table_one">
            <table width="100%" >
                       <tr><th>姓名</th><th>应收金额（元）</th><th>实收金额（元）</th></tr>
                        <c:if test="${studentclassfinish.size() == 0}">
							<tr>
								<td colspan="6" align="center">暂无已完成收费学员信息</td>
							</tr>
						</c:if>
					<c:if test="${studentclassfinish.size() > 0}"> 
					  
                       <c:forEach items="${studentclassfinish}" var="scf">
                       <tr>
							<td>${scf.student.name}</td>
                            <td><fmt:formatNumber value="${classInfo.payment}" type="currency" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${scf.payment}" type="currency" pattern="#,##0.00"/></td>
                        </tr>   
						</c:forEach>
						
				</c:if>
            </table>
        </div>
        
        <div class="me_search_crisis_all mb10 mt30">
            	<div class="fl font_size_14 me_liebiao">未完成收费学员列表：</div>
                <div class="cb"></div>
            </div>
        	<div class="table_one">
            <table width="100%" >
                       <tr>
                       		<th>姓名</th>
                       		<th>应收金额（元）</th>
                       		<th>实收金额（元）</th>
                       		<th>欠缴金额（元）</th>
                       	</tr>
                        <c:if test="${studentclass.size() == 0}">
							<tr>
								<td colspan="6" align="center">暂无未完成收费学员信息</td>
							</tr>
						</c:if>
					<c:if test="${studentclass.size() > 0}"> 
					  
                       <c:forEach items="${studentclass}" var="sc">
                       <tr>
							<td>${sc.student.name}</td>
                            <td><fmt:formatNumber value="${classInfo.payment}" type="currency" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${sc.payment}" type="currency" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${classInfo.payment-sc.payment}" type="currency" pattern="#,##0.00"/></td>
                        </tr>   
						</c:forEach>
				</c:if>
          </table>
            </div>    
        	
        <div class="me_search_crisis_all mb10 mt30">
            	<div class="fl font_size_14 me_liebiao">收费项目：</div>
                <div class="cb"></div>
            </div>
         <div class="table_one">
            <table width="100%" >
                       <tr><th>收费项目</th><th>金额（元）</th></tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无收费项目信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}"> 
					  
                       <c:forEach items="${page.list}" var="paymenttemplate">
                       <tr>
							<c:forEach items="${fns:getDictList('charg_type')}" var="dict">
								<c:if test="${dict.value == paymenttemplate.chargeItemId}" >
									<td>${dict.label}</td>
								</c:if>
							</c:forEach>
                            <td>${paymenttemplate.paidAmount}</td>
                         </tr>   
						</c:forEach>
					
				</c:if>
          </table>
            </div> 
            
         <div class="me_search_crisis_all mb10 mt30">
            	<div class="fl font_size_14 me_liebiao">班级教师：</div>
                <div class="cb"></div>
            </div>
         <div class="table_one">
            <table width="100%" >
                       <tr><th>教师名称</th><th>备注</th></tr>
                        <c:if test="${page.count == 0}">
							<tr>
								<td colspan="6" align="center">暂无班级教师信息</td>
							</tr>
						</c:if>
					<c:if test="${page.count > 0}"> 
					  
                       <c:forEach items="${teacher}" var="teacher">
                       <tr>
							<c:forEach items="${user}" var="user">
								<c:if test="${user.id == teacher.userid}" >
									<td>${user.name}</td>
								</c:if>
							</c:forEach>
                            <td>${teacher.remark}</td>
                           </tr>
						</c:forEach>
					
				</c:if>
          </table>
            </div>    
              
        <div class="me_qd_qx mt70">
	        <input type="button" onclick="location.href='${ctx}/sys/classinfo'" class="me_button_two mr20" value="返回">
        </div>
    </div>
	</div>
</body>

</html>