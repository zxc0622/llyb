<%@ page language="java" contentType="text/html;charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href=""/>
    <title>资讯后台-招聘信息编辑</title>
    <meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台"/>
    <meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/common.css"/>
    <link type="text/css" rel="stylesheet" href="${ctxStatic}/css/llhb/zx_houtai.css"/>
    <style type="text/css">
        .row {
            overflow: hidden;
            margin-bottom: 15px;
        }

        .row > * {
            float: left;
            margin-right: 10px;
        }

        .for_zhanhui {
            display: none
        }

        .row > span:first-child {
            width: 80px;
            text-align: right;
            height: 30px;
            line-height: 30px;
        }

        .for_tip {
            height: 30px;
            line-height: 32px;
            color: #666;
            font-size: 12px;
        }

        textarea {
            margin-left: 25px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        input[type=text] {
            width: 400px;
        }

        .for_img {
            width: 150px;
            height: 150px;
            border: 1px solid #ccc;
            position: relative;
            line-height: 150px;
            text-align: center;
            color: #666;
        }

        .for_img img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .ml_90 {
            margin-left: 90px;
        }

        .tab_main {
            min-height: 800px;
            padding-bottom: 10px;
        }

        /*附件样式*/
        .row_right {
            margin-left: 90px;
        }

        .attachment_div {
            border: 1px solid #5EC520;
            width: 185px;
            height: 20px;
            line-height: 20px;
            margin-top: 5px;
            float: left;
            margin-right: 5px;
            padding-left: 5px;
        }

        .attachment_div > a:nth-child(1) {
            width: 130px;
            border: 0px solid red;
            display: block;
            float: left;
            cursor: default;
        }

        .attachment_div > a:nth-child(2) {
            float: right;
            color: #5EC520;
            margin-right: 10px;
        }

        .add_attachment_btn {
            height: 12px;
            width: 100%;
            line-height: 12px;
            background: url(${ctxStatic}/img/llhb/cmps.png) no-repeat 0 0;
            padding-left: 10px;
            margin-top: 8px;
        }

        .add_attachment_btn > a {
            color: #5EC520;
        }
    </style>


</head>
<body>
<!-- 右侧开始 -->
<div class="main_right">
    <div class="m_r_position font_1">当前位置>资讯维护>招聘信息编辑</div>
    <div class="tab_main">
        <form action="" method="post">
            <input type="hidden" name="id" value="${info.id}">

            <div class="row">
                <span><span style="color: red">*</span>职位名称</span>
                <input id="job_name" name="job_name" type="text" placeholder="如:Java开发工程师" value="${info.position}">
            </div>
            <div class="row">
                <span><span style="color: red">*</span>公司名称</span>
                <input id="company_name" name="company_name" type="text" placeholder="如：广州绿联有限公司 "
                       value="${info.company_name}">
            </div>
            <div class="row">
                <span><span style="color: red">*</span>所属部门</span>
                <input style="width:100px;" id="dept_name" name="dept_name" type="text" placeholder="如：技术部 "
                       value="${info.dept_name}">
                <span style="line-height: 30px;margin-left: 30px"><span style="color: red">*</span>招聘人数</span>
                <input style="width:100px;" id="person_number" name="person_number" type="text" placeholder=""
                       value="${info.person_number}">
                <span style="line-height: 30px;margin-left:0px">人(0表示若干)</span>

            </div>
            <div class="row">
                <span><span style="color: red">*</span>工作地点</span>
                <select class="b_l_f_province" name="prov_id" id="prov_id">
                    <option value="">省</option>
                    <c:forEach var="province" items="${provinceList }">
                        <c:choose>
                            <c:when test="${info.prov_id eq province.id}">
                                <option value="${province.id}" selected>${province.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${province.id}">${province.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                <select class="b_l_f_city" name="city_id" id="city_id">
                    <option value="">市</option>
                </select>
            </div>
            <div class="row">
                <span>学历要求</span>
                <select name="qualifications" id="qualifications">
                    <option value="不限">不限</option>
                    <option value="初中及以下">初中及以下</option>
                    <option value="高中">高中</option>
                    <option value="中专">中专</option>
                    <option value="专科">大专</option>
                    <option value="本科">本科</option>
                    <option value="硕士及以上">硕士及以上</option>
                </select>
                <span style="line-height: 30px;margin-left: 30px">工作年限</span>
                <select name="work_exp" id="work_exp">
                    <option value="不限">不限</option>
                    <option value="在读学生">在读学生</option>
                    <option value="1年">1年</option>
                    <option value="2年">2年</option>
                    <option value="3~4年">3~4年</option>
                    <option value="5~7年">5~7年</option>
                    <option value="8~9年">8~9年</option>
                    <option value="10年以上">10年以上</option>
                </select>
            </div>

            <div class="row">
                <span><span style="color: red">*</span>薪资范围</span>
                <input style="width: 100px" id="salary1" name="salary1" type="text" placeholder="最低月薪 " value="${info.salary1}">
                <span style="line-height: 30px;">~</span>
                <input style="width: 100px" id="salary2" name="salary2" type="text" placeholder="最高月薪 " value="${info.salary2}">
                <input type="checkbox" style="margin-top:10px;" name="salary3" id="salary3" value="面议" <c:if test="${info.salary3=='面议'}">checked="checked"</c:if>  > <span style="line-height: 30px;">面议</span>
            </div>
            <div class="row">
                <span><span style="color: red">*</span>简历邮箱</span>
                <input id="hr_email" name="hr_email" type="text" placeholder="如：hr@yyhb365.com "
                       value="${info.hr_email}">
            </div>
            <div class="row">
                <span><span style="color: red">*</span>公司链接</span>
                <input id="company_href" name="company_href" type="text" placeholder="如：http://www.yyhb365.com "
                       value="${info.company_href}">
            </div>


            <div class="row">
                <span><span style="color: red">*</span>职位描述</span>
                <textarea style="margin-left: 0px;display: none;" name="content" id="content" cols="85"
                          rows="30"></textarea>
                <script id="editor" type="text/plain" style="margin-left:80px;width:630px;height:400px;"></script>

            </div>


            <div class="row">
                <%-- <input id="sta" type="hidden" name="sta" value=""/>--%>
                <a href="javascript:preview()" class="normal_btn ml_90">预览</a>
                <a href="javascript:issude()" class="btn">发布</a>
            </div>
        </form>
    </div>
</div>
<!-- 右侧结束 -->


<!-- js -->
<script type="text/javascript" src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/ajaxfileupload.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>

<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor', {
        toolbars: [[
            'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', '|', 'forecolor', 'backcolor', 'cleardoc', '|',

            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|', 'link', 'unlink', '|',

            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase',
            /*, '|','simpleupload','insertvideo'*/
        ]],
        //imageUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str=",
        //videoUrlPrefix:"${basePath}hyzl/findImgResourcesURL?str="
    });
    ue.ready(function () {
        // editor准备好之后才可以使用
        ue.setContent('${info.hr_desc}');
    });

    var jobNameRight = false;
    var companyNameRight = false;
    var locationRight = false;
    var deptNameRight = false;
    var personNumberRight = false;
    var companyUrlRight = false;
    var salaryRight = false;
    var hrDescRight = false;
    var hrEmailRight = false;

    function allRight() {
        var jobName = $("form input[id='job_name']").val();
        if (jobName == null || jobName == undefined || jobName == '') {
            jobNameRight = false;
            parent.showMess("职位名称不能为空!");
        } else {
            jobNameRight = true;
        }

        var companyName = $("form input[id='company_name']").val();
        if (companyName == null || companyName == undefined || companyName == '') {
            companyNameRight = false;
            parent.showMess("公司名称不能为空!");
        } else {
            companyNameRight = true;
        }

        var prov = $(".b_l_f_province option:selected").val();
        var city = $(".b_l_f_city option:selected").val();
        var provStr = $(".b_l_f_province option:selected").text();
        var cityStr = $(".b_l_f_city option:selected").text();

        if (city == null || city == undefined || city == '') {
            locationRight = false;
            parent.showMess("工作城市不能为空!");
        } else {
            locationRight = true;
        }

        var deptName = $("#dept_name").val();
        if (deptName == null || deptName == undefined || deptName == '') {
            deptNameRight = false;
            parent.showMess("所属部门不能为空!");
        } else {
            deptNameRight = true;
        }
        var personNumber = $("#person_number").val();
        if (personNumber == null || personNumber == undefined || personNumber == '') {
            personNumberRight = false;
            parent.showMess("招聘人数不能为空!");
        } else if(isNaN(personNumber)){
            personNumberRight = false;
            parent.showMess("招聘人数只能为数字");
        }else{
            personNumberRight = true;
        }
        var company_href = $("#company_href").val();
        if (company_href == null || company_href == undefined || company_href == '') {
            companyUrlRight = false;
            parent.showMess("公司链接不能为空!");
        } else {
            companyUrlRight = true;
        }
        var salary1 = $("form input[id='salary1']").val();
        var salary2 = $("form input[id='salary2']").val();
        var salary3 = $("input[id='salary3']:checked").val();
        if(salary3 == "面议"){
            salaryRight = true;
        }else if ((salary1 == null || salary1 == undefined || salary1 == '') && (salary2 == null || salary2 == undefined || salary2 == '')) {
            salaryRight = false;
            parent.showMess("薪资范围不能为空!");
        } else {
            salaryRight = true;
        }


        var hrEmail = $("form input[id='hr_email']").val();
        if (hrEmail == null || hrEmail == undefined || hrEmail == '') {
            hrEmailRight = false;
            parent.showMess("简历邮箱不能为空!");
        } else {
            hrEmailRight = true;
        }
        var hrDesc = $("#content").val();
        if (hrDesc == null || hrDesc == undefined || hrDesc == '') {
            hrDescRight = false;
            parent.showMess("职位描述不能为空!");
        } else {
            hrDescRight = true;
        }

    }

    //预览
    function preview() {
        $("#content").val(UE.getEditor('editor').getContent());
        $("form").attr("action", "${ctx}/infomaintain/recuitment/preview");
        allRight();
        if (jobNameRight && companyNameRight && locationRight && deptNameRight &&personNumberRight && companyUrlRight && salaryRight && hrDescRight && hrEmailRight) {
            $("form").submit();
        }
    }

    //发布
    function issude() {
        parent.stopShowEidtor();//停止触发是否放弃编辑弹出框
        $("#content").val(UE.getEditor('editor').getContent());
        // $("#sta").val("1");
        $("form").attr("action", "${ctx}/infomaintain/recuitment/submit");
        allRight();
       // alert(jobNameRight+"----"+companyNameRight+"----"+locationRight+"----"+deptNameRight+"----"+personNumberRight+"----"+companyUrlRight+"----"+salaryRight+"----"+hrDescRight+"----"+hrEmailRight);
        if (jobNameRight && companyNameRight && locationRight && deptNameRight &&personNumberRight && companyUrlRight && salaryRight && hrDescRight && hrEmailRight) {
            $("form").submit();
        }
    }
    function selectCity(){
        var province = $(".b_l_f_province option:selected").val();
        $(".b_l_f_city").text('');
        if(!province){
            var htmlss="<option value='0'>市</option>";
            $(".b_l_f_city").append(htmlss);

        }else{
            $.ajax({
                type : "POST",
                url : "${ctx}/protection/getCity",
                data : "province=" + province,
                dataType : 'json',
                success : function(data) {
                    var htmls = "<option value='0'>市</option>";
                    $.each(data,function(index, item) {
                        htmls+="<option value='"+item.id+"'>"+item.name+"</option>";
                    });
                    $(".b_l_f_city").append(htmls);
                    $(".b_l_f_city option").each(function (){
                        if('${info.city_id}'==$(this).val()){
                            $(this).prop('selected','selected');

                        }
                    });
                }
            });
        }
    }
    //触发是否放弃编辑框
    $(function () {
        var abc = $(".b_l_f_province option:selected").val();
        if(abc){
            selectCity();
        }

        $("input").unbind().focus(function () {
            parent.showStopEidtor("是否确定离开页面，放弃编辑？");
        });
        UE.getEditor('editor').on("focus", function () {
            parent.showStopEidtor("是否确定离开页面，放弃编辑？");
        });
        /* $(document).on('keydown',function(){
         if(UE.getEditor('editor').getContent().length>0){
         parent.showStopEidtor("是否确定离开页面，放弃编辑？");
         }
         }) */
        $("#qualifications option[value='${info.qualifications}']").attr('selected', true);
        $("#salary_unit option[value='${info.salary_unit}']").attr('selected', true);
        $("#work_exp option[value='${info.work_exp}']").attr('selected', true);
    });

    $(document).ready(function () {
        $(".b_l_f_province").change(selectCity);
    });

</script>
</body>
</html>