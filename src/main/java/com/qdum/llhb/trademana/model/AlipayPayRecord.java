package com.qdum.llhb.trademana.model;

import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.trademana.vo.AlipayPayecordInfo;

import java.util.Date;

/**
 * 用户支付宝状态记录表
 * Created by chao on 2016/1/15.
 */
public class AlipayPayRecord extends Model<AlipayPayRecord> {

    public static AlipayPayRecord dao = new AlipayPayRecord();

    /**
     * 生成alipay支付记录
     *
     * @param alipayPayecordInfo
     * @return
     */
    public Boolean createRecord(AlipayPayecordInfo alipayPayecordInfo) {
        AlipayPayRecord alipayPayRecord = new AlipayPayRecord();
        alipayPayRecord.set("user_id", alipayPayecordInfo.getUserID());
        alipayPayRecord.set("is_success", alipayPayecordInfo.getIsSuccess());
        alipayPayRecord.set("sign_type", alipayPayecordInfo.getSignType());
        alipayPayRecord.set("sign", alipayPayecordInfo.getSign());
        alipayPayRecord.set("out_trade_no", alipayPayecordInfo.getOutTradeNo());
        alipayPayRecord.set("subject", alipayPayecordInfo.getSubject());
        alipayPayRecord.set("payment_type", alipayPayecordInfo.getPaymentType());
        alipayPayRecord.set("exterface", alipayPayecordInfo.getExterface());
        alipayPayRecord.set("trade_no", alipayPayecordInfo.getTradeNo());
        alipayPayRecord.set("trade_status", alipayPayecordInfo.getTradeStatus());
        alipayPayRecord.set("notify_id", alipayPayecordInfo.getNotifyID());
        alipayPayRecord.set("notify_time", alipayPayecordInfo.getNotifyTime());
        alipayPayRecord.set("notify_type", alipayPayecordInfo.getNotifyType());
        alipayPayRecord.set("seller_email", alipayPayecordInfo.getSellerEmail());
        alipayPayRecord.set("buyer_email", alipayPayecordInfo.getBuyerEmail());
        alipayPayRecord.set("seller_id", alipayPayecordInfo.getSellerID());
        alipayPayRecord.set("buyer_id", alipayPayecordInfo.getBuyerID());
        alipayPayRecord.set("total_fee", alipayPayecordInfo.getTotalFee());
        alipayPayRecord.set("body", alipayPayecordInfo.getBody());
        alipayPayRecord.set("extra_common_param", alipayPayecordInfo.getExtraCommonParam());
        alipayPayRecord.set("agent_user_id", alipayPayecordInfo.getAgentUserID());
        alipayPayRecord.set("create_by", UserUtils.getUser().getId());
        alipayPayRecord.set("create_time", new Date());
        alipayPayRecord.set("remarks", alipayPayecordInfo.getRemark());
        alipayPayRecord.set("del_flag", false);
        return alipayPayRecord.save();
    }
}
