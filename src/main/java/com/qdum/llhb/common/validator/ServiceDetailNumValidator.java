package com.qdum.llhb.common.validator;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
import com.qdum.llhb.common.constant.ValidatorConstants;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.ws.vo.AjaxBean;

import java.util.List;

/**
 * 验证危废服务申请明细重量是否为数字
 * Created by rongchao on 2015/12/11.
 */
public class ServiceDetailNumValidator extends Validator {

    private static final Logger LOGGER = Logger.getLogger(ServiceDetailNumValidator.class);

    @Override
    protected void validate(Controller controller) {
        String modelName = "serviceDetails";
        CommonController cc = (CommonController) controller;
        List<String> noList = cc.getModelsNoList(modelName);
        for (String no : noList) {
            String paramName = modelName + "[" + no + "].weight";
            String weight = cc.getPara(paramName);
            LOGGER.info("weight:".concat(weight));
            try {
                Double.parseDouble(weight);
            } catch (NumberFormatException e) {
                addError(ValidatorConstants.PARAM__NOT_NUMBER, "危废服务明细中的废物年预计数量必需是数字~!");
                return;
            }
        }
    }

    @Override
    protected void handleError(Controller controller) {
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(false);
        aj.setMsg("危废服务明细中的废物年预计数量必需是数字~!");
        controller.renderJson(aj);
    }
}
