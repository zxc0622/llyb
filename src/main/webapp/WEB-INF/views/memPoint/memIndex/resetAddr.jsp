<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>修改收货地址</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
        <style type="text/css">
            .xiugaidizhi{margin:30px 0 50px;}

            .xiugaidizhi .l_square{width:14px;height:14px;border:1px solid #cccccc;margin-top: 7px;margin-left: 10px;cursor: pointer;}
            .xiugaidizhi .square_sel {background:url(${ctxStatic}/img/llhb/layer_yes.png) 0 0 no-repeat;}

            .tab_main_rt{width:280px;position: absolute;height:30px;line-height: 30px;top:0;right:0;}
            .tab_main_rt .c_black{margin-left: 10px;}
            .tab_main_rt .c_cheng{color:#ee7800;margin-left: 5px;}
            .tab_main_rt a{margin-left: 10px;color:#5EC520;}
            
            .yibaocundizhi_table{margin-bottom: 30px;}
            .yibaocundizhi_table tr td{overflow: hidden;white-space: nowrap;text-overflow: ellipsis;}
            

            .tip-row-div{margin:10px 0;height:30px;padding:0 10px;border:1px solid #ee7800;background-color: #FFFDEE;line-height: 30px;}
            .tip-row-div span{color:#666666;}
            .tip-row-div span a{color:#ee7800;font-weight: bold;}
            /*.tip-row-div a{color:#ee7800;float:right;}*/
        </style>
        
    </head>
    <body>

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tip-row-div">
                    <span class="font_1">
                        您还未设置收货地址,请添加<a href="javascript:void(0)">收货地址</a>  
                    </span>
                    
                </div>
                <div class="tab_main"style="margin-bottom:20px;position:relative;">
                <div class="m_r_title"><span class="m_r_tname">修改收货地址</span></div>
                    <form action="${ctx}/memPoint/memIndex/addSave">
                    <!-- 右上积分相关 -->
                    <div class="tab_main_rt font_1">
                        <span class="c_black" style="margin-left: -45px;">剩余积分 :</span><span class="c_cheng">${m.point_num}</span>
                        <span class="c_black">使用积分 :</span><span class="c_cheng">${p.points}</span>
                        <a href="javascript:void(0)" onclick="see()">查看兑换记录</a>
                    </div>
                    <!-- 右上积分相关 结束-->
                    
                    <!-- 修改收货地址 -->
                    <div class="xiugaidizhi">
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
                                    <select name="city_id" id="" class="addr2">
                                        <option value="0">市</option>
                                    </select>
                                    <select name="town_id" id="" class="addr3">
                                        <option value="0">县</option>
                                    </select>
                                    <input type="text" placeholder="街道地址"style="width:150px;color:#666" name="street" value="${a.street}">
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">邮编:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px" name="post_code" value="${a.post_code}">
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">收货人姓名:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px" name="name" value="${a.name}">
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">联系号码:</label>
                                <div class="row_right font1">
                                    <input type="text"style="width:224px" name="phone" value="${a.phone}">
                                    
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
                                    <a href="javascript:void(0)" class="btn baocun"style="color:#fff">保存</a>
                                    
                                </div>
                            
                        </div>
                    </div>
                    <input type="hidden" name="is_default" value="" id="moren">
                    <input type="hidden" name="pid" value="${pid}">
                    <input type="hidden" name="addId" value="${addId}">

                        
                        
                    </form>
                </div>
                
            </div>
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/validation.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                if('${a.is_default}'=='true'){
                    $(".l_square").addClass("square_sel");
                }else{
                    $(".l_square").removeClass("square_sel");
                }
                $('.addr1 option').each(function () {
                    if('${a.prov_id}' == $(this).val()){
                        $(this).prop('selected','selected');
                        s2();
                    }
                });

                //添加对号
                $(".l_square").click(function(){
                    $(this).toggleClass("square_sel");
                });
                $(".baocun").click(function(){
                    var a1 = $(".addr1").val();
                    var a2 = $(".addr2").val();
                    var a3 = $(".addr3").val();
                    var  name = $("input[name='name']").val();
                    var phone = $("input[name='phone']").val();
                    var post_code = $("input[name='post_code']").val();
                    var street = $("input[name='street']").val();
                    var f = $(".l_square").hasClass("square_sel");
                    if(f){
                        $("#moren").val(1);
                    }else {
                        $("#moren").val(0);
                    }
                    if(!a1||!a2||!isNull([name,phone,post_code,street])){
                        parent.showMess("请先完善信息");
                        return;
                    }
                    var bb = $.validaTelephone(phone);
                    if(!bb){
                        parent.showMess("联系电话的格式不正确");
                        return;
                    }
                    $("form").submit();

                });

            });

            $(".addr1").change(s2);
            $(".addr2").change(s3);
          function s2(){
                $.ajax({
                    type : "POST",
                    url : "${ctx}/protection/getCity",
                    data : "province=" + $(".addr1").val(),
                    dataType : 'json',
                    success : function(data) {
                        $(".addr2").text('');
                        var htmls = '<option value="0">市</option>';
                        $.each(data,function(index, item) {
                            htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $(".addr2").append(htmls);

                        $('.addr2 option').each(function () {
                         if('${a.city_id}' == $(this).val()){
                         $(this).prop('selected','selected');
                             s3();
                         }
                         });
                    }
                })
            }
            function s3(){
                $.ajax({
                    type : "POST",
                    url : "${ctx}/protection/getCounty",
                    data : "city=" + $(".addr2").val(),
                    dataType : 'json',
                    success : function(data) {
                        if(!data){
                            return;
                        }
                        $(".addr3").text('');
                        var htmls = '<option value="0">县</option>';
                        $.each(data,function(index, item) {
                            htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $(".addr3").append(htmls);
                        $('.addr3 option').each(function () {
                         if('${a.town_id}' == $(this).val()){
                         $(this).prop('selected','selected');
                         }
                         });
                    }
                })
            }

            /**
             * 校验是否为空
             */
            function isNull(str){
                var flag  = true;
                for(var i=0;i<str.length;i++){
                    if(!$.trim(str[i])){
                        flag = false;
                        return false;
                    }
                }
                return flag;
            }
            function  see(){
                location.href="${ctx}/memPoint/memIndex/convertList";
            }






        </script>
    </body>
</html>


