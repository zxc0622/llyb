<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>积分兑换列表</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">
        <style type="text/css">
            /*确认兑货信息_表格*/
            .querenduihuoxinxi_table{margin-bottom: 50px;}
            .querenduihuoxinxi_table tr td:nth-of-type(4){color:#ee7800;}
            
            .tab_main_rt{width:280px;position: absolute;height:30px;line-height: 30px;top:0;right:0;}
            .tab_main_rt .c_black{margin-left: 10px;}
            .tab_main_rt .c_cheng{color:#ee7800;margin-left: 5px;}
            .tab_main_rt a{margin-left: 10px;color:#5EC520;}
            .querendizhi{margin:30px 0 30px 20px;overflow: hidden;}
            .querendizhi p{margin-bottom: 10px;}
            .querendizhi p span{color:#ee7800;}
            .shouhuodizhi{position: relative;width:300px;height:115px;padding:10px 15px 0;border:1px solid #ccc;float:left;margin-top: 20px;color:#666666;cursor: pointer;}
            .shouhuodizhi:nth-child(2n+1){margin-left: 40px;}
            .shouhuodizhi span{display: block;}
            .shouhuodizhi>*{margin-bottom: 5px;}
            .shouhuodizhi .shdz_rb{position: absolute;bottom: 0;right:0;width:25px;height:25px;background: url(${ctxStatic}/img/llhb/shdz_rb.png) 1px 1px no-repeat;margin:0;display: none;}

            /*收货地址选中*/
            .shdz_sel:nth-child(2n+1) {border:3px solid #ee7800;width:296px;height:112px;}
            .shdz_sel:nth-child(2n) {border:3px solid #ee7800;width:296px;height:111px;}
            .shdz_sel .shdz_rb{display: block;}
            .querendizhi >a{display: block;padding-top: 30px;color:#ee7800;}

        </style>
        
    </head>
    <body>

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tab_main"style="margin-bottom:20px;position:relative;">
                <div class="m_r_title"><span class="m_r_tname">确认收货地址</span></div>

                    <!-- 右上积分相关 -->
                    <div class="tab_main_rt font_1">
                        <span class="c_black">剩余积分 :</span><span class="c_cheng">0</span>
                        <span class="c_black">使用积分 :</span><span class="c_cheng">1088</span>
                        <a href="javascript:void(0)" onclick="goUrl('积分兑换/积分兑换列表.html')">查看兑换记录</a>
                    </div>
                    <!-- 右上积分相关 结束-->
                    
                    <!-- 确认收货地址 -->
                    <div class="querendizhi">
                        <p>最多保存<span>10</span>个有效地址</p>
                        <div class="shouhuodizhi shdz_sel">
                            <span class="font_1">delete</span>
                            <p class="tmui-ellipsis">广东省-东莞市-南城区盛和广场南城区盛和Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, alias, totam, tenetur neque necessitatibus voluptatibus commodi nobis libero ratione magnam mollitia assumenda perferendis ipsum aut porro veritatis unde placeat officiis.</p>
                            <span class="font_1">5203133</span>
                            <span class="font_1">15920681854</span>
                            <div class="shdz_rb"></div>
                        </div>
                        <div class="shouhuodizhi">
                            <span class="font_1"></span>
                            <p class="tmui-ellipsis">广东省-东莞市-南城区盛和广场南城区盛和Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, alias, totam, tenetur neque necessitatibus voluptatibus commodi nobis libero ratione magnam mollitia assumenda perferendis ipsum aut porro veritatis unde placeat officiis.</p>
                            <span class="font_1"></span>
                            <span class="font_1"></span>
                            <div class="shdz_rb"></div>
                        </div>
                        <div class="shouhuodizhi">
                            <span class="font_1"></span>
                            <p class="tmui-ellipsis">广东省-东莞市-南城区盛和广场南城区盛和Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, alias, totam, tenetur neque necessitatibus voluptatibus commodi nobis libero ratione magnam mollitia assumenda perferendis ipsum aut porro veritatis unde placeat officiis.</p>
                            <span class="font_1"></span>
                            <span class="font_1"></span>
                            <div class="shdz_rb"></div>
                        </div>
                        <div class="shouhuodizhi">
                            <span class="font_1"></span>
                            <p class="tmui-ellipsis">广东省-东莞市-南城区盛和广场南城区盛和Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, alias, totam, tenetur neque necessitatibus voluptatibus commodi nobis libero ratione magnam mollitia assumenda perferendis ipsum aut porro veritatis unde placeat officiis.</p>
                            <span class="font_1"></span>
                            <span class="font_1"></span>
                            <div class="shdz_rb"></div>
                        </div>
                        <a href="javascript:void(0)" class="font_1 clear" onclick="goUrl()">添加收货地址</a>

                    </div>

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
                                    <td>洲明轩辕LED射灯筒灯LED</td>
                                    <td>1088</td>
                                    <td>1</td>
                                    <td>有货</td>
                                </tr>
                                <tr>
                                    <td>洲明轩辕LED射灯筒灯LED</td>
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
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript">
            $(function(){
                //收货地址选中
                $(".shouhuodizhi").click(function(){
                    $(this).siblings(".shouhuodizhi").removeClass("shdz_sel").end().addClass("shdz_sel");
                });

            });
           
            function goUrl(){
    			window.location.href="${ctx}/youyimoney/addAdd";
    		} 
            function sure(){
    			window.location.href="${ctx}/youyimoney/convertList";
    		} 


            

        </script>
    </body>
</html>


