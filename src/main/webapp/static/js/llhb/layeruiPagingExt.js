//	分页控件及其回调函数
//	callback为触发分页后的回调，函数返回三个参数：
//	divElSelector 分页元素对象。
//	obj是一个object类型。包括了分页的所有配置信息。
//	first一个Boolean类，检测页面是否初始加载。非常有用，可避免无限刷新。
//	color 组件颜色。
//	在需要引入的位置添加 div,例如 <div class="paging"></div>
function paging(divElSelector, totalPage, pageNumber, callback, color) {
	try {
		var checkLayui=layui.laypage;
	} catch (err) {
		alert("没引入layui插件!");
		return;
	}
	color=color==undefined?"default":color;
	layui.use([ 'laypage', 'layer' ], function() {
		var laypage = layui.laypage, layer = layui.layer;
		laypage({
			cont : divElSelector,
			pages : totalPage,
			curr : pageNumber,
			skip : true,
			skin : color,
			pages: totalPage,
		    first: 1,
		    last: totalPage,
			jump : function(obj, first) {
				if (typeof callback === "function") {
					callback(divElSelector, obj, first);
				}
			}
		});
	});
}
