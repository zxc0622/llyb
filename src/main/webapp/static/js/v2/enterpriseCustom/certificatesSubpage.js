/**企业资质子页面js start**/
$(function(){
	
	//新增上传证书表单事件
	var i=0;
	$(".box29 .addCer").click(function(){
		var divEl=$(".box29 .mainlist div").eq(1).clone();
		divEl.addClass("cerDiv");
		divEl.find(".cerImg").attr("id","cerImg"+i);
		divEl.show();
		$(".box29 .addCerDiv").before(divEl);
		i+=1;
	});
	
	//遍历页面所有证书
	function getCers(){
		var cers=new Array();
		$(".certificate_sy li").each(function(){
			liEl=$(this);
			cers.push({"cerId":liEl.attr("id"),"title":liEl.find("p").text(),"imgUrl":liEl.find("img").attr("src")});
		});
		return cers;
	}
	
	$(".certificate").hover(function(event) {
		var hh = $(".certificate").height();
		$(".zhe_z28").height(hh);
		shadeLayer(event,$(".zhe_z28"),(".box-bar29"));
	});
	//显示设置窗口
	$(".showbox29").click(function() {
		//移除已有的 .cerDiv
		$(".box29 .cerDiv").remove();
		
		//初始化数据
		var cers=getCers();
		var cloneDivEl;
		var cer;
		for(index in cers){
			cer=cers[index];
			cloneDivEl=$(".box29 .mainlist div").eq(1).clone();
			cloneDivEl.find(".cerTitle").val(cer.title);
			cloneDivEl.find(".cerImg").attr("id",cer.cerId);
			cloneDivEl.find(".showImg").attr("id",cer.imgUrl);
			cloneDivEl.attr("id",cer.cerId);
			cloneDivEl.addClass("cerDiv");
			cloneDivEl.show();
			$(".box29 .addCerDiv").before(cloneDivEl);
		}
		
		if($(window).height() < $(".box29").height()){
			$(".box29").css("height",$(window).height());
		}
		
		//显示窗口
		$("#TB_overlayBG").css({
			display : "block",
			height : $(document).height()
		});
		
		$(".box29").css({
			left : ($("body").width() - $(".box29").width()) / 2 - 20 + "px",
			top : ($(window).height() - $(".box29").height()) / 2 + "px",
			display : "block"
		});
	});
	$(".close").click(function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box29 ").css("display", "none");
	});
	
	//获取设置窗口中的数据
	function getCersOnSetingPage(){
		var cerDiv;
		var cers="";
		var imgUrl;
		$(".cerDiv").each(function(){
			cerDiv=$(this);
			imgUrl=cerDiv.find(".showImg").attr("id");
			if(imgUrl!=undefined){
				cers+='{"cerId":"'+cerDiv.attr("id")+'","imgUrl":"'+imgUrl+'","title":"'+cerDiv.find(".cerTitle").val()+'"};';
			}
		});
		cers=cers.substring(0,cers.length-1);
		return cers;
	}
	
	//确认提交证书
	$(".submitCers").click(function(){
		var cers = getCersOnSetingPage();
		var url=basePath+"Library/certificates/updateCers/"+companyId;
		$.post(url,{
			"cers":cers
		},function(data,status){
			if(data){
				$(".close").click();
				reloadCersOnPage(cers);
			}
		});
	});
	
	//将设置窗口中的资质证书加载到页面
	function reloadCersOnPage(cers){
		var cersUlEl=$(".certificate_sy");
		cersUlEl.empty();
		var li='<li id=""><div class="imgDiv"><img src="" style="vertical-align: middle; max-width: 248px; max-height: 248px;" /></div><p></p></li>';
		var cer;
		var cersStrArray=cers.split(";");
		var liEl;
		for(index in cersStrArray){
			cer=$.parseJSON(cersStrArray[index]);
			if(cer.imgUrl!="delete"){
				liEl=$(li);
				liEl.attr("id",cer.cerId);
				liEl.find("img").attr("src",cer.imgUrl);
				liEl.find("p").text(cer.title);
				cersUlEl.append(liEl);
			}
		}
	}
	
	//上传图片
	$(".mainlist").on("change",".setCer .cerImg",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			var nextEl=thisObj.next();
			nextEl.attr("id",imgUrl);
		});
	});
	
	//删除证书
	$(".mainlist").on("click",".setCer .deleteImg",function(){
		var p = $(this).parent();
		p.find(".showImg").attr("id","delete");
		p.hide();
	});
	
	//预览图片
	$(".mainlist").on("click",".setCer .showImg",function(){
		showImg($(this).attr("id"));
	});
	
	//查看图片
	$(".certificate_sy").on("click",".imgDiv img",function(){
		showImg($(this).attr("src"));
	});
});
/**企业资质子页面js end**/




