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
                        <span class="c_black" style="margin-left: -45px;">剩余积分 :</span><span class="c_cheng">${m.point_num}</span>
                        <span class="c_black">使用积分 :</span><span class="c_cheng">${p.points}</span>
                        <a href="javascript:void(0)" onclick="see()">查看兑换记录</a>
                    </div>
                    <!-- 右上积分相关 结束-->

                   
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
                                       <th style="width:100px">操作</th>
                                   </tr>
                                   <c:forEach items="${addrs}" var="a">
                                       <tr data-in="${a.id}">
                                           <c:choose>
                                               <c:when test="${a.is_default eq true}">
                                                   <td><input type="radio" checked="checked" name="radio" style="float:left" value="${a.id}"><span>${a.name}</span></td>
                                               </c:when>
                                               <c:otherwise>
                                                   <td><input type="radio" name="radio" style="float:left" value="${a.id}"><span>${a.name}</span></td>
                                               </c:otherwise>
                                           </c:choose>
                                           <td >${a.aname}${a.bname}${a.cname}</td>
                                           <td >${a.street}</td>
                                           <td>${a.post_code}</td>
                                           <td>${a.phone}</td>
                                           <td>
                                               <a class="tr_manage_1" style="position:relative;" onclick="editaddr('${a.id}')">&nbsp;<h6>修改</h6></a>
                                               <a class="tr_manage_2" style="position:relative;" onclick="deletethis(${a.id});">&nbsp;<h6 >删除</h6></a>
                                           </td>
                                       </tr>
                                   </c:forEach>
                               </table>
                           </div>
                       </form>
                   </div>
                    

                    <div class="newad_div"><a  class="newad_btn">使用新地址</a></div>
                    
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
                                        <td>${p.pro_name}</td>
                                        <td>${p.points}</td>
                                        <td>1</td>
                                        <td><c:if test="${p.num > 0}">
                                            有货
                                        </c:if><c:if test="${p.num < 1}">
                                            缺货
                                        </c:if> </td>
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
                $(".tr_manage_1").mouseover(function(){
                    $(this).find("h6").show();
                });
                $(".tr_manage_2").mouseover(function(){
                    $(this).find("h6").show();
                });
                $(".tr_manage_1").mouseout(function(){
                    $("h6").hide();
                });
                $(".tr_manage_2").mouseout(function(){
                    $("h6").hide();
                });

                //点击使用新地址
                $(".newad_btn").on("click",function(){
                    /*$(".tianjiadizhi").show();*/
                   /* $.ajax({
                        type : "POST",
                        url : "${ctx}/memPoint/memIndex/resetAddr",
                        data : "parent="+parent,
                        dataType : 'json',
                        success : function(data) {

                        }
                    });*/
                    window.location.href="${ctx}/memPoint/memIndex/resetAddr?pid=${pid}";

                });
            });
           
            function sure(){
                var addid =  $('input:radio:checked').val();
                var a = $("input[name='radio']").is(':checked');
                if(!a){
                    parent.showMess("先选择收货地址");
                    return;
                }
                $.ajax({
                    type : "POST",
                    url : "${ctx}/memPoint/memIndex/sureExchange",
                    data : "pid=${pid}&addid="+addid,
                    dataType : 'text',
                    success : function(data) {
                        if(data !='ok'){
                            parent.showMess(data);

                        }else{
                            parent.showMess("兑换成功");
                            setTimeout(function(){
                                //location.href="${ctx}/memPoint/memIndex/convertList";
                                see();
                            },3000);
                        }
                    }
                });
    		}
            /**
             * 修改地址
             */
            function  editaddr(str){
                window.location.href="${ctx}/memPoint/memIndex/resetAddr?pid=${pid}&&aid="+str;
            }
            /**
             * 删除地址
             */
            function  deletethis(str){
                parent.showMessYes("确定删除？");
                $(".yes-btn", window.parent.document).unbind().on("click",function() {
                    $(".pl_yesorno", window.parent.document).hide();
                    $.ajax({
                        type : "POST",
                        url : "${ctx}/memPoint/memIndex/deleteaddr",
                        data : "addid="+str,
                        dataType : 'json',
                        success : function(data) {
                            if(data == true){
                                parent.showMess("删除成功");
                                setTimeout(function() {
                                    $(".popumask", window.parent.document).hide();
                                    $(".pl_normal", window.parent.document).hide();
                                    location.reload();
                                },2000);
                            }
                        }
                        });
                });
            }
            function  see(){
                location.href="${ctx}/memPoint/memIndex/convertList";
            }


            

        </script>
    </body>
</html>


