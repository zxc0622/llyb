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
            };
            changePic(idx);

        },timer);
    }
    /*执行轮播*/
    playFader();
});


function changePic(idx){
    $(".main_top_nav_middle").find(".fade_btn a").eq(idx).addClass("h_b_btn_sel").siblings().removeClass("h_b_btn_sel");
    $(".fade_list li:eq("+idx+")").fadeIn().siblings().fadeOut();;
}




