package com.qdum.llhb.suggestion.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.qdum.llhb.common.utils.CookieUtils;
import com.qdum.llhb.suggestion.model.Suggestion;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 反馈意见
 * Created by rongchao on 2015/12/4.
 */
public class SuggestionController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(SuggestionController.class);

    private Boolean isSuccess = Boolean.FALSE;

    private String msg = "操作失败!";

    /**
     * 提交意见反馈
     */
    @ActionKey("suggest")
    public void submitSuggestion() {
        if (isPassedValidate(getPara("inputCode"))) {
            try {
                Suggestion st = getModel(Suggestion.class, "suggestion");
                isSuccess = Suggestion.dao.insertSuggestion(st);
                if (isSuccess) {
                    msg = "操作成功！";
                }
            } catch (Exception e) {
                msg = "操作失败~原因:".concat(e.getMessage());
                LOGGER.error(msg);
            }
        } else {
            isSuccess = false;
            msg = "验证码输入不正确~!";
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        renderJson(aj);
    }

    private Boolean isPassedValidate(String inputCode) {
        if (StrKit.isBlank(inputCode)) {
            return false;
        }
        System.out.println(inputCode);
        String validateCode = CookieUtils.getCookie(getRequest(), "validateCode");
        if (inputCode.trim().equals(validateCode)) {
            return true;
        } else {
            return false;
        }
    }
}
