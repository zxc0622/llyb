<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="shortcut icon" href=""/> 
        <title>站内交流</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/chat.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>
   		<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/chat/chat.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
        <style type="text/css">
            .main{margin:0px auto;overflow: hidden;border:0px solid red;}

            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 1px;margin-bottom: 20px;overflow: hidden;}
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row>label{width:100px;float:left;text-align: right;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 10px;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;}
            .tab_main .tab_main_row .row_right input[type=text]{border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}

            .tab_main .tab_main_row2{height: 30px;line-height: 30px;margin-top: 20px;border:1px solid red;}
            .tab_main .tab_main_row2>label{width:100px;float:left;text-align: left;margin-left:15px;border:1px solid yellow;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title .change{position: absolute;top:0;right:0;z-index: 5;background-color: #fff;padding:0 ;display: none;}
            .m_r_title .change a{margin-right: 10px;padding:0 5px;}
            .m_r_title .change a:hover{color:#ee7800;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            .tab_main2{width:763px;border:1px solid #cccccc;padding-bottom: 1px;margin-bottom: 200px;overflow: hidden;border-bottom: 0px;}
            .detail_info{width:100%;border-bottom:1px solid #CCCCCC;overflow: hidden;height: 65px;}
            .detail_info_2{width:100%;border-bottom:1px solid #CCCCCC;overflow: hidden;height: 30px;}
            .detail_info_left{float:left;width:105px;border-right:1px solid #cccccc;height:100%;text-align: center;}
            .detail_info_left_img{width:65px;height: 60px;border-radius: 30px;margin-top:3px;}
            .detail_info_2_left_span{width:65px;line-height: 30px;}
            .detail_info_right{float:left;width:640px;border:0px;height:100%;}
            .detail_info_right_p{margin-top: 10px;margin-left: 10px;color: #666666;}
            .detail_info_right_2_p{margin-top: 5px;margin-left: 10px;color: #666666;}
            .detail_info_right_name{line-height: 20px;margin-top:12px;}
            .detail_info_right_name_2{line-height: 20px;}
            .detail_info_right_sta{line-height: 20px;margin-left: 5px;margin-top:12px;}
            .detail_info_right_mes{line-height: 20px;color:red;margin-left: 5px;margin-top:12px;}
            .detail_info_right_mes:hover{cursor: pointer}
            .detail_info_right_phone{border:0px solid red;margin-top:-4px;margin-left:5px; }
        	.wrap-text img{max-width: 200px;max-height:200px;}
        </style>
        
    </head>
    <body>
        <div class="main">
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>站内交流</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span class="m_r_tname" onclick="goUrl('05_会员服务/01_站内交流.html')">我的对话</span>
                        <span  >黑名单</span></div>
                    <div class="chat01_content">
                        <div class="message_box mes1">
                        </div>
                        <div class="message_box mes2">
                        </div>
                        <div class="message_box mes3" style="display: block;">
                            <c:forEach items="${chatRecords}" var="record">
                                <div class='message clearfix'>
                                    <div class='user-logo'>
                                        <img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>
                                    </div>
                                    <div class='wrap-text'>
                                        <h5 class='clearfix'>
                                            <c:choose>
                                                <c:when test="${record.send_id == mem.id}">
                                                    ${mem.loginName}
                                                </c:when>
                                                <c:otherwise>
                                                    我
                                                </c:otherwise>
                                            </c:choose>

                                            <span>${fn:substring(record.create_date, 0, 19)  }</span></h5>
                                        <c:choose>
                                            <c:when test="${record.type == '1' }">
                                                <div>${record.text }</div>
                                            </c:when>
                                            <c:when test="${record.type == '2' }">
                                                <div><img src='${record.url }'  onclick="picSea(this.src)"/></div>
                                            </c:when>
                                            <c:when test="${record.type == '3' }">
                                                <div>${record.name }<a onclick="downAtta('${record.url }');" style='margin-left:20px;'>[点击下载]</a></div>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <div style='clear:both;'></div>
                                </div>
                            </c:forEach>

                        	<c:choose >
                        		<c:when test="${fn:length(record) == 0 }"></c:when>
                        		<c:otherwise>
                        			<c:forEach items="${record}" var="record" >
                   						<div class='message clearfix'>
             								<div class='user-logo'>
                  								<img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>
             		 						</div>
              								<div class='wrap-text'>
                  								<h5 class='clearfix'>${mem.loginName }<span>${fn:substring(record.create_date, 0, 19)  }</span></h5>
		                        				<c:choose>
		                        					<c:when test="${record.type == '1' }">
		                        						<div>${record.text }</div>
		                       						</c:when>
		                       						<c:when test="${record.type == '2' }">
		                        						<div><img src='${record.url }'  onclick="picSea(this.src)"/></div>
		                       						</c:when>
		                       						<c:when test="${record.type == '3' }">
		                        						<div>${record.name }<a onclick="downAtta('${record.url }');" style='margin-left:20px;'>[点击下载]</a></div>
		                       						</c:when>
		                        				</c:choose>
	                   						</div>
	                    					<div style='clear:both;'></div>
             							</div>
                        			</c:forEach>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="message_box mes4">
                        </div>
                        <div class="message_box mes5">
                        </div>
                        <div class="message_box mes6">
                        </div>
                        <div class="message_box mes7">
                        </div>
                        <div class="message_box mes8">
                        </div>
                        <div class="message_box mes9">
                        </div>
                        <div class="message_box mes10">
                        </div>
                    </div>
                    <div class="chat02">
                        <div class="chat02_title">
                            <a class="chat02_title_btn ctb01" href="javascript:;"></a>
                            <a class="chat02_title_btn ctb02" href="javascript:parent.comPic(0);" title="选择图片"></a>
                            <a class="chat02_title_btn ctb03" href="javascript:t();" title="选择附件"></a>
                            <a id="upload" ><input type="file" id="files"  name="files"  onchange="changeAtta(this);"  style="display: none;"/></a>
                            
                            <input type="hidden" id="sta" value=""/>
                            <div class="wl_faces_box">
                                <div class="wl_faces_content">
                                    <div class="title">
                                        <ul>
                                            <li class="title_name">常用表情</li>
                                            <li class="wl_faces_close"><span>&nbsp;</span></li>
                                        </ul>
                                    </div>
                                    <div class="wl_faces_main">
                                        <ul>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_01.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_02.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_03.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_04.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_05.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_06.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_07.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_08.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_09.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_10.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_11.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_12.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_13.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_14.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_15.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_16.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_17.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_18.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_19.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_20.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_21.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_22.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_23.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_24.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_25.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_26.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_27.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_28.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_29.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_30.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_31.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_32.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_33.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_34.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_35.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_36.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_37.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_38.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_39.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_40.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_41.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_42.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_43.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_44.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_45.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_46.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_47.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_48.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_49.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_50.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_51.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_52.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_53.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_54.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_55.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_56.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_57.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_58.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_59.gif"/></a></li>
                                            <li><a href="javascript:;">
                                                <img src="${ctxStatic }/img/llhb/chat/emo_60.gif"/></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="wlf_icon">
                                </div>
                            </div>
                        </div>
                        <div class="chat02_content">
                            <textarea id="textarea"></textarea>
                        </div>
                        <div class="chat02_bar">
                            <ul>
                                <li style="left: 20px; top: 10px; padding-left: 30px;"></li>
                                <li style="right: 5px; top: 5px;">
                                    <a href="javascript:;">
                                        <img src="${ctxStatic }/img/llhb/chat/send_btn.jpg"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div style="clear: both;">
                    </div>
                </div>
                <div class="tab_main2">
                	<c:set var="mem" value="${mem }"/>
                	<input type="hidden" value="${mem.id }" id="recId" />
                    <div class="m_r_title"><span class="m_r_tname">对方信息</span></div>
                    <div class="detail_info">
                        <div class="detail_info_left">
                            <img src="${ctxStatic}/img/llhb/show.png" alt="" class="detail_info_left_img"/>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_p font_1">
                                <span class="detail_info_right_name">${mem.loginName }</span>
                                <c:choose>
					             	<c:when test="${status == 1 }"><span class="detail_info_right_sta" style="color:red;">在线</span></c:when>
					             	<c:when test="${status == 0 }"><span class="detail_info_right_sta">离线</span></c:when>
				             	</c:choose>
                                <br/>
                                <span class="detail_info_right_name">${mem.cname }</span>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">认证情况</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                            	<c:choose>
					             	<c:when test="${mem.authFlag == '0' }">
					             		<span class="detail_info_right_name_2">未通过手机认证</span>
                                		<img src="${ctxStatic}/img/llhb/phone_number_03.png" alt="" class="detail_info_right_phone"/>
					             	</c:when>
					             	<c:when test="${mem.authFlag == '1' }">
					             		<span class="detail_info_right_name_2">通过手机认证</span>
                                		<img src="${ctxStatic}/img/llhb/phone_number_03.png" alt="" class="detail_info_right_phone"/>
					             	</c:when>
				             	</c:choose>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">公司地址</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                                <span class="detail_info_right_name_2">${mem.address }</span>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">公司电话</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                                <span class="detail_info_right_name_2">${mem.tel }</span>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">联&nbsp;&nbsp;系&nbsp;人</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                                <span class="detail_info_right_name_2">${mem.realName }
                                <c:choose>
					             	<c:when test="${mem.sex == 'F' }">（女士）</c:when>
					             	<c:when test="${mem.sex == 'M' }">（先生）</c:when>
					             	<c:otherwise></c:otherwise>
				             	</c:choose>
				             	</span>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">手机号码</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                                <span class="detail_info_right_name_2">${mem.phone }</span> &nbsp;&nbsp;
                                <c:choose>
					             	<c:when test="${mem.authFlag == '0' }"></c:when>
					             	<c:when test="${mem.authFlag == '1' }">
					             		<span class="detail_info_right_mes">发送短信？</span><br/>
					             	</c:when>
				             	</c:choose>
                            </p>
                        </div>
                    </div>
                    <div class="detail_info_2">
                        <div class="detail_info_left">
                            <span class="detail_info_2_left_span">即时通讯</span>
                        </div>
                        <div class="detail_info_right">
                            <p class="detail_info_right_2_p font_1">
                                <span class="detail_info_right_name_2" style="color:#EE7800;">屏蔽Ta</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/dateUtil.js"></script>
        <script type="text/javascript">
        	var loginName = '${loginName}';
        	var toLoginName='${mem.loginName }';
            $(document).ready(function () {
            	setInterval(function(){
            		getNewMess();
            	},3000);
                
              	//点击发送
                $(".chat02_bar img").on("click",send);
                $("#textarea").bind("keypress",function(e){
                	if (e.keyCode == "13") {
                       send();
                    }
           	 	});
            });
            //显示上传文件
            function t(){
            	$("#sta").val("3");
             	$("#files").trigger("click");
            }
          //附件
          function changeAtta(obj){
            	var fileName = $(obj).val().substr($(obj).val().lastIndexOf("\\")+1);
            	var url="";
            	$.ajaxFileUpload({
       				url : '${ctx}/fileUploadServer',
       				secureuri : false,
       				fileElementId : 'files',
       				dataType : 'text',
       				success : function(data, status) {
       					if(status == 'success'){
          	                 url=data.replace(/<[^>]+>/g,"");
          	              	var divStr ="<div class='message clearfix'><div class='user-logo'>" +
                    		"<img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>" +
                  	  		"</div><div class='wrap-text'><h5 class='clearfix'>我<span>"+getNow()+
                        	"</span></h5><div>" + fileName +"<a target='_blank' href='"+url+"' style='margin-left:20px;'>[点击下载]</a></div>"+
      						"</div><div style='clear:both;'></div></div>";
          					sub('','3',fileName,url,divStr);
       					}
       				},
       				error : function(data, status, e) {
       					alert(e);
       				}
       			});
            }
          	//图片
           	function addPic(str , n){
           		$("#sta").val("2");
           		var divStr ="<div class='message clearfix'><div class='user-logo'>" +
          		"<img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>" +
        	  	"</div><div class='wrap-text'><h5 class='clearfix'>我<span>"+getNow()+
                "</span></h5><div><img onclick='picSea(this.src)' src='" + str + "'/></div>"+
				"</div><div style='clear:both;'></div></div>";
           		sub('','2','',str,divStr);
			}
          	//格式化当前时间
			function getNow(){
				 var e = new Date;
				 var f = e.format("yyyy-MM-dd hh:mm:ss");
                //var  f = e.getFullYear() + "-"+ (e.getMonth() + 1) + "-"+ e.getDate() + "  "+ e.getHours() + ":"+ e.getMinutes() + ":"+ e.getSeconds();
				return f;
			}
          	//发送
			function send() {
				$("#sta").val("1");
            	var g = $("#textarea").val();
            	if(g=="" || g.replace(/[ ]/g,"").replace(/[\r\n]/g,"") ==""){
            		parent.showMess("对话内容不能为空！");
            		/*setTimeout(function(){
            			parent.hideMess();
            		},1000);*/
            		$("#textarea").val("");
            		return false;
            	}
            	while(g.indexOf("*#emo_") != -1){
            		g = g.replace("*#", "<img src='${ctxStatic}/img/llhb/chat/").replace("#*", ".gif'/>");
            	}
            	var i = "<div class='message clearfix'>"+
                "<div class='user-logo'>"+
                "<img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>"+
                "</div>"+
                "<div class='wrap-text'>" +
                "<h5 class='clearfix'>我<span>"+getNow()+"</span></h5>" +
                "<div>" + g + "</div>" +
                "</div>" +
                "<div style='clear:both;'></div>" +
            	"</div>";
            	sub(g,'1','','',i);
          	}
          	//插入数据
	        function sub(content,type,name,url,str){
	        	var recId=$("#recId").val();
	        	$.ajax({
	    			type:"POST",
	    			url:"${ctx}/memSerevice/communication/saveChat",
	    			data:"content="+encodeURIComponent(content)+"&type="+type+"&recId="+recId+"&name="+encodeURIComponent(name)+"&url="+encodeURIComponent(url),
	    			dataType:'json',
	    			success:function(data){
	    				if(data == true){
	    					if(type=='1'){
	    						$(".mes3").append(str),$(".chat01_content").scrollTop($(".mes3").height()),$("#textarea").val("");
	    						return false;
	    					}else if(type=='2'){
	    						$(".mes3").append(str),$(".chat01_content").scrollTop($(".mes3").height());
	    						return false;
	    					}else if(type=='3'){
	    						$(".mes3").append(str),$(".chat01_content").scrollTop($(".mes3").height());
	    						return false;
	    					}
	    				}else{
	    					parent.showMess("发送失败，请重新发送！");
	    				}
	    			}
	        	});
	        }
	    	//图片预览
	    	function picSea(src){
	    		parent.picView(src);
	    	}

	    	function getNewMess(recId){
	    		var recId =$("#recId").val();
	    		$.ajax({
	    			type:"POST",
	    			url:"${ctx}/memSerevice/communication/getNewMess",
	    			data:"recId="+recId,
	    			dataType:'json',
	    			success:function(data){
	    				$.each(data,function(index,item){
	    					var str = "<div class='message clearfix'><div class='user-logo'><img src='${ctxStatic}/img/llhb/show.png' style='border-radius:30px;margin-left:5px;'/>"+
	 						"</div><div class='wrap-text'><h5 class='clearfix'>"+toLoginName+"<span>"+item.create_date.substring(0, 19)+"</span></h5><div>";
            				if(item.type == '1'){
            					str+=item.text;
            				}else if(item.type == '2'){
            					str+="<img src='"+item.url+"'  onclick='picSea(this.src)'/>";
            				}else if(item.type == '3'){
            					str+=item.name+"<a href='"+item.url+"' download='"+item.name+"' style='margin-left:20px;'>[点击下载]</a>";
        					}
            				str +="</div></div><div style='clear:both;'></div></div>";
            				$(".mes3").append(str);
            				$(".chat01_content").scrollTop($(".mes3").height());
	    				});
	    				//修改title
	    			}
	        	});
	    	}
	    	function downAtta(str){
	    		window.open(str);
	    	}
        </script>
    </body>
</html>