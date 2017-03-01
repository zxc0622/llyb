package com.qdum.llhb.trademana.validator;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
import com.qdum.llhb.common.constant.ValidatorConstants;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.ws.vo.AjaxBean;

import java.util.List;

/**
 * 验证是否为数字
 * Created by rongchao on 2015/12/11.
 */
public class NumValidator extends Validator {

    private static final Logger LOGGER = Logger.getLogger(NumValidator.class);

    @Override
    protected void validate(Controller controller) {
        validateDouble("rechargeAmount", 0.00, Double.MAX_VALUE, "numericalError", "金额必须是大于0的数字,精确到分");
    }

    @Override
    protected void handleError(Controller controller) {
        controller.renderError(500);
    }
}
