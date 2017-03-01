$(function(){
	//====================服务案例子页面代码==========================
	//创建页码条
	//careatePageNum(pageNumber,totalPage,"#therepage");
	
	
	var delSelector;//记录要删除的案例的id
	//删除案例
	$(".serviceCaseUl").on("click",".remove20",function(event){
		
		if($(window).height() < $(".delBox").height()){
			$(".delBox").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		
		$(".delBox").css({
			left:($("body").width()-$(".delBox").width())/2-20+"px",
			top:($(window).height()-$(".delBox").height())/2+"px",
			display:"block"
		});
		
		var casename = $(this).parent().prev().prev().prev().prev().text();
		$("#caseName").text(casename);
		var caseid = $(this).prev().attr("id");
		$("#dcaseid").val(caseid);
		delSelector = $(this).parent().parent();
	});

	//关闭删除弹窗
	$(".closeDelBox,.del_cancel").click(function(){
		$("#TB_overlayBG").css("display","none");
		$(".delBox ").css("display","none");
	});
	
	//确定删除
	$(".del_sure").click(function(){
		var caseid = $("#dcaseid").val();
		$.ajax({
			url:basePath+'Library/serviceCase/deleteCaseById',
			data:{
				caseId : caseid
			 },
			 type:'post',
			 dataType:'text',
			 success:function(data) {
				 if(data == "ok"){
					 $("#TB_overlayBG").css("display","none");
					 $(".delBox ").css("display","none");
					 alert("删除成功");
					 delSelector.remove();
				 }
			 }
		});
	});

	//案例的hover事件
	$(".serviceCaseUl").on("mouseover mouseout",".serviceCaseItem",function(event){
		shadeLayer(event, $(this).find(".zhe_z21"),$(this).find(".box-bar21"));
		//改变左侧的案例描述
		if(!showShadeLayer){
			var caseDescForLeft = $(this).find(".caseDescForLeft").val();
			$(".serviceCaseDesc p").html(caseDescForLeft);
		}
	});

	//关闭修改/新增案例弹框
	$(".closeBox20").click(function(){
		closeBox20();
	});

	//关闭修改/新增案例弹框
	$(".box20_cancel").click(function(){
		closeBox20();
	});
	
	//显示修改/新增案例弹框
	function showBox20(){
		var box20h = 1024;
		var wh = $(window).height();
		if(wh<1200){
			box20h=$(window).height();
		}
		
		if($(window).height() < $(".box20").height()){
			$(".box20").css("height",$(window).height());
		}
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		
		$(".box20").css({
			left:($("body").width()-$(".box20").width())/2-20+"px",
			top:($(window).height()-$(".box20").height())/2+"px",
			top:"0px",
			height:box20h+"px",
			display:"block"
		});
		
	}
	
	//关闭修改/新增案例弹框
	function closeBox20(){
		$("#TB_overlayBG").css("display","none");
		$(".box20 ").css("display","none");
	}
	 
	//新增案例弹窗
	$(".addCase").click(function(){
		$("#box20Name").text("新增案例");
		$(".sora").val("2");//1为修改，2为新增
		clearBoxValue();
		showBox20();
	});
	
	//清空新增或修改的弹窗
	function clearBoxValue(){
		$(".caseName").val("");
		$(".casePic1").val("");
		$(".showCasePic1").attr("id","");
		$(".casePic2").val("");
		$(".showCasePic2").attr("id","");
		$(".casePic3").val("");
		$(".showCasePic3").attr("id","");
		$(".price").val("");
		$(".startTime").val("");
		$(".endTime").val("");
		$(".detailAddress").val("");
		$(".checkStandard").val("");
		$(".caseDesc").val("");
	}
	
	//修改案例弹窗
	$(".serviceCaseUl").on("click",".updateCase",function(){
		$("#box20Name").text("修改案例");
		var caseid = $(this).attr("id");
		$(".caseId").val(caseid);
		$(".sora").val("1");//1为修改，2为新增
		var caseInfo = getCase(caseid);
		var ca = caseInfo[0].columns;
		
		$(".caseName").val($.isEmptyObject(ca.case_name)?"":ca.case_name);
		$(".casePic1").val($.isEmptyObject(ca.pic1)?"":ca.pic1);
		$(".showCasePic1").attr("id",$.isEmptyObject(ca.pic1)?"":ca.pic1);
		$(".casePic2").val($.isEmptyObject(ca.pic2)?"":ca.pic2);
		$(".showCasePic2").attr("id",$.isEmptyObject(ca.pic2)?"":ca.pic2);
		$(".casePic3").val($.isEmptyObject(ca.pic2)?"":ca.pic2);
		$(".showCasePic3").attr("id",$.isEmptyObject(ca.pic2)?"":ca.pic2);
		$(".price").val(isNaN(ca.price)?"":ca.price);
		//处理datatime
		var st = ca.start_time;
		var sttime;
		if($.isEmptyObject(st)){
			sttime="";
		}else{
			var sty = st.year+"";
			sttime="20"+sty.substring(sty.length-2,sty.length)+"-"+(st.month+1)+"-"+st.date+"";
		}
		$(".startTime").val(sttime);
		
		var et = ca.end_time;
		var ettime;
		if($.isEmptyObject(et)){
			ettime="";
		}else{
			var ety = et.year+"";
			ettime="20"+ety.substring(ety.length-2,ety.length)+"-"+(et.month+1)+"-"+et.date+"";
		}
		$(".endTime").val(ettime);
		$(".detailAddress").val($.isEmptyObject(ca.address)?"":ca.address);
		$(".checkStandard").val($.isEmptyObject(ca.check_standard)?"":ca.check_standard);
		$(".caseDesc").val($.isEmptyObject(ca.case_desc)?"":ca.case_desc);
		
		//设置案例类型
		if(!isNaN(ca.type_id)){
			$(".cases1").find("option[value='"+ca.type_id+"']").attr("selected",true);
			if(!isNaN(ca.type_id2)){
				$(".cases2").empty();
				var typeInfo2 = getTypeByParentId(ca.type_id);
				var tiLength = typeInfo2.length;
				for(var i=0;i<tiLength;i++){
					var ti = typeInfo2[i].columns;
					var $op = $(
						'<option value="'+ti.id+'">'+ti.name+'</option>'
					);
					$(".cases2").append($op);
				}
				$(".cases2").find("option[value='"+ca.type_id2+"']").attr("selected",true);
			}
		}
		//设置行业分类
		if(!isNaN(ca.industry_type_id)){
			var typeInfo = getTypeById(ca.industry_type_id);
			var parentid = typeInfo[0].columns.parent_id;
			var typeInfo2 = getTypeByParentId(parentid);
			$(".industrys2").empty();
			var tiLength = typeInfo2.length;
			for(var i=0;i<tiLength;i++){
				var ti = typeInfo2[i].columns;
				var $op = $(
					'<option value="'+ti.id+'">'+ti.name+'</option>'
				);
				$(".industrys2").append($op);
			}
			$(".industrys1").find("option[value='"+parentid+"']").attr("selected",true);
			$(".industrys2").find("option[value='"+ca.industry_type_id+"']").attr("selected",true);
		}
		//设置省市区
		if(!isNaN(ca.prov_id)){
			$(".addresss1").find("option[value='"+ca.prov_id+"']").attr("selected",true);
			if(!isNaN(ca.city_id)){
				var cityInfo = getAeraById(ca.city_id);
				if(cityInfo[0] != undefined){
					var provid = cityInfo[0].columns.parent_id;
					var aera2 = getAeraByParentId(provid);
					$(".addresss2").empty();
					var a2len = aera2.length;
					for(var i=0;i<a2len;i++){
						var ti = aera2[i].columns;
						var $op = $(
								'<option value="'+ti.id+'">'+ti.name+'</option>'
						);
						$(".addresss2").append($op);
					}
					$(".addresss2").find("option[value='"+ca.city_id+"']").attr("selected",true);
					
					if(!isNaN(ca.area_id)){
						var aera = getAeraById(ca.area_id);
						var cityid = aera[0].columns.parent_id;
						var aera3 = getAeraByParentId(cityid);
						$(".addresss3").empty();
						var a3len = aera3.length;
						for(var i=0;i<a3len;i++){
							var ti = aera3[i].columns;
							var $op = $(
									'<option value="'+ti.id+'">'+ti.name+'</option>'
							);
							$(".addresss3").append($op);
						}
						$(".addresss3").find("option[value='"+ca.area_id+"']").attr("selected",true);
					}
				}
			}
		}
		
		
		showBox20();
	});
	
	//修改/新增案例弹框确定事件
	$(".box20_sure").click(function(){
		var caseName = $(".caseName").val();
		var caseTypeId = $(".cases1").find("option:selected").val();
		var caseTypeName = $(".cases1").find("option:selected").text();
		var caseTypeId2 = $(".cases2").find("option:selected").val();
		var caseTypeName2 = $(".cases2").find("option:selected").text();
		var industrys1Id = $(".industrys1").find("option:selected").val();
		var industrys1Name = $(".industrys1").find("option:selected").text();
		
		var industrys2Id = $(".industrys2").find("option:selected").val();
		var industrys2Name = $(".industrys2").find("option:selected").text();
		var casePic1 = $(".casePic1").val();
		var casePic2 = $(".casePic2").val();
		var casePic3 = $(".casePic3").val();
		
		var price = $(".price").val();
		var startTime = $(".startTime").val();
		var endTime = $(".endTime").val();
		var prov = $(".addresss1").val();
		var city = $(".addresss2").val();
		
		var area = $(".addresss3").val();
		var detailAddress = $(".detailAddress").val();
		var checkStandard = $(".checkStandard").val();
		var caseDesc = $(".caseDesc").val();
		var caseId = $(".caseId").val();//案例id，修改需要使用
		
		var sora = $(".sora").val();//修改或新增标志：1为修改，2为新增
		
		var url;
		if(sora=="1"){
			url=basePath+'Library/serviceCase/updateCase/'+companyId;
		}else if(sora=="2"){
			url=basePath+'Library/serviceCase/addCase/'+companyId;
		}else{
			alert("发生错误，请刷新试试");
			return;
		}
		
		if(caseName == "" || caseTypeId == "" || casePic1 == ""
			|| casePic2 == "" || casePic3 == "" || startTime == "" 
			|| endTime == "" || prov == null || prov == "" 
			|| city == null || city == "" 
			|| checkStandard == "" || checkStandard == ""){
			
			alert("红色星号为必填信息，请完善！");
			return;
		}
		
		//验证时间是否矛盾
		var st = startTime.split("-");
		var et = endTime.split("-");
		if(et[0] < st[0]){
			alert("结束时间不得小于开始时间");
			return;
		}else if(et[0] == st[0]){
			if(et[1] < st[1]){
				alert("结束时间不得小于开始时间");
				return;
			}else if(et[1] == st[1]){
				if(et[2] < st[2]){
					alert("结束时间不得小于开始时间");
					return;
				}
			}
		}
		
		
		$.ajax({
			url:url,
			//async : false,
			data:{
				caseName : caseName,
				caseTypeId : caseTypeId,
				caseTypeName : caseTypeName,
				caseTypeId2 : caseTypeId2,
				caseTypeName2 : caseTypeName2,
				industrys1Id : industrys1Id,
				industrys1Name : industrys1Name,
				
				industrys2Id : industrys2Id,
				industrys2Name : industrys2Name,
				casePic1 : casePic1,
				casePic2 : casePic2,
				casePic3 : casePic3,
				
				price : price,
				startTime : startTime,
				endTime : endTime,
				prov : prov,
				city : city,
				
				area : area,
				detailAddress : detailAddress,
				checkStandard : checkStandard,
				caseDesc : caseDesc,
				caseId : caseId
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 if(data.sta == "ok"){
					 closeBox20();
					 alert("保存成功");
					 if(sora=="2"){
						 var ulEl = $(".service_time ul");
						 var liEls = ulEl.find("li:not(.fixed)");
						 var liEl=liEls.eq(0).clone();
						 liEl.find("img").attr("src",casePic1);
						 liEl.find("p").eq(0).text(caseName);
						 liEl.find("p").eq(1).text("发布时间："+startTime);
						 liEl.find("p").eq(2).text("施工时间："+endTime);
						 liEl.find("a").eq(0).attr("href",ctx+"/Library/enterpriseCustom/"+companyId+"-case"+data.caseId);
						 liEl.find("a").eq(1).attr("id",data.caseId);
						 liEl.find("input").eq(0).val(caseDesc);
						 liEl.find("input").eq(1).val(data.userId);
						 var lilen = liEls.length-1;
						 liEls.eq(lilen).remove();
						 liEls.eq(0).before(liEl);
						 
					 }
				 }else{
					 alert("保存失败");
				 }
			 }
		});
		
	});
	
	//行业分类关联事件
	$(".cases1").change(function(){
		var parentId = $(".cases1").find("option:selected").val();
		var typeList = getTypeByParentId(parentId);
		$(".cases2").empty();
		var len = typeList.length;
		for(var i=0;i<len;i++){
			var ti = typeList[i].columns;
			var $op = $(
				'<option value="'+ti.id+'">'+ti.name+'</option>'
			);
			$(".cases2").append($op);
		}
		
	});
	
	//行业分类关联事件
	$(".industrys1").change(function(){
		var parentId = $(".industrys1").find("option:selected").val();
		var typeList = getTypeByParentId(parentId);
		$(".industrys2").empty();
		var len = typeList.length;
		for(var i=0;i<len;i++){
			var ti = typeList[i].columns;
			var $op = $(
				'<option value="'+ti.id+'">'+ti.name+'</option>'
			);
			$(".industrys2").append($op);
		}
		
	});
	
	//市关联事件
	$(".addresss1").change(function(){
		$(".addresss2").empty();
		$(".addresss3").empty();
		var parentId = $(".addresss1").find("option:selected").val();
		var typeList = getAeraByParentId(parentId);
		var len = typeList.length;
		for(var i=0;i<len;i++){
			var ti = typeList[i].columns;
			var $op = $(
				'<option value="'+ti.id+'">'+ti.name+'</option>'
			);
			$(".addresss2").append($op);
		}
		var areapid = typeList[0].columns.id;
		var areaList = getAeraByParentId(areapid);
		var len2 = areaList.length;
		for(var i=0;i<len2;i++){
			var ti = areaList[i].columns;
			var $op = $(
				'<option value="'+ti.id+'">'+ti.name+'</option>'
			);
			$(".addresss3").append($op);
		}
	});
	
	//区关联事件
	$(".addresss2").change(function(){
		var parentId = $(".addresss2").find("option:selected").val();
		var typeList = getAeraByParentId(parentId);
		$(".addresss3").empty();
		var len = typeList.length;
		for(var i=0;i<len;i++){
			var ti = typeList[i].columns;
			var $op = $(
				'<option value="'+ti.id+'">'+ti.name+'</option>'
			);
			$(".addresss3").append($op);
		}
		
	});
	
	//根据id获取案例信息
	function getCase(caseId){
		var caseInfo;
		$.ajax({
			url:basePath+'Library/serviceCase/getCaseById/'+companyId,
			async : false,
			data:{
				caseId : caseId
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 caseInfo=data;
			 }
		});
		return caseInfo;
	}
	
	//根据父id获取类型列表
	function getTypeByParentId(parentId){
		var typeInfo;
		$.ajax({
			url:basePath+'Library/serviceCase/getTypeByParentId/'+companyId,
			async : false,
			data:{
				parentId : parentId
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 typeInfo=data;
			 }
		});
		return typeInfo;
	}
	
	////根据id获取类型信息
	function getTypeById(id){
		var typeInfo;
		$.ajax({
			url:basePath+'Library/serviceCase/getTypeById/'+companyId,
			async : false,
			data:{
				id : id
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 typeInfo=data;
			 }
		});
		return typeInfo;
	}
	
	//根据id获取地址信息
	function getAeraById(id){
		var area;
		$.ajax({
			url:basePath+'Library/serviceCase/getAeraById/'+companyId,
			async : false,
			data:{
				id : id
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 area=data;
			 }
		});
		return area;
	}
	
	//根据父id获取地址列表
	function getAeraByParentId(parentId){
		var area;
		$.ajax({
			url:basePath+'Library/serviceCase/getAeraByParentId/'+companyId,
			async : false,
			data:{
				parentId : parentId
			 },
			 type:'post',
			 dataType:'json',
			 success:function(data) {
				 area=data;
			 }
		});
		return area;
	}
	
	//图片1
	//上传图片
	$("#casePic1").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			$(".casePic1").val(imgUrl);
			$(".showCasePic1").attr("id",imgUrl);
		});
	});
	
	//预览图片
	$(".showCasePic1").click(function(){
		var imgUrl = $(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除图片
	$(".deleteCasePic1").click(function(){
		$(".casePic1").val("");
		$(".showCasePic1").attr("id","");
	});
	
	//图片2
	//上传图片
	$("#casePic2").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			$(".casePic2").val(imgUrl);
			$(".showCasePic2").attr("id",imgUrl);
		});
	});
	
	//预览图片
	$(".showCasePic2").click(function(){
		var imgUrl = $(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除图片
	$(".deleteCasePic2").click(function(){
		$(".casePic2").val("");
		$(".showCasePic2").attr("id","");
	});
	
	//图片3
	//上传图片
	$("#casePic3").on("change",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			$(".casePic3").val(imgUrl);
			$(".showCasePic3").attr("id",imgUrl);
		});
	});
	
	//预览图片
	$(".showCasePic3").click(function(){
		var imgUrl = $(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除图片
	$(".deleteCasePic3").click(function(){
		$(".casePic3").val("");
		$(".showCasePic3").attr("id","");
	});
	
	//案例的点击事件
	$(".serviceCaseUl").on("click",".caseNameForClick",function(){
		var url = $(this).parent().find(".lookCase").attr("href");
		window.open(url);
	});
	
	function postStandUrl(url,params){
	    var turnForm = document.createElement("form");
	    //一定要加入到body中！！
	    document.body.appendChild(turnForm);
	    turnForm.method = 'post';
	    turnForm.action = url;
	    turnForm.target = '';
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
	
	//分页插件
	paging($("#serviceCasePagingDiv"),totalPage,1,function(divElSelector,obj,first){
		if(!first){
			var userId = $(".caseUserId").val();
			var url = basePath+"Library/serviceCase/getServiceCaseByPageNumber/"+companyId;
			$.post(url,{
				userId:userId,
				pageNumber:obj.curr
			},function(data,status){
				if(data.length>0){
					reloadServiceCase(data);
				}
			});
		}
	});
	
	//更新页面服务案例
	function reloadServiceCase(serviceCases){
		var ulEl = $(".service_time ul");
		var liEls = ulEl.find("li:not(.fixed)");
		var liElClone=liEls.eq(0).clone();
		liEls.remove();
		var serviceCaseDesc = ulEl.find(".serviceCaseDesc");
		var serviceCase;
		var liEl;
		for(index in serviceCases){
			serviceCase=serviceCases[index];
			liEl=liElClone.clone();
			liEl.find("img").attr("src",serviceCase.pic1);
			liEl.find("p").eq(0).text(serviceCase.case_name);
			liEl.find("p").eq(1).text("发布时间："+(serviceCase.create_date==null?"":serviceCase.create_date.substring(0,10)));
			liEl.find("p").eq(2).text("施工时间："+(serviceCase.start_time==null?"":serviceCase.start_time.substring(0,10)));
			liEl.find("a").eq(0).attr("href",ctx+"/Library/enterpriseCustom/"+companyId+"-case"+serviceCase.id);
			liEl.find("a").eq(1).attr("id",serviceCase.id);
			liEl.find("input").eq(0).val(serviceCase.case_desc);
			liEl.find("input").eq(1).val(serviceCase.user_id);
			serviceCaseDesc.after(liEl);
		}
	}
	
	$(".startTime").click(function(){
		laydate({elem: this, festival: true});
	});
	$(".endTime").click(function(){
		laydate({elem: this, festival: true});
	});
	
});
