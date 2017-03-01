<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
	<title>数据选择</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		var key, lastValue = "", nodeList = [];
		var tree, setting = {view:{selectedMulti:false,dblClickExpand:false},check:{enable:"${checked}",nocheckInherit:true},
				data:{simpleData:{enable:true}},
				view:{
					addDiyDom: addDiyDom,
					fontCss:function(treeId, treeNode) {
						return (!!treeNode.highlight) ? {"font-weight":"bold"} : {"font-weight":"normal"};
					}
				},
				callback:{
					beforeClick:function(id, node){
						if("${checked}" == "true"){
							tree.checkNode(node, !node.checked, true, true);
							return false;
						}
					}, 

					onDblClick:function(){
						top.$.jBox.getBox().find("button[value='ok']").trigger("click");
					},
					
					onRightClick:onRightClick,
					
					onClick:onClick
				
				}};
		
		$(document).ready(function(){
			$.get("${ctx}${url}${fn:indexOf(url,'?')==-1?'?':'&'}&extId=${extId}&extIdValue=${extIdValue}&module=${module}&t="+new Date().getTime(), function(zNodes){
				// 初始化树结构
				tree = $.fn.zTree.init($("#tree"), setting, zNodes);
				
				// 默认展开一级节点
				var nodes = tree.getNodesByParam("level", 0);
				for(var i=0; i<nodes.length; i++) {
					tree.expandNode(nodes[i], true, false, false);
				}
				// 默认选择节点
				var ids = "${selectIds}".split(",");
				for(var i=0; i<ids.length; i++) {
					var node = tree.getNodeByParam("id", ids[i]);
					if("${checked}" == "true"){
						try{tree.checkNode(node, true, true);}catch(e){}
						tree.selectNode(node, false);
					}else{
						tree.selectNode(node, true);
					}
				}
			});
			key = $("#key");
			key.bind("focus", focusKey).bind("blur", blurKey).bind("change keydown cut input propertychange", searchNode);
		});
		
	  	function focusKey(e) {
			if (key.hasClass("empty")) {
				key.removeClass("empty");
			}
		}
	  	
		function blurKey(e) {
			if (key.get(0).value === "") {
				key.addClass("empty");
			}
			searchNode(e);
		}
		
		function searchNode(e) {
			// 取得输入的关键字的值
			var value = $.trim(key.get(0).value);
			
			// 按名字查询
			var keyType = "name";
			if (key.hasClass("empty")) {
				value = "";
			}
			
			// 如果和上次一次，就退出不查了。
			if (lastValue === value) {
				return;
			}
			
			// 保存最后一次
			lastValue = value;
			
			// 如果要查空字串，就退出不查了。
			if (value === "") {
				return;
			}
			updateNodes(false);
			nodeList = tree.getNodesByParamFuzzy(keyType, value);
			updateNodes(true);
		}
		
		function updateNodes(highlight) {
			for(var i=0, l=nodeList.length; i<l; i++) {
				nodeList[i].highlight = highlight;				
				tree.updateNode(nodeList[i]);
				tree.expandNode(nodeList[i].getParentNode(), true, false, false);
			}
		}
		
		function addDiyDom(treeId, treeNode) {
			$("#" + treeNode.tId +"_span").css('float','left');
			$("#" + treeNode.tId + "_ico").remove('.ztree li span.button');
		};
		
		//点击树节点展开
		function onClick(e,treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			zTree.expandNode(treeNode);
		}
		
		//鼠标右击事件
		function onRightClick(event,treeId,treeNode) {
			//当rightClick 为false时不能右键添加
			if (!$("#rightClick").val()) {
				
			} else {
				var zTree =  $.fn.zTree.getZTreeObj("tree");
				zTree.selectNode(treeNode);
			 	var nodes = zTree.getSelectedNodes();
			 	var id = "";
			 	
			 	if ( nodes.length > 0 ) {
			 		id = nodes[0].id;
			 		
			 		if ( id == 1 ) {
				 		showRMenu('root',event.clientX,event.clientY);
				 	} else {
				 		showRMenu('node',event.clientX,event.clientY);
				 	}
			 	}
			}
		 	
		}
		
		//展示右键列表
		function showRMenu(type,x,y) {
			$("#rMenu ul").show();
			
			if ( type == 'root') {
				$("#m_del").hide();
			} else {
				$("#m_add").show();
				$("#m_del").show();
			} 
			
			var rMenu = document.getElementById("rMenu");
			rMenu.style.top=y+"px";
			rMenu.style.left=x+"px";
			rMenu.style.visibility = 'visible';
			
			$("body").bind("mousedown",onBodyMouseDown);
		}
		
		function onBodyMouseDown(event) {
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				var rMenu = document.getElementById("rMenu");
				rMenu.style.visibility = 'hidden';
			}
		}
		
		
	</script>
		<style type="text/css">
		div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
		div#rMenu ul li{
			margin: 1px 0;
			padding: 0 5px;
			cursor: pointer;
			list-style: none outside none;
			background-color: #DFDFDF;
		}
	</style>
</head>
<body>
	<input type="hidden" id="type" value="${type}">
	<label class="control-label" style="margin-top:-4px;margin-left:21px;width:100%;">
		<c:if test="${rightClick == true}">备&nbsp;&nbsp;&nbsp;注：可右键快捷添加分类</c:if>
	</label>
	<input type="hidden" id="rightClick" value="${rightClick}"/>
	<div id="search" class="control-group ">
		<label for="key" class="control-label" style="float:left;padding-left:20px;">关键字：</label>
		<input type="text" class="empty" id="key" name="key" maxlength="50" style="width:150px;float:left;">
	</div>
	<div style="clear:both;"></div>
	<div class="content_wrap" style=" height: 255px; overflow: auto; width: 280px;">
		<div class="zTreeDemoBackground" style="text-align: left; width: 250px;">
			<div id="tree" class="ztree" style="padding:5px 15px 20px 5px;"></div>
		</div>
	</div>
</body>