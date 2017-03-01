<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
        </div>
        <div class="clear"></div>
        <!-- 企业底部 -->
      <div class="qiye_main_bottom" style="border:0px solid red;height: 1px;margin:10px;" >
          <%--  2015<span> ${companyList.companyname} </span>版权所有 <span>技术支持 : <a href="javascript:void(0)">优蚁网</a></span>
         <a href="javascript:void(0)">网站首页</a>
         <a href="javascript:void(0)">管理入口</a>    --%>
        </div>
        <!-- 企业底部 结束-->
    </div>
</div>
<!--中间部分end-->
<%@ include file="/WEB-INF/views/include/footer_ad.jsp"%>
<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
<script>
$(function(){
    var contentNavArr = [];
    var ad_top=$(".header_banner").each(function(){
      contentNavArr.push($(this).offset().top);
    
    });
    /*滚动条事件*/
    $(window).scroll(function(){
      /*左右悬窗定位*/
      if($(window).scrollTop() >　contentNavArr[0]){
          $(".nav_bottomlist").show();
          $(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});
    
    
      }else if($(window).scrollTop() <=　contentNavArr[0]){
          $(".nav_bottomlist").hide();
          $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
      }
    });
    $(".content").click(function(){
        go('固废供求-副本-9-17.html');
    });
})
</script>
<!--图标提示-->
<script>
$(function(){
    search_class();
    $(".mall_ad a").height($(".list_row").outerHeight());
});
function search_class(){
    $(".search-class ul li").click(function(){
        $(this).parents(".search-class-row").siblings().find("li").removeClass("li-sel");
        $(this).parent().parent().parent().find("li").removeClass("li-sel");
        $(this).addClass("li-sel");
        var li_index=$(this).index();
        //其他row上隐藏
        $(this).parents(".search-class-row").siblings().find(".level-erji,.level-sanji").hide();
        //本行 其他line隐藏
        $(this).parents(".level-line").siblings().find(".level-div").hide();
        //本line 其他同级leveldiv隐藏
        $(this).parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();

        $(this).parent().parent().children(".level-div").eq(li_index).show();
    });
}
</script>

<!--选择所在地-->
<script>
    $(".mall_area .area_cont li").mousedown(function(){
        $(".mall_area .area_cont li").removeClass("mall_area area_cont cur_area");
        $(this).addClass("cur_area");
            
    })
</script>
        
<!--排序方式end-->
<script>
    //综合排序、热门排序切换
    $(".mall_sort .choese_sort .sort_zh").hide();
    $(".mall_sort .choese_sort .cur_sort").click(function(){
        $(".mall_sort .choese_sort .sort_zh").show();   
    });
    $(".mall_sort .choese_sort").mouseleave(function(){
        $(".mall_sort .choese_sort .sort_zh").hide();   
    });
    $(".mall_sort .choese_sort .sort_zh").click(function(){
        var tamp;
        tamp=$(this).html();
        $(this).html($(".mall_sort .choese_sort .cur_sort").html());
        $(".mall_sort .choese_sort .cur_sort").html(tamp);
        $(this).hide();
    });
    //前后切换
            
    $(function(){
        $(".sort_1 li").click(function(){
            $(this).find("a").toggleClass("up_down");
        });
    });
</script>

<!--翻页-->
<script>
    var wd_num=0;
    $(".fanye .fanye_btn input").mousedown(function(){
        wd_num=$(".fanye .fanye_btn input").index(this);
        $(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
        $(this).addClass("cur_fanye_btn");                          
    });
    $(".fanye .fanye_left").mousedown(function(){
        if(wd_num>0&wd_num<=2){
            $(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
            $(".fanye_btn input:eq("+wd_num+")").prev().addClass("cur_fanye_btn");
            wd_num=wd_num-1;    
        }       
    });
    $(".fanye .fanye_right").mousedown(function(){
        if(wd_num>=0&wd_num<2){
            $(".fanye .fanye_btn input").removeClass("cur_fanye_btn");
            $(".fanye_btn input:eq("+wd_num+")").next().addClass("cur_fanye_btn");
            wd_num=wd_num+1;    
        }       
    });
  //上一页
$(".prev_page").click(function(){
	var str ='${enterpriseId}';
	if('${currentPage}'!=1){
		window.location.href='${actionUrl}${currentPage - 1}${urlParas}?enterpriseId='+str+'';
	}
});
//下一页
$(".next_page").click(function(){
	var str ='${enterpriseId}';
	if('${currentPage}'!='${totalPage}'){
		window.location.href='${actionUrl}${currentPage + 1}${urlParas}?enterpriseId='+str+'';
	}
});
//跳转
 $(" .filp input:last").click(function(){
	 var str ='${enterpriseId}';
	var text = $(".filp :text:last").val();
	window.location.href='${actionUrl}'+text+'${urlParas}?enterpriseId='+str+'';
});
$(function(){
	var myDate = new Date();
	
	
	var arr =myDate.getDay();
	var str="";
	if(arr==0){
		str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期天';
	}else if(arr==1){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期一';
	}else if(arr==2){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期二';
	}else if(arr==3){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期三';
	}else if(arr==4){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期四';
	}else if(arr==5){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期五';
	}else if(arr==6){
		 str=(myDate.getMonth()+1)+'月'+myDate.getDate()+'日 星期六';
	}
	$("#timeV").text(str);
});
</script>

