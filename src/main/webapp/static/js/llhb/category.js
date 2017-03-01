$(function () {
	var fristflag;
    // 行业类别下拉
    $.ajax({
        type: "POST",
        url: "searchCategory",
        dataType: "json",
        async: false,
        success: function (data) {
            var stt = " <select name='category' id='cateID'>";
            $.each(data, function (index, item) {
                if (item.parent_ids.length < 5) {
                    stt += "<option value='" + item.id + "'>" + item.name + "</option>";
                } else {
                    stt += "<option value='" + item.id + "'>&nbsp&nbsp&nbsp" + item.name + "</option>";
                }
            });
            stt += "</select>";
            $("#categoryId").append(stt);
        }
    });
    //处废物第一级菜单
    $.ajax({
        type: "POST",
        url: "searchChuFei",
        dataType: "json",
        async: false,
        success: function (data) {
            var val = " <select name='waste' id='cfId' onchange='chufeiwuCD()' ><option value='0'>请选择</option>";
            $.each(data, function (index, item) {
                val += "<option value='" + item.id + "'>" + item.name
                    + "</option>";
            });
            val += "</select>";
            $("#chufeiId").append(val);
        }
    });


    // 所在地区下拉
    $.ajax({
        type: "POST",
        url: "searchLocProv",
        dataType: "json",
        async: false,
        success: function (data) {
            var val = " <select name='sheng' id='seleid' onchange='diyuCD()'><option value='0'>省</option>";
            $.each(data, function (index, item) {
                val += "<option value='" + item.id + "'>" + item.name
                    + "</option>";
            });
            val += "</select>";
            $("#cityId").append(val);
        }
    });
    // 判断如果鼠标点击公司名称则删除提示
    $("#companyNameId").click(function () {
        $(".tip_ok").remove();
        $(".tip_wrong").remove();
    });


    $("#seleid").find("option[value='" + $("#hiddenValue").val() + "']").attr("selected", true);
    $("#enterpriseTypeId").find("option[value='" + $("#hiddenValue2").val() + "']").attr("selected", true);
    $("#cfId").find("option[value='" + $("#hiddenValue3").val() + "']").attr("selected", true);
    $("#cateID").find("option[value='" + $("#hiddenValue6").val() + "']").attr("selected", true);
    if ($("#cfId").find("option[selected='selected']").val() != "" || $("#cfId").find("option[selected='selected']").val() != 0) {
        chufeiwuCD();
        $("#zjcfId").find("option[value='" + $("#hiddenValue4").val() + "']").attr("selected", true);
    }
    if ($("#zjcfId").find("option[selected='selected']").val() != "" || $("#zjcfId").find("option[selected='selected']").val() != 0) {
        chufeiwuCD2();
        $("#zjcfId3").find("option[value='" + $("#hiddenValue5").val() + "']").attr("selected", true);
    }
    if ($("#seleid").find("option[selected='selected']").val() != "" || $("#seleid").find("option[selected='selected']").val() != 0) {
        diyuCD();
        $("#shiId").find("option[value='" + $("#hiddenValue1").val() + "']").attr("selected", true);
    }
});
// 校验公司名称
function jyName() {
    var str = $("#companyNameId").val();
    var stt = "";
    if (str != "" && str != null) {
        $.ajax({
            type: "POST",
            url: "jyEnterpriseName",
            dataType: "json",
            async: false,
            data: "companyName=" + str + "",
            success: function (data) {
                if (data.flag) {
                    stt += "<span class='tip_span tip_ok'>&nbsp;可用</span>";
                    $("#styleId").append(stt);
                } else {
                    stt += "<span class='tip_span tip_wrong'>公司名称不可用</span> ";
                    $("#styleId").append(stt);
                }
            }
        });
    } else {
        stt += "<span class='tip_span tip_wrong'>公司名称不可用</span> ";
        $("#styleId").append(stt);
    }

}
var uploadServerURL = "";
var uploadServerURL1 = "";
var uploadServerURL2 = "";
var uploadServerURL3 = "";

function submitForm() {
    var options = {
        success: function (data) {
        	if (data == "true") {
            	if(fristflag==1){
		        	msg='感谢完成信息,平台已送你<span style="color:red">1000个优蚁币</span>,3秒后切换到用户首页.';
                    parent.showMess(msg);
		        	setTimeout(function(){
		        		window.parent.location.href = '../home';
		             },3000);
            	}else{
		 			top.document.location.reload();
            	}
            }else if(data=="false"){
            	if(fristflag==1){
		        	msg='修改信息成功,3秒后切换到用户首页.';
                    parent.showMess(msg);
		        	setTimeout(function(){
		        		window.parent.location.href = '../home';
		             },3000);
            	}else{
		 			top.document.location.reload();
            	}
            }
        },
        error: function () {
            parent.showMess("保存失败！");
        },
    };
    $("#formSubMit").ajaxSubmit(options);
}

//保存
function saveEnterprise() {

    var required1 = $("#companyNameId").val();
    var required2 = $("#seleid").val();
    var required3 = $("#addressId").val();
    var required4 = $("#phoneID").val();
    var required5 = $("#licenseId").val();
 //   var required6 = $("#cateID").val();
    var required7 = $("#majorId").val();
    var required11 = $("#shiId").val();
    if ($("#fwNAME").is(":checked") == true) {
        $("#fwNAME").val("3");
        var required8 = $("#cfId").val();
        var required9 = $("#companyCodeID").val();
        var required12 = $("#zjcfId").val();
        var required13 = $("#zjcfId3").val();
        if (required1 == "" || required1 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required2 == "" || required2 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required3 == "" || required3 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required4 == "" || required4 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required5 == "" || required5 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required7 == "" || required7 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required11 == 0 || required11 == "") {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else {
            submitForm();

        }
    } else if ($("#czNAME").is(":checked") == true) {
        $("#czNAME").val("4");
        var required8 = $("#cfId").val();
        var required9 = $("#companyCodeID").val();
        var required10 = $("#qualImgId").val();
        var required12 = $("#zjcfId").val();
        var required13 = $("#zjcfId3").val();
        if (required1 == "" || required1 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required2 == "" || required2 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required3 == "" || required3 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required4 == "" || required4 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required5 == "" || required5 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required7 == "" || required7 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required8 == "" || required8 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required9 == "" || required9 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required10 == "" || required10 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required11 == "" || required11 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required12 == "" || required12 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required13 == "" || required13 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else {
            submitForm();

        }
    } else if ($("#hbNAME").is(":checked") == true) {
        $("#hbNAME").val("5");
        var ckBox = $("input[name='hbCompanyType']");
        if (required1 == "" || required1 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required2 == "" || required2 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required3 == "" || required3 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required4 == "" || required4 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required5 == "" || required5 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required7 == "" || required7 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required11 == "" || required11 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if(!ckBox.is(":checked")){
        	parent.showMess("请选择环保公司类型,否则不能完成认证!");
        	
        }else {
            submitForm();

        }
    }else if($("#qtNAME").is(":checked") == true){
    	$("#qtNAME").val("6");
        if (required1 == "" || required1 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required2 == "" || required2 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required3 == "" || required3 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required4 == "" || required4 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required5 == "" || required5 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required7 == "" || required7 == null) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else if (required11 == "" || required11 == 0) {
            parent.showMess("请将星标栏目填写完成后保存,否则不能完成认证!");

        } else {
            submitForm();
        }
    }
}

//处废物第二级菜单触发
function chufeiwuCD() {
    $("#zjcfId").remove();
    var id = $("#cfId").val();
    var id2 = $("#zjcfId3").val();
    $("#zjcfId3").remove();
    if (id == 0) {
        $("#zjcfId").remove();
        $("#zjcfId3").remove();
    } else {
        $.ajax({
            type: "POST",
            url: "searchChuFeiZJ",
            dataType: "json",
            async: false,
            data: "cfid=" + id + "",
            success: function (data) {
                var val = " <select name='zjcfName' id='zjcfId' onchange='chufeiwuCD2()' ><option value='0'>请选择</option>";
                $.each(data, function (index, item) {
                    val += "<option value='" + item.id
                        + "'>" + item.name
                        + "</option>";
                });
                val += "</select>";
                $("#chufeiId").append(val);
            }
        });
    }
}
//处废物第三级菜单触发
function chufeiwuCD2() {
    $("#zjcfId3").remove();
    var id = $("#zjcfId").val();
    var id1 = $("#cfId").val();
    var id2 = $("#zjcfId3").val();
    if (id == 0) {
        $("#zjcfId3").remove();
    } else {
        $.ajax({
            type: "POST",
            url: "searchChuFeiZJ",
            dataType: "json",
            async: false,
            data: "cfid=" + id + "",
            success: function (data) {
                var val = " <select name='zjcfName3' id='zjcfId3' ><option value='0'>请选择</option>";
                $.each(data, function (index, item) {
                    val += "<option value='" + item.id
                        + "'>" + item.name
                        + "</option>";
                });
                val += "</select>";
                $("#chufeiId").append(val);
            }
        });
    }
}
//省子菜单
function diyuCD() {
    $("#shiId").remove();
    var id = $("#seleid").val();
    if (id == 0) {
        $("#shiId").remove();
    } else {
        $.ajax({
            type: "POST",
            url: "searchLocProvZLB",
            dataType: "json",
            async: false,
            data: "id=" + id + "",
            success: function (data) {
                var val = " <select name='shi' id='shiId'><option value='0'>市</option>";
                $.each(data, function (index, item) {
                    val += "<option value='" + item.id
                        + "'>" + item.name
                        + "</option>";
                });
                val += "</select>";
                $("#cityId").append(val);
            }
        });
    }
}
//获取处废物1级菜单
function chufeiwuCD1() {
    $.ajax({
        type: "POST",
        url: "searchChuFei",
        dataType: "json",
        async: false,
        success: function (data) {
            var val = " <select name='waste' id='cfId' onchange='chufeiwuCD()' ><option value='0'>请选择</option>";
            $.each(data, function (index, item) {
                val += "<option value='" + item.id + "'>" + item.name
                    + "</option>";
            });
            val += "</select>";
            $("#chufeiId").append(val);
        }
    });
}
//点击本地图片时清空网络图片
function checkImg() {
    $("#wangluoId").val('http://');
}
function showMess(str){
	$(".popumask").show();
	$(".pl_normal .pl_content p").html(str);
	$(".pl_normal").show();
	setTimeout(function(){
		$(".popumask").fadeOut();
		$(".pl_normal .pl_content p").html("");
    	$(".pl_normal").hide();
	},3000);
}
