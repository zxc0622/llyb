<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
	<div class="Joedar_evaluate">
		<div class="zhe_z7"></div>
		<div class="box-bar7" style="display: none;">
			<a href="javascript:void(0);" title="设置" class="showbox7">设置</a> <a
				href="javascript:void(0);" title="删除" class="remove7">删除</a>
				<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
		</div>
		<div class="box7" style="display: none;">
			<h2>
				服务类型<a class="close"></a>
			</h2>
			<div class="mainlist">

				<ul class="serviceType">
					 <c:forEach items="${allSType}" var="item" varStatus="sta">
					 	<li typeId="${item.id}">${item.name}</li>
					 </c:forEach>
				</ul>
				<div style="width: 530px; padding: 20px 0 0 20px;">

					<div class="ensure">
						<a id="box7_sure"><span class="submitServiceType">确定</span></a>
						<a id="box7_cancel" class="close"><span class="abolish">取消</span></a>
					</div>

				</div>
			</div>
		</div>
		<div id="box7_utypes" style="float:left;height: 500px; width: 210px; background: url(${ctxStatic}/img/v2/enterpriseCustom/left_green.jpg) no-repeat;">
			 <c:forEach items="${items}" var="item" varStatus="sta">
			 	<div class="flip" typeId="${item.itemId}">${item.itemName}</div>
			 </c:forEach>
		</div>

		<div class="right">
			<div class="content-back"></div>
			<div class="content">
				<div>
					<ul>
						<li>
							<div style="display: table-cell;text-align: center;vertical-align: middle;width: 476px;height: 500px;">
								<img style="max-width:476px;max-height:500px;" id="serTypeImg" src="${firstType.pic1}" alt="" data="" />
							</div>
						</li>
					</ul>
					<div style="width: 514px; height: 500px; float: right;">
						<h4 style="width: 512px; height: 40px; background-color: #146000; color: #fff; text-align: center; line-height: 40px; margin-bottom: 20px;" id="serTypeTitle">${firstType.case_name}</h4>
						<style type="text/css">
						.table thead tr {
							display: block;
						}
						
						.table tbody {
							display: block;
							height: 400px;
							overflow: auto;
							margin-left: 26px;
						}
						
						.table td {
							width: 460px;
							font-size: 14px;
							line-height: 30px;
							font-family: "微软雅黑";
						}
						.service_type{background:url(${ctxStatic}/img/v2/enterpriseCustom/true.png) right top no-repeat;}
						#serTypeDesc img{max-width:460px;}
						</style>
						<table class="table">
							<tbody>
								<tr>
									<td id="serTypeDesc"><div style="width:460px;word-break: break-all;">${firstType.case_desc}</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>