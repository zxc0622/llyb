<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>广告-广告管理-推荐企业广告</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        
        
        <style type="text/css">
            img{display: block;text-align: center;cursor: pointer;}
            .tab_main{overflow:hidden;}
            .tab_main_left{width:580px;overflow:hidden; float:left; padding-right:10px;}
            .main_menu{float:right; margin-top:40px;}
            .main_menu .menu_tit{background-color:#edf2e9; width:140px; text-align:left; color:#333; font-weight:bolder; height:40px;line-height:40px; display:block; border-radius:20px 0 0 20px; -moz-border-radius:20px 0 0 20px; -webkit-border-radius:20px 0 0 20px; text-indent:40px; margin:4px 0;cursor:pointer; letter-spacing:1px;  -moz-user-select:none;}
            .main_menu .menu_1 ul{margin-left:20px;}
            .main_menu .menu_1 ul li{width:120px; background-color:#edf2e9; line-height:30px; height:30px; text-align:left; text-indent:30px; border-radius:15px 0 0 15px; -moz-border-radius:15px 0 0 15px; -webkit-border-radius:15px 0 0 15px; margin-bottom:4px;font-size:12px;}
            .main_menu .menu_1 ul .cur_menu{background-color:#f29433; color:white;}
            .main_menu .menu_1 ul li:hover{background-color:#ffce9b; cursor:pointer;}
            .main_menu .menu_1 ul .cur_menu:hover{background-color:#f29433;}
            
            /*图片间距*/
            .for_pics{overflow: hidden;border:1px solid #ccc;margin-top: 15px;min-height: 400px;}
            .for_pics .per_pic_div{margin:10px;}
            /*图片间距 end*/
            .tuijianqiye_pics{overflow: hidden;margin-top: 15px;}
            .this_page_title{overflow: hidden;border-bottom: 1px solid #ccc;margin-bottom: 10px;}
            .this_page_title span{float:left;margin-right: 10px;padding:5px;cursor: pointer;}
            .this_page_title .span_sel{border-bottom: 2px solid #5EC520;padding-bottom: 3px;}

            /*tab 切换*/
                .tab_change_div,.shilishangjia_pics,.tuijianshangjia_pics{overflow: hidden;margin-bottom: 15px;}
                .tab_change_div .fl:not(.fl_mid){position:relative;width:134px;border:1px solid #ccc;height:167px;}
                
                .tab_change_div .fl:not(.fl_mid) img{width:100%;height:99px;line-height: 99px;}
                .tab_change_div .fl_mid{width:306px;overflow: hidden;}
                
                .tab_change_div .fl_mid img{width:100%;height:32px;line-height: 32px;}
                .fl_mid_pic{position:relative;width:100px;float:left;border:1px solid #ccc;height:100px;}

                .shilishangjia_pics>.fl{position:relative;width:114px;border:1px solid #ccc;height:176px;}
                
                .shilishangjia_pics>.fl img{width:100%;height:108px;line-height: 108px;}

                .tuijianshangjia_pics>.fl{position:relative;width:94.5px;border:1px solid #ccc;height:99px;}
                
                .tuijianshangjia_pics>.fl img{width:100%;height:31px;line-height: 31px;}

                .huanbao_icon_pics>.fl{position:relative;width:94.5px;border:1px solid #ccc;height:99px;}

                .huanbao_icon_pics>.fl img{width:100%;height:31px;line-height: 31px;}
            /*tab 切换 end*/
                .check_del_div{height:68px;background-color: #efefef;overflow:hidden;}
                .check_del_div input[type=text]{height:17px;width:95%;margin:3px auto 0;line-height:17px;display:block;font-size:12px;}
                .check_del_div a{font-size: 12px;float:right;color:#5EC520;margin-top: 3px;margin-right: 5px;}
        </style>
        
    </head>
    <body>
        <!-- 右侧开始 -->
        <div class="main_right">
            <div class="m_r_position font_1">当前位置>广告>广告管理</div>
            <div class="tab_main">
                <div class="tab_main_left">
                    <div>
                    </div> 
                    <div class="tab_main_row">
                        <a href="javascript:void(0)"class="normal_btn_2" onclick="saveManagement()">保存更改</a>                            
                    </div>
                    
                    <div class="tuijianqiye_pics">
                        <div class="tab_change this_page_title">
                            <c:forEach items="${labelList }" var="label" varStatus="status">
                                <a href="${ctx}/infomaintain/management/homeManagementInit?type=${label.type}">
                                    <span <c:if test="${label.type==type}"> class="span_sel" </c:if>>${label.name}</span>
                                </a>
                            </c:forEach>
                        </div>
                        <form action="updateImage" method="post" id="formId">
                        <div class="tab_change_divs">
                            <div class="tab_change_div">
                                <c:forEach items="${managementList }" var="management" varStatus="status">
                                    <c:choose>
                                        <c:when test='${type==management.sType}'>

                                                <c:if test="${management.tType=='left'}">
                                                    <input type="hidden" value="${management.id}" name="imgId"/>
                                                  <div class="fl per_pic_div_sel">
                                                    <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                        <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                        <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                        <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                                  </div>
                                                </c:if>

                                        </c:when>

                                    </c:choose>
                                </c:forEach>

                                <div class="fl fl_mid">
                                    <c:forEach items="${managementList }" var="management" varStatus="status">
                                        <c:if test="${type==management.sType}">

                                                <c:if test="${management.tType=='center'}">
                                                    <input type="hidden" value="${management.id}" name="imgId"/>
                                                    <div class="fl_mid_pic">
                                                        <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                        <div class="check_sel_pic"></div>
                                                        <div class="check_del_div">
                                                             <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                             <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                             <a href="javascript:picDel(${status.index});">[删除]</a>
                                                        </div>
                                                   </div>
                                                </c:if>

                                        </c:if>

                                    </c:forEach>
                                </div>
                                <c:forEach items="${managementList }" var="management" varStatus="status">
                            	<c:choose>
                            		<c:when test="${type==management.sType}">
                            				<c:if test="${management.tType=='right'}">
                            					<input type="hidden" value="${management.id}" name="imgId"/>
	                            			    <div class="fl">
					                                <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
					                                <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                        <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                        <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                        <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                                </div>
                            				</c:if>
                                    </c:when>

                            	</c:choose>
                            </c:forEach>
                            </div>
                            <div class="this_page_title">
                                <span class="span_sel">实力商家</span>
                            </div>
                            <div class="shilishangjia_pics">
                                <c:forEach items="${managementList }" var="management" varStatus="status">
                                    <c:choose>
                                    <c:when test='${type=="1"}'>
                                        <c:if test="${management.sType=='S4'}">
                                        <input type="hidden" value="${management.id}" name="imgId"/>
                                               <div class="fl">
                                                      <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                        <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                        <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                        <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                              </div>
                                          </c:if>
                                        </c:when>
                                    <c:when test="${type=='2'}">
                                            <c:if test="${management.sType=='S4'}">
                                            <input type="hidden" value="${management.id}" name="imgId"/>
                                              <div class="fl">
                                                      <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                         <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                         <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                         <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                              </div>
                                            </c:if>
                                    </c:when>
                                    <c:otherwise>
                                            <c:if test='${management.sType=="S4"}'>
                                            <input type="hidden" value="${management.id}" name="imgId"/>
                                              <div class="fl">
                                                     <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                         <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                         <input type="text" name="redirctHref" value="${management.redirctHref}"  placeholder="请输入链接"/>
                                                         <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                              </div>
                                            </c:if>
                                    </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <div class="this_page_title">
                                <span class="span_sel">推荐商家</span>
                            </div>
                            <div class="tuijianshangjia_pics">
                                <c:forEach items="${managementList }" var="management" varStatus="status">
                                    <c:choose>
                                        <c:when test='${type=="1"}'>
                                            <c:if test="${management.sType=='S5'}">
                                                <input type="hidden" value="${management.id}" name="imgId"/>
                                                <div class="fl">
                                                    <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                        <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                        <input type="text" name="redirctHref" value="${management.redirctHref}"  placeholder="请输入链接"/>
                                                        <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${type=='2'}">
                                            <c:if test="${management.sType=='S5'}">
                                                <input type="hidden" value="${management.id}" name="imgId"/>
                                                <div class="fl">
                                                    <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                         <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                         <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                         <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test='${management.sType=="S5"}'>
                                                <input type="hidden" value="${management.id}" name="imgId"/>
                                                <div class="fl">
                                                    <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                                    <div class="check_sel_pic"></div>
                                                    <div class="check_del_div">
                                                        <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                        <input type="text" name="redirctHref" value="${management.redirctHref}" placeholder="请输入链接"/>
                                                        <a href="javascript:picDel(${status.index});">[删除]</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                       </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                            <div class="this_page_title">
                                <span class="span_sel">环保图标</span>
                            </div>
                            <div class="huanbao_icon_pics">
                                <c:forEach items="${managementList }" var="management" varStatus="status">
                                    <c:if test="${management.sType=='S6'}">
                                        <input type="hidden" value="${management.id}" name="imgId"/>
                                        <div class="fl">
                                            <a href="javascript:parent.comPic(${status.index});"><img  id="imgs${status.index}"  src="${management.picAddr }" alt="+"><input type="hidden" name="imgValue" id="value${status.index}" value="${management.picAddr }"></a>
                                            <div class="check_sel_pic"></div>
                                            <div class="check_del_div">
                                                <input type="text" name="showName" value="${management.showName}" placeholder="请输入图片名"/>
                                                <input type="text" name="redirctHref" value="${management.redirctHref}"  placeholder="请输入链接"/>
                                                <a href="javascript:picDel(${status.index});">[删除]</a>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                        </div>
                        </form>
                    </div>
                    
                </div>
                
            </div>         
        </div>
        <input type="hidden" value="${type }" name="type"/>
        </form>
            <!-- 右侧结束 -->
        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
            	var type='${type}';
            /*	if(type=='0'){
            		$(".tab_change span").eq(0).addClass("span_sel").siblings().removeClass();
            	}else if(type=='1'){
            		$(".tab_change span").eq(1).addClass("span_sel").siblings().removeClass();
            	}else{
            		$(".tab_change span").eq(2).addClass("span_sel").siblings().removeClass();
            	}
            	*/
            	
                //tab 切换
               /* $(".tab_change span").click(function(){
                    var index = $(this).index();
                    $(this).addClass('span_sel').siblings().removeClass('span_sel');
                    $('.tab_change_div').eq(index).show().siblings().hide();
                });*/


                //点击全选
                $(".check_all").click(function(){
                    var on=true;
                    $("input[type=checkbox]").each(function(){
                        if(!$(this).prop("checked")){
                            return on=false;
                         }
                    });
                    if(on){
                        $("input[type=checkbox]").prop("checked",false);
                    }else{
                        $("input[type=checkbox]").prop("checked",true);
                    }
                });
                $(".delete_tr").click(function(){
                    $(".zxgl_table input[type=checkbox]").each(function(){

                        if($(this).prop("checked")){
                            $(this).parents("tr").remove();
                         }
                    });
                });
                
                
                $(".main_menu .menu_1 ul").hide();
                $(".cur_menu").parent("ul").prev("a").css("background-color","#f29433").css("color","white");
                $(".main_menu .menu_1 .menu_tit").click(function(){
                    var menu_ul=$(this).next("ul");
                    if(!menu_ul.is(":visible")){
                        $(".main_menu .menu_1 ul").slideUp();
                        menu_ul.slideToggle();
                        $(".main_menu .menu_tit").css("background-color","#edf2e9").css("color","#333");
                        $(this).css("background-color","#f29433").css("color","white");
                        menu_ul.children("li").removeClass("cur_menu");
                        menu_ul.children("li:first").addClass("cur_menu");
                    }
                });
                $("li").click(function(){
                    $("li").removeClass("cur_menu");
                    $(this).addClass("cur_menu").siblings().removeClass("cur_menu");    
                    $(".main_menu .menu_tit").css("background-color","#edf2e9").css("color","#333;");
                    $(this).parent("ul").prev("a").css("background-color","#f29433").css("color","white");
                });

                //初始化
                $(".main_menu .menu_1 .menu_tit:first").css({"background-color":"#f29433","color":"white"});
                $(".main_menu .menu_1 .menu_tit:first").next("ul").show().children("li:nth-child(4)").addClass("cur_menu");
                // $(".check_sel_pic").prev("img").click(function(){
                //     //if(!$(this).attr('src')==''){
                //     $(this).next().show();
                //     $(this).next().off().click(function(){
                //         $(this).hide();
                //     });
                //     //}
                // });

            });
            //图片上传	
            function addPic(str , n){
            	$("#imgs"+n).attr("src",str);
            	$("#value"+n).val(str);
            }
         	 //图片删除
            function picDel(n,obj){
            	$("#imgs"+n).attr("src","0");
            }
          	//保存更改
          	function saveManagement(){
          		$("#formId").submit();
        	}
        </script>
    </body>
</html>


