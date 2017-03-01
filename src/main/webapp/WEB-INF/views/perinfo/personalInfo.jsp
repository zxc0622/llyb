<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/>
        <title>个人_会员资料</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            .row_right .phone_number{margin-right: 20px;position: relative;}
            .row_right .phone_number::after{content: "";width:10px;height:15px;background:url(${ctxStatic}/img/llhb/phone_number_03.png) 0 0 no-repeat;position: absolute;right:-20px;top:0;}
			.pic_wait_1{float:left; margin-right:10px; width:150px;}
			.pic_wait_1 .a_1{border:1px solid #ccc;height:112px;width:150px; color:#666; float:left; margin-bottom:10px;text-align:center;line-height: 112px;}
			.pic_wait_1 .a_2{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px;}
			.pic_wait_1 .a_3{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat; padding:6px; background-position:-16px 0;}
			.pic_wait_1 .a_4{background-image:url(${ctxStatic}/img/llhb/xinxi_icon1.png); background-repeat:no-repeat;padding:6px;background-position:-32px 0;}
			.tab_main .tab_main_row  .pic_wait_1 img{width:100%;height:100%;display:none;}

		</style>

    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span class="m_r_tname">个人资料</span>
                        <span onclick="parent.iframeGoToUrl('${ctx}/hyzl/EnterpriseDataZero')">公司资料</span>
                        <span onclick="goUrl('${ctx}/pwdManage/modify')">密码管理</span>
                        <span onclick="goUrl('${ctx}/perinfo/authService')">认证服务</span>
                    </div>
                    <form action="">
                        <div class="tab_main_row ">
                            <label for="">当前用户</label>
                            <div class="row_right font1">
                                <input type="radio" id="gerena" class="geren" name="leibie"><label class="quality" for="">普通个人</label>
                                <input type="radio"  id= "gongcha" class="gongcheng" name="leibie"><label class="quality" for="">环保工程师</label>
                            </div>
                        </div>
						<div class="tab_main_row clearfix">
							<label for=""><span></span>头像</label>
							<div class="row_right font1">
							<div class="pic_wait_1">
								<a class="a_1" href="javascript:parent.comPic(0);" ><img class="imgshow" alt="等待上传"  style="color: #666"></a>
								<a class="a_2" href="javascript:parent.comPic(0);">&nbsp;</a>
								<a class="a_3" href="javascript:picSea(0);">&nbsp;</a>
								<a class="a_4" href="javascript:picDel(0);" >&nbsp;</a>
							</div>

							</div>

						</div>
						<div class="tab_main_row " style="margin-left: 125px;height:30px;margin-top: 10px;margin-bottom: 10px;">
							<p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:80*80,最佳大小:80KB</p>
						</div>
                        <div class="tab_main_row ">
                            <label for="">会员名</label>
                            <div class="row_right font1">
                             <input class="user_name" type="text" readonly="true"  value="${username }" id= "checkusername" onblur="checkname();"/>
                            </div>
                        </div>
                        <div class="tab_main_row ">
                            <label for=""><span>*</span>性别</label>
                            <div class="row_right font1">
                                <input type="radio" class="" name="sex" id = "male" value="男"><label for="">男士</label>
                                <input type="radio" class="" name="sex" id = "female" value="女"><label for="">女士</label>
                            </div>
                        </div>
                        <div class="tab_main_row ">

                                <label for=""><span>*</span>真实姓名</label>
                                <div class="row_right font1">
                                    <input type="text" id="tname" value="${user.name }">

                                </div>

                        </div>
                        <!-- 手机号 -->
                        <div class="tab_main_row ">

                                <label for="">手机号</label>
                                <div class="row_right font1">
                                    <span class="phone_number newtel">
                                       ${person.phone }
                                    </span>
                                    <a class="change_phonenum" href="javascript:void(0)">[修改]</a>
                                    <label class="isShowPhoneNumber" style="line-height: 20px;margin-right: 60px;">
										<c:choose>
											<c:when test="${not person.show_phone}">
												<input name="phone" id="showPhone" type="checkbox" checked="checked" value=""/>
											</c:when>
											<c:otherwise>
												<input name="phone" id="showPhone" type="checkbox"  value=""/>
											</c:otherwise>

										</c:choose>
                                       是否显示手机号码
                                    </label>
                                </div>
                        </div>

                        <div class="tab_main_row ">

                                <label for=""><span></span>邮箱</label>
                                <div class="row_right font1">
                                    <input type="text" id="email" value="${person.email}"  style="float:left;">
                                    <span class="tip_span tip_wrong" style="display:none;float:left;" id="emailErr">请输入有效的邮箱地址</span>
                                </div>
                        </div>
                        <div class="tab_main_row ">
                                <label for=""><span>*</span>所在地区</label>
                                <div class="row_right font1">
                                    <select name="sheng"  id="province" onchange="selectProvince()">
                                    <option value="">省</option>
                                        <c:forEach var="province" items="${provinceList }" varStatus="status" >
                                            <option value="${ province.id}">${province.name}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="" id="city" >
                                        <option value="">市</option>
                                        <c:if test="${cityListOnly != null}">
                                        	<c:forEach var="cityOnly" items="${cityListOnly }" varStatus="status" >
                                              <option value="${cityOnly.id}">${cityOnly.name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>

                        </div>
                        <div class="tab_main_row ">

                                <label for="">所在部门</label>
                                <div class="row_right font1">
                                    <input type="text" id="depart" value="${person.dept }">
                                </div>

                        </div>
                        <div class="tab_main_row ">

                                <label for="">职务</label>
                                <div class="row_right font1">
                                    <input type="text" id="zhiwu" value="${person.pro_title }">
                                </div>

                        </div>
                        <div class="tab_main_row ">

                                <label for="">QQ</label>
                                <div class="row_right font1">
                                    <input type="text" id="qqnum" value="${person.qq_num}">
                                </div>

                        </div>

                        <div class="save_or_return">
                            <a href="javascript:void(0)" class="save_btn">保存</a>
                            <a href="javascript:void(0)" class="return_btn">返回</a>
                        </div>

                    </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>

        <!-- 弹出层 -->
        <div class="popumask"></div>
        <div class="populayer pl_normal" >
            <div class="layer_top">
                <a href="javascript:void(0)" class="close_btn">X</a>
            </div>
            <div class="pl_content font_3" id="contentText">
                <p>请将星标栏目填写完成后保存!</p>
                <p>否则不能完成认证!</p>
            </div>
        </div>

        <!-- 弹出层结束 -->

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/main-pl.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
        	$(function(){
        		//修改手机号
        		$(".change_phonenum").click(function(){
        			parent.showphoneMess();
        		});

        	});
            $(function(){
            	//页面一加载
            	if('${user.type}'){
            		if('${user.type}'==1){
                		$("input[name=leibie]:eq(0)").attr("checked",'checked');
                	}else if('${user.type}'==2){
                		$("input[name=leibie]:eq(1)").attr("checked",'checked');
                	}
            	}
				if('${user.headImg}'){
					$(".imgshow").eq(0).css("display","block");
					$(".imgshow").eq(0).attr("src",'${user.headImg}');
					//$(".tupian").val('${ads.pic}');
				}
            	//默认省市

            	if('${person.sex}'){
            		var male = $("#male").val();
            		if('${person.sex}' == 'M'){
            			$("#male").attr("checked","checked");
            		}else{
            			$("#female").attr("checked","checked");
            		}
            	}
            	$('#province option').each(function () {
            	    if('${person.loc_prov_id}' == $(this).val()){
            	    	$(this).attr('selected','selected');
						selectProvince();
            	    }
            	});

            	$('#city option').each(function () {
            	    if('${person.loc_city_id}' == $(this).val()){
            	    	$(this).attr('selected','selected');
            	    }
            	});
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
               // populayer_fn(".save_btn");

               $(".quality").click(function(){
            	   if($(this).html()=="普通个人"){
            		   $("#gerena").prop("checked",true);
            		   $("#gongcha").prop("checked",false);
            	   }else{
            		   $("#gerena").prop("checked",false);
            		   $("#gongcha").prop("checked",true);
            	   }
               });
            });

                       $(".popumask").css({"width":$(window).width()+"px","height":$(window).height()+"px"});
                       //弹出层 添加对号
                       $(".checkone p .l_square").click(function(){
                           $(this).parent().parent().find("span").removeClass("checkone_sel");
                           $(this).addClass("checkone_sel");
                       });
                       //弹出层 关闭
                       $(".populayer .layer_top a").click(function(){
                           $(".populayer").fadeOut();
                           $(".popumask").fadeOut();
                       });
                       $(".popumask").click(function(){
                           $(".populayer").fadeOut();
                           $(".popumask").fadeOut();
                       });
                       //弹出层 进入优蚁
                       // $(".populayer register_done").click(function(){
                       //     //跳转页面
                       //     //location.assign("https://www..com");
                       // });
                 //保存
                 $(".save_btn").bind("click",function(){
					   var originName = '${username }';
                	   var sex = $('input[name="sex"]:checked').val();
                	   var leibie = $("input[name=leibie]:checked").next("label").text();
                	   var province = $("#province option:selected").val();
                	   var city = $("#city option:selected").val();
                	   var email= $("#email").val();
                	   var tname=  $("#tname").val();
                	   var zhiwu = $("#zhiwu").val();
                	   var depart = $("#depart").val();
                	   var qqnum = $("#qqnum").val();
                	   var username = $("#checkusername").val();
					   var file1 = $(".imgshow").eq(0).attr("src");

					 //判断是否显示手机号
                       var showPhone = $('#showPhone:checked').is(":checked");

                	   if(leibie == ""){
                		   parent.showMess("请选择您的类别!!");
                           return;
                	   }
                	   if (sex==undefined||tname==""||!province||!city){
                		   parent.showMess("请将星标栏目填写完成后保存!!");
                           return;
                	   }
                	   if(email!=""&&!blurEmail()){
                		   parent.showMess("请注意提示!");
                           return;
                	   }
						 if(originName!=username){
							 if(!checkname()){
								 parent.showMess("该用户名已经存在!");
								 return;
							 }
						 }

                	   $.ajax({
              				type : "POST",
            				url : "${ctx}/perinfo/saveInfo",
            				data : "touxiang="+file1+"&username="+username+"&sex=" + sex+"&leibie=" + leibie+"&tname=" + tname+"&email=" + email+"&depart=" + depart+"&zhiwu=" + zhiwu+"&qqnum=" + qqnum+"&province=" + province+"&city=" + city+"&isShowPhone="+showPhone,
            				dataType : 'text',
            				success : function(data) {
            					if(data == "ok"){
            						parent.showMess("保存成功!");
            			//			location.href="${ctx}/userhomepage/index";
            						setTimeout(function(){
            		            		$(".popumask", window.parent.document).hide();
            		            		$(".pl_normal", window.parent.document).hide();
            		            		window.parent.location.href="${ctx}/home";
            		            	},3000);

            					}
            				}
            			});
                   });
              //根据选择的省加载城市
               function selectProvince(){
            	   var province = $("#province option:selected").val();
            	   $("#city").text('');
            	   if(!province){
            		   var htmlss="<option value=''>市</option>";
            		   $("#city").append(htmlss);

            	   }else{
	            	   $.ajax({
	         			type : "POST",
	       				url : "${ctx}/perinfo/getCity",
	       				data : "province=" + province,
	       				dataType : 'json',
	       				success : function(data) {
	       					var htmls = "<option value=''>市</option>";
	       					$.each(data,function(index, item) {
	       						htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
	       					});
	       					$("#city").append(htmls);
							$('#city option').each(function () {
								if('${person.loc_city_id}' == $(this).val()){
									$(this).attr('selected','selected');
								}
							});
	       				}
	       			});
            	}
               }
               //校验邮箱

               function blurEmail(){
            	   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            	   var flag = false;
            	   var email = $("#email").val();
     			  if(!re.test(email)){
     				 $("#emailErr").css("display","block");
     				 flag = false;
         		  }else{
         			 $("#emailErr").css("display","none");
         			 flag = true;
         		  }
     			  return flag;
               }

              function telcode(tel,code){
            	 var bb = false;
             	 $.ajax({
      				type : "POST",
      				url : "${ctx}/reg/checkTelExists",
      				data : "tel=" + tel ,
      			 	async: false,
      				dataType : 'text',
      				success : function(data) {
      					if(data!="ok"){
      						 parent.showMess(data);
      						bb = false;
      					}else{
      						bb = true;
      					}
      				}
      			});
             	 if(bb==false){
             		 return;
             	 }
            	  if($.trim(tel)==""||$.trim(code)==""){
            		  parent.showMess("请先完善信息");
            	  }else{
            		  $.ajax({
        	 				type : "POST",
        	 				url : "${ctx}/checkCode",
        	 				data : "tel=" + tel+"&checkCode="+code,
        	 				dataType : 'text',
        	 				success : function(data) {
        	 					if(data!="ok"){
        	 						parent.showMess(data);

        	 					}else{
        	 						$.ajax({
        	 		  	 				type : "POST",
        	 		  	 				url : "${ctx}/perinfo/editphone",
        	 		  	 				data : "tel=" + tel+"&checkCode="+code,
        	 		  	 				dataType : 'text',
        	 		  	 				success : function(data) {
        	 		  	 					if(data=="true"){
        	 		  	 						parent.showMess("修改成功");
        	 		  	 						$(".newtel").html(tel);
      	  	 		  	 					setTimeout(function(){
      	  	 				            		$(".popumask", window.parent.document).hide();
      	  	 				            		$(".pl_normal", window.parent.document).hide();
      	  	 				            	},1500);
      	  	 		  	 			 		parent.hidephoneMess();
        	 		  	 					}
        	 		  	 				}
        	 						});
        	 					}
        	 				}
                  	  });
            	  }

              }

            //校验用户名
          function checkname(){
            	var bb=false;
            	var name = $("#checkusername").val();
			    if(name!='${username}'){
					$.ajax({
						type : "POST",
						url : "${ctx}/perinfo/checkusername",
						data : "name=" + name ,
						async: false,
						dataType : 'text',
						success : function(data) {
							if(data!="ok"){
								parent.showMess(data);
								bb = false;
							}else{
								bb = true;
							}
						}
					});
					return bb;
				}

            }
			// 上传图片 弹出层方法
			function addPic(str , n){
				$(".imgshow").eq(n).css("display","block");
				$(".imgshow").eq(n).attr("src",str);
				//$(".tupian").val(str);
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
        </script>
    </body>
</html>