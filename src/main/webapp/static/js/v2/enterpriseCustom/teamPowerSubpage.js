/**
 * teamPower.jsp js
 */

$(function() {
	
	$(".team_figure").hover(function(event){
			shadeLayer(event,$(".zhe_z41"),$(".box-bar41"));
		}	
	);
	$(".team_text").hover(function(event){
			shadeLayer(event,$(".zhe_z39"),$(".box-bar39"));
		}
	);
	$(".technical").hover(function(event) {
		//$(".zhe_z40").css("height",$(".technical").css("height"));
		shadeLayer(event,$(".zhe_z40"),$(".box-bar40"));
		}
	);
	
	$(".showbox39").click(function() {
		
		var employee=$(".team_right .employee").text();
		$(".box39 .employee").val(employee);
		var experts=$(".team_right .experts").text();
		$(".box39 .experts").val(experts);
		var patent=$(".team_right .patent").text();
		$(".box39 .patent").val(patent);
		var summary=$(".team_left").text();
		$(".box39 .summary").val(summary);
		
		if($(window).height() < $(".box39").height()){
			$(".box39").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display : "block",
			height : $(document).height()
		});
		$(".box39").css({
			left : ($("body").width() - $(".box39").width()) / 2 - 20 + "px",
			top : ($(window).height() - $(".box39").height()) / 2 + "px",
			display : "block"
		});
	});
	$(".showbox40").click(function() {
		var teamPicDivs = $(".mainlist .teamPic");
		var len = teamPicDivs.length;
		for(var i=1;i<len;i++){
			teamPicDivs.eq(i).remove();
		}
		var addPic=$(".addPic");
		var cloneTeamPicEl;
		var liEl;
		$(".artisanPic li").each(function(index,el){
			liEl=$(this);
			cloneTeamPicEl=$($(".mainlist .teamPic")[0]).clone(true);
			cloneTeamPicEl.find(".picTitle").val(liEl.find("p").text());
			cloneTeamPicEl.find(".uploadTeamPic").attr("id","uploadTeamPic"+index);
			cloneTeamPicEl.find(".showTeamPic").attr("id",liEl.find("img").attr("src"));
			cloneTeamPicEl.find(".delTeamPic").attr("id",liEl.find("img").attr("id"));
			cloneTeamPicEl.removeClass("shade");
			cloneTeamPicEl.show();
			addPic.before(cloneTeamPicEl);
		});
		
		if($(window).height() < $(".box40").height()){
			$(".box40").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display : "block",
			height : $(document).height()
		});
		$(".box40").css({
			left : ($("body").width() - $(".box40").width()) / 2 - 20 + "px",
			top : ($(window).height() - $(".box40").height()) / 2 + "px",
			display : "block"
		});
		
	});
	
	$(".showbox41").click(function() {
		if($(window).height() < $(".box41").height()){
			$(".box41").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display : "block",
			height : $(document).height()
		});
		$(".box41").css({
			left : ($("body").width() - $(".box41").width()) / 2 - 20 + "px",
			top : ($(window).height() - $(".box41").height()) / 2 + "px",
			display : "block"
		});
		
	});
	
	$(".close").click(function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box39").css("display", "none");
		$(".box40").css("display", "none");
		$(".box41").css("display", "none");
	});
	
	//上传头部背景
	$(".teamImg").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			var nextEl=thisObj.next();
			nextEl.attr("id",imgUrl);
			$(".teamImgUrl").val(imgUrl);
		});
	});
	
	//图片预览
	$(".showTeamImg").click(function(){
		var imgUrl=$(this).attr("id");
		showImg(imgUrl);
	});
	
	//提交头部背景图设置
	$(".submintTeamImg").click(function(){
		var imgUrl=$(".teamImgUrl").val();
		$.post(basePath + "Library/teamPower/updateTeamMsg/"+companyId,{
			teamMsg:'{"img_url":"'+imgUrl+'"}'
		},function(data,status){
			if(data){
				$(".team_figure").css("background-image","url("+imgUrl+")");
			}
			$(".close").click();
		});
	});
	
	//提交团队概况
	$(".submitTeamSummary").click(function(){
		var employee=$(".box39 .employee").val();
		var experts=$(".box39 .experts").val();
		var patent=$(".box39 .patent").val();
		var summary=$(".box39 .summary").val().replace(/[\r\n]/g,"").replace(/\ +/g,"");
		$.post(basePath + "Library/teamPower/updateTeamMsg/"+companyId,{
			teamMsg:'{"employee":"'+employee+'","experts":"'+experts+'","patent":"'+patent+'","summary":"'+summary+'"}'
		},function(data,status){
			if(data){
				$(".team_text .team_left").text(summary);
				$(".team_right .employee").text(employee);
				$(".team_right .experts").text(experts);
				$(".team_right .patent").text(patent);
			}
			$(".close").click();
		});
	});
	
	//新增相册
	$(".addPic").click(function(){
		var len = $(".mainlist .teamPic").length;
		if(len >5){
			return;
		}
		var cloneTeamPicEl=$($(".mainlist .teamPic")[0]).clone(true);
		cloneTeamPicEl.find(".uploadTeamPic").attr("id",("add"+Math.random()).replace(".",""));
		cloneTeamPicEl.removeClass("shade");
		cloneTeamPicEl.show();
		cloneTeamPicEl.find(".selectTeamImg").val("选择图片");
		$(this).before(cloneTeamPicEl);
	});
	
	//上传相册
	$(".uploadTeamPic").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			var nextEl=thisObj.next();
			nextEl.attr("id",imgUrl);
			thisObj.prev().val("已上传");
		});
	});
	
	//图片预览
	$(".showTeamPic").click(function(){
		var imgUrl=$(this).attr("id");
		if(imgUrl=="undefined"){
			imgUrl = "";
		}
		showImg(imgUrl);
	});
	
	//删除相册
	$(".delTeamPic").click(function(){
		$(this).parent().remove();
	});
	
	//遍历相册设置窗口数据
	function getTeamPic(){
		var teamPic;
		var title;
		var pic;
		var key;
		var pics = "";
		$(".mainlist .teamPic:not(.shade)").each(function(){
			teamPic=$(this);
			title=teamPic.find(".picTitle").val();
			pic=teamPic.find(".showTeamPic").attr("id");
			key=teamPic.find(".delTeamPic").attr("id");
			if(title==undefined&&pic==undefined){
				
			}else{
				pics+='{"key":"'+key+'","pic":"'+pic+'","title":"'+title+'"},';
			}
		});
		return "["+pics.substring(0, pics.length-1)+"]";
	}
	
	//提交团队相册修改
	$(".submitPic").click(function(){
		var pics = getTeamPic();
		$.post(basePath + "Library/teamPower/updateTeamMsg/"+companyId,{
			teamMsg:'{"artisan_pic":'+pics+'}'
		},function(data,status){
			if(data){
				location.reload();
			}
		});
	});
});