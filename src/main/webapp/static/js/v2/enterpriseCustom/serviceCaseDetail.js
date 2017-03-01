
//=====================全局函数========================
//Tab控制函数
function tabs(tabId, tabNum){
	//设置点击后的切换样式
	$(tabId + " .tab li").removeClass("curr");
	$(tabId + " .tab li").eq(tabNum).addClass("curr");
	//根据参数决定显示内容
	$(tabId + " .tabcon").hide();
	$(tabId + " .tabcon").eq(tabNum).show();
}
//=====================全局函数========================

//==================图片详细页函数=====================
//鼠标经过预览图片函数
function preview(img){
	$("#preview .jqzoom img").attr("src",$(img).attr("src"));
	$("#preview .jqzoom img").attr("jqimg",$(img).attr("bimg"));
}

//图片放大镜效果
$(function(){
	$(".jqzoom").jqueryzoom({xzoom:380,yzoom:410});
});

//图片预览小图移动效果,页面加载时触发
$(function(){
	var tempLength = 0; //临时变量,当前移动的长度
	var viewNum = 5; //设置每次显示图片的个数量
	var moveNum = 2; //每次移动的数量
	var moveTime = 300; //移动速度,毫秒
	var scrollDiv = $(".spec-scroll .items ul"); //进行移动动画的容器
	var scrollItems = $(".spec-scroll .items ul li"); //移动容器里的集合
	var moveLength = scrollItems.eq(0).width() * moveNum; //计算每次移动的长度
	var countLength = (scrollItems.length - viewNum) * scrollItems.eq(0).width(); //计算总长度,总个数*单个长度
	  
	//下一张
	$(".spec-scroll .next").bind("click",function(){
		if(tempLength < countLength){
			if((countLength - tempLength) > moveLength){
				scrollDiv.animate({left:"-=" + moveLength + "px"}, moveTime);
				tempLength += moveLength;
			}else{
				scrollDiv.animate({left:"-=" + (countLength - tempLength) + "px"}, moveTime);
				tempLength += (countLength - tempLength);
			}
		}
	});
	//上一张
	$(".spec-scroll .prev").bind("click",function(){
		if(tempLength > 0){
			if(tempLength > moveLength){
				scrollDiv.animate({left: "+=" + moveLength + "px"}, moveTime);
				tempLength -= moveLength;
			}else{
				scrollDiv.animate({left: "+=" + tempLength + "px"}, moveTime);
				tempLength = 0;
			}
		}
	});
});
//==================图片详细页函数=====================

$(function(){
	
	if(cllFlag == "1"){
		$(".collectCase").css("background-color","#c4ecab");
		$(".collectCase").text("已收藏");
	}
	
	$(".understand").click(function(){
		var caseUserId = $(this).attr("caseUser");
		var url=basePath+"Library/serviceCase/intoServiceCaseSubpage/"+companyId;
		postStandUrl(url,"_blank",{"pageNumber":1,"pageSize":"","userId":caseUserId});
	});
	
	$(".collectCase").click(function(){
		debugger;
		if(cllFlag == "1"){
			return;
		}
		var collectId = $(this).attr("caseId");
		var type = 5;
		$.ajax({
			url:basePath+'Library/libraryCommon/collectBusiness/'+companyId,
			data:{
				collectId : collectId,
				type : type
			 },
			 type:'post',
			 dataType:'text',
			 success:function(data) {
				 debugger;
				 if(data == "ok"){
					 $(".collectCase").css("background-color","#c4ecab");
					 $(".collectCase").text("已收藏");
					 cllFlag = "1";
				 }
			 }
		});
	});
	
	function postStandUrl(url,target,params){
	    var turnForm = document.createElement("form");
	    //一定要加入到body中！！
	    document.body.appendChild(turnForm);
	    turnForm.method = 'post';
	    turnForm.action = url;
	    turnForm.target = target;
	    //创建隐藏表单
	    for (var x in params) {
	        var newElement = document.createElement("input");
	        newElement.setAttribute("type","hidden");
	        newElement.setAttribute("name",x);
	        newElement.setAttribute("value",params[x]);
	        //alert(newElement.name)
	        turnForm.appendChild(newElement);
	    }
	    turnForm.submit();
	}
	
});


