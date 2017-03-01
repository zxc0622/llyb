        
			$(function(){
                Myselect();
                var winWidth = $(window).width();
                var halfPosition = (winWidth - $(".main").width())/2;
                $(".banner_left").css({left:halfPosition+$(".main").width()-$(".banner_left").width()});  
                $(".b_l_img").css({left:halfPosition+$(".main").width()-10});
                
                
            });
            // 模拟select标签
            var counts=0;
            var mount=[];
            var types=[];
            var pid="";
            var details=[];
            Array.prototype.indexOf = function(val) {
            	for (var i = 0; i < this.length; i++) {
            		if (this[i] == val) return i;
            	}
            	return -1;
            };
            Array.prototype.remove = function(val) {
            		var index = this.indexOf(val);
            		if (index > -1) {
            			this.splice(index, 1);
            		}
            };	
            function Myselect(){
                // 选中数量
                $(document).on("click",".myselect .myoption",function(){
                    var that = $(this);
                    if(that.hasClass('select_extend')){
                        that.next().slideUp();
                        that.removeClass('select_extend').html("您已选择"+counts+"项");
                        //收起并重新添加下方div   先remove掉
                        $(".s_r_l_div").empty();
	       				$(".s_r_l_fanye").empty();
	       				$(".myselect").blur();
		       			$(".s_r_l_fanye").focus();
                        handler_sel(counts);
                    }else{
                        that.html("您已选择"+counts+"项,点击收起").addClass('select_extend');
                        that.siblings("ul").slideDown(function() {
                            $(this).find("li").off().click(function(){
                                var that=$(this);
                                if(that.hasClass("sel")){
                                    that.removeClass("sel");
                                    mount.remove($(this).attr("data-m"));
                                    counts-=1;
                                }else{
                                    $(this).addClass("sel");
                                    counts+=1;
                                    mount.push($(this).attr("data-m"));

                                }
                                $(".myselect .myoption").html("您已选择"+counts+"项,点击收起");
                            });
                        });
                        
                    }
                }).on("blur",".myselect",function(){
                    $(this).find("ul").slideUp();
                    $(this).find(".myoption").removeClass('select_extend').html("您已选择"+counts+"项");
                    //收起并重新添加下方div   先remove掉
                    $(".s_r_l_div").empty();
	       			$(".s_r_l_fanye").empty();
	       			$(".myselect").blur();
	       			$(".s_r_l_fanye").focus();
                    handler_sel(counts);
                })
            }

            // 收起myselect调用
            function handler_sel(cou){
                var resultdiv = $(".select_result");
                resultdiv.show();
                resultdiv.find(".s_r_l_div,.s_r_l_fanye,.s_r_r").empty();
                var am = mount.length;
                var surhead= $("#surHead option:selected").val();
                if(surhead == ''||mount==""){ return ;}
            	$.ajax({
         			type : "POST",
       				url : "getSurDetail",
       				data : "surhead=" +surhead+"&surline="+mount ,
       				dataType : 'json',
       				success : function(data) {
       					if(data == null){return ;}
       					$(".select_result").css("display","block");
       					$(".s_r_l_div").empty();
    	       			$(".s_r_l_fanye").empty();
    	       			
       					for(var i=1;i<=am;i++){
       						var htmls = "<div class=\"per_count\">";
	       					$.each(data,function(index, item) {
	       						 var a = i-1;
		       					 if(mount[a] == item.Survey_lines_id){
		       						htmls+="<div class=\"per_check fl\"><div class=\"check_right\" data-id=\""+item.Survey_detail_id+"\"></div><span>"+item.Survey_detail_type_name+"</span></div>";
		       					}
	       					});
	       				    //按cou 插入翻页span,per_count
	       				    htmls+="</div>";
	       					$(".s_r_l_div").append(htmls);
	       					$(".s_r_l_fanye").append('<span>'+i+'</span>');
       				 }
       				
       	           //绑定事件 翻页,对号
       	                $(".s_r_l_fanye span").off().click(function(){
       	                    var that=$(this);
       	                    var index = that.index();
       	                    that.addClass("fanye-act").siblings().removeClass("fanye-act");
       	                    $(".s_r_l_div").find(".per_count").eq(index).show().siblings().hide();
       	                });
       	                $(".per_count .check_right").off().click(function(){
       	                    var that = $(this);
       	                    if(that.hasClass('check_right_sel')){
       	                        that.removeClass('check_right_sel');
       	                        var sub = that.next().html();
       	                        $(".s_r_r p").each(function(){
       	                            if($(this).html()==sub){
       	                                $(this).remove();
       	                             	types.remove(that.attr("data-id"));
       	                            }
       	                        });
       	                    }else{
       	                        that.addClass('check_right_sel');
       	                        var sub = that.next().html();
       	                        types.push(that.attr("data-id"));
       	                        $(".s_r_r").append('<p>'+sub+'</p>');
       	                    }
       	                });
       	             $(".s_r_l_fanye span:first-child").trigger('click');
       	                
       				}
       			}); 
            	
            	
            }
           
            
            $(function(){
            	pop=0;
            	
            	$(".b_l_nav_sel").parent().attr('data-in',"0");
                var winWidth = $(window).width();
                var halfPosition = (winWidth - $(".main").width())/2;
                $(".banner_left").css({left:halfPosition+$(".main").width()-$(".banner_left").width()});  
                $(".b_l_img").css({left:halfPosition+$(".main").width()-10});
                //加载市
                $(".b_l_f_province").change(selectCity);
                //弹出框环评加载市
                $(".pop_province").change(selectCity);
              	//弹出框检测加载市
                $(".sur_province").change(selectCity);
                //加载环评县
                $(".pop_city").change(selectCounty);
              	//加载检测县
                $("#surcity").change(selectCounty);
                
                //立即申请
                $(".banner_left_submit").click(submit);
                //环评加载line
                $(".row-xiangmuleibie:eq(0) select:eq(0)").change(loadLineOff);
                //环评加载details
                $(".row-xiangmuleibie:eq(0) select:eq(1)").change(loadDetailsOff);
                //检测加载line
                $(".row-xiangmuleibie:eq(1) select").change(loadSurOff);
                //检测加载details
                //$(".row-xiangmuleibie:eq(0) select:eq(1)").change(loadDetailsSur);
                //环评弹出框的提交
                $(".pl_index_shenqing .btn").click(envSubmit);
              	//检测弹出框的提交
                $("#submitsecond").click(monSubmit);
            	var prov_id = $(".b_l_f_province option:selected").val();
            	var city_id = $(".b_l_f_city option:selected").val();
                $(".pop_province option").each(function (){
						if(prov_id==$(this).val()){
							$(this).attr('selected','selected');
						}
					}); 
                
            });
            function selectCity(){
               var province="";
               if(pop == 0){
            	   province = $(".b_l_f_province option:selected").val();
            	   $(".b_l_f_city").text('');
               }else if(pop==1){
            	   province = $(".pop_province option:selected").val();
            	   $(".pop_city").text('');
               }else if(pop == 2){
            	   province = $(".sur_province option:selected").val();
            	   $("#surcity").text('');
               }
          	   if(province == "省"){
          		   var htmlss="<option value=''>市</option>";
          		   if(pop==0){
	          		   $(".b_l_f_city select").append(htmlss);
          		   }else if(pop == 1){
          			 $(".pop_city select").append(htmlss);
          		   }else if(pop ==2){
          			 $("#surcity").append(htmlss);
          		   }
          		   return;
          	   }else{
	            	   $.ajax({
	         			type : "POST",
	       				url : "getCity",
	       				data : "province=" + province,
	       				dataType : 'json',
	       				success : function(data) {
	       					var htmls = "<option value=''>市</option>";
	       					$.each(data,function(index, item) {
	       						htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
	       					});
	       				
	       				 	if(pop==0){
	  	          		    	$(".b_l_f_city").append(htmls);
	            		    }else if(pop == 1){
	                 			 $(".pop_city ").append(htmls);
	               		    }else if(pop ==2){
	               			 $("#surcity").append(htmls);
	               		    }
	       				}
	       			});
          		}
            }
            function submit(){
            	var index = "";
            	var name = "";
            	var tel = "";
            	var comp_name = "";
            	var remarks = "";
            	var prov_id = "";
            	var city_id = "";
            	if('${inname}'){
            		index='${index}';
            		name='${inname}';
            		tel='${intel}';
            		comp_name='${incom}';
            		remarks = '${inre}';
            		prov_id='${inprov}';
            		city_id= '${incity}';
            	}else{
            		index = $(".b_l_nav_sel").parent().attr('data-in');
                	name = $("form input").eq(0).val();
                	tel = $("form input").eq(1).val();
                	comp_name = $("form input").eq(2).val();
                	remarks = $("form input").eq(3).val();
                	prov_id = $(".b_l_f_province option:selected").val();
                	city_id = $(".b_l_f_city option:selected").val();
            	}
                var myreg = /^1\d{10}$/;
            	if(name==""||tel==""||comp_name==""||remarks==""||prov_id==""||city_id==""){
            		showMess("请先完善信息");
            		return;
            	}else if(/^13d{9}$/g.test(tel)||(/^15[8,9]d{8}$/g.test(tel))){
            		showMess("请输入正确的手机号码");
            		return;
            	}else{
            		
            		var index= $(".b_l_nav .b_l_nav_sel").parent("li:visible").index();
            		if('${inname}'){
            			index='${index}';
            		}
     		        if(index==1){
	            		$(".pop_province option").each(function (){
	    					if(prov_id==$(this).val()){
	    						$(this).attr('selected','selected');
	    					}
	    				});
	            		$(".pop_city option").each(function (){
	    					if(prov_id==$(this).val()){
	    						$(this).attr('selected','selected');
	    					}
	    				});
     		        }else if(index==2){
     		        	$(".sur_province option").each(function (){
	    					if(prov_id==$(this).val()){
	    						$(this).attr('selected','selected');
	    					}
	    				});
     	            	$("#surcity").each(function (){
	    					if(prov_id==$(this).val()){
	    						$(this).attr('selected','selected');
	    					}
	    				});
     		        }
            		$.ajax({
             			type : "POST",
           				url : "saveBase",
           				data : "name=" + name+"&tel="+tel+"&comp_name="+comp_name+"&remarks="+remarks+"&prov_id="+prov_id+"&city_id="+city_id+"&index="+index,
           				dataType : 'json',
           				success : function(data) {
           						pid=data;
           						var index= $(".b_l_nav .b_l_nav_sel").parent("li:visible").index();
                  		         if(index==1){
                  		        	pop=1;
                  		            $(".pl_index_shenqing").show();
                  		            $(".popumask").show();
                  		         }else if(index==2){
                  		        	pop=2;
                  		            $(".pl_index_shenqing_jiance").show();
                  		            $(".popumask").show();
                  		          }
           				}
           			}); 
            	}
            	
            }
            function sheng(){
            	var prov = $(".b_l_f_province option:selected").val();
		          $(".pop_province option").each(function (){
					if(prov==$(this).val()){
						$(this).attr('selected','selected');
					}
				});
            }
            function selectCounty(){
            	   var city = "";
            	   if(pop ==1){
            		   city = $(".pop_city option:selected").val();
            		   $("#county").text('');
            	   }else if(pop == 2){
            		   city = $("#surcity").val();
            		   $("#surcountry").text('');
            	   }
            	   if(city == "市"){
            		   var htmlss="";
            		   if(pop ==1){
            			   $("#county").append(htmlss);
                	   }else if(pop == 2){
                		   $("#surcountry").append(htmlss);
                	   }
            		   return;
            	   }else{
  	            	   $.ajax({
  	         			type : "POST",
  	       				url : "getCounty",
  	       				data : "city=" + city,
  	       				dataType : 'json',
  	       				success : function(data) {
  	       					var htmls = "";
  	       					$.each(data,function(index, item) {
  	       						htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
  	       					});
  	       				 if(pop ==1){
              			   $("#county").append(htmls);
                  	     }else if(pop == 2){
                  		   $("#surcountry").append(htmls);
                  	     }
  	       				}
  	       			  });
            		}
            }
            function loadLineOff(){
            	var offhead= $("#offhead option:selected").val();
            	$.ajax({
	         			type : "POST",
	       				url : "getOffLine",
	       				data : "offhead=" +offhead ,
	       				dataType : 'json',
	       				success : function(data) {
	       					$("#headline ").empty();
	       					var htmls = "";
	       					$.each(data,function(index, item) {
	       						htmls+="<option value='"+item.lid+"'>"+item.lname+"</option>";
	       					});
	       					$("#headline").append(htmls);
	       				}
	       			});
            	 
            }
            function loadDetailsOff(){
            	$(".speci").remove();
            	var offhead= $("#offhead option:selected").val();
            	var offline= $("#headline option:selected").val();
            	$.ajax({
         			type : "POST",
       				url : "getOffDetail",
       				data : "offhead=" +offhead+"&offline="+offline ,
       				dataType : 'json',
       				success : function(data) {
       					var htmls = "";
       					$.each(data,function(index, item) {
       						details.push(item.detail_id);
							if(item.tid==1){
								htmls+="<div class=\"per-row speci\"><span class=\"result_span_title\">"+item.dname+"</span>";
								htmls+="<div class=\"checkone checkon_person\"><p><span class=\"l_square checkone_sel\" data-index=\"1\"></span>";
								htmls+="<span>是</span></p><p><span class=\"l_square \" data-index=\"0\"></span><span>否</span></p></div></div>";
								
							}else if(item.tid==0){
								htmls+="<div class=\"per-row speci\"><span class=\"result_span_title\">"+item.dname+"</span>";
								htmls+="<div class=\"checkone checkon_person\"><p><span>选择</span>";
								htmls+="<span class=\"l_square\"></span></p></div></div>";
							}
       					});
       					$(".row-jianshedidian:eq(0)").after(htmls);
       				    $(".checkone p .l_square").click(function(){
	       		            if($(this).hasClass('checkone_sel')){
	       		                $(this).removeClass("checkone_sel");
	       		            }else{
	       		               $(this).parent().parent().find("span").removeClass("checkone_sel");
	       		               $(this).addClass("checkone_sel");
	       		            }
       		       });
       				}
       			}); 
            }
            function envSubmit(){
            	var province = $(".pop_province option:selected").val();
            	var city = $(".pop_city option:selected").val();
            	var country = $("#country option:selected").val();
            	var offhead= $("#offhead option:selected").val();
            	var headtext= $("#offhead option:selected").text();
            	var offline= $("#headline option:selected").val();
            	var linetext= $("#headline option:selected").text();
            	var projectname= $("#onename").val(); 
            	var value=[];
            	var a = $(".checkon_person").length;
            	var e = $(".speci").length;
            	for(var i=0;i<e;i++){
            		var f = $(".speci").eq(i).find(".checkone .l_square:eq(0)");
            		var aa = f.hasClass("checkone_sel");
            		if(aa == false){
            			aa=0;
            		}else if(aa== true){
            			aa=1
            		}
            		value.push(aa);
            	}
            	if(province==undefined||city==undefined||offhead==undefined||offline==undefined||projectname==""){
            		showMess("请先完善信息");
            		return;
            	}else{
            		$.ajax({
             			type : "POST",
           				url : "envSave",
           				data : "details="+details+"&pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+offline+"&projectname="+projectname+"&value="+value+"&headtext="+headtext+"&linetext="+linetext ,
           				dataType : 'text',
           				success : function(data) {
           					location.href = 'table?pid='+pid;
           				}
           			});
            	}
            	
            }
            function loadSurOff(){
            	$(".myselect ul").empty();
            	counts=0;
            	mount.splice(0,mount.length);
            	var surhead= $("#surHead option:selected").val();
            	$.ajax({
	         			type : "POST",
	       				url : "getSurLine",
	       				data : "surhead=" +surhead ,
	       				dataType : 'json',
	       				success : function(data) {
	       					var htmls = "";
	       					$.each(data,function(index, item) {
	       						htmls+="<li data-m='"+item.lid+"'>"+item.lname+"</li>";
	       					});
	       					$(".myselect ul").append(htmls);
	       				}
	       			});
            	
            }
            function monSubmit(){
            	var province = $(".sur_province option:selected").val();
            	var city = $("#surcity").val();
            	var country = $("#surcountry").val();
            	var offhead= $("#surHead option:selected").val();
            	var projectname= $("#twoname").val();
            	if(province==undefined||city==undefined||offhead==undefined||types==""||projectname==""){
            		showMess("请先完善信息");
            		return;
            	}else{
	            	$.ajax({
	         			type : "POST",
	       				url : "monSave",
	       				data : "pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+mount+"&projectname="+projectname+"&value="+types,
	       				dataType : 'text',
	       				success : function(data) {
	       					location.href = 'tableSur?pid='+pid;
	       				}
	       			});
            	}
            }
            //提示框
            function showMess(str){
            	$(".aa").show();
        		$(".bb .pl_content p").html(str);
            	$(".bb").show();
            }
           
           
          
           