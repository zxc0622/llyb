<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
        <title>优蚁环保-环保报价,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
        <link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/index.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huanbaobaojia_index.css"/>
        <style>
            
            /*页面修改*/
            .header_banner .b_l_nav li{width:118px;}
            .banner_left{border:1px solid #ccc;}
            .header_banner{overflow: visible;height:45px;}
            .header_banner .b_l_form form{padding:26px 15px;}
            .main{padding-bottom: 130px;}
            
            .help_me,.add_new{position:absolute;right:0;width:85px;background:#ccc;}
            .help_me{top:10px}
            .page_btn_sel{background:#5CB531}
            .add_new{top:45px}
            .header_middle .header_search .h_s_middlebefore{z-index:1;content: "";display: block;width: 20px;height: 24px;background: url(${ctxStatic}/img/llhb/icon.png) -240px -120px no-repeat;position: absolute;left:5px;top:7px;}
            .li-sel {
                color: #5EC520;
            }
        </style>

        <%-- <script type="text/javascript" src="${ctxStatic}/js/llhb/proHome.js"></script> --%>
        <script type="text/javascript">
        
        </script>   
    </head>
    <body>
        <!--头部 start-->
        <header>
            <div class="line_top"></div>
            <div class="headerBox">
			<%@ include file="/WEB-INF/views/include/headertop.jsp"%>
                <!--头部中部 start-->
                <div class="header_middle" style="height: 140px;">
                    <h1 class="header_logo">
                        <a href="${ctx }/index">
                            <img src="${ctxStatic}/img/llhb/mall_logo.png" class="logoimg"/>
                        </a>
                    </h1>
                    <div class="header_search"style="margin-left:106px">
                        <div class="h_s_top">
                            <input type="hidden" id="biaoji" value="0">
							 <a class="li-sel" href="javascript:che(0);">企业库</a>&nbsp;<span>|</span>
                        &nbsp;<a href="javascript:che(1);">环保需求</a>&nbsp;<span>|</span>
                        &nbsp;<a href="javascript:che(2);">商城</a>&nbsp;<span>|</span>
                        &nbsp;<a href="javascript:che(3);">资讯</a>
                        </div>
                        <div class="h_s_middle font_1">
                        	<span class="h_s_middlebefore"></span>
							<input type="search" id="searchtext" placeholder="请输入关键字"/>
							<a class="font_3" id="searchtop" href="javascript:goPage();">搜索</a>
							<a class="font_3" href="javascript:void(0);" onclick="window.open('http://hbxq.yyhb365.com/youyipc.html');" style="width:135px; margin-left:50px;background-color:#ee7800;">发布环保需求</a>
						</div>
						<div class="h_s_bottom font_1">
							<c:forEach items="${re }" var="re">
		                    	<a href="${ctx}/solidsupply/supplyList?typeId=${re.id }" target="_black"  >${re.pname }&nbsp;</a>
		                    </c:forEach>
						</div>
					</div>
					<div class="header_right">
						<%-- <ul>
							<c:forEach items="${ads }" var="ads">
								<c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
									<li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
								</c:if>
							</c:forEach>
						</ul>
						<a href="javascript:void(0);" class="h_r_next">&gt;</a> --%>
					</div>
                    <div class="clear"></div>
                </div>
                <!--头部中部部 end-->
            </div>

            <!--头部banner start-->
            <div class="header_banner"style="margin-top: 15px;">
                
                <!--头部导航 start-->
                 <%@ include file="/WEB-INF/views/include/headerbanner.jsp"%>

                <!--头部banner左侧 start-->
                <div class="b_l_img"><img src="${ctxStatic}/img/llhb/banner_left_hbbj.png"/></div>
                <div class="banner_left">
                    <ul class="b_l_nav">
                        <li style="display: none"><a href="javascript:void(0);" class="b_l_nav_sel">工程报价</a></li>
                        <li data-in="0"><a href="javascript:void(0);"class="b_l_nav_sel" data-in="0">环评报价</a></li>
                        <li data-in="1"><a href="javascript:void(0);" data-in="1">监测报价</a></li>
                    </ul>
                    <div class="b_l_form" style="position:relative;">
                        <p class="b_l_formTop" style="position:absolute; top:-30px;">专业精准,快速响应</p>
                        <p class="b_l_formTop" style="position:absolute; top:-30px;">一站式环评服务，尽在优蚁环保</p>
                        <p class="b_l_formTop" style="position:absolute; top:-30px;">按项报价，专业直观</p>
                        <form class="font_1" >
                            <input type="text" placeholder="您的姓名" name="name"/>
                            <input type="text" placeholder="您的电话" name="tel"/>
                            <input type="text" placeholder="公司名称" name="comp_name"/>
                            <input type="text" placeholder="备注信息（选填）" name="remarks"/>
                            <div>
                                <select class="b_l_f_province">
                                    <option value="">省</option>
                                        <c:forEach var="province" items="${provinceList }">
                                            <c:choose>
                                                <c:when test="${oriProId eq province.id}">
                                                    <option value="${province.id}" selected>${province.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${province.id}">${province.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                    </c:forEach>
                                </select>
                                <select class="b_l_f_city">
                                    <option value="">市</option>
                                </select>
                                <div class="clear"></div>
                            </div>
                            <input class="banner_left_submit" type="button" value="立即申请"/>
                        </form>
                    </div>
                    
                </div>
                <!--头部banner左侧 end-->
                

            </div>
            <!--头部banner end-->
        </header>
        <!--头部 end-->
        
        <!--中间部分 start-->
        <div class="wrapper">
            <!--回到顶部悬窗 start-->
            <%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
            <!--回到顶部悬窗 end-->

            <!--中间内容 start-->
            <div class="main">
                <div class="hbbj_main_l contentNav">
                    <p>为您提供环保报价参考</p>
                    <p>
                        平台为您推荐信誉良好、经验丰富的环保公司，帮您<br/>量身制定环保解决方案，快速响应您的需求
                    </p>
                    <p>
                        您只需花10秒填写简单的项目信息，平台 在线智能为<br/>您报价，轻松解决预算烦恼。
                    </p>
                    <ul>
                        <li>
                            <p>免费</p>
                            <p>报价</p>
                        </li>
                        <li>
                            <p>推荐优质环保</p>
                            <p>服务公司</p>
                        </li>
                        <li>
                            <p>确定环保</p>
                            <p>报价方案</p>
                        </li>
                    </ul>
                </div>
                <div class="hbbj_main_mid">
                    <h5>最新申请环保服务</h5>
                    <div class="for_scroll_table" style="position:relative; height: 43px;"></div>
                    <div class="scroll_list"style="position:relative;height:320px;width:1000px;overflow:hidden;display:block;">
	                    <table>
	                    	<thead class="scroll_thead">
	                    		<tr>
		                            <td>用户名</td>
		                            <td>服务类型</td>
		                            <td>项目地点</td>
		                            <td>申请时间</td>
		                            <td>项目情况</td>
		                        </tr>
	                    	</thead>
	                        <tbody>
	                        	<c:forEach items="${sss }" var="s">
			                        <tr>
			                            <td>${s.name }</td>
			                            <c:if test="${s.num eq 1 }">
				                            <td>环评报价</td>
			                            </c:if>
			                             <c:if test="${s.num eq 2 }">
				                            <td>监测报价</td>
			                            </c:if>
			                            <td>${s.aaname }</td>
			                            <td>${fn:substring(s.date, 0, 10)}</td>
			                            <td>公司名为${s.comp_name },项目名称为${s.pro_name },该项目位于${s.aname }${s.aaname },类别为${s.hname }</td>
			                        </tr>
		                        </c:forEach>
	                        </tbody>
	                    </table>
                    </div>
                    
                </div>
                <div class="hbbj_main_b hbbj_main_b1">
                    <h5>用户只需要提供简单的项目信息<br/>平台十秒即可反馈报价</h5>
                    <div class="fl">
                        <p>简单快捷</p>
                    </div>
                    <div class="fl">
                        <p>十秒反馈报价</p>
                    </div>
                </div>
                <div class="hbbj_main_b hbbj_main_b2">
                    <h5>由环保资深专家团队分析大量的环保<br/>服务公司的实际报价信息</h5>
                    <div class="fl">
                        <p>建立平台报价信息库</p>
                    </div>
                    <div class="fl">
                        <p>为您提供精确智能报价</p>
                    </div>
                </div>
                <div class="hbbj_main_b hbbj_main_b3">
                    <h5>为您推荐专业高效<br/>质优价廉的环保服务公司</h5>
                    <div class="fl">
                        <p>专业靠谱</p>
                    </div>
                    <div class="fl">
                        <p>精心推荐</p>
                    </div>
                </div>
            </div>
            <!--中间内容 end-->
        </div>
        <!--中间部分 end-->

        <!--底部 start-->
  <footer>
    <%@ include file="/WEB-INF/views/include/footer_top.jsp"%>
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp"%>
  </footer>
<%@ include file="/WEB-INF/views/include/rightLineShare.jsp"%>
        <!--底部 end-->

        <!-- 首页底部弹出 -->
      <!--   <div class="index-bottom-pl">
            <div class="index-bottom-pl-mask"></div>
            <div class="index-bottom-pl-main">
                <a href="javascript:void(0)"class="font_3">X</a>
                <div class="i-b-pl-mainl">
                    
                </div>
                <div class="i-b-pl-mainr">
                    <div class="i-b-pl-mr-l">
                        <p>今日已有<span>2490</span>人获取环保报价</p>
                        <div class="font_1">
                            <input type="text"style="width:130px"placeholder="手机号">
                            <input type="text"style="width:80px"placeholder="验证码">
                            <a href="javascript:void(0)"class="btn "style="width:100px;">点击获取验证码</a>
                        </div>
                        <div class="font_1">
                            <input type="text"style="width:100px"placeholder="姓名">
                            <input type="text"style="width:110px"placeholder="项目名">
                            <a href="javascript:void(0)" class="btn"style="width:100px;background-color:#ee7800">提交</a>
                        </div>
                    </div>
                    <div class="i-b-pl-mr-r">
                        <span>扫一扫,关注有礼</span>
                        <div class="saomacode">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="index-bottom-pl-changel">
                
        </div>
        <!-- 首页底部弹出 结束-->
        
        <div class="popumask"></div>
        <!-- 立即申请弹出层 环评报价-->
        <div class="populayer pl_index_shenqing">
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content " style="position:relative">
                <h3>恭喜您申请成功 !</h3>
                <p class="font_3">30分钟内将有环保顾问与您联系,确认您的需求 !</p>
                <div class="per-row row-xiangmuleibie">
                    <span>项目类别 :</span>
                    <select name="" id="offhead">
                    	<option value="0">&nbsp;</option>
                        <c:forEach items="${offHeads }" var="h">
                        	<option value="${h.hid }">${h.hname }</option>
                        </c:forEach>
                        
                    </select>
                    <select name="" id="headline" class="headdline">
                    	<option value="0">&nbsp;</option>
                    </select>
                </div>
                <div class="per-row row-jianshedidian">
                    <span>建设地点 :</span>
                    <select name="" id="pop_province" class="pop_province">
                        <option value="0">省</option>
                        <c:forEach var="province" items="${provinceList }">
                                  <option value="${province.id}">${province.name}</option>
                        </c:forEach>               
                    </select>
                    <select name="" id="pop_city" class="pop_city">
                        <option value="0">市</option>
                    </select>
                    <select name="" id="county">
                        <option value="0">县</option>
                    </select>
                </div>
              
                <div class="per-row check">
                    
                </div>
                <div class="per-row">
                    <span>项目名称 :</span>
                    <input type="text" id="onename">
                </div>
                <div class="per-row">
                    <span>姓&#12288;&#12288;名 :</span>
                    <input type="text" id="name">
                </div>
                <div class="per-row">
                    <span>公司名称 :</span>
                    <input type="text" id="companyName">
                </div>
                <div class="per-row">
                    <span>手机号码 :</span>
                    <input type="text" id="phone">
                </div>
               <%-- <div class="per-row">
                    <input type="text"placeholder="手机号"style="width:152px" readonly>
                    <input type="text"placeholder="验证码"style="width:100px">
                    <a href="javascript:getcode(1)" class="btn verfone">点击获取验证码</a>
                </div>--%>
                <div style="margin-top: 30px;">
                    <a href="javascript:void(0)" class="btn" id="submitfirst">立即提交</a>
                </div>
               <%-- <a href="javascript:helpme()" class="btn help_me page_btn_sel" >帮我填写</a>
                <a href="javascript:addnew()" class="btn add_new page_btn_sel" >推荐公司</a>
               --%>
                
            </div>
        </div>
        <!-- 立即申请结束 环评报价-->
        <!-- 立即申请结束 监测报价-->
        <div class="populayer pl_index_shenqing_jiance">
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content "style="position:relative">
                <h3>恭喜您申请成功 !</h3>
                <p class="font_3">30分钟内将有环保顾问与您联系,确认您的需求 !</p>
                <div class="per-row row-xiangmuleibie">
                    <span>项目类别 :</span>
                    <select name="" id="surHead">
                        <option value="0">&nbsp;</option>
                        <c:forEach items="${surHeads }" var="h">
                        	<option value="${h.hid }">${h.hname }</option>
                        </c:forEach>
                    </select>
                    <div class="myselect"tabindex="1">
                        <span class="myoption">请选择</span>
                        <ul>
                         
                        </ul>
                    </div>
                </div>
                <div class="per-row row-jianshedidian">
                    <span>建设地点 :</span>
                    <select name="" id="" class="sur_province">
                        <option value="0">省</option>
                        <c:forEach var="province" items="${provinceList }">
                                  <option value="${province.id}">${province.name}</option>
                        </c:forEach>  
                    </select>
                    <select name="" id="surcity">
                        <option value="0">市</option>
                    </select>
                    <select name="" id="surcountry">
                        <option value="0">县</option>
                    </select>
                </div>
                <div class="select_result">
                    <div class="s_r_l fl">
                        <div class="s_r_l_div">
                           
                        </div>
                        <div class="s_r_l_fanye">
                          
                        </div>
                    </div>                    
                    <div class="s_r_r fl">
                      
                    </div>
                </div>
                <div class="per-row">
                    <span>项目名称 :</span>
                    <input type="text" id="twoname">
                </div>
                <div class="per-row">
                    <input type="text"placeholder="手机号"style="width:152px" readonly>
                    <input type="text"placeholder="验证码"style="width:100px">
                    <a href="javascript:getcode(2)"class="btn verftwo">点击获取验证码</a>
                </div>
                <div style="margin-top: 30px;">
                    <a href="javascript:void(0)" class="btn" id="submitsecond">立即提交</a>
                </div>
                <a href="javascript:helpme()" class="btn help_me page_btn_sel" >帮我填写</a>
                <a href="javascript:addnew()" class="btn add_new page_btn_sel" >推荐公司</a>
            </div>
        </div>
        <!-- 立即申请结束 监测报价-->
        <!--意见反馈开始-->
        <div class="populayer pl_index_view">
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_view">
                <div class="per-row">
                    <p><span>*</span>留言内容</p>
                    <textarea></textarea>
                </div>
                <div class="per-row">
                    <p>与您联系</p>
                    <ul class="contact">
                        <li><input class="need" type="radio" name="con" checked>需要</li>
                        <li><input class="no_need" type="radio" name="con">不需要</li>
                    </ul>
                </div>
                <div class="per-row">
                    <p>联系人</p>
                    <input type="text">
                </div>
                <div class="need_no">
                    <div class="per-row">
                        <p>联系电话</p>
                        <input type="text">
                    </div>
                    <div class="per-row">
                        <p>电子邮件</p>
                        <input type="text">
                    </div>
                    <div class="per-row">
                        <p>QQ</p>
                        <input type="text">
                    </div>
                </div>
                <div class="per-row">
                    <p><span>*</span>验证码</p>
                    <input type="text" style="width:100px;">
                    <a><input type="button" value="点击显示" style="background-color:#ccc;"></a>
                </div>
                <div class="per-row">
                    <p>&nbsp;</p>
                    <input type="button" value="提交">
                    <input type="reset" value="重写">
                </div>
                
            </div>  
            <!--意见反馈结束--> 
        </div>
        <div class="popumask aa" style="z-index: 1;"></div>
		<div class="populayer pl_normal bb" style="z-index:22;">
		    <div class="layer_top">
		    	<span>提示</span>
		        <a href="javascript:void(0)" class="close_btn">X</a>
		    </div>
		    <div class="pl_content font_3">
		        <p></p>
		    </div>
		</div>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script language="JavaScript" type="text/javascript">
            if ((navigator.userAgent.indexOf('MSIE') >= 0)
                    && (navigator.userAgent.indexOf('Opera') < 0)){
                $(".populayer").css("left","30%").css("top","35%");
                $(".pl_index_shenqing").css("left","30%").css("top","15%");

            }
        </script>
        <script>
        $(function(){
        	//表格样式初始化
        	/* $(".scroll_tbody tr:first").children("td").each(function(){
        		var index = $(this).index();
        		$(".scroll_thead tr th").eq(index).width($(this).width());
        		console.log($(this).width());
        	}); */
        	
        	
        	
        	$(".header_nav ul li").eq(5).addClass("header_nav_sel");
        	pop=0;
        	
        	clonethead();
        	
        	smooth_scroll(".scroll_list","tr");
        	if('${inname}'){
        		 submit();
        	}
        	var abc = $(".b_l_f_province option:selected").val();
            if(abc!=""){
        		selectCity();
        	}
        });
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
            if($(this).parents(".populayer").hasClass("pl_index_shenqing")||$(this).parents(".populayer").hasClass("pl_index_shenqing_jiance")){
            	//location.reload();
            }
            
        });
		$(function(){
			$(".b_l_nav li a").on("click",function(){
				
				$(this).addClass("b_l_nav_sel");
				$(this).parent().siblings().find("a").removeClass("b_l_nav_sel");
			});
            Myselect();
            var winWidth = $(window).width();
            var halfPosition = (winWidth - $(".main").width())/2;
            $(".banner_left").css({left:halfPosition+$(".main").width()-$(".banner_left").width()});  
            $(".b_l_img").css({left:halfPosition+$(".main").width()-10});
            
            
        });
        // 模拟select标签
        var counts=0;//监测的 行 选择的项数
        var mount=[];//监测 行 选择的 ids
        var types=[];//监测选择的项
        var pid="";//环评或监测的id
        var details=[];
        var citynum="";
        var time_on=true;//验证码
        var timer = null;
        var phone="";
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
   				url : "${ctx}/protection/getSurDetail",
   				data : "surhead=" +surhead+"&surline="+mount ,
   				dataType : 'json',
   				success : function(data) {
   					if(data == null){return ;}
                    types=[];
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
        	//第几个省市选择框
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
            $(".row-xiangmuleibie:eq(0) select:eq(0)").click(loadLineOff);
            //环评加载details
            $(".row-xiangmuleibie:eq(0) select:eq(1)").change(loadDetailsOff);
            //检测加载line
            $(".row-xiangmuleibie:eq(1) select").change(loadSurOff);
            //检测加载details
            //$(".row-xiangmuleibie:eq(0) select:eq(1)").change(loadDetailsSur);
            //环评弹出框的提交
            $("#submitfirst").click(envSubmit);
          	//检测弹出框的提交
            $("#submitsecond").click(monSubmit);
          	//环评验证码
          	//$(".verfone").on("click",checkcode);
            //监测验证码
          	//$(".verftwo").on("click",checkcode);
        	var prov_id = $(".b_l_f_province option:selected").val();
        	var city_id = $(".b_l_f_city option:selected").val();
            $(".pop_province option").each(function (){
					if(prov_id==$(this).val()){
						$(this).attr('selected','selected');
					}
				}); 
            $('#searchtext').bind('keypress',function(event){
	            if(event.keyCode == "13")  {
	            	goPage();
	            }
	        });
			
            h_s_bottom_a();
        });
        function selectCity(str){
           var city_id = str;
           var province="";
           if(pop == 0){
        	   province = $(".b_l_f_province option:selected").val();
        	   $(".b_l_f_city").text('');
           }else if(pop==1){
        	   if('${inprov}'){
        		   province = '${inprov}';
        	   }else{
	        	   province = $(".pop_province option:selected").val();
        	   }
        	   $(".pop_city").text('');
           }else if(pop == 2){
        	   province = $(".sur_province option:selected").val();
        	   $("#surcity").text('');
           }
      	   if(!province){
      		   var htmlss="<option value='0'>市</option>";
      		   if(pop==0){
          		   $(".b_l_f_city").append(htmlss);
      		   }else if(pop == 1){
      			 $(".pop_city").append(htmlss);
      		   }else if(pop ==2){
      			 $("#surcity").append(htmlss);
      		   }

      	   }else{
            	   $.ajax({
         			type : "POST",
       				url : "${ctx}/protection/getCity",
       				data : "province=" + province,
       				dataType : 'json',
       				success : function(data) {
       					var htmls = "<option value='0'>市</option>";
       					$.each(data,function(index, item) {
       						htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
       					});
       				
       				 	if(pop==0){
  	          		    	$(".b_l_f_city").append(htmls);
                            $(".b_l_f_city option").each(function (){
                                if('${oriCityId}'==$(this).val()){
                                    $(this).prop('selected','selected');

                                }
                            });
            		    }else if(pop == 1){
                 			 $(".pop_city").append(htmls);
                 			 $(".pop_city option").each(function (){
    	    					if(citynum==$(this).val()){
    	    						$(this).prop('selected','selected');
    	    						selectCounty($(this).val());
    	    					}
    	    				});
               		    }else if(pop ==2){
               			 $("#surcity").append(htmls);
               			 $("#surcity option").each(function (){
        					if(citynum==$(this).val()){
        						$(this).attr('selected','selected');
        						selectCounty($(this).val());
        					}
        				});
               		    }
       				}
       			});
      		}
        }
        $(document).ready(function(){
            submit();
        });
        function submit(){
        	var index = "0";
        	var name = "";
        	var tel = "";
        	var comp_name = "";
        	var remarks = "";
        	var prov_id = "";
        	var city_id = "";
        	if('${inname}' !=""){
        		index = '${inin}';
        		name='${inname}';
        		tel='${intel}';
        		comp_name='${incom}';
        	}else{
        		index = $(".b_l_nav_sel").parent().attr('data-in');
            	name = $("form input").eq(0).val();
            	tel = $("form input").eq(1).val();
            	comp_name = $("form input").eq(2).val();
        	}
        	if('${inre}'){
        		remarks = '${inre}';
        	}else{
        		remarks = $("form input").eq(3).val();
        	}
        	if('${inprov}'){
        		prov_id='${inprov}';
        		city_id= '${incity}';
        	}else{
        		prov_id = $(".b_l_f_province option:selected").val();
            	city_id = $(".b_l_f_city option:selected").val();
        	}
        	
        	citynum=city_id;
        	phone=tel;


            if(index==0){
                $(".verfone").parent().find("input:eq(0)").val(phone);
                $(".pop_province option").each(function (){
                    if(prov_id==$(this).val()){
                        $(this).attr('selected','selected');
                        //环评
                        pop=1;
                        selectCity(citynum);

                    }
                });

            }else if(index==1){
                $(".verftwo").parent().find("input:eq(0)").val(phone);
                $(".sur_province option").each(function (){
                    if(prov_id==$(this).val()){
                        $(this).attr('selected','selected');
                        //监测
                        pop=2;
                        selectCity(citynum);
                    }
                });

            }
            $.ajax({
                type : "POST",
                url : "${ctx}/protection/saveBase",
                data : "name=" + encodeURIComponent(name)+"&tel="+tel+"&comp_name="+encodeURIComponent(comp_name)+"&remarks="+encodeURIComponent(remarks)+"&prov_id="+prov_id+"&city_id="+city_id+"&index="+index,
                dataType : 'text',
                success : function(data) {
                    pid=data;
                    var ord= $(".b_l_nav_sel").parent().attr('data-in');
                    if('${inin}'){
                        ord = '${inin}';
                    }
                    if(ord==0){
                        pop=1;
                        $(".pl_index_shenqing").show();
                        $(".popumask").show();
                    }else if(ord==1){
                        pop=2;
                        $(".pl_index_shenqing_jiance").show();
                        $(".popumask").show();
                    }
                }
            });





        	/*if($.trim(name)==""||$.trim(tel)==""||$.trim(comp_name)==""){
        		showMess("请先完善信息");

        	}else  if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
        		showMess("请输入正确的手机号码");

        	}else{
 		        if(index==0){
 		        	$(".verfone").parent().find("input:eq(0)").val(phone);
            		$(".pop_province option").each(function (){
    					if(prov_id==$(this).val()){
    						$(this).attr('selected','selected');
    						//环评
    						pop=1;
    						selectCity(citynum);
    						
    					}
    				});
            		
 		        }else if(index==1){
 		        	$(".verftwo").parent().find("input:eq(0)").val(phone);
 		        	$(".sur_province option").each(function (){
    					if(prov_id==$(this).val()){
    						$(this).attr('selected','selected');
    						//监测
    						pop=2;
    						selectCity(citynum);
    					}
    				});
 	            	
 		        }
        		$.ajax({
         			type : "POST",
       				url : "${ctx}/protection/saveBase",
       				data : "name=" + encodeURIComponent(name)+"&tel="+tel+"&comp_name="+encodeURIComponent(comp_name)+"&remarks="+encodeURIComponent(remarks)+"&prov_id="+prov_id+"&city_id="+city_id+"&index="+index,
       				dataType : 'text',
       				success : function(data) {
       						pid=data;
       						var ord= $(".b_l_nav_sel").parent().attr('data-in');
       						if('${inin}'){
       							ord = '${inin}';
       			        	}
              		         if(ord==0){
              		        	pop=1;
              		            $(".pl_index_shenqing").show();
              		            $(".popumask").show();
              		         }else if(ord==1){
              		        	pop=2;
              		            $(".pl_index_shenqing_jiance").show();
              		            $(".popumask").show();
              		          }
       				}
       			});
        	}*/

        }
        function selectCounty(citypat){
        	   var city = "";
        	   if(citypat!=""){
        		   city = citypat;
        	   }

        	   if(pop ==1){
        		   city = $(".pop_city option:selected").val();
        		   $("#county").text('');
        	   }else if(pop == 2){
        		   city = $("#surcity").val();
        		   $("#surcountry").text('');
        	   }
        	   if(city == "0"){
        		   var htmlss="<option value='0'>县</option>";
        		   if(pop ==1){
        			   $("#county").append(htmlss);
            	   }else if(pop == 2){
            		   $("#surcountry").append(htmlss);
            	   }

        	   }else{
	            	   $.ajax({
	         			type : "POST",
	       				url : "${ctx}/protection/getCounty",
	       				data : "city=" + city,
	       				dataType : 'json',
	       				success : function(data) {
	       					var htmls = "<option value='0'>县</option>";
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
       				url : "${ctx}/protection/getOffLine",
       				data : "offhead=" +offhead ,
       				dataType : 'json',
       				success : function(data) {
       					$("#headline ").empty();
       					var htmls = "<option value='0'>&nbsp;</option>";
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
   				url : "${ctx}/protection/getOffDetail",
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
        	var country = $("#county option:selected").val();
        	var offhead= $("#offhead option:selected").val();
        	var headtext= $("#offhead option:selected").text();
        	var offline= $("#headline option:selected").val();
        	var linetext= $("#headline option:selected").text();
        	var projectname= $("#onename").val(); 
        	var name= $("#name").val();
        	var companyName= $("#companyName").val();
        	var phone= $("#phone").val();
        	var value=[];
        	var tel = $(".verfone").parent().find("input:eq(0)").val();
      		var code = $(".verfone").parent().find("input:eq(1)").val();
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
        	if($.trim(phone)==""||province==0||city==0||offhead==0||offline==0||$.trim(projectname)==""){
        		showMess("请先完善信息");

        	}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone))){
                showMess("请输入正确的手机号码");

            }else{
                $.ajax({
                    type : "POST",
                    url : "${ctx}/envprotection/envSave",
                    data : "name="+name+"&phone="+phone+"&companyName="+companyName+"&details="+details+"&pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+offline+"&projectname="+encodeURIComponent(projectname)+"&value="+value+"&headtext="+headtext+"&linetext="+linetext ,
                    dataType : 'text',
                    success : function(data) {
                        location.href = '${ctx}/envprotection/table?pid='+pid;
                    }
                });
	        	/*$.ajax({
	 				type : "POST",
	 				url : "${ctx}/checkCode",
	 				data : "tel=" + tel+"&checkCode="+code,
	 				dataType : 'text',
	 				success : function(data) { 
	 					if(data!="ok"){
	 						showMess(data);

	 					}else{
	 						$.ajax({
	 		         			type : "POST",
	 		       				url : "${ctx}/protection/envSave",
	 		       				data : "details="+details+"&pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+offline+"&projectname="+encodeURIComponent(projectname)+"&value="+value+"&headtext="+headtext+"&linetext="+linetext ,
	 		       				dataType : 'text',
	 		       				success : function(data) {
	 		       					location.href = '${ctx}/protection/table?pid='+pid;
	 		       				}
	 		       			});
	        			  }
	 					}
	 				});*/
        	}
        }
        	
        function loadSurOff(){
        	$(".myselect ul").empty();
        	counts=0;
        	mount.splice(0,mount.length);
        	var surhead= $("#surHead option:selected").val();
        	$.ajax({
         			type : "POST",
       				url : "${ctx}/protection/getSurLine",
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
        	var city = $("#surcity option:selected").val();
        	var country = $("#surcountry option:selected").val();
        	var offhead= $("#surHead option:selected").val();
        	var projectname= $("#twoname").val();
        	var tel = $(".verftwo").parent().find("input:eq(0)").val();
      		var code = $(".verftwo").parent().find("input:eq(1)").val();
      		if($.trim(tel)==""||$.trim(code)==""||province==0||city==0||offhead==0||types==""||$.trim(projectname)==""){
        		showMess("请先完善信息");

        	}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
        		showMess("请输入正确的手机号码");

        	}else{
	      		$.ajax({
	 				type : "POST",
	 				url : "${ctx}/checkCode",
	 				data : "tel=" + tel+"&checkCode="+code,
	 				dataType : 'text',
	 				success : function(data) { 
	 					if(data!="ok"){
	 						showMess(data);

	 					}else{
	 						$.ajax({
	 		         			type : "POST",
	 		       				url : "${ctx}/protection/monSave",
	 		       				data : "pid="+pid+"&province=" +province+"&city="+city+"&country="+country+"&offhead="+offhead+"&offline="+mount+"&projectname="+encodeURIComponent(projectname)+"&value="+types,
	 		       				dataType : 'text',
	 		       				success : function(data) {
	 		       					location.href = '${ctx}/protection/tableSur?pid='+pid;
	 		       				}
	 		       			});	
	 					}
	        			}
	 				});
        }
        }
        //提示框
        function showMess(str){
        	$(".aa").show();
    		$(".bb .pl_content p").html(str);
        	$(".bb").show();
        	setTimeout(function(){
    			hideMess();
        	},3000);
        }
        function hideMess(){
        	$(".aa").fadeOut();
    		$(".bb .pl_content p").html("");
        	$(".bb").hide();
        }
        //验证码倒计时
        function getcode(ss){
        	if(ss==1){
 	      		tel = $(".verfone").parent().find("input:eq(0)").val();
 	      		code = $(".verfone").parent().find("input:eq(1)").val();
         	}else if(ss==2){
 	      		tel = $(".verftwo").parent().find("input:eq(0)").val();
 	      		code = $(".verftwo").parent().find("input:eq(1)").val(); 
         	}
        	var str = ss;
        	 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){
       			 showMess("请输入正确的手机号码");

              }else{
            	  if(time_on){
                      var time = 30;
                      clearInterval(timer);
                      $(this).css({background:"#CCCCCC", color:"#666666"});
                      $(this).html("重新获取(" + time + ")");
                      timer = setInterval(function(){
                          time --;
                          if(ss==1){
      	                    $(".verfone").html("重新获取(" + time + ")");
                          }else if(ss==2){
                          	$(".verftwo").html("重新获取(" + time + ")");
                          }
                          if(time > 0){
                              time_on=false;

                          }else{
                              clearInterval(timer);
                              if(ss==1){
                              	$(".verfone").html("重新获取");
                                  $(".verfone").css({background:"#5EC520", color:"#FFFFFF"});
                              }else if(ss ==2){
                              	$(".verftwo").html("重新获取");
                                  $(".verftwo").css({background:"#5EC520", color:"#FFFFFF"});
                              }
                              time_on=true;
                          }
                      },1000);
                      
                  }
                   
              $.ajax({
      				type : "POST",
      				url : "${ctx}/conn",
      				data : "tel=" + tel,
      				dataType : 'text',
      				success : function(data) {
                        //showMess(data);

      				}
      			});  
              }
        	
        }
        function verfica(){
        	var tel = "";
        	if(pop==1){
        		tel = $(".verfone").parent().find("input:eq(0)").val();
        	}else if(pop==2){
        		tel = $(".verftwo").parent().find("input:eq(0)").val();
        	}
        	$.ajax({
				type : "POST",
				url : "${ctx}/conn",
				data : "tel=" + tel,
				dataType : 'text',
				success : function(data) {
                    //showMess(data);

				}
			});
        }
        function jiaoyan(){
     	   var message="";
     	   if(pop==1){
	      		tel = $(".verfone").parent().find("input:eq(0)").val();
	      		code = $(".verfone").parent().find("input:eq(1)").val();
        	}else if(pop==2){
	      		tel = $(".verftwo").parent().find("input:eq(0)").val();
	      		code = $(".verftwo").parent().find("input:eq(1)").val(); 
        	}
     	   $.ajax({
 				type : "POST",
 				url : "${ctx}/checkCode",
 				data : "tel=" + tel+"&checkCode="+code,
 				dataType : 'text',
 				success : function(data) { 
 					message=data;
 				}
 			});
     	   return message;
        } 
        function helpme(){
        	window.open('http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');
        }
        function addnew(){
        	showMess("我们将推荐公司的相关信息尽快发送到你手机");
        }
        function smooth_scroll(obj,sub){
            var $dom = $(obj);
            $dom.find("thead").remove();
            $dom.find("tbody").append($dom.find("tbody").html());
            var $scroll_h=$dom.get(0).scrollHeight/2;
            var $scroll_t=0;
            var scrolltimer = setInterval(function(){
                  if($scroll_t>=$scroll_h){
                        $scroll_t=0;
                  }
                  $dom.scrollTop(($scroll_t+=0.5));
            },30);
            $dom.find(sub?sub:"a").on("mouseover",function(){
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
        function goPage(){
				var num=$("#biaoji").val();
				var title=$("#searchtext").val();
				switch (parseInt(num)){
				case 0:
					location.href='${ctx}/EntLib?enterprise='+title;
					break;
				case 1:
					location.href='${ctx}/solidsupply/hbDemandQuery?title='+title;
					break;
				case 2:
					location.href='${ctx}/mall?proName='+title;
					break;
				case 3:
					location.href='${ctx}/news?title='+title;
					break;
				}
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
        function clonethead(){
        	var each_txt=["用户名","服务类型","项目地点","申请时间","项目情况"];
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
        </script>
    </body>
</html>