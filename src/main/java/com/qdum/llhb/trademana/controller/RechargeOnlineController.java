package com.qdum.llhb.trademana.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.trademana.Constant;
import com.qdum.llhb.trademana.model.AlipayError;
import com.qdum.llhb.trademana.model.RechargeRecord;
import com.qdum.llhb.trademana.validator.NumValidator;
import com.qdum.llhb.trademana.vo.AlipayErrorInfo;
import com.qdum.llhb.trademana.vo.RechargeInfo;

/**
 * 在线充值
 * Created by chao on 2016/1/15.
 */
@ControllerBind(controllerKey = "/trademana/rechargeonline")
public class RechargeOnlineController extends Controller {

    /**
     * 在线充值第一步
     */
    public void firstStepRecharge() {
        Fund fund = Fund.dao.queryUserFund(UserUtils.getUser().getId());
        if (fund == null) {
            setAttr("remindSum", 800.00);
        } else {
            setAttr("remindSum", fund.getBigDecimal("fund"));
        }
        render("rechargeonline.jsp");
    }

    /**
     * 在线充值第二步
     */
    @Before(NumValidator.class)
    public void secondStepRecharge() {
        Float rechargeAmount = Float.valueOf(getPara("rechargeAmount"));
        RechargeInfo rechargeInfo = RechargeRecord.dao.handleRecharge(rechargeAmount);
        setAttr("rechargeInfo", rechargeInfo);
        render("rechargeonline2.jsp");
    }

    /**
     * 支付宝支付失败，主动推送错误消息
     */
    public void errorNotify() {
        AlipayErrorInfo alipayErrorInfo = new AlipayErrorInfo();
        alipayErrorInfo.setPartner(getPara("partner"));
        alipayErrorInfo.setOutTradeNo(getPara("out_trade_no"));
        alipayErrorInfo.setErrorCode(getPara("error_code"));
        alipayErrorInfo.setReturnUrl(getPara("return_url"));
        alipayErrorInfo.setBuyerEmail(getPara("buyer_email"));
        alipayErrorInfo.setBuyerID(getPara("buyer_id"));
        alipayErrorInfo.setSellerEmail(getPara("seller_email"));
        alipayErrorInfo.setSellerID(getPara("seller_id"));
        AlipayError.dao.createAlipayErrorLog(alipayErrorInfo);
    }
}
