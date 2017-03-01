<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="shortcut icon" href=""/> 
        <title>资讯后台-招聘信息预览</title>
        <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
        <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
        <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
        <link rel="stylesheet" type="text/css" href="${ctxStatic}/js/ueditor/third-party/video-js/video-js.min.css"/>

        <style type="text/css">
            .row{overflow: hidden;margin-bottom: 15px;}
            .row > *{float:left;margin-right: 10px;}
            .for_zhanhui{display: none}
            .row > span:first-child{width:80px;text-align: right;height:30px;line-height: 30px;}
            
            .ml_90{margin-left: 90px;}
            .t_center{text-align: center;margin-bottom: 10px;}
            /*招聘信息预览*/
            .xinwen_detail_item{width: 743px;height: 30px;text-align: left;font-size: 22px;}
            /*新闻详情*/
            .xinwen_detail_table{text-align: center;width: 700px;}
            .xinwen_detail_table tr{height: 30px;}
            .xinwen_detail .sub-title{text-align: left;;width: 300px;font-size: 16px;font-weight: 400;margin-left: 20px;border-bottom: 1px dashed darkgray;
                white-space:nowrap;
                overflow:hidden;
                text-overflow:ellipsis;}
            .xinwen_detail .sub-title span{margin:0 10px;}
             #hr_desc{border-bottom: none;text-align: left;word-break: break-all;margin: 0px 20px;}
            .xinwen_detail p:not(.sub-title){text-indent: 20px;color:#333;}
            .xinwen_detail .btns{text-align: center;}
            .xinwen_detail .btns a{width:80px;height:30px;line-height: 30px;border:1px solid #ccc;color:#333;display: inline-block;margin:0 3px;}
            .xinwen_detail .btns a:hover{background-color: #5EC520;color:#fff;border:1px solid #5EC520;}
            /*新闻详情 结束*/

        </style>
        
    </head>
    <body>
    	<form action="${ctx}/infomaintain/recuitment/submit" method="post">
            <!-- 右侧开始 -->
            <div class="main_right">
                <div class="m_r_position font_1">当前位置>资讯维护>招聘信息预览</div>
                <div class="tab_main">
                    <div class="row">
                        <a href="#" onclick="history.go(-1);return false;" class="normal_btn">返回</a>
                    </div>
                    <div class="qy_m_r_d_main">
                        <div class="xinwen_detail">
                            <div class="xinwen_detail_item">
                                <span id="job_name">
                                    职位信息:
                                </span>

                            </div>

                            <table class="xinwen_detail_table">
                                <tr>
                                    <td class="sub-title">职位名称:<span>${job_name}</span></td>
                                    <td class="sub-title">公司名称:<span>${company_name}</span></td>
                                </tr>
                                <tr>
                                    <td class="sub-title">所属部门:<span>${dept_name}</span></td>
                                    <td class="sub-title">招聘人数:
                                        <span>
                                            <c:if test="${person_number != 0}">${person_number} 人</c:if>
                                            <c:if test="${person_number == 0}">若干</c:if>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="sub-title">工作地点:<span>${location}</span></td>
                                    <td class="sub-title">学历要求:<span>${qualifications}</span></td>
                                </tr>
                                <tr>
                                    <td class="sub-title">工作年限:<span>${work_exp}</span></td>
                                    <td class="sub-title">薪资范围:<span>${salary}${salary_unit}</span></td>
                                </tr>
                                <tr>
                                    <td class="sub-title">简历邮箱:<span>${hr_email}</span></td>
                                    <td class="sub-title">公司链接:<span>${company_href}</span></td>
                                </tr>
                                <tr>
                                    <td class="sub-title" colspan="2" style="border-bottom: none;font-size: 22px;height: 40px;">职位描述:</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="sub-title" id="hr_desc">${content}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div class="t_center">
                        <a href="javascript:issude()"class="btn"style="margin: 15px 0 0;">发布</a>
                    </div>

                </div>
            </div>
            <!-- 右侧结束 -->
            	<input type="hidden" name="id" value="${id}">
        		<input type="hidden" name="job_name" value="${job_name}">
        		<input type="hidden" name="company_name" value="${company_name}">
        		<input type="hidden" name="dept_name" value="${dept_name}">
                <input type="hidden" name="work_exp" value="${work_exp}">
                <input type="hidden" name="prov_id" value="${prov_id}">
                <input type="hidden" name="city" value="${city}">
        		<input type="hidden" name="qualifications" value="${qualifications}">
        		<input type="hidden" name="person_number" value="${person_number}">
        		<input type="hidden" name="salary" value="${salary}">
        		<input type="hidden" name="salary_unit" value="${salary_unit}">
        		<input type="hidden" name="hr_email" value="${hr_email}">
        		<input type="hidden" name="company_href" value="${company_href}">
                <input type="hidden" name="salary1" value="${salary1}">
                <input type="hidden" name="salary2" value="${salary2}">
                <input type="hidden" name="salary3" value="${salary3}">
        		<textarea name="content" style="display:none">${content}</textarea>
        	</form>
        

        <!-- js -->
        <script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
        <script src="http://cdn.bootcss.com/html5media/1.1.8/html5media.min.js"></script>

        <script type="text/javascript">
	    	function issude(){
	    		parent.stopShowEidtor();//停止触发是否放弃编辑弹出框
	    		$("#sta").val("1");
	    		$("form").submit();
	    	}
	    	function goBack(){
	    		history.go(-1);
	    		return false;
	    	}
        </script>
    </body>
</html>