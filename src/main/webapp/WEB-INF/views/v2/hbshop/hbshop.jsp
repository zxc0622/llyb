<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- saved from url=(0014)about:internet -->
<!-- [if IE 6]><html class="ie ie6 "><![endif] -->
<!-- [if IE 7]><html class="ie ie7 "><![endif] -->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<link rel="shortcut icon" href="/llhb/static/img/llhb/bitbug_favicon.ico">
<title>优蚁环保-环保商城，全国领先的网上环保商城</title>
<meta name="keywords" content="环保商城，环保服务，环保设备，环保原料">
<meta name="description" content="优蚁环保商城-提供先进的设备、原料，各类优质的服务，安全、便捷、高效，让您享受互联网带来的乐趣">
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/v2/hbshop/common.css"/>
<link type="text/css" rel="stylesheet" href="${ctxStatic}/css/v2/hbshop/hbshop.css"/>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic }/layui/css/layui.css" />
<style>

/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1{height:40px;}
.cur_position{font-size:12px; color:#666; margin:15px 0;}

/*搜索模块*/
.search-class{margin-top:4px;color:#666;}
.search-class div{box-sizing: border-box;}
.search-class-row{overflow: hidden;/* margin-bottom: 10px; */border: 1px solid #e1e1e1;}
.search-class-row .mall_lists .top_img{display:block;width:16px;height:16px;background:url(${ctxStatic}/img/v2/hbshop/top.jpg) no-repeat;position: absolute;top:26px;right:0;}
.search-class-row .scrl_1{float:left;height:114px;width:158px;line-height:114px;text-align: center;border-right:1px solid #ccc;
    font-size:16px;
    padding-left:30px;
    background:url(${ctxStatic}/img/v2/hbshop/mall_raw.png) 28px center no-repeat;
    background-color:#f3f3f3;
}
.search-class-row .facility{float:left;height:114px;width:158px;line-height:114px;text-align: center;border-right:1px solid #ccc;
    font-size:16px;
    padding-left:30px;
    background:url(${ctxStatic}/img/v2/hbshop/mall_facility.png) 28px center no-repeat;
    background-color:#f3f3f3;
}
.search-class-row .serve{float:left;width:158px;height:122px;line-height:122px;text-align: center;border-right:1px solid #ccc;
    font-size:16px;
    padding-left:30px;
    background:url(${ctxStatic}/img/v2/hbshop/mall_serve.png) 28px center no-repeat;
    background-color:#f3f3f3;
}
.search-class-row .s-c-r-r{float:left;margin-left: 15px;width:860px;/* border:1px solid #ccc; */position: relative;}
/* .search-class-row .s-c-r-r .row-right-square{position: absolute;top:9px;left:-6px;width:10px;height:10px;border-left: 1px solid #ccc;border-bottom: 1px solid #ccc;background-color: #fff;z-index: 2;transform: rotate(45deg);-ms-transform:rotate(45deg);-moz-transform:rotate(45deg);-webkit-transform:rotate(45deg);-o-transform:rotate(45deg);} */
.ie8 .search-class-row .s-c-r-r .row-right-square{width:0; height:0;}

.search-class ul{/* overflow: hidden; */height:30px;}
.search-class ul li{float:left;height:30px;line-height: 30px; padding-right: 14px; margin-right: 10px;position: relative; cursor: pointer;}
.search-class ul .li-sel{color:#63ac36;}
/*.search-class ul li:hover::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#999;}
.search-class ul .li-sel{color:#63ac36;}
.search-class ul .li-sel::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#666;border-top-color:#5ec420;}
 .search-class ul .li-sel:hover::after{position: absolute;top:13px;right:0px;content: "";width:0px;height:0px;display: block;border:7px solid transparent;border-top-color:#666;border-top-color:#5ec420;} 
.search-class ul .li-end:hover{color:#5EC520;}*/
.search-class ul .li-end:hover::after{display: none;}
.search-class ul .li-end.li-sel::after{display: none;}
.level-div{padding:0 15px;}
.level-erji,.level-sanji{display: none;border:1px solid #63ac36;margin-bottom: 5px;margin-top:9px;

}
.level-erji li,.level-sanji li{font-size: 12px;}
/*搜索模块结束*/

/*所在地区*/
.mall_area{overflow:hidden; margin-bottom:15px;margin-top:14px;}
.mall_area .area_cont{width:1198px; border:1px solid #ccc; overflow:hidden;}
.mall_area .area_cont li{float:left; padding:0 6px;line-height:28px; cursor:pointer;}
.mall_area .area_cont li:hover{color:#5ec420;}
.mall_area .area_cont .cur_area{color:#5ec420;}

/*排序方式*/
.mall_sort{border:1px solid #ccc; line-height:30px; height:30px; margin-bottom:15px;background-color:#f3f3f3;}
.mall_sort .choese_sort{float:left; text-align:center;border-right:1px solid #ccc; position:relative; cursor:pointer;}
.mall_sort .choese_sort .cur_sort{background-repeat:no-repeat; background-position:right center; width:98px; }
.mall_sort .choese_sort .sort_zh{position:absolute; border:1px solid #ccc;padding:0 10px; left:-1px; background-color:white; width:80px;}

.mall_sort .sort_1{float:left;}
.current{background-color:#fff;color:#5ec520;}
.current a{color:#5ec520;}
.mall_sort .sort_1 li{float:left; width:97px;text-align:center;/* padding:0 30px; */ border-right:1px solid #ccc; cursor:pointer;}
.mall_sort .sort_1 li a{background-image:url(${ctxStatic}/img/v2/hbshop/paixu_icon.png); background-repeat:no-repeat; background-position:right center; padding:0 20px 0 0px;}
.mall_sort .sort_1 li .up_down{background-image:url(${ctxStatic}/img/v2/hbshop/paixu_icon1.png); background-repeat:no-repeat; background-position:right center; padding:0 20px 0 0px;}
.main_bottom{overflow:hidden;}
.main_bottom .mall_list{width:1020px;}
.main_bottom .mall_list li{float:left;width:230px;margin-right: 23px;margin-bottom: 15px;height:302px;border:1px solid #ccc;background-color:#f5f5f5;}
.main_bottom .mall_list li:hover{color:#fff;cursor:pointer;}
.main_bottom .mall_list .company{color:#008f00;width:210px;text-align:center;font-size:12px;margin:0 auto;margin-top:10px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
/*筛选结果*/
.left_content{float:left;width:1020px;}
.result_box{margin-bottom: 20px;}
/*列表*/
.result_list{width:954px;}
.result_list .list_row{width:776px; height:131px; border:1px solid #ccc; padding:24px 10px; overflow:hidden; margin-bottom:6px;}
.result_list .list_row:hover{border:1px solid #5cb531;}
.result_list .list_row .list_p{float:left; margin-right:10px;cursor:pointer;}
.result_list .list_row .list_right{float:left; width:628px;}
.result_list .list_row .list_right p{color:#333; border-bottom:1px dashed #ccc; padding-bottom:18px;cursor:pointer;}
.result_list .list_row .list_right p:hover{color:#5EC520;}
.result_list .list_row .list_right .list_aa{padding-top:17px;}
.result_list .list_row .list_right .list_aa dl{float:left; width:460px;}
.result_list .list_row .list_right .list_aa dl dt{margin-bottom:15px; cursor:pointer;}
.result_list .list_row .list_right .list_aa dl dd{overflow:hidden;}
.result_list .list_row .list_right .list_aa dl dd span{color:#5cb531; cursor:pointer;}
.result_list .list_row .list_right .list_aa dl dd a{color:#666; float:right;}
.result_list .list_row .list_right .list_aa .rzh{width:120px; float:right}

.result_list .list_row .list_right .list_aa .rzh li{width:30px; float:left;width:30px; height:50px; margin-left:10px; position:relative;}

/*右侧广告*/
.mall_ad{width:180px; float:right;}
.mall_ad a{width:228px; display:block; margin-bottom:20px; cursor:pointer;}
.mall_ad a img{/*width:100%;*/}

/* typeThird菜单样式 */
.li-end{float: left;height: 30px;line-height: 30px;padding-right: 14px;margin-right: 10px;position: relative;cursor: pointer;}

/* 商品样式 */
.product_img{width:230px;height:220px;text-align: center; vertical-align: middle;display: table-cell;}
.product_name{width:210px;text-align:center;font-size:14px;margin:0 auto;padding-top:18px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.product_img img{/*max-width: 222px;max-height: 220px;*/width:100%;height:100%;}
.main_bottom .mall_list li .following_text{width:230px;height:82px;background-color:#efefef;}
/*分页条样式 */
#result_page{width: 100%;height: 70px;padding-top: 30px;margin-bottom: 15px;overflow: hidden;}
</style>
</head>
<body>

<!-- 引入头部 -->
<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

<!--中间部分start-->
<div class="wrapper">
    <div class="main">
    	<div class="main_row_1">
    	<div id="daohang">
    	<div class="dhleft">
    		<div class="erjimenu">
				<ul>
					<%
						String prodType = ProdTypeUtils.getProdType();
							JSONArray t0 = JSONArray.fromObject(prodType);
							JSONObject t0Jso;
							JSONArray t1;
							JSONObject t1Jso;
							JSONArray t2;
							JSONObject t2Jso;
							int i = 1;
							for (Object t0Obj : t0) {
								request.setAttribute("index", i);
								t0Jso = JSONObject.fromObject(t0Obj);
								t1 = JSONArray.fromObject(t0Jso.get("childrens"));
								request.setAttribute("t1", t1);
								request.setAttribute("t0Jso", t0Jso);
					%>
					<li class="li${index }">
						<div class="mulu">
							<a href="javascript:void(0)" class="type_first" data-id="${t0Jso.get('id')}"></a><span>${t0Jso.get('name')}</span>
						</div>
						<div class="hidemenu${(index-1)==0?'':(index-1) }">
							<div class="hideleft">
								<%
									for (Object t1Obj : t1) {
												t1Jso = JSONObject.fromObject(t1Obj);
												t2 = JSONArray.fromObject(t1Jso.get("childrens"));
												request.setAttribute("t2", t2);
												request.setAttribute("t1Jso", t1Jso);
								%>
								<dl class="dl3">
									<div style="width: 84px; float: left; margin-right: 10px;">
										<dt>
											<a href="javascript:void(0)" class="type_second" data-id="${t1Jso.get('id')}">${t1Jso.get('name')}</a>
										</dt>
									</div>
									<div style="width: 683px; float: left;">
										<%
											for (Object t2Ojb : t2) {
															t2Jso = JSONObject.fromObject(t2Ojb);
															request.setAttribute("t2Jso", t2Jso);
										%>
										<dd>
											<a href="javascript:void(0)" class="type_third" data-id="${t2Jso.get('id')}">${t2Jso.get('name') }</a>
										</dd>
										<%
											}
										%>
									</div>
								</dl>
								<%
									}
								%>
							</div>
							<div class="hideright"></div>
						</div>
					</li>
					<%
						i++;
							}
					%>
				</ul>
			</div></div></div>
    	</div>
        <!-- 搜索分类模块开始  -->
        <div class="search-class">
            <!-- 第一行原料 -->
            <div class="search-class-row" style="border-bottom:0;">
                <div class="s-c-r-l scrl_1" data-id="${typeList[0].id}">${typeList[0].name}</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>
                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji" style="padding-top:20px;">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul class="mall_lists">
                            	<li class="type_first" data-id="${typeList[0].id}">不限</li>
                                <c:forEach items="${t0}" var="t">
                                	<li class="type_second" data-id="${t.id}">${t.name}</li>
                                </c:forEach>
                            </ul>
                            
                            <div class="level-div level-erji" style="margin-top:9px;">
                                <div class="level-line" >
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                            
                            <ul class="mall_lists">
                            	<li class="type_first" data-id="${typeList[0].id}">不限</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第一行原料 结束 -->
            <!-- 第二行设备开始 -->
            <div class="search-class-row" style="border-bottom:0;">
                <div class="s-c-r-l facility" style="height:114px;line-height:114px;" data-id="${typeList[1].id}">${typeList[1].name}</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji" style="padding-top:4px;">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul class="mall_lists">
                            	<li class="type_first" data-id="${typeList[1].id}">不限</li>
                                <c:forEach items="${t1}" var="t">
                                	<li class="type_second" data-id="${t.id}">${t.name}</li>
                                </c:forEach>
                            </ul>
                            
                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 第二行设备结束 -->
            <!-- 第三行服务开始 -->
            <div class="search-class-row">
                <div class="s-c-r-l serve" data-id="${typeList[2].id}">${typeList[2].name}</div>
                <div class="s-c-r-r">
                    <div class="row-right-square"></div>

                    <!-- 一级菜单 -->
                    <div class="level-div level-yiji">
                        <!-- linediv -->
                        <div class="level-line">
                            <ul class="mall_lists">
                            	<li class="type_first" data-id="${typeList[2].id}">不限</li>
                                <c:forEach items="${t2}" var="t">
                                	<li class="type_second" data-id="${t.id}">${t.name}</li>
                                </c:forEach>
                            </ul>
                            
                            <div class="level-div level-erji">
                                <div class="level-line">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                            
                        </div>
                    </div> 
                </div>
            </div>
            <!-- 第三行服务结束 -->
        </div>
        <!-- 搜索模块结束 -->
        <!--所在地start-->
    	<div class="mall_area" id="tp">
            <ul class="area_cont font_1 color_1">
                <p style="width:158px;height:60px;line-height:60px;float:left;text-align:center;background-color:#f3f3f3;font-size:16px;margin-right: 22px;border-right:1px solid #ccc;">所在地</p>
            	<li class="cur_area prov_id" data-id="">不限</li>
            	<c:forEach items="${provList}" var="p">
	            	<li data-id="${p.id}" class="prov_id">${p.name}</li>
            	</c:forEach>
            </ul>
        </div>
        <!--所在地end-->
        <!--排序方式start-->
        <div class="mall_sort font_1 color_1">
        	<ul class="choese_sort">
            	<li class="cur_sort current">综合</li>
            </ul>
            <ul class="sort_1">
                <li data-model="low_price"><a>价格</a></li>
                <li data-model="page_view"><a>人气</a></li>
                <li data-model="per_flag"><a>信誉</a></li>
                <li data-model=""><a>销量</a></li>
            </ul>
           <!--  <ul class="sort_right">
               <li><a href="javascript:void(0)">大图</a><span>&nbsp;</span></li>
               <li><a href="javascript:void(0)">列表</a><span>&nbsp;</span></li>
           </ul> -->
        </div>
        <div class="main_bottom">
            <!--筛选结果start-->
            <div class="left_content">
	            <div class="result_box">
	                <div class="result_list">
	                    <ul class="mall_list">
	                        <c:forEach items="${proList}" var="i">
								<li data-id="${i.id}">
		                            <p class="product_img"><img src="${i.pic1}"></p>
		                            <div class="following_text">
			                            <p class="product_name">${i.pro_name}</p>
			                            <p class="company">${i.company_name}</p>
		                            </div>
		                        </li>
	                        </c:forEach>
	                    </ul>
	                </div>
	            </div>
	            
	            <div id="result_page">
	            
	            </div>
	            
            </div>
            <!--筛选结果end-->
            <div class="mall_ad">
	            <!--<a><img src="${ctxStatic}/img/v2/hbshop/mall_bottom_right.jpg"></a>-->
            	<c:forEach items="${adImgList}" var="a" end="6">
	                <a><img src="${a.getStr('pic_addr')}"></a>
            	</c:forEach>
            </div>
        </div>
    </div>
</div>
<!--中间部分end-->
<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>
</body>
<script type="text/javascript" src="${ctxStatic}/layui/layui.js"></script>
<script type="text/javascript">
$(function(){
	var typeFirst = "";
	var proName = "";
	var typeSecond = "";
	var typeThird = "";
	var provId = "" ;
	var orderBy = "comprehensive";
	var sort = "DESC";
	var view = "bigPic";
	var curPage = "";
	
	var showModel = "bigPic";//用于切换显示视图
		
	//加载页面数据通用方法
	function searchProduct(){
		var currentPage = 0;
		var totalPage = 0;
		var str ="";
		var obj = "";
		var auth_flag = 2;//企业认证默认为未认证
		var youyi_flag = 2;//优蚁认证默认为未认证
		var per_flag = 2;//个人认证默认为未认证
		var pageSize = $(".main_bottom").attr("data-pagesize");
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/searchProduct",
			async:false,//异步提交，即在ajax提交时，锁定浏览器页面
			data:"typeFirst="+typeFirst+"&proName="+proName+"&typeSecond="+typeSecond+"&typeThird="+typeThird
				+"&provId="+provId+"&orderBy="+orderBy+"&sort="+sort+"&curPage="+curPage+"&view="+view,
			success:function(data){
				$(".mall_list").empty();
				$.each(data,function(index,item){
					if(item.proCount != 0){
						var pic = "";
						//保证图片加载
						if(item.pic1 !=null && item.pic1 != "" && item.pic1 != "undefined"){
							pic = item.pic1;
						}else if(item.pic2 !=null && item.pic2 != "" && item.pic2 != "undefined"){
							pic = item.pic2;
						}else if(item.pic3 !=null && item.pic3 != "" && item.pic3 != "undefined"){
							pic = item.pic3;
						}
						//判断认证结果
						if(item.youyi_flag == "1"){
							youyi_flag = 1;
						}else{
							youyi_flag = 2;
						}
						if(item.auth_flag == "1"){
							auth_flag = 1;
						}else{
							auth_flag = 2;
						}
						if(item.per_flag == "1"){
							per_flag = 1;
						}else{
							per_flag = 2;
						}
						if(showModel=="list"){
							totalPage = Math.ceil(item.proCount/8);//总页数，用户创建页码
						}else if(showModel=="bigPic"){
							var proItem='<li data-id="'+item.id+'">'+
				                            '<p class="product_img"><img src="'+pic+'"></p>'+
				                            '<div class="following_text">'+
					                            '<p class="product_name">'+item.pro_name+'</p>'+
					                            '<p class="company">'+item.company_name+'</p>'+
				                            '</div>'+
				                        '</li>';
	                        
	                        $(".mall_list").append(proItem);
	                        
	                        totalPage = Math.ceil(item.proCount/20);//总页数，用户创建页码
						}
					}
				});
				$("html,body").animate({scrollTop:$("#tp").offset().top},100);
			}
		});
		return totalPage;//返回总页数
	}

	//分类中点击变色，去除下级菜单通用方法
	function search_class(dom){
	    //$(".search-class ul li").click(function(){
	        dom.parents(".search-class-row").siblings().find("li").removeClass("li-sel");
	        dom.parent().parent().parent().find("li").removeClass("li-sel");
	        dom.addClass("li-sel");
	        var li_index=dom.index();
	        //其他row上隐藏
	        dom.parents(".search-class-row").siblings().find(".level-erji,.level-sanji").hide();
	        //本行 其他line隐藏
	        dom.parents(".level-line").siblings().find(".level-div").hide();
	        //本line 其他同级leveldiv隐藏
	        dom.parent().parent().children(".level-div").eq(li_index).siblings(".level-div").hide();

	        //$(this).parent().parent().children(".level-div").eq(li_index).show();
	    //});
	}
	
	//type_first菜单点击事件
	$(".type_first").click(function(){
		search_class($(this));
		$("body .top_img").remove();
		$(this).parents(".level-line").find(".level-div").hide();
		
		typeFirst = $(this).attr("data-id");
		typeSecond = "";
		typeThird = "";
		curPage = "";
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
		
	});
	
	//type_second菜单点击事件
	$(".type_second").click(function(){
		search_class($(this));
		
		//箭头样式
		$("body .top_img").remove();
		$(this).siblings().children().remove();
		$(this).append('<div class="top_img"></div>');
		var width=($(this).width()+14)/2;
		$(".top_img").css("right",width);
		
		//查询下级菜单
		var leldiv = $(this).parent().parent().children(".level-div");
		leldiv.find("ul").empty();
		var parentId = $(this).attr("data-id");
		$.ajax({
			type:"get",
			url:"${ctx}/hbshop/selectSubType",
			data:"parentId="+parentId,
			async:false,
			success:function(data){
				$.each(data,function(index,item){
					leldiv.find("ul").append('<li class="type_third" data-id="'+item.id+'" class="li-end">'+item.name+'</li>');
					leldiv.show();
				});
			}
		});
		
		typeFirst = "";
		typeSecond = $(this).attr("data-id");
		typeThird = "";
		curPage = "";
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
	});
	
	//type_third菜单点击事件
	$("body").on("click",".type_third",function(){
		search_class($(this));
		
		typeFirst = "";
		typeSecond = "";
		typeThird = $(this).attr("data-id");
		curPage = "";
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
	});
	
	//省份点击事件
	$(".prov_id").click(function(){
		//改变选中
		$(".mall_area .area_cont li").removeClass("mall_area area_cont cur_area");
		$(this).addClass("cur_area");
		
		provId = $(this).attr("data-id");
		curPage = "";

		orderBy="comprehensive";
		sort="DESC";
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
	});
	
	//综合排序点击事件
	$(".mall_sort .choese_sort .cur_sort").click(function(){
		$(".mall_sort .sort_1 li").removeClass("current");
		$(".mall_sort .sort_1 li").find("a").removeClass("up_down");
		$(this).addClass("current");
		
		orderBy="comprehensive";
		sort="DESC";
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
	})
	
	//别的排序点击事件
	var sortFlag = false;//正序、倒序排序标志
	$(".mall_sort .sort_1 li").click(function(){
		$(".mall_sort .choese_sort .cur_sort").removeClass("current");
		$(this).addClass("current").siblings().removeClass("current");
		$(this).find("a").toggleClass("up_down");
		$(".mall_sort .sort_1 li").not($(this)).find("a").removeClass("up_down");
		
		orderBy =  $(this).attr("data-model");
		if(sortFlag){
			sort = "";
			sortFlag = !sortFlag;
		}else{
			sort="DESC";
			sortFlag = !sortFlag;
		}
		
		//查询商品并创建分页
		var tc = searchProduct();
		getLayPage(tc);
	});
	
	var pages = '${countPage}';
	getLayPage(Number(pages));
	//分页方法
	function getLayPage(cp){
		$("#result_page").empty();
		layui.use(['laypage', 'layer'], function(){
			var laypage = layui.laypage,layer = layui.layer;
			//调用分页
			laypage({
				cont: 'result_page',
				pages: cp,
				last: cp,
				skip: true,
				skin: '#5ec520',
				jump: function(obj,first){
					if(!first){
						curPage = obj.curr;
						searchProduct();
						//$("html,body").animate({scrollTop:$("#tp").offset().top},100);
					}
				}
			});
		});
		
	}
	
	//分页跳转按钮hover效果
	$("#result_page").on("mouseover mouseout",".layui-laypage-btn",function(event){
		if(event.type == "mouseover"){
			$(this).css("background-color","#5ec520");
			$(this).css("color","#FFF");
		}else if(event.type == "mouseout"){
			$(this).css("background-color","#FFF");
			$(this).css("color","#000");
		}
	});
	
});
</script>
<!--鼠标经过文字变色-->
 <script type="text/javascript">
$(document).ready(function(){
	//商品列表经过变色
	$(".main_bottom .mall_list").on("mouseover","li",function(){
		$(this).children('.following_text').children('.company').css("color","#fff");
		$(this).children('.following_text').children('.product_name').css("color","#fff");
		$(this).children('.following_text').css("background-color","#63ac36");
	});
	$(".main_bottom .mall_list").on("mouseout","li",function(){
		$(this).children('.following_text').children('.company').css("color","#008f00");
		$(this).children('.following_text').children('.product_name').css("color","#008f00");
		$(this).children('.following_text').css("background-color","#efefef");
	});
	/*
	$(".mall_list li").mouseover(function(){
		$(this).children('.following_text').children('.company').css("color","#fff");
		$(this).children('.following_text').children('.product_name').css("color","#fff");
		$(this).children('.following_text').css("background-color","#63ac36");
	});
	$(".mall_list li").mouseout(function(){
		$(this).children('.following_text').children('.company').css("color","#008f00");
		$(this).children('.following_text').children('.product_name').css("color","#008f00");
		$(this).children('.following_text').css("background-color","#efefef");
	});*/
	
	//商品列表点击事件
	$(".main_bottom .mall_list").on("click","li",function(){
		var url = "${ctx}/mall/detail/"+$(this).attr("data-id");
		window.open(url,"_blank");
	});
	
	$(".hidemenu").eq(0).css("display","block");
	$(".erjimenu ul li").eq(0).css("background-color","#5c635c");
	$(".erjimenu ul li").mouseenter(function() {
		$(".erjimenu ul li").css("background-color","#3c3c3c");
		$(this).css("background-color","#5c635c");
	});
	
	$(".erjimenu ul li").mouseleave(function() {
		$(this).css("background-color","#3c3c3c");
		$(".erjimenu ul li").eq(0).css("background-color","#5c635c");
	});
	
	if('${prodType}' != ''){
		$("[data-id='${prodType}']").click();
		console.log($("[data-id='${prodType}']"));
	}
	
});
</script>

</html>