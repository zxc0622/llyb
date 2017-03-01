<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<!--底部 start-->
<footer>

    <%@ include file="/WEB-INF/views/include/footer_top.jsp" %>
    <!--底部上部信息 end-->

    <!--底部下部信息 start-->
    <%@ include file="/WEB-INF/views/include/footer_bottom.jsp" %>
    <!--底部下部信息 end-->
</footer>
<!--底部 end-->
<div class="popumask"></div>
<!-- 快速申请弹出层 -->
<div class="populayer pl_wffw_shenqing">
    <div class="layer_top">
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content ">
        <h3>基本资料收集表</h3>

        <form action="${ctx}/ws/productwaste/homepage/submitWSInfo"
              id="formobj" method="post">
       		<!-- 环保公司下拉列表框 -->
      		<div style="margin-left: -150px;margin-top: 20px;border:0px solid red;width:680px;">
        		<label style="color: green;">环保公司:</label>
        			<select style="width: 250px; height: 30px;" id="selected" name="serviceMain.hbUser">
       					<c:forEach items="${companyList }" var= "company" varStatus="com">
   							<option value="${company.user_id }"> ${company.company_name }</option>     				
            			</c:forEach>
        			</select>  
       		</div>
            <table class="pl_wffw_shenqing_table">
                <tr>
                    <th>企业名称</th>
                    <td><input type="text" name="serviceMain.compName" style="width: 184px;"></td>
                    <th>地址</th>
                    <td colspan="2"><input type="text" name="serviceMain.compAddr" style="width: 180px;"></td>
                </tr>
                <tr>
                    <th>联系人</th>
                    <td><input type="text" name="serviceMain.contactPerson"></td>
                    <th style="padding: 0px 10px;">电话及移动电话</th>
                    <td colspan="2"><input type="text" name="serviceMain.phone" id="phone"></td>
                </tr>
                <tr>
                    <th>邮箱</th>
                    <td colspan="4"><input type="text" name="serviceMain.email"
                                           id="email"></td>
                </tr>
                <tr>
                    <th>废物名称</th>
                    <td colspan="4" style="text-indent: 10px; text-align: left;">年预计数量
                        (吨)
                    </td>
                </tr>
                <tr>
                    <th><input type="text"
                               name="serviceDetails[0].name"></th>
                    <td colspan="3"><input type="text"
                                           name="serviceDetails[0].weight"></td>
                    <td width="40px;" align="center" onclick="footer.delRow(this);"><a
                            href="javascript:void(0);">删除</a></td>
                    <input type="hidden" name="serviceDetails[0].unit" value="吨"/>
                </tr>
                <tr>
                    <th><input type="text"
                               name="serviceDetails[1].name"></th>
                    <td colspan="3"><input type="text"
                                           name="serviceDetails[1].weight"></td>
                    <td width="40px;" align="center" onclick="footer.delRow(this);"><a
                            href="javascript:void(0);">删除</a></td>
                    <input type="hidden" name="serviceDetails[1].unit" value="吨"/>
                </tr>
                <tr>
                    <th><input type="text"
                               name="serviceDetails[2].name"></th>
                    <td colspan="3"><input type="text"
                                           name="serviceDetails[2].weight"></td>
                    <td width="40px;" align="center" onclick="footer.delRow(this);"><a
                            href="javascript:void(0);">删除</a></td>
                    <input type="hidden" name="serviceDetails[2].unit" value="吨"/>
                </tr>
                <tr>
                    <th><input type="text"
                               name="serviceDetails[3].name"></th>
                    <td colspan="3"><input type="text"
                                           name="serviceDetails[3].weight"></td>
                    <td width="40px;" align="center" onclick="footer.delRow(this);"><a
                            href="javascript:void(0);">删除</a></td>
                    <input type="hidden" name="serviceDetails[3].unit" value="吨"/>
                </tr>
            </table>
            <div style="width:628px;margin:-15px 10px 10px 34px;" class="clearfix" title="增加废物"
                 onclick="footer.addRow();">
                <a style="padding:1px 10px;border:1px solid #ccc;float:left;" href="javascript:void(0)">+</a>
            </div>
        </form>
        <p>备注：1、废物名称可参考环评报告表（书）里的内容填写</p>

        <p style="text-indent: 42px;">
            2、废物产生数量可参考环评报告表（书）里的内容填写或按企业实际产生数量填写</p>

        <div style="margin-top: 30px;">
            <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
        </div>
    </div>
</div>

<%--<div class="populayer pl_yes" style="z-index: 999;">
    <div class="layer_top">
        <span>提示</span>
    </div>
    <div class="pl_content font_3">
        <p>
            请将星标栏目填写完成后保存!<br/>否则不能完成认证!
        </p>

        <div style="margin-top: 30px;">
            <a href="javascript:void(0)" class="btn">确定</a>
        </div>
    </div>
</div>--%>

<div class="popumask"></div>
<div class="populayer pl_normal">
    <div class="layer_top">
        <span>提示</span>
        <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>请将星标栏目填写完成后保存!</p>

    </div>
</div>


<div class="populayer pl_yesorno">
    <div class="layer_top">
        <span>提示</span> <a href="javascript:void(0)" class="close_btn">X</a>
    </div>
    <div class="pl_content font_3">
        <p>登录后才能进行危废服务申请和预约，点击下方登录按钮进行登录/注册</p>

        <div style="margin-top: 30px;">
            <a href="javascript:void(0)" class="btn yes-btn">登录</a> <a
                href="javascript:void(0)" class="btn no-btn">取消</a>
        </div>
    </div>
</div>

<table id="temp" style="display: none;">
    <tr>
        <th><input type="text"
                   name="serviceDetails[3].name"></th>
        <td colspan="3"><input type="text"
                               name="serviceDetails[3].weight"></td>
        <td width="40px;" align="center" onclick="footer.delRow(this);"><a
                href="javascript:void(0);">删除</a></td>
        <input type="hidden" name="serviceDetails[3].unit" value="吨"/>
    </tr>
</table>

<!-- 快速申请结束 -->
<%@ include file="/WEB-INF/views/include/rightLine.jsp" %>
<script language="JavaScript" type="text/javascript">
    if ((navigator.userAgent.indexOf('MSIE') >= 0)
            && (navigator.userAgent.indexOf('Opera') < 0)) {
        $(".populayer").css("left", "25%").css("top", "35%");
        $(".pl_wffw_shenqing").css("left", "25%").css("top", "15%");

    }
</script>

<script>
    var footer = {};

    $(function () {
        var contentNavArr = [];
        var ad_top = $(".header_banner").each(function () {
            contentNavArr.push($(this).offset().top);
        });
        /*滚动条事件*/
        $(window).scroll(function () {
            /*左右悬窗定位*/
            if ($(window).scrollTop() > contentNavArr[0]) {
                $(".nav_bottomlist").show();
                $(".gf_ad_left,.gf_ad_right").css({
                    position: "fixed",
                    top: "95px"
                });

            } else if ($(window).scrollTop() <= contentNavArr[0]) {
                $(".nav_bottomlist").hide();
                $(".gf_ad_left,.gf_ad_right").css({
                    position: "absolute",
                    top: "311px"
                });
            }
        });
        //弹出
        /* $(".wffu_kssq").click(function() {
         $(".pl_wffw_shenqing").show();
         $(".popumask").show();
         }); */

        $(".close_btn").click(function () {
            $(this).parent().parent().hide();
            /* $(".pl_wffw_shenqing").hide();*/
            $(".popumask").hide();
        });

        footer.bindBtn();
    });

    footer.bindBtn = function () {
        $("#submitBtn").bind("click", function () {
            footer.unbindBtn();
            if (footer.checkSubmitInfo()) {
                footer.openConfirm();
            }
            /*if (footer.checkValue()) {
             footer.handleServiceDetails();
             footer.doAjaxForm();
             }*/
        })
    };

    footer.unbindBtn = function () {
        $("#submitBtn").unbind();
    };

    //检查联系人
    footer.checkPhone = function () {
        debugger;
        var phone = $("#phone").val();
        var phoneReg = /^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/;
        if (phone == "") {
            footer.openTipWin("请填写电话及移动电话");
            return false;
        } else if (phoneReg.test(phone)) {
            return true;
        } else {
            footer.openTipWin("请填写正确的电话及移动电话");
            return false;
        }
    };

    //检查邮件
    footer.checkEmail = function () {
        var email = $("#email").val();
        var emailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        if (email == "") {
            footer.openTipWin("请填写邮箱");
            return false;
        } else if (emailReg.test(email)) {
            return true;
        } else {
            footer.openTipWin("请填写正确的邮箱");
            return false;
        }
    };

    footer.checkValue = function () {
        if (!footer.checkPhone()) {
            return false;
        } else if (!footer.checkEmail()) {
            return false;
        } else {
            return true;
        }
    };

    footer.handleServiceDetails = function () {
        var detailsNum = 0;
        $(".pl_wffw_shenqing_table tr").slice(4).each(
                function (index, element) {
                    $(this).find("input").eq(0).attr("name",
                            "serviceDetails[" + index + "].name");
                    $(this).find("input").eq(1).attr("name",
                            "serviceDetails[" + index + "].weight");
                    $(this).find("input").eq(2).attr("name",
                            "serviceDetails[" + index + "].unit");
                    var name = $(this).find("input").val();
                    if (name == "") {
                        $(this).find("input").removeAttr("name");
                    } else {
                        detailsNum += 1;
                    }
                });
        if (detailsNum < 1) {
            footer.openTipWin("请输入至少一条危废服务明细");
            return false;
        }
        return true;
    };

    footer.canSubmitInfo = function () {
        if (!footer.checkValue()) {
            return false;
        } else if (!footer.handleServiceDetails()) {
            return false;
        }
        return true;
    };

    footer.checkSubmitInfo = function () {
        if (footer.canSubmitInfo()) {
            return true;
        } else {
            footer.bindBtn();
            return false;
        }
    };

    //保存按钮的ajaxform
    footer.doAjaxForm = function () {
        debugger;
        var url = "${ctx}/ws/productwaste/homepage/submitWSInfo";
        var data = $("#formobj").serialize();
        $.post(url, data, footer.successCallback).error(function (er) {
            footer.bindBtn();
            footer.openTipWin("提交危废申请失败~！");
        });
    };

    footer.successCallback = function (data) {
        debugger;
        var msg = "";
        if (data.isSuccess) {
            msg = "提交危废申请成功！";
            var id = JSON.stringify(data.obj);
            window
                    .open("${ctx}/home?str=/ws/productwaste/pwbaseinfo/spikToPage?id="
                            + id, "_self");
        } else {
            msg = "提交危废申请失败！";
            footer.bindBtn();
        }
        footer.closeConfirm();
        footer.openTipWin(msg);
    };

    footer.openTipWin = function (msg) {
        $(".popumask").show();
        $(".pl_normal").show().find("p").html(msg);
        setTimeout(function () {
            $(".popumask").fadeOut();
            $(".pl_normal").hide();
        }, 3000);
    };

    footer.closeTipWin = function () {
        $(".popumask").fadeOut();
        $(".pl_yes").hide();
    };

    footer.openYesOrNoWin = function () {
        $(".popumask").show();
        $(".pl_yesorno").show();
        $(".pl_yesorno").find(".yes-btn").unbind().bind("click", function () {
            window.open("${ctx}/login");
        });
        $(".pl_yesorno").find(".no-btn").unbind().bind("click", function () {
            $(".popumask").fadeOut();
            $(".pl_yesorno").hide();
        });
    };

    footer.openConfirm = function () {
        $(".popumask").show();
        $(".pl_yesorno").show().find("p").html("是否确认提交，提交后不可修改~!");
        $(".pl_yesorno").find("a").eq(1).text("确认");
        $(".pl_yesorno").find(".yes-btn").unbind().bind("click", function () {
            footer.doAjaxForm();
        });
        $(".pl_yesorno").find(".no-btn").unbind().bind("click", function () {
            footer.bindBtn();
            footer.closeConfirm();
        });
    };

    footer.closeConfirm = function () {
        $(".popumask").fadeOut();
        $(".pl_yesorno").hide();
    };

    footer.application = function (isLogin, hasServices) {
        if (isLogin) {
            /*if (hasServices) {
                window
                        .open("${ctx}/home?str=/ws/productwaste/pwbaseinfo");
            } else {
                $(".pl_wffw_shenqing").show();
                $(".popumask").show();
            }*/
            window.open("${ctx}/home?str=/ws/productwaste/pwbaseinfo");
        } else {
            footer.openYesOrNoWin();
        }
    };

    footer.addRow = function () {
        $(".pl_wffw_shenqing_table").append($("#temp tr").clone());
    };

    footer.delRow = function (obj) {
        $(obj).parent().remove();
    };

    /* var h_r_index = 0;
     var h_r_next_timer;
     $(".h_r_next").on(
     "click",
     function() {
     $(".header_right ul li").eq(h_r_index).fadeIn().siblings()
     .hide();
     h_r_index++;
     h_r_index = h_r_index >= $(".header_right ul li").length ? 0
     : h_r_index;
     }).on("mouseover", function() {
     clearInterval(h_r_next_timer);
     }).on("mouseleave", function() {
     h_r_next_timer = setInterval(function() {
     $(".h_r_next").trigger("click");
     }, 3000);
     });
     h_r_next_timer = setInterval(function() {
     $(".h_r_next").trigger("click");
     }, 3000); */
</script>
