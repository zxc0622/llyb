<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<div id="9" class="Joedar_aptitude ui-sortable-handle sortableDiv">
	<div class="zhe_z11"></div>
	<div class="box-bar11" style="display:none;">
		<!-- <a href="javascript:void(0);" title="设置" class="showbox11">设置</a> -->
		<a href="javascript:void(0);" title="删除" class="remove11">删除</a>
		<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
	</div>
	<h3>企业资质</h3>
	<p class="more"></p>
	<div class="main-pageeee">
		<div class="left">
			<div class="nav-back"></div>
			<div class="nav">
				<div class="on"
					style="background: url(${ctxStatic}/img/v2/enterpriseCustom/arrow.jpg) no-repeat; width: 40px; height: 60px; position: absolute; left: 8px; top: 182px;"></div>
				<div
					style="background: url(${ctxStatic}/img/v2/enterpriseCustom/arrow.jpg) no-repeat; background-position: -40px 0; width: 40px; height: 60px; position: absolute; right: 0px; top: 182px;"></div>

			</div>
		</div>
		<div class="right">
			<div class="content-back"></div>
			<div class="content">
				<div>
					<ul>
						<c:forEach items="${cerList}" var="item" varStatus="sta">
							<li>
								<div>
									<img src="${item.cer_pic}">
								</div>
								<p>${item.info_title}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>