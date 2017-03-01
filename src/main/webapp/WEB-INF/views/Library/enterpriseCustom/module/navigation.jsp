<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<style>
.activeItem{width: 120px; height: 44px; display: block; position: absolute; font-size: 16px; color: #fff; line-height: 44px;background-color:${activeItemColor}}
</style>
<script>
	var activeItemColor='${activeItemColor}';//被选中的菜单项的背景颜色
	var negativeWordColor='${negativeWordColor}';//未被选中的文字颜色
	var secondUrlParaType='${secondUrlParaType}';
	var activeNav='#${activeNav}';//活动导航栏
</script>
<div class="joedar_nav navigation_bar" style="background-color:${navigationColor}">
	<ul class="navigationUl">
		<c:forEach items="${navigation}" var="item" varStatus="sta">
			<c:choose>
				<c:when test="${sta.index==0&&empty secondUrlParaType}">
					<li id="${item.getStr('link')}${edit}" style="display:${item.getBoolean('show_flag')?'block':'none'}">
						<a class="navdown ${item.getBoolean('show_flag')?'show':'noShow'}" id="id${item.getInt('id')}" href="javascript:void(0);">${item.getStr('item')}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li id="${item.getStr('link')}${edit}" style="display:${item.getBoolean('show_flag')?'block':'none'}"><a style="${item.getBoolean('show_flag')?'':'display:none'};color:${negativeWordColor};" class="navdown ${item.getBoolean('show_flag')?'show':'noShow'}" id="id${item.getInt('id')}" href="javascript:void(0);">${item.getStr('item')}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<div class="zhe_z" style="display: none;"></div>
	<div class="box-bar2" style="display: none;";="">
		<a href="javascript:void(0);" title="设置" class="showbox2">设置</a>
		<!-- <a href="javascript:void(0);" title="删除" class="remove2">删除</a> -->
		<a href="javascript:void(0);" title="添加" class="addModule"  style="width:80px">添加模块</a>
	</div>
	<div class="box2" style="display: none;">
		<h2>
			<a class="close"></a>
		</h2>
		<div class="mainlist">
			<!-- <h3>导航设置</h3> -->
			<div class="index1 head" style="border-bottom: 1px solid #dfdfdf;">
				<ul class="page_one">
					<li class="page_name">页面名称</li>
					<li>操作</li>
					<li>位置排序</li>
					<li>是否显示</li>
				</ul>
			</div>
			<p style="font-size: 11px;text-indent: 4em;color: #b5a9a9;">（页面名称最多输入5个字）</p>
			<p style="width: 190px;float:left; margin: 0 auto; margin-top: 20px;text-indent: 4em;">
				修改导航栏<strong>背景</strong>颜色
				<a href="javascript:void(0)" style="background-color:${navigationColor}" id="img"></a>
			</p>
			<p style="float:left;margin-top:20px;text-indent: 4em;">
				修改导航栏<strong>选中</strong>颜色
				<a href="javascript:void(0)" id="selectedcolor" style="width:25px;height:25px;background-color:${activeItemColor};display:block;margin-top:10px;margin-left: 100px;border:1px solid #ccc;"></a>
			</p>
			<p style="float:left;margin-top:20px;text-indent: 4em;">
				修改导航栏<strong>文字</strong>颜色
				<a href="javascript:void(0)" id="wordColor" style="width:25px;height:25px;background-color:${negativeWordColor};display:block;margin-top:10px;margin-left: 100px;border:1px solid #ccc;"></a>
			</p>

			<div style="width: 530px; padding: 20px 0 0 20px;">
				<div class="ensure">
					<a class="submitNavigation" href="javascript:void(0);"><span>确定</span> </a> 
					<a class="abolish close" href="javascript:void(0);"><span>取消</span></a>
				</div>
			</div>
		</div>
	</div>
</div>