package com.qdum.llhb.fund.model;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.DbUtil;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.fund.FundVariationTypeEnum;
import com.qdum.llhb.fund.vo.UserAccountInfo;
import com.qdum.llhb.trademana.enumvalue.RechargeStatusEnum;
import com.qdum.llhb.trademana.model.AlipayPayRecord;
import com.qdum.llhb.trademana.model.RechargeRecord;
import com.qdum.llhb.trademana.vo.AlipayPayecordInfo;
import org.apache.log4j.Logger;

import java.util.Date;
import java.util.List;

/**
 * 资金
 * Created by rongchao on 2015/12/28.
 */
public class Fund extends Model<Fund> {

    private static final Logger LOGGER = Logger.getLogger(Fund.class);

    public static Fund dao = new Fund();

    public Fund queryUserFund(Long userID) {
        String sql = "select * from tm_fund where del_flag = '0' and user_id = ?";
        List<Fund> userFunds = this.find(sql, userID);
        if (userFunds == null || userFunds.size() == 0) {
            return null;
        } else if (userFunds.size() > 1) {
            String errorMsg = "资金表中关于<userID>为'"
                    .concat(userID.toString())
                    .concat("'的用户的资金异常。原因：从资金表中查出了多于一条资金数据");
            LOGGER.error(errorMsg);
            throw new RuntimeException(errorMsg);
        } else {
            return userFunds.get(0);
        }
    }

    public Fund createFund(Long userID, float money) {
        Fund fund = new Fund();
        fund.set("user_id", userID);
        fund.set("fund", money);
        FillFieldsUtils.fillCommonInfo(fund);
        Boolean isSuccess = fund.save();
        if (isSuccess) {
            return fund;
        } else {
            return null;
        }
    }

    /**
     * 资金变动
     *
     * @param money
     * @param userID
     * @return
     */
    public Fund changeFund(float money, String userID, FundVariationTypeEnum variationType) {
        if (StrKit.isBlank(userID)) {
            LOGGER.error("用户ID<userID>为空，请检查参数!");
            return null;
        }
        Fund fund = this.queryUserFund(Long.valueOf(userID));
        if (fund == null) {
            Fund newFund = this.createFund(Long.valueOf(userID), money);
            return newFund;
        }
        float fundMoney = 0f;
        if (fund.getBigDecimal("fund") != null) {
            fundMoney = fund.getBigDecimal("fund").floatValue();
        }
        float resultFundMoney = 0f;
        if (FundVariationTypeEnum.add.equals(variationType)) {
            resultFundMoney = fundMoney + money;
        } else {
            resultFundMoney = fundMoney - money;
        }
        fund.set("fund", resultFundMoney);
        FillFieldsUtils.updateCommonInfo(fund);
        fund.update();
        return fund;
    }

    /**
     * 充值
     *
     * @param alipayPayecordInfo
     * @return
     */
    public Boolean recharge(AlipayPayecordInfo alipayPayecordInfo) {
        //1、更新用户支付宝状态记录表，将支付宝返回的信息放入用户支付宝状态记录表中。
        AlipayPayRecord.dao.createRecord(alipayPayecordInfo);
        //2、更新资金表
        RechargeRecord rechargeRecord = RechargeRecord.dao.queryRechargeRecordByCode(alipayPayecordInfo.getOutTradeNo());
        Fund fund = this.changeFund(rechargeRecord.getBigDecimal(RechargeRecord.AMOUNT).floatValue(),
                alipayPayecordInfo.getUserID(),
                FundVariationTypeEnum.add);
        //3、更新充值记录表
        rechargeRecord.set(RechargeRecord.PAYMENT_TIME, new Date());
        rechargeRecord.set(RechargeRecord.STATUS, RechargeStatusEnum.success.toString());
        rechargeRecord.set(RechargeRecord.REMAIN_SUM, fund.getFloat("fund"));
        FillFieldsUtils.updateCommonInfo(rechargeRecord);
        rechargeRecord.update();
        return Boolean.TRUE;
    }

    /**
     * 查询某用户的资金
     */
    public Record getFundUser(long uid) {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM tm_fund f WHERE f.user_id = ?");
        return Db.findFirst(sb.toString(), uid);
    }

    /**
     * 查询用户账号信息
     *
     * @param loginName
     * @return
     */
    public UserAccountInfo queryUserAccountInfo(String loginName) {
        String sql = DbUtil.getSql(this.getClass(), "queryUserAccountInfo");
        Fund fund = this.findFirst(sql, loginName);
        if (fund == null) {
            return null;
        } else {
            UserAccountInfo userAccountInfo = new UserAccountInfo();
            userAccountInfo.setAccountName(fund.getStr("login_name"));
            userAccountInfo.setBalance(fund.getBigDecimal("fund"));
            userAccountInfo.setUserID(fund.getLong("id"));
            return userAccountInfo;
        }
    }
}
