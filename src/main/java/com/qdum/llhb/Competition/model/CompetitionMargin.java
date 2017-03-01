package com.qdum.llhb.Competition.model;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.common.ResultObj;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.log4j.Logger;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 竞价保证金
 * Created by rongchao on 2015/12/28.
 */
public class CompetitionMargin extends Model<CompetitionMargin> {

    private static final Logger LOGGER = Logger.getLogger(CompetitionMargin.class);

    public static CompetitionMargin dao = new CompetitionMargin();

    /**
     * 提交保证金
     *
     * @param compID
     * @return 1代表操作成功，-1代表当前用户没有资金为0，-2代表资金不足
     */
    @Before(Tx.class)
    public ResultObj payMargin(Long compID) {
        long userID = UserUtils.getUser().getId();
        Fund fund = Fund.dao.queryUserFund(userID);
        if (fund == null) {
            ResultObj reObj = new ResultObj(false);
            reObj.setMsg("您的资金不足，请充值资金后再报名~!");
            return reObj;
        } else {
            float currentFund = 0f;
            if (fund.getBigDecimal("fund") != null) {
                currentFund = fund.getBigDecimal("fund").floatValue();
            }
            if (currentFund == 0f) {
                ResultObj reObj = new ResultObj(false);
                reObj.setMsg("您的资金不足，请充值资金后再报名~!");
                return reObj;
            }
            Record comp = Competition.dao.getCompByID(compID);
            float marginMoney = 0f;
            if (comp.getBigDecimal("margin_money") != null) {
                marginMoney = comp.getBigDecimal("margin_money").floatValue();
            }
            if (marginMoney > currentFund) {
                ResultObj reObj = new ResultObj(false);
                reObj.setMsg("您的资金不足，请充值资金后再报名~!");
                return reObj;
            }
            fund.set("fund", currentFund - marginMoney);
            FillFieldsUtils.updateCommonInfo(fund);
            boolean isFundSave = fund.update();
            if (isFundSave) {
                Record rc = this.getMargin(compID, userID);
                if (rc == null) {
                    if (this.insertMargin(compID, userID, marginMoney)) {
                        return ResultObj.successResultObj;
                    } else {
                        ResultObj reObj = new ResultObj(false);
                        reObj.setMsg("报名失败，请刷新页面重新进行操作~!");
                        return reObj;
                    }
                } else {
                    LOGGER.error("提交保证金失败~原因:因为该用户已经提交了保证金~");
                    ResultObj reObj = new ResultObj(false);
                    reObj.setMsg("提交保证金失败~原因:因为该用户已经提交了保证金~");
                    return reObj;
                }
            }
        }
        ResultObj reObj = new ResultObj(false);
        reObj.setMsg("报名失败，请刷新页面重新进行操作~!");
        return reObj;
    }

    /**
     * 获取用户对某一竞品的保证金
     *
     * @param compID
     * @return
     */
    public Record getMargin(Long compID, Long userID) {
        String sql = "select * from inma_competition_margin_pay where del_flag = '0' and comp_id = ? and user_id = ? and sta = '0'";
        Record rc = Db.findFirst(sql, compID, userID);
        return rc;
    }

    /**
     * 用户提交保证金
     *
     * @param compID
     * @param userID
     * @param marginMoney
     * @return
     */
    public Boolean insertMargin(Long compID, Long userID, Float marginMoney) {
        CompetitionMargin margin = new CompetitionMargin();
        margin.set("user_id", userID)
                .set("comp_id", compID)
                .set("margin_money", marginMoney)
                .set("sta", 0)
                .set("create_time", new Date())
                .set("del_flag", false);
        return margin.save();
    }

    /**
     * 查询没有中标的用户
     */
    public List<Record> getNotBidding(long cid, long uid) {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT * FROM inma_competition_margin_pay r WHERE r.comp_id=? and r.user_id !=?");
        return Db.find(sb.toString(), cid, uid);
    }
    public void updateSta(Long id ){
    	String sql = "update inma_competition_margin_pay set sta = 1 where id =?";
    	Db.update(sql,id);
    }
}
