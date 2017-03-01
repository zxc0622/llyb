package com.qdum.llhb.ws.controller;

import java.util.Date;
import java.util.List;

import com.google.common.collect.Lists;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.vo.AjaxBean;

@ControllerBind(controllerKey = "/ws/environment/servicelist")
@Before(AdminInterceptor.class)
public class EPServiceListController extends CommonController {

    private static final Logger LOGGER = Logger.getLogger(EPServiceListController.class);

    private Boolean isSuccess = false;

    private String msg = "操作失败!";

    public void index() {
        ServiceMain serviceMain = ServiceMain.dao.getServicelistCount();
        setAttr("serviceMain", serviceMain);
        render("servicelist.jsp");
    }

    /**
     * 所有的危废服务申请
     */
    public void allApplication() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getAllServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }

    /**
     * 历史申请
     *
     * @author rongchao
     */
    public void historyApplication() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getHistoryServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }

    /**
     * 申报申请
     */
    public void auditingApplication() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getAuditingServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }

    /**
     * 收运申请
     */
    public void tpAppliccation() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getCTServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }

    /**
     * 被终止删除的申请
     */
    public void delAppliccation() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getDelServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }

    /**
     * 预约申请
     */
    public void orderAppliccation() {
        List<ServiceMain> serviceMains = Lists.newArrayList();
        try {
            serviceMains = ServiceMain.dao.getOrderServices();
            isSuccess = true;
        } catch (Exception e) {
            isSuccess = false;
            msg = "操作失败!原因:".concat(e.getMessage());
            LOGGER.error(msg, e);
        }
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setObj(serviceMains);
        renderJson(aj);
    }


    /**
     * 页面跳转
     *
     * @author rongchao
     */
    public void spikToPage() {
        Long serviceID = getParaToLong("id");
        ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(serviceID);
        if (serviceMain == null) {
            renderError(500);
            return;
        }
        String epStep = serviceMain.getEpStep();
        String url = null;
        if (StrKit.isBlank(epStep)) {
            renderError(500);
            return;
        } else if (EpStepStatusEnum.AUDITANDOFFER_STEP.getValue().equals(epStep)) {
            url = "/ws/environment/audit?id=".concat(serviceID.toString());
        } else if (EpStepStatusEnum.CONTRACT_STEP.getValue().equals(epStep)) {
            url = "/ws/environment/uploadfile?id=".concat(serviceID.toString());
        } else if (EpStepStatusEnum.ENSURE_PLAN_STEP.getValue().equals(epStep)) {
            url = "/ws/environment/confirmplan?id=".concat(serviceID.toString());
        } else if (EpStepStatusEnum.AUDITING_INFO_STEP.getValue().equals(epStep)) {
            url = "/ws/environment/approvefile?id=".concat(serviceID.toString());
        } else if (EpStepStatusEnum.ARRANGE_COLLECTION_TRANSPORTATION_STEP.getValue().equals(epStep)) {
            url = "/ws/environment/confirmplan/arrangeCt?id=".concat(serviceID.toString());
        }
        if (url.indexOf("?") > 0) {
            url = url.concat("&timestamp=") + new Date().getTime();
        } else {
            url = url.concat("?timestamp=") + new Date().getTime();
        }
        redirect(url);
    }

    public void handleOrderService() {
        Long id = getParaToLong("id");
        if (id == null || id == 0L) {
            LOGGER.error("参数<id>无效，请检查参数id的正确性！");
            renderError(500);
            return;
        }
        ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(id);
        serviceMain.setIsDate(2);
        FillFieldsUtils.updateCommonInfo(serviceMain);
        boolean isSuccess = serviceMain.update();
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        if (isSuccess) {
            aj.setMsg("操作成功");
        } else {
            aj.setMsg("操作失败");
        }
        renderJson(aj);
    }
}
