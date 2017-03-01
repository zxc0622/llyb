<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/5
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>广告预定后台</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/xinxiguanli_v2.css">

    <style>
        .isgreen{color:#5ec520;}

        .tab_main .tab_main_row{height:auto;}
        .tab_main_result table tr{height: auto;}
        .tab_main_result table tr td{padding:3px;}
        .sub_banzhu{margin:0 3px;}
        .tab_main input[type="text"]{height:28px;width:150px;}
        .m_r15{margin-right: 15px;}
        .tab_main_row{margin-top: 10px;}
        select{height:32px;}
        table th{border-bottom: 1px solid #ccc;}
        table td{border-bottom: 1px dashed #ccc;}

        .pic_wait_1{float:left; margin-right:10px; width:150px;}
        .tab_main .tab_main_row  .pic_wait_1 img{width:100%;height:100%;display:none;}
        .pic_wait_1 .a_1{border:1px solid #ccc;height:112px;width:150px; color:#666; float:left; margin-bottom:10px;text-align:center;line-height: 112px;}
        .pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
        .pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
        .pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
    </style>

</head>
<body>
<div class="main_right">
    <div class="cur_position">当前位置>管理中心>广告预定</div>
    <div class="tab_main">
        <div class="tab_title">
            <span class="cur_tab">广告预定</span>
        </div>
        <form action="${ctx}/adsReser/savePrev" id="form1" method="post">
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">选择频道 :</div>
                <select name="channel_id" id="seleone" >
                    <option value="">请选择</option>
                    <c:forEach items="${listall}" var="a" varStatus="sta">
                        <c:if test="${a.parent_id eq 1080 }">
                            <c:choose>
                                <c:when test="${ads.channel_id eq a.id ||chanid eq a.id}">
                                    <option value="${a.id}" data-inn="${sta.index}" selected>${a.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${a.id}" data-inn="${sta.index}" >${a.name}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">上传图片 :</div>
                <div class="pic_wait_1">
                    <a class="a_1" href="javascript:parent.comPic(0);" ><img class="imgshow" alt="等待上传"  >等待上传</a>
                    <a class="a_2" href="javascript:parent.comPic(0);">&nbsp;</a>
                    <a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
                    <a class="a_4" href="javascript:picDel(0);" >&nbsp;</a>
                </div>
            </div>
            <div class="tab_main_row clearfix">
                <div class="fl m_r15">联系电话 :</div>
                <input class="fl m_r15" type="text" placeholder="输入联系电话" name="tel" value="${ads.tel}" id="tel">
                <div class="fl m_r15">联系邮箱 :</div>
                <input class="fl m_r15" type="text" placeholder="输入联系邮箱" name="email" value="${ads.email}" id="email">
            </div>
            <div class="tab_main_row clearfix">
                <a href="javascript:saveadd()" class="fr btn m_r15">保存</a>
            </div>
            <div class="tab_main_row clearfix">
                <div class="m_r15">区域广告 :</div>
                <table style="width:715px;">
                    <tr>
                        <th>区域名称</th>
                        <th>广告价位(元/月)</th>
                        <th>广告形式</th>
                        <th>广告规格</th>
                        <th>展示序号</th>
                        <th>滚动像素</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${adlist}" var="a">
                        <tr>
                            <td >${a.area_name}</td>
                            <td >
                                ${a.price}
                            </td>
                            <td>${a.adv_type}</td>
                            <td>${a.adv_size}</td>
                            <td>${a.show_order}</td>
                            <td>${a.scroll_px}</td>
                            <td style="width:66px"><a href="javascript:editthis('${a.channel_id}','${a.id}');" class="isgreen m_r15">修改</a><a href="javascript:deletethis('${a.channel_id}','${a.id}');" class="isgreen">删除</a></td>
                        </tr>
                    </c:forEach>


                </table>
                <!--      <div class="tab_main_result fl"style="margin-top: 0;">
                     </div> -->
            </div>

            <div class="tab_main_row clearfix">
                <a href="javascript:newadd()" class="fr btn m_r15">新增区域</a>
            </div>
            <!--筛选结果-->


            <input type="hidden" class="tupian" name="pic">
            <input type="hidden"  value="${user.id}" name="create_by">
            <input type="hidden"  value="${today}" name="create_date">
            <input type="hidden"  value="" name="saveid" id="saveid">
        </form>
    </div>
</div>

<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/validation.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script>
    if('${ads.pic}'){
        $(".imgshow").eq(0).css("display","block");
        $(".imgshow").eq(0).attr("src",'${ads.pic}');
        $(".tupian").val('${ads.pic}');
    }
    function  saveadd(){
        var a = $("#seleone").val();
        var tel = $("#tel").val();
        var email = $("#email").val();
        var file1 = $(".imgshow").eq(0).attr("src");
        if(!a||!tel||!email||!file1){
            parent.showMess("请先完善信息");
            return;
        }
        var aa = $.validaEmail(email);
        var bb = $.validaTelephone(tel);
        if(!aa||!bb){
            parent.showMess("邮箱或手机的格式不对");
            return;
        }
        $("#saveid").val($("#seleone").val());
        $("#form1").submit();
    }
    // 上传图片 弹出层方法
    function addPic(str , n){
        $(".imgshow").eq(n).css("display","block");
        $(".imgshow").eq(n).attr("src",str);
        $(".tupian").val(str);
        //$(".pics .pic_wait_1").eq(n).find(".a_1 img").attr("src","${ctx}/findImgResources?imgUrl="+str);
    }
    //图片预览
    function picSea(n){
        var url=$(".imgshow").eq(n).attr("src");
        parent.picView(url);
    }
    //图片删除
    function picDel(n){
        $(".imgshow").eq(n).attr("src","");
        $(".imgshow").eq(n).css("display","none");
    }
    $("#seleone").change(function(){
       /* $.ajax({
            type:'post',
            url:'${ctx}/adsReser/changedown',
            data:'chanid='+$(this).val(),
            dataType:'json',
            success:function(data){

            }
        });*/
        location.href='${ctx}/adsReser/adslist?chanid='+$(this).val();
    });
    function newadd(){
        var seleone  = $("#seleone").val();
        if(!seleone){
            parent.showMess("请先选择频道");
            return;
        }
        $.ajax({
            type:'POST',
            url:'${ctx}/adsReser/validateSave',
            data:'chanid='+seleone,
            dataType:'json',
            success:function(data){
                if(data==false){
                    parent.showMess("请先保存该频道的内容");

                }else{
                    location.href='${ctx}/adsReser/adsadd?chanid='+$("#seleone").val();
                }
            }

        })

    }
    function  editthis(chanid,str){
        location.href='${ctx}/adsReser/adsadd?chanid='+chanid+"&addid="+str;
    }
    function  deletethis(chanid,str){
        parent.showMessYes("确定删除？");
        $(".yes-btn", window.parent.document).unbind().on("click",function(){
            $(".pl_yesorno", window.parent.document).hide();
            $.ajax({
                type : "POST",
                url : "${ctx}/adsReser/delete",
                data : "chanid="+chanid+"&addid="+str,
                dataType : 'json',
                success : function(data) {
                    if(data == true){
                        parent.showMess("删除成功");
                        location.reload();
                    }
                }
            });
        });
    }
</script>
</body>
</html>

