<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/layui/css/layui.css" />
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
</head>
<body>
	<form method="post" class="layui-form" action="${ctx }/sys/sysUpdate/save"
		style="margin: 50px;">
		<div class="layui-form-item">
			<label class="layui-form-label">操作人员:</label>
			<div class="layui-input-block">
				<input type="text" name="name" required lay-verify="required"
					placeholder="你是谁？" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
	    	<label class="layui-form-label">更新记录:</label>
	    	<div class="layui-input-block">
				<textarea name="mark" placeholder="详细描述更新内容" class="layui-textarea"></textarea>
	    	</div>
  		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">操作代码:</label>
			<div class="layui-input-block">
				<input type="text" name="code" required lay-verify="required"
					placeholder="输入操作代码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submintRecord">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script>
		layui.use('form', function() {
			var form = layui.form();
			form.on('submit(submintRecord)', function(data) {
				return true;
			});
		});
	</script>
</body>
</html>
