/*头部 + 悬窗*/
$(document).ready(function(){
	/*头部右侧切换*/
	var h_r_index = 0;
	var h_r_next_timer;
	$(".h_r_next").on("click",function(){
		$(".header_right ul li").eq(h_r_index).fadeIn().siblings().hide();
		h_r_index ++;
		h_r_index = h_r_index >= $(".header_right ul li").length ? 0 : h_r_index;
	}).on("mouseover",function(){
		clearInterval(h_r_next_timer);
	}).on("mouseleave",function(){
		h_r_next_timer=setInterval(function(){
			$(".h_r_next").trigger("click");
		},3000);
	});
	h_r_next_timer=setInterval(function(){
		$(".h_r_next").trigger("click");
	},3000);
	
	/*获取图片的盒子对象*/
	var $ulDom = $(".h_b_list");
	/*控制轮播的索引*/
	var index = 1;
	/*定时器*/
	var bannerTimer = null;
	/*轮播时间*/
	var timer = 5000;
	
	/*初始化布局*/
	var winWidth = $(window).width();
	var halfPosition = (winWidth - $(".main").width())/2;
	var liLength0 = $(".h_b_list li").length;
	$(".header_nav .h_n_right").css({right:0,width:halfPosition});
	$(".header_nav .h_n_left").css({left:0,width:halfPosition});
	$(".banner_left").css({left:(halfPosition+1)});
	$(".b_l_img").css({left:halfPosition - 62});
	$(".banner_right").css({right:halfPosition});
	$(".ad_left").css({left:(halfPosition - $(".ad_left").width() - 10)});
	$(".ad_right").css({left:(halfPosition + $(".main").width() + 10)});
    $(".banner_direction").eq(0).css({left:(halfPosition - $(".banner_direction").eq(0).width() - 100)});
    $(".banner_direction").eq(1).css({right:(halfPosition - $(".banner_direction").eq(0).width() - 100)});
    $(".nav_bottomlist").css({left:(halfPosition + $(".main").width()+30)});
	/*添加小圆圈*/
	$(".header_banner .h_b_btn").html("");
	$(".h_b_list li").each(function(){
		$(this).css({width:winWidth});
		$(".header_banner .h_b_btn").append('<a href="javascript:void(0);" ></a>');
	});
	$(".header_banner .h_b_btn").find("a:first").addClass("h_b_btn_sel");

	$(".h_b_list").css({width:winWidth * (liLength0 + 2),left:-1 * winWidth * index});
	/*窗口变化重新赋值*/
	$(window).resize(function(){
		winWidth = $(window).width();
		var halfPosition = (winWidth - $(".main").width())/2;
		$(".header_nav .h_n_right").css({right:0,width:halfPosition});
		$(".header_nav .h_n_left").css({left:0,width:halfPosition});
		$(".banner_left").css({left:(halfPosition + 1)});
		$(".b_l_img").css({left:halfPosition-62});
		$(".banner_right").css({right:halfPosition});
		$(".ad_left").css({left:(halfPosition - $(".ad_left").width() - 10)});
		$(".ad_right").css({left:(halfPosition + $(".main").width() + 10)});
        $(".banner_direction").eq(0).css({left:(halfPosition - $(".banner_direction").eq(0).width() - 100)});
        $(".banner_direction").eq(1).css({right:(halfPosition - $(".banner_direction").eq(0).width() - 100)});
		$(".nav_bottomlist").css({left:(halfPosition + $(".main").width() + 30)});
		$(".h_b_list li").each(function(){
			$(this).css({width:winWidth});
		});
		$(".h_b_list").css({width:winWidth * (liLength0 + 2),left:-1 * winWidth * index});
	});

	/*附加元素收尾相加的元素*/
	var $first = $ulDom.find("li:first").clone();
	var $last= $ulDom.find("li:last").clone();
	$ulDom.append($first);
	$ulDom.prepend($last);

	/*获取长度*/
	var length = $ulDom.children().length;
    /*小圆圈的个数*/
    var circleLength = $(".h_b_btn a").length;
	/*小圆圈的绑定事件*/
	$(".h_b_btn").on("click","a",function(){
		clearInterval(bannerTimer);
		index = $(this).index()+1;
		$(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
		$ulDom.stop(true,true).animate({"left":-1 * winWidth * index });
	}).mouseleave(function(){
		playBanner();
	}).mouseover(function(){
		clearInterval(bannerTimer);
	});
    /*左右箭头的绑定事件*/
    $(".banner_direction").eq(0).on("click",function(){
        clearInterval(bannerTimer);
        index = index -1;
        if(index == 0){
            index =1;
        }else{
            $(".h_b_btn a").eq(index-1).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
            $ulDom.stop(true,true).animate({"left":-1 * winWidth * index });
        }
        playBanner();
    });
    $(".banner_direction").eq(1).on("click",function(){
        clearInterval(bannerTimer);
        index = index + 1;
        if(index > circleLength){
            index = circleLength;
        }else{
            $ulDom.stop(true,true).animate({"left":-1 * winWidth * index });
            $(".h_b_btn a").eq(index-1).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }
        playBanner();
    });
	/*banner的定时器轮播*/
	function playBanner(){
		bannerTimer = setInterval(function(){
			index++;
			if(index == length-1){
				$ulDom.css("left",0);
				index = 1;
            }
            $ulDom.stop(true,true).animate({"left":-1 * winWidth * index });
			$(".header_banner").find(".h_b_btn a").eq(index-1).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
		},timer);
    }
    /*执行轮播*/
	playBanner();


	/*banner左侧头部点击添加样式*/
	$(".b_l_nav li a").on("click",function(){
		$(this).addClass("b_l_nav_sel");
		$(this).parent().siblings().find("a").removeClass("b_l_nav_sel");
	});
	
	$(".banner_left .b_l_form .b_l_formTop").hide();
	$(".banner_left .b_l_form .b_l_formTop:first").show();
	var b_num;
	$(".banner_left .b_l_nav li").click(function(){
		b_num=$(".banner_left .b_l_nav li").index(this);
		$(".banner_left .b_l_form .b_l_formTop").hide();
		$(".banner_left .b_l_form .b_l_formTop:eq("+b_num+")").show();	
	});
	
	/*banner右侧导航*/
	$(".b_r_nav").find("a").on("click",function(){
		$(this).addClass("b_r_nav_sel").siblings().removeClass("b_r_nav_sel");
		$(".b_r_itemsBox").find(".b_r_items").eq($(this).index()).show().siblings().hide();
	});
	/*banner右侧中间列表hover事件*/
	$(".b_r_items").find("a").hover(function(){
		var iposition = $(this).find(".b_r_i_img").css("background-position").split(" ");
		$(this).find(".b_r_i_img").css({"background-position":iposition[0]+" "+(parseInt(iposition[1])-43)+"px"});
	},function(){
		var iposition = $(this).find(".b_r_i_img").css("background-position").split(" ");
		$(this).find(".b_r_i_img").css({"background-position":iposition[0]+" "+(parseInt(iposition[1])+43)+"px"});
	});
	
	/*存储个标题距顶部距离*/
	var contentNavArr = [];
	$(".contentNav").each(function(){
		contentNavArr.push($(this).offset().top);
	});
	/*滚动条事件*/
	$(window).scroll(function(){
		/*左右悬窗定位*/
		if($(window).scrollTop() >contentNavArr[0]){
			$(".nav_bottomlist").show();
			$(".ad_left,.ad_right").css({position:"fixed"});
			$(".ad_right .ad_r_nav li").eq(0).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		}else{
			$(".nav_bottomlist").hide();
			$(".ad_left,.ad_right").css({position:"absolute"});
		}
		/*右侧悬窗导航随内容改变样式*/
		if($(window).scrollTop() >=contentNavArr[3] - 30){
			$(".ad_right .ad_r_nav li").eq(3).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		}else if($(window).scrollTop() >= contentNavArr[2] - 30){
			$(".ad_right .ad_r_nav li").eq(2).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		}else if($(window).scrollTop() >= contentNavArr[1] - 30){
			$(".ad_right .ad_r_nav li").eq(1).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		}else if($(window).scrollTop() >= contentNavArr[0] - 30){
			$(".ad_right .ad_r_nav li").eq(0).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		}
	});
	/*右侧悬窗导航*/
	$(".ad_right .ad_r_nav li").on("click",function(){
		$(this).addClass("ad_r_nav_sel").siblings().removeClass("ad_r_nav_sel");
		$("html,body").animate({scrollTop:contentNavArr[$(this).index()]});
	});
	/*回到顶部*/
	$(".nav_totop").on("click",function(){
		$("html,body").animate({scrollTop:0});
	});

	// 底部弹出层
	
	$(window).scroll(function(){
        $(".index-bottom-pl .index-bottom-pl-main>a").click();
	});
	//底部弹出层点击x收回
	$(".index-bottom-pl .index-bottom-pl-main>a").click(function(){
		$(".index-bottom-pl").animate({"left":-$(window).width()},function(){
			$(".index-bottom-pl").hide();
			$(".index-bottom-pl-changel").show().animate({"left":"0"});
		});
	});
	
	//底部左侧点击 弹出层展开
	$(".index-bottom-pl-changel").click(function(){
		$(this).animate({"left":-$(this).width()+"px"},function(){
			$(this).hide();

			//$(".index-bottom-pl").show().animate({"left":"0"});
			
		});
	});

	//点击立即申请
	//populayer_fn();

    $(".banner_left_submit").click(function(){
      /*  var index= $(".b_l_nav .b_l_nav_sel").parent("li:visible").index();
        if(index==1){
            $(".pl_index_shenqing").show();
            $(".popumask").show();
        }else if(index==2){
            $(".pl_index_shenqing_jiance").show();
            $(".popumask").show();
        }*/
    });
	$(".buy_3").click(function(){
        $(".pl_index_view").show();
        $(".popumask").show();
    });
	
	$(".need").click(function(){
        $(".need_no").show();
    });
	$(".no_need").click(function(){
        $(".need_no").hide();
    });
	
    //右侧悬窗按钮切换
    $(".b_r_top_login_b a").on("mouseover",function(){
        $(this).addClass("when-mouseover").siblings().removeClass('when-mouseover');
    });

    //解决IE8下nth-child失效
    $(".job_fairs ul li:nth-child(3n)").css("margin-right","0px");
});

/*综合信息*/
$(document).ready(function(){
	/*综合信息上方导航*/
	$(".c0_nav nav a").on("click",function(){
		$(this).siblings().removeClass("c0_nav_sel").end().addClass("c0_nav_sel");
		var index=$(this).index();
		$(".c0_img").hide();
		$(".c0_img").eq(index).show();
	});
});


/*1F*/
$(document).ready(function(){
	/*1F流程图hover样式*/
	$(".c1_flow").find("li").hover(function(){
		var iposition = $(this).find(".c1_f_img").css("background-position").split(" ");
		$(this).find(".c1_f_img").css({"background-position":iposition[0]+" "+(parseInt(iposition[1])+58)+"px"});
	},function(){
		var iposition = $(this).find(".c1_f_img").css("background-position").split(" ");
		$(this).find(".c1_f_img").css({"background-position":iposition[0]+" "+(parseInt(iposition[1])-58)+"px"});
	});
});

/*2F*/
$(document).ready(function(){
	/*2F左侧导航切换*/
	$(".c2_left .c2_l_nav li").on("click",function(){
		var li_index = $(this).index();
		
		/*if($(this).attr("class") == "li_sel"){
			return;
		}else{
			$(".c2_left .c2_l_nav li").each(function(){
				if ($(this).attr("class") == "li_sel"){
					alert('1');
					var x = parseInt($(this).find("i").css("backgroundPosition").split(' ')[0]);
					var y = parseInt($(this).find("i").css("backgroundPosition").split(' ')[1] ) - 40;
					$(this).find("i").css({"background-position":x + "px  " + y+ "px"});
				}
				if($(this).attr("class") != "li_sel"){
					if($(this).index() == li_index){
						alert('2');
						var x_2 =parseInt($(this).find("i").css("backgroundPosition").split(' ')[0]);
						var y_2 = parseInt($(this).find("i").css("backgroundPosition").split(' ')[1] ) + 40;
						$(this).find("i").css({"background-position":x_2 + "px  " + y_2+ "px"});
					}else{
						return;
					}
				}
				
			});
		}*/
		$(this).addClass("li_sel").siblings().removeClass("li_sel");	
		$(".c2_r_classify").hide().find("a").removeClass("secondType");
		$(".c2_r_classify").eq(li_index).show().find("a:first").addClass("secondType");
		list();	
	});
	/* 人气 价格*/
	/*$(".c2_r_synth a").on("click",function(){
		$(this).addClass("li_sel").siblings().removeClass("li_sel");	
	});
	$(".c2_r_synth p").on("click",function(){
		$(".c2_r_synth a").removeClass("li_sel");	
	});*/
});

/*3F*/
$(document).ready(function(){
	/*3F左侧信息导航切换*/
	$(".c3_l_nav li").click(function(){
		$(this).siblings().removeClass("active").end().addClass("active");
		var li_index=$(this).index();
		
		$(".c3_l_items>li").hide().eq(li_index).show();
		$(".c3_l_nav_active").animate({"left":li_index*$(this).width()+"px"});
	});
	/*3F右侧切换 话题 问题*/
	$(".c3_r_nav a").each(function(){
		$(this).click(function(){
			$(this).parent().siblings().find("a").removeClass("active");
			$(this).addClass("active");
			
			if($(this).parent().index()==0){
				$(".topic").show();
				$(".question").hide();
			}else{
				$(".topic").hide();
				$(".question").show();
			}
		});
	});
});

// 弹出层方法        
   function populayer_fn(){
        
       $(".popumask").css({"width":$(window).width()+"px","height":$(window).height()+"px"});
       //弹出层 添加对号
       $(".checkone p .l_square").click(function(){
            if($(this).hasClass('checkone_sel')){
                $(this).removeClass("checkone_sel");
            }else{
               $(this).parent().parent().find("span").removeClass("checkone_sel");
               $(this).addClass("checkone_sel");
            }
       });
       //弹出层 关闭
       $(".populayer .layer_top a").click(function(){
           $(this).parents(".populayer").fadeOut(function(){
           	var on=false;
               $(".populayer").each(function(){
               	if($(this).is(":visible")){
               		on=true;
               	}
               });
               if(!on){
               	$(".popumask").fadeOut();
               }
           });
       });
       $(".popumask").click(function(){
           $(".populayer").fadeOut();
           $(".popumask").fadeOut();
       });
       //弹出层 进入优蚁
       // $(".populayer register_done").click(function(){
       //     //跳转页面
       //     //location.assign("https://www..com");
       // });
       //立即申请暂时添加
       $(".btn").click(function(){
       		$(".populayer").fadeOut();
       		$(".popumask").fadeOut();
       });
    }   



    // 固废供求页添加
    $(document).ready(function(){
    	$(".left_item").mouseover(function(){
    	    //获取当前鼠标移动上去的栏目为第几个
    	    var idx = $(this).index();
    	    $(this).addClass("left_item_hover");
    	    $(this).siblings().removeClass("left_item_hover");
    	    $(".left_sub_div:eq("+idx+")").removeClass("hidden");
    	    $(".left_sub_div:eq("+idx+")").siblings().addClass("hidden");
    	    $(".left_sub_item:eq("+idx+")").siblings().addClass("hidden");
    	    $(".left_sub_item:eq("+idx+")").removeClass("hidden");
    	});
    	$(".left_item").mouseout(function(){
    	    //获取当前鼠标移动上去的栏目为第几个
    	    var idx = $(this).index();
    	    $(this).removeClass("left_item_hover");
    	    $(this).siblings().removeClass("left_item_hover");
    	    $(".left_sub_div:eq("+idx+")").addClass("hidden");
    	    $(".left_sub_div:eq("+idx+")").siblings().addClass("hidden");
    	    $(".left_sub_item:eq("+idx+")").siblings().addClass("hidden");
    	    $(".left_sub_item:eq("+idx+")").addClass("hidden");
    	});
    	$(".content").click(function(){
    	   // go('固废供求/固废供求-副本-9-17.html');
    	});
    });
    /*头部 + 悬窗*/
    $(document).ready(function(){
        /*获取图片的盒子对象*/
    	var $fadeDom = $(".fade_list");
    	/*控制轮播的索引*/
    	var idx = 0;
    	/*定时器*/
    	var fadeTimer = null;
    	/*轮播时间*/
    	var timer = 3000;
        var length = $(".fade_list li").length;
        $(".main_top_nav_middle .fade_btn").html("");
        $(".fade_list li").each(function(){
            $(".main_top_nav_middle .fade_btn").append('<a href="javascript:void(0);" ></a>');
        });
        $(".main_top_nav_middle .fade_btn").find("a:first").addClass("h_b_btn_sel");

        $(".fade_btn").on("click","a",function(){
            clearInterval(fadeTimer);
            idx = $(this).index();
            changePic(idx);
            $(this).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        }).mouseleave(function(){
            playFader();
        }).mouseover(function(){
            clearInterval(fadeTimer);
        });

        function playFader(){
            fadeTimer = setInterval(function(){
                idx++;
                if(idx == length){
                    idx = 0;
                }
                changePic(idx);

            },timer);
        }
        /*执行轮播*/
        playFader();
    });


    function changePic(idx){
        $(".main_top_nav_middle").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
        $(".fade_list li:eq(" + idx + ")").fadeIn().siblings().fadeOut();
    }
    
