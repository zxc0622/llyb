package com.qdum.llhb.validateCode.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.qdum.llhb.common.utils.CookieUtils;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 验证码
 * Created by rongchao on 2015/12/4.
 */
public class ValidateCodeController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(ValidateCodeController.class);

    @ActionKey("validateCode")
    public void validateCode() {
        String inputCode = getPara("inputCode");
        if (StrKit.isBlank(inputCode)) {
            LOGGER.error("参数<inputCode>无效，请检查参数<inputCode>是否正确");
            renderError(500);
            return;
        }
        boolean isSuccess = false;
        String msg = "操作失败";
        try {
            String validateCode = CookieUtils.getCookie(getRequest(), "validateCode");
            LOGGER.debug("validateCode:".concat(validateCode));
            if (inputCode.equalsIgnoreCase(validateCode)) {
                isSuccess = true;
                msg = "操作成功";
            }
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败，原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        renderJson(aj);
    }

}
