//人才招聘
$(function(){
    function smoothScrollForJob(obj,sub){
        var $dom = $(obj);
        $dom.append($dom.html());
        var $scroll_h=$dom.get(0).scrollHeight/2;
        var $scroll_t=0;
        var scrolltimer = setInterval(function(){
            if($scroll_t>=$scroll_h){
                $scroll_t=0;
            }
            $dom.scrollTop(($scroll_t+=0.5));
        },30);
        $dom.find(sub?sub:"li").on("mouseover",function(){
            clearInterval(scrolltimer);
        }).on("mouseleave",function(){
            scrolltimer = setInterval(function(){
                if($scroll_t>=$scroll_h){
                    $scroll_t=0;
                }
                $dom.scrollTop(($scroll_t+=0.5));
            },30);
        });
    }
    smoothScrollForJob('.job_fairs_content');

    $("#comp_div").on("mouseover",function(){
        $(".comp_direction").css("opacity",1);
    }).on("mouseleave",function(){
        $(".comp_direction").css("opacity",0);
    });
    $(".header_banner").on("mouseover",function(){
        $(".banner_direction").css("opacity",1);
    }).on("mouseleave",function(){
        $(".banner_direction").css("opacity",0);
    });

    $(".job_fairs_content>ul>li>span").on("mouseover",function(){
        $(this).find("span").css("color","red");
    }).on("mouseout",function(){
        $(this).css("color","#5ec520");
    });
    $(".job_fairs_content>ul>li>span").on("mouseover",function(){
        $(this).css("color","red");
    }).on("mouseout",function(){
        $(this).css("color","#5ec520");
    });
    $(".job_fairs_content>ul>li>p").on("mouseover",function(){
        $(this).css("color","red");
    }).on("mouseout",function(){
        $(this).css("color","#666");
    })
});


function goTo2(obj){
    if (obj == null || obj == undefined || obj == '') {
        return;
    }
    var urlStr = obj.split("://");
    var protocal = urlStr[0];

    if (urlStr.length==1) {
        window.open("http://"+obj);
    }else if(protocal=="http"||protocal=="https"){
        window.open(obj)
    }else{

    }

}

var time_on=true;//验证码
var timer = null;
var scrolltimer2;
$(function(){
    bindAnimate();
    var abc = $(".b_l_f_province option:selected").val();
    if(abc){
        selectCity();
    }
});

$(document).ready(function(){
    if($(".scroll_list2 a").length>4){
        smooth_scroll(".scroll_list2");
    }
    var flage=false;
    clonethead();
    smooth_scroll2(".scroll_list1","tr");
    smooth_scroll3(".scroll_list3");
    loginName();
    $(".header_nav ul li").eq(0).addClass("header_nav_sel");
    $(".c2_r_classify").children("a").on("click",function(){
        $(this).addClass("secondType").siblings().removeClass("secondType");
        list();
    });
    setInterval("window.location.reload()",1800000); //半小时刷新一次
    $(".b_l_f_province").change(selectCity);
    /*限制搜索框下 a的数量*/
    h_s_bottom_a();
    $(".c2_r_classify").each(function(){
        var s_total_width=0;
        $(this).children("a").each(function(){
            s_total_width+=$(this).width();
            if(parseInt(s_total_width)>600){
                $(this).hide();
            }
        });
    });
    $(".c2_r_classify").hide().eq(0).show().find("a").eq(0).addClass("secondType");
    $(".content span:last-child").hide();
    list();
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
    $('#searchtext').bind('keypress',function(event){
        if(event.keyCode == "13")  {
            goPage();
        }
    });
    $('#title').bind('keypress',function(event){
        if(event.keyCode == "13")  {
            list();
        }
    });

    //定时刷新2F环保业务提供商
    refreshHbService();
});

//更新时间、价格、人气
function order(str,obj){
    $("#order").val(str);
    $(".c2_r_synth a").eq(obj).addClass("sel2").siblings().removeClass("sel2");
    list();
}

function che(i){
    var p = "";
    switch (parseInt(i)){
        case 0:
            p = "请输入企业名称";
            break;
        case 1:
            p = "请输入环保需求信息";
            break;
        case 2:
            p = "请输入环保设备、原料、服务名称";
            break;
        case 3:
            p = "请输入资讯关键词";
            break;
    }
    $("#searchtext").attr("placeholder",p);
    $(".h_s_top a").eq(i).addClass("li-sel").siblings().removeClass("li-sel");
    $("#biaoji").val(i);
}

//快捷选择时间
function selectTime(){
    var days = $(this).val();
    if(days == 0){
        $(".mh_date").val("");
    }else{
        var now = new Date();
        now.setDate(now.getDate() +  parseInt(days));
        var strTime = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();
        $(".mh_date").val(strTime);
    }
}

function showMess(str){
    $(".aa").show();
    $(".bb .pl_content p").html(str);
    $(".bb").show();
    setTimeout(function(){
        $(".aa").hide();
        $(".bb .pl_content p").html("");
        $(".bb").hide();
    },3000);
}
function h_s_bottom_a(){
    var total_width=0;
    $(".h_s_bottom a").each(function(){
        total_width+=$(this).width();
        if(parseInt(total_width)>350){
            $(this).hide();
        }
    });
}

var currentIndex = 0;
function smooth_scroll(obj,sub){
    var $dom = $(obj);
    //获取公告数量
    var noticeLength = $dom.find("a").size();
    $dom.find("a").eq(currentIndex).siblings().css("display","none");
    $dom.find("a").eq(currentIndex).css("display","block");

    var scrolltimer = setInterval(function(){
        $dom.find("a").eq(currentIndex).fadeOut(1000);
        currentIndex ++;
        if(currentIndex >= noticeLength){
            currentIndex = 0;
        }
        $dom.find("a").eq(currentIndex).fadeIn(1000);
    },5000);


}

function smooth_scroll2(obj,sub){
    var $dom2 = $(obj);
    $dom2.find("thead").remove();
    $dom2.find("tbody").append($dom2.find("tbody").html()).append($dom2.find("tbody").html());
    var $scroll_h2=$dom2.get(0).scrollHeight/2;
    var $scroll_t2=0;
    scrolltimer2 = setInterval(function(){
        if($scroll_t2>=$scroll_h2){
            $scroll_t2=0;
        }
        $dom2.scrollTop(($scroll_t2+=0.5));
    },30);
    $dom2.find(sub?sub:"a").on("mouseover",function(){
        clearInterval(scrolltimer2);
    }).on("mouseleave",function(){
        scrolltimer2 = setInterval(function(){
            if($scroll_t2>=$scroll_h2){
                $scroll_t2=0;
            }
            $dom2.scrollTop(($scroll_t2+=0.5));
        },30);
    });

}

function smooth_scroll3(obj,sub){
    var $dom3 = $(obj);
    $dom3.append($dom3.html()).append($dom3.html());
    var $scroll_h3=$dom3.get(0).scrollHeight/2;
    var $scroll_t3=0;
    scrolltimer3 = setInterval(function(){
        if($scroll_t3>=$scroll_h3){
            $scroll_t3=0;
        }
        $dom3.scrollTop(($scroll_t3+=0.5));
    },60);

    $dom3.find(sub?sub:"a").on("mouseover",function(){
        clearInterval(scrolltimer3);
    }).on("mouseleave",function(){
        scrolltimer3 = setInterval(function(){
            if($scroll_t3>=$scroll_h3){
                $scroll_t3=0;
            }
            $dom3.scrollTop(($scroll_t3+=0.5));
        },60);
    });

}

function index_bottom_scroll(){
    /*获取图片的盒子对象*/
    var $ulDom = $(".c3_b_companyList");
    /*滚动时间*/
    var s_time =2000;
    var li_width=$ulDom.children('li').outerWidth();
    var $uldom_chi = $ulDom.children('li').clone();
    $ulDom.append($uldom_chi);
    /*获取长度*/
    var length = $ulDom.children().length;

    $ulDom.css({"left":0,"width":li_width*length});
    var index = 0;
    /*banner的定时器轮播*/

    var autoplay_timer =setInterval(function(){
        autoscroll();
    },s_time);
    function autoscroll(){
        $ulDom.stop(true).animate({"left":-1 * li_width},function(){
            $ulDom.css({"left":0});
            var $first = $ulDom.find("li:first");
            $ulDom.append($first);
        });
    }
    $ulDom.children('li').on("mouseover",function(){
        clearInterval(autoplay_timer);
    }).on("mouseleave",function(){
        autoplay_timer =setInterval(function(){
            autoscroll();
        },s_time);
    });

}

function clonethead(){
    var each_txt=["环保业务","联系人","联系方式","需求状态","需求时间"];
    var each_w=[];
    $(".scroll_thead td").each(function(){
        each_w.push(parseInt($(this).outerWidth()));
    });
    var mythead=$("<div class='clearfix' style='position:absolute;top:0;left:0;height:32px;line-height:32px;width:100%;background:#fff;'></div>");
    for(var i=0;i<each_w.length;i++){
        var mytd = $("<div class='fl'>"+each_txt[i]+"</div>");
        mythead.append(mytd);
        mytd.css("width",each_w[i]+"px");
    }
    $(".for_scroll_table").append(mythead);
}



var freshHbServiceTimer;
function refreshHbService(){
    clearInterval(freshHbServiceTimer);
    freshHbServiceTimer = setInterval(function(){
        //获取当前选择的服务类型
        var idx = $(".resou_selected:eq(0)").index();
        if(idx == -1 || idx == 9){
            idx =1;
        }else{
            idx ++;
        }
        $(".resou:eq("+(idx -1 )+")").click();
    },60000);

}

function generateHtml(data){
    var html = "";
    $.each(data,function(index,item){
        html += '<li class="pic_div">';
        html += '<a href="javascript:void(0);">';
        if(item.img != null && item.img != "" ){
            html += '<img class="pic_div_img_1" title="'+item.name+'"  src="'+ item.img +'">';
        }else{
            html += '<img class="pic_div_img_1" title="'+item.name+'"  src="${ctxStatic}/img/llhb/qiyeku01.png">';
        }
        html += '</a>';
        var cot = index + 1;
        if(cot == 10){
            html += ' <div class="pic_div_hidden" style="left:-175px;top:-55px;">';
        }else if(cot % 2 == 0){
            html += ' <div class="pic_div_hidden" style="left:-175px;">';
        }else if(cot > 8 ){
            html += ' <div class="pic_div_hidden" style="top:-55px;">';
        }else{
            html += '<div class="pic_div_hidden">';
        }
        html += '<div class="pic_div_real">';
        html += '<em class="pic_div_real_em">';
        if(item.img != null && item.img != "" ){
            html += '<img class="pic_div_img_2" title="'+item.name+'"  src="'+ item.img +'">';
        }else{
            html += '<img class="pic_div_img_2" title="'+item.name+'"  src="${ctxStatic}/img/llhb/qiyeku01.png">';
        }
        html += '<span class="tmui-ellipsis pic_div_real_em_span" style="">'+item.name+'</span>';
        html += '</em>';
        html += '<p class="pic_div_real_p">';
        html += '<span  class="tmui-ellipsis pic_div_real_p_span">';
        html += item.name;
        html += '</span>';
        if(item.shop_desc != "" && item.shop_desc != null){
            html += item.shop_desc.substring(0,50) + "..."
        }else{
            html += "...";
        }
        html += '</p>';
        html += '<span class="pic_div_real_span">';
        html += ' <a target="_blank" href="javascript:void(0);" onclick="goQiYeKu('+item.id+')" style="color:white;">进入首页</a>';
        html += '</span>';
        html += '</div>';
        html += '</div>';
        html += '</li>';
        if(cot % 2 == 0){
            html += ' <div class="clear"></div>';
        }

    });
    $("#pic_ul").append(html);
    bindAnimate();
}

function bindAnimate(){
    $(".pic_div").mouseover(function(){
        var pic_div_ele = $(this);
        $(pic_div_ele).css("overflow","visible");
        $(pic_div_ele).css("z-index",20);
        $(pic_div_ele).find(".pic_div_hidden").css("z-index",20);
        $(pic_div_ele).siblings().css("z-index",0);
        $(pic_div_ele).siblings().css("overflow","hidden");
        $(pic_div_ele).siblings().find(".pic_div_hidden").each(function(index){
            $(this).css("opacity",0);
            $(this).css("width",165);
            $(this).parent().css("width",165);
        });
        $(pic_div_ele).find(".pic_div_hidden").css("opacity",1);
        $(pic_div_ele).find(".pic_div_hidden").css("height",150);
        $(pic_div_ele).find(".pic_div_hidden").css("width",347);
        $(pic_div_ele).css("width","351px");
        $(pic_div_ele).find(".pic_div_hidden").bind("mouseleave",function(){
            $(this).css("opacity",0);
            $(this).css("width",165);
            $(this).css("z-index",-1);
            $(this).parent().css("width",165);
        });
        $(pic_div_ele).find(".pic_div_hidden").bind("mouseout",function(){
            $(this).css("opacity",0);
            $(this).css("width",165);
            $(this).css("z-index",-1);
            $(this).parent().css("width",165);
        });
    });

    $(".pic_div_hidden").mouseout(function(){
        $(this).css("opacity",0);
        $(this).css("width",165);
        $(this).css("z-index",-1);
        $(this).parent().css("width",165);
        $(this).parent().css("overflow","hidden");
    });

    $(".pic_div").mouseout(function(){
        $(this).find(".pic_div_hidden").css("opacity",0);
        $(this).find(".pic_div_hidden").css("width",165);
        $(this).find(".pic_div_hidden").css("z-index",-1);
        $(this).css("width",165);
        $(this).css("overflow","hidden");
    });
}

function clickCompanyBtn(obj){
    var btn_idx = $(obj).index();
    $(obj).addClass("act").siblings().removeClass("act");
    $(".c0_img").not($(".c0_img").eq(btn_idx)).css("display","none");
    $(".c0_img").eq(btn_idx).css("display","block");
    // $(".btns").css("display","block");
}

function compGo(f){
    var btn_idx = 0;
    var length = $(".c0_img").size();
    $.each($(".c0_img"),function(index,item){
        if($(item).css("display") == "block"){
            btn_idx = index;
        }
    });
    btn_idx += f;
    if(btn_idx < 0){
        btn_idx = 0;
    }
    if(btn_idx >=length){
        btn_idx = length -1;
    }
    $(".c0_img").not($(".c0_img").eq(btn_idx)).css("display","none");
    $(".c0_img").eq(btn_idx).css("display","block");
    $(".circle_btn").not($(".circle_btn").eq(btn_idx)).removeClass("act");
    $(".circle_btn").eq(btn_idx).addClass("act");
}
