<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>优蚁币等级</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            .youyi_level{overflow: hidden;padding: 30px 0;position: relative;height:300px;margin-top: 30px;}
            .youyi_level .yyl_perrect{float:left;position: absolute;bottom:30px;}
            .youyi_level .yyl_perrect p{text-align: center;}
            .youyi_level .yyl_perrect span{position:absolute;top:-8px;left:-19px;width:100px;text-align: center;}
            .youyi_level .yyl_perrect .levelrect{width:60px;height:15px;margin:15px auto;}
            .levelrect_lv1 span{color:#E2F291;}
            .levelrect_lv1 .levelrect{background-color:#E2F291 ;}
            .levelrect_lv2 span{color:#B3F291;}
            .levelrect_lv2 .levelrect{background-color:#B3F291 ;}
            .levelrect_lv3 span{color:#94E790;}
            .levelrect_lv3 .levelrect{background-color:#94E790 ;}
            .levelrect_lv4 span{color:#78D991;}
            .levelrect_lv4 .levelrect{background-color:#78D991 ;}
            .levelrect_lv5 span{color:#54CE93;}
            .levelrect_lv5 .levelrect{background-color:#54CE93 ;}
            .levelrect_lv6 span{color:#1BC26A;}
            .levelrect_lv6 .levelrect{background-color:#1BC26A ;}
            .levelrect_lv7 span{color:#1BC26A;}
            .levelrect_lv7 .levelrect{background-color:#1BC26A ;}
            .levelrect_lv8 span{color:#01A060;}
            .levelrect_lv8 .levelrect{background-color:#01A060 ;}
        </style>
        
    </head>
    <body>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>优蚁币管理>优蚁币等级</div>
                <div class="tab_main">
                    <div class="m_r_title"><span span  class="m_r_tname">等级规则</span></div>
                    
                    <div class="youyi_level">
                        <div class="yyl_perrect levelrect_lv1">
                            <span class="font_1">0-200分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>萌萌蚁</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv2">
                            <span class="font_1">200-500分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>工蚁</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv3">
                            <span class="font_1">500-2000分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>兵蚁</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv4">
                            <span class="font_1">2000-5000分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>优蚁达人</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv5">
                            <span class="font_1">5000-10000分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>优蚁超人</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv6">
                            <span class="font_1">10000-20000分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>优蚁皇后</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv7">
                            <span class="font_1">20000-40000分</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>优蚁元老</p>
                        </div>
                        
                        
                        <div class="yyl_perrect levelrect_lv8">
                            <span class="font_1">40000分以上</span>
                            <div class="levelrect">
                                
                            </div>
                            <p>终极优蚁</p>
                        </div>
                    </div>
                    
                
                </div>
            </div>
            <!-- 右侧结束 -->

        </div>

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript">
            $(function(){
                // 初始化等级样式
                $(".yyl_perrect").each(function(){
                    console.log($(this).index());
                    $(this).css("left",$(this).index()*90+30+"px");
                    $(this).find(".levelrect").css("height",$(this).index()*25+15+"px");
                });
            });

                


            

        </script>
    </body>
</html>


