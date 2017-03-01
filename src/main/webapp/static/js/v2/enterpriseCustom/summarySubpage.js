//====================企业简介子页面js start=======================
$(function(){
	
	$(".recommend_top").hover(function(event) {
    	shadeLayer(event,$(".zhe_z17"),$(".box-bar17"));
    });
    $(".enroll").hover(function(event) {
    	shadeLayer(event,$(".zhe_z18"),$(".box-bar18"));
    });
	
	$(".showbox17").click(function(){
		if($(window).height() < $(".box17").height()){
			$(".box17").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".box17").css({
			left:($("body").width()-$(".box17").width())/2-20+"px",
			top:($(window).height()-$(".box17").height())/2+"px",
			display:"block"
		});
	});
	
	$(".showbox18").click(function(){
		if($(window).height() < $(".box18").height()){
			$(".box18").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".box18").css({
			left:($("body").width()-$(".box18").width())/2-20+"px",
			top:($(window).height()-$(".box18").height())/2+"px",
			display:"block"
		});
	});
	
	$(".close").click(function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box16 ").css("display","none");
		$(".box17 ").css("display","none");
		$(".box18 ").css("display","none");
		$(".removable").remove();
	});
	
	$(".box17_sure").click(function(){
		var comContact = $(".comContact").val();
		var comPhoneEn = $(".comPhoneEn").val();
		var comEmail = $(".comEmail").val();
		var companyMsgColor=$(".companyMsgColor").css("background-color");
		
		$.ajax({
			url:basePath+'Library/summary/updateNCPM/'+companyId,
			data:{
				comContact : comContact,
				comPhoneEn : comPhoneEn,
				comEmail : comEmail,
				companyMsgColor : companyMsgColor
			 },
			 type:'post',
			 dataType:'text',
			 success:function(data) {
				if(data == "ok"){
					$("#ccontact").text(comContact);
					$("#cphone").text(comPhoneEn);
					$("#cemail").text(comEmail);
					
					//关闭弹窗
					$("#TB_overlayBG").css("display", "none");
					$(".box17 ").css("display","none");
					$(".removable").remove();
				}
			 }
		});
	});
	
	$(".box17_cancel").click(function(){
		$("#TB_overlayBG").css("display", "none");
		$(".box17 ").css("display","none");
		$(".removable").remove();
	});
	
	$(".box18_sure").click(function(){
		var leftImg = $(".sumLeftImg").val();
		var reg_address = $("#reg_address").val();
		var reg_fund = $("#reg_fund").val();
		var reg_mainbusiness = $("#reg_mainbusiness").val();
		var licenseImg = $(".licenseImg").val();
		$.ajax({
			url:basePath+'Library/summary/updateINAFB/'+companyId,
			data:{
				leftImg : leftImg,
				reg_address : reg_address,
				reg_fund : reg_fund,
				reg_mainbusiness : reg_mainbusiness,
				licenseImg : licenseImg
			},
			type:'post',
			dataType:'text',
			success:function(data) {
				if(data == "ok"){
					$("#box18address").text(reg_address);
					$("#box18fund").text(reg_fund);
					$(".business").text(reg_mainbusiness);
					$(".license").attr("src",licenseImg);
					$(".enroll_left").css("background-image","url("+leftImg+")");
					
					//关闭弹窗
					$("#TB_overlayBG").css("display", "none");
					$(".box18 ").css("display","none");
					$(".removable").remove();
				}
			}
		});
	});
	
	//上传左侧图
	$(".leftImg").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			$(".sumLeftImg").val(imgUrl);
			$(".showLeftImg").attr("id",imgUrl);
		});
	});
	
	//预览左侧图
	$(".showLeftImg").click(function(){
		var imgUrl = $(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除图片左侧图
	$(".deleteLeftImg").click(function(){
		$(".sumLeftImg").val("");
		$(".showLeftImg").attr("id","");
	});
	
	//上传营业执照
	$(".licenseimgUp").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			$(".licenseImg").val(imgUrl);
			$(".showLicenseImg").attr("id",imgUrl);
		});
	});
	
	//预览营业执照
	$(".showLicenseImg").click(function(){
		var imgUrl = $(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除营业执照
	$(".deleteLicenseImg").click(function(){
		$(".licenseImg").val("");
		$(".showLicenseImg").attr("id","");
	});
	
	$(".box18_cancel").click(function(){
		$("#TB_overlayBG").css("display", "none");
		$(".box18 ").css("display","none");
		$(".removable").remove();
	});
	
	//营业执照预览-非编辑状态
	$(".license").click(function(){
		var imgUrl=$(this).attr("src");
		showImg(imgUrl);
	});
	
	//企业简介-公司信息字体颜色
	$(".companyMsgColor").bigColorpicker(function(el, color) {
		$(el).css("background-color", color);
		$(".companyMsg").css("color",color);
	});
});

//====================企业简介子页面js end=======================