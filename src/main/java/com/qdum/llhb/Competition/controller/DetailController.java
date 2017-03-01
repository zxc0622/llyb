package com.qdum.llhb.Competition.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.Competition.model.Competition;
import com.qdum.llhb.Competition.model.CompetitionMargin;
import com.qdum.llhb.Competition.model.CompetitionRecord;
import com.qdum.llhb.Competition.model.CompetitionRemind;
import com.qdum.llhb.Competition.vo.CompetitionPageInfo;
import com.qdum.llhb.common.ResultObj;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.common.validator.ParamOfIdValidator;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.vo.AjaxBean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by rongchao on 2015/12/23.
 */
@ControllerBind(controllerKey = "/competition/detailInfo")
public class DetailController extends CommonController {

    private static final Logger LOGGER = Logger.getLogger(DetailController.class);

    @Before(ParamOfIdValidator.class)
    public void index() {
        Long id = getParaToLong("id");
        Competition.dao.updateCompPageView(id);
        CompetitionPageInfo cpi = Competition.dao.getInfoForCompetitionPage(id);
        setAttr("detail", cpi);
        render("detail.jsp");
    }

    /**
     * 获取竞买记录
     */
    public void getRecoders() {
        Long id = getParaToLong("id");
        int pageNumber = getParaToInt("pageNumber");
        Page<Record> recorders = Competition.dao.getCompetitionRecords(id, pageNumber, BaseConstants.COMPETITION_RECODER_PAGESIZE);
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(true);
        aj.setObj(recorders);
        renderJson(aj);
    }

    /**
     * 交保证金
     */
    @Before(Tx.class)
    public void payMargin() {
        Long id = getParaToLong("id");
        ResultObj obj = CompetitionMargin.dao.payMargin(id);
        Boolean canBid = Boolean.FALSE;
        AjaxBean aj = new AjaxBean();
        if (obj.getIsSuccess()) {
            canBid = CompetitionRecord.dao.canBind(id);
            aj.setIsSuccess(Boolean.TRUE);
            aj.setObj(canBid);
        } else {
            aj.setIsSuccess(Boolean.FALSE);
            aj.setMsg(obj.getMsg());
        }
        renderJson(aj);
    }

    /**
     * 用户设置竞品竞价提醒
     */
    @Before(Tx.class)
    public void setRemind() {
        Long id = getParaToLong("id");
        boolean isSuccess = CompetitionRemind.dao.setRemind(id);
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        if (isSuccess) {
            aj.setMsg("设置竞品竞价提醒成功~!");
        } else {
            aj.setMsg("设置竞品竞价提醒失败~!");
        }
        renderJson(aj);
    }

    /**
     * 竞品竞价
     */
    public void bidding() {
        Long id = getParaToLong("id");
        float bidPrice = Float.valueOf(getPara("bidPrice"));
        Record ctm = CompetitionMargin.dao.getMargin(id, UserUtils.getUser().getId());
        AjaxBean aj = new AjaxBean();
        if (ctm == null) {
            aj.setIsSuccess(Boolean.FALSE);
            aj.setMsg("请先缴纳保证金！");
        } else {
            ResultObj resultObj = CompetitionRecord.dao.bidding(id, bidPrice);
            aj.setIsSuccess(resultObj.getIsSuccess());
            aj.setMsg(resultObj.getMsg());
        }
        renderJson(aj);
    }

    public void getUserInfo() {
        Person person = UserUtils.getUser().getPerson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (person == null) {
            map.put("email", "无邮箱信息");
            map.put("phone", "无手机信息");
        } else {
            if (person.getEmail() == null) {
                map.put("email", "无邮箱信息");
            } else {
                map.put("email", person.getEmail());
            }
            map.put("phone", person.getPhone());
        }
        renderJson(map);
    }
}
