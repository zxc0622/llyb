/**
 * 简单实用的支持中文的自动完成插件
 * 
 * Copyright (c) 2011 luckylzs@gmail.com
 * GPL licenses: 
 * http://www.gnu.org/licenses/gpl.html
 * 
 * @author Victor(luckylzs@gmail.com)
 * 
 * @param url          	获得数据的URL
 * @param q            	查询用关键字名称
 * @param boxId			外边框ID
 * @param boxCls		外边框Class
 * @param tblId			内表格ID
 * @param tblCls		内表格Class
 * @param format		返回数据格式,默认为null,如返回JSON数据为[{id:'aaa',name:'ccccc'}]
 * 						format:['name','id'],其中第一个项会作为text显示出来,其它项会作为afterSelect中对象属性
 * @param processData	对返回的数据进行预处理 最后 return 处理过的数据即可
 * @param showList		如何显示数据
 * @param select		选中一条记录时触发
 * @param afterSelect	选中一条记录后触发
 * 
 * version v1.1-beta
 * 
 * @base jquery.dimensions.js (http://plugins.jquery.com/project/dimensions)
 * 
 * @example
 * $("#input_id").zhAutoComplete({url:'test.php'});
 * 
 * @example override actions
 * $("#input_id").zhAutoComplete({url:'test.php',processData:function(data}{},afterSelect: function(td){td.id ....});
 */

jQuery.fn.zhAutoComplete = function(options){

	var input = $(this);
	$(input).attr("autocomplete","off");
	var offset = {};
	$(this).offset(null,offset);
	offset.width = $(this).innerWidth();
	offset.height = $(this).outerHeight();
	offset.padding = $(this).outerWidth()-$(this).innerWidth();
	
	var settings = {
		url: 'test.php',
		q  : 'q',
		type: 'json',
		boxId: '_zhAC_Box',
		boxCls: '_zhAC_Box_Cls',
		tblId: '_ZhAC_Table',
		tblCls: '_ZhAC_Table_Cls',
		offset: offset,
		format:null,
		processData : function(data){
			return data;
		},
		showList : function(data){
			if($("#"+settings.boxId).length>0)
				$("#"+settings.boxId).remove();
			if(data.length == 0)
				return;
			var top = settings.offset.top+settings.offset.height;
			var left = settings.offset.left-1;
			var width = settings.offset.width-1;
			
			var box = $("<div id='"+settings.boxId+"' class='"+settings.boxCls+"'></div>");
			var table = $("<table id='"+settings.tblId+"' class='"+settings.tblCls+"'></table>");
			
			$(box).css({'background-color':'white','padding-left':settings.offset.padding,position:'absolute',border:'1px solid #817F82',top: top,left: left,width: width,'z-index':'9999'});
			$(table).attr("cellpadding",2).attr("cellspacing",0).attr("width","100%");
			
			for(i=0;i<data.length;i++){
				var tr = $("<tr style='cursor:pointer'></tr>");
				if(settings.format){
					var td = $("<td>"+data[i][settings.format[0]]+"</td>");
					for(j=1;j<settings.format.length;j++){
						$(td).attr(settings.format[j],data[i][settings.format[j]]);
					}
				}else{
					var td = $("<td>"+data[i]+"</td>");
				}
				$(tr).append(td);
				$(table).append(tr);
			}
			
			$(box).append(table);
			$("body").append(box);
			
			$("#"+settings.tblId+" tr")
				.bind("mouseover",function(){$(this).css("background-color","#E2EAFF")})
				.bind("mouseout",function(){$(this).css("background-color","white")});
			
			$("#"+settings.tblId+" tr td")
				.bind("click",settings.select);
			$(document).bind("click",function(){$(box).remove()});
		},
		select : function(){
			$(input).val($(this).text());
			settings.afterSelect($(this));
		},
		afterSelect : function(td){
			console.log("calling afterSelect function...");
		}
	};
	
	options = options || {};
	$.extend(settings,options);
	
	$(this).bind("keyup",function(event){
		if(event.keyCode>=37 && event.keyCode<=40)
			return;
		var keyword = $.trim($(this).val());
		param = settings.q+"="+encodeURIComponent(keyword);
		$.post(settings.url,param,function(data){
			var ds = settings.processData(data);
			settings.showList(ds);
		},settings.type);
	});
};