<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="fs" uri="/WEB-INF/tlds/fs.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/head_llhb.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
    <title>优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台</title>

<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/jingjialiebiao.css"/>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<style>
    .mg-t60{margin-top: 60px;}
    .mg-l15{margin-left: 15px;}
    .mg-t15{margin-top: 15px;}
    .mg-l30{margin-left: 30px;}
    .mg-l40{margin-left: 40px;}
    
    /*底部开始*/
    .gyqg-main-b{margin-top: 15px;overflow: hidden;margin-bottom: 100px;}
    .main-l740{width:740px;float:left;overflow: hidden;}
    .main-r240{width:240px;float:left;margin-left: 20px;overflow: hidden;}
    
    

    .main_bottom{overflow:hidden;clear:both;}
    /*筛选结果*/
    .result_box{float:left;}
   
    /*大图*/
    .result_bigpic{width:1000px;margin-bottom: 20px;overflow: hidden;}
    /*图片信息块*/
    .pic-info-div{float:left;width:235px;height:238px;border:1px solid #ccc;overflow: hidden;margin-top: 15px;margin-right: 15px;cursor: pointer;}
    .pic-info-div:nth-child(4n){margin-right: 0;}
    .pic-info-div:nth-child(-n+4){margin-top: 0;}
	.ie8 .pic-info-div{margin-right:8px; margin-top:0; margin-bottom:15px;}

   

	 /*右侧广告*/
	 .mall_ad{width:220px; float:right;}
	 .mall_ad a{width:188px; display:block; margin-bottom:10px; cursor:pointer;}
	 .mall_ad a img{width:100%;}
	
	 /*推荐商家-两列样式*/
	 .tuijianshangjia-col{height:377px;border:1px solid #ccc;margin-top: 10px;}
	 .per-tjsj{float:left;width:118px;height:75px;position: relative;cursor: pointer;}
	 .per-tjsj:hover .per-mask{display: block;}
	 .per-tjsj:nth-child(even){border-bottom: 1px solid #ccc;border-left: 1px solid #ccc;}
	 .per-tjsj:nth-child(odd){border-bottom: 1px solid #ccc;width:119px;}
	 .per-tjsj img{width:100%;height:100%;}
	 .per-tjsj .per-mask{position: absolute;top:0;left: 0;width:120px;height:75px;background-color: rgba(0,0,0,0.8);display: none;}
	 .per-tjsj .per-mask p{color:#fff;text-align: center;margin-top:25%;font-size: 12px;}
	
	 .c1_m_left{float:left;width:235px; margin-bottom:20px;}
	
	 .tj_box{margin-top:20px;}
	 .tj_1{width:235px; margin-bottom:10px; overflow:hidden;}
	 .qy_1{width:108px; height:68px; border:1px solid #ccc; position:relative;float:left; cursor:pointer;}
	 .qy_1 img{height:100%;width:100%;}
	 .qy_1:hover p,.qy_1:hover a{display:block;}
	 .qy_1 p{width:115px; height:68px; background-color:#000; position:absolute; left:0;top:0; opacity:0.8;display:none;}
	 .qy_1 a{width:80px;text-align:center; display:block; font-size:12px;position:absolute; left:50%; margin-left:-40px; top:50%; margin-top:-20px; color:white; display:none;}

	/*翻页*/
	.fanye{margin-top:20px; margin-bottom:20px;overflow:hidden;}
	.fanye .filp a{float:left; border:1px solid #ccc; height:32px;line-height:34px;background-color:#fff; padding:0 10px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
	.fanye .filp .gap{display:block; float:left; width:12px; text-align:center; margin-left:10px} 
	.fanye input[type=text]{border:1px solid #ccc; height:32px; float:left; margin-left:10px; cursor:pointer;}
	.fanye input[type=text]:focus{border:1px solid #ee7800;}
	.fanye input[type=button]{border:1px solid #ccc; height:34px;background-color:#fff; width:102px; text-align:center; float:left; margin-left:10px; cursor:pointer;}
	.fanye .fanye_btn input{width:30px;}
	
	.fanye .filp .cur_fanye_btn{background-color:#5cb531;width:30px; border:1px solid #5cb531; color:white;}
</style>
</head>
<body>
<!--头部 start-->
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

        <!--头部中部 start-->
        <%@ include file="/WEB-INF/views/include/comp_header_middle.jsp"%>
        <!--头部中部部 end-->
    </div>

    <!--头部导航 start-->
	<%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>
	<!--头部导航 end-->
</header>
<!--头部 end-->

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>固废竞价
            </div>
            <a href="javascript:issue()" class="btn cur_position_btn"style="margin-right: 0;background-color: #ee7800;">发布竞品</a>
        </div>

        <!-- 搜索分类模块开始  -->
        <div class="search-class">
            <div class="search-class-row_2">
                <div class="s-c-r-l_2">行业分类</div>
            </div>
            <!-- 第一行一般废物-->
            <div class="search-class-row">
                <div class="s-c-r-l">一般废物</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji">
                        <!-- linediv -->
                        <div id="" class="level-line">
                            <ul class='second_level' id="ord-ws-er">
                            <li class="type_first" data-id="347">不限</li>
                            <%-- <c:forEach items="${fs:getTypeList('waste_type',347)}" var="type">
                                <li date-id="${type.id}">${type.name}</li>
                            </c:forEach> --%>
                            </ul>

                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul class='third_level'>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第一行 结束 -->
            <!-- 第二行危险废物-->
            <div class="search-class-row">
                <div class="s-c-r-l">危险废物</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div id="dange-ws-yi" class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul class='second_level' id="dange-ws-er">
                            <li class="type_first" data-id="348">不限&nbsp;&nbsp;&nbsp;</li> 
                            <%-- <c:forEach items="${fs:getTypeList('waste_type',348)}" var="type">
                                <li data-id='${type.id}'>${type.name}</li>
                            </c:forEach>    --%>
                            </ul>
                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul class='third_level'>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第二行 结束 -->
            <!-- 第三行所在地开始 -->
            <div class="search-class-row_2">
                <div class="s-c-r-l_2">竞品所在地</div>
            </div>
            <div class="search-class-row">
                <div class="s-c-r-r" style="width:100%;margin-left:0px;">
                    <!-- 一级菜单 -->
                    <div class="search-province">
                        <a class="sel-province" href="javascript:void(0)" data-id="">不限</a>
                        <c:forEach items="${areaList}" var="area">
                        <a href="javascript:void(0)" data-id="${area.id}">${area.name}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- 第二行结束 -->
        </div>
        <!-- 第三行开始 -->
        <div class="search-block-b">
            <!-- 左侧 -->
            <div class="jp_sta font_1">
                <span>竞品状态</span>
            </div>
            <div class="jp_sta font_1">
                <ul>
                    <li class="selected" data-comp-status="">不限</li>
                    <li data-comp-status="1">正在进行</li>
                    <li data-comp-status="0">即将开始</li>
                    <li data-comp-status="2">已结束</li>
                </ul>
            </div>
            <!-- 右侧 -->
            <div class="mall_sort font_1 color_1" style="float:right;">
                <ul class="choese_sort">
                    <li class="cur_sort" data-order=""><a>默认</a></li>
                </ul>
                <ul class="sort_1">
                    <li data-order="max_price" data-sort="${sort}"><a>价格</a></li>
                    <!-- <li><a>价格</a></li> -->
                    <li data-order="page_view" data-sort="${sort}"><a>人气</a></li>
                    <li data-order="price_count" data-sort="${sort}"><a>出价次数</a></li>
                </ul>
            </div>
        </div>
        <!-- 第三行结束 -->
        <!-- 搜索模块结束 -->

        <div class="main_bottom">
            <!--筛选结果start-->
            <div class="result_box">
                <div class="result_bigpic">
                    <ul>
                    <c:forEach items="${compList}" var="comp">
                        <li onclick="window.open('${ctx}/competition/detailInfo?id=${comp.id}')">
                            <div class="c1_m_r_img" >
                            <c:choose> 
							<c:when test="${not empty comp.pic1}">
							<img src="${comp.pic1}" style="width:232px; height:125px;"/>
							</c:when>
							<c:when test="${not empty comp.pic2}">
							<img src="${comp.pic2}" style="width:232px; height:125px;"/>
							</c:when>
							<c:when test="${not empty comp.pic3}">
							<img src="${comp.pic3}" style="width:232px; height:125px;"/>
							</c:when>
							<c:otherwise>
							<img src="${ctxStatic}/img/llhb/default.png" style="width:232px; height:125px;"/>
							</c:otherwise>
							</c:choose>
							<c:if test="${comp.is_will_comp eq 0 && comp.is_comping eq 0}">
							<div class="c1_m_r_img_mask"><span>已结束</span></div>
							</c:if>
							</div>
                            <div class="c1_m_r_top">${comp.comp_title}</div>
                            <p class="font_1">当前价&nbsp;<span class="font_3">￥${not empty comp.max_price? comp.max_price:'0元'}</span>(${not empty comp.price_count? comp.price_count:'0'}次出价)</p>
                            <p class="font_1">评估价&nbsp;￥${not empty comp.starting_price? comp.starting_price:'0元'}</p>
                            <c:choose>
                            <c:when test='${comp.is_will_comp eq 1}'>
                            <p class="font_1">即将开始&nbsp;<span class="djs_span" data-time="${comp.start_surplus_time}"></span></p>
                            </c:when>
                            <c:when test="${comp.is_comping eq 1}">
                            <p class="font_1">距结束&nbsp;<span class="djs_span" data-time="${comp.end_surplus_time}"></span></p>
                            </c:when>
                            <c:when test="${comp.is_will_comp eq 0 && comp.is_comping eq 0}">
                            <p class="font_1">距结束&nbsp;<span class="djs_span" data-time="${0}"></span></p>
                            </c:when>
                            </c:choose>
                            <div class="c1_m_r_bottom font_1">
                                <p><span>${not empty comp.page_view? comp.page_view:'0'}次</span><span>围观</span></p>
                                <p><span>${not empty comp.pay_count? comp.pay_count:'0'}人</span><span>报名</span></p>
                            </div>
                            <c:choose>
                            <c:when test="${comp.is_will_comp eq 1}">
                            <div class="c1_m_r_now_green font_1">即将开始</div>
                            </c:when>
                            <c:when test="${comp.is_comping eq 1}">
                            <div class="c1_m_r_now font_1">正在进行</div>
                            </c:when>
                            </c:choose>
                        </li>
                     </c:forEach>
                    </ul>
                </div>

                <div class="fanye font_1 color_1">
                    <c:set var="currentPage" value="${recordPage.pageNumber}" />
					<c:set var="totalPage" value="${recordPage.totalPage}" />
					<c:set var="actionUrl" value="${ctx}/competition/index/search/"/> 
					<c:set var="pageSize" scope="page" value="${recordPage.pageSize}" /> 
					<c:set var="totalRow" scope="page" value="${recordPage.totalRow}" />
					<c:set var="urlParas" value="?typeFirst=${typeFirst}&typeSecond=${typeSecond}&typeThird=${typeThird}&provId=${provId}&compTitle=${compTitle}&compStatus=${compStatus}&orderBy=${orderBy}&sort=${sort}" />
					<%@ include file="/WEB-INF/views/pager/_paginateYP.jsp"%>
                </div>
            </div>
            <!--筛选结果end-->
        </div>


    </div>
</div>
<!--中间部分end-->

<!--底部 start-->
<footer>
			<%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
			<%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
</footer>
<!--底部 end-->
<!-- 弹出框 -->
<div class="populayer pl_normal" >
    <div class="layer_top">
    	<span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>
    </div>
</div>	
<!--图标提示-->
<script>
   $(function(){
        // 搜索部分
       //search_class();

       //底部尖角样式list切换
       $(".change-list-bottomstyle a").click(function(){
            $(this).addClass("sel-bstyle").parent().siblings().find("a").removeClass("sel-bstyle");
       }); 
       

       $(".rzh li h6").hide();
       $(".list_aa .rzh li").mouseover(function(){
        $(this).find("h6").show();  
       });
       $(".list_aa .rzh li").mouseout(function(){
        $(".rzh li h6").hide(); 
       });

       $(".jp_sta ul li").click(function(){
           $(this).addClass("selected").siblings().removeClass("selected");

       });

   });
  /*  function search_class(){
       $(".search-class").on("click","ul li",function(){
           var clsName = $(this).attr("class");
           if(clsName == undefined || clsName.indexOf('li-sel') < 0){
               $(this).parents(".search-class-row").siblings().find("li").removeClass("li-sel");
               $(this).parent().parent().parent().find("li").removeClass("li-sel");
               $(this).addClass("li-sel");
               var li_index=$(this).index();
               //其他row上隐藏
               $(this).parents(".search-class-row").siblings().find(".level-erji,.level-sanji").hide();
               //本行 其他line隐藏
               $(this).parents(".level-line").siblings().find(".level-div").hide();
               //本line 其他同级leveldiv隐藏
               //$(this).parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();
				
               $(this).parent().parent().children(".level-div").show();
               
           }else{
               $(this).removeClass("li-sel");
               //只有当非点击最终叶子节点时才会隐藏
               if($(this).attr("class").indexOf("li-end")<0){
                   //本行 其他line隐藏
                   $(this).parents(".level-line").find(".level-div").hide();
               }

           }

       });
  }*/
       //所在地切换
       $(".search-province a").click(function(){
            $(this).addClass("sel-province").siblings().removeClass("sel-province");
       });

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
                $(this).siblings().find("a").removeClass("up_down");
                
            });
        });


       $(".search-block-b-btns a").click(function(){
            $(this).addClass("s-c-b-sel").siblings().removeClass("s-c-b-sel");
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
	//eachList('${ordJson}',"ord-ws-er");
	//eachList('${danJson}',"dange-ws-er");
	$(function(){
		/*========一般废物列表添加==========*/
		eachList('${ordJson}',"ord-ws-er");
		/*========危险废物列表添加==========*/
		eachList('${danJson}',"dange-ws-er");
		/*==分类列表回显==*/
		/* 一级类别回显  二级类别回显*/
		if('${typeSecond}'!='' || '${typeFirst}'!=''){
			var typeSecond = '${typeSecond}';
			if('${typeFirst}'!='' && '${typeSecond}'==''){
				typeSecond = '${typeFirst}';
			}
			var $this = $(".level-yiji .second_level li[data-id='"+typeSecond+"']");
			debugger;
			$this.addClass("li-sel");
			
			var str = "";
			
			var ulId = $this.parent().attr("id");
			debugger;
			if(ulId.substring(0,3)=="ord"){
				$.each(JSON.parse('${ordJson}'),function(index,item){
					if(item.id == typeSecond){
						$.each(item.subList,function(ind,e){
							str += "<li class='li-end' data-id="+e.id+">"+e.name+"</li>";
						});	
					}
				});
			}else{
				$.each(JSON.parse('${danJson}'),function(index,item){
					if(item.id == typeSecond){
						$.each(item.subList,function(ind,e){
							str += "<li class='li-end' data-id="+e.id+">"+e.name+"</li>";
						});	
					}
				});
			}
			if(str!=null && str!=''){
				$this.parent().parent().find(".level-erji").css({"display":"block"});
			}
			$this.parent().parent().find(".level-erji ul").html(str);
			if('${typeThird}'!=''){
				debugger;
				$(".level-yiji .third_level li[data-id="+'${typeThird}'+"]").addClass("li-sel");
			}
		}
		/*========子列表添加==========*/
		 $(".level-yiji").on("click",".second_level li",function(){
			var typeSecond = $(this).data("id");
			var thisobj = $(this);
			var str = "";
			debugger;
			var ulId = $(this).parent().attr("id");
			if(ulId.substring(0,3)=="ord"){
				$.each(JSON.parse('${ordJson}'),function(index,item){
					if(item.id == typeSecond){
						$.each(item.subList,function(ind,e){
							str += "<li class='li-end' data-id="+e.id+">"+e.name+"</li>";
						});	
					}
				});
			}else{
				$.each(JSON.parse('${danJson}'),function(index,item){
					if(item.id == typeSecond){
						$.each(item.subList,function(ind,e){
							str += "<li class='li-end' data-id="+e.id+">"+e.name+"</li>";
						});	
					}
				});
			} 
		}); 
	});
	function secondLoad(parentId,ulId){
		$.ajax({
			type:"post",
			url:"${ctx}/competition/index/subType",
			data:"id="+parentId,
			async:false,
			success:function(data){
				eachList(data,ulId);
			}
		});
	}
	 function eachList(data, ulId){
		
		var str = "";
		var pDiv = $(".s-c-r-r").width();//42为不限li的长度
		var count = 0;
		var i = 1;
		$.each(JSON.parse(data),function(index,item){
			var temp = item.name;
			var tempint = parseInt((temp.length)*14)+24;//每个li所占长度
			var ulObj = $("#"+ulId);
			if(count <= pDiv){
				count += tempint;
				$("#"+ulId).append("<li data-id="+item.id+" class='second_type'>"+item.name+"</li>");
			}else{
				count = parseInt((temp.length)*14)+24;
				ulId = ulId + i;
				i++;
				var nextLine ="<div class='level-line'>"
		                      +"<ul class='second_level' id="+ulId+">"
		                      +"<li data-id="+item.id+">"+item.name+"</li>"
		                      +"</ul>" 
		                      +"<div class='level-div level-erji'><ul class='third_level'></ul></div>"
		                      +"</div>";
		       ulObj.parents(".level-yiji").append($(nextLine));
			}
		});
	}
	
	
	/*倒计时*/
	function checktime(time){
        if(time<10){
            time="0"+time;
            return time;
        }else{
            return time;
        }
    }
	$(function(){
    	$(".djs_span").each(function(){
    		var that = $(this);
    		var djs_s = that.data("time");
    		djs(djs_s,that);
    	});
    });
	function show_l_time(lefttime,obj){
        
        if(lefttime<=0){
        	obj.text("00天00时00分00秒");

        }else{
            var d = checktime(parseInt(lefttime/(24*60*60)));
            var h = checktime(parseInt(lefttime/(60*60)%24));
            var m = checktime(parseInt(lefttime/60%60));
            var s = checktime(parseInt(lefttime%60));
            obj.text(d+"天"+h+"时"+m+"分"+s+"秒");
            
        }
    }
    function djs(lefttime,obj){
    	var lt=parseInt(lefttime);
    	setInterval(function(){
    		lt=lt-1;
    		show_l_time(lt,obj);
    	},1000);
    	
    }
   $(function(){
	   
	   /*========二级搜索=======*/
	   var typeSecond="${typeSecond}";
	   $(".level-yiji").on("click",".second_level li",function(){
		   typeSecond = $(this).data("id");
		   go('${ctx}/competition/index/search?typeSecond='+typeSecond+'&compTitle=${compTitle}');
	   }); 
	   /*=======一级搜索=======*/
	   var typeFirst = "${typeFirst}";
	   $(".level-yiji .type_first").unbind();
	   $(".level-yiji").on('click','.type_first',function(){
		   debugger;
		   typeFirst = $(this).data("id");
		   go('${ctx}/competition/index/search?typeFirst='+typeFirst+'&compTitle=${compTitle}');
	   });
	   /*========三级搜索=======*/
	   $(".level-yiji").on("click",".third_level li",function(){
		   var typeThird = $(this).data("id");
		   go('${ctx}/competition/index/search?typeSecond='+typeSecond+'&typeThird='+typeThird+'&compTitle=${compTitle}');
	   });
	   /*=======竞品所在地=========*/
	   $(".search-province").on("click","a",function(){
		  var provId = $(this).data("id");
		  go("${ctx}/competition/index/search?typeSecond=${typeSecond}&typeThird=${typeThird}&provId="+provId+'&compTitle=${compTitle}');
	   });
	   /*===竞品所在地回显====*/
	   $(".search-province a").removeClass("sel-province");
	   $(".search-province a[data-id='${provId}']").addClass("sel-province");
	   /*===竞品状态===*/
	   $(".search-block-b .jp_sta").on("click","ul li",function(){
		   var compStatus = $(this).data("comp-status");
		   go("${ctx}/competition/index/search?typeSecond=${typeSecond}&typeThird=${typeThird}&provId=${provId}&compStatus="+compStatus);
	   });
	   /*===竞品状态回显===*/
	   $(".search-block-b .jp_sta ul li").removeClass("selected");
	   $(".search-block-b .jp_sta ul li[data-comp-status='${compStatus}']").addClass("selected");
	   /*===排序======*/
	   $(".mall_sort ul li").click(function(){
		   var orderBy = $(this).data("order");
		   var sort = $(this).data("sort");
           if(sort!=undefined && sort==""){
        	   sort="desc";
           }else{
        	   sort="";
           }
		   go("${ctx}/competition/index/search?typeSecond=${typeSecond}&typeThird=${typeThird}&provId=${provId}&compStatus=${compStatus}&orderBy="+orderBy+"&sort="+sort);
	   });
	   /*===排序回显======*/
	   debugger;
	   if('${sort}'==''){
		   $(".mall_sort .sort_1 li[data-order='${orderBy}']").find("a").removeClass("up_down");
	   }else{
		   $(".mall_sort .sort_1 li[data-order='${orderBy}']").find("a").addClass("up_down");
	   }
	   
	   //上一页
		$(".fanye_left").click(function(){
			if('${currentPage}'!=1){
				window.location.href='${actionUrl}${currentPage - 1}${urlParas}';
			}
		});
		//下一页
		$(".fanye_right").click(function(){
			if('${currentPage}'!='${totalPage}'){
				window.location.href='${actionUrl}${currentPage + 1}${urlParas}';
			}
		});
		//跳转
		 $(" .filp input:last").click(function(){
			var text = $(".filp :text:last").val();
			var re = /^[0-9]+$/;
			if(re.test(text) && parseInt(text)<='${totalPage}'){
				window.location.href='${actionUrl}'+text+'${urlParas}';
			}
		});
   });
   /*发布竞品*/
   function issue(){
   	var loginName = $("#lo").html();
   	if(loginName!=null && loginName!="" && loginName!=undefined){
   		go('${ctx}/home?str=/competition/inforMan/add');
   	}else{
   		showMess("请先登录");
   	}
   }
 //不带确定的提示框
   function showMess(str){
   	$(".popumask").show();
   	$(".pl_normal .pl_content p").html(str);
   	$(".pl_normal").show();
   	$(".close_btn").unbind().click(function(){
   		$(".popumask").fadeOut();
   		$(".pl_normal .pl_content p").html("");
       	$(".pl_normal").hide();
       	clearTimeout(timeout);
   	});
   	var timeout = setTimeout(function(){
   		$(".popumask").fadeOut();
   		$(".pl_normal .pl_content p").html("");
       	$(".pl_normal").hide();
   	},3000);
   }
</script>
</body>
</html>