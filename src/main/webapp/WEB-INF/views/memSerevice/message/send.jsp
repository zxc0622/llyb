<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>站内信件</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/huiyuanfuwu.css"/>

        <style type="text/css">
            .main{width:778px;margin:0px auto;overflow: hidden;border:0px solid red;}

            .tab_main{width:763px;border:1px solid #cccccc;padding-bottom: 50px;margin-bottom: 200px;overflow: hidden;}
            .tab_main .tab_main_row{line-height: 30px;margin-top: 15px;border:0px solid red;}
            .tab_main .tab_main_row>label{width:100px;float:left;text-align: right;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 10px;vertical-align: middle;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;}
            .tab_main .tab_main_row .row_right input[type=text]{height:30px;border:1px solid #cccccc;text-indent:10px;width:330px;float:left;}
            .tab_main .tab_main_row .row_right textarea{border:1px solid #cccccc;text-indent:10px;width:480px;float:left;height: 200px;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{border:1px solid #cccccc;margin-right: 4px;opacity: 1;vertical-align: middle;}
            .tab_main .tab_main_row .row_right span{vertical-align: middle;}
            .tab_main .tab_main_row2{height: 30px;line-height: 30px;margin-top: 20px;border:1px solid red;}
            .tab_main .tab_main_row2>label{width:100px;float:left;text-align: left;margin-left:15px;border:1px solid yellow;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title .change{position: absolute;top:0;right:0;z-index: 5;background-color: #fff;padding:0 ;display: none;}
            .m_r_title .change a{margin-right: 10px;padding:0 5px;}
            .m_r_title .change a:hover{color:#ee7800;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            /*提示样式*/
            .tip_span{display:block;float:left;font-size:12px;line-height: 30px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(${ctxStatic}/img/llhb/wrong.png) 0 0 no-repeat;position: absolute;top:10px;left:-15px;}

            .session_name label{line-height: 25px;}
            .session_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #fff;width:100px;text-align: center;border:1px solid #ccc;}
            .session_confirm_btn{display:block;float:left;margin-left: 20px;color: white;background-color: #5EC520;width:100px;text-align: center;border:1px solid #5EC520;}
            .session_cancel_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #E5E5E5;width:100px;text-align: center;border:1px solid #E5E5E5;}

            /*附件样式*/
            .attachment_div{position:relative;border:1px solid #5EC520;width: 185px;height: 20px; line-height: 20px;margin-top: 5px;float:left;margin-right:5px;padding-left:5px;}
            .attachment_div>a:nth-child(1){width:130px;border:0px solid red;display: block;float:left;cursor: default;}
            .attachment_div>a:nth-child(2){float:right;color:#5EC520;margin-right: 10px;}
            .add_attachment_btn{height:12px;width:100%;line-height: 12px;background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;padding-left:10px;margin-top: 8px;}
            .add_attachment_btn>a{color:#5EC520;}

            /**文件名*/
            .clearfix:after{content:"";clear:width:0;height:0;}
            .showfullname{position:absolute;top:22px;left:0px; background:#fff;width:200px;z-index:2; color:#5cb531; border:1px solid #5cb531; padding:1px 3px;}
            select {
                border: 1px solid #c9caca;
                color: #666666;
                height: 34px;
                text-indent: 3px;
                width: 103px;
                margin-right: 5px;
            }
        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>发送信件</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span class="m_r_tname">发送信件</span>
                        <span onclick="jump(2)">收件箱</span>
                        <span onclick="jump(1)">已发送</span>
                        <span onclick="jump(0)">草稿箱</span>
                        <span onclick="jump(3)">回收站</span>
                        <span onclick="loca('clean');">信件清理</span>
                        <span onclick="loca('setup')">信件设置</span>
                    </div>

                    <form action="" enctype="multipart/form-data">
                        <div class="tab_main_row clearfix">
                            <label for=""><span>*</span>收件人</label>
                            <div class="row_right font1">
                            	<c:if test="${not empty uname }">
                            			<input type="text" value="${uname }">
                            	</c:if>
                            	<c:if test="${empty uname }">
	                                <input type="text" value="${mt.login_name }" placeholder="请输入有效的收件人地址">
                            	</c:if>
                                <c:if test="${admin=='admin' }">
                                    <label for="">群发</label>
                                    <select id="qunfa" name="qunfa" onchange="qunfa2();">
                                        <option value="">请选择</option>
                                        <option value="5">环保公司</option>
                                        <option value="3">生产型企业</option>
                                        <option value="1">个人会员</option>
                                    </select>
                                </c:if>

                                <br/>
                                <span class="tip_span tip_wrong">请输入有效的收件人地址</span>

                            </div>
                        </div>
                        <div class="tab_main_row clearfix">
                            <label for=""><span>*</span>标题</label>
                            <div class="row_right font1">
                                <input type="text" value="${mt.title }" placeholder="请输入标题内容">
                                <br/>
                                <span class="tip_span tip_wrong">请输入标题内容</span>
                            </div>
                        </div>
                        <div class="tab_main_row clearfix">
                            <label for=""><span></span>附件</label>
                            <div class="row_right font1" style="border:0px solid red;width:600px;">
                                <div class="add_attachment_btn font_1">
                                    <a href="javascript:void(0);">添加附件</a>
                                </div>
                                <input type="file" name= "attachment_file"  onchange="clickattr()" id="attachment_file"  multiple  style="display: none;"/>
                            </div>
                        </div>
                        <div class="tab_main_row clearfix" style="height:200px;">
                            <label for=""><span>*</span>内容</label>
                            <div class="row_right font1">
                               <textarea value="${mt.text }"></textarea>
                                <span class="tip_span tip_wrong">内容不要超过5400字</span>
                            </div>
                        </div>
                        <div class="tab_main_row clearfix">
                            <label for="">选项</label>
                            <div class="row_right font_1">
                                <input type="radio" name="opt" value="01"  />不发送，仅保存为草稿 &nbsp;&nbsp;</span>
                                <input type="radio" name="opt" value="02" />发送，保存到已发送&nbsp;&nbsp;
                                <input type="checkbox" name="read" value="03"/>已读回执&nbsp;&nbsp;
                            </div>
                        </div>
                        <div class="tab_main_row clearfix" style="height: 0px;"></div>
                        <div class="tab_main_row clearfix">
                            <label for="">&nbsp;</label>
                            <div class="row_right">
                                <a href="javascript:void(0);" class="session_confirm_btn"style="margin-left:0;">确认</a>
                                <a href="javascript:void(0);" class="session_cancel_btn">重置</a>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
            <!-- 右侧结束 -->
        </div>


        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
        <script type="text/javascript">
            var atts = [];
            $(function(){

            	turn = 0;
                //单选按钮
                $(".row_right input[type=radio]").click(function(){
                    $(this).siblings().removeAttr("checked");
                });
                $(".add_attachment_btn > a:eq(0)").click(function(){
                    $("#attachment_file").trigger("click");
                });
                if('${mt}'){
                	$(".row_right:eq(3) textarea").val('${mt.text}');
	                $(".row_right input[name='opt']").eq(0).prop("checked",true);
                	if('${mt.receipt}' == 'true'){
                		$(".row_right input[name='read']").prop("checked",true);
                	}else{
		           		$(".row_right input[name='read']").prop("checked",false);
                	}
                }else{
                	$(".row_right input[name='opt']").eq(1).prop("checked",true);
                }
                if('${fs}'){
                    atts= [];
                    var fujian = eval('${fs}');
                    for(var i=0;i<fujian.length;i++){
                        inn++;
                        var fname = fujian[i].columnValues[0];
                        var furl = fujian[i].columnValues[1];
                        var divStr = '<div class="attachment_div"  data-inn='+inn+'>' +
                                '<a href="javascript:void(0);" class="tmui-ellipsis font_1">'+fname+'</a>'+
                                '<span class="showfullname" style="color:black;z-index: 10">'+furl+'</span>'+
                                '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+
                                '</div>';
                        $(".row_right:eq(2)").append(divStr);

                        atts.push(furl);
                    }
                    $(".showfullname").hide();

                    //鼠标滑过显示文件名
                    $(".attachment_div").mouseover(function(){
                        var i = $(this).attr("data-inn")-1;
                        $(".attachment_div").eq(i).find("span").show();
                    }).mouseout(function(){
                        var i = $(this).attr("data-inn")-1;
                        $(".attachment_div").eq(i).find("span").hide();
                    });

                }
            });

            function removeAttachment(att){
                $(att).parent().remove();
            }
            
            $(function(){
            	$(".row_right span").css("display","none");
            	$(".tab_main_row:eq(6) .row_right a:eq(0)").click(sure);
            	$(".tab_main_row:eq(6) .row_right a:eq(1)").click(resetdate);
            	//$(".row_right:eq(0) :text").on("blur",blurEmail($(this).val()));

            });
            function sure(){
                var name = $(".row_right:eq(1) :text").val();
                var qunfa = $("#qunfa").val();
            	var email = $(".row_right:eq(0) :text").val();
                if(email == ""){
                    $(".row_right:eq(0) span").css("display","block");
                    return;
                }else{
                    $(".row_right:eq(0) span").css("display","none");
                }
                if(name == ""){
                    $(".row_right:eq(1) span").css("display","block");
                    return;
                }else{
                    $(".row_right:eq(1) span").css("display","none");
                }

                $(".row_right:eq(0) span").css("display","none");
                var name = $(".row_right:eq(1) :text").val();
                var content = $(".row_right:eq(3) textarea").val();
                var at = $(".attachment_div");
                var attachment = [];
                //alert(atts);
                //var attachment = $(".attachment_div a:eq(0)").html();
                var status = $(".row_right input[name='opt']:checked").val();
                var read = $(".row_right input[name='read']:checked").val();
                for(var i=0;i<at.length;i++){
                    attachment.push($(".attachment_div").eq(i).find("a:eq(0)").html());
                }
                if(name == "" ){
                    $(".row_right:eq(1) span").css("display","block");
                    return;
                }else{
                    $(".row_right:eq(1) span").css("display","none");
                }
                if(content == ""){
                    parent.showMess("请先填写内容");
                    return;
                }
                if(content.length>5400){
                    $(".row_right:eq(3) span").css("display","block");
                    return;
                }else{
                    $(".row_right:eq(3) span").css("display","none");
                }

                if((email == "生产型企业" || email == "环保公司" || email== "个人会员") && (qunfa == 1 || qunfa == 3 || qunfa == 5  )){
                    $.ajax({
                        type : "POST",
                        url : "${ctx}/memSerevice/message/saveQunFaInfo",
                        data : "serviceId=${serviceId}&source=${source}&name=" + name+"&email=" + email+"&content=" + content+"&status=" + status+"&read=" + read+"&attachment=" + attachment+"&atts=" + atts+"&id=${mmid}" +"&qunfa="+qunfa,
                        dataType : 'text',
                        success : function(data) {
                            if(data=='already'){
                                $(".row_right:eq(0) span").css("display","block");
                                return false;
                            }else{
                                $(".row_right:eq(0) span").css("display","none");
                                parent.showMess("保存成功！<br />三秒后自动跳转...");
                                setTimeout(function(){
                                    $(".popumask", window.parent.document).hide();
                                    $(".pl_normal", window.parent.document).hide();
                                    jump(1);
                                },3000);
                            }
                        }
                    });
                }else{
                    $.ajax({
                        type : "POST",
                        url : "${ctx}/memSerevice/message/saveInfo",
                        data : "serviceId=${serviceId}&source=${source}&name=" + name+"&email=" + email+"&content=" + content+"&status=" + status+"&read=" + read+"&attachment=" + attachment+"&atts=" + atts+"&id=${mmid}",
                        dataType : 'text',
                        success : function(data) {
                            if(data=='already'){
                                $(".row_right:eq(0) span").css("display","block");
                                return false;
                            }else{
                                $(".row_right:eq(0) span").css("display","none");
                                parent.showMess("保存成功！<br />三秒后自动跳转...");
                                setTimeout(function(){
                                    $(".popumask", window.parent.document).hide();
                                    $(".pl_normal", window.parent.document).hide();
                                    jump(1);
                                },3000);
                            }
                        }
                    });
                }

            }

           //跳转
           function jump(str){
        	   location.href="${ctx}/memSerevice/message/mailbox?index="+str;
           }
           function loca(str){
        	   location.href="${ctx}/memSerevice/message/"+str;
           }
           //上传方法
           function upattr(){
        	   $.ajaxFileUpload({
      				url : '${ctx}/memSerevice/message/fileUploadServer',
      				secureuri : false,
      				fileElementId : 'attachment_file',
                    async: false,
      				dataType : 'text',
      				success : function(data, status) {
      					if(status == 'success'){
      						attc = data.replace(/<[^>]+>/g,"");
                            if(attc == 'false'){
                                parent.showMess("上传附件的大小不能超过10M");

                            }else{
                                atts.push(attc);
                            }

      					}
      				}
      				
      			});
           }
           var  inn=0;
           //上传附件，加载附件名
           function clickattr(){
               inn++;
               var fileName = $("#attachment_file").val().substr($("#attachment_file").val().lastIndexOf("\\")+1);
               var files = document.getElementById("attachment_file").files[0].size;//判断文件大小
               if(files>1024*1024*10){
                   parent.showMess("上传附件的大小不能超过10M");
                   return;
               }else{
                   var divStr = '<div class="attachment_div"   data-inn='+inn+'>' +
                           '<a href="javascript:void(0);" class="tmui-ellipsis font_1">'+fileName+'</a>'+
                           '<span class="showfullname" style="color:black;z-index: 10">'+fileName+'</span>'+
                           '<a href="javascript:void(0);" class="font_1" onclick="removeAttachment(this)">删除</a>'+
                           '</div>';
                   $(".row_right:eq(2)").append(divStr);
                   $(".showfullname").hide();

                   //鼠标滑过显示文件名
                   $(".attachment_div").mouseover(function(){
                       var i = $(this).attr("data-inn")-1;
                       $(".attachment_div").eq(i).find("span").show();
                   }).mouseout(function(){
                       var i = $(this).attr("data-inn")-1;
                       $(".attachment_div").eq(i).find("span").hide();
                   });
               }

               upattr();
           }
           //重置
           function resetdate(){
        	    $(".row_right:eq(0) :text").val('');
           		$(".row_right:eq(1) :text").val('');
           		$(".attachment_div").remove();
           		$(".row_right:eq(3) textarea").val('');
           		$(".row_right input[name='opt']").eq(1).prop("checked",true);
           		$(".row_right input[name='read']").prop("checked",false);
           		
           }

            function qunfa2(){
                var text =  $("#qunfa option:selected").text();
                if(text == "请选择"){
                    $(".row_right:eq(0) :text").val("");
                }else{
                    $(".row_right:eq(0) :text").val(text);
                }
            }


        </script>
    </body>
</html>