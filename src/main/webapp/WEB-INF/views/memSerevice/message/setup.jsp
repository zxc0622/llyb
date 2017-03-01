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
            .tab_main .tab_main_row{height: 30px;line-height: 30px;margin-top: 15px;border:0px solid red;overflow: hidden;}
            .tab_main .tab_main_row>label{width:100px;float:left;text-align: right;}
            .tab_main .tab_main_row>label span{color:red;}
            .tab_main .tab_main_row .row_right{float:left;margin-left: 20px;}
            .tab_main .tab_main_row .row_right label{margin-left: 5px;margin-right: 5px;}
            .tab_main .tab_main_row .row_right input[type=radio]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}
            .tab_main .tab_main_row .row_right input[type=text]{border:1px solid #cccccc;text-indent:10px;width:100px;float:left;}
            .tab_main .tab_main_row .row_right img{display:block;float:left;width:20px;height:20px;margin-left: 5px;margin-right: 5px;margin-top:5px;}
            .tab_main .tab_main_row .row_right span{color: #666666;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{vertical-align:text-bottom; margin-bottom:2px; margin-bottom:-2px\9;}

            .tab_main .tab_main_row .row_right textarea{border:1px solid #cccccc;text-indent:10px;width:480px;float:left;height: 190px;}
            .tab_main .tab_main_row .row_right input[type=checkbox]{border:1px solid #cccccc;margin-right: 4px;opacity: 1;vertical-align: middle;}
            .tab_main .tab_main_row2{height: 30px;line-height: 30px;margin-top: 20px;border:1px solid red;}
            .tab_main .tab_main_row2>label{width:100px;float:left;text-align: left;margin-left:15px;border:1px solid yellow;}

            .m_r_title{width:100%;height:30px;line-height: 30px;border-bottom: 1px solid #cccccc;position: relative;}
            .m_r_title .m_r_tname{font-size: 16px;color:#5EC520;margin-left: 20px;border-bottom: 3px solid #5EC520;padding-bottom: 3px;cursor: pointer;}
            .m_r_title span{font-size: 16px;margin-left: 20px;padding-bottom: 3px;cursor: pointer;}
            .m_r_title .change{position: absolute;top:0;right:0;z-index: 5;background-color: #fff;padding:0 ;display: none;}
            .m_r_title .change a{margin-right: 10px;padding:0 5px;}
            .m_r_title .change a:hover{color:#ee7800;}
            .m_r_title a{float:right;margin-right: 20px;color:#666666;font-size: 12px;}

            .receive_table{width:763px;border:0px;margin-bottom: 10px;overflow: hidden;}
            .receive_head{width:90%;margin-left: 5%;margin-top:20px;border-bottom: 0px solid #E5E5E5;}
            .head_span_1{line-height: 25px;}
            .receive_td_1 input[type=checkbox]{vertical-align: middle;}
            .receive_td_1 label{vertical-align: middle;}
            .receive_td_2 span{vertical-align: middle;}
            .receive_td_3 span{vertical-align: middle;}
            .receive_content{width:90%;margin-left:5%;border:1px solid #E5E5E5;padding:0 0;}
            .receive_content .content_head{width:100%;margin-top:0px;border: 0px solid #E5E5E5;line-height: 45px;color: white;background-color: #5CB531;}
            .receive_content .content_head span{margin-left:4%;}
            .receive_content .content{width:92%;margin-top:10px;line-height: 25px;color: #333333;background-color: white;margin-left:4%;}
            .receive_content .content span{}
            .content_tip{width:92%;margin-top:10px;line-height: 20px;color: #333333;background-color: #FFFDEE;margin-left:4%;border:1px solid #F7AB00;padding:10px;margin-bottom: 20px;}
            .content_tip span{display:block;margin-left: 10px;}
            .receive_operation{width:90%;margin-left: 5%;margin-top:20px;height:30px;border: 0px;line-height: 30px;color: #8A8A8A;}

            /*提示样式*/
            .tip_span{display:block;float:left;font-size:12px;line-height: 30px;margin-left: 15px;position: relative;}
            .tip_warning::before{content:"";width:15px;height:15px;background:url(../images/gantanhao.png) 0 0 no-repeat;position: absolute;top:2px;left:-15px;}
            .tip_wrong{color:red;}
            .tip_wrong::before{content:"";width:15px;height:15px;background:url(../images/wrong.png) 0 0 no-repeat;position: absolute;top:10px;left:-15px;}

            .session_name label{line-height: 25px;}
            .session_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #fff;width:100px;text-align: center;border:1px solid #ccc;}
            .session_confirm_btn{display:block;float:left;margin-left: 20px;color: white;background-color: #5EC520;width:100px;text-align: center;border:1px solid #5EC520;}
            .session_cancel_btn{display:block;float:left;margin-left: 20px;color: #666666;background-color: #E5E5E5;width:100px;text-align: center;border:1px solid #E5E5E5;}


        </style>
        
    </head>
    <body>

        <div class="main">

            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>会员服务>站内信件</div>
                <div class="tab_main">
                    <div class="m_r_title">
                        <span onclick="parent.iframeGoToUrl('${ctx}/memSerevice/message/send')">发送信件</span>
                        <span onclick="jump(2)">收件箱</span>
                        <span onclick="jump(1)">已发送</span>
                        <span onclick="jump(0)">草稿箱</span>
                        <span onclick="jump(3)">回收站</span>
                        <span onclick="loca('clean');">信件清理</span>
                        <span class="m_r_tname">信件设置</span>
                    </div>

                    <form action="">
                        <div class="tab_main_row" style="height: 220px;">
                            <label for="">黑名单</label>
                            <div class="row_right">
                                <textarea id="black" style="display: block;"></textarea><br/>
                                <label style="display: block;float: left;margin-left: 0px;color:#666666;" class="font_1">
                                    <span style="color:#EF8324;margin-top: 0px;">[提示]</span>&nbsp;
                                    直接输入会员名即可将会员列入黑名单，多个会员名请用空格键隔开，禁止游客请填Guest
                                </label>
                            </div>
                        </div>
                       <!--  <div class="tab_main_row">
                            <label for="">未读信转发</label>
                            <div class="row_right">
                                <input type="radio" name="ra" value="1" id="r1"/> <label for="r1">开启</label>
                                <input type="radio" name="ra" value="0" id="r2"/> <label for="r2">关闭</label>
                            </div>
                        </div> -->
                        <div class="tab_main_row" style="height: 35px;">
                            <label for="">&nbsp;</label>
                            <div class="row_right" style="border:0px solid red;">
                                <a href="javascript:void(0)" class="session_confirm_btn" style="margin-left:0px;">确认</a>
                                <a href="javascript:void(0)" class="session_btn">清空</a>
                                <a href="javascript:void(0)" class="session_btn">重置</a>
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
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/bottom.js"></script>
        <script type="text/javascript">
            $(function(){
            	//加载已经保存过的
            	if('${bl}'){
            		resetdate();
            	}
                $(".tab_main_row:eq(1) a:eq(0)").click(tijiao);
                $(".tab_main_row:eq(1) a:eq(1)").click(emptydate);
                $(".tab_main_row:eq(1) a:eq(2)").click(resetdate);
            });
            //跳转
            function loca(str){
	        	   location.href="${ctx}/memSerevice/message/"+str;
	        }
            function jump(str){
	        	   location.href="${ctx}/memSerevice/message/mailbox?index="+str;
		    }
            //确定
            function tijiao(){
            	var names = $(".tab_main_row:eq(0) textarea").val();
            	//var radios =  $(".tab_main_row:eq(1) input[name='ra']:checked").val();
            	$.ajax({
        			type : "POST",
      				url : "${ctx}/memSerevice/message/saveSetup",
      				data : "names=" + names,
      				dataType : 'text',
      				success : function(data) { 
      					parent.showMess("保存成功！");
      					setTimeout(function(){
		            		$(".popumask", window.parent.document).hide();
		            		$(".pl_normal", window.parent.document).hide();
		            	},1500);
      				}
      			});
            }
            //清空
            function emptydate(){
            	$(".tab_main_row:eq(0) textarea").val('');
            	//$(".tab_main_row:eq(1) input[name='ra']").prop("checked",false);
            }
            //重置
            function resetdate(){
            	$("#black").val('${bl.black_list}');
            	/* var ff = '${bl.redirect}';
        		if(ff == 'true'){
        			$(".tab_main_row:eq(1) input[name='ra']:eq(0)").prop("checked",true);
        		}else{
        			$(".tab_main_row:eq(1) input[name='ra']:eq(1)").prop("checked",true);
        		} */
            }
        </script>
    </body>
</html>