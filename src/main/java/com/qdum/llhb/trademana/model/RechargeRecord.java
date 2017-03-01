package com.qdum.llhb.trademana.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.OrderCodeUtil;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.trademana.Constant;
import com.qdum.llhb.trademana.enumvalue.PlatformEnum;
import com.qdum.llhb.trademana.enumvalue.RechargeStatusEnum;
import com.qdum.llhb.trademana.vo.BeforeRechargeInfo;
import com.qdum.llhb.trademana.vo.RechargeInfo;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 充值/提现记录表
 * Created by chao on 2016/1/15.
 */
public class RechargeRecord extends Model<RechargeRecord> {

    public Map<String, Object> getResultMap() {
        return this.getAttrs();
    }

    public static RechargeRecord dao = new RechargeRecord();

    public static final String ID = "id";

    public static final String USER_ID = "user_id";

    public static final String SERIAL_NUMBER = "serial_number";

    public static final String AMOUNT = "amount";

    public static final String CHARGE = "charge";

    public static final String REAL_AMOUNT = "real_amount";

    public static final String REMAIN_SUM = "remain_sum";

    public static final String PLATFORM = "platform";

    public static final String ORDER_TIME = "order_time";

    public static final String PAYMENT_TIME = "payment_time";

    public static final String STATUS = "status";

    public static final String CREATE_BY = "create_by";

    public static final String CREATE_DATE = "create_date";

    public static final String UPDATE_BY = "update_by";

    public static final String UPDATE_DATE = "update_date";

    public static final String DEL_FLAG = "del_flag";


    /**
     * 处理充值页面的手续费以及实收金额
     *
     * @return
     */
    public RechargeInfo handleRecharge(float rechargeAmount) {
        DecimalFormat df = new DecimalFormat("0.00");
        String rechargeAmountResult = df.format(rechargeAmount);
        String chargesResult = df.format(Constant.RECHARGE_CHARGES);
        String realPriceResult = df.format(rechargeAmount + Constant.RECHARGE_CHARGES);
        RechargeInfo rechargeInfo = new RechargeInfo();
        rechargeInfo.setCharges(chargesResult);
        rechargeInfo.setRealPrice(realPriceResult);
        rechargeInfo.setRechargeAmount(rechargeAmountResult);
        return rechargeInfo;
    }

    /**
     * 生成充值订单
     *
     * @param beforeRechargeInfo
     * @return
     */
    public String createRechargeOrder(BeforeRechargeInfo beforeRechargeInfo) {
        RechargeRecord rechargeRecord = new RechargeRecord();
        String orderNo = OrderCodeUtil.getOrderNo();
        rechargeRecord.set(USER_ID, UserUtils.getUser().getId());
        rechargeRecord.set(SERIAL_NUMBER, orderNo);
        rechargeRecord.set(AMOUNT, beforeRechargeInfo.getRechargeAmount());
        rechargeRecord.set(CHARGE, beforeRechargeInfo.getCharges());
        rechargeRecord.set(REAL_AMOUNT, beforeRechargeInfo.getRealPrice());
        rechargeRecord.set(PLATFORM, beforeRechargeInfo.getPlatform());
        rechargeRecord.set(ORDER_TIME, new Date());
        //rechargeRecord.set(PAYMENT_TIME, new Date());
        rechargeRecord.set(STATUS, RechargeStatusEnum.ordered.toString());
        FillFieldsUtils.fillCommonInfo(rechargeRecord);
        if (rechargeRecord.save()) {
            return orderNo;
        } else {
            return null;
        }
    }

    /**
     * 根据订单编号查询充值记录
     *
     * @param orderCode
     * @return
     */
    public RechargeRecord queryRechargeRecordByCode(String orderCode) {
        String sql = "select * from tm_recharge_record where del_flag = '0' and serial_number = ?";
        return this.findFirst(sql, orderCode);
    }

    /**
     * 根据用户ID获取用户所有的充值记录
     *
     * @param userID
     * @return
     */
    public List<RechargeRecord> queryRechargeRecordsByUserID(long userID, Date startDate, Date endDate, String platform) {
        StringBuffer sb = new StringBuffer();
        sb.append("select * from tm_recharge_record where del_flag = '0' and user_id = ? and platform = ?");
        if (StrKit.isBlank(platform)) {
            platform = PlatformEnum.alipay.toString();
        }
        if (endDate == null) {
            endDate = new Date();
        }
        if (startDate == null) {
            sb.append(" and create_date < ? order by create_date desc");
            return this.find(sb.toString(), userID, platform, endDate);
        } else {
            sb.append(" and create_date < ? and create_date > ? order by create_date desc");
            return this.find(sb.toString(), userID, platform, endDate, startDate);
        }
    }

}
