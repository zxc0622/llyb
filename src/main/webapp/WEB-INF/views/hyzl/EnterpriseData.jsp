<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>产废企业_个人会员资料</title>
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
            .view_pic_div{width:60%;height:50%;}
        </style>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery.form.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        
        <script type="text/javascript" src="${ctxStatic}/js/llhb/category.js"></script>
  		<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
  		<script>
  		$(function(){
  			fristflag=0; 
  			var type ='${companyZl.type}';
  			if(type==3){
  				$("#fwNAME").attr("checked","checked");
  			//	chanshengFW();
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
                fristflag=1;
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
                fristflag=1;
  			}else if(type==5){
  				$("#hbNAME").attr("checked","checked");
  				huanbaoFW();
                fristflag=1;
                showHBCompanyType();
  			}else if(type==6){
  				$("#qtNAME").attr("checked","checked");
  				qita();
                fristflag=1;
  			}else{
  				$("#fwNAME").attr("checked","checked");
  			//	chanshengFW();
  				fristflag=1;
  			}

            //弹出提示信息,并清空
            var tip = '<%=session.getAttribute("tip")%>';
            <%
                session.setAttribute("tip","");
            %>
            if(tip != "" && tip != 'null'){
                parent.showMess(tip);
            }
  			
  		});
  	//判断选择的当前用户
  		function chanshengFW() {
			$("#classID").empty();
			var arr = " <div class='tab_main_row ' >"
					+ "<label for=''><span>*</span>废物类别</label>"
					+ "<div class='row_right font1' id='chufeiId'>"
				    + "</div>" + "</div>"
					+ " <div class='tab_main_row'>"
					+ "<label for=''><span>*</span>组织机构代码</label>"
					+ "<div class='row_right font1'>"
					+ "<input type='text' name='companyCode' value='${companyZl.companycode}' id='companyCodeID'>" + "</div>"
					+ "</div>";
			$("#classID").append(arr);
			chufeiwuCD1();
  		}
  		function chuzhiFw() {
			$("#classID").empty();
			$(".hbCompanyType").empty();
			var arr = " <div class='tab_main_row '>"
					+ "<label for=''><span>*</span>处废物类别</label>"
					+ "<div class='row_right font1' id='chufeiId'>"
					+ "</div>"
					+ "</div>"
					+ " <div class='tab_main_row'>"
					+ "<label for=''><span>*</span>组织机构代码</label>"
					+ "<div class='row_right font1'>"
					+ "<input type='text' name='companyCode' value='${companyZl.companycode}' id='companyCodeID'>"
					+ "</div>"
					+ "</div>"
					+ "<div class='tab_main_row tupian' >"
					+ "<label for=''><span>*</span>资质证书</label>"
					+ "<div class='row_right font1'>"
					+ "<input type='text' readonly='true' readonly='true' value='${companyZl.qualimg}' name='qualImg' id='qualImgId'>"
					+ "<a onclick='parent.comPic(3)'>[上传]</a>"
					+ "<a  onclick='picSea(3)'>[预览]</a>"
					+ "<a  onclick='picDel(3)'>[删除]</a>"
					+ "</div>"
					+ "</div>"
					+ "<div class='ps_tip font_1'>(如有代理类别应选择上传代理类别的资质证书)</div>";
			$("#classID").append(arr);
			chufeiwuCD1();
  		}
  		function huanbaoFW() {
  			$("#classID").empty();
  			$(".hbCompanyType").empty();
  		}
  		function qita() {
  			$("#classID").empty();
  			$(".hbCompanyType").empty();
  		}
  		function showHBCompanyType() {
  			$(".hbCompanyType").empty();
  			$("#classID").empty();
  			var $hbbox = $(
  				'<div class="tab_main_row">'+
		  			'<label for=""><span>*</span>环保公司类型</label>'+
			            '<div class="row_right font1">'+
			    		'<label><input type="checkbox" name="hbCompanyType" value="1"/>环境评估与认证</label>&nbsp;&nbsp;'+
			    		'<label><input type="checkbox" name="hbCompanyType" value="2"/>环境工程与运营</label>&nbsp;&nbsp;'+
			    		'<label><input type="checkbox" name="hbCompanyType" value="3"/>环境监测</label>&nbsp;&nbsp;'+
			    		'<label><input type="checkbox" name="hbCompanyType" value="4"/>废物处理处置</label>'+
		    		'</div>'+
	    		'</div>');
  			var type = '${companyZl.hbcompanytype}';
  			if(type != null && type != undefined && type!= ""){
  				var t = type.split(",");
  				var len = t.length;
  				var $input;
  				var leng;
  				var inputEl;
  				for(var i=0;i<len;i++){
  					$input = $hbbox.find("input");
  					leng = $input.length;
  					for(var j=0;j<leng;j++){
  						inputEl=$input.eq(j);
  						if(t[i] == inputEl.val()){
  							inputEl.attr("checked", true);
  						}
  					}
  				}
  			}
  			$(".hbCompanyType").append($hbbox);
  		}
  		//点击文字触发checkbox
  		function checkName(obj){
  			if($(obj).text()=="生产型企业"){
  				$(".hbCompanyType").empty();
  			//	chanshengFW();
  			    huanbaoFW();
  				$("#fwNAME").prop("checked",true);
  				$("#hbNAME").prop("checked",false);
  				$("#czNAME").prop("checked",false);
  				$("#qtNAME").prop("checked",false);
  			}else if($(obj).text()=="环保公司"){
  				showHBCompanyType();
  				$("#fwNAME").prop("checked",false);
  				$("#hbNAME").prop("checked",true);
  				$("#czNAME").prop("checked",false);
  				$("#qtNAME").prop("checked",false);
  			}else if($(obj).text()==="处废企业"){
  				$(".hbCompanyType").empty();
  				chuzhiFw();
  				$("#fwNAME").prop("checked",false);
  				$("#hbNAME").prop("checked",false);
  				$("#czNAME").prop("checked",true);
  				$("#qtNAME").prop("checked",false);
  			}else if($(obj).text()==="其他"){
  				$(".hbCompanyType").empty();
  				qita();
  				$("#fwNAME").prop("checked",false);
  				$("#hbNAME").prop("checked",false);
  				$("#czNAME").prop("checked",false);
  				$("#qtNAME").prop("checked",true);
  			}
  		}
  		</script>  
    </head>
    <body>
        <div class="popumask" style="z-index: 1;"></div>
		<div class="populayer pl_normal" >
			<div class="layer_top">
				<span>提示</span>
				<a href="javascript:void(0)" class="close_btn">X</a>
			</div>
			<div class="pl_content font_3">
				<p></p>
			</div>
		</div>
        <div class="main">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员资料</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span onclick="parent.iframeGoToUrl('${ctx}/perinfo')">个人资料</span>
                        <span  class="m_r_tname">公司资料</span>
                        <span onclick="goUrl('${ctx}/pwdManage/modify')">密码管理</span>
                        <span onclick="goUrl('${ctx}/perinfo/authService')">认证服务</span>
                    </div>
                    <form action="${ctx}/hyzl/saveEnterprise" method="post" id="formSubMit">
                        <div class="tab_main_row ">
                            <label for="">当前用户</label>
                            <div class="row_right font1">
                                <input type="radio" id="fwNAME" name="fwNAME" onclick="huanbaoFW()"  ><label for="" onclick="checkName(this)">生产型企业</label>
                                <input type="radio" id="hbNAME" name="hbNAME" onclick="showHBCompanyType()"  ><label for="" onclick="checkName(this)">环保公司</label>
                                <input type="radio" id="czNAME" name="czNAME" onclick="chuzhiFw()" ><label for="" onclick="checkName(this)">处废企业</label>
                                <input type="radio" id="qtNAME" name="qtNAME" onclick="qita()"  ><label for="" onclick="checkName(this)">其他</label>
                                <!-- <input type="radio" id="fwNAME" name="fwNAME" onclick="chanshengFW()"  ><label for="" onclick="checkName(this)">产生废物</label>
                                <input type="radio" id="czNAME" name="czNAME" onclick="chuzhiFw()"  ><label for="" onclick="checkName(this)">处置废物</label>
                                <input type="radio" id="hbNAME" name="hbNAME" onclick="huanbaoFW()" ><label for="" onclick="checkName(this)">环保服务</label>
                                <input type="radio" id="qtNAME" name="qtNAME" onclick="qita()"  ><label for="" onclick="checkName(this)">其他</label>  -->
                            </div>
                        </div>
                        <input type="hidden" value="${companyZl.sheng}" id="hiddenValue"/>
                        <input type="hidden" value="${companyZl.shi}" id="hiddenValue1"/>
                        <input type="hidden" value="${companyZl.enterprisetype}" id="hiddenValue2"/>
                        <input type="hidden" value="${companyZl.waste}" id="hiddenValue3"/>
                        <input type="hidden" value="${companyZl.zjcfname}" id="hiddenValue4"/>
                        <input type="hidden" value="${companyZl.zjcfname3}" id="hiddenValue5"/>
                        <input type="hidden" value="${companyZl.category}" id="hiddenValue6"/> 
                       
                        <!-- 上半部分内容边框开始 -->
                        <div style="border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;">
                        	<!-- 环保公司类型start  -->
                        	<div class="hbCompanyType">
                        		<!-- 
	                        	<div class="tab_main_row">
	                        		<label for=""><span>*</span>环保公司类型</label>
		                        	<div class="row_right font1">
		                        		<label><input type="checkbox" name="hbCompanyType" value="1"/>环境评估与认证</label>&nbsp;&nbsp;
		                        		<label><input type="checkbox" name="hbCompanyType" value="2"/>环境工程与运营</label>&nbsp;&nbsp;
		                        		<label><input type="checkbox" name="hbCompanyType" value="3"/>环境监测</label>&nbsp;&nbsp;
		                        		<label><input type="checkbox" name="hbCompanyType" value="4"/>废物处理处置</label>
		                        	</div>
	                        	</div>
	                        	 -->
                        	</div>
                        	<!-- 环保公司类型end  -->
                        
	                        <div class="tab_main_row ">
	                            
		                        <label for=""><span>*</span>公司名</label>
		                        <div class="row_right font1" id="styleId">
		                            <input type="text" name="companyName"  value='${companyZl.companyname}'  id="companyNameId" onblur="checkCompanyName()">
		                            <span class="tip_span " style="color:#666;">公司名称请与营业执照一致</span>
		                            <!--  <span class="tip_span tip_wrong">公司名称已存在</span> 
		                           <span class="tip_span tip_ok">&nbsp;可用</span>  -->
		                            
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
	                            
	                                <label for=""><span>*</span>公司电话</label>
	                                <div class="row_right font1">
	                                    <input type="text" name="phoneEnterprise" value="${companyZl.phoneenterprise}" id="phoneID">
	                                </div>
	   
	                        </div>
	                        <div class="tab_main_row ">
	                            
	                                <label for=""><span>*</span>主营业务</label>
	                                <div class="row_right font1">
	                                    <input type="text" name="major" id="majorId" value="${companyZl.major}">
	                                </div>
	          
	                        </div>
	                        
	                         <div class="tab_main_row " style="margin-bottom: 15px;">
	                            
	                                <label for=""><span>*</span>营业执照</label>
	                                <div class="row_right font1 tupian">
	                                    <input type="text" id="licenseId" readonly="true" name="licenseImg" value="${companyZl.licenseimg}">
	                                    <a  onclick="parent.comPic(0)">[上传]</a>
	                                    <a href="javascript:void(0)" id="yyzzImg" onclick="picSea2(0)">[预览]</a>
	                                    <a href="javascript:void(0)" onclick="picDel(0)">[删除]</a>
	                                </div>
	
	                        </div>
	
	                         <div class="tab_main_row " style="margin-left: 125px;height:30px;margin-top: 10px;margin-bottom: 10px;">
	                                 <p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:560*340,最佳大小:100KB</p>
	                         </div>
                       
                        </div>
                        <!-- 上半部分内容边框结束 -->
                        
                        <!-- 下半部分内容边框开始 -->
                         <div style="border-bottom: 1px solid #cccccc">
                          <div class="tab_main_row " style="margin-right: 20px;">
                                <label for="">公司类型</label>
                                <div class="row_right font1">
                                    <select name="enterpriseType" id="enterpriseTypeId">
                                        <option value="有限公司">有限公司</option>
                                        <option value="个体经营">个体经营</option>
                                        <option value="其他类型">其他类型</option>
                                        <option value="个人">个人</option>
                                    </select>
                                </div>
                          </div>
                         <div class="tab_main_row " style="float: left;margin-top: -34px;margin-left:235px;">
                                <label for="">行业类别</label>
                                <div class="row_right font1" id="categoryId" >
                                </div>
                         </div>
                          
                        <div class="tab_main_row ">
                            
                                <label for="">形象图片</label>
                                <div class="row_right font1 tupian">
                                    <input type="text" name="performImg" readonly="true" id="performImgId" value="${companyZl.performimg}">
                                    <a href="javascript:void(0)" id="xxImg" onclick="parent.comPic(1)">[上传]</a>
                                    <a href="javascript:void(0)" onclick="picSea2(1)">[预览]</a>
                                    <a href="javascript:void(0)" onclick="picDel(1)">[删除]</a>
                                </div>
                           
                        </div>
                             <div class="tab_main_row " style="margin-left: 125px;height:30px;margin-top: 10px;margin-bottom: 10px;">
                                 <p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:200*180,最佳大小:40KB</p>
                             </div>
                        
                           <div class="tab_main_row ">
                            
                                <label for="">企业logo</label>
                                <div class="row_right font1 tupian">
                                    <input type="text" name="logoImg" readonly="true" id="logoImgId" value="${companyZl.logoimg}">
                                    <a href="javascript:void(0)" id="qyLogoImg"  onclick="parent.comPic(2)">[上传]</a>
                                    <a href="javascript:void(0)" onclick="picSea(2)">[预览]</a>
                                    <a href="javascript:void(0)" onclick="picDel(2)">[删除]</a>
                                </div>
                            
                        </div>
                             <div class="tab_main_row " style="margin-left: 125px;height:30px;margin-top: 10px;margin-bottom: 10px;">
                                 <p style="color: #AAAAAA;font-size: 12px;">最佳尺寸:80*80,最佳大小:10KB</p>
                             </div>
                        
                        <div class="tab_main_row ">
                            
                                <label for="">邮政编码</label>
                                <div class="row_right font1">
                                    <input type="text" name="postalcode" value="${companyZl.postalcode}">
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
                        <div class="tab_main_row " style="margin-bottom: 15px;">
                            
                                <label for="">公司网址</label>
                                <div class="row_right font1">
                                    <input type="text" name="companyUrl" value="${companyZl.companyurl}">
                                </div>
                          
                        </div>
                        </div>
                        <!-- 下半部分内容边框结束 -->
                        
                        <div id="classID" style="margin-top: 15px">
                       <c:if test="${order != 0 }">
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
                        <c:if test="${order == 2 }">
                        	<div class="tab_main_row ">
                            
                                <label for=""><span>*</span>资质证书</label>
                                <div class="row_right font1">
                                    <input type="text" name="qualImg" readonly="true" id="qualImgId" value="${companyZl.qualimg}">
                                    <a  onclick="parent.comPic(3)">[上传]</a>
                                    <a  onclick="picSea(3)">[预览]</a>
                                    <a  onclick="picDel(3)">[删除]</a>
                                </div>
                      
                        </div>
                        <div class="ps_tip font_1">(如有代理类别应选择上传代理类别的资质证书)</div>
                        </c:if>
                        </div>
                        
                        <div class="save_or_return">
                            <a href="javascript:void(0)" onclick="saveEnterprise()" class="save_btn" id="submit_btn">保存</a>
                            <a href="javascript:void(0)" class="return_btn">返回</a>
                        </div>
                        <div class="find_address">
                            <input type="text" placeholder="输入地点名" id="cityName">
                            <a href="javascript:void(0)" class="normal_btn" onclick="theLocation()">搜索</a>
                            <a href="javascript:void(0)" class="normal_btn" onclick="map.clearOverlays();mkrTool.open();">开始标注</a>
                        </div>

                        <!-- 放百度地图 -->
                        <div class="baidu_map">
                            <div class="baidu_map_title">百度地图</div>
                            <script src="http://api.map.baidu.com/api?v=1.4" type="text/javascript"></script>
                            <script type="text/javascript" src="http://api.map.baidu.com/library/MarkerTool/1.2/src/MarkerTool_min.js"></script>
                            <!-- <script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script> -->
                            
                            <div id="container"></div>
                            
                            <script type="text/javascript"> 
                            var map_con=document.getElementById("container");
                            map_con.style.height="100%";
                            var map = new BMap.Map("container");          // 创建地图实例  
                            var point = new BMap.Point(116.404, 39.915);  // 创建点坐标  
                            map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别  
                            var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
                            var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
                            var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
                            /*缩放控件type有四种类型:
                            BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
                            
                            var overView = new BMap.OverviewMapControl();
                            var overViewOpen = new BMap.OverviewMapControl({isOpen:true, anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
                            //添加控件和比例尺
                            map.addControl(top_left_control);        
                            map.addControl(top_left_navigation);     
                            map.addControl(top_right_navigation);
                            map.addControl(overView);          //添加默认缩略地图控件
                            map.addControl(overViewOpen);      //右下角，打开
                            
                            map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
                           // map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
                            function theLocation(){
                                    var city = document.getElementById("cityName").value;
                                    if(city != ""){
                                        map.centerAndZoom(city,11);      // 用城市名设置地图中心点
                                    }
                                    var local = new BMap.LocalSearch(map, {
                                        renderOptions:{map: map}
                                    });
                                    local.search(city);
                                } 
                            function myFun(result){
                                    var cityName = result.name;
                                    map.setCenter(cityName);
                                    
                                }
                            var myCity = new BMap.LocalCity();
                            myCity.get(myFun);  
                            //已标注的点
                            var marker_point = new BMap.Point(1,11);
                            map.centerAndZoom(marker_point, 14);
                            var marker = new BMap.Marker(marker_point);        // 创建标注   
                            map.addOverlay(marker);                     // 将标注添加到地图中  
                                                                    
                            var mkrTool = new BMapLib.MarkerTool(map, {autoClose: true,followText: "点击左键添加标注"});// 创建标注工具实例
                            mkrTool.addEventListener("markend", function(e){                      
                                var xcode = e.marker.getPosition().lng;
                                var ycode = e.marker.getPosition().lat;
                                document.getElementById("mapcodex").value=xcode; 
                                document.getElementById("mapcodey").value=ycode; 
                                alert("标注成功！");
                                e.marker.enableDragging();
                                e.marker.addEventListener("dragend", function (e) {
                                var xcode = e.point.lng;
                                var ycode = e.point.lat;
                                document.getElementById("mapcodex").value=xcode; 
                                document.getElementById("mapcodey").value=ycode;
                            }); 
                            });
                                

                            </script>  
                        </div>
                        <div class="find_xy">
                            <label for="">X坐标:</label><input type="text" name="Xmapcode"id="mapcodex"><br/>
                            <label for="">Y坐标:</label><input type="text" name="Ymapcode" id="mapcodey">
                            
                        </div>
                    </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>
		 <!-- 上传弹出层结束 -->
        <script type="text/javascript">
            $(function(){
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
                populayer_fn();
            });

            function checkCompanyName(){
                var orignName =  '${companyZl.companyname}';
                var companyName = $("#companyNameId").val();
                if(companyName == orignName){
                    $("#submit_btn").attr("class","save_btn");
                    $("#submit_btn").attr("onclick","saveEnterprise()");
                    return;
                }
                console.log("校验公司名称:" + companyName);
                //将提交按钮置为灰色,不可点击
                $("#submit_btn").attr("class","return_btn");
                $("#submit_btn").attr("onclick","javascript:void(0);");
                //校验公司名称是否存在
                $.ajax({
                    type:"post",
                    url:"${ctx}/hyzl/jyEnterpriseName",
                    data:"companyName="+companyName,
                    success:function(data){
                       if(data.flag){
                           $("#submit_btn").attr("class","save_btn");
                           $("#submit_btn").attr("onclick","saveEnterprise()");
                       }else{
                           parent.showMess("该公司已被注册,请联系客服,谢谢!");
                       }
                    }
                })
            }


            //左侧菜单展开收缩
            $(document).ready(function(){
                            //根据数据调整资料完成度
                            var finish_data = $(".m_l_t_bottom .finish_data").text();
                            $(".t_b_ziliao div").css("width",finish_data);
                            
                            //左侧banner展开收缩
                            $(".m_l_bottom .l_b_yiji").on("click",function(){
                                $(this).next("ul").slideToggle();
                                $(this).siblings("li").next("ul").slideUp();
                                $(this).siblings("li").each(function(){
                                    var li_span = $(this).find("span").text();
                                    if(li_span == "-"){
                                        $(this).find("span").text("+");
                                    }
                                });
                                var this_span = $(this).find("span").text();
                                this_span =="+"? $(this).find("span").text("-"):$(this).find("span").text("+");
                                $(this).addClass("l_b_1sel");
                                $(this).siblings("li").removeClass("l_b_1sel");
                                var li_index = $(this).attr("data_index");
                                var li_sel_class = "l_b_1sel_" + li_index;
                                $(this).addClass(li_sel_class);
                                $(this).siblings("li").each(function(){
                                    var sib_index = $(this).attr("data_index");
                                    var sib_sel_class = "l_b_1sel_" + sib_index;
                                    $(this).removeClass(sib_sel_class);
                                });
                            });
                            //左侧banner展开后子项目的点击
                            $(".m_l_bottom .l_b_erji li").on("click",function(){
                                $(this).addClass("l_b_2sel").siblings().removeClass("l_b_2sel");
                            });
                });
                   //注册 弹出层方法        
                   function populayer_fn(btn){
                        if(btn){
                            console.log(btn);
                            $(btn).click(function(){
                                $(".populayer").show();
                                $(".popumask").show();
                                
                            });
                            
                        }
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
                       
                }
          // 上传图片 弹出层方法
          function pl_commit_pic(str){
              $("#hiddenId").val(str);
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
          function pl_view_pic(){
        	  
        	  $(".pl_view_pic").show();
              $(".popumask").show();
          }
       // 上传图片 弹出层方法
      	function addPic(str , n){
      		$(".tupian").eq(n).find("input:text").val(str);
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
      	//图片删除
      	function picDel(n){
      		$(".tupian").eq(n).find("input:text").val('');
      	}
        </script>
    </body>
</html>


