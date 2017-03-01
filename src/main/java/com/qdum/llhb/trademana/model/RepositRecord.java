package com.qdum.llhb.trademana.model;

import com.google.common.collect.Lists;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.qdum.llhb.common.utils.DbUtil;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.OrderCodeUtil;
import com.qdum.llhb.fund.vo.RepositInfo;
import com.qdum.llhb.trademana.Constant;
import com.qdum.llhb.trademana.enumvalue.PlatformEnum;
import com.qdum.llhb.trademana.enumvalue.RepositStatusEnum;
import com.qdum.llhb.trademana.vo.RepositRecordInfo;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 提现记录表
 * Created by chao on 2016/1/15.
 */
public class RepositRecord extends Model<RepositRecord> {

    public static RepositRecord dao = new RepositRecord();

    /**
     * 获取提现记录（分页）
     *
     * @param pageNumber
     * @return
     */
    public Page<RepositRecordInfo> queryRepositRecord(int pageNumber, int pageSize) {
        String select = DbUtil.getSql(this.getClass(), "queryRepositRecordSelect");
        String from = DbUtil.getSql(this.getClass(), "queryRepositRecordFrom");
        Page<RepositRecord> pageInfo = paginate(pageNumber, pageSize, select, from);
        return repositRecordPage2RepositRecordInfoPage(pageInfo);
    }

    /**
     * 将提现记录Model的page信息copy到相应的vo的page信息中
     */
    private Page<RepositRecordInfo> repositRecordPage2RepositRecordInfoPage(Page<RepositRecord> repositRecordPage) {
        List<RepositRecord> list = repositRecordPage.getList();
        List<RepositRecordInfo> resultList = Lists.newArrayList();
        for (RepositRecord repositRecord : list) {
            RepositRecordInfo repositRecordInfo = repositRecord2RepositRecordInfo(repositRecord);
            resultList.add(repositRecordInfo);
        }
        Page<RepositRecordInfo> infoPage = new Page<RepositRecordInfo>(resultList,
                repositRecordPage.getPageNumber(),
                repositRecordPage.getPageSize(),
                repositRecordPage.getTotalPage(),
                repositRecordPage.getTotalRow());
        return infoPage;
    }

    private RepositRecordInfo repositRecord2RepositRecordInfo(RepositRecord repositRecord) {
        RepositRecordInfo repositRecordInfo = new RepositRecordInfo();
        repositRecordInfo.setAccountName(repositRecord.getStr("login_name"));
        repositRecordInfo.setAlipayAccount(repositRecord.getStr("alipay_account"));
        repositRecordInfo.setAmount(repositRecord.getBigDecimal("amount").floatValue());
        Long updateBy = repositRecord.getLong("update_by");
        if (updateBy == null || updateBy == 0L) {
            repositRecordInfo.setOperationTime(repositRecord.getDate("create_date"));
            repositRecordInfo.setOperator(repositRecord.getStr("createOperator"));
        } else {
            repositRecordInfo.setOperationTime(repositRecord.getDate("update_date"));
            repositRecordInfo.setOperator(repositRecord.getStr("updateOperator"));
        }
        repositRecordInfo.setPlatform(repositRecord.getStr("platform"));
        repositRecordInfo.setStatus(repositRecord.getStr("status"));
        return repositRecordInfo;
    }

    /**
     * 创建提现记录
     *
     * @param repositInfo
     * @return
     */
    public RepositRecord createRepositRecord(RepositInfo repositInfo) {
        RepositRecord repositRecord = new RepositRecord();
        repositRecord.set("user_id", repositInfo.getUserID());
        repositRecord.set("alipay_account", repositInfo.getAlipayAccount());
        repositRecord.set("alipay_name", repositInfo.getAccountName());
        repositRecord.set("alipay_remarks", repositInfo.getRemark());
        repositRecord.set("serial_number", OrderCodeUtil.getRepositOrderNo());
        repositRecord.set("amount", repositInfo.getAmount());
        repositRecord.set("charge", repositInfo.getFee());
        repositRecord.set("real_amount", repositInfo.getAmount() + repositInfo.getFee());
        repositRecord.set("platform", PlatformEnum.alipay.toString());
        repositRecord.set("order_time", new Date());
        repositRecord.set("status", RepositStatusEnum.ordered.toString());
        FillFieldsUtils.fillCommonInfo(repositRecord);
        Boolean isSuccess = repositRecord.save();
        if (isSuccess) {
            return repositRecord;
        } else {
            return null;
        }
    }

    /**
     * 根据流水号查询提现记录
     *
     * @param serialNumber 流水号
     * @return
     */
    public RepositRecord queryRepositRecord(String serialNumber) {
        String sql = "select id from tm_reposit_record where del_flag = '0' and serial_number = ?";
        return this.findFirst(sql, serialNumber);
    }

    /**
     * 支付宝付款借口返回信息后更新提现记录表
     *
     * @param status       状态
     * @param serialNumber 流水号
     * @param balance      余额
     * @return
     */
    public Boolean updateRepositRecord(RepositRecord repositRecord, RepositStatusEnum status, float balance) {
        repositRecord.set("status", status.toString());
        repositRecord.set("reposit_time", new Date());
        repositRecord.set("remain_sum", balance);
        FillFieldsUtils.updateCommonInfo(repositRecord);
        repositRecord.update();
        return repositRecord.update();
    }
}
