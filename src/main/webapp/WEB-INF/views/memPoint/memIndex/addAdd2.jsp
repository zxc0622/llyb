<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>添加收货地址</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
        <style type="text/css">
            .tianjiadizhi{display: none;margin:0 0 50px;}

            .tianjiadizhi .l_square{width:14px;height:14px;border:1px solid #cccccc;margin-top: 7px;margin-left: 10px;cursor: pointer;}
            .tianjiadizhi .square_sel {background:url(${ctxStatic}/img/llhb/layer_yes.png) 0 0 no-repeat;}

            .tab_main_rt{width:280px;position: absolute;height:30px;line-height: 30px;top:0;right:0;z-index: 10;}
            .tab_main_rt .c_black{margin-left: 10px;}
            .tab_main_rt .c_cheng{color:#ee7800;margin-left: 5px;}
            .tab_main_rt a{margin-left: 10px;color:#5EC520;}
            
            .yibaocundizhi_table{margin-bottom: 30px;}
            .yibaocundizhi_table tr td{overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
            
            .tab_main input[type="checkbox"]{margin-right: 10px;float:left;margin-top:4px;}
            td span{float:left;}

            .querenduihuoxinxi_table{margin-bottom: 50px;}
            .querenduihuoxinxi_table tr td:nth-of-type(4){color:#ee7800;}
            .newad_div{margin:10px 0 30px 20px;}
            .newad_btn {width:120px;line-height:30px;height:30px;text-align: center;color:#ee7800;background-color: #fff;border:1px solid #ccc;display: inline-block;}
        </style>
        
    </head>
    <body>

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tab_main"style="margin-bottom:20px;position:relative;">
                

                    <!-- 右上积分相关 -->
                    <div class="tab_main_rt font_1">
                        <span class="c_black">剩余积分 :</span><span class="c_cheng">${pu.point_num}</span>
                        <span class="c_black">使用积分 :</span><span class="c_cheng">${p.points}</span>
                        <a href="javascript:void(0)" onclick="goUrl('积分兑换/积分兑换列表.html')">查看兑换记录</a>
                    </div>
                    <!-- 右上积分相关 结束-->
                    
                    <!-- 添加收货地址 -->
                    <div class="tianjiadizhi">
                        <div class="m_r_title"style="margin-bottom: 30px;"><span class="m_r_tname">添加收货地址</span></div>
                        <div class="tab_main_row ">
                            
                                <label for="">所在城市:</label>
                                <div class="row_right font1">
                                    <select class="addr1" name="prov_id">
                                        <option value="0">省</option>
                                        <c:forEach items="${adds}" var="a">
                                            <c:if test="${a.id ne 1 && a.parentId eq 1}">
                                                <option value="${a.id}">${a.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <select name="" id="" class="addr2">
                                        <option value="">市</option>
                                    </select>
                                    <select name="" id="" class="addr3">
                                        <option value="">县</option>
                                    </select>
                                    <input type="text" value="街道地址"style="width:150px;color:#666">
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">邮编:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px">
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">收货人姓名:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px">
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">联系号码:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px">
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">&nbsp;</label>
                                <div class="row_right font1">
                                    <span class="l_square square_sel" style="float:left">&nbsp;</span><span style="float:left">设为默认地址</span>
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">&nbsp;</label>
                                <div class="row_right font1">
                                    <a href="javascript:void(0)" class="btn"style="color:#fff">保存</a>
                                    
                                </div>
                            
                        </div>
                    </div>
                   
                   <!-- 已保存地址 -->
                   <div class="yibaocundizhi">
                       <div class="m_r_title"><span class="m_r_tname">已保存地址</span></div>
                       <form action="">
                           <div class="tab_main_result yibaocundizhi_table">
                               <table>
                                   <tr>
                                       <th style="width:100px">收货人</th>
                                       <th style="width:150px">所在区域</th>
                                       <th style="width:150px">街道地址</th>
                                       <th style="width:100px">邮编</th>
                                       <th style="width:120px">手机</th>
                                       <th style="width:60px">操作</th>
                                   </tr>
                                   <tr>
                                       <td><input type="checkbox"><span>hansion</span></td>
                                       <td >广东深圳深圳深圳深圳</td>
                                       <td >广东深圳深圳深圳深圳 </td>
                                       <td>5203133</td>
                                       <td>15920681854</td>
                                       <td>
                                           <a class="tr_manage" onclick="goUrl('积分兑换/修改收货地址.html')">&nbsp;</a>
                                           <a class="tr_manage">&nbsp;</a>
                                           <h6 >修改</h6>
                                           <h6>删除</h6>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td><input type="checkbox"><span>hansion</span></td>
                                       <td >广东深圳深圳深圳深圳</td>
                                       <td >广东深圳深圳深圳深圳 </td>
                                       <td>5203133</td>
                                       <td>15920681854</td>
                                       <td>
                                           <a class="tr_manage" onclick="goUrl('积分兑换/修改收货地址.html')">&nbsp;</a>
                                           <a class="tr_manage">&nbsp;</a>
                                           <h6>修改</h6>
                                           <h6>删除</h6>
                                       </td>
                                   </tr>
                                 
                               </table>
                           </div>
                       </form>
                   </div>
                    

                    <div class="newad_div"><a href="${ctx}/youyimoney/resetAddr" class="newad_btn">使用新地址</a></div>
                    
                    <!-- 确认兑换信息 -->
                    <div class="querenduihuanxinxi">
                        <div class="m_r_title"><span class="m_r_tname">确认兑换信息</span></div>
                        <form action="">
                            <div class="tab_main_result">
                                <table class="querenduihuoxinxi_table">
                                    <tr>
                                        
                                        <th style="width:150px">商品名称</th>
                                        <th style="width:100px">所需积分</th>
                                        <th style="width:100px">兑换数量</th>
                                        <th style="width:40px">商品状态</th>
                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">洲明轩辕LED射灯筒灯LED</td>
                                        <td>1088</td>
                                        <td>1</td>
                                        <td>有货</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">洲明轩辕LED射灯筒灯LED</td>
                                        <td>1088</td>
                                        <td>1</td>
                                        <td>有货</td>
                                    </tr>
                                  
                                </table>
                            </div>
                            <a href="javascript:void(0)" class="btn"style="float: right;margin-right:65px" onclick="sure()">确认兑换</a>
                            
                        </form>
                    </div>
                    
                </div>
                
            </div>
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                
                //添加对号
                $(".l_square").click(function(){
                    $(this).toggleClass("square_sel");
                });

                <!--管理的修改删除-->
                $("h6").hide();
                $(".tr_manage").mouseover(function(){
                    x=$(".tr_manage").index(this);
                    $("h6:eq("+x+")").show();
                });
                $(".tr_manage").mouseout(function(){
                    $("h6").hide();
                 });

                //点击使用新地址
                $(".newad_btn").on("click",function(){
                    $(".tianjiadizhi").show();
                });
            });
           
            function sure(){
    			window.location.href="${ctx}/youyimoney/convertList";
    		}
            $(".addr1").change(function(){
                $.ajax({
                    type : "POST",
                    url : "${ctx}/protection/getCity",
                    data : "province=" + $(this).val(),
                    dataType : 'json',
                    success : function(data) {
                        var htmls = "";
                        $.each(data,function(index, item) {
                            htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $(".addr2").append(htmls);
                        /*$('.addr2 option').each(function () {
                            if('${m.city_id}' == $(this).val()){
                                $(this).prop('selected','selected');
                            }
                        });*/
                    }
                })
            });
            $(".addr2").change(function(){
                $.ajax({
                    type : "POST",
                    url : "${ctx}/protection/getCounty",
                    data : "city=" + $(this).val(),
                    dataType : 'json',
                    success : function(data) {
                        var htmls = "";
                        $.each(data,function(index, item) {
                            htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $(".addr3").append(htmls);
                        /*$('.addr2 option').each(function () {
                            if('${m.city_id}' == $(this).val()){
                                $(this).prop('selected','selected');
                            }
                        });*/
                    }
                })
            })


            

        </script>
    </body>
</html>


