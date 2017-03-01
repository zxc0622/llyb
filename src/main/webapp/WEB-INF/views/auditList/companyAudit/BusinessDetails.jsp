<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/>
        <title>优蚁环保-会员资料,环评报价,监测报价,危废服务,危废处置,固体废物,固废供应,环保设备</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/gerenshouye_v1.css"/>
        <style type="text/css">
            /*上传图片弹出框*/
            .pl_commit_pic{width:300px;}
            .pl_commit_pic .pl_content{padding:15px 0 5px;}
            .select-commit label{margin-right: 30px;color:#666;}
            .select-commit-content{margin:15px 0;padding:0 40px;}
            .net-pic{display: none;}
            .pl_commit_pic .btns{overflow: hidden;}
            .pl_commit_pic .btns a:nth-child(1){float:left;width:100px;height:30px;line-height: 30px;background-color: #5EC520;color:#fff;text-align: center;margin-left: 40px;}
            .pl_commit_pic .btns a:nth-child(2){float:left;width:100px;height:30px;line-height: 30px;background-color: #ccc;color:#666;text-align: center;margin-left: 20px;}

            /*预览图片弹出框*/
            .pl_view_pic{width:500px;}
            .pl_view_pic .pl_content{padding:15px 0 5px;}
        </style>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/category.js"></script>
    </head>
    <body>

        <div class="main">

           <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span  class="m_r_tname">公司资料</span>
                    </div>
                    <form action="${ctx}/hyzl/saveEnterprise" method="post" id="formSubMit">
                        <div class="tab_main_row ">
                            <label for="">当前用户</label>
                            <div class="row_right font1">
                            	<input type="radio" id="fwNAME" name="fwNAME" onclick="huanbaoFW()"  ><label for="" onclick="checkName(this)">生产型企业</label>
                                <input type="radio" id="hbNAME" name="hbNAME" onclick="huanbaoFW()"  ><label for="" onclick="checkName(this)">环保公司</label>
                                <input type="radio" id="czNAME" name="czNAME" onclick="chuzhiFw()" ><label for="" onclick="checkName(this)">处废企业</label>
                                <input type="radio" id="qtNAME" name="qtNAME" onclick="qita()"  ><label for="" onclick="checkName(this)">其他</label>
                            <!--<input type="radio" id="fwNAME" name="fwNAME"><label for="" >产生废物</label>
                                <input type="radio" id="czNAME"  name="czNAME"><label for="" >处置废物</label>
                                <input type="radio" id="hbNAME" name="hbNAME"><label for="">环保服务</label>
                                <input type="radio" id="qtNAME"  name="qtNAME"><label for="" >其他</label> -->
                            </div>
                        </div>
                         <input type="hidden" value="${companyZl.sheng}" id="hiddenValue"/>
                         <input type="hidden" value="${companyZl.shi}" id="hiddenValue1"/>
                         <input type="hidden" value="${companyZl.enterprisetype}" id="hiddenValue2"/>
                         <input type="hidden" value="${companyZl.waste}" id="hiddenValue3"/>
                         <input type="hidden" value="${companyZl.zjcfname}" id="hiddenValue4"/>
                         <input type="hidden" value="${companyZl.zjcfname3}" id="hiddenValue5"/>
                         <input type="hidden" value="${companyZl.category}" id="hiddenValue6"/> 
                         <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>公司名</label>
                                <div class="row_right font1" id="styleId">
                                    <input type="text" name="companyName" onblur="jyName()" value='${companyZl.companyname}'  id="companyNameId">
                                    <!--  <span class="tip_span tip_wrong">公司名称已存在</span> 
                                   <span class="tip_span tip_ok">&nbsp;可用</span>  -->
                                    
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>公司类型</label>
                                <div class="row_right font1">
                                    <select name="enterpriseType" id="enterpriseTypeId">
                                        <option value="有限公司">有限公司</option>
                                        <option value="个体经营">个体经营</option>
                                        <option value="其他类型">其他类型</option>
                                        <option value="个人">个人</option>
                                    </select>
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">形象图片</label>
                                <div class="row_right font1 tupian">
                                    <input type="text" name="performImg" readonly="true" id="performImgId" value="${companyZl.performimg}">
                                    <a href="javascript:void(0)" onclick="picSea2(0)">[预览]</a>
                                </div>
                           
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">企业logo</label>
                                <div class="row_right font1 tupian">
                                    <input type="text" name="logoImg" readonly="true" id="logoImgId" value="${companyZl.logoimg}">
                                    <a href="javascript:void(0)" onclick="picSea(1)">[预览]</a>
                                </div>
                            
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>所在地区</label>
                                <div class="row_right font1" id="cityId">
                                  <!--   <select name="sheng" id="">
                                        <option value="">省</option>
                                    </select>
                                    <select name="shi" id="">
                                        <option value="">市</option>
                                    </select> -->
                                </div>
                          
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>公司地址</label>
                                <div class="row_right font1">
                                    <input type="text" name="address" id="addressId" value="${companyZl.address}">
                                </div>
                           
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">邮政编码</label>
                                <div class="row_right font1">
                                    <input type="text" name="postalcode" value="${companyZl.postalcode}">
                                </div>
               
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>公司电话</label>
                                <div class="row_right font1">
                                    <input type="text" name="phoneEnterprise" value="${companyZl.phoneenterprise}" id="phoneID">
                                </div>
   
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">公司传真</label>
                                <div class="row_right font1">
                                    <input type="text" name="companyFax" value="${companyZl.companyfax}" id="faxId">
                                </div>
   
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">公司E-mail</label>
                                <div class="row_right font1">
                                    <input type="text" name="eMail" value="${companyZl.email}">
                                </div>
           
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>营业执照</label>
                                <div class="row_right font1 tupian">
                                    <input type="text" id="licenseId" readonly="true" name="licenseImg" value="${companyZl.licenseimg}">
                                    <a href="javascript:void(0)" id="yyzzImg" onclick="picSea2(2)">[预览]</a>
                                </div>

                        </div>
                        <div class="tab_main_row ">
                            
                                <label for="">公司网址</label>
                                <div class="row_right font1">
                                    <input type="text" name="companyUrl" value="${companyZl.companyurl}">
                                </div>
                          
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>行业类别</label>
                                <div class="row_right font1" id="categoryId" >
                                </div>
          
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>主营业务</label>
                                <div class="row_right font1">
                                    <input type="text" name="major" id="majorId" value="${companyZl.major}">
                                </div>
          
                        </div>
                        
                        <div id="classID" style="margin-top: 15px">
                       <c:if test="${companyZl.type == 1 }">
                       	 <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>处废物类别</label>
                                <div class="row_right font1" id="chufeiId">
                                    <!-- <select name="waste" >
                                        <option >请选择</option>
                                    </select> -->
                                </div>
         
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>组织机构代码</label>
                                <div class="row_right font1">
                                    <input type="text" name="companyCode" id="companyCodeID" value="${companyZl.companycode}">
                                </div>
             
                        </div>
                       </c:if>
                        <c:if test="${companyZl.type == 2 }">
                        	 <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>处废物类别</label>
                                <div class="row_right font1" id="chufeiId">
                                    <!-- <select name="waste" >
                                        <option >请选择</option>
                                    </select> -->
                                </div>
         
                        </div>
                        <div class="tab_main_row ">
                            
                                <label for=""><span>*</span>组织机构代码</label>
                                <div class="row_right font1">
                                    <input type="text" name="companyCode" id="companyCodeID" value="${companyZl.companycode}">
                                </div>
             
                        </div>
                        	<div class="tab_main_row ">
                            
                                <label for=""><span>*</span>资质证书</label>
                                <div class="row_right font1">
                                    <input type="text" name="qualImg" readonly="true" id="qualImgId" value="${companyZl.qualimg}">
                                    <a href="javascript:void(0)" onclick="yulanImg(4)">[预览]</a>
                                </div>
                      
                        	</div>
                        <div class="ps_tip font_1">(如有代理类别应选择上传代理类别的资质证书)</div>
                        </c:if>
                        </div>
                        
                        <div class="save_or_return">
                            <a href="javascript:void(0)" onclick="passCompany(1)" id="tong" class="save_btn">通过</a>
                            <a href="javascript:parent.showText('请填写不通过的原因');" id="bTong" class="save_btn">不通过</a>
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
            <div class="pl_content font_3">
                <p>请将星标栏目填写完成后保存!</p>
                <p>否则不能完成认证!</p>
            </div>
        </div>
        

        <!-- 弹出层结束 -->

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

        <script type="text/javascript">
            $(function(){
            	var flag ='${itemFlag}';
            	if(flag==2){
            		$("#tong").remove();
            		$("#bTong").remove();
            	}
            	
            	
            	$("input,select").attr("disabled","disabled");
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
          			var type ='${companyZl.type}';
          			if(type==3){
          				$("#fwNAME").attr("checked","checked");
          				//chanshengFW();
          				 $("#classID").empty();
          				$("#cfId").find("option[value='"+$("#hiddenValue3").val()+"']").attr("selected",true);
          				if($("#cfId").find("option[selected='selected']").val()!=""||$("#cfId").find("option[selected='selected']").val()!=0){
          					chufeiwuCD();
          					$("#zjcfId").find("option[value='"+$("#hiddenValue4").val()+"']").attr("selected",true);
          				}
          				if($("#zjcfId").find("option[selected='selected']").val()!=""||$("#zjcfId").find("option[selected='selected']").val()!=0){
          					chufeiwuCD2();
          					$("#zjcfId3").find("option[value='"+$("#hiddenValue5").val()+"']").attr("selected",true);
          				}
          			}else if(type==4){
          				$("#czNAME").attr("checked","checked");
          				chuzhiFw();
          				$("#cfId").find("option[value='"+$("#hiddenValue3").val()+"']").attr("selected",true);
          				if($("#cfId").find("option[selected='selected']").val()!=""||$("#cfId").find("option[selected='selected']").val()!=0){
          					chufeiwuCD();
          					$("#zjcfId").find("option[value='"+$("#hiddenValue4").val()+"']").attr("selected",true);
          				}
          				if($("#zjcfId").find("option[selected='selected']").val()!=""||$("#zjcfId").find("option[selected='selected']").val()!=0){
          					chufeiwuCD2();
          					$("#zjcfId3").find("option[value='"+$("#hiddenValue5").val()+"']").attr("selected",true);
          				}
          			}else if(type==5){
          				$("#hbNAME").attr("checked","checked");
          				huanbaoFW();
          			}else if(type==6){
          				$("#qtNAME").attr("checked","checked");
          				qita();
          			}else{
          				$("#fwNAME").attr("checked","checked");
          			//	chanshengFW();
          			}
          			
            });
            //通过||不通过
            function passCompany(obj){
            	var str='${itemId}';
            	var str1='${userId}';
            	$.ajax({
            		type : "POST",
            		url : "audit",
            		dataType : "json",
            		async : false,
            		data:"flag="+obj+"&itemId="+str+"&userId="+str1,
            		success : function(data) {
            			if(data=='1'){
            				window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=1";
            			}else if(data=='2'){
            				window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=-1";
            			}
            			
            		}
            	});
            }
          	//图片预览
          	function picSea(n){
          		var url=$(".tupian").eq(n).find("input:text").val();
          		parent.picView(url);
          	}
            function picSea2(n){
                var url=$(".tupian").eq(n).find("input:text").val();
                parent.picView2(url);
            }
            // 上传图片 弹出层方法
            function pl_commit_pic(){
                $(".pl_commit_pic").show();
                $(".popumask").show();
                $(".select-commit input[type=radio]").unbind('click').on("click",function(){
                    $(this).parent().siblings().find("input[type=radio]").removeAttr('checked');
                    if($(this).parent().index()==0){
                        $(".home-pic").show();
                        $(".net-pic").hide();
                    }else{
                        $(".home-pic").hide();
                        $(".net-pic").show();
                    }
                });
                $(".btns a:nth-child(2)").unbind().on("click",function(){
                    $(".pl_commit_pic").hide();
                    $(".popumask").hide();
                });
            }   
           function  getText(content){
        	   var str='${userId}';
        	   var str1='${itemId}';
        	   $.ajax({
           		type : "POST",
           		url : "audit",
           		dataType : "json",
           		async : false,
           		data:"flag=2&userId="+str+"&content="+content+"&itemId="+str1,
           		success : function(data) {
           			if(data=='1'){
           				window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=1";
           			}else if(data=='2'){
           				window.location.href="${ctx}/auditList/companyAudit/companyAuditInit?authFlag=-1";
           			}
           			
           		}
           	});
           }
        </script>
    </body>
</html>


