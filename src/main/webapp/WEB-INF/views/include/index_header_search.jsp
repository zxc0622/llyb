<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
	<style>
	</style>

    <div class="header_middle">
        <h1 class="header_logo">
            <a href="${ctx }/index">
                <img src="${ctxStatic}/img/llhb/logo.png" class="logoimg"/>
                <img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_left" />
                <img src="${ctxStatic}/img/llhb/eye.png" class="eye eye_right" />
                <img src="${ctxStatic}/img/llhb/ant1_left.png" class="ant ant_left" style="z-index: 2;"/>
                <img src="${ctxStatic}/img/llhb/ant1_right.png" class="ant ant_right"style="z-index: 2;" />
            </a>
            <span>“互联网+”环保综合服务平台</span>
        </h1>
        <div class="header_search">
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
            </div>
        </div>
        <!-- 右上小广告 -->
       <%-- <div class="header_right">
            <ul>
                <c:forEach items="${ads }" var="ads">
                    <c:if test="${ads.type eq 'C' && ads.stype eq 'S1' }">
                        <c:choose>
                            <c:when test="${empty ads.href }">
                                <li><div class="h_r_img"><img src="${ads.addr }"/></div></li>
                            </c:when>
                            <c:otherwise>
                                <li><div class="h_r_img"><a target="_blank" href="${ads.href }"><img src="${ads.addr }"/></a></div></li>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>
            </ul>
            <a href="javascript:void(0);" class="h_r_next">&gt;</a>
        </div>--%>
        <div class="clear"></div>
    </div>

    <script>

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
    </script>
