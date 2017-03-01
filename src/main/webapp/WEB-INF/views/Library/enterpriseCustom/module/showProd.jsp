<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<div id="8" class="Joedar_case sortableDiv">
	<div class="zhe_z10"></div>
	<div class="box-bar10" style="display: none;">
		<!-- <a href="javascript:void(0);" title="设置" class="showbox10">设置</a> -->
		<a href="javascript:void(0);" title="删除" class="remove10">删除</a>
		<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
	</div>
	<h3>产品展示</h3>
	<p class="more"></p>
	<div class="main-pageee">
		<div class="left">
			<div class="nav-back"></div>
			<div class="nav">
				<div class="on"
					style="background: url(${ctxStatic}/img/v2/enterpriseCustom/arrow.jpg) no-repeat; width: 40px; height: 60px; position: absolute; left: right; left: 8px; top: 200px;"></div>
				<div
					style="background: url(${ctxStatic}/img/v2/enterpriseCustom/arrow.jpg) no-repeat; background-position: -40px 0; width: 40px; height: 60px; position: absolute; left: right; right: 0px; top: 200px;"></div>
			</div>
		</div>
		<div class="right">
			<div class="content-back"></div>
			<div class="content">
				<div>
					<ul>
						<c:forEach items="${productList}" var="item" varStatus="sta">
							<li>
								<div>
									<img src="${item.pic1}">
								</div>
									<p>${item.pro_name}</p>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
