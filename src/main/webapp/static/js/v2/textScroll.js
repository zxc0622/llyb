﻿// JavaScript Document
(function($){
	$.fn.topScroll = function(s){
	//默认配置
	var defaults = {
		speed:40  //滚动速度,值越大速度越慢
	};
	
	var options ={
		speed:s*10
	}
	
	var opts = $.extend({}, defaults, options),intId = [];
	
	function marquee(obj, step){
		obj.css("overflow","hidden");
		obj.find("ul").animate({
			marginTop: '-=1'
		},0,function(){
				var s = Math.abs(parseInt($(this).css("margin-top")));
				if(s >= step){
					$(this).find("li").slice(0, 1).appendTo($(this));
					$(this).css("margin-top", 0);
				}
			});
		}
		
		this.each(function(i){
			var sh = $(this).find("li").height(),speed = opts["speed"],_this = $(this);
			intId[i] = setInterval(function(){
				if(_this.find("ul").height()<=_this.height()){
					clearInterval(intId[i]);
				}else{
					marquee(_this, sh);
				}
			}, speed);

			_this.hover(function(){
				clearInterval(intId[i]);
			},function(){
				intId[i] = setInterval(function(){
					if(_this.find("ul").height()<=_this.height()){
						clearInterval(intId[i]);
					}else{
						marquee(_this, sh);
					}
				}, speed);
			});
		
		});

	}

})(jQuery);