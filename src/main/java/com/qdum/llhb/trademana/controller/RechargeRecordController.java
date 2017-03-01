package com.qdum.llhb.trademana.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.trademana.model.RechargeRecord;

import java.util.Date;
import java.util.List;

/**
 * 充值记录
 * Created by chao on 2016/1/15.
 */
@ControllerBind(controllerKey = "/trademana/rechargerecord")
public class RechargeRecordController extends Controller {

    /**
     * 充值记录
     */
    public void rechargeRecord() {
        Date startDate = getParaToDate("startDate");
        Date endDate = getParaToDate("endDate");
        String platform = getPara("platform");
        List<RechargeRecord> list = RechargeRecord.dao.queryRechargeRecordsByUserID(
                UserUtils.getUser().getId(), startDate, endDate, platform);
        setAttr("userRechargeRecords", list);
        setAttr("startDate", startDate);
        setAttr("endDate", endDate);
        setAttr("platform", platform);
        render("rechargerecord.jsp");
    }
}
