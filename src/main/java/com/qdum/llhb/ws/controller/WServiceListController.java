package com.qdum.llhb.ws.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Page;
import com.qdum.llhb.common.constant.BaseConstants;
import com.qdum.llhb.ws.model.ServiceMain;

/**
 * 优蚁公司——危废服务列表
 * Created by rongchao on 2015/12/7.
 */
@ControllerBind(controllerKey = "/ws/youyi")
@Before(AdminInterceptor.class)
public class WServiceListController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(WServiceListController.class);

    /**
     * 危废列表页面
     */
    public void index() {
        int pageNumber = getParaToInt(0, 1);
        String step = null;
        String condition = null;
        int pageSize = BaseConstants.PAGESIZE_10;
//        if (isParaExists("pageNumber")) {
//            pageNumber = getParaToInt("pageNumber");
//            if (pageNumber == 0) {
//                pageNumber = 1;
//                //LOGGER.error("参数<pageNumber>无效，请检查确认参数<pageNumber>是否正确");
//            }
//        }
        if (isParaExists("step")) {
            step = getPara("step");
            if (StrKit.notBlank("step")) {
                setAttr("step", step);
            }
        }
        if (isParaExists("condition")) {
            condition = getPara("condition");
            if (StrKit.notBlank(condition)) {
                setAttr("condition", condition);
            }
        }
        if (isParaExists("pageSize")) {
            pageSize = getParaToInt("pageSize");
        }
        Page<ServiceMain> pageInfo = ServiceMain.dao.getAllAvailableServiceByPage(pageNumber, pageSize, step, condition);
        setAttr("pageInfo", pageInfo);
        render("yyservicelist.jsp");
    }

}
