(function($){
    $.fn.validationEngineLanguage = function(){
    };
    $.validationEngineLanguage = {
        newLang: function(){
            $.validationEngineLanguage.allRules = {
                "required": { // Add your regex rules here, you can take telephone as an example
                    "regex": "none",
                    "alertText": "* 此处不可空白",
                    "alertTextCheckboxMultiple": "* 请选择一个项目",
                    "alertTextCheckboxe": "* 您必须钩选此栏",
                    "alertTextDateRange": "* 日期范围不可空白"
                },
                "requiredInFunction": { 
                    "func": function(field, rules, i, options){
                        return (field.val() == "test") ? true : false;
                    },
                    "alertText": "* Field must equal test"
                },
                "dateRange": {
                    "regex": "none",
                    "alertText": "* 无效的 ",
                    "alertText2": " 日期范围"
                },
                "dateTimeRange": {
                    "regex": "none",
                    "alertText": "* 无效的 ",
                    "alertText2": " 时间范围"
                },
                "minSize": {
                    "regex": "none",
                    "alertText": "* 最少 ",
                    "alertText2": " 个字符"
                },
                "maxSize": {
                    "regex": "none",
                    "alertText": "* 最多 ",
                    "alertText2": " 个字符"
                },
				"groupRequired": {
                    "regex": "none",
                    "alertText": "* 你必需选填其中一个栏位"
                },
                "min": {
                    "regex": "none",
                    "alertText": "* 最小值为 "
                },
                "max": {
                    "regex": "none",
                    "alertText": "* 最大值为 "
                },
                "past": {
                    "regex": "none",
                    "alertText": "* 日期必需早于 "
                },
                "future": {
                    "regex": "none",
                    "alertText": "* 日期必需晚于 "
                },	
                "maxCheckbox": {
                    "regex": "none",
                    "alertText": "* 最多选取 ",
                    "alertText2": " 个项目"
                },
                "minCheckbox": {
                    "regex": "none",
                    "alertText": "* 请选择 ",
                    "alertText2": " 个项目"
                },
                "equals": {
                    "regex": "none",
                    "alertText": "* 两次输入的密码不一致"
                },
                "creditCard": {
                    "regex": "none",
                    "alertText": "* 请输入有效信用卡号码"
                },
                "identityCard": {
                    "regex": /(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
                    "alertText": "* 请输入有效的身份证号码"
				},
                "phone": {
                    // credit: jquery.h5validate.js / orefalo
                    "regex": /^([\+][0-9]{1,3}([ \.\-])?)?([\(][0-9]{1,6}[\)])?([0-9 \.\-]{1,32})(([A-Za-z \:]{1,11})?[0-9]{1,4}?)$/,
                    "alertText": "* 请输入有效的电话号码"
                },
                "email": {
                    // Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/email_address_validation/
                    "regex": /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,
                    "alertText": "* 请输入有效的邮件地址"
                },
                "integer": {
                    "regex": /^[\-\+]?\d+$/,
                    "alertText": "* 请输入有效的整数"
                },
                "number": {
                    // Number, including positive, negative, and floating decimal. credit: orefalo
                    "regex": /^[\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
                    "alertText": "* 请输入有效的数字"
                },

                "negative": {
                	 // Number, including positive, negative, and floating decimal. credit: orefalo
                     "regex": /^[\-\+]?((([0-9]{1,3})([,][0-9]{3})*)|([0-9]+))?([\.]([0-9]+))?$/,
                     "alertText": "* 请输入有效的数字"
                },
                "date": {
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$/,
                    "alertText": "* 请输入有效的日期，格式必需为 YYYY-MM-DD"
                },
                "ipv4": {
                    "regex": /^((([01]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))[.]){3}(([0-1]?[0-9]{1,2})|(2[0-4][0-9])|(25[0-5]))$/,
                    "alertText": "* 无效的 IP 地址"
                },
                "url": {
                    "regex": /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i,
                    "alertText": "* 无效的网址"
                },
                "onlyNumberSp": {
                    "regex": /^[0-9\ ]+$/,
                    "alertText": "* 只能填数字"
                },
                "onlyLetterSp": {
                    "regex": /^[a-zA-Z\ \']+$/,
                    "alertText": "* 只接受英文字母"
                },
                "onlyLetterNumber": {
                    "regex": /^[0-9a-zA-Z]+$/,
                    "alertText": "* 只接受英文字母、数字"
                },
                "NoonlyChinese": {
                    "regex": /^\w+/,
                    "alertText": "* 不能输入中文"
                },
                "ajaxLoginNameCall": {
                    "url": "checkLoginNameCal",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#userId'],
                    "alertText": "*此名称已被其他人使用",
                    "alertTextLoad": "*正在确认该登录名是否有其他人使用，请稍等。"
                },
                "ajaxUserMobileCall": {
                    "url": "checkMobile",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#userId'],
                    "alertText": "*此手机号已被其他人使用",
                    "alertTextLoad": "*正在确认该手机号是否有其他人使用，请稍等。"
                },
                
                "ajaxClassInfoCodeCall": {
                    "url": "checkClassInfoCode",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#classInfoId'],
                    "alertText": "*此班级编号已被其他人使用",
                    "alertTextLoad": "*正在确认该班级编号是否有其他人使用，请稍等。"
                },
                
                "ajaxClassInfoNameCall": {
                    "url": "checkClassInfoName",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#classInfoId'],
                    "alertText": "*此班级名称已被其他人使用",
                    "alertTextLoad": "*正在确认该班级名称是否有其他人使用，请稍等。"
                },
                
                "ajaxDormitoryCodeCall": {
                    "url": "checkDormitoryCode",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#dormitoryId','#organizationId'],
                    "alertText": "*此班宿舍号已被其他人使用",
                    "alertTextLoad": "*正在确认该宿舍编号是否有其他人使用，请稍等。"
                },
                
                
                "checkCurriculumWeekCountCall": {
                    "url": "checkCurriculumWeekCount",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#curriculumWeekId','#curriculumId'],
                    "alertText": "*此周次已被其他人使用",
                    "alertTextLoad": "*正在确认该周次是否有其他人使用，请稍等。"
                },
                
                "ajaxAbilityNumberCall": {
                    "url": "checkAbilityNumber",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#abilityIdy'],
                    "alertText": "*此知识点编号已存在",
                    "alertTextLoad": "*正在确认该识点编号是否有其他知识点使用，请稍等。"
                },
                
                "ajaxDepartmentCodeCall": {
                    "url": "checkDepartmentCode",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#depmentId','#organizationId'],
                    "alertText": "*部门已被其他人使用",
                    "alertTextLoad": "*正在确认该部门名称是否有其他人使用，请稍等。"
                },
                
                "ajaxOrganizationNameCall": {
                    "url": "checkOrganizationName",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#organizationId'],
                    "alertText": "*此机构名称已被占用",
                    "alertTextLoad": "*正在确认该机构名称是否有其他人使用，请稍等。"
                },
                
                "ajaxPassword": {
                    "url": "../checkPassword",
                    // you may want to pass extra data on the ajax call
                    "alertText": "*此密码非原始密码",
                    "alertTextLoad": "*正在确认该原始密码是否正确，请稍等。"
                },
                "ajaxStudentCard": {
	            	"url": "checkStudentCard",
                    // you may want to pass extra data on the ajax call
	            	"extraDataDynamic": ['#studentId'],
                    "alertText": "*此身份证号已被其他人使用",
                    "alertTextLoad": "*正在确认该身份证号是否有其他人使用，请稍等。"
                },
                "ajaxStudentNo": {
	            	"url": "checkStudentNo",
                    // you may want to pass extra data on the ajax call
	            	"extraDataDynamic": ['#studentId'],
                    "alertText": "*此学号已被其他人使用",
                    "alertTextLoad": "*正在确认该学号是否有其他人使用，请稍等。"
                },
                
                "ajaxEmail": {
	            	"url": "checkEmail",
                    // you may want to pass extra data on the ajax call
	            	"extraDataDynamic": ['#studentId'],
                    "alertText": "*此邮箱已被其他人使用",
                    "alertTextLoad": "*正在确认该邮箱是否有其他人使用，请稍等。"
                },
                "ajaxTopicOptionsContentCall": {
                    "url": "checkTopicOptionsContent",
                    // you may want to pass extra data on the ajax call
                    "extraDataDynamic": ['#topicoptionsId','#topicId'],
                    "alertText": "*此选项在该题目中已存在",
                    "alertTextLoad": "*正在确认该选项是否在此题目中存在，请稍等。"
                },
	            //tls warning:homegrown not fielded 
                "dateFormat":{
                    "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:0?[1-9]|1[0-2])(\/|-)(?:0?[1-9]|1\d|2[0-8]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(0?2(\/|-)29)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$/,
                    "alertText": "* 无效的日期格式"
                },
                //tls warning:homegrown not fielded 
				"dateTimeFormat": {
	                "regex": /^\d{4}[\/\-](0?[1-9]|1[012])[\/\-](0?[1-9]|[12][0-9]|3[01])\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1}$|^(?:(?:(?:0?[13578]|1[02])(\/|-)31)|(?:(?:0?[1,3-9]|1[0-2])(\/|-)(?:29|30)))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^((1[012]|0?[1-9]){1}\/(0?[1-9]|[12][0-9]|3[01]){1}\/\d{2,4}\s+(1[012]|0?[1-9]){1}:(0?[1-5]|[0-6][0-9]){1}:(0?[0-6]|[0-6][0-9]){1}\s+(am|pm|AM|PM){1})$/,
                    "alertText": "* 无效的日期或时间格式",
                    "alertText2": "可接受的格式： ",
                    "alertText3": "mm/dd/yyyy hh:mm:ss AM|PM 或 ", 
                    "alertText4": "yyyy-mm-dd hh:mm:ss AM|PM"
	            },
	            "fax": {
	                "regex": /^(([0\+]\d{2,3})?(0\d{2,3}))(\d{7,8})(-(\d{3,}))?$/,
                    "alertText": "* 请输入有效的传真号码"
	            },
	            "mailbox": {
	                "regex": /^[0-9]{6}$/,
                    "alertText": "* 请输入有效的邮编编码"
	            },
               
            };
            
        }
    };
    $.validationEngineLanguage.newLang();
})(jQuery);
