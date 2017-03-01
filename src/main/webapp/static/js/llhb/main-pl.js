       //注册 弹出层方法        
       function populayer_fn(){
            /*if(btn){
                console.log(btn);
                $(btn).click(function(){
                    $("."+populayer_type ).show();
                    $(".popumask").show();
                    
                });
                
            }*/
           $(".popumask").css({"width":$(window.parent).width()+"px","height":$(window.parent).height()+"px"});
           //弹出层 添加对号
           $(".checkone p .l_square").click(function(){
               $(this).parent().parent().find("span").removeClass("checkone_sel");
               $(this).addClass("checkone_sel");
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
          /* $(".popumask").click(function(){
               $(".populayer").fadeOut();
               $(".popumask").fadeOut();
           });*/
           //弹出层 进入优蚁
           // $(".populayer register_done").click(function(){
           //     //跳转页面
           //     //location.assign("https://www..com");
           // });
    }   

// 上传图片 弹出层方法
function pl_commit_pic(){
    
    // $(".pl_commit_pic").show();
    // $(".popumask").show();
    $(".select-commit input[type=radio]").unbind('click').on("click",function(){
        $(this).parent().siblings().find("input[type=radio]").removeAttr('checked');
        if($(this).parent().index()==0){
            $(".home-pic").show();
            $(".net-pic").hide();
        }else{
            $(".home-pic").hide();
            $(".net-pic").show();
        }
    });
    $(".btns a:nth-child(2)").unbind().on("click",function(){
        $(".pl_commit_pic").hide();
        $(".popumask").hide();
    });
}


function pl_yesorno(){
  //弹出层 关闭
           $(".btns-yesorno .no-btn").click(function(){
               $(".pl_yesorno").fadeOut();
               $(".popumask").fadeOut();
           });
}
function pl_yesorno(){
	  //文本输入框弹出层 关闭
   $(".btns-yesorno .no-btn").click(function(){
	   $(".pl_text").fadeOut();
	   $(".popumask").fadeOut();
   });
}