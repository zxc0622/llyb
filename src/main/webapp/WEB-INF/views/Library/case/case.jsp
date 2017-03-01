<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<link rel="shortcut icon" href="" />
<title>${companyList.companyname}</title>
<meta name="keywords"
	content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description"
	content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/qiye_style.css" />
<link rel="shortcut icon"
	href="${ctxStatic}/img/llhb/bitbug_favicon.ico" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/manhuaDate.1.0.css" />
<style>
.qy_m_r_d_main .point-list li a {
	width: 500px;
}

.qy_m_r_d_main {
	height: auto;
}

.dis_none {
	display: none;
}

#pastTame {
	
}
/*隐藏页数修改功能*/
.hbshop_disnone {
	display: none;
}

.b_l_f_province {
	color: black;
}

#pastTame,.qy_m_r_d_title span{
	color: black;
	
}
#pastTame{height:10px;}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/Library/share/EnterpriseTop.jsp"%>
	<!-- qy_m_r 中间右侧 -->
	<div class="qy_m_r">
		<div class="qy_m_r_div">
			<div class="qy_m_r_d_title">
				<span style="color:#5Ec520;">成功案例</span>
				<div style="float: right; text-align: center; line-height: 40px;">
					<input id="pastTame" type="text" class="mh_date"
						style="width: 100px; height: 10px;" value="" />&nbsp; <select
						class="b_l_f_province">
						<option value="">全部省份</option>
						<c:forEach var="province" items="${provinceList }">
							<c:choose>
								<c:when test="${oriProId eq province.id}">
									<option value="${province.id}" selected>${province.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${province.id}">${province.name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select> 
					<a class="changediv-a changediv-a-sel" href="javascript:chakan();">查看</a>
				</div>
			</div>
			<div class="qy_m_r_d_main">
				<c:forEach items="${cases}" var="cs">
					<div class="pic-txt-div">
						<c:if test="${not empty cs.pic1 }">
	                        	<a href="${ctx}/Library/case/caseDetail/${cs.id}-${enterpriseId}"
									target="_blank"><img src="${cs.pic1}" alt=""></a>
                        	</c:if>
                        	<c:if test="${empty cs.pic1 && not empty cs.pic2 }">
                                <a href="${ctx}/Library/case/caseDetail/${cs.id}-${enterpriseId}"
									target="_blank"><img src="${cs.pic2}" alt=""></a>
                        	</c:if>
                        	<c:if test="${empty cs.pic1 && empty cs.pic2 && not empty cs.pic3 }">
                                <a href="${ctx}/Library/case/caseDetail/${cs.id}-${enterpriseId}"
									target="_blank"><img src="${cs.pic3}" alt=""></a>
                        	</c:if>
                        	<c:if test="${empty cs.pic1 && empty cs.pic2 && empty cs.pic3 }">
                                <a href="${ctx}/Library/case/caseDetail/${cs.id}-${enterpriseId}"
									target="_blank"><img src="${ctxStatic}/img/llhb/default.png" alt="">
                        		</a>
                        	</c:if>

						<p>${cs.case_name}</p>
						<p>${fn:substring(cs.create_date,0,10)}</p>
					</div>
				</c:forEach>
				<div class="clear">
				</div>
				<div class="fanye font_1 color_1">
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" />
					<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
					<c:set var="currentPage" value="${recordPage.pageNumber}" />
					<c:set var="totalPage" value="${recordPage.totalPage}" />
					<c:set var="actionUrl" value="${ctx}/products/" />
					<%@ include file="/WEB-INF/views/pager/_paginate.jsp"%>

				</div>
			</div>
		</div>
	</div>
	<!-- qy_m_r 中间右侧结束 -->
<%--<%@ include file="/WEB-INF/views/Library/share/EnterpriseDown.jsp"%>--%>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/manhuaDate.1.0.js"></script>
	<script type="text/javascript"
		src="${ctxStatic}/js/llhb/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".case").parent().addClass("header_nav_sel").siblings()
					.removeClass("header_nav_sel");
			$("input.mh_date").manhuaDate({
				Event : "click",//可选				       
				Left : 0,//弹出时间停靠的左边位置
				Top : -16,//弹出时间停靠的顶部边位置
				fuhao : "-",//日期连接符默认为-
				isTime : false,//是否开启时间值默认为false
				beginY : 1949,//年份的开始默认为1949
				endY : 2100
			//年份的结束默认为2049
			});
		});

		//验证时间
		function timeCheck() {
			var pastDate = $(".mh_date").val();
			var t = false;

			var today = new Date();
			var times = pastDate.split('-');
			if (times[0] < today.getFullYear()) {
			} else if (times[0] == today.getFullYear()
					&& times[1] < (today.getMonth() + 1)) {
			} else if (times[0] == today.getFullYear()
					&& times[1] == (today.getMonth() + 1)
					&& times[2] < today.getDate()) {
			} else {
				t = true;
			}

			return t;
		}
		//查看按钮
		function chakan() {
			var date = $(".mh_date").attr("value");
			var prov = $(".b_l_f_province option:selected").val();//省
			var enterpriseId = ${enterpriseId};
			if (date.length > 0 && timeCheck()) {
				parent.showMess("请选择有效日期！");
				return;
			}
			$.ajax({
						type : "POST",
						url : "${ctx}/Library/case/getCaseAjax",
						data : "date=" + date + "&prov=" + prov+"&enterpriseId="+enterpriseId,
						dataType : 'json',
						success : function(data) {
							var html = "";

							$
									.each(
											data,
											function(index, item) {
												var line_num = index + 1;
												var pic = "";
												if (item.pic1 != null) {
													pic = item.pic1;
												} else if (item.pic2 != null) {
													pic = item.pic2;
												} else if (item.pic3 != null) {
													pic = item.pic3;
												}
												html += "<div class=\"pic-txt-div\">"
														+ "<a href=\"${ctx}/Library/case/caseDetail/"
														+ item.id
														+ "\" target=\"_blank\"><img src=\""+pic+"\"></a>"
														+ "<p>"
														+ item.case_name
														+ "</p>"
														+ "<p>"
														+ item.create_date
																.substring(0,
																		10)
														+ "</p>" + "</div>";

											});
							$(".qy_m_r_d_main").html(html);
						},
						error : function(data) {
							parent.showMess("获取失败！");
						}
					});
		}
	</script>
</body>
</html>


