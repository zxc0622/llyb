//input checkbox自定义样式----------------------------------------------------------------------------
$(document).ready(function(e) {
    $(".me_checkbox_span").click(function(){		
		if($(this).attr("name") == 'one'){
			$(this).css("background","url('/llhb/static/img/tick.png') no-repeat center center");
			$(this).attr("name","two")
		}else if($(this).attr("name") == 'two'){
			$(this).css("background","none");
			$(this).attr("name","one");
		}
	})
});
//树状图样式---------------------------------------------------------------------------------------
$(document).ready(function(e) {
    $(".me_tree_pop").click(function(){//右侧弹出页面
		$("#me_four_page").animate({
			right:'0px'
		},150);
	});
	$("#me_four_page_close").click(function(){//右侧关闭页面
		$("#me_four_page").animate({
			right:'-420px'
		},150);
	})
});
//四级页面样式---------------------------------------------------------------------------------------
$(document).ready(function(e) {
    $("#me_four_pop_click").click(function(){
		$("#me_four_pop").animate({
			right:'-187px'
		},500);
	})
	$("#me_four_pop_colse").click(function(){
		$("#me_four_pop").animate({
			right:'-2000px'
		},500);
		$("#me_four_page").animate({
			right:'-420px'
		},150);
	})
});
//门店管理、仓库管理切换样式-------------------------------------------------------------------------------
$(document).ready(function(e) {
    $("#mendian").click(function(){
		$("#mendian").addClass("me_change_befault");
		$("#cangku").removeClass("me_change_befault");
	})
	 $("#cangku").click(function(){
		$("#cangku").addClass("me_change_befault");
		$("#mendian").removeClass("me_change_befault");
	})
});
//折叠样式-----------------------------------------------------------------------------------------------
$(document).ready(function(e) {
    $("#zhedie").click(function(){
		if($("#xianshi").css("display") == "none"){
			$("#xianshi").css("display","block")
			$("#zhedie").addClass("me_zhedie_up");
		}else{
			$("#xianshi").css("display","none")
			$("#zhedie").removeClass("me_zhedie_up");
			$("#zhedie").addClass("me_zhedie_down");
		}
	})
});
//提成规则折叠样式----------------------------------------------------------------------------------------
$(document).ready(function(e) {
    $("#zhedie_cut").click(function(){
		if($("#xianshi_cut").css("display") == "none"){
			$("#xianshi_cut").css("display","block")
			$(".me_cut_all").css("border-color","#00bfb0")
		}else{
			$("#xianshi_cut").css("display","none")
			$(".me_cut_all").css("border-color","#c9c9c9")
		}
	})
});