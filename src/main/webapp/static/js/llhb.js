/*
 * 通用公共方法
 */
$(document).ready(function() {
	try{
		//所有下拉框使用select2
		$("select").select2();
	}catch(e){
		// blank
	}
});

// 打开一个窗体
function windowOpen(url, name, width, height){
	var top=parseInt((window.screen.height-height)/2,10),left=parseInt((window.screen.width-width)/2,10),
		options="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,"+
		"resizable=yes,scrollbars=yes,"+"width="+width+",height="+height+",top="+top+",left="+left;
	window.open(url ,name , options);
}

// 恢复提示框显示
function resetTip(){
	top.$.jBox.tip.mess = null;
}
// 关闭提示框
function closeTip(){
	top.$.jBox.closeTip();
}
// 显示加载框
function loading(mess){
	if (mess == undefined || mess == ""){
		mess = "正在提交，请稍等...";
	}
	resetTip();
	top.$.jBox.tip(mess,'loading');
}
//确认对话框
function confirmx(mess, href){
	top.$.jBox.confirm(mess, '',function(v,h,f){
		if(v=='ok'){
			location = href;
			loading('');
		}
	},{buttonsFocus:0});
	return false;
}

//获取字典标签
function getDictLabel(data, value, defaultValue){
	for (var i=0; i<data.length; i++){
		var row = data[i];
		if (row.value == value){
			return row.label;
		}
	}
	return defaultValue;
}
// checkbox 全选
function selectall(){
	var chkall;
	chkall=document.getElementsByName("selecteditemall");

    if(chkall[0].checked==true){
    	var cc = document.getElementsByName("selecteditem");
        for(var i=0;i<cc.length;i++)
		{
            cc[i].checked=true;
        }
    }else{
    	var cc = document.getElementsByName("selecteditem");
        for(var i=0;i<cc.length;i++)
		{
            cc[i].checked=false;
        }
	}
}
//右侧内容区 tab页切换----------------------------------------------------------------------------------------
$(document).ready(function(){
	$("._tab").click(function(){
		$("._tab").removeClass("active");
		$(this).addClass("active");
	});
});

