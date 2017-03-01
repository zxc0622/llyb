package com.qdum.llhb.sys.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.PageUtils;
import com.qdum.llhb.sys.model.OperationRecord;

/**
 * 日志查询
 *
 * @author ThinkGem
 * @version 2013-5-15
 */
@ControllerBind(controllerKey = "/sys/log")
public class LogController extends BaseController {
	
    @RequiresPermissions("sys:log:view")
    public void index() {
		PageUtils pageUtils = getPageParameter();
		String where = " where sor."+OperationRecord.DEL_FLAG+" = '0'";
		String sql = "select sor.* ";
		String sql1 = "from sys_oper_record sor left join sys_user su on sor.create_by = su.id";
		if (pageUtils.getMap().get("method") != null && !"".equals(pageUtils.getMap().get("method").toString())) {
			where = where + " and sor.method='"+pageUtils.getMap().get("method")+ "' ";
		}
		if (pageUtils.getMap().get("moudle") != null && !"".equals(pageUtils.getMap().get("moudle").toString())) {
			where = where + " and sor.moudle like '%"+pageUtils.getMap().get("moudle")+"%'";
		}

		if (pageUtils.getMap().get("action") != null && !"".equals(pageUtils.getMap().get("action").toString())) {
			where = where + " and sor.action like '%"+pageUtils.getMap().get("action")+"%'";
		}

		if (pageUtils.getMap().get("operator") != null && !"".equals(pageUtils.getMap().get("operator").toString())) {
			where = where + " and su.name like '%"+pageUtils.getMap().get("operator")+"%' ";
		}
		where += " order by sor.create_date desc";
		pageUtils.initialize(OperationRecord.dao.paginate(pageUtils.getPageNo(),pageUtils.getPageSize(), sql,
				sql1+where+ pageUtils.getOrderBySql()));
		if (pageUtils.getList().size() == 0 && pageUtils.getPageNo() != 1) { 
			pageUtils.setPageNo(1);
			pageUtils.initialize(OperationRecord.dao.paginate(pageUtils.getPageNo(),
					pageUtils.getPageSize(), sql,
					sql1+where+pageUtils.getOrderBySql()));
		}
        setAttr("page", pageUtils);
        render("logList.jsp");
    }

    @RequiresPermissions("sys:log:view")
    public void form() {
        Long id = getParaToLong("id");
        OperationRecord operaRecord;
        if (id != null && id != 0L) {
            operaRecord = OperationRecord.dao.findById(id);
            setAttr("log", operaRecord);
            render("logForm.jsp");
            return;
        }

		addMessageError( "请指定要查看详情的日志!");
		redirect("/sys/log");
    }

}
