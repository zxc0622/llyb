package com.qdum.llhb.fund.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.kit.ResourceKit;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Page;
import com.qdum.llhb.common.alipay.config.AlipayConfig;
import com.qdum.llhb.common.utils.OrderCodeUtil;
import com.qdum.llhb.fund.model.Fund;
import com.qdum.llhb.fund.vo.AlipayApiParamsInfo;
import com.qdum.llhb.fund.vo.RepositInfo;
import com.qdum.llhb.fund.vo.UserAccountInfo;
import com.qdum.llhb.trademana.Constant;
import com.qdum.llhb.trademana.model.RepositRecord;
import com.qdum.llhb.trademana.vo.RepositRecordInfo;
import com.qdum.llhb.ws.vo.AjaxBean;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chao on 2016/1/21.
 */
@ControllerBind(controllerKey = "/fund/reposit")
public class RepositController extends Controller {

    private static final Logger LOG = Logger.getLogger(RepositController.class);

    public void index() {
        Page<RepositRecordInfo> pageinfo = RepositRecord.dao.queryRepositRecord(1, Constant.DEFAULT_REPOSIT_RECORD_PAGE_SIZE);
        setAttr("pageinfo", pageinfo);
        render("reposit.jsp");
    }

    /**
     * 查询用户余额
     */
    public void queryUserBalance() {
        String loginName = getPara("loginName");
        UserAccountInfo userAccountInfo = Fund.dao.queryUserAccountInfo(loginName);
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(Boolean.TRUE);
        aj.setObj(userAccountInfo);
        renderJson(aj);
    }

    /**
     * 提现列表分页
     */
    public void repositRecordList() {
        int pageNumber = 1;
        if (isParaExists("pageNumber")) {
            pageNumber = getParaToInt("pageNumber");
        }
        int pageSize = Constant.DEFAULT_REPOSIT_RECORD_PAGE_SIZE;
        if (isParaExists("pageSize")) {
            pageSize = getParaToInt("pageSize");
        }
        Page<RepositRecordInfo> pageinfo = RepositRecord.dao.queryRepositRecord(pageNumber, pageSize);
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(Boolean.TRUE);
        aj.setObj(pageinfo);
        renderJson(aj);
    }

    /**
     * 提现
     */
    public void reposit() {
        RepositInfo repositInfo = receivingParams();
        Fund fund = Fund.dao.queryUserFund(Long.valueOf(repositInfo.getUserID()));
        AjaxBean aj = new AjaxBean();
        float real_price = repositInfo.getAmount() + repositInfo.getFee();
        if (fund == null || fund.getBigDecimal("fund") == null) {
            aj.setIsSuccess(Boolean.FALSE);
            aj.setMsg("对不起，该用户资金为0，不可提现");
        } else if (fund.getBigDecimal("fund").floatValue() < real_price) {
            aj.setIsSuccess(Boolean.FALSE);
            aj.setMsg("对不起，实际费用为" + real_price + "元,该用户资金不足,无法完成提现");
        } else {
            RepositRecord repositRecord = RepositRecord.dao.createRepositRecord(repositInfo);
            if (repositRecord != null) {
                String detailData = formatDetailData(OrderCodeUtil.getDetailDataNo(),
                        repositRecord.getStr("alipay_account"),
                        repositRecord.getStr("alipay_name"),
                        repositRecord.getFloat("real_amount"),
                        repositRecord.getStr("alipay_remarks")
                );
                AlipayApiParamsInfo aapi = byVal(new Date(), repositRecord.getFloat("real_amount"), detailData);
                aj.setIsSuccess(Boolean.TRUE);
                aj.setObj(aapi);
            } else {
                aj.setIsSuccess(Boolean.FALSE);
                aj.setMsg("对不起，操作失败！请尝试刷新页面重新操作~");
            }
        }
        renderJson(aj);
    }

    /**
     * 接收页面参数
     *
     * @return
     */
    private RepositInfo receivingParams() {
        RepositInfo repositInfo = new RepositInfo();
        repositInfo.setAlipayAccount(getPara("alipayAccount"));
        repositInfo.setAmount(Float.valueOf(getPara("amount")));
        repositInfo.setAccountName(getPara("alipayAccountName"));
        repositInfo.setRemark(getPara("remark"));
        String charges = getPara("fee");
        if (StrKit.isBlank(charges)) {
            repositInfo.setFee(0f);
        } else {
            repositInfo.setFee(Float.valueOf(charges));
        }
        repositInfo.setUserID(getPara("userID"));
        return repositInfo;
    }

    /**
     * 格式化付款详细数据
     *
     * @param serialNo    流水号
     * @param account     账号
     * @param accountName 账号姓名
     * @param sum         金额
     * @param remark      说明
     * @return
     */
    private String formatDetailData(String serialNo, String account, String accountName, float sum, String remark) {
        String formateStr = PropKit.get("paymentDetailData");
        String resultStr = MessageFormat.format(formateStr, serialNo, account, accountName, sum, remark);
        LOG.info("格式化后的字符串为：".concat(resultStr));
        return resultStr;
    }

    /**
     * 传值
     *
     * @param payDate
     * @param realPrice
     * @param detailData
     */
    private AlipayApiParamsInfo byVal(Date payDate, float realPrice, String detailData) {
        AlipayApiParamsInfo aapi = new AlipayApiParamsInfo();
        aapi.setEmail(PropKit.get("paymentAccount"));
        aapi.setAccountName(ResourceKit.readProperties("config.properties").get("paymentAccountName"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        aapi.setPayDate(sdf.format(new Date()));
        aapi.setBatchNo(OrderCodeUtil.getBacthNo());
        aapi.setBatchFee(realPrice);
        aapi.setBatchNum(1);
        aapi.setDetailData(detailData);
        return aapi;
    }
}
