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
            
            .jifenduihuanliebiao_table tr td:nth-of-type(4){color:#ee7800;}
        </style>
        
    </head>
    <body>

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币兑换</div>
                <div class="tab_main"style="margin-bottom:20px;">
                    <div class="m_r_title"><span class="m_r_tname">积分兑换列表</span></div>

                    <form action="">
                        
                        
                        
                        
                        <div class="tab_main_result">
                            <table class="jifenduihuanliebiao_table">
                                <tr>
                                    
                                    <th style="width:150px">兑换商品</th>
                                    <th style="width:65px">消耗积分</th>
                                    <th style="width:100px">剩余积分</th>
                                    <th style="width:100px">兑换数量</th>
                                    <th style="width:100px">兑换状态</th>
                                    <th style="width:120px">兑换时间时间</th>
                                </tr>
                                <c:forEach items="${es}" var="e">
                                    <tr>
                                        <td>${e.pro_name}</td>
                                        <td>${e.point}</td>
                                        <td>${e.remain_point}</td>
                                        <td>${e.num}</td>
                                        <td>已兑换</td>
                                        <td>${fn:substring(e.create_date,0,10)}</td>
                                    </tr>
                                </c:forEach>

                            </table>
                        </div>
                        
                        
                    </form>
                </div>
                
            </div>
            <!-- 右侧结束 -->
        
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript">
            
           
                


            

        </script>
    </body>
</html>


