/**
 * connectUsSubpage.jsp js
 */

$(function() {

	$(".Contact_address").hover(function(event) {
		shadeLayer(event, $(".zhe_z49"), $(".box-bar49"));
	});

	$(".showbox49").click(
			function() {
				if($(window).height() < $(".box49").height()){
					$(".box49").css("height",$(window).height());
				}
				$("#TB_overlayBG").css({
					display : "block",
					height : $(document).height()
				});
				$(".box49").css(
						{
							left : ($("body").width() - $(".box49").width())
									/ 2 - 20 + "px",
							top : ($(window).height() - $(".box49").height())
									/ 2 + "px",
							display : "block"
						});

			});
	$(".close").click(function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box49 ").css("display", "none");
	});

	$(".box49Sure").click(function() {
		var cominfo = $(".yin_c");
		var companyName = cominfo.eq(0).val();
		var companyAddress = cominfo.eq(1).val();
		var companyContact = cominfo.eq(2).val();
		var companyTel = cominfo.eq(3).val();
		var companyFax = cominfo.eq(4).val();

		var companyUrl = cominfo.eq(5).val();
		var companyCode = cominfo.eq(6).val();

		$.ajax({
			url : basePath + 'Library/connectUs/saveConnectUs/' + companyId,
			data : {
				companyName : companyName,
				companyAddress : companyAddress,
				companyContact : companyContact,
				companyTel : companyTel,
				companyFax : companyFax,
				companyUrl : companyUrl,
				companyCode : companyCode
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				if (data == "ok") {
					alert("保存成功");

					$("#ccn").text(companyName);
					$("#ca").text(companyAddress);
					$("#cc").text(companyContact);
					$("#ct").text(companyTel);
					$("#cf").text(companyFax);

					$("#ccu").text(companyUrl);
					$("#cpc").text(companyCode);

					getAddressByKw(companyAddress);
					
					// 关闭弹窗
					$("#TB_overlayBG").css("display", "none");
					$(".box49 ").css("display", "none");
				}
			}
		});
	});

	$(".box49Cancel").click(function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box49 ").css("display", "none");
	});

	
	
});