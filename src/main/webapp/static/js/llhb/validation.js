/**
 * Created by Administrator on 2016/1/6.
 */
;(function($,window,document,undefined){
    /**
     * 函数名称：IsTelephone
     函数功能：固话，手机号码检查函数，合法返回true,反之,返回false
     函数参数：obj,待检查的号码
     检查规则：
     (1)电话号码由数字、"("、")"和"-"构成
     (2)电话号码为3到8位
     (3)如果电话号码中包含有区号，那么区号为三位或四位
     (4)区号用"("、")"或"-"和其他部分隔开
     (5)移动电话号码为11或12位，如果为12位,那么第一位为0
     (6)11位移动电话号码的第一位和第二位为"13"
     (7)12位移动电话号码的第二位和第三位为"13"
     * @param email
     * @returns {boolean}
     */
    $.validaEmail = function (email){
        var flag = false;
        var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        if(!re.test(email)){
            flag = false;

        }else{
            flag = true;
        }
        return flag;
    };
    $.validaTelephone = function (phone){
        var flag = false;
        var re = /(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}1[3,5,8][0-9]{9}$)/;
        if(!re.test(phone)){
            flag = false;
        }else{
            flag = true;
        }
        return flag;
    };
    $.validaNumer = function (number){
        var flag = false;
        var re = /\d+(\.\d+)*/ig;
        if(!re.test(number)){
            flag = false;
        }else{
            flag = true;
        }
        return flag;
    }

})(jQuery,window,document);