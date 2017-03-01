package com.qdum.llhb.ws.controller;

import java.text.MessageFormat;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.qdum.llhb.common.controller.CommonController;
import com.qdum.llhb.common.utils.FillFieldsUtils;
import com.qdum.llhb.common.utils.NumberUtil;
import com.qdum.llhb.common.validator.ServiceDetailNumValidator;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.sys.model.DictPcr;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.Constants;
import com.qdum.llhb.ws.WsUtils;
import com.qdum.llhb.ws.enumvalue.EpStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.NodeStepStatusEnum;
import com.qdum.llhb.ws.enumvalue.OfferAgreeEnum;
import com.qdum.llhb.ws.enumvalue.PwStepStatusEnum;
import com.qdum.llhb.ws.model.EpOperation;
import com.qdum.llhb.ws.model.OperationLogs;
import com.qdum.llhb.ws.model.PwOperation;
import com.qdum.llhb.ws.model.ServiceDetails;
import com.qdum.llhb.ws.model.ServiceMain;
import com.qdum.llhb.ws.vo.AjaxBean;

/**
 * 产废方-基本资料
 *
 * @author rongchao
 */
@ControllerBind(controllerKey = "/ws/productwaste/pwbaseinfo")
@Before(AdminInterceptor.class)
public class PWBaseInfoController extends CommonController {

    private static final Logger LOGGER = Logger.getLogger(PWBaseInfoController.class);

    /**
     * 危废服务主表Dao
     */
    private ServiceMain serviceMainDao = ServiceMain.dao;

    /**
     * 危废服务废物明细Dao
     */
    private ServiceDetails serviceDetailsDao = ServiceDetails.dao;

    /**
     * 危废服务产废企业操作状态Dao
     */
    private PwOperation pwOperationDao = PwOperation.dao;

    public void index() {

        //判断是否为企业,若不是,则跳转到企业信息页面维护企业信息 yaoyt@2016.3.11
        if(!UserUtils.isCompany()){
            getSession().setAttribute("tip","请先完善公司资料再进行危废服务");
            redirect("/hyzl/EnterpriseDataZero");
            return;
        }

        Long serviceCount = serviceMainDao.getServiceCount();
        if (serviceCount == null || serviceCount == 0L) {
            setAttr("serviceCount", serviceCount);
            render("baseinfonav.jsp");
        } else {
            render("baseinfoindex.jsp");
        }
        
    }

    // ------------------产废方——危废服务列表-------------------------

    /**
     * 危废服务首页
     */
    public void serviceMainIndexPage() {
        //获取最新的危废记录前20条

        render("baseinfoindex.jsp");
    }

    /**
     * 办理历史
     */
    public void serviceHistory() {
        boolean isSuccess = false;
        String msg = "获取数据失败！";
        List<ServiceMain> list = serviceMainDao.getUserHistoryServices();
        isSuccess = true;
        msg = "获取数据成功！";
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        aj.setObj(list);
        renderJson(aj);
    }

    /**
     * 办理中的危废服务
     */
    public void handlingService() {
        boolean isSuccess = false;
        String msg = "获取数据失败！";
        List<ServiceMain> list = serviceMainDao.getUserHandlingService();
        isSuccess = true;
        msg = "获取数据成功！";
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        aj.setObj(list);
        renderJson(aj);
    }

    /**
     * 页面跳转
     *
     * @author rongchao
     */
    public void spikToPage() {
        Long serviceID = getParaToLong("id");
        if (serviceID == null || serviceID == 0L) {
            LOGGER.error("参数<id>无效，请检查参数<id>是否正确！");
            renderError(500);
            return;
        }
        ServiceMain serviceMain = ServiceMain.dao.getServiceAndOpByID(serviceID);
        String pwStep = serviceMain.getPwStep();
        String url = null;
        if (StrKit.isBlank(pwStep)) {
            renderError(500);
            return;
        } else if (PwStepStatusEnum.BASEINFO_STEP.getValue().equals(pwStep)) {
            String nodeSta = serviceMain.getNodeSta();
            Integer isOffer = serviceMain.getOfferUpload();
            if (NodeStepStatusEnum.SAVE_STATUS.getValue().equals(nodeSta)) {
                url = "/ws/productwaste/pwbaseinfo/baseInfoSavePage?id=".concat(serviceID.toString());
            } else if (NodeStepStatusEnum.AUDITING_STATUS.getValue().equals(nodeSta)) {
                url = "/ws/productwaste/pwbaseinfo/auditingPage";
            } else if ((isOffer == null || isOffer == 0) && NodeStepStatusEnum.AUDITED_STATUS.getValue().equals(nodeSta)) {
                url = "/ws/productwaste/pwbaseinfo/offeringPage?id=".concat(serviceID.toString());
            } else if (NodeStepStatusEnum.AUDITED_STATUS.getValue().equals(nodeSta)) {
                url = "/ws/productwaste/pwbaseinfo/initPassedPage?id=".concat(serviceID.toString());
            }
        } else if (PwStepStatusEnum.CONTRACT_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/contract?id=".concat(serviceID.toString());
        } else if (PwStepStatusEnum.PLAN_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/manaplan?id=".concat(serviceID.toString());
        } else if (PwStepStatusEnum.POST_DATA_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/payAndPost/post?id=".concat(serviceID.toString());
        } else if (PwStepStatusEnum.PAY_AND_RECORD_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/payAndPost/pay?id=".concat(serviceID.toString());
        } else if (PwStepStatusEnum.AUDITING_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/auditing?id=".concat(serviceID.toString());
        } else if (PwStepStatusEnum.NOTICE_COLLECTION_TRANSPORTATION_STEP.getValue().equals(pwStep)) {
            url = "/ws/productwaste/manaplan/notice?id=".concat(serviceID.toString());
        }
        if (url.indexOf("?") > 0) {
            url = url.concat("&timestamp=") + new Date().getTime();
        } else {
            url = url.concat("?timestamp=") + new Date().getTime();
        }
        redirect(url);
    }

    // --------------------------end------------------------

    /**
     * 查看危废服务详细
     */
    public void veiwServiceMainDetail() {
        Long id = getParaToLong("id");
        if (id != null && id != 0L) {
            ServiceMain serviceMain = serviceMainDao.findServiceMainByID(id);
            List<ServiceDetails> serviceDetailsList = serviceDetailsDao.getServiceDetails(id);
            setAttr("serviceMainInfo", serviceMain);
            setAttr("serviceDetailsInfos", serviceDetailsList);
        }
        render("baseinfo.jsp");
    }

    // -------------------------- 产废方——新建危废服务流程 ------------------------

    /**
     * 危废服务新建页面
     * 2016年4月1日 14:44:53 --修改.
     */
    public void notfilledPage() {
    	List<Record> companyList = Company.dao.getAuthCompany();
    	setAttr("companyList", companyList);
    	
    	//初始化用户信息
    	User user = UserUtils.getUser();
    	ServiceMain serviceMain = ServiceMain.dao;
    	Record userMsg=Db.findFirst("SELECT c.contact contact, p.real_name realname,"
    			+ " u.name name, c.company_name, c.address, c.email cemail,"
    			+ " p.email pemail, u.email uemail, c.phone cphone, p.phone pphone"
    			+ " FROM sys_company c LEFT JOIN sys_person p ON c.user_id = p.user_id"
    			+ " LEFT JOIN sys_user u ON c.user_id = u.id "
    			+ "WHERE c.user_id=?",user.getId());
    	String email = userMsg.getStr("cemail");
    	if(email == null){
    		email = userMsg.getStr("pemail");
    	}
    	if(email == null){
    		email = userMsg.getStr("uemail");
    	}
    	
    	String conntact = userMsg.getStr("contact");
    	if(conntact == null){
    		conntact = userMsg.getStr("realname");
    	}
    	if(conntact == null){
    		conntact = userMsg.getStr("name");
    	}
    	
    	String phone =  userMsg.getStr("cphone");
    	if(phone == null){
    		phone = userMsg.getStr("pphone");
    	}
    	
    	serviceMain.setEmail(email);
    	serviceMain.setContactPerson(conntact);
    	serviceMain.setCompName(userMsg.getStr("company_name"));
    	serviceMain.setCompAddr(userMsg.getStr("address"));
    	serviceMain.setPhone(phone);
    	setAttr("serviceMainInfo", serviceMain);
    	
    	setAttr("typeList", DictPcr.dao.getWsTypeList());
    	
    	render("notfilled.jsp");
        //render("order.jsp");
    }

    /**
     * 危废服务新建页面
     */
    public void baseInfoSavePage() {
        Long id = getParaToLong("id");
        if (id == null || id == 0L) {
            renderError(500);
            return;
        }
        ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(id);
        List<ServiceDetails> serviceDetailsList = serviceDetailsDao.getServiceDetails(id);
        List<Record> companyList = Company.dao.getAuthCompany();
    	setAttr("companyList", companyList);
        setAttr("serviceMainInfo", serviceMain);
        setAttr("serviceDetailInfos", serviceDetailsList);
        setAttr("typeList", DictPcr.dao.getWsTypeList());
        render("notfilled.jsp");
        //render("order.jsp");
    }

    /**
     * 保存 危废服务——产废方——基本信息
     */
    @Before({ServiceDetailNumValidator.class, Tx.class})
    public void savePWBaseInfo() {
        AjaxBean ajaxBean = new AjaxBean();
        boolean isSuccess = false;
        // 保存产废方主表信息
        ServiceMain serviceMain = this.getModel(ServiceMain.class);
        serviceMain.setHbUser("628");//将订单发给系统管理员590/8128/628
        Long mainID = serviceMain.getLong("id");
        if (mainID == null || mainID == 0L) {
            mainID = serviceMainDao.newServiceMain(serviceMain);
        } else {
            serviceMainDao.updateServiceMain(serviceMain);
            // 删除所有主表对应的从表信息
            serviceDetailsDao.deleteByServiceID(mainID);
        }
        // 保存产废方从表信息
        List<ServiceDetails> serviceDetailList = this.getModels(ServiceDetails.class, "serviceDetails");
        serviceDetailsDao.newServiceDetails(serviceDetailList, mainID);
        isSuccess = true;
        ajaxBean.setIsSuccess(isSuccess);
        ajaxBean.setObj(mainID);
        renderJson(ajaxBean);
    }

    /**
     * 提交 危废服务——产废方——基本信息
     */
    @Before({ServiceDetailNumValidator.class, Tx.class})
    public void submitPWBaseInfo() {
        AjaxBean ajaxBean = new AjaxBean();
        boolean isSuccess = false;
        String msg = null;
        // 提交产废方主表信息
        ServiceMain serviceMain = this.getModel(ServiceMain.class);
        Long mainID = serviceMain.getId();
        serviceMain.setHbUser("628");//将订单发给系统管理员590/8128/628
        if (mainID == null || mainID == 0L) {
            msg = "请先保存信息后，再提交确认";
            isSuccess = false;
        } else {
            FillFieldsUtils.updateCommonInfo(serviceMain);
            serviceMain.set("node_sta", NodeStepStatusEnum.AUDITED_STATUS.getValue());
            serviceMain.setEpStep(EpStepStatusEnum.AUDITANDOFFER_STEP.getValue());
            serviceMain.update();
            // 保存产废方从表信息
            // 删除与主表相关的所有的明细
            serviceDetailsDao.deleteByServiceID(mainID);
            List<ServiceDetails> serviceDetailList = this.getModels(ServiceDetails.class, "serviceDetails");
            serviceDetailsDao.newServiceDetails(serviceDetailList, mainID);
            isSuccess = true;
            //发短信
            sendMsg(serviceMain.getCompName(), "order",serviceMain);
        }
        ajaxBean.setIsSuccess(isSuccess);
        ajaxBean.setMsg(msg);
        ajaxBean.setObj(mainID);
        renderJson(ajaxBean);
    }

    public void sendMsg(String compName, String type, ServiceMain main) {
        if (StrKit.isBlank(compName)) {
            compName = UserUtils.getUser().getLoginName();
        }
        String msg = null;
        if ("order".equals(type)) {
            msg = MessageFormat.format(Constants.ORDER_SMS_TEMP, compName);
        } else {
            msg = MessageFormat.format(Constants.OFFER_SMS_TEMP, compName);
        }
        WsUtils.sendMsg(msg,main);
        /*List<DictPcr> list = DictPcr.dao.findByType("ep_phone");
        for (DictPcr dictPcr : list) {
            if (StrKit.notBlank(dictPcr.getCode())) {
                ValiCode.sendCheckCode(dictPcr.getCode(), msg,null);
            }
        }*/
    }

    /**
     * 审核中页面
     */
    public void auditingPage() {
        render("auditing.jsp");
    }

    /**
     * 审核已通过，处置方正在上传报价页面
     *
     * @author rongchao
     */
    public void offeringPage() {
    	Long id = getParaToLong("id");
    	ServiceMain serviceMain = serviceMainDao.findServiceMainByID(id);
        List<ServiceDetails> serviceDetailsList = serviceDetailsDao.getServiceDetails(id);
        setAttr("serviceMainInfo", serviceMain);
        setAttr("serviceDetailsInfos", serviceDetailsList);
		render("offering.jsp");
    }

    /**
     * 初始化 危废服务——产废方——基本信息——已通过页面
     */
    public void initPassedPage() {
        Long id = getParaToLong("id");
        if (id == null || id == 0L) {
            return;
        }
        
        ServiceMain serviceMain = serviceMainDao.findServiceMainByID(id);
        List<ServiceDetails> serviceDetailsList = serviceDetailsDao.getServiceDetails(id);
        setAttr("serviceMainInfo", serviceMain);
        setAttr("serviceDetailsInfos", serviceDetailsList);
        
        //查询处置方上传的报价附件
		List<Record> wdList = Db.find("SELECT * FROM ws_document WHERE service_id=? AND document_type=1 AND del_flag=0",id);
		setAttr("wdList",wdList);
		
		PwOperation pwOperation= PwOperation.dao.findFirst("select offer_agree from ws_pw_operation where service_id=?",id);
		setAttr("offerAgree",pwOperation!=null?pwOperation.get("offer_agree"):-1);
		
		//查询总重总价
		List<Record> wscList = Db.find("SELECT * FROM ws_service_count WHERE service_id=? AND del_flag=0",id);
		if(wscList.size() > 0){
			setAttr("wscList",wscList.get(0));
		}
		
        render("passed.jsp");
    }

    /**
     * 查看报价方案
     *
     * @author rongchao
     */
    public void viewOffer() {
        Long id = getParaToLong("id");
        if (id == null || id == 0L) {
            LOGGER.error("参数<id>无效,请检查参数<id>是否正确!");
            return;
        }
        String sourceUrl = "/ws/productwaste/pwbaseinfo/initPassedPage?id=".concat(id.toString());
        LOGGER.debug("sourceUrl:".concat(sourceUrl));
        setSessionAttr("sourceUrl", sourceUrl);
        redirect("/memSerevice/message/mailbox?index=2");
    }

    // ------------------------------ end -------------------------------

    // ----------------------------- 产废方——同意报价 ------------------------

    /**
     * 用户对报价是否同意抽取出来的方法（用于下方的agreeOffer方法和disAgreeOffer方法）
     *
     * @param isAgree 是否同意
     */
    private void offerIsAgree(OfferAgreeEnum isAgree) {
        String msg = "操作失败！";
        boolean isSuccess = false;
        AjaxBean aj = new AjaxBean();
        try {
            Long id = getParaToLong("id");
            List<EpOperation> epOpList = EpOperation.dao.getEpOpByServiceID(id);
            if (epOpList == null || epOpList.size() == 0 || epOpList.get(0) == null
                    || epOpList.get(0).getOfferUpload() == null || epOpList.get(0).getOfferUpload() == 0) {
                isSuccess = false;
                msg = "对不起，处置单位还没有上传报价哦，请等待一下吧~ ^_^";
                aj.setIsSuccess(isSuccess);
                aj.setMsg(msg);
                renderJson(aj);
                return;
            }
            String compName = null;
            if (OfferAgreeEnum.AGREE.equals(isAgree)) {
                ServiceMain serviceMain = ServiceMain.dao.findServiceMainByID(id);
                serviceMain.setEpStep(EpStepStatusEnum.CONTRACT_STEP.getValue());
                // serviceMain.setPwStep(PwStepStatusEnum.CONTRACT_STEP.getValue());
                serviceMain.update();
                compName = serviceMain.getCompName();
                //同意报价,向环保方发送短信 邮件通知
                if (OfferAgreeEnum.AGREE.equals(isAgree)) {
                    sendMsg(compName, "offer",serviceMain);
                }
            } else {
                //EpOperation.dao.uploadOffer(id, 0);
            }
            isSuccess = pwOperationDao.updateOfferAgree(id, isAgree);
            if (isSuccess) {
                OperationLogs.dao.updatePWServiceOfferAgree(id, NumberUtil.toInteger(isAgree.getValue()));
            }
            msg = "操作成功!";
        } catch (Exception e) {
            msg = "操作失败,服务器内部错误！";
            isSuccess = false;
            LOGGER.error("操作失败！原因:".concat(e.getMessage()), e);
        }
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        renderJson(aj);
    }

    /**
     * 同意报价
     */
    @Before(Tx.class)
    public void agreeOffer() {
        offerIsAgree(OfferAgreeEnum.AGREE);
    }

    /**
     * 预约办理
     */
    public void orderPage() {
    	this.forwardAction("/ws/productwaste/pwbaseinfo/notfilledPage");
    }

    /**
     * 不同意报价
     */
    @Before(Tx.class)
    public void disAgreeOffer() {
        offerIsAgree(OfferAgreeEnum.DISAGREE);
    }

    // =========================== end ===================================

    /**
     * 预约办理
     */
    @Before({ServiceDetailNumValidator.class, Tx.class})
    public void orderService() {
        ServiceMain serviceMain = this.getModel(ServiceMain.class);
        Long mainID = serviceMain.getId();
        if (mainID == null || mainID == 0L) {
            FillFieldsUtils.fillCommonInfo(serviceMain);
            serviceMain.setPwStep(PwStepStatusEnum.BASEINFO_STEP.getValue());
            serviceMain.setNodeSta(NodeStepStatusEnum.AUDITING_STATUS.getValue());
            serviceMain.setEpStep(EpStepStatusEnum.AUDITANDOFFER_STEP.getValue());
            serviceMain.setIsDate(1);
            serviceMain.save();
            mainID = serviceMain.getId();
        } else {
            FillFieldsUtils.updateCommonInfo(serviceMain);
            serviceMain.setPwStep(PwStepStatusEnum.BASEINFO_STEP.getValue());
            serviceMain.setNodeSta(NodeStepStatusEnum.AUDITING_STATUS.getValue());
            serviceMain.setEpStep(EpStepStatusEnum.AUDITANDOFFER_STEP.getValue());
            serviceMain.update();
        }
        // 删除与主表相关的所有的明细
        serviceDetailsDao.deleteByServiceID(mainID);
        List<ServiceDetails> serviceDetailList = this.getModels(ServiceDetails.class, "serviceDetails");
        ServiceDetails.dao.newServiceDetails(serviceDetailList, mainID);
        sendMsg(serviceMain.getCompName(), "order",serviceMain);
        boolean isSuccess = true;
        String msg = "操作成功！";
        AjaxBean aj = new AjaxBean();
        aj.setIsSuccess(isSuccess);
        aj.setMsg(msg);
        renderJson(aj);
    }
}
