/** showProdSubpage.jsp js start * */
$(function() {
	//点击左边产品类型右边显示产品
	$(".main-page .nav div").click(function() {
		var $this = $(this);
		var index = $this.index();
		
		var content=$(".content");
		var ulEl=$(".content ul").eq(index);
		var pageNumber=$(content.find(".pagenow")[index]).text();
		var typeId=$this.attr("id");
		if(ulEl.find("li.prod").length==0){
			getProdList(pageNumber,typeId,ulEl,setProdList);
		}
		
		var l = -(index * 640);
		$(".main-page .nav div").removeClass("on");
		$(".main-page .nav div").eq(index).addClass("on");
		$(".main-page .content div:eq(0)").stop().animate({
			"margin-top" : l
		}, 500);
	});
	
	//点击页码获取数据
	function getProdListByPageNumber(divElSelector,pageNumber){
		var ulEl=divElSelector.prev();
		var typeId=$(".nav div").eq(ulEl.parent().index()).attr("id");
		getProdList(pageNumber,typeId,ulEl,setProdList);
	};
	
	//获取产品列表,调用回调函数
	function getProdList(pageNumber,typeId,ulEl,callback){
		if(pageNumber==0||pageNumber==undefined||pageNumber==""){
			pageNumber=1;
		}
		var url=basePath+"Library/showProd/getProdByUserIdAndProdType/"+companyId;
		$.ajax({
			url:url,
			data:{
				pageNumber:pageNumber,
				typeId:typeId
			},
			async:false,
			success:function(data,status){
				var prodList=data;
				if(typeof callback == "function"){
					callback(pageNumber,ulEl,prodList);
				}
			}
		});
	}
	
	//设置页面产品
	function setProdList(pageNumber,ulEl,prodList){
		var addProdEl=ulEl.find("li.addProd");
		var liElClone=addProdEl.clone();
		var prodMsg;
		var liEl;
		ulEl.find("li").remove(".prod");
		for(index in prodList){
			prodMsg=prodList[index];
			if(index==0){
				if(ulEl.next().children().length==0){
					totalPage=prodMsg.totalPage;
					paging(ulEl.next(),totalPage,1,function(divElSelector,obj,first){
						if(!first){
							getProdListByPageNumber(divElSelector,obj.curr);
						}
					});
				}
			}else{
				liEl=liElClone.clone();
				liEl.attr("id",prodMsg.id);
				liEl.show();
				liEl.removeClass("addProd");
				liEl.addClass("prod");
				liEl.find("img").attr("src",prodMsg.pic1);
				liEl.find("p").text(prodMsg.pro_name);
				addProdEl.before(liEl);
			}
		}
	}
	
	$(".Joedar_facility").on("mouseover mouseenter mouseout mouseleave","li:not(.addProd)",function(event) {
		var liEl=$(this);
		var notExist=liEl.find(".zhe_z").length==0?true:false;
		if(notExist){
			if(liEl.find(".addProd").length==0){
				var html='<div class="zhe_z" style="display:none;"></div>'+
				'<div class="box-bar2" style="display:none";>'+
				'<a href="javascript:void(0);" title="删除" class="delProd">删除</a>'+
				'<a href="javascript:void(0);" title="编辑" class="showbox20 editProd">编辑</a>'+
				'</div>';
				liEl.prepend(html);
			}
		}
		shadeLayer(event, liEl.find(".zhe_z"),liEl.find(".box-bar2"));
	});
	
	//关闭遮罩、设置窗口
	$("body").on("click",".close",function() {
		$("#TB_overlayBG").css("display", "none");
		$(".box2").css("display", "none");
		$(".box20").css("display", "none");
	});
	
	//根据产品id获取产品信息
	function getProdById(prodId,callback){
		var url=basePath+"Library/showProd/getProdById/"+companyId+"?prodId="+prodId;
		$.get(url,function(data,status){
			var prod=data;
			if(typeof callback == "function"){
				callback(prod);
			}
		});
	}
	
	//显示产品操作窗口
	var box20Content;
	$("body").on("click",".showbox20",function(){
		var showbox20El = $(this);
		var box20El=$(".box20");
		if($(window).height() < $(".box20").height()){
			box20El.css("height",$(window).height());
		}
		if(box20Content==undefined){
			box20Content=box20El.html();
		}else{
			box20El.empty();
			box20El.append(box20Content);
		}
		initProdType();
		initAreaMsg();
		initProdUnit();
		
		//判断是否新增编辑产品，若是则需要初始化设置面板的数据
		if(showbox20El.hasClass("editProd")){
			var liEl=showbox20El.parents("li").eq(0);
			var prodId=liEl.attr("id");
			getProdById(prodId,function(prod){
				box20El.find(".mainlist").attr("id",prodId);
				
				$(".pastTime").val(prod.past_date);
				
				//设置产品类型
				box20El.find(".firstType option.type"+prod.type_first).attr("selected","selected");
				prodType(prod.type_first,function(data){
					setProdType($(".secondType"),data);
					box20El.find(".secondType option.type"+prod.type_second).attr("selected","selected");
				});
				prodType(prod.type_second,function(data){
					setProdType($(".thirdType"),data);
					box20El.find(".thirdType option.type"+prod.type_third).attr("selected","selected");
				});
				
				box20El.find(".prodName").val(prod.pro_name);
				
				//设置产品来源地
				box20El.find(".firstArea option.area"+prod.prov_id).attr("selected","selected");
				area(prod.prov_id,function(data){
					setAreaMsg($(".secondArea"),data);
					box20El.find(".secondArea option.area"+prod.city_id).attr("selected","selected");
				});
				
				box20El.find(".prodDesc").val(prod.pro_desc);
				
				//图片设置
				var i=1;
				var picUrl="";
				box20El.find(".prodPicDiv").each(function(){
					picUrl=eval('prod.pic'+i);
					picDivInputEl=$(this).find("input");
					picDivInputEl.eq(0).val(picUrl);
					picDivInputEl.eq(3).attr("id",picUrl);
					i+=1;
				});
				
				box20El.find(".lowPrice").val(prod.low_price);
				box20El.find(".highPrice").val(prod.high_price);
				box20El.find(".amount").val(prod.amount);
			});
		}
		
		$("#TB_overlayBG").css({
			display : "block",
			height : $(document).height()
		});
		box20El.css({
			left : ($("body").width() - $(".box20").width()) / 2 - 20 + "px",
			top : ($(window).height() - $(".box20").height()) / 2 + "px",
			display : "block"
		});
	});
	
	/**产品类型下拉选择 js start**/
	//一级分类改变触发事件
	$(".box20").on("change",".firstType",function(){
		var selected=$(this).find("option:selected");
		var text=selected.text();
		var id=selected.val();
		prodType(id,function(data){
			setProdType($(".secondType"),data);
		});
	});
	
	//二级分类改变触发事件
	$(".box20").on("change",".secondType",function(){
		var selected=$(this).find("option:selected");
		var text=selected.text();
		var id=selected.val();
		prodType(id,function(data){
			setProdType($(".thirdType"),data);
		});
	});
	
	//初始化产品分类
	function initProdType(){
		var firstTypeSelector=$(".firstType"); 
		var secondTypeSelector=$(".secondType"); 
		var thirdTypeSelector=$(".thirdType"); 
		prodType(932,function(data){
			setProdType(firstTypeSelector,data);
		});
		var firstTypeId=$(firstTypeSelector.find("option")[0]).val();
		prodType(firstTypeId,function(data){
			setProdType(secondTypeSelector,data);
		});
		var secondTypeId=$(secondTypeSelector.find("option")[0]).val();
		prodType(secondTypeId,function(data){
			setProdType(thirdTypeSelector,data);
		});
	}
	
	//产品分类回调函数
	function prodType(typeId,callback){
		var url = basePath+"Library/showProd/getProdType?typeId="+typeId;
		$.ajax({
			url:url,
			async:false,
			success:function(data,status){
				if(typeof callback == "function"){
					callback(data);
				}
			}
		});
	}
	
	//设置产品分类
	function setProdType(selector,types){
		var ProdType=$(selector);
		if(types.length==0){
			return;
		}
		ProdType.empty();
		var type;
		var option = '<option value=""></option>';
		var optionEl;
		for(index in types){
			type=types[index];
			optionEl=$(option);
			optionEl.val(type.id);
			optionEl.addClass("type"+type.id);
			optionEl.text(type.name);
			ProdType.append(optionEl);
		};
	}
	/**产品类型下拉选择 js end**/
	
	/**区域地址下拉选择 js start**/
	//区域地址信息回调函数
	function area(areaId,callback){
		var url = basePath+"Library/showProd/getAreaList?areaId="+areaId;
		$.ajax({
			url:url,
			async:false,
			success:function(data,status){
				if(typeof callback == "function"){
					callback(data);
				}
			}
		});
	}
	
	//设置区域地址信息
	function setAreaMsg(selector,areas){
		var areaSelector=$(selector);
		areaSelector.empty();
		var area;
		var option = '<option value=""></option>';
		var optionEl;
		for(index in areas){
			area=areas[index];
			optionEl=$(option);
			optionEl.val(area.id);
			optionEl.addClass("area"+area.id);
			optionEl.text(area.name);
			areaSelector.append(optionEl);
		}
	}
	
	//初始化区域地址
	function initAreaMsg(){
		var firstAreaSelector=$(".firstArea"); 
		var secondAreaSelector=$(".secondArea"); 
		area(1,function(data){
			setAreaMsg(firstAreaSelector,data);
		});
		var firstAreaId=$(firstAreaSelector.find("option")[0]).val();
		area(firstAreaId,function(data){
			setAreaMsg(secondAreaSelector,data);
		});
	}
	
	//一级区域地址改变触发事件
	$(".box20").on("change",".firstArea",function(){
		var selected=$(this).find("option:selected");
		var text=selected.text();
		var id=selected.val();
		area(id,function(data){
			setAreaMsg($(".secondArea"),data);
		});
	});
	/**区域地址下拉选择 js end**/
	
	//产品周期
	function initPordPastDate(){
		var url = basePath+"Library/showProd/getPastDate";
		$.ajax({
			url:url,
			async:false,
			success:function(data,status){
				var pastDateEl=$(".pastDate");
				pastDateEl.empty();
				var pastDate;
				var option = '<option value=""></option>';
				var optionEl;
				for(index in data){
					pastDate=data[index];
					optionEl=$(option);
					optionEl.text(pastDate.label);
					optionEl.val(pastDate.value);
					pastDateEl.append(optionEl);
				}
			}
		});
	}
	//产品单位
	function initProdUnit(){
		var url = basePath+"Library/showProd/getProdUnit";
		$.ajax({
			url:url,
			async:false,
			success:function(data,status){
				var prodUnitEl=$(".prodUnit");
				prodUnitEl.empty();
				var prodUnit;
				var option = '<option value=""></option>';
				var optionEl;
				for(index in data){
					prodUnit=data[index];
					optionEl=$(option);
					optionEl.text(prodUnit.label);
					optionEl.val(prodUnit.value);
					prodUnitEl.append(optionEl);
				}
			}
		});
	}
	
	//获取设置窗口产品信息
	function getProdBySeting(){
		var prodMsg={};
		prodMsg.firstType=$(".firstType option:selected").val();
		prodMsg.secondType=$(".secondType option:selected").val();
		prodMsg.thirdType=$(".thirdType option:selected").val();
		prodMsg.prodName=$(".prodName").val();
		prodMsg.firstArea=$(".firstArea option:selected").val();
		prodMsg.secondArea=$(".secondArea option:selected").val();
		prodMsg.pastDate=$(".pastTime").val();
		prodMsg.prodUnit=$(".prodUnit option:selected").val();
		prodMsg.prodUnitDesc=$(".prodUnit option:selected").text();
		prodMsg.prodDesc=$(".prodDesc").val();
		prodMsg.lowPrice=$(".lowPrice").val();
		prodMsg.highPrice=$(".highPrice").val();
		prodMsg.amount=$(".amount").val();
		prodMsg.priceCheck=$(".isCheck").is(':checked');
		prodMsg.prodId=$(".Joedar_facility .mainlist").attr("id");
		var picUrl="";
		var value;
		$(".prodPicUrl").each(function(){
			value=$(this).val();
			if(value==undefined||value==""){
				
			}else{
				picUrl+=$(this).val()+",";
			}
		});
		prodMsg.pic=picUrl;
		return JSON.stringify(prodMsg);
	}
	
	//确认提交产品
	$(".Joedar_facility").on("click",".submintProd",function(){
		var prodMsg=getProdBySeting();
		var url=basePath+"Library/showProd/uploadProd";
		$.post(url,{
			prodMsg:prodMsg
		},function(data,status){
			if(data==false){
				layer.msg("操作失败！");
			}else{
				prodMsg=JSON.parse(prodMsg);
				var ulEl = $(".contentsub ul");
				ulEl.find("li.addProd").prev().remove();
				var liEl=ulEl.find("li").eq(0).clone();
				liEl.attr("id",data);
				liEl.find("p").text(prodMsg.prodName);
				var img=prodMsg.pic;
				if(img!=""){
					img=img.split(",")[0];
				}
				liEl.find("img").attr("src",img);
				ulEl.prepend(liEl);
			}
			$(".close").click();
		});
	});
	
	//上传图片
	$(".Joedar_facility").on("change",".prodPic",function(){
		uploadImgReturnUrl(this,function(imgUrl,thisObj){
			var nextEl=thisObj.next();
			nextEl.attr("id",imgUrl);
			thisObj.parent().find(".prodPicUrl").val(imgUrl);
		});
	});
	
	//图片预览
	$(".Joedar_facility").on("click",".showImg",function(){
		var imgUrl=$(this).attr("id");
		showImg(imgUrl);
	});
	
	//删除图片
	$(".Joedar_facility").on("click",".deleteImg",function(){
		var prodPicDivEl=$(this).parent();
		prodPicDivEl.find(".prodPicUrl").val("");
		prodPicDivEl.find(".showImg").attr("id","");
	});
	
	//删除产品
	$(".Joedar_facility").on("click",".content .delProd",function(){
		var liEl=$(this).parent().parent();
		var prodId=liEl.attr("id");
		var url=basePath+"Library/showProd/delProd?prodId="+prodId;
		$.get(url,function(data,status){
			if(data){
				liEl.remove();
			}
			$(".close").click();
		});
	});
	
	//初始化 .right .content的div页面结构
	var initProdList=function (){
		var cloneDivEl=$(".Joedar_facility .content div").eq(0).clone(true);
		cloneDivEl.find("li").remove(".prod");
		var contentEl=$(".Joedar_facility .content");
		var tempDiv;
		paging($("#p0"),totalPage,1,function(divElSelector,obj,first){
			if(!first){
				getProdListByPageNumber(divElSelector,obj.curr);
			}
		});
		for(var i=1;i<typeSum;i++){
			tempDiv=cloneDivEl.clone(true);
			tempDiv.remove(".prod");
			tempDiv.find(".pagination").attr("id","p"+i);
			contentEl.append(tempDiv);
		};
	}();
	
});
/** showProdSubpage.jsp js end **/