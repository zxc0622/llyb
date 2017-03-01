$(function(){
	
	//遮罩层
	$(".letter").hover(function(event) {
		var saleHeight = $(".letter").outerHeight(true);
		$(".zhe_z14").css("height",saleHeight);
		shadeLayer(event,$(".zhe_z14"),$(".box-bar14"));
	});
	
	$(".subClose").click(function(){
		$("#TB_overlayBG").css("display", "none");
		$(".box14 ").css("display", "none");
	});


	//弹框
	$(".showbox14").click(function(){
		
		if($(window).height() < $(".box14").height()){
			$(".box14").css("height",$(window).height());
		}
		
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".box14").css({
			left:($("body").width()-$(".box14").width())/2-20+"px",
			top:($(window).height()-$(".box14").height())/2+"px",
			display:"block"
		});
		
		
	});
	

});

