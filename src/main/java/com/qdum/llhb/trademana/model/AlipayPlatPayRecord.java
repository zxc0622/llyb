package com.qdum.llhb.trademana.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.fund.FundVariationTypeEnum;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.trademana.enumvalue.RepositStatusEnum;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 平台付款支付宝状态记录表
 * Created by chao on 2016/1/15.
 */
public class AlipayPlatPayRecord extends Model<AlipayPlatPayRecord> {

    public static AlipayPlatPayRecord dao = new AlipayPlatPayRecord();

    public Boolean afterAlipayPlatPay(Map<String, String> map) {
        createAlipayPlatPayRecord(map);
        String successDetails = map.get("success_details");
        RepositRecord repositRecord = RepositRecord.dao.queryRepositRecord(map.get("batch_no"));
        Long userID = repositRecord.getLong("user_id");
        if (StrKit.notBlank(successDetails)) {
            String[] infos = successDetails.split("^");
            float money = Float.valueOf(infos[3]);
            float charge = repositRecord.getFloat("charge");
            float resultMoney = money - charge;
            Fund fund = Fund.dao.changeFund(resultMoney, userID.toString(), FundVariationTypeEnum.reduce);
            RepositRecord.dao.updateRepositRecord(repositRecord, RepositStatusEnum.success, fund.getFloat("fund"));
        } else {
            Fund fund = Fund.dao.queryUserFund(userID);
            RepositRecord.dao.updateRepositRecord(repositRecord, RepositStatusEnum.fail, fund.getFloat("fund"));
        }
        return Boolean.TRUE;
    }

    /**
     * 创建平台支付记录
     *
     * @param map
     * @return
     */
    public AlipayPlatPayRecord createAlipayPlatPayRecord(Map<String, String> map) {
        AlipayPlatPayRecord alipayPlatPayRecord = new AlipayPlatPayRecord();
        Map<String, Object> resultMap = new HashMap<String, Object>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            resultMap.put(entry.getKey(), entry.getValue());
        }
        resultMap.put("create_by", UserUtils.getUser().getId());
        resultMap.put("create_date", new Date());
        resultMap.put("del_flag", false);
        alipayPlatPayRecord.setAttrs(resultMap);
        boolean isSuccess = alipayPlatPayRecord.save();
        if (isSuccess) {
            return alipayPlatPayRecord;
        } else {
            return null;
        }
    }
}
