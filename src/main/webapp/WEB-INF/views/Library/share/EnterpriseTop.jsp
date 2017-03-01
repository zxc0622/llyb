<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<header >
    <div class="line_top"></div>
    <div class="headerBox">

        <!--头部上部 start-->
        <%@ include file="/WEB-INF/views/include/headertop.jsp"%>
        <!--头部上部 end-->

    </div>
    <!--企业头部中部 start-->
    <div class="qiye_header_middle">
        <div class="qiye_h_m_main">
            <div class="qy_h_m_m_l">
                <h5>${companyList.companyname}</h5>
                <p style="max-width:850px;max-height:65px;overflow:hidden;">${companyList.major}</p>
            </div>
            <div class="qy_h_m_m_r">
                <div class="freehuiyuan"></div>
            </div>
        </div>
    </div>
    <!--企业头部中部部 end-->

    <!--头部banner start-->
    <div class="header_banner" style="height:45px; overflow:visible;">
        <!--头部导航 start-->
        <nav class="header_nav font_3">
            <div class="h_n_left"></div>
            <ul>
                <li  class="header_nav_sel">
                    <a class="shouye" href="${ctx}/homepage/${enterpriseId}" >首页</a>
                </li>
                <li ><a class="gongsijieshao" href="${ctx}/homepage/introduction/${enterpriseId}">公司介绍</a></li>
                <li ><a class="case" href="${ctx}/homepage/cases/${enterpriseId}">案例介绍</a></li>
                <li ><a class="gongyingchanpin" href="${ctx}/homepage/products/${enterpriseId}">供应产品</a></li>
                <li ><a class="xinwenzhongxin" href="${ctx}/homepage/news/${enterpriseId}">新闻中心</a></li>
                <li ><a class="rongyuzizhi" href="${ctx}/homepage/qualification/${enterpriseId}">荣誉资质</a></li>
                <li ><a class="lianxifangshi" href="${ctx}/homepage/contact/${enterpriseId}">联系方式</a></li>
                <li ><a class="gongsixiangce" href="${ctx}/homepage/image/${enterpriseId}" >公司相册</a></li>
            </ul>
            <div class="h_n_right"></div>
        </nav>
        <!--头部导航 end-->
    </div>
    <!--头部banner end-->
</header>
<!--头部 end-->
<!--中间部分start-->
<div class="wrapper">
    <div class="main">
        <div class="main_row_1">
            <div class="cur_position">
                当前位置>优蚁网>企业库>首页
            </div>
            <div class="cur_time">
                今天是 <span id="timeV">10月23日 星期五</span>
            </div>
        </div>
        <!-- 企业头部 -->
        <div class="qiye_main_top">
            <a href="${hengF.ad_url}" target="_blank">
       		  <c:choose>
                  	<c:when test="${hengF.adPic!=null&&hengF.adPic!=''}">
                  		<img src="${hengF.adPic}" alt="">
                  	</c:when>
                  	<c:otherwise>
                        <img src="${ctxStatic}/img/llhb/qiye_02.png" alt="">
                  	</c:otherwise>
	          </c:choose>
            </a>
        </div>
        <!-- 企业头部 结束-->
        <!-- 企业中部     -->
        <div class="qiye_main_mid">
            <!--qy_m_l 中间左侧 -->
            <div class="qy_m_l">
                <div class="qy_m_l_div">
                    <div class="qy_m_l_d_title">
                        <span>企业信息</span>
                        <a href="javascript:void(0)"onclick="go('${ctx}/homepage/introduction/${enterpriseId}')">MORE+</a>
                    </div>
                    <div class="qy_m_l_d_main">
                        <h5>${companyList.companyname}</h5>
                        <p>联系人: ${companyList.realName}</p>
                        <p>所在地区: ${companyList.prov}/${companyList.city}</p>
                        <p>经营模式: ${companyList.jingyingType}</p>
                    </div>
                </div>

                <div class="qy_m_l_div_freevip">
                    <img src="${ctxStatic}/img/llhb/qiye_03.png" alt="">
                    <span class="vip-type">免费会员</span>
                    <span class="vip-time">第1年</span>
                </div>

                <div class="qy_m_l_div">
                    <div class="qy_m_l_d_title">
                        <span>站内搜索</span>
                        <a href="javascript:void(0)" onclick="go('${ctx}/homepage/products/${enterpriseId}')">MORE+</a>
                    </div>
                    <div class="qy_m_l_d_main">
                    <div class="qy_search">
                        <input type="text"placeholder="搜索内容" value="${keyName}" autocomplete='off'><a href="javascript:innerSearch()">搜索</a>
                    </div>
                    </div>
                </div>
                <div class="qy_m_l_div">
                    <div class="qy_m_l_d_title">
                        <span>新闻中心</span>
                        <a href="javascript:void(0)"onclick="go('${ctx}/homepage/news/${enterpriseId}')">MORE+</a>
                    </div>
                    <div class="qy_m_l_d_main">
                        <ul class="point-list">
                        <c:forEach items="${nsList}" var="newsList">
                        <li><a href="${ctx}/Library/homeNews/enterpriseNewsBig?newsId=${newsList.id }&flag=2&enterpriseId=${enterpriseId}">${newsList.title}</a><span>${newsList.createDate}</span></li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="qy_m_l_div">
                    <div class="qy_m_l_d_title">
                        <span>联系方式</span>
                        <a href="javascript:void(0)"onclick="go('${ctx}/homepage/contact/${enterpriseId}')">MORE+</a>
                    </div>
                    <div class="qy_m_l_d_main">
                        <p>联系人:  ${companyList.realName}</p>
                        <p>电话: ${companyList.phoneenterprise}</p>
                        <p>手机:
                            <c:if test="${companyList.showPhone}">***********</c:if>
                            <c:if test="${not companyList.showPhone}">${companyList.personPhone}</c:if>
                        </p>
                        <p>传真: ${companyList.companyfax} </p>
                    </div>
                </div>
            </div>


<script type="text/javascript">

    function innerSearch(){
        var para = $(".qy_search input").val();
        if(!para){
            return;
        }
        location.href='${ctx}/Library/search?para='+para+"&enterpriseId="+${enterpriseId};
    }
</script>
