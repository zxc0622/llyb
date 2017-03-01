package com.qdum.llhb.common.validator;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;
import com.jfinal.validate.Validator;
import com.qdum.llhb.common.constant.ValidatorConstants;

/**
 * 参数ID验证
 * Created by rongchao on 2015/12/10.
 */
public class ParamOfIdValidator extends Validator {

    private static final Logger LOGGER = Logger.getLogger(ParamOfIdValidator.class);

    @Override
    protected void validate(Controller controller) {
        boolean isExists = controller.isParaExists("id");
        validateRequired("id", ValidatorConstants.PARAM_REQUIRE, "参数<id>无效，请检查参数的正确性~!");
        validateLong("id", ValidatorConstants.PARAM__NOT_NUMBER, "参数只能为数字");
    }

    @Override
    protected void handleError(Controller controller) {
        controller.renderError(500);
    }
}
